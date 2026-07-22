(define (domain witas-dddl-compiled)
 (:requirements :strips :equality)
 (:predicates (pending_obs4) (observed_obs4) (pending_obs14) (observed_obs14) (fault-count-3_lost_heli0_fcl-event-finished_n0) (dominates-3_hyp1_lost_heli0_fcl-event-finished) (fault-count-3_lost_heli0_fcl-event-canceled_n0) (fault-count-3_lost_heli0_fcl-event-manual_n0) (fault-count-3_lost_heli0_fcl-event-not_accepted_n0) (fault-count-3_lost_heli0_fcl-event-traj3d_next_segment_n0) (pending_obs2) (observed_obs2) (fault-count-3_lost_heli0_fcl-return-finished_n0) (fault-count-3_lost_heli0_fcl-return-canceled_n0) (fault-count-3_lost_heli0_fcl-return-manual_n0) (fault-count-3_lost_heli0_fcl-return-not_accepted_n0) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-start_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (pending_obs13) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364) (observed_obs13) (fault-count-3_lost_f3d-1-0-364_checkpoint10_n0) (fault-count-3_lost_f3d-1-0-364_checkpoint11_n0) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint12_n0) (fly3d-fsm_exec-is-reaction_cancel_1_f3d-1-0-364) (fly3d-fsm_exec-is-reaction_error_1_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint20_n0) (fly3d-trajectory-not-sent_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint21_n0) (fly3d-fsm_state-is-wait_trajectory_end_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint22_n0) (fly3d-fsm_exec-is-action2_f3d-1-0-364) (fly3d-fsm_exec-is-reaction_finished_1_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint24_n0) (fly3d-fsm_exec-is-reaction_finished_2_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-1-0-364) (fly3d-fsm_state-is-goal_point_wait_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint30_n0) (fly3d-fsm_exec-is-action2-wait_f3d-1-0-364) (fly3d-fsm_exec-is-action2-exit_f3d-1-0-364) (fly3d-fsm_exec-is-action2-fail_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint31_n0) (fault-count-3_lost_f3d-1-0-364_checkpoint40_n0) (fly3d-fsm_exec-is-global_reaction_cancel_1_f3d-1-0-364) (fly3d-fsm_exec-is-global_reaction_error_1_f3d-1-0-364) (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_exec-is-start_ato-1-0-275) (autotakeoff-fsm_state-is-takeoff_ato-1-0-275) (autotakeoff-fsm_exec-is-action1_ato-1-0-275) (autotakeoff-in_start_call-is-yes_ato-1-0-275) (fault-count-3_lost_ato-1-0-275_checkpoint1_n0) (autotakeoff-fsm_exec-is-action2_ato-1-0-275) (dominates-3_hyp1_lost_ato-1-0-275_checkpoint1) (autotakeoff-fsm_exec-is-nothing_ato-1-0-275) (autotakeoff-fsm_exec-is-reaction_finished_1_ato-1-0-275) (pending_obs5) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-1-0-275) (observed_obs5) (fault-count-3_lost_ato-1-0-275_checkpoint2_n0) (autotakeoff-fsm_exec-is-reaction_error_1_ato-1-0-275) (autotakeoff-fsm_exec-is-reaction_cancel_1_ato-1-0-275) (pending_obs1) (observed_obs1) (pending_obs3) (observed_obs3) (autotakeoff-in_start_call-is-no_ato-1-0-275) (fault-count-3_lost_ato-1-0-275_checkpoint7_n0) (autotakeoff-fsm_exec-is-action2-exit_ato-1-0-275) (pending_obs6) (autotakeoff-fsm_exec-is-action2-climb_ato-1-0-275) (observed_obs6) (fault-count-3_lost_ato-1-0-275_checkpoint5_n0) (pending_obs7) (autotakeoff-fsm_exec-is-reaction_finished_2_ato-1-0-275) (observed_obs7) (fault-count-3_lost_ato-1-0-275_checkpoint6_n0) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_state-is-start_decouple_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_exec-is-action1_nav-1-0-275) (navtopoint-fsm_state-is-plan_path_nav-1-0-275) (pending_obs10) (navtopoint-fsm_exec-is-action2_nav-1-0-275) (observed_obs10) (fault-count-3_lost_nav-1-0-275_checkpoint1_n0) (navtopoint-in_start_call-is-no_nav-1-0-275) (pending_obs11) (navtopoint-fsm_state-is-wait_for_go_nav-1-0-275) (observed_obs11) (fault-count-3_lost_nav-1-0-275_checkpoint4_n0) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (fly3d-mode-is-pre_init_f3d-1-0-364) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fly3d-mode-is-processing_f3d-1-0-364) (called-by_f3d-1-0-364_nav-1-0-275) (pending_obs12) (navtopoint-fsm_exec-is-reaction_f3d_ready_nav-1-0-275) (fly3d-mode-is-ready_f3d-1-0-364) (observed_obs12) (called-by_f3d-1-0-364_missionexecutor) (fault-count-4_lost_f3d-1-0-364_created_missionexecutor_n0) (fault-count-4_lost_f3d-1-0-364_created_nav-1-0-275_n0) (fly3d-in_start_call-is-yes_f3d-1-0-364) (fly3d-mode-is-done_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_destroyed_n0) (navtopoint-fsm_exec-is-reaction_f3d_fail_2_nav-1-0-275) (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-1-0-275) (fault-count-3_lost_f3d-1-0-364_task-done_n0) (navtopoint-fsm_exec-is-reaction_f3d_done_2_nav-1-0-275) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (fault-count-3_lost_f3d-1-0-364_fail-service_n0) (fault-count-3_lost_f3d-1-0-364_fail-specific-221_n0) (fault-count-3_lost_f3d-1-0-364_fail-specific-222_n0) (fault-count-3_lost_f3d-1-0-364_fail-specific-223_n0) (fault-count-3_lost_f3d-1-0-364_fail-specific-211_n0) (fault-count-3_lost_f3d-1-0-364_fail-specific-220_n0) (fault-count-3_lost_f3d-1-0-364_fail-specific-213_n0) (fault-count-3_lost_f3d-1-0-364_fail-specific-214_n0) (fault-count-3_lost_f3d-1-0-364_fail-specific-210_n0) (missionexec-mission-idle_heli0) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-init-call_heli0) (autotakeoff-mode-is-pre_init_ato-1-0-275) (missionexec-active-mission_heli0_ato-1-0-275) (autotakeoff-mode-is-processing_ato-1-0-275) (called-by_ato-1-0-275_missionexecutor) (navtopoint-mode-is-pre_init_nav-1-0-275) (missionexec-active-mission_heli0_nav-1-0-275) (navtopoint-mode-is-processing_nav-1-0-275) (called-by_nav-1-0-275_missionexecutor) (missionexec-mission-ready_heli0) (pending_obs0) (autotakeoff-mode-is-ready_ato-1-0-275) (observed_obs0) (fault-count-4_lost_ato-1-0-275_created_missionexecutor_n0) (pending_obs9) (navtopoint-mode-is-ready_nav-1-0-275) (observed_obs9) (fault-count-4_lost_nav-1-0-275_created_missionexecutor_n0) (missionexec-mission-over_heli0) (autotakeoff-mode-is-failed_ato-1-0-275) (navtopoint-mode-is-failed_nav-1-0-275) (navtopoint-in_start_call-is-yes_nav-1-0-275) (missionexec-mission-start-call_heli0) (navtopoint-fsm_exec-is-start_nav-1-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_ato-1-0-275_task-done_n0) (autotakeoff-mode-is-done_ato-1-0-275) (dominates-3_hyp1_lost_ato-1-0-275_task-done) (fault-count-3_lost_nav-1-0-275_task-done_n0) (navtopoint-mode-is-done_nav-1-0-275) (fault-count-3_lost_ato-1-0-275_fail-specific-210_n0) (fault-count-3_lost_ato-1-0-275_fail-service_n0) (fault-count-3_lost_ato-1-0-275_fail-specific-101_n0) (fault-count-3_lost_ato-1-0-275_fail-specific-102_n0) (fault-count-3_lost_nav-1-0-275_fail-service_n0) (fault-count-3_lost_nav-1-0-275_fail-specific-101_n0) (fault-count-3_lost_nav-1-0-275_fail-specific-102_n0) (fault-count-3_lost_nav-1-0-275_fail-specific-402_n0) (fault-count-3_lost_nav-1-0-275_fail-specific-403_n0) (fault-count-3_lost_nav-1-0-275_fail-specific-404_n0) (fault-count-3_lost_nav-1-0-275_fail-subtask_n0) (pending_obs8) (observed_obs8) (fault-count-3_lost_ato-1-0-275_destroyed_n0) (fault-count-3_lost_nav-1-0-275_destroyed_n0) (future_obs1) (future_obs2) (future_obs3) (future_obs4) (future_obs5) (future_obs6) (future_obs7) (future_obs8) (future_obs9) (future_obs10) (future_obs11) (future_obs12) (future_obs13) (future_obs14) (not_at_end_constraint0) (achieved_constraint0) (static-true))
 (:action flightcontrol-fcl-event-finished-0_heli0_obs4
  :parameters ()
  :precondition (and (pending_obs4) (not_at_end_constraint0))
  :effect (and (observed_obs4) (not (pending_obs4))))
 (:action flightcontrol-fcl-event-finished-0_heli0_obs14
  :parameters ()
  :precondition (and (pending_obs14) (not_at_end_constraint0))
  :effect (and (observed_obs14) (not (pending_obs14))))
 (:action flightcontrol-fcl-event-in_the_air-0_heli0_obs2
  :parameters ()
  :precondition (and (pending_obs2) (not_at_end_constraint0))
  :effect (and (observed_obs2) (not (pending_obs2))))
 (:action fly3d-start_ok_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-start_f3d-1-0-364) (not_at_end_constraint0))
  :effect (and (fly3d-fsm_state-is-turn_to_segment_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (not (fly3d-fsm_exec-is-start_f3d-1-0-364))))
 (:action fly3d-enter_turn_to_segment_heading_checkpoint10-0_f3d-1-0-364_obs13
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (pending_obs13) (not_at_end_constraint0))
  :effect (and (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364) (observed_obs13) (not (fly3d-fsm_state-is-turn_to_segment_heading_f3d-1-0-364)) (not (pending_obs13))))
 (:action fly3d-enter_turn_to_segment_heading_checkpoint10-1_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint10_n0) (not_at_end_constraint0))
  :effect (and (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364) (not (fly3d-fsm_state-is-turn_to_segment_heading_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_checkpoint10_n0))))
 (:action fly3d-enter_turn_to_segment_heading_checkpoint11-1_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint11_n0) (not_at_end_constraint0))
  :effect (and (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (not (fly3d-fsm_state-is-turn_to_segment_heading_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_checkpoint11_n0))))
 (:action fly3d-enter_send_starting_yaw_command_ok_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (not_at_end_constraint0))
  :effect (and (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not (fly3d-fsm_exec-is-action1_f3d-1-0-364)) (not (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364))))
 (:action fly3d-enter_send_starting_yaw_command_checkpoint12-1_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint12_n0) (not_at_end_constraint0))
  :effect (and (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not (fly3d-fsm_exec-is-action1_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_checkpoint12_n0))))
 (:action fly3d-in_send_starting_yaw_command_idle_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not_at_end_constraint0))
  :effect (and (fly3d-fsm_exec-is-action1_f3d-1-0-364) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364))))
 (:action fly3d-in_send_starting_yaw_command_fcl_cancel_1-flightcontrol-fcl-event-canceled-1_f3d-1-0-364_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-canceled_n0) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not_at_end_constraint0))
  :effect (and (fly3d-fsm_exec-is-reaction_cancel_1_f3d-1-0-364) (not (fault-count-3_lost_heli0_fcl-event-canceled_n0)) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364))))
 (:action fly3d-in_send_starting_yaw_command_fcl_cancel_2-flightcontrol-fcl-event-manual-1_f3d-1-0-364_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-manual_n0) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not_at_end_constraint0))
  :effect (and (fly3d-fsm_exec-is-reaction_cancel_1_f3d-1-0-364) (not (fault-count-3_lost_heli0_fcl-event-manual_n0)) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364))))
 (:action fly3d-in_send_starting_yaw_command_fcl_error-flightcontrol-fcl-event-not_accepted-1_f3d-1-0-364_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-not_accepted_n0) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not_at_end_constraint0))
  :effect (and (fly3d-fsm_exec-is-reaction_error_1_f3d-1-0-364) (not (fault-count-3_lost_heli0_fcl-event-not_accepted_n0)) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364))))
 (:action fly3d-in_wait_for_yaw_finish_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-1-0-364_heli0_heli0_obs4
  :parameters ()
  :precondition (and (pending_obs4) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not_at_end_constraint0))
  :effect (and (observed_obs4) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (not (pending_obs4)) (not (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-1-0-364)) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364))))
 (:action fly3d-in_wait_for_yaw_finish_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-1-0-364_heli0_heli0_obs14
  :parameters ()
  :precondition (and (pending_obs14) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not_at_end_constraint0))
  :effect (and (observed_obs14) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (not (pending_obs14)) (not (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-1-0-364)) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364))))
 (:action fly3d-in_wait_for_yaw_finish_fcl_finished-flightcontrol-fcl-event-finished-1_f3d-1-0-364_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-finished_n0) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not_at_end_constraint0))
  :effect (and (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (not (fault-count-3_lost_heli0_fcl-event-finished_n0)) (not (dominates-3_hyp1_lost_heli0_fcl-event-finished)) (not (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-1-0-364)) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364))))
 (:action fly3d-in_wait_for_yaw_finish_fcl_cancel_1-flightcontrol-fcl-event-canceled-1_f3d-1-0-364_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-canceled_n0) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not_at_end_constraint0))
  :effect (and (fly3d-fsm_exec-is-reaction_cancel_1_f3d-1-0-364) (not (fault-count-3_lost_heli0_fcl-event-canceled_n0)) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364))))
 (:action fly3d-in_wait_for_yaw_finish_fcl_cancel_2-flightcontrol-fcl-event-canceled-1_f3d-1-0-364_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-canceled_n0) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not_at_end_constraint0))
  :effect (and (fly3d-fsm_exec-is-reaction_cancel_1_f3d-1-0-364) (not (fault-count-3_lost_heli0_fcl-event-canceled_n0)) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364))))
 (:action fly3d-in_wait_for_yaw_finish_fcl_error-flightcontrol-fcl-event-not_accepted-1_f3d-1-0-364_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-not_accepted_n0) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not_at_end_constraint0))
  :effect (and (fly3d-fsm_exec-is-reaction_error_1_f3d-1-0-364) (not (fault-count-3_lost_heli0_fcl-event-not_accepted_n0)) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364))))
 (:action fly3d-enter_send_first_trajectory_checkpoint20-1_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint20_n0) (not_at_end_constraint0))
  :effect (and (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not (fly3d-fsm_exec-is-action1_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_checkpoint20_n0)) (not (fly3d-trajectory-not-sent_f3d-1-0-364))))
 (:action fly3d-enter_send_first_trajectory_checkpoint21-1_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint21_n0) (not_at_end_constraint0))
  :effect (and (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-1-0-364) (not (fly3d-fsm_exec-is-action1_f3d-1-0-364)) (not (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364)) (not (fly3d-trajectory-not-sent_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_checkpoint21_n0))))
 (:action fly3d-enter_send_first_trajectory_checkpoint22-1_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint22_n0) (not_at_end_constraint0))
  :effect (and (fly3d-fsm_exec-is-action2_f3d-1-0-364) (not (fly3d-fsm_exec-is-action1_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_checkpoint22_n0))))
 (:action fly3d-enter_send_first_trajectory_checkpoint21_after22-1_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint21_n0) (fly3d-fsm_exec-is-action2_f3d-1-0-364) (not_at_end_constraint0))
  :effect (and (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-1-0-364) (not (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364)) (not (fly3d-trajectory-not-sent_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_checkpoint21_n0)) (not (fly3d-fsm_exec-is-action2_f3d-1-0-364))))
 (:action fly3d-enter_send_first_trajectory_busy_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (not_at_end_constraint0))
  :effect (and (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-trajectory-not-sent_f3d-1-0-364) (not (fly3d-fsm_exec-is-action1_f3d-1-0-364))))
 (:action fly3d-enter_send_first_trajectory_after22_busy_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_exec-is-action2_f3d-1-0-364) (not_at_end_constraint0))
  :effect (and (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-trajectory-not-sent_f3d-1-0-364) (not (fly3d-fsm_exec-is-action2_f3d-1-0-364))))
 (:action fly3d-in_send_first_trajectory_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-1-0-364_heli0_heli0_obs4
  :parameters ()
  :precondition (and (pending_obs4) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not_at_end_constraint0))
  :effect (and (observed_obs4) (fly3d-fsm_exec-is-reaction_finished_1_f3d-1-0-364) (not (pending_obs4)) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364))))
 (:action fly3d-in_send_first_trajectory_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-1-0-364_heli0_heli0_obs14
  :parameters ()
  :precondition (and (pending_obs14) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not_at_end_constraint0))
  :effect (and (observed_obs14) (fly3d-fsm_exec-is-reaction_finished_1_f3d-1-0-364) (not (pending_obs14)) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364))))
 (:action fly3d-in_send_first_trajectory_fcl_finished-flightcontrol-fcl-event-finished-1_f3d-1-0-364_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-finished_n0) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not_at_end_constraint0))
  :effect (and (fly3d-fsm_exec-is-reaction_finished_1_f3d-1-0-364) (not (fault-count-3_lost_heli0_fcl-event-finished_n0)) (not (dominates-3_hyp1_lost_heli0_fcl-event-finished)) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364))))
 (:action fly3d-in_send_first_trajectory_fcl_next_trajectory-flightcontrol-fcl-event-traj3d_next_segment-1_f3d-1-0-364_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-traj3d_next_segment_n0) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not_at_end_constraint0))
  :effect (and (fly3d-fsm_exec-is-action1_f3d-1-0-364) (not (fault-count-3_lost_heli0_fcl-event-traj3d_next_segment_n0)) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364))))
 (:action fly3d-in_send_first_trajectory_idle_timeout_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-trajectory-not-sent_f3d-1-0-364) (not_at_end_constraint0))
  :effect (and (fly3d-fsm_exec-is-action1_f3d-1-0-364) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364))))
 (:action fly3d-in_wait_trajectory_end_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-1-0-364_heli0_heli0_obs4
  :parameters ()
  :precondition (and (pending_obs4) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-1-0-364) (not_at_end_constraint0))
  :effect (and (observed_obs4) (fly3d-fsm_exec-is-reaction_finished_1_f3d-1-0-364) (not (pending_obs4)) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364))))
 (:action fly3d-in_wait_trajectory_end_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-1-0-364_heli0_heli0_obs14
  :parameters ()
  :precondition (and (pending_obs14) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-1-0-364) (not_at_end_constraint0))
  :effect (and (observed_obs14) (fly3d-fsm_exec-is-reaction_finished_1_f3d-1-0-364) (not (pending_obs14)) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364))))
 (:action fly3d-in_wait_trajectory_end_fcl_finished-flightcontrol-fcl-event-finished-1_f3d-1-0-364_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-finished_n0) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-1-0-364) (not_at_end_constraint0))
  :effect (and (fly3d-fsm_exec-is-reaction_finished_1_f3d-1-0-364) (not (fault-count-3_lost_heli0_fcl-event-finished_n0)) (not (dominates-3_hyp1_lost_heli0_fcl-event-finished)) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364))))
 (:action fly3d-in_wait_trajectory_end_fcl_finished_reaction1-1_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-1-0-364) (fly3d-fsm_exec-is-reaction_finished_1_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint24_n0) (not_at_end_constraint0))
  :effect (and (fly3d-fsm_exec-is-reaction_finished_2_f3d-1-0-364) (not (fly3d-fsm_exec-is-reaction_finished_1_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_checkpoint24_n0))))
 (:action fly3d-in_wait_trajectory_end_fcl_finished_reaction2a_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-1-0-364) (fly3d-fsm_exec-is-reaction_finished_2_f3d-1-0-364) (not_at_end_constraint0))
  :effect (and (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-1-0-364) (not (fly3d-fsm_state-is-wait_trajectory_end_f3d-1-0-364)) (not (fly3d-fsm_exec-is-reaction_finished_2_f3d-1-0-364))))
 (:action fly3d-in_wait_trajectory_end_fcl_finished_reaction2b_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-1-0-364) (fly3d-fsm_exec-is-reaction_finished_2_f3d-1-0-364) (not_at_end_constraint0))
  :effect (and (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-goal_point_wait_f3d-1-0-364) (not (fly3d-fsm_state-is-wait_trajectory_end_f3d-1-0-364)) (not (fly3d-fsm_exec-is-reaction_finished_2_f3d-1-0-364))))
 (:action fly3d-in_wait_trajectory_end_fcl_finished_reaction2d_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-1-0-364) (fly3d-fsm_exec-is-reaction_finished_2_f3d-1-0-364) (not_at_end_constraint0))
  :effect (and (fly3d-fsm_state-is-turn_to_segment_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (not (fly3d-fsm_state-is-wait_trajectory_end_f3d-1-0-364)) (not (fly3d-fsm_exec-is-reaction_finished_2_f3d-1-0-364))))
 (:action fly3d-enter_turn_to_goal_heading_checkpoint30-1_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint30_n0) (not_at_end_constraint0))
  :effect (and (fly3d-fsm_exec-is-action2-wait_f3d-1-0-364) (not (fly3d-fsm_exec-is-action1_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_checkpoint30_n0))))
 (:action fly3d-enter_turn_to_goal_heading_yaw_wait_finish_1-flightcontrol-fcl-return-finished-1_f3d-1-0-364_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-return-finished_n0) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action2-wait_f3d-1-0-364) (not_at_end_constraint0))
  :effect (and (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-goal_point_wait_f3d-1-0-364) (not (fault-count-3_lost_heli0_fcl-return-finished_n0)) (not (fly3d-fsm_state-is-turn_to_goal_heading_f3d-1-0-364)) (not (fly3d-fsm_exec-is-action2-wait_f3d-1-0-364))))
 (:action fly3d-enter_turn_to_goal_heading_yaw_wait_finish_2-flightcontrol-fcl-return-finished-1_f3d-1-0-364_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-return-finished_n0) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action2-wait_f3d-1-0-364) (not_at_end_constraint0))
  :effect (and (fly3d-fsm_exec-is-action2-exit_f3d-1-0-364) (not (fault-count-3_lost_heli0_fcl-return-finished_n0)) (not (fly3d-fsm_exec-is-action2-wait_f3d-1-0-364))))
 (:action fly3d-enter_turn_to_goal_heading_yaw_wait_cancel_1-flightcontrol-fcl-return-canceled-1_f3d-1-0-364_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-return-canceled_n0) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action2-wait_f3d-1-0-364) (not_at_end_constraint0))
  :effect (and (fly3d-fsm_exec-is-action2-exit_f3d-1-0-364) (not (fault-count-3_lost_heli0_fcl-return-canceled_n0)) (not (fly3d-fsm_exec-is-action2-wait_f3d-1-0-364))))
 (:action fly3d-enter_turn_to_goal_heading_yaw_wait_cancel_2-flightcontrol-fcl-return-manual-1_f3d-1-0-364_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-return-manual_n0) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action2-wait_f3d-1-0-364) (not_at_end_constraint0))
  :effect (and (fly3d-fsm_exec-is-action2-exit_f3d-1-0-364) (not (fault-count-3_lost_heli0_fcl-return-manual_n0)) (not (fly3d-fsm_exec-is-action2-wait_f3d-1-0-364))))
 (:action fly3d-enter_turn_to_goal_heading_yaw_wait_error-flightcontrol-fcl-return-not_accepted-1_f3d-1-0-364_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-return-not_accepted_n0) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action2-wait_f3d-1-0-364) (not_at_end_constraint0))
  :effect (and (fly3d-fsm_exec-is-action2-fail_f3d-1-0-364) (not (fault-count-3_lost_heli0_fcl-return-not_accepted_n0)) (not (fly3d-fsm_exec-is-action2-wait_f3d-1-0-364))))
 (:action fly3d-enter_turn_to_goal_heading_checkpoint31a-1_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint31_n0) (not_at_end_constraint0))
  :effect (and (fly3d-fsm_state-is-goal_point_wait_f3d-1-0-364) (not (fly3d-fsm_state-is-turn_to_goal_heading_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_checkpoint31_n0))))
 (:action fly3d-enter_turn_to_goal_heading_checkpoint31b-1_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint31_n0) (not_at_end_constraint0))
  :effect (and (fly3d-fsm_exec-is-action2-exit_f3d-1-0-364) (not (fly3d-fsm_exec-is-action1_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_checkpoint31_n0))))
 (:action fly3d-enter_goal_point_wait_checkpoint40-1_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-goal_point_wait_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint40_n0) (not_at_end_constraint0))
  :effect (and (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not (fly3d-fsm_exec-is-action1_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_checkpoint40_n0))))
 (:action fly3d-goal_point_wait_cmd_continue_1_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-fsm_state-is-goal_point_wait_f3d-1-0-364) (not_at_end_constraint0))
  :effect (and (fly3d-fsm_state-is-turn_to_segment_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364)) (not (fly3d-fsm_state-is-goal_point_wait_f3d-1-0-364))))
 (:action fly3d-goal_point_wait_idle_1_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-fsm_state-is-goal_point_wait_f3d-1-0-364) (not_at_end_constraint0))
  :effect (and (fly3d-fsm_state-is-turn_to_segment_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364)) (not (fly3d-fsm_state-is-goal_point_wait_f3d-1-0-364))))
 (:action fly3d-global_fcl_canceled-flightcontrol-fcl-event-canceled-1_f3d-1-0-364_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-canceled_n0) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not_at_end_constraint0))
  :effect (and (fly3d-fsm_exec-is-global_reaction_cancel_1_f3d-1-0-364) (not (fault-count-3_lost_heli0_fcl-event-canceled_n0)) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364))))
 (:action fly3d-global_fcl_manual-flightcontrol-fcl-event-manual-1_f3d-1-0-364_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-manual_n0) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not_at_end_constraint0))
  :effect (and (fly3d-fsm_exec-is-global_reaction_cancel_1_f3d-1-0-364) (not (fault-count-3_lost_heli0_fcl-event-manual_n0)) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364))))
 (:action fly3d-global_fcl_error-flightcontrol-fcl-event-not_accepted-1_f3d-1-0-364_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-not_accepted_n0) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not_at_end_constraint0))
  :effect (and (fly3d-fsm_exec-is-global_reaction_error_1_f3d-1-0-364) (not (fault-count-3_lost_heli0_fcl-event-not_accepted_n0)) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364))))
 (:action autotakeoff-start_ok_ato-1-0-275
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_exec-is-start_ato-1-0-275) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_state-is-takeoff_ato-1-0-275) (autotakeoff-fsm_exec-is-action1_ato-1-0-275) (not (autotakeoff-fsm_exec-is-start_ato-1-0-275))))
 (:action autotakeoff-takeoff_action1-1_ato-1-0-275_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_state-is-takeoff_ato-1-0-275) (autotakeoff-fsm_exec-is-action1_ato-1-0-275) (autotakeoff-in_start_call-is-yes_ato-1-0-275) (fault-count-3_lost_ato-1-0-275_checkpoint1_n0) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_exec-is-action2_ato-1-0-275) (not (autotakeoff-fsm_exec-is-action1_ato-1-0-275)) (not (fault-count-3_lost_ato-1-0-275_checkpoint1_n0)) (not (dominates-3_hyp1_lost_ato-1-0-275_checkpoint1))))
 (:action autotakeoff-takeoff_fcl_finished-flightcontrol-fcl-event-finished-0_ato-1-0-275_heli0_heli0_obs4
  :parameters ()
  :precondition (and (pending_obs4) (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_state-is-takeoff_ato-1-0-275) (autotakeoff-fsm_exec-is-nothing_ato-1-0-275) (not_at_end_constraint0))
  :effect (and (observed_obs4) (autotakeoff-fsm_exec-is-reaction_finished_1_ato-1-0-275) (not (pending_obs4)) (not (autotakeoff-fsm_exec-is-nothing_ato-1-0-275))))
 (:action autotakeoff-takeoff_fcl_finished-flightcontrol-fcl-event-finished-1_ato-1-0-275_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-finished_n0) (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_state-is-takeoff_ato-1-0-275) (autotakeoff-fsm_exec-is-nothing_ato-1-0-275) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_exec-is-reaction_finished_1_ato-1-0-275) (not (fault-count-3_lost_heli0_fcl-event-finished_n0)) (not (dominates-3_hyp1_lost_heli0_fcl-event-finished)) (not (autotakeoff-fsm_exec-is-nothing_ato-1-0-275))))
 (:action autotakeoff-takeoff_fcl_finished_reaction1-0_ato-1-0-275_obs5
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_state-is-takeoff_ato-1-0-275) (autotakeoff-fsm_exec-is-reaction_finished_1_ato-1-0-275) (pending_obs5) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_exec-is-action1_ato-1-0-275) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-1-0-275) (observed_obs5) (not (autotakeoff-fsm_state-is-takeoff_ato-1-0-275)) (not (autotakeoff-fsm_exec-is-reaction_finished_1_ato-1-0-275)) (not (pending_obs5))))
 (:action autotakeoff-takeoff_fcl_finished_reaction1-1_ato-1-0-275_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_state-is-takeoff_ato-1-0-275) (autotakeoff-fsm_exec-is-reaction_finished_1_ato-1-0-275) (fault-count-3_lost_ato-1-0-275_checkpoint2_n0) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_exec-is-action1_ato-1-0-275) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-1-0-275) (not (autotakeoff-fsm_state-is-takeoff_ato-1-0-275)) (not (autotakeoff-fsm_exec-is-reaction_finished_1_ato-1-0-275)) (not (fault-count-3_lost_ato-1-0-275_checkpoint2_n0))))
 (:action autotakeoff-takeoff_fcl_error_1-flightcontrol-fcl-event-not_accepted-1_ato-1-0-275_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-not_accepted_n0) (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_state-is-takeoff_ato-1-0-275) (autotakeoff-fsm_exec-is-nothing_ato-1-0-275) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_exec-is-reaction_error_1_ato-1-0-275) (not (fault-count-3_lost_heli0_fcl-event-not_accepted_n0)) (not (autotakeoff-fsm_exec-is-nothing_ato-1-0-275))))
 (:action autotakeoff-takeoff_fcl_cancel_1-flightcontrol-fcl-event-canceled-1_ato-1-0-275_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-canceled_n0) (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_state-is-takeoff_ato-1-0-275) (autotakeoff-fsm_exec-is-nothing_ato-1-0-275) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_exec-is-reaction_cancel_1_ato-1-0-275) (not (fault-count-3_lost_heli0_fcl-event-canceled_n0)) (not (autotakeoff-fsm_exec-is-nothing_ato-1-0-275))))
 (:action autotakeoff-takeoff_fcl_cancel_2-flightcontrol-fcl-event-manual-1_ato-1-0-275_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-manual_n0) (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_state-is-takeoff_ato-1-0-275) (autotakeoff-fsm_exec-is-nothing_ato-1-0-275) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_exec-is-reaction_cancel_1_ato-1-0-275) (not (fault-count-3_lost_heli0_fcl-event-manual_n0)) (not (autotakeoff-fsm_exec-is-nothing_ato-1-0-275))))
 (:action autotakeoff-takeoff_idle-0_ato-1-0-275_obs1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_state-is-takeoff_ato-1-0-275) (autotakeoff-fsm_exec-is-nothing_ato-1-0-275) (pending_obs1) (not_at_end_constraint0))
  :effect (and (observed_obs1) (not (pending_obs1))))
 (:action autotakeoff-takeoff_idle-0_ato-1-0-275_obs3
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_state-is-takeoff_ato-1-0-275) (autotakeoff-fsm_exec-is-nothing_ato-1-0-275) (pending_obs3) (not_at_end_constraint0))
  :effect (and (observed_obs3) (not (pending_obs3))))
 (:action autotakeoff-go_to_final_altitude_action1_no_climb-1_ato-1-0-275_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_exec-is-action1_ato-1-0-275) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-1-0-275) (autotakeoff-in_start_call-is-no_ato-1-0-275) (fault-count-3_lost_ato-1-0-275_checkpoint7_n0) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_exec-is-action2-exit_ato-1-0-275) (not (autotakeoff-fsm_exec-is-action1_ato-1-0-275)) (not (fault-count-3_lost_ato-1-0-275_checkpoint7_n0))))
 (:action autotakeoff-go_to_final_altitude_action1_climb-0_ato-1-0-275_obs6
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_exec-is-action1_ato-1-0-275) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-1-0-275) (autotakeoff-in_start_call-is-no_ato-1-0-275) (pending_obs6) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_exec-is-action2-climb_ato-1-0-275) (observed_obs6) (not (autotakeoff-fsm_exec-is-action1_ato-1-0-275)) (not (pending_obs6))))
 (:action autotakeoff-go_to_final_altitude_action1_climb-1_ato-1-0-275_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_exec-is-action1_ato-1-0-275) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-1-0-275) (autotakeoff-in_start_call-is-no_ato-1-0-275) (fault-count-3_lost_ato-1-0-275_checkpoint5_n0) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_exec-is-action2-climb_ato-1-0-275) (not (autotakeoff-fsm_exec-is-action1_ato-1-0-275)) (not (fault-count-3_lost_ato-1-0-275_checkpoint5_n0))))
 (:action autotakeoff-go_to_final_altitude_climb_ok_ato-1-0-275
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-1-0-275) (autotakeoff-in_start_call-is-no_ato-1-0-275) (autotakeoff-fsm_exec-is-action2-climb_ato-1-0-275) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_exec-is-nothing_ato-1-0-275) (not (autotakeoff-fsm_exec-is-action2-climb_ato-1-0-275))))
 (:action autotakeoff-go_to_final_altitude_fcl_finished-flightcontrol-fcl-event-finished-0_ato-1-0-275_heli0_heli0_obs4
  :parameters ()
  :precondition (and (pending_obs4) (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_exec-is-nothing_ato-1-0-275) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-1-0-275) (not_at_end_constraint0))
  :effect (and (observed_obs4) (autotakeoff-fsm_exec-is-reaction_finished_1_ato-1-0-275) (not (pending_obs4)) (not (autotakeoff-fsm_exec-is-nothing_ato-1-0-275))))
 (:action autotakeoff-go_to_final_altitude_fcl_finished-flightcontrol-fcl-event-finished-1_ato-1-0-275_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-finished_n0) (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_exec-is-nothing_ato-1-0-275) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-1-0-275) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_exec-is-reaction_finished_1_ato-1-0-275) (not (fault-count-3_lost_heli0_fcl-event-finished_n0)) (not (dominates-3_hyp1_lost_heli0_fcl-event-finished)) (not (autotakeoff-fsm_exec-is-nothing_ato-1-0-275))))
 (:action autotakeoff-go_to_final_altitude_fcl_finished_reaction1-0_ato-1-0-275_obs7
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_exec-is-reaction_finished_1_ato-1-0-275) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-1-0-275) (pending_obs7) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_exec-is-reaction_finished_2_ato-1-0-275) (observed_obs7) (not (autotakeoff-fsm_exec-is-reaction_finished_1_ato-1-0-275)) (not (pending_obs7))))
 (:action autotakeoff-go_to_final_altitude_fcl_finished_reaction1-1_ato-1-0-275_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_exec-is-reaction_finished_1_ato-1-0-275) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-1-0-275) (fault-count-3_lost_ato-1-0-275_checkpoint6_n0) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_exec-is-reaction_finished_2_ato-1-0-275) (not (autotakeoff-fsm_exec-is-reaction_finished_1_ato-1-0-275)) (not (fault-count-3_lost_ato-1-0-275_checkpoint6_n0))))
 (:action autotakeoff-go_to_final_altitude_fcl_error_1-flightcontrol-fcl-event-not_accepted-1_ato-1-0-275_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-not_accepted_n0) (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_exec-is-nothing_ato-1-0-275) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-1-0-275) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_exec-is-reaction_error_1_ato-1-0-275) (not (fault-count-3_lost_heli0_fcl-event-not_accepted_n0)) (not (autotakeoff-fsm_exec-is-nothing_ato-1-0-275))))
 (:action autotakeoff-go_to_final_altitude_fcl_cancel_1-flightcontrol-fcl-event-canceled-1_ato-1-0-275_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-canceled_n0) (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_exec-is-nothing_ato-1-0-275) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-1-0-275) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_exec-is-reaction_cancel_1_ato-1-0-275) (not (fault-count-3_lost_heli0_fcl-event-canceled_n0)) (not (autotakeoff-fsm_exec-is-nothing_ato-1-0-275))))
 (:action autotakeoff-go_to_final_altitude_fcl_cancel_2-flightcontrol-fcl-event-manual-1_ato-1-0-275_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-manual_n0) (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_exec-is-nothing_ato-1-0-275) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-1-0-275) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_exec-is-reaction_cancel_1_ato-1-0-275) (not (fault-count-3_lost_heli0_fcl-event-manual_n0)) (not (autotakeoff-fsm_exec-is-nothing_ato-1-0-275))))
 (:action navtopoint-start_decouple_idle_time_out_nav-1-0-275
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_state-is-start_decouple_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (not_at_end_constraint0))
  :effect (and (navtopoint-fsm_exec-is-action1_nav-1-0-275) (navtopoint-fsm_state-is-plan_path_nav-1-0-275) (not (navtopoint-fsm_state-is-start_decouple_nav-1-0-275)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275))))
 (:action navtopoint-plan_path_action1_checkpoint1-0_nav-1-0-275_obs10
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-action1_nav-1-0-275) (navtopoint-fsm_state-is-plan_path_nav-1-0-275) (pending_obs10) (not_at_end_constraint0))
  :effect (and (navtopoint-fsm_exec-is-action2_nav-1-0-275) (observed_obs10) (not (navtopoint-fsm_exec-is-action1_nav-1-0-275)) (not (pending_obs10))))
 (:action navtopoint-plan_path_action1_checkpoint1-1_nav-1-0-275_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-action1_nav-1-0-275) (navtopoint-fsm_state-is-plan_path_nav-1-0-275) (fault-count-3_lost_nav-1-0-275_checkpoint1_n0) (not_at_end_constraint0))
  :effect (and (navtopoint-fsm_exec-is-action2_nav-1-0-275) (not (navtopoint-fsm_exec-is-action1_nav-1-0-275)) (not (fault-count-3_lost_nav-1-0-275_checkpoint1_n0))))
 (:action navtopoint-plan_path_action2_checkpoint4a-0_nav-1-0-275_obs11
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_state-is-plan_path_nav-1-0-275) (navtopoint-fsm_exec-is-action2_nav-1-0-275) (navtopoint-in_start_call-is-no_nav-1-0-275) (pending_obs11) (not_at_end_constraint0))
  :effect (and (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-wait_for_go_nav-1-0-275) (observed_obs11) (not (navtopoint-fsm_state-is-plan_path_nav-1-0-275)) (not (navtopoint-fsm_exec-is-action2_nav-1-0-275)) (not (pending_obs11))))
 (:action navtopoint-plan_path_action2_checkpoint4a-1_nav-1-0-275_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_state-is-plan_path_nav-1-0-275) (navtopoint-fsm_exec-is-action2_nav-1-0-275) (navtopoint-in_start_call-is-no_nav-1-0-275) (fault-count-3_lost_nav-1-0-275_checkpoint4_n0) (not_at_end_constraint0))
  :effect (and (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-wait_for_go_nav-1-0-275) (not (navtopoint-fsm_state-is-plan_path_nav-1-0-275)) (not (navtopoint-fsm_exec-is-action2_nav-1-0-275)) (not (fault-count-3_lost_nav-1-0-275_checkpoint4_n0))))
 (:action navtopoint-plan_path_action2_checkpoint4b-0_nav-1-0-275_obs11
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_state-is-plan_path_nav-1-0-275) (navtopoint-fsm_exec-is-action2_nav-1-0-275) (pending_obs11) (not_at_end_constraint0))
  :effect (and (navtopoint-fsm_exec-is-action1_nav-1-0-275) (observed_obs11) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (not (navtopoint-fsm_state-is-plan_path_nav-1-0-275)) (not (navtopoint-fsm_exec-is-action2_nav-1-0-275)) (not (pending_obs11))))
 (:action navtopoint-plan_path_action2_checkpoint4b-1_nav-1-0-275_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_state-is-plan_path_nav-1-0-275) (navtopoint-fsm_exec-is-action2_nav-1-0-275) (fault-count-3_lost_nav-1-0-275_checkpoint4_n0) (not_at_end_constraint0))
  :effect (and (navtopoint-fsm_exec-is-action1_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (not (navtopoint-fsm_state-is-plan_path_nav-1-0-275)) (not (navtopoint-fsm_exec-is-action2_nav-1-0-275)) (not (fault-count-3_lost_nav-1-0-275_checkpoint4_n0))))
 (:action navtopoint-wait_for_go_ok_nav-1-0-275
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-wait_for_go_nav-1-0-275) (not_at_end_constraint0))
  :effect (and (navtopoint-fsm_exec-is-action1_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (navtopoint-fsm_state-is-wait_for_go_nav-1-0-275))))
 (:action navtopoint-fly_path_action1_proxy_init_ok-fly3d-call_set_args_nav-1-0-275_f3d-1-0-364_heli0_f3d-1-0-364_nav-1-0-275
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-action1_nav-1-0-275) (navtopoint-in_start_call-is-no_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (fly3d-mode-is-pre_init_f3d-1-0-364) (not_at_end_constraint0))
  :effect (and (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fly3d-mode-is-processing_f3d-1-0-364) (called-by_f3d-1-0-364_nav-1-0-275) (not (navtopoint-fsm_exec-is-action1_nav-1-0-275)) (not (fly3d-mode-is-pre_init_f3d-1-0-364))))
 (:action navtopoint-fly_path_fly3d_ready-fly3d-init_ok-0_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_nav-1-0-275_obs12
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fly3d-mode-is-processing_f3d-1-0-364) (called-by_f3d-1-0-364_nav-1-0-275) (pending_obs12) (not_at_end_constraint0))
  :effect (and (navtopoint-fsm_exec-is-reaction_f3d_ready_nav-1-0-275) (fly3d-mode-is-ready_f3d-1-0-364) (observed_obs12) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fly3d-mode-is-processing_f3d-1-0-364)) (not (pending_obs12))))
 (:action navtopoint-fly_path_fly3d_ready-fly3d-init_ok-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_nav-1-0-275_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fly3d-mode-is-processing_f3d-1-0-364) (called-by_f3d-1-0-364_nav-1-0-275) (fault-count-4_lost_f3d-1-0-364_created_nav-1-0-275_n0) (not_at_end_constraint0))
  :effect (and (navtopoint-fsm_exec-is-reaction_f3d_ready_nav-1-0-275) (fly3d-mode-is-ready_f3d-1-0-364) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fly3d-mode-is-processing_f3d-1-0-364)) (not (fault-count-4_lost_f3d-1-0-364_created_nav-1-0-275_n0))))
 (:action navtopoint-fly_path_fly3d_ready_call_start-fly3d-call_start_nav-1-0-275_f3d-1-0-364_f3d-1-0-364
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_ready_nav-1-0-275) (fly3d-mode-is-ready_f3d-1-0-364) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-start_f3d-1-0-364) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (fly3d-in_start_call-is-yes_f3d-1-0-364) (not (navtopoint-fsm_exec-is-reaction_f3d_ready_nav-1-0-275)) (not (fly3d-mode-is-ready_f3d-1-0-364))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_starting_yaw_command_ok_sync_nav-1-0-275_f3d-1-0-364_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fly3d-in_start_call-is-yes_f3d-1-0-364) (not_at_end_constraint0))
  :effect (and (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not (fly3d-fsm_exec-is-action1_f3d-1-0-364)) (not (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364)) (not (fly3d-in_start_call-is-yes_f3d-1-0-364))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_starting_yaw_command_checkpoint12_sync-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint12_n0) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fly3d-in_start_call-is-yes_f3d-1-0-364) (not_at_end_constraint0))
  :effect (and (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not (fly3d-fsm_exec-is-action1_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_checkpoint12_n0)) (not (fly3d-in_start_call-is-yes_f3d-1-0-364))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_first_trajectory_checkpoint20_sync-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint20_n0) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fly3d-in_start_call-is-yes_f3d-1-0-364) (not_at_end_constraint0))
  :effect (and (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not (fly3d-fsm_exec-is-action1_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_checkpoint20_n0)) (not (fly3d-trajectory-not-sent_f3d-1-0-364)) (not (fly3d-in_start_call-is-yes_f3d-1-0-364))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_first_trajectory_checkpoint21_sync-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint21_n0) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fly3d-in_start_call-is-yes_f3d-1-0-364) (not_at_end_constraint0))
  :effect (and (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-1-0-364) (not (fly3d-fsm_exec-is-action1_f3d-1-0-364)) (not (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364)) (not (fly3d-trajectory-not-sent_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_checkpoint21_n0)) (not (fly3d-in_start_call-is-yes_f3d-1-0-364))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_first_trajectory_checkpoint21_after22_sync-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint21_n0) (fly3d-fsm_exec-is-action2_f3d-1-0-364) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fly3d-in_start_call-is-yes_f3d-1-0-364) (not_at_end_constraint0))
  :effect (and (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-1-0-364) (not (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364)) (not (fly3d-trajectory-not-sent_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_checkpoint21_n0)) (not (fly3d-fsm_exec-is-action2_f3d-1-0-364)) (not (fly3d-in_start_call-is-yes_f3d-1-0-364))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_first_trajectory_busy_sync_nav-1-0-275_f3d-1-0-364_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fly3d-in_start_call-is-yes_f3d-1-0-364) (not_at_end_constraint0))
  :effect (and (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-trajectory-not-sent_f3d-1-0-364) (not (fly3d-fsm_exec-is-action1_f3d-1-0-364)) (not (fly3d-in_start_call-is-yes_f3d-1-0-364))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_first_trajectory_busy_after22_sync_nav-1-0-275_f3d-1-0-364_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fly3d-fsm_exec-is-action2_f3d-1-0-364) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fly3d-in_start_call-is-yes_f3d-1-0-364) (not_at_end_constraint0))
  :effect (and (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-trajectory-not-sent_f3d-1-0-364) (not (fly3d-fsm_exec-is-action2_f3d-1-0-364)) (not (fly3d-in_start_call-is-yes_f3d-1-0-364))))
 (:action navtopoint-fly_path_fly3d_sync_done-fly3d-start_exit_nav-1-0-275_f3d-1-0-364_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-start_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-done_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-in_send_starting_yaw_command_fcl_cancel_reaction1-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364) (fly3d-fsm_exec-is-reaction_cancel_1_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_task-done_n0) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-done_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-1-0-364_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-in_wait_for_yaw_finish_fcl_cancel_reaction1-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-1-0-364) (fly3d-fsm_exec-is-reaction_cancel_1_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_task-done_n0) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-done_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-1-0-364_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-in_wait_trajectory_end_fcl_finished_reaction2c-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-1-0-364) (fly3d-fsm_exec-is-reaction_finished_2_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_task-done_n0) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-done_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-1-0-364_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-enter_turn_to_goal_heading_action2-exit-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action2-exit_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_task-done_n0) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-done_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-1-0-364_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-goal_point_wait_cmd_continue_exit-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-fsm_state-is-goal_point_wait_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_task-done_n0) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-done_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-1-0-364_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-goal_point_wait_idle_exit-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-fsm_state-is-goal_point_wait_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_task-done_n0) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-done_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-1-0-364_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-global_fcl_cancel_reaction1-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-global_reaction_cancel_1_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_task-done_n0) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-done_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-1-0-364_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_done_1-fly3d-call_destroy_when_done-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fly3d-mode-is-done_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_destroyed_n0) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-1-0-275) (not_at_end_constraint0))
  :effect (and (navtopoint-fsm_exec-is-reaction_f3d_done_2_nav-1-0-275) (not (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364)) (not (fly3d-mode-is-done_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_destroyed_n0)) (not (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-1-0-275))))
 (:action navtopoint-fly_path_fly3d_sync_fail-fly3d-init_fail_nav-1-0-275_f3d-1-0-364_f3d-1-0-364
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fly3d-mode-is-processing_f3d-1-0-364) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fly3d-mode-is-processing_f3d-1-0-364))))
 (:action navtopoint-fly_path_fly3d_sync_fail-fly3d-fail_in_start_call_nav-1-0-275_f3d-1-0-364_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fly3d-in_start_call-is-yes_f3d-1-0-364) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_turn_to_segment_heading_fail_service-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-service_n0) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-1-0-364_fail-service_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_turn_to_segment_heading_fail_specific_221-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-specific-221_n0) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-1-0-364_fail-specific-221_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_turn_to_segment_heading_fail_specific_222-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-specific-222_n0) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-1-0-364_fail-specific-222_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_turn_to_segment_heading_fail_specific_223-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-specific-223_n0) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-1-0-364_fail-specific-223_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_send_starting_yaw_command_fail_service-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-service_n0) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-1-0-364_fail-service_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-in_send_starting_yaw_command_fcl_error_reaction1-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364) (fly3d-fsm_exec-is-reaction_error_1_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-specific-211_n0) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-1-0-364_fail-specific-211_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-in_wait_for_yaw_finish_fcl_error_reaction1-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-1-0-364) (fly3d-fsm_exec-is-reaction_error_1_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-specific-211_n0) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-1-0-364_fail-specific-211_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_send_first_trajectory_fail_service-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-service_n0) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-1-0-364_fail-service_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_send_first_trajectory_fail_specific_220-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-specific-220_n0) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-1-0-364_fail-specific-220_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-in_send_first_trajectory_fcl_finished_reaction1-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fly3d-fsm_exec-is-reaction_finished_1_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-specific-213_n0) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-1-0-364_fail-specific-213_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_turn_to_goal_heading_fail_service-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-service_n0) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-1-0-364_fail-service_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_turn_to_goal_heading_action2-fail-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action2-fail_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-specific-214_n0) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-1-0-364_fail-specific-214_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_goal_point_wait_fail_service-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_state-is-goal_point_wait_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-service_n0) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-1-0-364_fail-service_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-global_fcl_error_reaction1-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-global_reaction_error_1_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-specific-210_n0) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-1-0-364_fail-specific-210_n0))))
 (:action navtopoint-fly_path_fly3d_subtask_fail_1-fly3d-call_destroy_when_failed-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_destroyed_n0) (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not_at_end_constraint0))
  :effect (and (navtopoint-fsm_exec-is-reaction_f3d_fail_2_nav-1-0-275) (not (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_destroyed_n0)) (not (fly3d-mode-is-failed_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275))))
 (:action missionexec-init-mission-fly3d-call_set_args_heli0_f3d-1-0-364_f3d-1-0-364_missionexecutor
  :parameters ()
  :precondition (and (fly3d-mode-is-pre_init_f3d-1-0-364) (missionexec-mission-idle_heli0) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-processing_f3d-1-0-364) (called-by_f3d-1-0-364_missionexecutor) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-init-call_heli0) (not (fly3d-mode-is-pre_init_f3d-1-0-364)) (not (missionexec-mission-idle_heli0))))
 (:action missionexec-init-mission-autotakeoff-call_set_args_heli0_ato-1-0-275_ato-1-0-275_missionexecutor
  :parameters ()
  :precondition (and (missionexec-mission-idle_heli0) (autotakeoff-mode-is-pre_init_ato-1-0-275) (not_at_end_constraint0))
  :effect (and (missionexec-mission-init-call_heli0) (missionexec-active-mission_heli0_ato-1-0-275) (autotakeoff-mode-is-processing_ato-1-0-275) (called-by_ato-1-0-275_missionexecutor) (not (missionexec-mission-idle_heli0)) (not (autotakeoff-mode-is-pre_init_ato-1-0-275))))
 (:action missionexec-init-mission-navtopoint-call_set_args_heli0_nav-1-0-275_nav-1-0-275_missionexecutor
  :parameters ()
  :precondition (and (missionexec-mission-idle_heli0) (navtopoint-mode-is-pre_init_nav-1-0-275) (not_at_end_constraint0))
  :effect (and (missionexec-mission-init-call_heli0) (missionexec-active-mission_heli0_nav-1-0-275) (navtopoint-mode-is-processing_nav-1-0-275) (called-by_nav-1-0-275_missionexecutor) (not (missionexec-mission-idle_heli0)) (not (navtopoint-mode-is-pre_init_nav-1-0-275))))
 (:action missionexec-init-mission-ok-fly3d-init_ok-1_heli0_f3d-1-0-364_f3d-1-0-364_missionexecutor_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-processing_f3d-1-0-364) (called-by_f3d-1-0-364_missionexecutor) (fault-count-4_lost_f3d-1-0-364_created_missionexecutor_n0) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-init-call_heli0) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-ready_f3d-1-0-364) (missionexec-mission-ready_heli0) (not (fly3d-mode-is-processing_f3d-1-0-364)) (not (fault-count-4_lost_f3d-1-0-364_created_missionexecutor_n0)) (not (missionexec-mission-init-call_heli0))))
 (:action missionexec-init-mission-ok-autotakeoff-init_ok-0_heli0_ato-1-0-275_ato-1-0-275_missionexecutor_obs0
  :parameters ()
  :precondition (and (missionexec-mission-init-call_heli0) (missionexec-active-mission_heli0_ato-1-0-275) (autotakeoff-mode-is-processing_ato-1-0-275) (called-by_ato-1-0-275_missionexecutor) (pending_obs0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-ready_heli0) (autotakeoff-mode-is-ready_ato-1-0-275) (observed_obs0) (not (missionexec-mission-init-call_heli0)) (not (autotakeoff-mode-is-processing_ato-1-0-275)) (not (pending_obs0))))
 (:action missionexec-init-mission-ok-autotakeoff-init_ok-1_heli0_ato-1-0-275_ato-1-0-275_missionexecutor_n0_n1
  :parameters ()
  :precondition (and (missionexec-mission-init-call_heli0) (missionexec-active-mission_heli0_ato-1-0-275) (autotakeoff-mode-is-processing_ato-1-0-275) (called-by_ato-1-0-275_missionexecutor) (fault-count-4_lost_ato-1-0-275_created_missionexecutor_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-ready_heli0) (autotakeoff-mode-is-ready_ato-1-0-275) (not (missionexec-mission-init-call_heli0)) (not (autotakeoff-mode-is-processing_ato-1-0-275)) (not (fault-count-4_lost_ato-1-0-275_created_missionexecutor_n0))))
 (:action missionexec-init-mission-ok-navtopoint-init_ok-0_heli0_nav-1-0-275_nav-1-0-275_missionexecutor_obs9
  :parameters ()
  :precondition (and (missionexec-mission-init-call_heli0) (missionexec-active-mission_heli0_nav-1-0-275) (navtopoint-mode-is-processing_nav-1-0-275) (called-by_nav-1-0-275_missionexecutor) (pending_obs9) (not_at_end_constraint0))
  :effect (and (missionexec-mission-ready_heli0) (navtopoint-mode-is-ready_nav-1-0-275) (observed_obs9) (not (missionexec-mission-init-call_heli0)) (not (navtopoint-mode-is-processing_nav-1-0-275)) (not (pending_obs9))))
 (:action missionexec-init-mission-ok-navtopoint-init_ok-1_heli0_nav-1-0-275_nav-1-0-275_missionexecutor_n0_n1
  :parameters ()
  :precondition (and (missionexec-mission-init-call_heli0) (missionexec-active-mission_heli0_nav-1-0-275) (navtopoint-mode-is-processing_nav-1-0-275) (called-by_nav-1-0-275_missionexecutor) (fault-count-4_lost_nav-1-0-275_created_missionexecutor_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-ready_heli0) (navtopoint-mode-is-ready_nav-1-0-275) (not (missionexec-mission-init-call_heli0)) (not (navtopoint-mode-is-processing_nav-1-0-275)) (not (fault-count-4_lost_nav-1-0-275_created_missionexecutor_n0))))
 (:action missionexec-init-mission-fail-fly3d-init_fail_heli0_f3d-1-0-364_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-processing_f3d-1-0-364) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-init-call_heli0) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-processing_f3d-1-0-364)) (not (missionexec-mission-init-call_heli0))))
 (:action missionexec-init-mission-fail-fly3d-fail_in_start_call_heli0_f3d-1-0-364_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-in_start_call-is-yes_f3d-1-0-364) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-init-call_heli0) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (missionexec-mission-init-call_heli0))))
 (:action missionexec-init-mission-fail-autotakeoff-init_fail_heli0_ato-1-0-275_ato-1-0-275
  :parameters ()
  :precondition (and (missionexec-mission-init-call_heli0) (missionexec-active-mission_heli0_ato-1-0-275) (autotakeoff-mode-is-processing_ato-1-0-275) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-failed_ato-1-0-275) (not (missionexec-mission-init-call_heli0)) (not (autotakeoff-mode-is-processing_ato-1-0-275))))
 (:action missionexec-init-mission-fail-autotakeoff-fail_in_start_call_heli0_ato-1-0-275_ato-1-0-275
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-in_start_call-is-yes_ato-1-0-275) (missionexec-mission-init-call_heli0) (missionexec-active-mission_heli0_ato-1-0-275) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-failed_ato-1-0-275) (not (autotakeoff-mode-is-running_ato-1-0-275)) (not (missionexec-mission-init-call_heli0))))
 (:action missionexec-init-mission-fail-navtopoint-init_fail_heli0_nav-1-0-275_nav-1-0-275
  :parameters ()
  :precondition (and (missionexec-mission-init-call_heli0) (missionexec-active-mission_heli0_nav-1-0-275) (navtopoint-mode-is-processing_nav-1-0-275) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-1-0-275) (not (missionexec-mission-init-call_heli0)) (not (navtopoint-mode-is-processing_nav-1-0-275))))
 (:action missionexec-init-mission-fail-navtopoint-fail_in_start_call_heli0_nav-1-0-275_nav-1-0-275
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (missionexec-mission-init-call_heli0) (missionexec-active-mission_heli0_nav-1-0-275) (navtopoint-in_start_call-is-yes_nav-1-0-275) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-1-0-275) (not (navtopoint-mode-is-running_nav-1-0-275)) (not (missionexec-mission-init-call_heli0))))
 (:action missionexec-start-mission-fly3d-call_start_heli0_f3d-1-0-364_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-ready_f3d-1-0-364) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-ready_heli0) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-start_f3d-1-0-364) (fly3d-in_start_call-is-yes_f3d-1-0-364) (missionexec-mission-start-call_heli0) (not (fly3d-mode-is-ready_f3d-1-0-364)) (not (missionexec-mission-ready_heli0))))
 (:action missionexec-start-mission-autotakeoff-call_start_heli0_ato-1-0-275_ato-1-0-275
  :parameters ()
  :precondition (and (missionexec-active-mission_heli0_ato-1-0-275) (missionexec-mission-ready_heli0) (autotakeoff-mode-is-ready_ato-1-0-275) (not_at_end_constraint0))
  :effect (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_exec-is-start_ato-1-0-275) (autotakeoff-in_start_call-is-yes_ato-1-0-275) (missionexec-mission-start-call_heli0) (not (missionexec-mission-ready_heli0)) (not (autotakeoff-mode-is-ready_ato-1-0-275))))
 (:action missionexec-start-mission-navtopoint-call_start_heli0_nav-1-0-275_nav-1-0-275
  :parameters ()
  :precondition (and (missionexec-active-mission_heli0_nav-1-0-275) (missionexec-mission-ready_heli0) (navtopoint-mode-is-ready_nav-1-0-275) (not_at_end_constraint0))
  :effect (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-in_start_call-is-yes_nav-1-0-275) (missionexec-mission-start-call_heli0) (navtopoint-fsm_exec-is-start_nav-1-0-275) (not (missionexec-mission-ready_heli0)) (not (navtopoint-mode-is-ready_nav-1-0-275))))
 (:action missionexec-start-mission-ok-fly3d-enter_send_starting_yaw_command_ok_sync_heli0_f3d-1-0-364_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364) (fly3d-in_start_call-is-yes_f3d-1-0-364) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-start-call_heli0) (not_at_end_constraint0))
  :effect (and (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (missionexec-mission-running_heli0) (not (fly3d-fsm_exec-is-action1_f3d-1-0-364)) (not (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364)) (not (fly3d-in_start_call-is-yes_f3d-1-0-364)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-ok-fly3d-enter_send_starting_yaw_command_checkpoint12_sync-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint12_n0) (fly3d-in_start_call-is-yes_f3d-1-0-364) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-start-call_heli0) (not_at_end_constraint0))
  :effect (and (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (missionexec-mission-running_heli0) (not (fly3d-fsm_exec-is-action1_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_checkpoint12_n0)) (not (fly3d-in_start_call-is-yes_f3d-1-0-364)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-ok-fly3d-enter_send_first_trajectory_checkpoint20_sync-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint20_n0) (fly3d-in_start_call-is-yes_f3d-1-0-364) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-start-call_heli0) (not_at_end_constraint0))
  :effect (and (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (missionexec-mission-running_heli0) (not (fly3d-fsm_exec-is-action1_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_checkpoint20_n0)) (not (fly3d-trajectory-not-sent_f3d-1-0-364)) (not (fly3d-in_start_call-is-yes_f3d-1-0-364)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-ok-fly3d-enter_send_first_trajectory_checkpoint21_sync-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint21_n0) (fly3d-in_start_call-is-yes_f3d-1-0-364) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-start-call_heli0) (not_at_end_constraint0))
  :effect (and (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-1-0-364) (missionexec-mission-running_heli0) (not (fly3d-fsm_exec-is-action1_f3d-1-0-364)) (not (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364)) (not (fly3d-trajectory-not-sent_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_checkpoint21_n0)) (not (fly3d-in_start_call-is-yes_f3d-1-0-364)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-ok-fly3d-enter_send_first_trajectory_checkpoint21_after22_sync-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint21_n0) (fly3d-fsm_exec-is-action2_f3d-1-0-364) (fly3d-in_start_call-is-yes_f3d-1-0-364) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-start-call_heli0) (not_at_end_constraint0))
  :effect (and (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-1-0-364) (missionexec-mission-running_heli0) (not (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364)) (not (fly3d-trajectory-not-sent_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_checkpoint21_n0)) (not (fly3d-fsm_exec-is-action2_f3d-1-0-364)) (not (fly3d-in_start_call-is-yes_f3d-1-0-364)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-ok-fly3d-enter_send_first_trajectory_busy_sync_heli0_f3d-1-0-364_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fly3d-in_start_call-is-yes_f3d-1-0-364) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-start-call_heli0) (not_at_end_constraint0))
  :effect (and (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-trajectory-not-sent_f3d-1-0-364) (missionexec-mission-running_heli0) (not (fly3d-fsm_exec-is-action1_f3d-1-0-364)) (not (fly3d-in_start_call-is-yes_f3d-1-0-364)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-ok-fly3d-enter_send_first_trajectory_busy_after22_sync_heli0_f3d-1-0-364_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fly3d-fsm_exec-is-action2_f3d-1-0-364) (fly3d-in_start_call-is-yes_f3d-1-0-364) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-start-call_heli0) (not_at_end_constraint0))
  :effect (and (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-trajectory-not-sent_f3d-1-0-364) (missionexec-mission-running_heli0) (not (fly3d-fsm_exec-is-action2_f3d-1-0-364)) (not (fly3d-in_start_call-is-yes_f3d-1-0-364)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-ok-autotakeoff-takeoff_action2_heli0_ato-1-0-275_ato-1-0-275
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_state-is-takeoff_ato-1-0-275) (autotakeoff-in_start_call-is-yes_ato-1-0-275) (autotakeoff-fsm_exec-is-action2_ato-1-0-275) (missionexec-active-mission_heli0_ato-1-0-275) (missionexec-mission-start-call_heli0) (not_at_end_constraint0))
  :effect (and (autotakeoff-fsm_exec-is-nothing_ato-1-0-275) (autotakeoff-in_start_call-is-no_ato-1-0-275) (missionexec-mission-running_heli0) (not (autotakeoff-in_start_call-is-yes_ato-1-0-275)) (not (autotakeoff-fsm_exec-is-action2_ato-1-0-275)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-ok-navtopoint-start_ok_heli0_nav-1-0-275_nav-1-0-275
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (missionexec-active-mission_heli0_nav-1-0-275) (missionexec-mission-start-call_heli0) (navtopoint-fsm_exec-is-start_nav-1-0-275) (not_at_end_constraint0))
  :effect (and (navtopoint-fsm_state-is-start_decouple_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-in_start_call-is-no_nav-1-0-275) (missionexec-mission-running_heli0) (not (navtopoint-in_start_call-is-yes_nav-1-0-275)) (not (missionexec-mission-start-call_heli0)) (not (navtopoint-fsm_exec-is-start_nav-1-0-275))))
 (:action missionexec-start-mission-done-fly3d-start_exit_heli0_f3d-1-0-364_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-start_f3d-1-0-364) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-start-call_heli0) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-done_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-fail-fly3d-init_fail_heli0_f3d-1-0-364_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-processing_f3d-1-0-364) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-start-call_heli0) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-processing_f3d-1-0-364)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-fail-fly3d-fail_in_start_call_heli0_f3d-1-0-364_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-in_start_call-is-yes_f3d-1-0-364) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-start-call_heli0) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-fail-autotakeoff-init_fail_heli0_ato-1-0-275_ato-1-0-275
  :parameters ()
  :precondition (and (missionexec-active-mission_heli0_ato-1-0-275) (autotakeoff-mode-is-processing_ato-1-0-275) (missionexec-mission-start-call_heli0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-failed_ato-1-0-275) (not (autotakeoff-mode-is-processing_ato-1-0-275)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-fail-autotakeoff-fail_in_start_call_heli0_ato-1-0-275_ato-1-0-275
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-in_start_call-is-yes_ato-1-0-275) (missionexec-active-mission_heli0_ato-1-0-275) (missionexec-mission-start-call_heli0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-failed_ato-1-0-275) (not (autotakeoff-mode-is-running_ato-1-0-275)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-fail-navtopoint-init_fail_heli0_nav-1-0-275_nav-1-0-275
  :parameters ()
  :precondition (and (missionexec-active-mission_heli0_nav-1-0-275) (navtopoint-mode-is-processing_nav-1-0-275) (missionexec-mission-start-call_heli0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-1-0-275) (not (navtopoint-mode-is-processing_nav-1-0-275)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-fail-navtopoint-fail_in_start_call_heli0_nav-1-0-275_nav-1-0-275
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (missionexec-active-mission_heli0_nav-1-0-275) (navtopoint-in_start_call-is-yes_nav-1-0-275) (missionexec-mission-start-call_heli0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-1-0-275) (not (navtopoint-mode-is-running_nav-1-0-275)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-mission-done-fly3d-in_send_starting_yaw_command_fcl_cancel_reaction1-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364) (fly3d-fsm_exec-is-reaction_cancel_1_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_task-done_n0) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-running_heli0) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-done_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_task-done_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-done-fly3d-in_wait_for_yaw_finish_fcl_cancel_reaction1-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-1-0-364) (fly3d-fsm_exec-is-reaction_cancel_1_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_task-done_n0) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-running_heli0) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-done_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_task-done_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-done-fly3d-in_wait_trajectory_end_fcl_finished_reaction2c-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-1-0-364) (fly3d-fsm_exec-is-reaction_finished_2_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_task-done_n0) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-running_heli0) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-done_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_task-done_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-done-fly3d-enter_turn_to_goal_heading_action2-exit-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action2-exit_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_task-done_n0) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-running_heli0) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-done_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_task-done_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-done-fly3d-goal_point_wait_cmd_continue_exit-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-fsm_state-is-goal_point_wait_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_task-done_n0) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-running_heli0) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-done_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_task-done_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-done-fly3d-goal_point_wait_idle_exit-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-fsm_state-is-goal_point_wait_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_task-done_n0) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-running_heli0) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-done_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_task-done_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-done-fly3d-global_fcl_cancel_reaction1-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-global_reaction_cancel_1_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_task-done_n0) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-running_heli0) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-done_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_task-done_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-done-autotakeoff-takeoff_fcl_cancel_reaction1-1_heli0_ato-1-0-275_ato-1-0-275_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_state-is-takeoff_ato-1-0-275) (autotakeoff-fsm_exec-is-reaction_cancel_1_ato-1-0-275) (missionexec-active-mission_heli0_ato-1-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_ato-1-0-275_task-done_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-done_ato-1-0-275) (not (autotakeoff-mode-is-running_ato-1-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_ato-1-0-275_task-done_n0)) (not (dominates-3_hyp1_lost_ato-1-0-275_task-done))))
 (:action missionexec-mission-done-autotakeoff-go_to_final_altitude_action2_exit-1_heli0_ato-1-0-275_ato-1-0-275_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-1-0-275) (autotakeoff-in_start_call-is-no_ato-1-0-275) (autotakeoff-fsm_exec-is-action2-exit_ato-1-0-275) (missionexec-active-mission_heli0_ato-1-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_ato-1-0-275_task-done_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-done_ato-1-0-275) (not (autotakeoff-mode-is-running_ato-1-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_ato-1-0-275_task-done_n0)) (not (dominates-3_hyp1_lost_ato-1-0-275_task-done))))
 (:action missionexec-mission-done-autotakeoff-go_to_final_altitude_fcl_finished_reaction2-1_heli0_ato-1-0-275_ato-1-0-275_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-1-0-275) (autotakeoff-fsm_exec-is-reaction_finished_2_ato-1-0-275) (missionexec-active-mission_heli0_ato-1-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_ato-1-0-275_task-done_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-done_ato-1-0-275) (not (autotakeoff-mode-is-running_ato-1-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_ato-1-0-275_task-done_n0)) (not (dominates-3_hyp1_lost_ato-1-0-275_task-done))))
 (:action missionexec-mission-done-autotakeoff-go_to_final_altitude_fcl_cancel_reaction1-1_heli0_ato-1-0-275_ato-1-0-275_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-1-0-275) (autotakeoff-fsm_exec-is-reaction_cancel_1_ato-1-0-275) (missionexec-active-mission_heli0_ato-1-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_ato-1-0-275_task-done_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-done_ato-1-0-275) (not (autotakeoff-mode-is-running_ato-1-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_ato-1-0-275_task-done_n0)) (not (dominates-3_hyp1_lost_ato-1-0-275_task-done))))
 (:action missionexec-mission-done-navtopoint-wait_for_go_exit-1_heli0_nav-1-0-275_nav-1-0-275_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-wait_for_go_nav-1-0-275) (missionexec-active-mission_heli0_nav-1-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-1-0-275_task-done_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-done_nav-1-0-275) (not (navtopoint-mode-is-running_nav-1-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-1-0-275_task-done_n0))))
 (:action missionexec-mission-done-navtopoint-fly_path_fly3d_done_2-1_heli0_nav-1-0-275_nav-1-0-275_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fsm_exec-is-reaction_f3d_done_2_nav-1-0-275) (missionexec-active-mission_heli0_nav-1-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-1-0-275_task-done_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-done_nav-1-0-275) (not (navtopoint-mode-is-running_nav-1-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-1-0-275_task-done_n0))))
 (:action missionexec-mission-failed-fly3d-enter_turn_to_segment_heading_fail_service-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-service_n0) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-running_heli0) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_fail-service_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-enter_turn_to_segment_heading_fail_specific_221-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-specific-221_n0) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-running_heli0) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_fail-specific-221_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-enter_turn_to_segment_heading_fail_specific_222-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-specific-222_n0) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-running_heli0) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_fail-specific-222_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-enter_turn_to_segment_heading_fail_specific_223-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-specific-223_n0) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-running_heli0) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_fail-specific-223_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-enter_send_starting_yaw_command_fail_service-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-service_n0) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-running_heli0) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_fail-service_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-in_send_starting_yaw_command_fcl_error_reaction1-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364) (fly3d-fsm_exec-is-reaction_error_1_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-specific-211_n0) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-running_heli0) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_fail-specific-211_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-in_wait_for_yaw_finish_fcl_error_reaction1-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-1-0-364) (fly3d-fsm_exec-is-reaction_error_1_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-specific-211_n0) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-running_heli0) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_fail-specific-211_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-enter_send_first_trajectory_fail_service-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-service_n0) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-running_heli0) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_fail-service_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-enter_send_first_trajectory_fail_specific_220-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-specific-220_n0) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-running_heli0) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_fail-specific-220_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-in_send_first_trajectory_fcl_finished_reaction1-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fly3d-fsm_exec-is-reaction_finished_1_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-specific-213_n0) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-running_heli0) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_fail-specific-213_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-enter_turn_to_goal_heading_fail_service-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-service_n0) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-running_heli0) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_fail-service_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-enter_turn_to_goal_heading_action2-fail-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action2-fail_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-specific-214_n0) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-running_heli0) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_fail-specific-214_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-enter_goal_point_wait_fail_service-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_state-is-goal_point_wait_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-service_n0) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-running_heli0) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_fail-service_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-global_fcl_error_reaction1-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-global_reaction_error_1_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-specific-210_n0) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-running_heli0) (not_at_end_constraint0))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_fail-specific-210_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-autotakeoff-takeoff_fcl_error_reaction1-1_heli0_ato-1-0-275_ato-1-0-275_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_state-is-takeoff_ato-1-0-275) (autotakeoff-fsm_exec-is-reaction_error_1_ato-1-0-275) (missionexec-active-mission_heli0_ato-1-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_ato-1-0-275_fail-specific-210_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-failed_ato-1-0-275) (not (autotakeoff-mode-is-running_ato-1-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_ato-1-0-275_fail-specific-210_n0))))
 (:action missionexec-mission-failed-autotakeoff-go_to_final_altitude_action1_fail_service-1_heli0_ato-1-0-275_ato-1-0-275_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_exec-is-action1_ato-1-0-275) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-1-0-275) (autotakeoff-in_start_call-is-no_ato-1-0-275) (missionexec-active-mission_heli0_ato-1-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_ato-1-0-275_fail-service_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-failed_ato-1-0-275) (not (autotakeoff-mode-is-running_ato-1-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_ato-1-0-275_fail-service_n0))))
 (:action missionexec-mission-failed-autotakeoff-go_to_final_altitude_action1_fail_specific_101-1_heli0_ato-1-0-275_ato-1-0-275_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_exec-is-action1_ato-1-0-275) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-1-0-275) (autotakeoff-in_start_call-is-no_ato-1-0-275) (missionexec-active-mission_heli0_ato-1-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_ato-1-0-275_fail-specific-101_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-failed_ato-1-0-275) (not (autotakeoff-mode-is-running_ato-1-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_ato-1-0-275_fail-specific-101_n0))))
 (:action missionexec-mission-failed-autotakeoff-go_to_final_altitude_action1_fail_specific_102-1_heli0_ato-1-0-275_ato-1-0-275_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_exec-is-action1_ato-1-0-275) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-1-0-275) (autotakeoff-in_start_call-is-no_ato-1-0-275) (missionexec-active-mission_heli0_ato-1-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_ato-1-0-275_fail-specific-102_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-failed_ato-1-0-275) (not (autotakeoff-mode-is-running_ato-1-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_ato-1-0-275_fail-specific-102_n0))))
 (:action missionexec-mission-failed-autotakeoff-go_to_final_altitude_climb_fail_service-1_heli0_ato-1-0-275_ato-1-0-275_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-1-0-275) (autotakeoff-in_start_call-is-no_ato-1-0-275) (autotakeoff-fsm_exec-is-action2-climb_ato-1-0-275) (missionexec-active-mission_heli0_ato-1-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_ato-1-0-275_fail-service_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-failed_ato-1-0-275) (not (autotakeoff-mode-is-running_ato-1-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_ato-1-0-275_fail-service_n0))))
 (:action missionexec-mission-failed-autotakeoff-go_to_final_altitude_fcl_error_reaction-1_heli0_ato-1-0-275_ato-1-0-275_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-1-0-275) (autotakeoff-fsm_exec-is-reaction_error_1_ato-1-0-275) (missionexec-active-mission_heli0_ato-1-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_ato-1-0-275_fail-specific-210_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-failed_ato-1-0-275) (not (autotakeoff-mode-is-running_ato-1-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_ato-1-0-275_fail-specific-210_n0))))
 (:action missionexec-mission-failed-navtopoint-plan_path_action1_fail_service-1_heli0_nav-1-0-275_nav-1-0-275_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-action1_nav-1-0-275) (navtopoint-fsm_state-is-plan_path_nav-1-0-275) (navtopoint-in_start_call-is-no_nav-1-0-275) (missionexec-active-mission_heli0_nav-1-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-1-0-275_fail-service_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-1-0-275) (not (navtopoint-mode-is-running_nav-1-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-1-0-275_fail-service_n0))))
 (:action missionexec-mission-failed-navtopoint-plan_path_action1_fail_specific_101-1_heli0_nav-1-0-275_nav-1-0-275_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-action1_nav-1-0-275) (navtopoint-fsm_state-is-plan_path_nav-1-0-275) (navtopoint-in_start_call-is-no_nav-1-0-275) (missionexec-active-mission_heli0_nav-1-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-1-0-275_fail-specific-101_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-1-0-275) (not (navtopoint-mode-is-running_nav-1-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-1-0-275_fail-specific-101_n0))))
 (:action missionexec-mission-failed-navtopoint-plan_path_action1_fail_specific_102-1_heli0_nav-1-0-275_nav-1-0-275_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-action1_nav-1-0-275) (navtopoint-fsm_state-is-plan_path_nav-1-0-275) (navtopoint-in_start_call-is-no_nav-1-0-275) (missionexec-active-mission_heli0_nav-1-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-1-0-275_fail-specific-102_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-1-0-275) (not (navtopoint-mode-is-running_nav-1-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-1-0-275_fail-specific-102_n0))))
 (:action missionexec-mission-failed-navtopoint-plan_path_action2_fail_service-1_heli0_nav-1-0-275_nav-1-0-275_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_state-is-plan_path_nav-1-0-275) (navtopoint-fsm_exec-is-action2_nav-1-0-275) (navtopoint-in_start_call-is-no_nav-1-0-275) (missionexec-active-mission_heli0_nav-1-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-1-0-275_fail-service_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-1-0-275) (not (navtopoint-mode-is-running_nav-1-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-1-0-275_fail-service_n0))))
 (:action missionexec-mission-failed-navtopoint-plan_path_action2_fail_specific_402-1_heli0_nav-1-0-275_nav-1-0-275_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_state-is-plan_path_nav-1-0-275) (navtopoint-fsm_exec-is-action2_nav-1-0-275) (navtopoint-in_start_call-is-no_nav-1-0-275) (missionexec-active-mission_heli0_nav-1-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-1-0-275_fail-specific-402_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-1-0-275) (not (navtopoint-mode-is-running_nav-1-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-1-0-275_fail-specific-402_n0))))
 (:action missionexec-mission-failed-navtopoint-plan_path_action2_fail_specific_403-1_heli0_nav-1-0-275_nav-1-0-275_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_state-is-plan_path_nav-1-0-275) (navtopoint-fsm_exec-is-action2_nav-1-0-275) (navtopoint-in_start_call-is-no_nav-1-0-275) (missionexec-active-mission_heli0_nav-1-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-1-0-275_fail-specific-403_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-1-0-275) (not (navtopoint-mode-is-running_nav-1-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-1-0-275_fail-specific-403_n0))))
 (:action missionexec-mission-failed-navtopoint-plan_path_action2_fail_specific_404-1_heli0_nav-1-0-275_nav-1-0-275_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_state-is-plan_path_nav-1-0-275) (navtopoint-fsm_exec-is-action2_nav-1-0-275) (navtopoint-in_start_call-is-no_nav-1-0-275) (missionexec-active-mission_heli0_nav-1-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-1-0-275_fail-specific-404_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-1-0-275) (not (navtopoint-mode-is-running_nav-1-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-1-0-275_fail-specific-404_n0))))
 (:action missionexec-mission-failed-navtopoint-fly_path_action1_fail_service-1_heli0_nav-1-0-275_nav-1-0-275_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-action1_nav-1-0-275) (navtopoint-in_start_call-is-no_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (missionexec-active-mission_heli0_nav-1-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-1-0-275_fail-service_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-1-0-275) (not (navtopoint-mode-is-running_nav-1-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-1-0-275_fail-service_n0))))
 (:action missionexec-mission-failed-navtopoint-fly_path_action1_fail_proxy_init-1_heli0_nav-1-0-275_nav-1-0-275_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-action1_nav-1-0-275) (navtopoint-in_start_call-is-no_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (missionexec-active-mission_heli0_nav-1-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-1-0-275_fail-subtask_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-1-0-275) (not (navtopoint-mode-is-running_nav-1-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-1-0-275_fail-subtask_n0))))
 (:action missionexec-mission-failed-navtopoint-fly_path_subtask_fail_2-1_heli0_nav-1-0-275_nav-1-0-275_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fsm_exec-is-reaction_f3d_fail_2_nav-1-0-275) (missionexec-active-mission_heli0_nav-1-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-1-0-275_fail-subtask_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-1-0-275) (not (navtopoint-mode-is-running_nav-1-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-1-0-275_fail-subtask_n0))))
 (:action missionexec-destroy-mission-fly3d-call_destroy_when_done-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-done_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_destroyed_n0) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-over_heli0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-idle_heli0) (not (fly3d-mode-is-done_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_destroyed_n0)) (not (missionexec-mission-over_heli0))))
 (:action missionexec-destroy-mission-fly3d-call_destroy_when_failed-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_f3d-1-0-364_destroyed_n0) (fly3d-mode-is-failed_f3d-1-0-364) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-over_heli0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-idle_heli0) (not (fault-count-3_lost_f3d-1-0-364_destroyed_n0)) (not (fly3d-mode-is-failed_f3d-1-0-364)) (not (missionexec-mission-over_heli0))))
 (:action missionexec-destroy-mission-autotakeoff-call_destroy_when_done-0_heli0_ato-1-0-275_ato-1-0-275_obs8
  :parameters ()
  :precondition (and (missionexec-active-mission_heli0_ato-1-0-275) (missionexec-mission-over_heli0) (autotakeoff-mode-is-done_ato-1-0-275) (pending_obs8) (not_at_end_constraint0))
  :effect (and (missionexec-mission-idle_heli0) (observed_obs8) (not (missionexec-mission-over_heli0)) (not (autotakeoff-mode-is-done_ato-1-0-275)) (not (pending_obs8))))
 (:action missionexec-destroy-mission-autotakeoff-call_destroy_when_done-1_heli0_ato-1-0-275_ato-1-0-275_n0_n1
  :parameters ()
  :precondition (and (missionexec-active-mission_heli0_ato-1-0-275) (missionexec-mission-over_heli0) (autotakeoff-mode-is-done_ato-1-0-275) (fault-count-3_lost_ato-1-0-275_destroyed_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-idle_heli0) (not (missionexec-mission-over_heli0)) (not (autotakeoff-mode-is-done_ato-1-0-275)) (not (fault-count-3_lost_ato-1-0-275_destroyed_n0))))
 (:action missionexec-destroy-mission-autotakeoff-call_destroy_when_failed-1_heli0_ato-1-0-275_ato-1-0-275_n0_n1
  :parameters ()
  :precondition (and (missionexec-active-mission_heli0_ato-1-0-275) (missionexec-mission-over_heli0) (autotakeoff-mode-is-failed_ato-1-0-275) (fault-count-3_lost_ato-1-0-275_destroyed_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-idle_heli0) (not (missionexec-mission-over_heli0)) (not (autotakeoff-mode-is-failed_ato-1-0-275)) (not (fault-count-3_lost_ato-1-0-275_destroyed_n0))))
 (:action missionexec-destroy-mission-navtopoint-call_destroy_when_done-1_heli0_nav-1-0-275_nav-1-0-275_n0_n1
  :parameters ()
  :precondition (and (missionexec-active-mission_heli0_nav-1-0-275) (missionexec-mission-over_heli0) (navtopoint-mode-is-done_nav-1-0-275) (fault-count-3_lost_nav-1-0-275_destroyed_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-idle_heli0) (not (missionexec-mission-over_heli0)) (not (navtopoint-mode-is-done_nav-1-0-275)) (not (fault-count-3_lost_nav-1-0-275_destroyed_n0))))
 (:action missionexec-destroy-mission-navtopoint-call_destroy_when_failed-1_heli0_nav-1-0-275_nav-1-0-275_n0_n1
  :parameters ()
  :precondition (and (missionexec-active-mission_heli0_nav-1-0-275) (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-1-0-275) (fault-count-3_lost_nav-1-0-275_destroyed_n0) (not_at_end_constraint0))
  :effect (and (missionexec-mission-idle_heli0) (not (missionexec-mission-over_heli0)) (not (navtopoint-mode-is-failed_nav-1-0-275)) (not (fault-count-3_lost_nav-1-0-275_destroyed_n0))))
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
 (:action set_goal_0_constraint0
  :parameters ()
  :precondition (and (observed_obs4) (observed_obs14) (dominates-3_hyp1_lost_heli0_fcl-event-finished) (observed_obs2) (observed_obs13) (observed_obs5) (observed_obs1) (observed_obs3) (observed_obs6) (observed_obs7) (observed_obs10) (observed_obs11) (observed_obs12) (observed_obs0) (observed_obs9) (observed_obs8) (not_at_end_constraint0))
  :effect (and (achieved_constraint0) (not (not_at_end_constraint0))))
)
