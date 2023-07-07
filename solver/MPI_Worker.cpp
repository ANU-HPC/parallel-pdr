#include "MPI_Worker.h"
#include "MPI_Interface.h"

MPI_Worker::MPI_Worker() {
  const int steps = 1;//((Global::mpi_interface.world_rank()-1) % Global::problem.max_macro_steps) + 1;
  LOG << "worker using steps: " << steps << endl;
  _obligation_processor = new Obligation_Processor(steps);
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

  while (true) {
    auto [_, mpi_tag, data, size] = Global::mpi_interface.recieve_message();

    if (mpi_tag == MPI_Interface::MESSAGE_TAG_OBLIGATION) {
      Obligation obl = Obligation(data, 0, size);
      handle_obligation(obl);
    } else if (mpi_tag == MPI_Interface::MESSAGE_TAG_REASON) {
      Reason reason = Reason(data, 0, size);
      handle_reason(reason);
    } else if (mpi_tag == MPI_Interface::MESSAGE_TAG_FINALIZE) {
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
    const Reason& reason = _obligation_processor->last_interactions_reason();
    const int size = reason.MPI_message_size();
    int* data = reason.get_as_MPI_message();
    Global::mpi_interface.isend_then_delete_message(0, MPI_Interface::MESSAGE_TAG_REASON, data, size);
  }

  Global::mpi_interface.isend_tag(0, MPI_Interface::MESSAGE_TAG_IDLE);
}

void MPI_Worker::handle_reason(const Reason& reason) {
  _obligation_processor->add_reason(reason);
}
