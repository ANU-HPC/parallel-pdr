(define (domain witas-dddl-compiled)
 (:requirements :strips :equality)
 (:predicates (pending_obs8) (observed_obs8) (pending_obs11) (observed_obs11) (fault-count-3_lost_heli0_fcl-event-finished_n0) (fault-count-3_lost_heli0_fcl-event-canceled_n0) (pending_obs2) (observed_obs2) (fault-count-3_lost_heli0_fcl-event-manual_n0) (fault-count-3_lost_heli0_fcl-event-not_accepted_n0) (autotakeoff-mode-is-running_ato-6-0-240) (autotakeoff-fsm_exec-is-start_ato-6-0-240) (autotakeoff-fsm_state-is-takeoff_ato-6-0-240) (autotakeoff-fsm_exec-is-action1_ato-6-0-240) (autotakeoff-mode-is-running_ato-5-0-240) (autotakeoff-fsm_exec-is-start_ato-5-0-240) (autotakeoff-fsm_state-is-takeoff_ato-5-0-240) (autotakeoff-fsm_exec-is-action1_ato-5-0-240) (autotakeoff-in_start_call-is-yes_ato-6-0-240) (pending_obs5) (autotakeoff-fsm_exec-is-action2_ato-6-0-240) (observed_obs5) (fault-count-3_lost_ato-6-0-240_checkpoint1_n0) (autotakeoff-in_start_call-is-yes_ato-5-0-240) (fault-count-3_lost_ato-5-0-240_checkpoint1_n0) (autotakeoff-fsm_exec-is-action2_ato-5-0-240) (dominates-3_hyp1_lost_ato-5-0-240_checkpoint1) (autotakeoff-fsm_exec-is-nothing_ato-6-0-240) (autotakeoff-fsm_exec-is-reaction_finished_1_ato-6-0-240) (autotakeoff-fsm_exec-is-nothing_ato-5-0-240) (autotakeoff-fsm_exec-is-reaction_finished_1_ato-5-0-240) (pending_obs9) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-6-0-240) (observed_obs9) (fault-count-3_lost_ato-6-0-240_checkpoint2_n0) (fault-count-3_lost_ato-5-0-240_checkpoint2_n0) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-5-0-240) (autotakeoff-fsm_exec-is-reaction_error_1_ato-6-0-240) (autotakeoff-fsm_exec-is-reaction_error_1_ato-5-0-240) (autotakeoff-fsm_exec-is-reaction_cancel_1_ato-6-0-240) (autotakeoff-fsm_exec-is-reaction_cancel_1_ato-5-0-240) (pending_obs6) (observed_obs6) (pending_obs7) (observed_obs7) (pending_obs1) (observed_obs1) (autotakeoff-in_start_call-is-no_ato-6-0-240) (fault-count-3_lost_ato-6-0-240_checkpoint7_n0) (autotakeoff-fsm_exec-is-action2-exit_ato-6-0-240) (autotakeoff-in_start_call-is-no_ato-5-0-240) (fault-count-3_lost_ato-5-0-240_checkpoint7_n0) (autotakeoff-fsm_exec-is-action2-exit_ato-5-0-240) (pending_obs10) (autotakeoff-fsm_exec-is-action2-climb_ato-6-0-240) (observed_obs10) (fault-count-3_lost_ato-6-0-240_checkpoint5_n0) (fault-count-3_lost_ato-5-0-240_checkpoint5_n0) (autotakeoff-fsm_exec-is-action2-climb_ato-5-0-240) (pending_obs12) (autotakeoff-fsm_exec-is-reaction_finished_2_ato-6-0-240) (observed_obs12) (fault-count-3_lost_ato-6-0-240_checkpoint6_n0) (navtopoint-mode-is-running_nav-4-0-240) (navtopoint-fsm_state-is-start_decouple_nav-4-0-240) (navtopoint-fsm_exec-is-nothing_nav-4-0-240) (navtopoint-fsm_exec-is-action1_nav-4-0-240) (navtopoint-fsm_state-is-plan_path_nav-4-0-240) (fault-count-3_lost_nav-4-0-240_checkpoint1_n0) (navtopoint-fsm_exec-is-action2_nav-4-0-240) (navtopoint-in_start_call-is-no_nav-4-0-240) (fault-count-3_lost_nav-4-0-240_checkpoint4_n0) (navtopoint-fsm_state-is-wait_for_go_nav-4-0-240) (navtopoint-fsm_state-is-fly_path_nav-4-0-240) (missionexec-mission-idle_heli0) (autotakeoff-mode-is-pre_init_ato-6-0-240) (missionexec-active-mission_heli0_ato-6-0-240) (missionexec-mission-init-call_heli0) (autotakeoff-mode-is-processing_ato-6-0-240) (called-by_ato-6-0-240_missionexecutor) (autotakeoff-mode-is-pre_init_ato-5-0-240) (missionexec-active-mission_heli0_ato-5-0-240) (autotakeoff-mode-is-processing_ato-5-0-240) (called-by_ato-5-0-240_missionexecutor) (navtopoint-mode-is-pre_init_nav-4-0-240) (missionexec-active-mission_heli0_nav-4-0-240) (navtopoint-mode-is-processing_nav-4-0-240) (called-by_nav-4-0-240_missionexecutor) (pending_obs4) (missionexec-mission-ready_heli0) (autotakeoff-mode-is-ready_ato-6-0-240) (observed_obs4) (pending_obs0) (autotakeoff-mode-is-ready_ato-5-0-240) (observed_obs0) (fault-count-4_lost_ato-6-0-240_created_missionexecutor_n0) (fault-count-4_lost_ato-5-0-240_created_missionexecutor_n0) (fault-count-4_lost_nav-4-0-240_created_missionexecutor_n0) (navtopoint-mode-is-ready_nav-4-0-240) (missionexec-mission-over_heli0) (autotakeoff-mode-is-failed_ato-6-0-240) (autotakeoff-mode-is-failed_ato-5-0-240) (navtopoint-mode-is-failed_nav-4-0-240) (navtopoint-in_start_call-is-yes_nav-4-0-240) (missionexec-mission-start-call_heli0) (navtopoint-fsm_exec-is-start_nav-4-0-240) (missionexec-mission-running_heli0) (pending_obs13) (autotakeoff-mode-is-done_ato-6-0-240) (observed_obs13) (pending_obs3) (autotakeoff-mode-is-done_ato-5-0-240) (observed_obs3) (fault-count-3_lost_ato-6-0-240_task-done_n0) (fault-count-3_lost_ato-5-0-240_task-done_n0) (fault-count-3_lost_nav-4-0-240_task-done_n0) (navtopoint-mode-is-done_nav-4-0-240) (fault-count-3_lost_ato-6-0-240_fail-specific-210_n0) (fault-count-3_lost_ato-5-0-240_fail-specific-210_n0) (fault-count-3_lost_ato-6-0-240_fail-service_n0) (fault-count-3_lost_ato-5-0-240_fail-service_n0) (fault-count-3_lost_ato-6-0-240_fail-specific-101_n0) (fault-count-3_lost_ato-5-0-240_fail-specific-101_n0) (fault-count-3_lost_ato-6-0-240_fail-specific-102_n0) (fault-count-3_lost_ato-5-0-240_fail-specific-102_n0) (fault-count-3_lost_nav-4-0-240_fail-service_n0) (fault-count-3_lost_nav-4-0-240_fail-specific-101_n0) (fault-count-3_lost_nav-4-0-240_fail-specific-102_n0) (fault-count-3_lost_nav-4-0-240_fail-specific-402_n0) (fault-count-3_lost_nav-4-0-240_fail-specific-403_n0) (fault-count-3_lost_nav-4-0-240_fail-specific-404_n0) (fault-count-3_lost_nav-4-0-240_fail-subtask_n0) (pending_obs14) (observed_obs14) (fault-count-3_lost_ato-6-0-240_destroyed_n0) (fault-count-3_lost_ato-5-0-240_destroyed_n0) (dominates-3_hyp1_lost_ato-5-0-240_destroyed) (fault-count-3_lost_nav-4-0-240_destroyed_n0) (future_obs1) (future_obs2) (future_obs3) (future_obs4) (future_obs5) (future_obs6) (future_obs7) (future_obs8) (future_obs9) (future_obs10) (future_obs11) (future_obs12) (future_obs13) (future_obs14) (not_at_end_constraint0) (achieved_constraint0) (static-true))
 (:action flightcontrol-fcl-event-finished-0_heli0_obs8
  :parameters ()
  :precondition (and (pending_obs8) (not_at_end_constraint0))
  :effect (and (observed_obs8) (not (pending_obs8))))
 (:action flightcontrol-fcl-event-finished-0_heli0_obs11
  :parameters ()
  :precondition (and (pending_obs11) (not_at_end_constraint0))
  :effect (and (observed_obs11) (not (pending_obs11))))
 (:action flightcontrol-fcl-event-manual-0_heli0_obs2
  :parameters ()
  :precondition (and (pending_obs2) (not_at_end_constraint0))
  :effect (and (observed_obs2) (not (pending_obs2))))
 (:action autotakeoff-start_ok_ato-6-0-240
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-6-0-240) (autotakeoff-fsm_exec-is-start_ato-6-0-240) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_state-is-takeoff_ato-6-0-240) (autotakeoff-fsm_exec-is-action1_ato-6-0-240) (not (autotakeoff-fsm_exec-is-start_ato-6-0-240))))
 (:action autotakeoff-start_ok_ato-5-0-240
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-5-0-240) (autotakeoff-fsm_exec-is-start_ato-5-0-240) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_state-is-takeoff_ato-5-0-240) (autotakeoff-fsm_exec-is-action1_ato-5-0-240) (not (autotakeoff-fsm_exec-is-start_ato-5-0-240))))
 (:action autotakeoff-takeoff_action1-0_ato-6-0-240_obs5
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-6-0-240) (autotakeoff-fsm_state-is-takeoff_ato-6-0-240) (autotakeoff-fsm_exec-is-action1_ato-6-0-240) (autotakeoff-in_start_call-is-yes_ato-6-0-240) (pending_obs5) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_exec-is-action2_ato-6-0-240) (observed_obs5) (not (autotakeoff-fsm_exec-is-action1_ato-6-0-240)) (not (pending_obs5))))
 (:action autotakeoff-takeoff_action1-1_ato-6-0-240_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-6-0-240) (autotakeoff-fsm_state-is-takeoff_ato-6-0-240) (autotakeoff-fsm_exec-is-action1_ato-6-0-240) (autotakeoff-in_start_call-is-yes_ato-6-0-240) (fault-count-3_lost_ato-6-0-240_checkpoint1_n0) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_exec-is-action2_ato-6-0-240) (not (autotakeoff-fsm_exec-is-action1_ato-6-0-240)) (not (fault-count-3_lost_ato-6-0-240_checkpoint1_n0))))
 (:action autotakeoff-takeoff_action1-1_ato-5-0-240_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-5-0-240) (autotakeoff-fsm_state-is-takeoff_ato-5-0-240) (autotakeoff-fsm_exec-is-action1_ato-5-0-240) (autotakeoff-in_start_call-is-yes_ato-5-0-240) (fault-count-3_lost_ato-5-0-240_checkpoint1_n0) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_exec-is-action2_ato-5-0-240) (not (autotakeoff-fsm_exec-is-action1_ato-5-0-240)) (not (fault-count-3_lost_ato-5-0-240_checkpoint1_n0)) (not (dominates-3_hyp1_lost_ato-5-0-240_checkpoint1))))
 (:action autotakeoff-takeoff_fcl_finished-flightcontrol-fcl-event-finished-0_ato-6-0-240_heli0_heli0_obs8
  :parameters ()
  :precondition (and (pending_obs8) (autotakeoff-mode-is-running_ato-6-0-240) (autotakeoff-fsm_state-is-takeoff_ato-6-0-240) (autotakeoff-fsm_exec-is-nothing_ato-6-0-240) (not_at_end_constraint0))
  :effect (and (observed_obs8) (autotakeoff-fsm_exec-is-reaction_finished_1_ato-6-0-240) (not (pending_obs8)) (not (autotakeoff-fsm_exec-is-nothing_ato-6-0-240))))
 (:action autotakeoff-takeoff_fcl_finished-flightcontrol-fcl-event-finished-1_ato-6-0-240_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-finished_n0) (autotakeoff-mode-is-running_ato-6-0-240) (autotakeoff-fsm_state-is-takeoff_ato-6-0-240) (autotakeoff-fsm_exec-is-nothing_ato-6-0-240) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_exec-is-reaction_finished_1_ato-6-0-240) (not (fault-count-3_lost_heli0_fcl-event-finished_n0)) (not (autotakeoff-fsm_exec-is-nothing_ato-6-0-240))))
 (:action autotakeoff-takeoff_fcl_finished-flightcontrol-fcl-event-finished-1_ato-5-0-240_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-finished_n0) (autotakeoff-mode-is-running_ato-5-0-240) (autotakeoff-fsm_state-is-takeoff_ato-5-0-240) (autotakeoff-fsm_exec-is-nothing_ato-5-0-240) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_exec-is-reaction_finished_1_ato-5-0-240) (not (fault-count-3_lost_heli0_fcl-event-finished_n0)) (not (autotakeoff-fsm_exec-is-nothing_ato-5-0-240))))
 (:action autotakeoff-takeoff_fcl_finished_reaction1-0_ato-6-0-240_obs9
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-6-0-240) (autotakeoff-fsm_state-is-takeoff_ato-6-0-240) (autotakeoff-fsm_exec-is-reaction_finished_1_ato-6-0-240) (pending_obs9) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_exec-is-action1_ato-6-0-240) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-6-0-240) (observed_obs9) (not (autotakeoff-fsm_state-is-takeoff_ato-6-0-240)) (not (autotakeoff-fsm_exec-is-reaction_finished_1_ato-6-0-240)) (not (pending_obs9))))
 (:action autotakeoff-takeoff_fcl_finished_reaction1-1_ato-6-0-240_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-6-0-240) (autotakeoff-fsm_state-is-takeoff_ato-6-0-240) (autotakeoff-fsm_exec-is-reaction_finished_1_ato-6-0-240) (fault-count-3_lost_ato-6-0-240_checkpoint2_n0) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_exec-is-action1_ato-6-0-240) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-6-0-240) (not (autotakeoff-fsm_state-is-takeoff_ato-6-0-240)) (not (autotakeoff-fsm_exec-is-reaction_finished_1_ato-6-0-240)) (not (fault-count-3_lost_ato-6-0-240_checkpoint2_n0))))
 (:action autotakeoff-takeoff_fcl_finished_reaction1-1_ato-5-0-240_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-5-0-240) (autotakeoff-fsm_state-is-takeoff_ato-5-0-240) (autotakeoff-fsm_exec-is-reaction_finished_1_ato-5-0-240) (fault-count-3_lost_ato-5-0-240_checkpoint2_n0) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_exec-is-action1_ato-5-0-240) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-5-0-240) (not (autotakeoff-fsm_state-is-takeoff_ato-5-0-240)) (not (autotakeoff-fsm_exec-is-reaction_finished_1_ato-5-0-240)) (not (fault-count-3_lost_ato-5-0-240_checkpoint2_n0))))
 (:action autotakeoff-takeoff_fcl_error_1-flightcontrol-fcl-event-not_accepted-1_ato-6-0-240_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-not_accepted_n0) (autotakeoff-mode-is-running_ato-6-0-240) (autotakeoff-fsm_state-is-takeoff_ato-6-0-240) (autotakeoff-fsm_exec-is-nothing_ato-6-0-240) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_exec-is-reaction_error_1_ato-6-0-240) (not (fault-count-3_lost_heli0_fcl-event-not_accepted_n0)) (not (autotakeoff-fsm_exec-is-nothing_ato-6-0-240))))
 (:action autotakeoff-takeoff_fcl_error_1-flightcontrol-fcl-event-not_accepted-1_ato-5-0-240_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-not_accepted_n0) (autotakeoff-mode-is-running_ato-5-0-240) (autotakeoff-fsm_state-is-takeoff_ato-5-0-240) (autotakeoff-fsm_exec-is-nothing_ato-5-0-240) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_exec-is-reaction_error_1_ato-5-0-240) (not (fault-count-3_lost_heli0_fcl-event-not_accepted_n0)) (not (autotakeoff-fsm_exec-is-nothing_ato-5-0-240))))
 (:action autotakeoff-takeoff_fcl_cancel_1-flightcontrol-fcl-event-canceled-1_ato-6-0-240_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-canceled_n0) (autotakeoff-mode-is-running_ato-6-0-240) (autotakeoff-fsm_state-is-takeoff_ato-6-0-240) (autotakeoff-fsm_exec-is-nothing_ato-6-0-240) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_exec-is-reaction_cancel_1_ato-6-0-240) (not (fault-count-3_lost_heli0_fcl-event-canceled_n0)) (not (autotakeoff-fsm_exec-is-nothing_ato-6-0-240))))
 (:action autotakeoff-takeoff_fcl_cancel_1-flightcontrol-fcl-event-canceled-1_ato-5-0-240_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-canceled_n0) (autotakeoff-mode-is-running_ato-5-0-240) (autotakeoff-fsm_state-is-takeoff_ato-5-0-240) (autotakeoff-fsm_exec-is-nothing_ato-5-0-240) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_exec-is-reaction_cancel_1_ato-5-0-240) (not (fault-count-3_lost_heli0_fcl-event-canceled_n0)) (not (autotakeoff-fsm_exec-is-nothing_ato-5-0-240))))
 (:action autotakeoff-takeoff_fcl_cancel_2-flightcontrol-fcl-event-manual-0_ato-6-0-240_heli0_heli0_obs2
  :parameters ()
  :precondition (and (pending_obs2) (autotakeoff-mode-is-running_ato-6-0-240) (autotakeoff-fsm_state-is-takeoff_ato-6-0-240) (autotakeoff-fsm_exec-is-nothing_ato-6-0-240) (not_at_end_constraint0))
  :effect (and (observed_obs2) (autotakeoff-fsm_exec-is-reaction_cancel_1_ato-6-0-240) (not (pending_obs2)) (not (autotakeoff-fsm_exec-is-nothing_ato-6-0-240))))
 (:action autotakeoff-takeoff_fcl_cancel_2-flightcontrol-fcl-event-manual-0_ato-5-0-240_heli0_heli0_obs2
  :parameters ()
  :precondition (and (pending_obs2) (autotakeoff-mode-is-running_ato-5-0-240) (autotakeoff-fsm_state-is-takeoff_ato-5-0-240) (autotakeoff-fsm_exec-is-nothing_ato-5-0-240) (not_at_end_constraint0))
  :effect (and (observed_obs2) (autotakeoff-fsm_exec-is-reaction_cancel_1_ato-5-0-240) (not (pending_obs2)) (not (autotakeoff-fsm_exec-is-nothing_ato-5-0-240))))
 (:action autotakeoff-takeoff_fcl_cancel_2-flightcontrol-fcl-event-manual-1_ato-6-0-240_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-manual_n0) (autotakeoff-mode-is-running_ato-6-0-240) (autotakeoff-fsm_state-is-takeoff_ato-6-0-240) (autotakeoff-fsm_exec-is-nothing_ato-6-0-240) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_exec-is-reaction_cancel_1_ato-6-0-240) (not (fault-count-3_lost_heli0_fcl-event-manual_n0)) (not (autotakeoff-fsm_exec-is-nothing_ato-6-0-240))))
 (:action autotakeoff-takeoff_fcl_cancel_2-flightcontrol-fcl-event-manual-1_ato-5-0-240_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-manual_n0) (autotakeoff-mode-is-running_ato-5-0-240) (autotakeoff-fsm_state-is-takeoff_ato-5-0-240) (autotakeoff-fsm_exec-is-nothing_ato-5-0-240) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_exec-is-reaction_cancel_1_ato-5-0-240) (not (fault-count-3_lost_heli0_fcl-event-manual_n0)) (not (autotakeoff-fsm_exec-is-nothing_ato-5-0-240))))
 (:action autotakeoff-takeoff_idle-0_ato-6-0-240_obs6
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-6-0-240) (autotakeoff-fsm_state-is-takeoff_ato-6-0-240) (autotakeoff-fsm_exec-is-nothing_ato-6-0-240) (pending_obs6) (not_at_end_constraint0))
  :effect (and (observed_obs6) (not (pending_obs6))))
 (:action autotakeoff-takeoff_idle-0_ato-6-0-240_obs7
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-6-0-240) (autotakeoff-fsm_state-is-takeoff_ato-6-0-240) (autotakeoff-fsm_exec-is-nothing_ato-6-0-240) (pending_obs7) (not_at_end_constraint0))
  :effect (and (observed_obs7) (not (pending_obs7))))
 (:action autotakeoff-takeoff_idle-0_ato-5-0-240_obs1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-5-0-240) (autotakeoff-fsm_state-is-takeoff_ato-5-0-240) (autotakeoff-fsm_exec-is-nothing_ato-5-0-240) (pending_obs1) (not_at_end_constraint0))
  :effect (and (observed_obs1) (not (pending_obs1))))
 (:action autotakeoff-go_to_final_altitude_action1_no_climb-1_ato-6-0-240_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-6-0-240) (autotakeoff-fsm_exec-is-action1_ato-6-0-240) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-6-0-240) (autotakeoff-in_start_call-is-no_ato-6-0-240) (fault-count-3_lost_ato-6-0-240_checkpoint7_n0) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_exec-is-action2-exit_ato-6-0-240) (not (autotakeoff-fsm_exec-is-action1_ato-6-0-240)) (not (fault-count-3_lost_ato-6-0-240_checkpoint7_n0))))
 (:action autotakeoff-go_to_final_altitude_action1_no_climb-1_ato-5-0-240_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-5-0-240) (autotakeoff-fsm_exec-is-action1_ato-5-0-240) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-5-0-240) (autotakeoff-in_start_call-is-no_ato-5-0-240) (fault-count-3_lost_ato-5-0-240_checkpoint7_n0) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_exec-is-action2-exit_ato-5-0-240) (not (autotakeoff-fsm_exec-is-action1_ato-5-0-240)) (not (fault-count-3_lost_ato-5-0-240_checkpoint7_n0))))
 (:action autotakeoff-go_to_final_altitude_action1_climb-0_ato-6-0-240_obs10
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-6-0-240) (autotakeoff-fsm_exec-is-action1_ato-6-0-240) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-6-0-240) (autotakeoff-in_start_call-is-no_ato-6-0-240) (pending_obs10) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_exec-is-action2-climb_ato-6-0-240) (observed_obs10) (not (autotakeoff-fsm_exec-is-action1_ato-6-0-240)) (not (pending_obs10))))
 (:action autotakeoff-go_to_final_altitude_action1_climb-1_ato-6-0-240_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-6-0-240) (autotakeoff-fsm_exec-is-action1_ato-6-0-240) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-6-0-240) (autotakeoff-in_start_call-is-no_ato-6-0-240) (fault-count-3_lost_ato-6-0-240_checkpoint5_n0) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_exec-is-action2-climb_ato-6-0-240) (not (autotakeoff-fsm_exec-is-action1_ato-6-0-240)) (not (fault-count-3_lost_ato-6-0-240_checkpoint5_n0))))
 (:action autotakeoff-go_to_final_altitude_action1_climb-1_ato-5-0-240_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-5-0-240) (autotakeoff-fsm_exec-is-action1_ato-5-0-240) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-5-0-240) (autotakeoff-in_start_call-is-no_ato-5-0-240) (fault-count-3_lost_ato-5-0-240_checkpoint5_n0) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_exec-is-action2-climb_ato-5-0-240) (not (autotakeoff-fsm_exec-is-action1_ato-5-0-240)) (not (fault-count-3_lost_ato-5-0-240_checkpoint5_n0))))
 (:action autotakeoff-go_to_final_altitude_climb_ok_ato-6-0-240
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-6-0-240) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-6-0-240) (autotakeoff-in_start_call-is-no_ato-6-0-240) (autotakeoff-fsm_exec-is-action2-climb_ato-6-0-240) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_exec-is-nothing_ato-6-0-240) (not (autotakeoff-fsm_exec-is-action2-climb_ato-6-0-240))))
 (:action autotakeoff-go_to_final_altitude_climb_ok_ato-5-0-240
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-5-0-240) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-5-0-240) (autotakeoff-in_start_call-is-no_ato-5-0-240) (autotakeoff-fsm_exec-is-action2-climb_ato-5-0-240) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_exec-is-nothing_ato-5-0-240) (not (autotakeoff-fsm_exec-is-action2-climb_ato-5-0-240))))
 (:action autotakeoff-go_to_final_altitude_fcl_finished-flightcontrol-fcl-event-finished-0_ato-6-0-240_heli0_heli0_obs8
  :parameters ()
  :precondition (and (pending_obs8) (autotakeoff-mode-is-running_ato-6-0-240) (autotakeoff-fsm_exec-is-nothing_ato-6-0-240) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-6-0-240) (not_at_end_constraint0))
  :effect (and (observed_obs8) (autotakeoff-fsm_exec-is-reaction_finished_1_ato-6-0-240) (not (pending_obs8)) (not (autotakeoff-fsm_exec-is-nothing_ato-6-0-240))))
 (:action autotakeoff-go_to_final_altitude_fcl_finished-flightcontrol-fcl-event-finished-0_ato-6-0-240_heli0_heli0_obs11
  :parameters ()
  :precondition (and (pending_obs11) (autotakeoff-mode-is-running_ato-6-0-240) (autotakeoff-fsm_exec-is-nothing_ato-6-0-240) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-6-0-240) (not_at_end_constraint0))
  :effect (and (observed_obs11) (autotakeoff-fsm_exec-is-reaction_finished_1_ato-6-0-240) (not (pending_obs11)) (not (autotakeoff-fsm_exec-is-nothing_ato-6-0-240))))
 (:action autotakeoff-go_to_final_altitude_fcl_finished-flightcontrol-fcl-event-finished-1_ato-6-0-240_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-finished_n0) (autotakeoff-mode-is-running_ato-6-0-240) (autotakeoff-fsm_exec-is-nothing_ato-6-0-240) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-6-0-240) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_exec-is-reaction_finished_1_ato-6-0-240) (not (fault-count-3_lost_heli0_fcl-event-finished_n0)) (not (autotakeoff-fsm_exec-is-nothing_ato-6-0-240))))
 (:action autotakeoff-go_to_final_altitude_fcl_finished_reaction1-0_ato-6-0-240_obs12
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-6-0-240) (autotakeoff-fsm_exec-is-reaction_finished_1_ato-6-0-240) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-6-0-240) (pending_obs12) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_exec-is-reaction_finished_2_ato-6-0-240) (observed_obs12) (not (autotakeoff-fsm_exec-is-reaction_finished_1_ato-6-0-240)) (not (pending_obs12))))
 (:action autotakeoff-go_to_final_altitude_fcl_finished_reaction1-1_ato-6-0-240_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-6-0-240) (autotakeoff-fsm_exec-is-reaction_finished_1_ato-6-0-240) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-6-0-240) (fault-count-3_lost_ato-6-0-240_checkpoint6_n0) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_exec-is-reaction_finished_2_ato-6-0-240) (not (autotakeoff-fsm_exec-is-reaction_finished_1_ato-6-0-240)) (not (fault-count-3_lost_ato-6-0-240_checkpoint6_n0))))
 (:action autotakeoff-go_to_final_altitude_fcl_error_1-flightcontrol-fcl-event-not_accepted-1_ato-6-0-240_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-not_accepted_n0) (autotakeoff-mode-is-running_ato-6-0-240) (autotakeoff-fsm_exec-is-nothing_ato-6-0-240) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-6-0-240) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_exec-is-reaction_error_1_ato-6-0-240) (not (fault-count-3_lost_heli0_fcl-event-not_accepted_n0)) (not (autotakeoff-fsm_exec-is-nothing_ato-6-0-240))))
 (:action autotakeoff-go_to_final_altitude_fcl_error_1-flightcontrol-fcl-event-not_accepted-1_ato-5-0-240_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-not_accepted_n0) (autotakeoff-mode-is-running_ato-5-0-240) (autotakeoff-fsm_exec-is-nothing_ato-5-0-240) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-5-0-240) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_exec-is-reaction_error_1_ato-5-0-240) (not (fault-count-3_lost_heli0_fcl-event-not_accepted_n0)) (not (autotakeoff-fsm_exec-is-nothing_ato-5-0-240))))
 (:action autotakeoff-go_to_final_altitude_fcl_cancel_1-flightcontrol-fcl-event-canceled-1_ato-6-0-240_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-canceled_n0) (autotakeoff-mode-is-running_ato-6-0-240) (autotakeoff-fsm_exec-is-nothing_ato-6-0-240) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-6-0-240) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_exec-is-reaction_cancel_1_ato-6-0-240) (not (fault-count-3_lost_heli0_fcl-event-canceled_n0)) (not (autotakeoff-fsm_exec-is-nothing_ato-6-0-240))))
 (:action autotakeoff-go_to_final_altitude_fcl_cancel_1-flightcontrol-fcl-event-canceled-1_ato-5-0-240_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-canceled_n0) (autotakeoff-mode-is-running_ato-5-0-240) (autotakeoff-fsm_exec-is-nothing_ato-5-0-240) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-5-0-240) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_exec-is-reaction_cancel_1_ato-5-0-240) (not (fault-count-3_lost_heli0_fcl-event-canceled_n0)) (not (autotakeoff-fsm_exec-is-nothing_ato-5-0-240))))
 (:action autotakeoff-go_to_final_altitude_fcl_cancel_2-flightcontrol-fcl-event-manual-0_ato-6-0-240_heli0_heli0_obs2
  :parameters ()
  :precondition (and (pending_obs2) (autotakeoff-mode-is-running_ato-6-0-240) (autotakeoff-fsm_exec-is-nothing_ato-6-0-240) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-6-0-240) (not_at_end_constraint0))
  :effect (and (observed_obs2) (autotakeoff-fsm_exec-is-reaction_cancel_1_ato-6-0-240) (not (pending_obs2)) (not (autotakeoff-fsm_exec-is-nothing_ato-6-0-240))))
 (:action autotakeoff-go_to_final_altitude_fcl_cancel_2-flightcontrol-fcl-event-manual-0_ato-5-0-240_heli0_heli0_obs2
  :parameters ()
  :precondition (and (pending_obs2) (autotakeoff-mode-is-running_ato-5-0-240) (autotakeoff-fsm_exec-is-nothing_ato-5-0-240) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-5-0-240) (not_at_end_constraint0))
  :effect (and (observed_obs2) (autotakeoff-fsm_exec-is-reaction_cancel_1_ato-5-0-240) (not (pending_obs2)) (not (autotakeoff-fsm_exec-is-nothing_ato-5-0-240))))
 (:action autotakeoff-go_to_final_altitude_fcl_cancel_2-flightcontrol-fcl-event-manual-1_ato-6-0-240_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-manual_n0) (autotakeoff-mode-is-running_ato-6-0-240) (autotakeoff-fsm_exec-is-nothing_ato-6-0-240) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-6-0-240) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_exec-is-reaction_cancel_1_ato-6-0-240) (not (fault-count-3_lost_heli0_fcl-event-manual_n0)) (not (autotakeoff-fsm_exec-is-nothing_ato-6-0-240))))
 (:action autotakeoff-go_to_final_altitude_fcl_cancel_2-flightcontrol-fcl-event-manual-1_ato-5-0-240_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-manual_n0) (autotakeoff-mode-is-running_ato-5-0-240) (autotakeoff-fsm_exec-is-nothing_ato-5-0-240) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-5-0-240) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_exec-is-reaction_cancel_1_ato-5-0-240) (not (fault-count-3_lost_heli0_fcl-event-manual_n0)) (not (autotakeoff-fsm_exec-is-nothing_ato-5-0-240))))
 (:action navtopoint-start_decouple_idle_time_out_nav-4-0-240
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-4-0-240) (navtopoint-fsm_state-is-start_decouple_nav-4-0-240) (navtopoint-fsm_exec-is-nothing_nav-4-0-240) (not_at_end_constraint0))
  :effect (and (navtopoint-fsm_exec-is-action1_nav-4-0-240) (navtopoint-fsm_state-is-plan_path_nav-4-0-240) (not (navtopoint-fsm_state-is-start_decouple_nav-4-0-240)) (not (navtopoint-fsm_exec-is-nothing_nav-4-0-240))))
 (:action navtopoint-plan_path_action1_checkpoint1-1_nav-4-0-240_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-4-0-240) (navtopoint-fsm_exec-is-action1_nav-4-0-240) (navtopoint-fsm_state-is-plan_path_nav-4-0-240) (fault-count-3_lost_nav-4-0-240_checkpoint1_n0) (not_at_end_constraint0))
  :effect (and (navtopoint-fsm_exec-is-action2_nav-4-0-240) (not (navtopoint-fsm_exec-is-action1_nav-4-0-240)) (not (fault-count-3_lost_nav-4-0-240_checkpoint1_n0))))
 (:action navtopoint-plan_path_action2_checkpoint4a-1_nav-4-0-240_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-4-0-240) (navtopoint-fsm_state-is-plan_path_nav-4-0-240) (navtopoint-fsm_exec-is-action2_nav-4-0-240) (navtopoint-in_start_call-is-no_nav-4-0-240) (fault-count-3_lost_nav-4-0-240_checkpoint4_n0) (not_at_end_constraint0))
  :effect (and (navtopoint-fsm_exec-is-nothing_nav-4-0-240) (navtopoint-fsm_state-is-wait_for_go_nav-4-0-240) (not (navtopoint-fsm_state-is-plan_path_nav-4-0-240)) (not (navtopoint-fsm_exec-is-action2_nav-4-0-240)) (not (fault-count-3_lost_nav-4-0-240_checkpoint4_n0))))
 (:action navtopoint-plan_path_action2_checkpoint4b-1_nav-4-0-240_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-4-0-240) (navtopoint-fsm_state-is-plan_path_nav-4-0-240) (navtopoint-fsm_exec-is-action2_nav-4-0-240) (fault-count-3_lost_nav-4-0-240_checkpoint4_n0) (not_at_end_constraint0))
  :effect (and (navtopoint-fsm_exec-is-action1_nav-4-0-240) (navtopoint-fsm_state-is-fly_path_nav-4-0-240) (not (navtopoint-fsm_state-is-plan_path_nav-4-0-240)) (not (navtopoint-fsm_exec-is-action2_nav-4-0-240)) (not (fault-count-3_lost_nav-4-0-240_checkpoint4_n0))))
 (:action navtopoint-wait_for_go_ok_nav-4-0-240
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-4-0-240) (navtopoint-fsm_exec-is-nothing_nav-4-0-240) (navtopoint-fsm_state-is-wait_for_go_nav-4-0-240) (not_at_end_constraint0))
  :effect (and (navtopoint-fsm_exec-is-action1_nav-4-0-240) (navtopoint-fsm_state-is-fly_path_nav-4-0-240) (not (navtopoint-fsm_exec-is-nothing_nav-4-0-240)) (not (navtopoint-fsm_state-is-wait_for_go_nav-4-0-240))))
 (:action missionexec-init-mission-autotakeoff-call_set_args_heli0_ato-6-0-240_ato-6-0-240_missionexecutor
  :parameters ()
  :precondition (and (missionexec-mission-idle_heli0) (autotakeoff-mode-is-pre_init_ato-6-0-240) (not_at_end_constraint0))
  :effect (and (missionexec-active-mission_heli0_ato-6-0-240) (missionexec-mission-init-call_heli0) (autotakeoff-mode-is-processing_ato-6-0-240) (called-by_ato-6-0-240_missionexecutor) (not (missionexec-mission-idle_heli0)) (not (autotakeoff-mode-is-pre_init_ato-6-0-240))))
 (:action missionexec-init-mission-autotakeoff-call_set_args_heli0_ato-5-0-240_ato-5-0-240_missionexecutor
  :parameters ()
  :precondition (and (missionexec-mission-idle_heli0) (autotakeoff-mode-is-pre_init_ato-5-0-240) (not_at_end_constraint0))
  :effect (and (missionexec-mission-init-call_heli0) (missionexec-active-mission_heli0_ato-5-0-240) (autotakeoff-mode-is-processing_ato-5-0-240) (called-by_ato-5-0-240_missionexecutor) (not (missionexec-mission-idle_heli0)) (not (autotakeoff-mode-is-pre_init_ato-5-0-240))))
 (:action missionexec-init-mission-navtopoint-call_set_args_heli0_nav-4-0-240_nav-4-0-240_missionexecutor
  :parameters ()
  :precondition (and (missionexec-mission-idle_heli0) (navtopoint-mode-is-pre_init_nav-4-0-240) (not_at_end_constraint0))
  :effect (and (missionexec-mission-init-call_heli0) (missionexec-active-mission_heli0_nav-4-0-240) (navtopoint-mode-is-processing_nav-4-0-240) (called-by_nav-4-0-240_missionexecutor) (not (missionexec-mission-idle_heli0)) (not (navtopoint-mode-is-pre_init_nav-4-0-240))))
 (:action missionexec-init-mission-ok-autotakeoff-init_ok-0_heli0_ato-6-0-240_ato-6-0-240_missionexecutor_obs4
  :parameters ()
  :precondition (and (missionexec-active-mission_heli0_ato-6-0-240) (missionexec-mission-init-call_heli0) (autotakeoff-mode-is-processing_ato-6-0-240) (called-by_ato-6-0-240_missionexecutor) (pending_obs4) (not_at_end_constraint0))
  :effect (and (missionexec-mission-ready_heli0) (autotakeoff-mode-is-ready_ato-6-0-240) (observed_obs4) (not (missionexec-mission-init-call_heli0)) (not (autotakeoff-mode-is-processing_ato-6-0-240)) (not (pending_obs4))))
 (:action missionexec-init-mission-ok-autotakeoff-init_ok-0_heli0_ato-5-0-240_ato-5-0-240_missionexecutor_obs0
  :parameters ()
  :precondition (and (missionexec-mission-init-call_heli0) (missionexec-active-mission_heli0_ato-5-0-240) (autotakeoff-mode-is-processing_ato-5-0-240) (called-by_ato-5-0-240_missionexecutor) (pending_obs0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-ready_heli0) (autotakeoff-mode-is-ready_ato-5-0-240) (observed_obs0) (not (missionexec-mission-init-call_heli0)) (not (autotakeoff-mode-is-processing_ato-5-0-240)) (not (pending_obs0))))
 (:action missionexec-init-mission-ok-autotakeoff-init_ok-1_heli0_ato-6-0-240_ato-6-0-240_missionexecutor_n0_n1
  :parameters ()
  :precondition (and (missionexec-active-mission_heli0_ato-6-0-240) (missionexec-mission-init-call_heli0) (autotakeoff-mode-is-processing_ato-6-0-240) (called-by_ato-6-0-240_missionexecutor) (fault-count-4_lost_ato-6-0-240_created_missionexecutor_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-ready_heli0) (autotakeoff-mode-is-ready_ato-6-0-240) (not (missionexec-mission-init-call_heli0)) (not (autotakeoff-mode-is-processing_ato-6-0-240)) (not (fault-count-4_lost_ato-6-0-240_created_missionexecutor_n0))))
 (:action missionexec-init-mission-ok-autotakeoff-init_ok-1_heli0_ato-5-0-240_ato-5-0-240_missionexecutor_n0_n1
  :parameters ()
  :precondition (and (missionexec-mission-init-call_heli0) (missionexec-active-mission_heli0_ato-5-0-240) (autotakeoff-mode-is-processing_ato-5-0-240) (called-by_ato-5-0-240_missionexecutor) (fault-count-4_lost_ato-5-0-240_created_missionexecutor_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-ready_heli0) (autotakeoff-mode-is-ready_ato-5-0-240) (not (missionexec-mission-init-call_heli0)) (not (autotakeoff-mode-is-processing_ato-5-0-240)) (not (fault-count-4_lost_ato-5-0-240_created_missionexecutor_n0))))
 (:action missionexec-init-mission-ok-navtopoint-init_ok-1_heli0_nav-4-0-240_nav-4-0-240_missionexecutor_n0_n1
  :parameters ()
  :precondition (and (missionexec-mission-init-call_heli0) (missionexec-active-mission_heli0_nav-4-0-240) (navtopoint-mode-is-processing_nav-4-0-240) (called-by_nav-4-0-240_missionexecutor) (fault-count-4_lost_nav-4-0-240_created_missionexecutor_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-ready_heli0) (navtopoint-mode-is-ready_nav-4-0-240) (not (missionexec-mission-init-call_heli0)) (not (navtopoint-mode-is-processing_nav-4-0-240)) (not (fault-count-4_lost_nav-4-0-240_created_missionexecutor_n0))))
 (:action missionexec-init-mission-fail-autotakeoff-init_fail_heli0_ato-6-0-240_ato-6-0-240
  :parameters ()
  :precondition (and (missionexec-active-mission_heli0_ato-6-0-240) (missionexec-mission-init-call_heli0) (autotakeoff-mode-is-processing_ato-6-0-240) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-failed_ato-6-0-240) (not (missionexec-mission-init-call_heli0)) (not (autotakeoff-mode-is-processing_ato-6-0-240))))
 (:action missionexec-init-mission-fail-autotakeoff-init_fail_heli0_ato-5-0-240_ato-5-0-240
  :parameters ()
  :precondition (and (missionexec-mission-init-call_heli0) (missionexec-active-mission_heli0_ato-5-0-240) (autotakeoff-mode-is-processing_ato-5-0-240) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-failed_ato-5-0-240) (not (missionexec-mission-init-call_heli0)) (not (autotakeoff-mode-is-processing_ato-5-0-240))))
 (:action missionexec-init-mission-fail-navtopoint-init_fail_heli0_nav-4-0-240_nav-4-0-240
  :parameters ()
  :precondition (and (missionexec-mission-init-call_heli0) (missionexec-active-mission_heli0_nav-4-0-240) (navtopoint-mode-is-processing_nav-4-0-240) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-4-0-240) (not (missionexec-mission-init-call_heli0)) (not (navtopoint-mode-is-processing_nav-4-0-240))))
 (:action missionexec-start-mission-autotakeoff-call_start_heli0_ato-6-0-240_ato-6-0-240
  :parameters ()
  :precondition (and (missionexec-active-mission_heli0_ato-6-0-240) (missionexec-mission-ready_heli0) (autotakeoff-mode-is-ready_ato-6-0-240) (not_at_end_constraint0))
  :effect (and (autotakeoff-mode-is-running_ato-6-0-240) (autotakeoff-fsm_exec-is-start_ato-6-0-240) (autotakeoff-in_start_call-is-yes_ato-6-0-240) (missionexec-mission-start-call_heli0) (not (missionexec-mission-ready_heli0)) (not (autotakeoff-mode-is-ready_ato-6-0-240))))
 (:action missionexec-start-mission-autotakeoff-call_start_heli0_ato-5-0-240_ato-5-0-240
  :parameters ()
  :precondition (and (missionexec-active-mission_heli0_ato-5-0-240) (missionexec-mission-ready_heli0) (autotakeoff-mode-is-ready_ato-5-0-240) (not_at_end_constraint0))
  :effect (and (autotakeoff-mode-is-running_ato-5-0-240) (autotakeoff-fsm_exec-is-start_ato-5-0-240) (autotakeoff-in_start_call-is-yes_ato-5-0-240) (missionexec-mission-start-call_heli0) (not (missionexec-mission-ready_heli0)) (not (autotakeoff-mode-is-ready_ato-5-0-240))))
 (:action missionexec-start-mission-navtopoint-call_start_heli0_nav-4-0-240_nav-4-0-240
  :parameters ()
  :precondition (and (missionexec-active-mission_heli0_nav-4-0-240) (missionexec-mission-ready_heli0) (navtopoint-mode-is-ready_nav-4-0-240) (not_at_end_constraint0))
  :effect (and (navtopoint-mode-is-running_nav-4-0-240) (navtopoint-in_start_call-is-yes_nav-4-0-240) (missionexec-mission-start-call_heli0) (navtopoint-fsm_exec-is-start_nav-4-0-240) (not (missionexec-mission-ready_heli0)) (not (navtopoint-mode-is-ready_nav-4-0-240))))
 (:action missionexec-start-mission-ok-autotakeoff-takeoff_action2_heli0_ato-6-0-240_ato-6-0-240
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-6-0-240) (autotakeoff-fsm_state-is-takeoff_ato-6-0-240) (autotakeoff-in_start_call-is-yes_ato-6-0-240) (autotakeoff-fsm_exec-is-action2_ato-6-0-240) (missionexec-active-mission_heli0_ato-6-0-240) (missionexec-mission-start-call_heli0) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_exec-is-nothing_ato-6-0-240) (autotakeoff-in_start_call-is-no_ato-6-0-240) (missionexec-mission-running_heli0) (not (autotakeoff-in_start_call-is-yes_ato-6-0-240)) (not (autotakeoff-fsm_exec-is-action2_ato-6-0-240)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-ok-autotakeoff-takeoff_action2_heli0_ato-5-0-240_ato-5-0-240
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-5-0-240) (autotakeoff-fsm_state-is-takeoff_ato-5-0-240) (autotakeoff-in_start_call-is-yes_ato-5-0-240) (autotakeoff-fsm_exec-is-action2_ato-5-0-240) (missionexec-active-mission_heli0_ato-5-0-240) (missionexec-mission-start-call_heli0) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_exec-is-nothing_ato-5-0-240) (autotakeoff-in_start_call-is-no_ato-5-0-240) (missionexec-mission-running_heli0) (not (autotakeoff-in_start_call-is-yes_ato-5-0-240)) (not (autotakeoff-fsm_exec-is-action2_ato-5-0-240)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-ok-navtopoint-start_ok_heli0_nav-4-0-240_nav-4-0-240
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-4-0-240) (missionexec-active-mission_heli0_nav-4-0-240) (missionexec-mission-start-call_heli0) (navtopoint-fsm_exec-is-start_nav-4-0-240) (not_at_end_constraint0))
  :effect (and (navtopoint-fsm_state-is-start_decouple_nav-4-0-240) (navtopoint-fsm_exec-is-nothing_nav-4-0-240) (navtopoint-in_start_call-is-no_nav-4-0-240) (missionexec-mission-running_heli0) (not (navtopoint-in_start_call-is-yes_nav-4-0-240)) (not (missionexec-mission-start-call_heli0)) (not (navtopoint-fsm_exec-is-start_nav-4-0-240))))
 (:action missionexec-start-mission-fail-autotakeoff-fail_in_start_call_heli0_ato-6-0-240_ato-6-0-240
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-6-0-240) (autotakeoff-in_start_call-is-yes_ato-6-0-240) (missionexec-active-mission_heli0_ato-6-0-240) (missionexec-mission-start-call_heli0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-failed_ato-6-0-240) (not (autotakeoff-mode-is-running_ato-6-0-240)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-fail-autotakeoff-fail_in_start_call_heli0_ato-5-0-240_ato-5-0-240
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-5-0-240) (autotakeoff-in_start_call-is-yes_ato-5-0-240) (missionexec-active-mission_heli0_ato-5-0-240) (missionexec-mission-start-call_heli0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-failed_ato-5-0-240) (not (autotakeoff-mode-is-running_ato-5-0-240)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-fail-navtopoint-fail_in_start_call_heli0_nav-4-0-240_nav-4-0-240
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-4-0-240) (missionexec-active-mission_heli0_nav-4-0-240) (navtopoint-in_start_call-is-yes_nav-4-0-240) (missionexec-mission-start-call_heli0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-4-0-240) (not (navtopoint-mode-is-running_nav-4-0-240)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-mission-done-autotakeoff-takeoff_fcl_cancel_reaction1-0_heli0_ato-5-0-240_ato-5-0-240_obs3
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-5-0-240) (autotakeoff-fsm_state-is-takeoff_ato-5-0-240) (autotakeoff-fsm_exec-is-reaction_cancel_1_ato-5-0-240) (missionexec-active-mission_heli0_ato-5-0-240) (missionexec-mission-running_heli0) (pending_obs3) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-done_ato-5-0-240) (observed_obs3) (not (autotakeoff-mode-is-running_ato-5-0-240)) (not (missionexec-mission-running_heli0)) (not (pending_obs3))))
 (:action missionexec-mission-done-autotakeoff-takeoff_fcl_cancel_reaction1-1_heli0_ato-6-0-240_ato-6-0-240_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-6-0-240) (autotakeoff-fsm_state-is-takeoff_ato-6-0-240) (autotakeoff-fsm_exec-is-reaction_cancel_1_ato-6-0-240) (missionexec-active-mission_heli0_ato-6-0-240) (missionexec-mission-running_heli0) (fault-count-3_lost_ato-6-0-240_task-done_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-done_ato-6-0-240) (not (autotakeoff-mode-is-running_ato-6-0-240)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_ato-6-0-240_task-done_n0))))
 (:action missionexec-mission-done-autotakeoff-takeoff_fcl_cancel_reaction1-1_heli0_ato-5-0-240_ato-5-0-240_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-5-0-240) (autotakeoff-fsm_state-is-takeoff_ato-5-0-240) (autotakeoff-fsm_exec-is-reaction_cancel_1_ato-5-0-240) (missionexec-active-mission_heli0_ato-5-0-240) (missionexec-mission-running_heli0) (fault-count-3_lost_ato-5-0-240_task-done_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-done_ato-5-0-240) (not (autotakeoff-mode-is-running_ato-5-0-240)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_ato-5-0-240_task-done_n0))))
 (:action missionexec-mission-done-autotakeoff-go_to_final_altitude_action2_exit-0_heli0_ato-5-0-240_ato-5-0-240_obs3
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-5-0-240) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-5-0-240) (autotakeoff-in_start_call-is-no_ato-5-0-240) (autotakeoff-fsm_exec-is-action2-exit_ato-5-0-240) (missionexec-active-mission_heli0_ato-5-0-240) (missionexec-mission-running_heli0) (pending_obs3) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-done_ato-5-0-240) (observed_obs3) (not (autotakeoff-mode-is-running_ato-5-0-240)) (not (missionexec-mission-running_heli0)) (not (pending_obs3))))
 (:action missionexec-mission-done-autotakeoff-go_to_final_altitude_action2_exit-1_heli0_ato-6-0-240_ato-6-0-240_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-6-0-240) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-6-0-240) (autotakeoff-in_start_call-is-no_ato-6-0-240) (autotakeoff-fsm_exec-is-action2-exit_ato-6-0-240) (missionexec-active-mission_heli0_ato-6-0-240) (missionexec-mission-running_heli0) (fault-count-3_lost_ato-6-0-240_task-done_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-done_ato-6-0-240) (not (autotakeoff-mode-is-running_ato-6-0-240)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_ato-6-0-240_task-done_n0))))
 (:action missionexec-mission-done-autotakeoff-go_to_final_altitude_action2_exit-1_heli0_ato-5-0-240_ato-5-0-240_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-5-0-240) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-5-0-240) (autotakeoff-in_start_call-is-no_ato-5-0-240) (autotakeoff-fsm_exec-is-action2-exit_ato-5-0-240) (missionexec-active-mission_heli0_ato-5-0-240) (missionexec-mission-running_heli0) (fault-count-3_lost_ato-5-0-240_task-done_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-done_ato-5-0-240) (not (autotakeoff-mode-is-running_ato-5-0-240)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_ato-5-0-240_task-done_n0))))
 (:action missionexec-mission-done-autotakeoff-go_to_final_altitude_fcl_finished_reaction2-0_heli0_ato-6-0-240_ato-6-0-240_obs13
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-6-0-240) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-6-0-240) (autotakeoff-fsm_exec-is-reaction_finished_2_ato-6-0-240) (missionexec-active-mission_heli0_ato-6-0-240) (missionexec-mission-running_heli0) (pending_obs13) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-done_ato-6-0-240) (observed_obs13) (not (autotakeoff-mode-is-running_ato-6-0-240)) (not (missionexec-mission-running_heli0)) (not (pending_obs13))))
 (:action missionexec-mission-done-autotakeoff-go_to_final_altitude_fcl_finished_reaction2-1_heli0_ato-6-0-240_ato-6-0-240_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-6-0-240) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-6-0-240) (autotakeoff-fsm_exec-is-reaction_finished_2_ato-6-0-240) (missionexec-active-mission_heli0_ato-6-0-240) (missionexec-mission-running_heli0) (fault-count-3_lost_ato-6-0-240_task-done_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-done_ato-6-0-240) (not (autotakeoff-mode-is-running_ato-6-0-240)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_ato-6-0-240_task-done_n0))))
 (:action missionexec-mission-done-autotakeoff-go_to_final_altitude_fcl_cancel_reaction1-0_heli0_ato-5-0-240_ato-5-0-240_obs3
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-5-0-240) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-5-0-240) (autotakeoff-fsm_exec-is-reaction_cancel_1_ato-5-0-240) (missionexec-active-mission_heli0_ato-5-0-240) (missionexec-mission-running_heli0) (pending_obs3) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-done_ato-5-0-240) (observed_obs3) (not (autotakeoff-mode-is-running_ato-5-0-240)) (not (missionexec-mission-running_heli0)) (not (pending_obs3))))
 (:action missionexec-mission-done-autotakeoff-go_to_final_altitude_fcl_cancel_reaction1-1_heli0_ato-6-0-240_ato-6-0-240_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-6-0-240) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-6-0-240) (autotakeoff-fsm_exec-is-reaction_cancel_1_ato-6-0-240) (missionexec-active-mission_heli0_ato-6-0-240) (missionexec-mission-running_heli0) (fault-count-3_lost_ato-6-0-240_task-done_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-done_ato-6-0-240) (not (autotakeoff-mode-is-running_ato-6-0-240)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_ato-6-0-240_task-done_n0))))
 (:action missionexec-mission-done-autotakeoff-go_to_final_altitude_fcl_cancel_reaction1-1_heli0_ato-5-0-240_ato-5-0-240_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-5-0-240) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-5-0-240) (autotakeoff-fsm_exec-is-reaction_cancel_1_ato-5-0-240) (missionexec-active-mission_heli0_ato-5-0-240) (missionexec-mission-running_heli0) (fault-count-3_lost_ato-5-0-240_task-done_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-done_ato-5-0-240) (not (autotakeoff-mode-is-running_ato-5-0-240)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_ato-5-0-240_task-done_n0))))
 (:action missionexec-mission-done-navtopoint-wait_for_go_exit-1_heli0_nav-4-0-240_nav-4-0-240_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-4-0-240) (navtopoint-fsm_exec-is-nothing_nav-4-0-240) (navtopoint-fsm_state-is-wait_for_go_nav-4-0-240) (missionexec-active-mission_heli0_nav-4-0-240) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-4-0-240_task-done_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-done_nav-4-0-240) (not (navtopoint-mode-is-running_nav-4-0-240)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-4-0-240_task-done_n0))))
 (:action missionexec-mission-failed-autotakeoff-takeoff_fcl_error_reaction1-1_heli0_ato-6-0-240_ato-6-0-240_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-6-0-240) (autotakeoff-fsm_state-is-takeoff_ato-6-0-240) (autotakeoff-fsm_exec-is-reaction_error_1_ato-6-0-240) (missionexec-active-mission_heli0_ato-6-0-240) (missionexec-mission-running_heli0) (fault-count-3_lost_ato-6-0-240_fail-specific-210_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-failed_ato-6-0-240) (not (autotakeoff-mode-is-running_ato-6-0-240)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_ato-6-0-240_fail-specific-210_n0))))
 (:action missionexec-mission-failed-autotakeoff-takeoff_fcl_error_reaction1-1_heli0_ato-5-0-240_ato-5-0-240_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-5-0-240) (autotakeoff-fsm_state-is-takeoff_ato-5-0-240) (autotakeoff-fsm_exec-is-reaction_error_1_ato-5-0-240) (missionexec-active-mission_heli0_ato-5-0-240) (missionexec-mission-running_heli0) (fault-count-3_lost_ato-5-0-240_fail-specific-210_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-failed_ato-5-0-240) (not (autotakeoff-mode-is-running_ato-5-0-240)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_ato-5-0-240_fail-specific-210_n0))))
 (:action missionexec-mission-failed-autotakeoff-go_to_final_altitude_action1_fail_service-1_heli0_ato-6-0-240_ato-6-0-240_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-6-0-240) (autotakeoff-fsm_exec-is-action1_ato-6-0-240) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-6-0-240) (autotakeoff-in_start_call-is-no_ato-6-0-240) (missionexec-active-mission_heli0_ato-6-0-240) (missionexec-mission-running_heli0) (fault-count-3_lost_ato-6-0-240_fail-service_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-failed_ato-6-0-240) (not (autotakeoff-mode-is-running_ato-6-0-240)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_ato-6-0-240_fail-service_n0))))
 (:action missionexec-mission-failed-autotakeoff-go_to_final_altitude_action1_fail_service-1_heli0_ato-5-0-240_ato-5-0-240_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-5-0-240) (autotakeoff-fsm_exec-is-action1_ato-5-0-240) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-5-0-240) (autotakeoff-in_start_call-is-no_ato-5-0-240) (missionexec-active-mission_heli0_ato-5-0-240) (missionexec-mission-running_heli0) (fault-count-3_lost_ato-5-0-240_fail-service_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-failed_ato-5-0-240) (not (autotakeoff-mode-is-running_ato-5-0-240)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_ato-5-0-240_fail-service_n0))))
 (:action missionexec-mission-failed-autotakeoff-go_to_final_altitude_action1_fail_specific_101-1_heli0_ato-6-0-240_ato-6-0-240_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-6-0-240) (autotakeoff-fsm_exec-is-action1_ato-6-0-240) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-6-0-240) (autotakeoff-in_start_call-is-no_ato-6-0-240) (missionexec-active-mission_heli0_ato-6-0-240) (missionexec-mission-running_heli0) (fault-count-3_lost_ato-6-0-240_fail-specific-101_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-failed_ato-6-0-240) (not (autotakeoff-mode-is-running_ato-6-0-240)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_ato-6-0-240_fail-specific-101_n0))))
 (:action missionexec-mission-failed-autotakeoff-go_to_final_altitude_action1_fail_specific_101-1_heli0_ato-5-0-240_ato-5-0-240_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-5-0-240) (autotakeoff-fsm_exec-is-action1_ato-5-0-240) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-5-0-240) (autotakeoff-in_start_call-is-no_ato-5-0-240) (missionexec-active-mission_heli0_ato-5-0-240) (missionexec-mission-running_heli0) (fault-count-3_lost_ato-5-0-240_fail-specific-101_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-failed_ato-5-0-240) (not (autotakeoff-mode-is-running_ato-5-0-240)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_ato-5-0-240_fail-specific-101_n0))))
 (:action missionexec-mission-failed-autotakeoff-go_to_final_altitude_action1_fail_specific_102-1_heli0_ato-6-0-240_ato-6-0-240_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-6-0-240) (autotakeoff-fsm_exec-is-action1_ato-6-0-240) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-6-0-240) (autotakeoff-in_start_call-is-no_ato-6-0-240) (missionexec-active-mission_heli0_ato-6-0-240) (missionexec-mission-running_heli0) (fault-count-3_lost_ato-6-0-240_fail-specific-102_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-failed_ato-6-0-240) (not (autotakeoff-mode-is-running_ato-6-0-240)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_ato-6-0-240_fail-specific-102_n0))))
 (:action missionexec-mission-failed-autotakeoff-go_to_final_altitude_action1_fail_specific_102-1_heli0_ato-5-0-240_ato-5-0-240_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-5-0-240) (autotakeoff-fsm_exec-is-action1_ato-5-0-240) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-5-0-240) (autotakeoff-in_start_call-is-no_ato-5-0-240) (missionexec-active-mission_heli0_ato-5-0-240) (missionexec-mission-running_heli0) (fault-count-3_lost_ato-5-0-240_fail-specific-102_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-failed_ato-5-0-240) (not (autotakeoff-mode-is-running_ato-5-0-240)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_ato-5-0-240_fail-specific-102_n0))))
 (:action missionexec-mission-failed-autotakeoff-go_to_final_altitude_climb_fail_service-1_heli0_ato-6-0-240_ato-6-0-240_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-6-0-240) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-6-0-240) (autotakeoff-in_start_call-is-no_ato-6-0-240) (autotakeoff-fsm_exec-is-action2-climb_ato-6-0-240) (missionexec-active-mission_heli0_ato-6-0-240) (missionexec-mission-running_heli0) (fault-count-3_lost_ato-6-0-240_fail-service_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-failed_ato-6-0-240) (not (autotakeoff-mode-is-running_ato-6-0-240)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_ato-6-0-240_fail-service_n0))))
 (:action missionexec-mission-failed-autotakeoff-go_to_final_altitude_climb_fail_service-1_heli0_ato-5-0-240_ato-5-0-240_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-5-0-240) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-5-0-240) (autotakeoff-in_start_call-is-no_ato-5-0-240) (autotakeoff-fsm_exec-is-action2-climb_ato-5-0-240) (missionexec-active-mission_heli0_ato-5-0-240) (missionexec-mission-running_heli0) (fault-count-3_lost_ato-5-0-240_fail-service_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-failed_ato-5-0-240) (not (autotakeoff-mode-is-running_ato-5-0-240)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_ato-5-0-240_fail-service_n0))))
 (:action missionexec-mission-failed-autotakeoff-go_to_final_altitude_fcl_error_reaction-1_heli0_ato-6-0-240_ato-6-0-240_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-6-0-240) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-6-0-240) (autotakeoff-fsm_exec-is-reaction_error_1_ato-6-0-240) (missionexec-active-mission_heli0_ato-6-0-240) (missionexec-mission-running_heli0) (fault-count-3_lost_ato-6-0-240_fail-specific-210_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-failed_ato-6-0-240) (not (autotakeoff-mode-is-running_ato-6-0-240)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_ato-6-0-240_fail-specific-210_n0))))
 (:action missionexec-mission-failed-autotakeoff-go_to_final_altitude_fcl_error_reaction-1_heli0_ato-5-0-240_ato-5-0-240_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-5-0-240) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-5-0-240) (autotakeoff-fsm_exec-is-reaction_error_1_ato-5-0-240) (missionexec-active-mission_heli0_ato-5-0-240) (missionexec-mission-running_heli0) (fault-count-3_lost_ato-5-0-240_fail-specific-210_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-failed_ato-5-0-240) (not (autotakeoff-mode-is-running_ato-5-0-240)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_ato-5-0-240_fail-specific-210_n0))))
 (:action missionexec-mission-failed-navtopoint-plan_path_action1_fail_service-1_heli0_nav-4-0-240_nav-4-0-240_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-4-0-240) (navtopoint-fsm_exec-is-action1_nav-4-0-240) (navtopoint-fsm_state-is-plan_path_nav-4-0-240) (navtopoint-in_start_call-is-no_nav-4-0-240) (missionexec-active-mission_heli0_nav-4-0-240) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-4-0-240_fail-service_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-4-0-240) (not (navtopoint-mode-is-running_nav-4-0-240)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-4-0-240_fail-service_n0))))
 (:action missionexec-mission-failed-navtopoint-plan_path_action1_fail_specific_101-1_heli0_nav-4-0-240_nav-4-0-240_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-4-0-240) (navtopoint-fsm_exec-is-action1_nav-4-0-240) (navtopoint-fsm_state-is-plan_path_nav-4-0-240) (navtopoint-in_start_call-is-no_nav-4-0-240) (missionexec-active-mission_heli0_nav-4-0-240) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-4-0-240_fail-specific-101_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-4-0-240) (not (navtopoint-mode-is-running_nav-4-0-240)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-4-0-240_fail-specific-101_n0))))
 (:action missionexec-mission-failed-navtopoint-plan_path_action1_fail_specific_102-1_heli0_nav-4-0-240_nav-4-0-240_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-4-0-240) (navtopoint-fsm_exec-is-action1_nav-4-0-240) (navtopoint-fsm_state-is-plan_path_nav-4-0-240) (navtopoint-in_start_call-is-no_nav-4-0-240) (missionexec-active-mission_heli0_nav-4-0-240) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-4-0-240_fail-specific-102_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-4-0-240) (not (navtopoint-mode-is-running_nav-4-0-240)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-4-0-240_fail-specific-102_n0))))
 (:action missionexec-mission-failed-navtopoint-plan_path_action2_fail_service-1_heli0_nav-4-0-240_nav-4-0-240_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-4-0-240) (navtopoint-fsm_state-is-plan_path_nav-4-0-240) (navtopoint-fsm_exec-is-action2_nav-4-0-240) (navtopoint-in_start_call-is-no_nav-4-0-240) (missionexec-active-mission_heli0_nav-4-0-240) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-4-0-240_fail-service_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-4-0-240) (not (navtopoint-mode-is-running_nav-4-0-240)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-4-0-240_fail-service_n0))))
 (:action missionexec-mission-failed-navtopoint-plan_path_action2_fail_specific_402-1_heli0_nav-4-0-240_nav-4-0-240_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-4-0-240) (navtopoint-fsm_state-is-plan_path_nav-4-0-240) (navtopoint-fsm_exec-is-action2_nav-4-0-240) (navtopoint-in_start_call-is-no_nav-4-0-240) (missionexec-active-mission_heli0_nav-4-0-240) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-4-0-240_fail-specific-402_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-4-0-240) (not (navtopoint-mode-is-running_nav-4-0-240)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-4-0-240_fail-specific-402_n0))))
 (:action missionexec-mission-failed-navtopoint-plan_path_action2_fail_specific_403-1_heli0_nav-4-0-240_nav-4-0-240_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-4-0-240) (navtopoint-fsm_state-is-plan_path_nav-4-0-240) (navtopoint-fsm_exec-is-action2_nav-4-0-240) (navtopoint-in_start_call-is-no_nav-4-0-240) (missionexec-active-mission_heli0_nav-4-0-240) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-4-0-240_fail-specific-403_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-4-0-240) (not (navtopoint-mode-is-running_nav-4-0-240)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-4-0-240_fail-specific-403_n0))))
 (:action missionexec-mission-failed-navtopoint-plan_path_action2_fail_specific_404-1_heli0_nav-4-0-240_nav-4-0-240_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-4-0-240) (navtopoint-fsm_state-is-plan_path_nav-4-0-240) (navtopoint-fsm_exec-is-action2_nav-4-0-240) (navtopoint-in_start_call-is-no_nav-4-0-240) (missionexec-active-mission_heli0_nav-4-0-240) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-4-0-240_fail-specific-404_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-4-0-240) (not (navtopoint-mode-is-running_nav-4-0-240)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-4-0-240_fail-specific-404_n0))))
 (:action missionexec-mission-failed-navtopoint-fly_path_action1_fail_service-1_heli0_nav-4-0-240_nav-4-0-240_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-4-0-240) (navtopoint-fsm_exec-is-action1_nav-4-0-240) (navtopoint-in_start_call-is-no_nav-4-0-240) (navtopoint-fsm_state-is-fly_path_nav-4-0-240) (missionexec-active-mission_heli0_nav-4-0-240) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-4-0-240_fail-service_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-4-0-240) (not (navtopoint-mode-is-running_nav-4-0-240)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-4-0-240_fail-service_n0))))
 (:action missionexec-mission-failed-navtopoint-fly_path_action1_fail_proxy_init-1_heli0_nav-4-0-240_nav-4-0-240_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-4-0-240) (navtopoint-fsm_exec-is-action1_nav-4-0-240) (navtopoint-in_start_call-is-no_nav-4-0-240) (navtopoint-fsm_state-is-fly_path_nav-4-0-240) (missionexec-active-mission_heli0_nav-4-0-240) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-4-0-240_fail-subtask_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-4-0-240) (not (navtopoint-mode-is-running_nav-4-0-240)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-4-0-240_fail-subtask_n0))))
 (:action missionexec-destroy-mission-autotakeoff-call_destroy_when_done-0_heli0_ato-6-0-240_ato-6-0-240_obs14
  :parameters ()
  :precondition (and (missionexec-active-mission_heli0_ato-6-0-240) (missionexec-mission-over_heli0) (autotakeoff-mode-is-done_ato-6-0-240) (pending_obs14) (not_at_end_constraint0))
  :effect (and (missionexec-mission-idle_heli0) (observed_obs14) (not (missionexec-mission-over_heli0)) (not (autotakeoff-mode-is-done_ato-6-0-240)) (not (pending_obs14))))
 (:action missionexec-destroy-mission-autotakeoff-call_destroy_when_done-1_heli0_ato-6-0-240_ato-6-0-240_n0_n1
  :parameters ()
  :precondition (and (missionexec-active-mission_heli0_ato-6-0-240) (missionexec-mission-over_heli0) (autotakeoff-mode-is-done_ato-6-0-240) (fault-count-3_lost_ato-6-0-240_destroyed_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-idle_heli0) (not (missionexec-mission-over_heli0)) (not (autotakeoff-mode-is-done_ato-6-0-240)) (not (fault-count-3_lost_ato-6-0-240_destroyed_n0))))
 (:action missionexec-destroy-mission-autotakeoff-call_destroy_when_done-1_heli0_ato-5-0-240_ato-5-0-240_n0_n1
  :parameters ()
  :precondition (and (missionexec-active-mission_heli0_ato-5-0-240) (missionexec-mission-over_heli0) (autotakeoff-mode-is-done_ato-5-0-240) (fault-count-3_lost_ato-5-0-240_destroyed_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-idle_heli0) (not (missionexec-mission-over_heli0)) (not (autotakeoff-mode-is-done_ato-5-0-240)) (not (fault-count-3_lost_ato-5-0-240_destroyed_n0)) (not (dominates-3_hyp1_lost_ato-5-0-240_destroyed))))
 (:action missionexec-destroy-mission-autotakeoff-call_destroy_when_failed-1_heli0_ato-6-0-240_ato-6-0-240_n0_n1
  :parameters ()
  :precondition (and (missionexec-active-mission_heli0_ato-6-0-240) (missionexec-mission-over_heli0) (autotakeoff-mode-is-failed_ato-6-0-240) (fault-count-3_lost_ato-6-0-240_destroyed_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-idle_heli0) (not (missionexec-mission-over_heli0)) (not (autotakeoff-mode-is-failed_ato-6-0-240)) (not (fault-count-3_lost_ato-6-0-240_destroyed_n0))))
 (:action missionexec-destroy-mission-autotakeoff-call_destroy_when_failed-1_heli0_ato-5-0-240_ato-5-0-240_n0_n1
  :parameters ()
  :precondition (and (missionexec-active-mission_heli0_ato-5-0-240) (missionexec-mission-over_heli0) (autotakeoff-mode-is-failed_ato-5-0-240) (fault-count-3_lost_ato-5-0-240_destroyed_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-idle_heli0) (not (missionexec-mission-over_heli0)) (not (autotakeoff-mode-is-failed_ato-5-0-240)) (not (fault-count-3_lost_ato-5-0-240_destroyed_n0)) (not (dominates-3_hyp1_lost_ato-5-0-240_destroyed))))
 (:action missionexec-destroy-mission-navtopoint-call_destroy_when_done-1_heli0_nav-4-0-240_nav-4-0-240_n0_n1
  :parameters ()
  :precondition (and (missionexec-active-mission_heli0_nav-4-0-240) (missionexec-mission-over_heli0) (navtopoint-mode-is-done_nav-4-0-240) (fault-count-3_lost_nav-4-0-240_destroyed_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-idle_heli0) (not (missionexec-mission-over_heli0)) (not (navtopoint-mode-is-done_nav-4-0-240)) (not (fault-count-3_lost_nav-4-0-240_destroyed_n0))))
 (:action missionexec-destroy-mission-navtopoint-call_destroy_when_failed-1_heli0_nav-4-0-240_nav-4-0-240_n0_n1
  :parameters ()
  :precondition (and (missionexec-active-mission_heli0_nav-4-0-240) (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-4-0-240) (fault-count-3_lost_nav-4-0-240_destroyed_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-idle_heli0) (not (missionexec-mission-over_heli0)) (not (navtopoint-mode-is-failed_nav-4-0-240)) (not (fault-count-3_lost_nav-4-0-240_destroyed_n0))))
 (:action advance-to-obs-1_obs1_obs0
  :parameters ()
  :precondition (and (observed_obs0) (future_obs1) (not_at_end_constraint0))
  :effect (and (pending_obs1) (not (future_obs1))))
 (:action advance-to-obs-1_obs2_obs1
  :parameters ()
  :precondition (and (observed_obs1) (future_obs2) (not_at_end_constraint0))
  :effect (and (pending_obs2) (not (future_obs2))))
 (:action advance-to-obs-1_obs3_obs2
  :parameters ()
  :precondition (and (observed_obs2) (future_obs3) (not_at_end_constraint0))
  :effect (and (pending_obs3) (not (future_obs3))))
 (:action advance-to-obs-1_obs4_obs3
  :parameters ()
  :precondition (and (observed_obs3) (future_obs4) (not_at_end_constraint0))
  :effect (and (pending_obs4) (not (future_obs4))))
 (:action advance-to-obs-1_obs5_obs4
  :parameters ()
  :precondition (and (observed_obs4) (future_obs5) (not_at_end_constraint0))
  :effect (and (pending_obs5) (not (future_obs5))))
 (:action advance-to-obs-1_obs6_obs5
  :parameters ()
  :precondition (and (observed_obs5) (future_obs6) (not_at_end_constraint0))
  :effect (and (pending_obs6) (not (future_obs6))))
 (:action advance-to-obs-1_obs7_obs6
  :parameters ()
  :precondition (and (observed_obs6) (future_obs7) (not_at_end_constraint0))
  :effect (and (pending_obs7) (not (future_obs7))))
 (:action advance-to-obs-1_obs8_obs7
  :parameters ()
  :precondition (and (observed_obs7) (future_obs8) (not_at_end_constraint0))
  :effect (and (pending_obs8) (not (future_obs8))))
 (:action advance-to-obs-1_obs9_obs8
  :parameters ()
  :precondition (and (observed_obs8) (future_obs9) (not_at_end_constraint0))
  :effect (and (pending_obs9) (not (future_obs9))))
 (:action advance-to-obs-1_obs10_obs9
  :parameters ()
  :precondition (and (observed_obs9) (future_obs10) (not_at_end_constraint0))
  :effect (and (pending_obs10) (not (future_obs10))))
 (:action advance-to-obs-1_obs11_obs10
  :parameters ()
  :precondition (and (observed_obs10) (future_obs11) (not_at_end_constraint0))
  :effect (and (pending_obs11) (not (future_obs11))))
 (:action advance-to-obs-1_obs12_obs11
  :parameters ()
  :precondition (and (observed_obs11) (future_obs12) (not_at_end_constraint0))
  :effect (and (pending_obs12) (not (future_obs12))))
 (:action advance-to-obs-1_obs13_obs12
  :parameters ()
  :precondition (and (observed_obs12) (future_obs13) (not_at_end_constraint0))
  :effect (and (pending_obs13) (not (future_obs13))))
 (:action advance-to-obs-1_obs14_obs13
  :parameters ()
  :precondition (and (observed_obs13) (future_obs14) (not_at_end_constraint0))
  :effect (and (pending_obs14) (not (future_obs14))))
 (:action set_goal_1_constraint0
  :parameters ()
  :precondition (and (observed_obs8) (observed_obs11) (observed_obs2) (observed_obs5) (observed_obs9) (observed_obs6) (observed_obs7) (observed_obs1) (observed_obs10) (observed_obs12) (observed_obs4) (observed_obs0) (observed_obs13) (observed_obs3) (observed_obs14) (dominates-3_hyp1_lost_ato-5-0-240_destroyed) (not_at_end_constraint0))
  :effect (and (achieved_constraint0) (not (not_at_end_constraint0))))
)
