#include "MPI_Worker.h"

MPI_Worker::MPI_Worker() {
  const int rank = Global::mpi_interface.world_rank();
  const int steps = Utils::worker_to_steps(rank);

  Global::stats.count("steps",steps);
  LOG << "worker using steps: " << steps << endl;
  _obligation_processor = new Obligation_Processor(steps);
}

void MPI_Worker::wait_for_then_finalize() {
  for (int i=0;; i++) {
    if (i<60) sleep(3);
    else      sleep(120); // when just starting, give a lower sleep to stop conveniently for short runs

    if (Global::mpi_interface.message_waiting()) {
      const int mpi_tag = get<1>(Global::mpi_interface.recieve_message());
      if (mpi_tag != MPI_Interface::MESSAGE_TAG_FINALIZE) LOG << "ERROR: gotten a non finalize message: " << mpi_tag << ", as a non real worker. Finalizing anyway" << endl;
      Global::mpi_interface.barriered_finalize();
      return;
    }
  }
}

void MPI_Worker::run() {
  // infinite loop handling messages
  int _; // don't care about where the message came from, should always be from the orchestrator
  int mpi_tag;
  int* data;
  int size;

  // mark as used - the compiler doesn't seem to recognise being used in an "if" and passed to a function as "used"
  (void)_;
  (void)mpi_tag;
  (void)data;
  (void)size;

  // Just for testing, less efficient, but seperates the setup time from the running time. Also in Distributed_Worker_Interface.cpp
  //Global::mpi_interface.barrier();

  // tell orchestrator we are ready
  Global::mpi_interface.isend_tag(0, MPI_Interface::MESSAGE_TAG_IDLE);

  LOG << "Worker ready to receive work" << endl;

  while (true) {
    auto [_, mpi_tag, data, size] = Global::mpi_interface.recieve_message();

    if (mpi_tag == MPI_Interface::MESSAGE_TAG_OBLIGATION) {
      Obligation obl = Obligation(data, 0, size);
      handle_obligation(obl);
    } else if (mpi_tag == MPI_Interface::MESSAGE_TAG_REASON_FROM_ORCHESTRATOR) {
      Reason_From_Orchestrator reason = Reason_From_Orchestrator(data, 0, size);
      handle_reason(reason);
    } else if (mpi_tag == MPI_Interface::MESSAGE_TAG_FINALIZE) {
      usleep(Global::mpi_interface.world_rank()*10000);
      Global::stats.print();
      Global::mpi_interface.barriered_finalize();
      return;
    } else {
      LOG << "ERROR: Unknown message tag: " << mpi_tag << endl;
      exit(1);
    }
  }
}

void MPI_Worker::handle_obligation(const Obligation& obl) {
  _obligation_processor->process_obligation(obl);

  // send back success or reason
  if (_obligation_processor->last_interaction_was_a_success()) {
    const Success& success = _obligation_processor->last_interactions_success();
    const int size = success.MPI_message_size();
    int* data = success.get_as_MPI_message();
    Global::mpi_interface.isend_then_delete_message(0, MPI_Interface::MESSAGE_TAG_SUCCESS, data, size);
  } else {
    const Reason_From_Worker& reason = _obligation_processor->last_interactions_reason();
    const int size = reason.MPI_message_size();
    int* data = reason.get_as_MPI_message();
    Global::mpi_interface.isend_then_delete_message(0, MPI_Interface::MESSAGE_TAG_REASON_FROM_WORKER, data, size);
  }

  Global::mpi_interface.isend_tag(0, MPI_Interface::MESSAGE_TAG_IDLE);
}

void MPI_Worker::handle_reason(const Reason_From_Orchestrator& reason) {
  if (Global::problem.nondeterministic) _obligation_processor->add_reason_nondeterministic(reason);
  else                                  _obligation_processor->add_reason_deterministic(reason);
}
