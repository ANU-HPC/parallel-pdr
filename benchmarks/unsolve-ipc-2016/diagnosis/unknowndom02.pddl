(define (domain witas-dddl-compiled)
 (:requirements :strips :equality)
 (:predicates (pending_obs2) (observed_obs2) (pending_obs4) (observed_obs4) (pending_obs6) (observed_obs6) (pending_obs8) (observed_obs8) (pending_obs17) (observed_obs17) (pending_obs21) (observed_obs21) (pending_obs3) (observed_obs3) (pending_obs5) (observed_obs5) (pending_obs7) (observed_obs7) (pending_obs20) (observed_obs20) (pending_obs27) (observed_obs27) (fault-count-3_lost_heli1_fcl-event-finished_n0) (fault-count-3_lost_heli0_fcl-event-finished_n0) (fault-count-3_lost_heli1_fcl-event-canceled_n0) (dominates-3_hyp2_lost_heli1_fcl-event-canceled) (dominates-3_hyp1_lost_heli1_fcl-event-canceled) (fault-count-3_lost_heli0_fcl-event-canceled_n0) (dominates-3_hyp2_lost_heli0_fcl-event-canceled) (fault-count-3_lost_heli1_fcl-event-manual_n0) (fault-count-3_lost_heli0_fcl-event-manual_n0) (dominates-3_hyp1_lost_heli0_fcl-event-manual) (fault-count-3_lost_heli1_fcl-event-not_accepted_n0) (fault-count-3_lost_heli0_fcl-event-not_accepted_n0) (fault-count-3_lost_heli1_fcl-event-traj3d_next_segment_n0) (fault-count-3_lost_heli0_fcl-event-traj3d_next_segment_n0) (pending_obs1) (observed_obs1) (pending_obs0) (observed_obs0) (fault-count-3_lost_heli1_fcl-return-finished_n0) (fault-count-3_lost_heli0_fcl-return-finished_n0) (fault-count-3_lost_heli1_fcl-return-canceled_n0) (fault-count-3_lost_heli0_fcl-return-canceled_n0) (fault-count-3_lost_heli1_fcl-return-manual_n0) (fault-count-3_lost_heli0_fcl-return-manual_n0) (fault-count-3_lost_heli1_fcl-return-not_accepted_n0) (fault-count-3_lost_heli0_fcl-return-not_accepted_n0) (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-start_f3d-2-1-364) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-start_f3d-3-0-369) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-3-0-369) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (pending_obs16) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-1-364) (observed_obs16) (pending_obs13) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-3-0-369) (observed_obs13) (fault-count-3_lost_f3d-2-1-364_checkpoint10_n0) (fault-count-3_lost_f3d-3-0-369_checkpoint10_n0) (fault-count-3_lost_f3d-2-1-364_checkpoint11_n0) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (fault-count-3_lost_f3d-3-0-369_checkpoint11_n0) (fly3d-fsm_state-is-send_first_trajectory_f3d-3-0-369) (fly3d-in_start_call-is-no_f3d-2-1-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (fly3d-in_start_call-is-no_f3d-3-0-369) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (fault-count-3_lost_f3d-2-1-364_checkpoint12_n0) (fault-count-3_lost_f3d-3-0-369_checkpoint12_n0) (fly3d-fsm_exec-is-reaction_cancel_1_f3d-2-1-364) (fly3d-fsm_exec-is-reaction_cancel_1_f3d-3-0-369) (fly3d-fsm_exec-is-reaction_error_1_f3d-2-1-364) (fly3d-fsm_exec-is-reaction_error_1_f3d-3-0-369) (fault-count-3_lost_f3d-2-1-364_checkpoint20_n0) (fly3d-trajectory-not-sent_f3d-2-1-364) (fault-count-3_lost_f3d-3-0-369_checkpoint20_n0) (fly3d-trajectory-not-sent_f3d-3-0-369) (pending_obs19) (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-1-364) (observed_obs19) (fault-count-3_lost_f3d-2-1-364_checkpoint21_n0) (fault-count-3_lost_f3d-3-0-369_checkpoint21_n0) (fly3d-fsm_state-is-wait_trajectory_end_f3d-3-0-369) (pending_obs18) (fly3d-fsm_exec-is-action2_f3d-2-1-364) (observed_obs18) (fault-count-3_lost_f3d-2-1-364_checkpoint22_n0) (fault-count-3_lost_f3d-3-0-369_checkpoint22_n0) (fly3d-fsm_exec-is-action2_f3d-3-0-369) (fly3d-fsm_exec-is-reaction_finished_1_f3d-2-1-364) (fly3d-fsm_exec-is-reaction_finished_1_f3d-3-0-369) (fault-count-3_lost_f3d-2-1-364_checkpoint24_n0) (fly3d-fsm_exec-is-reaction_finished_2_f3d-2-1-364) (fault-count-3_lost_f3d-3-0-369_checkpoint24_n0) (fly3d-fsm_exec-is-reaction_finished_2_f3d-3-0-369) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-2-1-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-3-0-369) (fly3d-fsm_state-is-goal_point_wait_f3d-2-1-364) (fly3d-fsm_state-is-goal_point_wait_f3d-3-0-369) (fault-count-3_lost_f3d-2-1-364_checkpoint30_n0) (fly3d-fsm_exec-is-action2-wait_f3d-2-1-364) (fault-count-3_lost_f3d-3-0-369_checkpoint30_n0) (fly3d-fsm_exec-is-action2-wait_f3d-3-0-369) (fly3d-fsm_exec-is-action2-exit_f3d-2-1-364) (fly3d-fsm_exec-is-action2-exit_f3d-3-0-369) (fly3d-fsm_exec-is-action2-fail_f3d-2-1-364) (fly3d-fsm_exec-is-action2-fail_f3d-3-0-369) (fault-count-3_lost_f3d-2-1-364_checkpoint31_n0) (fault-count-3_lost_f3d-3-0-369_checkpoint31_n0) (fault-count-3_lost_f3d-2-1-364_checkpoint40_n0) (fault-count-3_lost_f3d-3-0-369_checkpoint40_n0) (fly3d-fsm_exec-is-global_reaction_cancel_1_f3d-2-1-364) (fly3d-fsm_exec-is-global_reaction_cancel_1_f3d-3-0-369) (fly3d-fsm_exec-is-global_reaction_error_1_f3d-2-1-364) (fly3d-fsm_exec-is-global_reaction_error_1_f3d-3-0-369) (navtopoint-mode-is-running_nav-4-1-362) (navtopoint-fsm_state-is-start_decouple_nav-4-1-362) (navtopoint-fsm_exec-is-nothing_nav-4-1-362) (navtopoint-fsm_exec-is-action1_nav-4-1-362) (navtopoint-fsm_state-is-plan_path_nav-4-1-362) (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_state-is-start_decouple_nav-3-1-259) (navtopoint-fsm_exec-is-nothing_nav-3-1-259) (navtopoint-fsm_exec-is-action1_nav-3-1-259) (navtopoint-fsm_state-is-plan_path_nav-3-1-259) (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_state-is-start_decouple_nav-3-0-257) (navtopoint-fsm_exec-is-nothing_nav-3-0-257) (navtopoint-fsm_exec-is-action1_nav-3-0-257) (navtopoint-fsm_state-is-plan_path_nav-3-0-257) (pending_obs26) (navtopoint-fsm_exec-is-action2_nav-4-1-362) (observed_obs26) (pending_obs11) (navtopoint-fsm_exec-is-action2_nav-3-1-259) (observed_obs11) (fault-count-3_lost_nav-4-1-362_checkpoint1_n0) (fault-count-3_lost_nav-3-1-259_checkpoint1_n0) (fault-count-3_lost_nav-3-0-257_checkpoint1_n0) (navtopoint-fsm_exec-is-action2_nav-3-0-257) (dominates-3_hyp2_lost_nav-3-0-257_checkpoint1) (dominates-3_hyp1_lost_nav-3-0-257_checkpoint1) (navtopoint-in_start_call-is-no_nav-3-1-259) (pending_obs14) (navtopoint-fsm_state-is-wait_for_go_nav-3-1-259) (observed_obs14) (navtopoint-in_start_call-is-no_nav-4-1-362) (fault-count-3_lost_nav-4-1-362_checkpoint4_n0) (navtopoint-fsm_state-is-wait_for_go_nav-4-1-362) (fault-count-3_lost_nav-3-1-259_checkpoint4_n0) (navtopoint-in_start_call-is-no_nav-3-0-257) (fault-count-3_lost_nav-3-0-257_checkpoint4_n0) (navtopoint-fsm_state-is-wait_for_go_nav-3-0-257) (dominates-3_hyp2_lost_nav-3-0-257_checkpoint4) (dominates-3_hyp1_lost_nav-3-0-257_checkpoint4) (navtopoint-fsm_state-is-fly_path_nav-3-1-259) (navtopoint-fsm_state-is-fly_path_nav-4-1-362) (navtopoint-fsm_state-is-fly_path_nav-3-0-257) (fly3d-mode-is-pre_init_f3d-2-1-364) (navtopoint-fly_trajectory_task_nav-4-1-362_f3d-2-1-364) (fly3d-mode-is-processing_f3d-2-1-364) (called-by_f3d-2-1-364_nav-4-1-362) (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364) (called-by_f3d-2-1-364_nav-3-1-259) (fly3d-mode-is-pre_init_f3d-3-0-369) (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369) (fly3d-mode-is-processing_f3d-3-0-369) (called-by_f3d-3-0-369_nav-3-0-257) (pending_obs15) (navtopoint-fsm_exec-is-reaction_f3d_ready_nav-4-1-362) (fly3d-mode-is-ready_f3d-2-1-364) (observed_obs15) (pending_obs12) (fly3d-mode-is-ready_f3d-3-0-369) (observed_obs12) (navtopoint-fsm_exec-is-reaction_f3d_ready_nav-3-1-259) (navtopoint-fsm_exec-is-reaction_f3d_ready_nav-3-0-257) (called-by_f3d-2-1-364_missionexecutor) (fault-count-4_lost_f3d-2-1-364_created_missionexecutor_n0) (fault-count-4_lost_f3d-2-1-364_created_nav-4-1-362_n0) (fault-count-4_lost_f3d-2-1-364_created_nav-3-1-259_n0) (called-by_f3d-3-0-369_missionexecutor) (fault-count-4_lost_f3d-3-0-369_created_missionexecutor_n0) (fault-count-4_lost_f3d-3-0-369_created_nav-3-0-257_n0) (fly3d-in_start_call-is-yes_f3d-2-1-364) (fly3d-in_start_call-is-yes_f3d-3-0-369) (fly3d-mode-is-done_f3d-2-1-364) (pending_obs23) (navtopoint-fsm_exec-is-reaction_f3d_fail_2_nav-4-1-362) (observed_obs23) (fly3d-mode-is-done_f3d-3-0-369) (pending_obs29) (observed_obs29) (navtopoint-fsm_exec-is-reaction_f3d_fail_2_nav-3-1-259) (navtopoint-fsm_exec-is-reaction_f3d_fail_2_nav-3-0-257) (fault-count-3_lost_f3d-2-1-364_destroyed_n0) (fault-count-3_lost_f3d-3-0-369_destroyed_n0) (fly3d-mode-is-failed_f3d-2-1-364) (fly3d-mode-is-failed_f3d-3-0-369) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-4-1-362) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-3-1-259) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-3-0-257) (pending_obs22) (observed_obs22) (pending_obs28) (observed_obs28) (fault-count-3_lost_f3d-2-1-364_task-done_n0) (fault-count-3_lost_f3d-3-0-369_task-done_n0) (navtopoint-fsm_exec-is-reaction_f3d_done_2_nav-4-1-362) (navtopoint-fsm_exec-is-reaction_f3d_done_2_nav-3-1-259) (navtopoint-fsm_exec-is-reaction_f3d_done_2_nav-3-0-257) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-4-1-362) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-3-1-259) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-3-0-257) (fault-count-3_lost_f3d-2-1-364_fail-service_n0) (fault-count-3_lost_f3d-3-0-369_fail-service_n0) (fault-count-3_lost_f3d-2-1-364_fail-specific-221_n0) (fault-count-3_lost_f3d-3-0-369_fail-specific-221_n0) (fault-count-3_lost_f3d-2-1-364_fail-specific-222_n0) (fault-count-3_lost_f3d-3-0-369_fail-specific-222_n0) (fault-count-3_lost_f3d-2-1-364_fail-specific-223_n0) (fault-count-3_lost_f3d-3-0-369_fail-specific-223_n0) (fault-count-3_lost_f3d-2-1-364_fail-specific-211_n0) (fault-count-3_lost_f3d-3-0-369_fail-specific-211_n0) (fault-count-3_lost_f3d-2-1-364_fail-specific-220_n0) (fault-count-3_lost_f3d-3-0-369_fail-specific-220_n0) (fault-count-3_lost_f3d-2-1-364_fail-specific-213_n0) (fault-count-3_lost_f3d-3-0-369_fail-specific-213_n0) (fault-count-3_lost_f3d-2-1-364_fail-specific-214_n0) (fault-count-3_lost_f3d-3-0-369_fail-specific-214_n0) (fault-count-3_lost_f3d-2-1-364_fail-specific-210_n0) (fault-count-3_lost_f3d-3-0-369_fail-specific-210_n0) (missionexec-mission-idle_heli1) (missionexec-active-mission_heli1_f3d-2-1-364) (missionexec-mission-init-call_heli1) (missionexec-mission-idle_heli0) (missionexec-active-mission_heli0_f3d-3-0-369) (missionexec-mission-init-call_heli0) (navtopoint-mode-is-pre_init_nav-4-1-362) (missionexec-active-mission_heli1_nav-4-1-362) (navtopoint-mode-is-processing_nav-4-1-362) (called-by_nav-4-1-362_missionexecutor) (navtopoint-mode-is-pre_init_nav-3-1-259) (missionexec-active-mission_heli1_nav-3-1-259) (navtopoint-mode-is-processing_nav-3-1-259) (called-by_nav-3-1-259_missionexecutor) (navtopoint-mode-is-pre_init_nav-3-0-257) (missionexec-active-mission_heli0_nav-3-0-257) (navtopoint-mode-is-processing_nav-3-0-257) (called-by_nav-3-0-257_missionexecutor) (missionexec-mission-ready_heli1) (missionexec-mission-ready_heli0) (pending_obs25) (navtopoint-mode-is-ready_nav-4-1-362) (observed_obs25) (pending_obs10) (navtopoint-mode-is-ready_nav-3-1-259) (observed_obs10) (pending_obs9) (navtopoint-mode-is-ready_nav-3-0-257) (observed_obs9) (fault-count-4_lost_nav-4-1-362_created_missionexecutor_n0) (fault-count-4_lost_nav-3-1-259_created_missionexecutor_n0) (fault-count-4_lost_nav-3-0-257_created_missionexecutor_n0) (missionexec-mission-over_heli1) (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-4-1-362) (navtopoint-mode-is-failed_nav-3-1-259) (navtopoint-mode-is-failed_nav-3-0-257) (navtopoint-in_start_call-is-yes_nav-4-1-362) (navtopoint-in_start_call-is-yes_nav-3-1-259) (navtopoint-in_start_call-is-yes_nav-3-0-257) (missionexec-mission-start-call_heli1) (missionexec-mission-start-call_heli0) (navtopoint-fsm_exec-is-start_nav-4-1-362) (navtopoint-fsm_exec-is-start_nav-3-1-259) (navtopoint-fsm_exec-is-start_nav-3-0-257) (missionexec-mission-running_heli1) (missionexec-mission-running_heli0) (pending_obs24) (navtopoint-mode-is-done_nav-3-1-259) (observed_obs24) (fault-count-3_lost_nav-4-1-362_task-done_n0) (navtopoint-mode-is-done_nav-4-1-362) (fault-count-3_lost_nav-3-1-259_task-done_n0) (fault-count-3_lost_nav-3-0-257_task-done_n0) (navtopoint-mode-is-done_nav-3-0-257) (fault-count-3_lost_nav-4-1-362_fail-service_n0) (fault-count-3_lost_nav-3-1-259_fail-service_n0) (fault-count-3_lost_nav-3-0-257_fail-service_n0) (fault-count-3_lost_nav-4-1-362_fail-specific-101_n0) (fault-count-3_lost_nav-3-1-259_fail-specific-101_n0) (fault-count-3_lost_nav-3-0-257_fail-specific-101_n0) (fault-count-3_lost_nav-4-1-362_fail-specific-102_n0) (fault-count-3_lost_nav-3-1-259_fail-specific-102_n0) (fault-count-3_lost_nav-3-0-257_fail-specific-102_n0) (fault-count-3_lost_nav-4-1-362_fail-specific-402_n0) (fault-count-3_lost_nav-3-1-259_fail-specific-402_n0) (fault-count-3_lost_nav-3-0-257_fail-specific-402_n0) (fault-count-3_lost_nav-4-1-362_fail-specific-403_n0) (fault-count-3_lost_nav-3-1-259_fail-specific-403_n0) (fault-count-3_lost_nav-3-0-257_fail-specific-403_n0) (fault-count-3_lost_nav-4-1-362_fail-specific-404_n0) (fault-count-3_lost_nav-3-1-259_fail-specific-404_n0) (fault-count-3_lost_nav-3-0-257_fail-specific-404_n0) (fault-count-3_lost_nav-4-1-362_fail-subtask_n0) (fault-count-3_lost_nav-3-1-259_fail-subtask_n0) (fault-count-3_lost_nav-3-0-257_fail-subtask_n0) (fault-count-3_lost_nav-4-1-362_destroyed_n0) (fault-count-3_lost_nav-3-1-259_destroyed_n0) (dominates-3_hyp2_lost_nav-3-1-259_destroyed) (dominates-3_hyp1_lost_nav-3-1-259_destroyed) (fault-count-3_lost_nav-3-0-257_destroyed_n0) (future_obs1) (future_obs2) (future_obs3) (future_obs7) (future_obs8) (future_obs9) (future_obs11) (future_obs12) (future_obs13) (future_obs15) (future_obs16) (future_obs17) (future_obs18) (future_obs19) (future_obs20) (future_obs22) (future_obs23) (future_obs24) (future_obs25) (future_obs26) (future_obs27) (future_obs28) (future_obs29) (future_obs4) (future_obs5) (future_obs6) (future_obs10) (future_obs21) (future_obs14) (not_at_end_constraint0) (achieved_constraint0) (not_at_end_constraint1) (achieved_constraint1) (static-true))
 (:action flightcontrol-fcl-event-finished-0_heli1_obs2
  :parameters ()
  :precondition (and (pending_obs2) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs2) (not (pending_obs2))))
 (:action flightcontrol-fcl-event-finished-0_heli1_obs4
  :parameters ()
  :precondition (and (pending_obs4) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs4) (not (pending_obs4))))
 (:action flightcontrol-fcl-event-finished-0_heli1_obs6
  :parameters ()
  :precondition (and (pending_obs6) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs6) (not (pending_obs6))))
 (:action flightcontrol-fcl-event-finished-0_heli1_obs8
  :parameters ()
  :precondition (and (pending_obs8) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs8) (not (pending_obs8))))
 (:action flightcontrol-fcl-event-finished-0_heli1_obs17
  :parameters ()
  :precondition (and (pending_obs17) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs17) (not (pending_obs17))))
 (:action flightcontrol-fcl-event-finished-0_heli1_obs21
  :parameters ()
  :precondition (and (pending_obs21) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs21) (not (pending_obs21))))
 (:action flightcontrol-fcl-event-finished-0_heli0_obs3
  :parameters ()
  :precondition (and (pending_obs3) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs3) (not (pending_obs3))))
 (:action flightcontrol-fcl-event-finished-0_heli0_obs5
  :parameters ()
  :precondition (and (pending_obs5) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs5) (not (pending_obs5))))
 (:action flightcontrol-fcl-event-finished-0_heli0_obs7
  :parameters ()
  :precondition (and (pending_obs7) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs7) (not (pending_obs7))))
 (:action flightcontrol-fcl-event-finished-0_heli0_obs20
  :parameters ()
  :precondition (and (pending_obs20) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs20) (not (pending_obs20))))
 (:action flightcontrol-fcl-event-finished-0_heli0_obs27
  :parameters ()
  :precondition (and (pending_obs27) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs27) (not (pending_obs27))))
 (:action flightcontrol-fcl-event-in_the_air-0_heli1_obs1
  :parameters ()
  :precondition (and (pending_obs1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs1) (not (pending_obs1))))
 (:action flightcontrol-fcl-event-in_the_air-0_heli0_obs0
  :parameters ()
  :precondition (and (pending_obs0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs0) (not (pending_obs0))))
 (:action fly3d-start_ok_f3d-2-1-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-start_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_state-is-turn_to_segment_heading_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (not (fly3d-fsm_exec-is-start_f3d-2-1-364))))
 (:action fly3d-start_ok_f3d-3-0-369
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-start_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_state-is-turn_to_segment_heading_f3d-3-0-369) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (not (fly3d-fsm_exec-is-start_f3d-3-0-369))))
 (:action fly3d-enter_turn_to_segment_heading_checkpoint10-0_f3d-2-1-364_obs16
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (pending_obs16) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-1-364) (observed_obs16) (not (fly3d-fsm_state-is-turn_to_segment_heading_f3d-2-1-364)) (not (pending_obs16))))
 (:action fly3d-enter_turn_to_segment_heading_checkpoint10-0_f3d-3-0-369_obs13
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-3-0-369) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (pending_obs13) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_state-is-send_starting_yaw_command_f3d-3-0-369) (observed_obs13) (not (fly3d-fsm_state-is-turn_to_segment_heading_f3d-3-0-369)) (not (pending_obs13))))
 (:action fly3d-enter_turn_to_segment_heading_checkpoint10-1_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_checkpoint10_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-1-364) (not (fly3d-fsm_state-is-turn_to_segment_heading_f3d-2-1-364)) (not (fault-count-3_lost_f3d-2-1-364_checkpoint10_n0))))
 (:action fly3d-enter_turn_to_segment_heading_checkpoint10-1_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-3-0-369) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_checkpoint10_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_state-is-send_starting_yaw_command_f3d-3-0-369) (not (fly3d-fsm_state-is-turn_to_segment_heading_f3d-3-0-369)) (not (fault-count-3_lost_f3d-3-0-369_checkpoint10_n0))))
 (:action fly3d-enter_turn_to_segment_heading_checkpoint11-1_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_checkpoint11_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (not (fly3d-fsm_state-is-turn_to_segment_heading_f3d-2-1-364)) (not (fault-count-3_lost_f3d-2-1-364_checkpoint11_n0))))
 (:action fly3d-enter_turn_to_segment_heading_checkpoint11-1_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-3-0-369) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_checkpoint11_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_state-is-send_first_trajectory_f3d-3-0-369) (not (fly3d-fsm_state-is-turn_to_segment_heading_f3d-3-0-369)) (not (fault-count-3_lost_f3d-3-0-369_checkpoint11_n0))))
 (:action fly3d-enter_send_starting_yaw_command_ok_f3d-2-1-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-1-364) (fly3d-in_start_call-is-no_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (not (fly3d-fsm_exec-is-action1_f3d-2-1-364)) (not (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-1-364))))
 (:action fly3d-enter_send_starting_yaw_command_ok_f3d-3-0-369
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-3-0-369) (fly3d-in_start_call-is-no_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (not (fly3d-fsm_exec-is-action1_f3d-3-0-369)) (not (fly3d-fsm_state-is-send_starting_yaw_command_f3d-3-0-369))))
 (:action fly3d-enter_send_starting_yaw_command_checkpoint12-1_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-1-364) (fly3d-in_start_call-is-no_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_checkpoint12_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (not (fly3d-fsm_exec-is-action1_f3d-2-1-364)) (not (fault-count-3_lost_f3d-2-1-364_checkpoint12_n0))))
 (:action fly3d-enter_send_starting_yaw_command_checkpoint12-1_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-3-0-369) (fly3d-in_start_call-is-no_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_checkpoint12_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (not (fly3d-fsm_exec-is-action1_f3d-3-0-369)) (not (fault-count-3_lost_f3d-3-0-369_checkpoint12_n0))))
 (:action fly3d-in_send_starting_yaw_command_idle_f3d-2-1-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action1_f3d-2-1-364) (not (fly3d-fsm_exec-is-nothing_f3d-2-1-364))))
 (:action fly3d-in_send_starting_yaw_command_idle_f3d-3-0-369
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action1_f3d-3-0-369) (not (fly3d-fsm_exec-is-nothing_f3d-3-0-369))))
 (:action fly3d-in_send_starting_yaw_command_fcl_cancel_1-flightcontrol-fcl-event-canceled-1_f3d-2-1-364_heli1_heli1_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli1_fcl-event-canceled_n0) (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-reaction_cancel_1_f3d-2-1-364) (not (fault-count-3_lost_heli1_fcl-event-canceled_n0)) (not (dominates-3_hyp2_lost_heli1_fcl-event-canceled)) (not (dominates-3_hyp1_lost_heli1_fcl-event-canceled)) (not (fly3d-fsm_exec-is-nothing_f3d-2-1-364))))
 (:action fly3d-in_send_starting_yaw_command_fcl_cancel_1-flightcontrol-fcl-event-canceled-1_f3d-3-0-369_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-canceled_n0) (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-reaction_cancel_1_f3d-3-0-369) (not (fault-count-3_lost_heli0_fcl-event-canceled_n0)) (not (dominates-3_hyp2_lost_heli0_fcl-event-canceled)) (not (fly3d-fsm_exec-is-nothing_f3d-3-0-369))))
 (:action fly3d-in_send_starting_yaw_command_fcl_cancel_2-flightcontrol-fcl-event-manual-1_f3d-2-1-364_heli1_heli1_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli1_fcl-event-manual_n0) (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-reaction_cancel_1_f3d-2-1-364) (not (fault-count-3_lost_heli1_fcl-event-manual_n0)) (not (fly3d-fsm_exec-is-nothing_f3d-2-1-364))))
 (:action fly3d-in_send_starting_yaw_command_fcl_cancel_2-flightcontrol-fcl-event-manual-1_f3d-3-0-369_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-manual_n0) (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-reaction_cancel_1_f3d-3-0-369) (not (fault-count-3_lost_heli0_fcl-event-manual_n0)) (not (dominates-3_hyp1_lost_heli0_fcl-event-manual)) (not (fly3d-fsm_exec-is-nothing_f3d-3-0-369))))
 (:action fly3d-in_send_starting_yaw_command_fcl_error-flightcontrol-fcl-event-not_accepted-1_f3d-2-1-364_heli1_heli1_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli1_fcl-event-not_accepted_n0) (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-reaction_error_1_f3d-2-1-364) (not (fault-count-3_lost_heli1_fcl-event-not_accepted_n0)) (not (fly3d-fsm_exec-is-nothing_f3d-2-1-364))))
 (:action fly3d-in_send_starting_yaw_command_fcl_error-flightcontrol-fcl-event-not_accepted-1_f3d-3-0-369_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-not_accepted_n0) (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-reaction_error_1_f3d-3-0-369) (not (fault-count-3_lost_heli0_fcl-event-not_accepted_n0)) (not (fly3d-fsm_exec-is-nothing_f3d-3-0-369))))
 (:action fly3d-in_wait_for_yaw_finish_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-2-1-364_heli1_heli1_obs2
  :parameters ()
  :precondition (and (pending_obs2) (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs2) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (not (pending_obs2)) (not (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-1-364)) (not (fly3d-fsm_exec-is-nothing_f3d-2-1-364))))
 (:action fly3d-in_wait_for_yaw_finish_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-2-1-364_heli1_heli1_obs4
  :parameters ()
  :precondition (and (pending_obs4) (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs4) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (not (pending_obs4)) (not (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-1-364)) (not (fly3d-fsm_exec-is-nothing_f3d-2-1-364))))
 (:action fly3d-in_wait_for_yaw_finish_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-2-1-364_heli1_heli1_obs6
  :parameters ()
  :precondition (and (pending_obs6) (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs6) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (not (pending_obs6)) (not (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-1-364)) (not (fly3d-fsm_exec-is-nothing_f3d-2-1-364))))
 (:action fly3d-in_wait_for_yaw_finish_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-2-1-364_heli1_heli1_obs8
  :parameters ()
  :precondition (and (pending_obs8) (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs8) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (not (pending_obs8)) (not (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-1-364)) (not (fly3d-fsm_exec-is-nothing_f3d-2-1-364))))
 (:action fly3d-in_wait_for_yaw_finish_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-2-1-364_heli1_heli1_obs17
  :parameters ()
  :precondition (and (pending_obs17) (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs17) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (not (pending_obs17)) (not (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-1-364)) (not (fly3d-fsm_exec-is-nothing_f3d-2-1-364))))
 (:action fly3d-in_wait_for_yaw_finish_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-2-1-364_heli1_heli1_obs21
  :parameters ()
  :precondition (and (pending_obs21) (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs21) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (not (pending_obs21)) (not (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-1-364)) (not (fly3d-fsm_exec-is-nothing_f3d-2-1-364))))
 (:action fly3d-in_wait_for_yaw_finish_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-3-0-369_heli0_heli0_obs3
  :parameters ()
  :precondition (and (pending_obs3) (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs3) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (fly3d-fsm_state-is-send_first_trajectory_f3d-3-0-369) (not (pending_obs3)) (not (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-3-0-369)) (not (fly3d-fsm_exec-is-nothing_f3d-3-0-369))))
 (:action fly3d-in_wait_for_yaw_finish_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-3-0-369_heli0_heli0_obs5
  :parameters ()
  :precondition (and (pending_obs5) (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs5) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (fly3d-fsm_state-is-send_first_trajectory_f3d-3-0-369) (not (pending_obs5)) (not (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-3-0-369)) (not (fly3d-fsm_exec-is-nothing_f3d-3-0-369))))
 (:action fly3d-in_wait_for_yaw_finish_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-3-0-369_heli0_heli0_obs7
  :parameters ()
  :precondition (and (pending_obs7) (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs7) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (fly3d-fsm_state-is-send_first_trajectory_f3d-3-0-369) (not (pending_obs7)) (not (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-3-0-369)) (not (fly3d-fsm_exec-is-nothing_f3d-3-0-369))))
 (:action fly3d-in_wait_for_yaw_finish_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-3-0-369_heli0_heli0_obs20
  :parameters ()
  :precondition (and (pending_obs20) (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs20) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (fly3d-fsm_state-is-send_first_trajectory_f3d-3-0-369) (not (pending_obs20)) (not (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-3-0-369)) (not (fly3d-fsm_exec-is-nothing_f3d-3-0-369))))
 (:action fly3d-in_wait_for_yaw_finish_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-3-0-369_heli0_heli0_obs27
  :parameters ()
  :precondition (and (pending_obs27) (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs27) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (fly3d-fsm_state-is-send_first_trajectory_f3d-3-0-369) (not (pending_obs27)) (not (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-3-0-369)) (not (fly3d-fsm_exec-is-nothing_f3d-3-0-369))))
 (:action fly3d-in_wait_for_yaw_finish_fcl_finished-flightcontrol-fcl-event-finished-1_f3d-2-1-364_heli1_heli1_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli1_fcl-event-finished_n0) (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (not (fault-count-3_lost_heli1_fcl-event-finished_n0)) (not (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-1-364)) (not (fly3d-fsm_exec-is-nothing_f3d-2-1-364))))
 (:action fly3d-in_wait_for_yaw_finish_fcl_finished-flightcontrol-fcl-event-finished-1_f3d-3-0-369_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-finished_n0) (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action1_f3d-3-0-369) (fly3d-fsm_state-is-send_first_trajectory_f3d-3-0-369) (not (fault-count-3_lost_heli0_fcl-event-finished_n0)) (not (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-3-0-369)) (not (fly3d-fsm_exec-is-nothing_f3d-3-0-369))))
 (:action fly3d-in_wait_for_yaw_finish_fcl_cancel_1-flightcontrol-fcl-event-canceled-1_f3d-2-1-364_heli1_heli1_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli1_fcl-event-canceled_n0) (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-reaction_cancel_1_f3d-2-1-364) (not (fault-count-3_lost_heli1_fcl-event-canceled_n0)) (not (dominates-3_hyp2_lost_heli1_fcl-event-canceled)) (not (dominates-3_hyp1_lost_heli1_fcl-event-canceled)) (not (fly3d-fsm_exec-is-nothing_f3d-2-1-364))))
 (:action fly3d-in_wait_for_yaw_finish_fcl_cancel_1-flightcontrol-fcl-event-canceled-1_f3d-3-0-369_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-canceled_n0) (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-reaction_cancel_1_f3d-3-0-369) (not (fault-count-3_lost_heli0_fcl-event-canceled_n0)) (not (dominates-3_hyp2_lost_heli0_fcl-event-canceled)) (not (fly3d-fsm_exec-is-nothing_f3d-3-0-369))))
 (:action fly3d-in_wait_for_yaw_finish_fcl_cancel_2-flightcontrol-fcl-event-canceled-1_f3d-2-1-364_heli1_heli1_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli1_fcl-event-canceled_n0) (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-reaction_cancel_1_f3d-2-1-364) (not (fault-count-3_lost_heli1_fcl-event-canceled_n0)) (not (dominates-3_hyp2_lost_heli1_fcl-event-canceled)) (not (dominates-3_hyp1_lost_heli1_fcl-event-canceled)) (not (fly3d-fsm_exec-is-nothing_f3d-2-1-364))))
 (:action fly3d-in_wait_for_yaw_finish_fcl_cancel_2-flightcontrol-fcl-event-canceled-1_f3d-3-0-369_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-canceled_n0) (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-reaction_cancel_1_f3d-3-0-369) (not (fault-count-3_lost_heli0_fcl-event-canceled_n0)) (not (dominates-3_hyp2_lost_heli0_fcl-event-canceled)) (not (fly3d-fsm_exec-is-nothing_f3d-3-0-369))))
 (:action fly3d-in_wait_for_yaw_finish_fcl_error-flightcontrol-fcl-event-not_accepted-1_f3d-2-1-364_heli1_heli1_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli1_fcl-event-not_accepted_n0) (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-reaction_error_1_f3d-2-1-364) (not (fault-count-3_lost_heli1_fcl-event-not_accepted_n0)) (not (fly3d-fsm_exec-is-nothing_f3d-2-1-364))))
 (:action fly3d-in_wait_for_yaw_finish_fcl_error-flightcontrol-fcl-event-not_accepted-1_f3d-3-0-369_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-not_accepted_n0) (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-reaction_error_1_f3d-3-0-369) (not (fault-count-3_lost_heli0_fcl-event-not_accepted_n0)) (not (fly3d-fsm_exec-is-nothing_f3d-3-0-369))))
 (:action fly3d-enter_send_first_trajectory_checkpoint20-1_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (fly3d-in_start_call-is-no_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_checkpoint20_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (not (fly3d-fsm_exec-is-action1_f3d-2-1-364)) (not (fault-count-3_lost_f3d-2-1-364_checkpoint20_n0)) (not (fly3d-trajectory-not-sent_f3d-2-1-364))))
 (:action fly3d-enter_send_first_trajectory_checkpoint20-1_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (fly3d-fsm_state-is-send_first_trajectory_f3d-3-0-369) (fly3d-in_start_call-is-no_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_checkpoint20_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (not (fly3d-fsm_exec-is-action1_f3d-3-0-369)) (not (fault-count-3_lost_f3d-3-0-369_checkpoint20_n0)) (not (fly3d-trajectory-not-sent_f3d-3-0-369))))
 (:action fly3d-enter_send_first_trajectory_checkpoint21-0_f3d-2-1-364_obs19
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (fly3d-in_start_call-is-no_f3d-2-1-364) (pending_obs19) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-1-364) (observed_obs19) (not (fly3d-fsm_exec-is-action1_f3d-2-1-364)) (not (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364)) (not (fly3d-trajectory-not-sent_f3d-2-1-364)) (not (pending_obs19))))
 (:action fly3d-enter_send_first_trajectory_checkpoint21-1_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (fly3d-in_start_call-is-no_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_checkpoint21_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-1-364) (not (fly3d-fsm_exec-is-action1_f3d-2-1-364)) (not (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364)) (not (fly3d-trajectory-not-sent_f3d-2-1-364)) (not (fault-count-3_lost_f3d-2-1-364_checkpoint21_n0))))
 (:action fly3d-enter_send_first_trajectory_checkpoint21-1_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (fly3d-fsm_state-is-send_first_trajectory_f3d-3-0-369) (fly3d-in_start_call-is-no_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_checkpoint21_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (fly3d-fsm_state-is-wait_trajectory_end_f3d-3-0-369) (not (fly3d-fsm_exec-is-action1_f3d-3-0-369)) (not (fly3d-fsm_state-is-send_first_trajectory_f3d-3-0-369)) (not (fly3d-trajectory-not-sent_f3d-3-0-369)) (not (fault-count-3_lost_f3d-3-0-369_checkpoint21_n0))))
 (:action fly3d-enter_send_first_trajectory_checkpoint22-0_f3d-2-1-364_obs18
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (pending_obs18) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action2_f3d-2-1-364) (observed_obs18) (not (fly3d-fsm_exec-is-action1_f3d-2-1-364)) (not (pending_obs18))))
 (:action fly3d-enter_send_first_trajectory_checkpoint22-1_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_checkpoint22_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action2_f3d-2-1-364) (not (fly3d-fsm_exec-is-action1_f3d-2-1-364)) (not (fault-count-3_lost_f3d-2-1-364_checkpoint22_n0))))
 (:action fly3d-enter_send_first_trajectory_checkpoint22-1_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (fly3d-fsm_state-is-send_first_trajectory_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_checkpoint22_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action2_f3d-3-0-369) (not (fly3d-fsm_exec-is-action1_f3d-3-0-369)) (not (fault-count-3_lost_f3d-3-0-369_checkpoint22_n0))))
 (:action fly3d-enter_send_first_trajectory_checkpoint21_after22-0_f3d-2-1-364_obs19
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (fly3d-in_start_call-is-no_f3d-2-1-364) (pending_obs19) (fly3d-fsm_exec-is-action2_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-1-364) (observed_obs19) (not (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364)) (not (fly3d-trajectory-not-sent_f3d-2-1-364)) (not (pending_obs19)) (not (fly3d-fsm_exec-is-action2_f3d-2-1-364))))
 (:action fly3d-enter_send_first_trajectory_checkpoint21_after22-1_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (fly3d-in_start_call-is-no_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_checkpoint21_n0) (fly3d-fsm_exec-is-action2_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-1-364) (not (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364)) (not (fly3d-trajectory-not-sent_f3d-2-1-364)) (not (fault-count-3_lost_f3d-2-1-364_checkpoint21_n0)) (not (fly3d-fsm_exec-is-action2_f3d-2-1-364))))
 (:action fly3d-enter_send_first_trajectory_checkpoint21_after22-1_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-send_first_trajectory_f3d-3-0-369) (fly3d-in_start_call-is-no_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_checkpoint21_n0) (fly3d-fsm_exec-is-action2_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (fly3d-fsm_state-is-wait_trajectory_end_f3d-3-0-369) (not (fly3d-fsm_state-is-send_first_trajectory_f3d-3-0-369)) (not (fly3d-trajectory-not-sent_f3d-3-0-369)) (not (fault-count-3_lost_f3d-3-0-369_checkpoint21_n0)) (not (fly3d-fsm_exec-is-action2_f3d-3-0-369))))
 (:action fly3d-enter_send_first_trajectory_busy_f3d-2-1-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (fly3d-in_start_call-is-no_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (fly3d-trajectory-not-sent_f3d-2-1-364) (not (fly3d-fsm_exec-is-action1_f3d-2-1-364))))
 (:action fly3d-enter_send_first_trajectory_busy_f3d-3-0-369
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (fly3d-fsm_state-is-send_first_trajectory_f3d-3-0-369) (fly3d-in_start_call-is-no_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (fly3d-trajectory-not-sent_f3d-3-0-369) (not (fly3d-fsm_exec-is-action1_f3d-3-0-369))))
 (:action fly3d-enter_send_first_trajectory_after22_busy_f3d-2-1-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (fly3d-in_start_call-is-no_f3d-2-1-364) (fly3d-fsm_exec-is-action2_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (fly3d-trajectory-not-sent_f3d-2-1-364) (not (fly3d-fsm_exec-is-action2_f3d-2-1-364))))
 (:action fly3d-enter_send_first_trajectory_after22_busy_f3d-3-0-369
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-send_first_trajectory_f3d-3-0-369) (fly3d-in_start_call-is-no_f3d-3-0-369) (fly3d-fsm_exec-is-action2_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (fly3d-trajectory-not-sent_f3d-3-0-369) (not (fly3d-fsm_exec-is-action2_f3d-3-0-369))))
 (:action fly3d-in_send_first_trajectory_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-2-1-364_heli1_heli1_obs2
  :parameters ()
  :precondition (and (pending_obs2) (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs2) (fly3d-fsm_exec-is-reaction_finished_1_f3d-2-1-364) (not (pending_obs2)) (not (fly3d-fsm_exec-is-nothing_f3d-2-1-364))))
 (:action fly3d-in_send_first_trajectory_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-2-1-364_heli1_heli1_obs4
  :parameters ()
  :precondition (and (pending_obs4) (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs4) (fly3d-fsm_exec-is-reaction_finished_1_f3d-2-1-364) (not (pending_obs4)) (not (fly3d-fsm_exec-is-nothing_f3d-2-1-364))))
 (:action fly3d-in_send_first_trajectory_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-2-1-364_heli1_heli1_obs6
  :parameters ()
  :precondition (and (pending_obs6) (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs6) (fly3d-fsm_exec-is-reaction_finished_1_f3d-2-1-364) (not (pending_obs6)) (not (fly3d-fsm_exec-is-nothing_f3d-2-1-364))))
 (:action fly3d-in_send_first_trajectory_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-2-1-364_heli1_heli1_obs8
  :parameters ()
  :precondition (and (pending_obs8) (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs8) (fly3d-fsm_exec-is-reaction_finished_1_f3d-2-1-364) (not (pending_obs8)) (not (fly3d-fsm_exec-is-nothing_f3d-2-1-364))))
 (:action fly3d-in_send_first_trajectory_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-2-1-364_heli1_heli1_obs17
  :parameters ()
  :precondition (and (pending_obs17) (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs17) (fly3d-fsm_exec-is-reaction_finished_1_f3d-2-1-364) (not (pending_obs17)) (not (fly3d-fsm_exec-is-nothing_f3d-2-1-364))))
 (:action fly3d-in_send_first_trajectory_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-2-1-364_heli1_heli1_obs21
  :parameters ()
  :precondition (and (pending_obs21) (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs21) (fly3d-fsm_exec-is-reaction_finished_1_f3d-2-1-364) (not (pending_obs21)) (not (fly3d-fsm_exec-is-nothing_f3d-2-1-364))))
 (:action fly3d-in_send_first_trajectory_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-3-0-369_heli0_heli0_obs3
  :parameters ()
  :precondition (and (pending_obs3) (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-send_first_trajectory_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs3) (fly3d-fsm_exec-is-reaction_finished_1_f3d-3-0-369) (not (pending_obs3)) (not (fly3d-fsm_exec-is-nothing_f3d-3-0-369))))
 (:action fly3d-in_send_first_trajectory_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-3-0-369_heli0_heli0_obs5
  :parameters ()
  :precondition (and (pending_obs5) (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-send_first_trajectory_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs5) (fly3d-fsm_exec-is-reaction_finished_1_f3d-3-0-369) (not (pending_obs5)) (not (fly3d-fsm_exec-is-nothing_f3d-3-0-369))))
 (:action fly3d-in_send_first_trajectory_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-3-0-369_heli0_heli0_obs7
  :parameters ()
  :precondition (and (pending_obs7) (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-send_first_trajectory_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs7) (fly3d-fsm_exec-is-reaction_finished_1_f3d-3-0-369) (not (pending_obs7)) (not (fly3d-fsm_exec-is-nothing_f3d-3-0-369))))
 (:action fly3d-in_send_first_trajectory_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-3-0-369_heli0_heli0_obs20
  :parameters ()
  :precondition (and (pending_obs20) (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-send_first_trajectory_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs20) (fly3d-fsm_exec-is-reaction_finished_1_f3d-3-0-369) (not (pending_obs20)) (not (fly3d-fsm_exec-is-nothing_f3d-3-0-369))))
 (:action fly3d-in_send_first_trajectory_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-3-0-369_heli0_heli0_obs27
  :parameters ()
  :precondition (and (pending_obs27) (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-send_first_trajectory_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs27) (fly3d-fsm_exec-is-reaction_finished_1_f3d-3-0-369) (not (pending_obs27)) (not (fly3d-fsm_exec-is-nothing_f3d-3-0-369))))
 (:action fly3d-in_send_first_trajectory_fcl_finished-flightcontrol-fcl-event-finished-1_f3d-2-1-364_heli1_heli1_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli1_fcl-event-finished_n0) (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-reaction_finished_1_f3d-2-1-364) (not (fault-count-3_lost_heli1_fcl-event-finished_n0)) (not (fly3d-fsm_exec-is-nothing_f3d-2-1-364))))
 (:action fly3d-in_send_first_trajectory_fcl_finished-flightcontrol-fcl-event-finished-1_f3d-3-0-369_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-finished_n0) (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-send_first_trajectory_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-reaction_finished_1_f3d-3-0-369) (not (fault-count-3_lost_heli0_fcl-event-finished_n0)) (not (fly3d-fsm_exec-is-nothing_f3d-3-0-369))))
 (:action fly3d-in_send_first_trajectory_fcl_next_trajectory-flightcontrol-fcl-event-traj3d_next_segment-1_f3d-2-1-364_heli1_heli1_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli1_fcl-event-traj3d_next_segment_n0) (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action1_f3d-2-1-364) (not (fault-count-3_lost_heli1_fcl-event-traj3d_next_segment_n0)) (not (fly3d-fsm_exec-is-nothing_f3d-2-1-364))))
 (:action fly3d-in_send_first_trajectory_fcl_next_trajectory-flightcontrol-fcl-event-traj3d_next_segment-1_f3d-3-0-369_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-traj3d_next_segment_n0) (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-send_first_trajectory_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action1_f3d-3-0-369) (not (fault-count-3_lost_heli0_fcl-event-traj3d_next_segment_n0)) (not (fly3d-fsm_exec-is-nothing_f3d-3-0-369))))
 (:action fly3d-in_send_first_trajectory_idle_timeout_f3d-2-1-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (fly3d-trajectory-not-sent_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action1_f3d-2-1-364) (not (fly3d-fsm_exec-is-nothing_f3d-2-1-364))))
 (:action fly3d-in_send_first_trajectory_idle_timeout_f3d-3-0-369
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-send_first_trajectory_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (fly3d-trajectory-not-sent_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action1_f3d-3-0-369) (not (fly3d-fsm_exec-is-nothing_f3d-3-0-369))))
 (:action fly3d-in_wait_trajectory_end_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-2-1-364_heli1_heli1_obs2
  :parameters ()
  :precondition (and (pending_obs2) (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs2) (fly3d-fsm_exec-is-reaction_finished_1_f3d-2-1-364) (not (pending_obs2)) (not (fly3d-fsm_exec-is-nothing_f3d-2-1-364))))
 (:action fly3d-in_wait_trajectory_end_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-2-1-364_heli1_heli1_obs4
  :parameters ()
  :precondition (and (pending_obs4) (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs4) (fly3d-fsm_exec-is-reaction_finished_1_f3d-2-1-364) (not (pending_obs4)) (not (fly3d-fsm_exec-is-nothing_f3d-2-1-364))))
 (:action fly3d-in_wait_trajectory_end_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-2-1-364_heli1_heli1_obs6
  :parameters ()
  :precondition (and (pending_obs6) (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs6) (fly3d-fsm_exec-is-reaction_finished_1_f3d-2-1-364) (not (pending_obs6)) (not (fly3d-fsm_exec-is-nothing_f3d-2-1-364))))
 (:action fly3d-in_wait_trajectory_end_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-2-1-364_heli1_heli1_obs8
  :parameters ()
  :precondition (and (pending_obs8) (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs8) (fly3d-fsm_exec-is-reaction_finished_1_f3d-2-1-364) (not (pending_obs8)) (not (fly3d-fsm_exec-is-nothing_f3d-2-1-364))))
 (:action fly3d-in_wait_trajectory_end_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-2-1-364_heli1_heli1_obs17
  :parameters ()
  :precondition (and (pending_obs17) (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs17) (fly3d-fsm_exec-is-reaction_finished_1_f3d-2-1-364) (not (pending_obs17)) (not (fly3d-fsm_exec-is-nothing_f3d-2-1-364))))
 (:action fly3d-in_wait_trajectory_end_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-2-1-364_heli1_heli1_obs21
  :parameters ()
  :precondition (and (pending_obs21) (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs21) (fly3d-fsm_exec-is-reaction_finished_1_f3d-2-1-364) (not (pending_obs21)) (not (fly3d-fsm_exec-is-nothing_f3d-2-1-364))))
 (:action fly3d-in_wait_trajectory_end_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-3-0-369_heli0_heli0_obs3
  :parameters ()
  :precondition (and (pending_obs3) (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (fly3d-fsm_state-is-wait_trajectory_end_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs3) (fly3d-fsm_exec-is-reaction_finished_1_f3d-3-0-369) (not (pending_obs3)) (not (fly3d-fsm_exec-is-nothing_f3d-3-0-369))))
 (:action fly3d-in_wait_trajectory_end_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-3-0-369_heli0_heli0_obs5
  :parameters ()
  :precondition (and (pending_obs5) (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (fly3d-fsm_state-is-wait_trajectory_end_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs5) (fly3d-fsm_exec-is-reaction_finished_1_f3d-3-0-369) (not (pending_obs5)) (not (fly3d-fsm_exec-is-nothing_f3d-3-0-369))))
 (:action fly3d-in_wait_trajectory_end_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-3-0-369_heli0_heli0_obs7
  :parameters ()
  :precondition (and (pending_obs7) (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (fly3d-fsm_state-is-wait_trajectory_end_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs7) (fly3d-fsm_exec-is-reaction_finished_1_f3d-3-0-369) (not (pending_obs7)) (not (fly3d-fsm_exec-is-nothing_f3d-3-0-369))))
 (:action fly3d-in_wait_trajectory_end_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-3-0-369_heli0_heli0_obs20
  :parameters ()
  :precondition (and (pending_obs20) (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (fly3d-fsm_state-is-wait_trajectory_end_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs20) (fly3d-fsm_exec-is-reaction_finished_1_f3d-3-0-369) (not (pending_obs20)) (not (fly3d-fsm_exec-is-nothing_f3d-3-0-369))))
 (:action fly3d-in_wait_trajectory_end_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-3-0-369_heli0_heli0_obs27
  :parameters ()
  :precondition (and (pending_obs27) (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (fly3d-fsm_state-is-wait_trajectory_end_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs27) (fly3d-fsm_exec-is-reaction_finished_1_f3d-3-0-369) (not (pending_obs27)) (not (fly3d-fsm_exec-is-nothing_f3d-3-0-369))))
 (:action fly3d-in_wait_trajectory_end_fcl_finished-flightcontrol-fcl-event-finished-1_f3d-2-1-364_heli1_heli1_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli1_fcl-event-finished_n0) (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-reaction_finished_1_f3d-2-1-364) (not (fault-count-3_lost_heli1_fcl-event-finished_n0)) (not (fly3d-fsm_exec-is-nothing_f3d-2-1-364))))
 (:action fly3d-in_wait_trajectory_end_fcl_finished-flightcontrol-fcl-event-finished-1_f3d-3-0-369_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-finished_n0) (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (fly3d-fsm_state-is-wait_trajectory_end_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-reaction_finished_1_f3d-3-0-369) (not (fault-count-3_lost_heli0_fcl-event-finished_n0)) (not (fly3d-fsm_exec-is-nothing_f3d-3-0-369))))
 (:action fly3d-in_wait_trajectory_end_fcl_finished_reaction1-1_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-1-364) (fly3d-fsm_exec-is-reaction_finished_1_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_checkpoint24_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-reaction_finished_2_f3d-2-1-364) (not (fly3d-fsm_exec-is-reaction_finished_1_f3d-2-1-364)) (not (fault-count-3_lost_f3d-2-1-364_checkpoint24_n0))))
 (:action fly3d-in_wait_trajectory_end_fcl_finished_reaction1-1_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-wait_trajectory_end_f3d-3-0-369) (fly3d-fsm_exec-is-reaction_finished_1_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_checkpoint24_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-reaction_finished_2_f3d-3-0-369) (not (fly3d-fsm_exec-is-reaction_finished_1_f3d-3-0-369)) (not (fault-count-3_lost_f3d-3-0-369_checkpoint24_n0))))
 (:action fly3d-in_wait_trajectory_end_fcl_finished_reaction2a_f3d-2-1-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-1-364) (fly3d-fsm_exec-is-reaction_finished_2_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-2-1-364) (not (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-1-364)) (not (fly3d-fsm_exec-is-reaction_finished_2_f3d-2-1-364))))
 (:action fly3d-in_wait_trajectory_end_fcl_finished_reaction2a_f3d-3-0-369
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-wait_trajectory_end_f3d-3-0-369) (fly3d-fsm_exec-is-reaction_finished_2_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action1_f3d-3-0-369) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-3-0-369) (not (fly3d-fsm_state-is-wait_trajectory_end_f3d-3-0-369)) (not (fly3d-fsm_exec-is-reaction_finished_2_f3d-3-0-369))))
 (:action fly3d-in_wait_trajectory_end_fcl_finished_reaction2b_f3d-2-1-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-1-364) (fly3d-fsm_exec-is-reaction_finished_2_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-fsm_state-is-goal_point_wait_f3d-2-1-364) (not (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-1-364)) (not (fly3d-fsm_exec-is-reaction_finished_2_f3d-2-1-364))))
 (:action fly3d-in_wait_trajectory_end_fcl_finished_reaction2b_f3d-3-0-369
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-wait_trajectory_end_f3d-3-0-369) (fly3d-fsm_exec-is-reaction_finished_2_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action1_f3d-3-0-369) (fly3d-fsm_state-is-goal_point_wait_f3d-3-0-369) (not (fly3d-fsm_state-is-wait_trajectory_end_f3d-3-0-369)) (not (fly3d-fsm_exec-is-reaction_finished_2_f3d-3-0-369))))
 (:action fly3d-in_wait_trajectory_end_fcl_finished_reaction2d_f3d-2-1-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-1-364) (fly3d-fsm_exec-is-reaction_finished_2_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_state-is-turn_to_segment_heading_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (not (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-1-364)) (not (fly3d-fsm_exec-is-reaction_finished_2_f3d-2-1-364))))
 (:action fly3d-in_wait_trajectory_end_fcl_finished_reaction2d_f3d-3-0-369
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-wait_trajectory_end_f3d-3-0-369) (fly3d-fsm_exec-is-reaction_finished_2_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_state-is-turn_to_segment_heading_f3d-3-0-369) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (not (fly3d-fsm_state-is-wait_trajectory_end_f3d-3-0-369)) (not (fly3d-fsm_exec-is-reaction_finished_2_f3d-3-0-369))))
 (:action fly3d-enter_turn_to_goal_heading_checkpoint30-1_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_checkpoint30_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action2-wait_f3d-2-1-364) (not (fly3d-fsm_exec-is-action1_f3d-2-1-364)) (not (fault-count-3_lost_f3d-2-1-364_checkpoint30_n0))))
 (:action fly3d-enter_turn_to_goal_heading_checkpoint30-1_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_checkpoint30_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action2-wait_f3d-3-0-369) (not (fly3d-fsm_exec-is-action1_f3d-3-0-369)) (not (fault-count-3_lost_f3d-3-0-369_checkpoint30_n0))))
 (:action fly3d-enter_turn_to_goal_heading_yaw_wait_finish_1-flightcontrol-fcl-return-finished-1_f3d-2-1-364_heli1_heli1_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli1_fcl-return-finished_n0) (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-2-1-364) (fly3d-fsm_exec-is-action2-wait_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-fsm_state-is-goal_point_wait_f3d-2-1-364) (not (fault-count-3_lost_heli1_fcl-return-finished_n0)) (not (fly3d-fsm_state-is-turn_to_goal_heading_f3d-2-1-364)) (not (fly3d-fsm_exec-is-action2-wait_f3d-2-1-364))))
 (:action fly3d-enter_turn_to_goal_heading_yaw_wait_finish_1-flightcontrol-fcl-return-finished-1_f3d-3-0-369_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-return-finished_n0) (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-3-0-369) (fly3d-fsm_exec-is-action2-wait_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action1_f3d-3-0-369) (fly3d-fsm_state-is-goal_point_wait_f3d-3-0-369) (not (fault-count-3_lost_heli0_fcl-return-finished_n0)) (not (fly3d-fsm_state-is-turn_to_goal_heading_f3d-3-0-369)) (not (fly3d-fsm_exec-is-action2-wait_f3d-3-0-369))))
 (:action fly3d-enter_turn_to_goal_heading_yaw_wait_finish_2-flightcontrol-fcl-return-finished-1_f3d-2-1-364_heli1_heli1_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli1_fcl-return-finished_n0) (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-2-1-364) (fly3d-fsm_exec-is-action2-wait_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action2-exit_f3d-2-1-364) (not (fault-count-3_lost_heli1_fcl-return-finished_n0)) (not (fly3d-fsm_exec-is-action2-wait_f3d-2-1-364))))
 (:action fly3d-enter_turn_to_goal_heading_yaw_wait_finish_2-flightcontrol-fcl-return-finished-1_f3d-3-0-369_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-return-finished_n0) (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-3-0-369) (fly3d-fsm_exec-is-action2-wait_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action2-exit_f3d-3-0-369) (not (fault-count-3_lost_heli0_fcl-return-finished_n0)) (not (fly3d-fsm_exec-is-action2-wait_f3d-3-0-369))))
 (:action fly3d-enter_turn_to_goal_heading_yaw_wait_cancel_1-flightcontrol-fcl-return-canceled-1_f3d-2-1-364_heli1_heli1_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli1_fcl-return-canceled_n0) (fly3d-mode-is-running_f3d-2-1-364) (fly3d-in_start_call-is-no_f3d-2-1-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-2-1-364) (fly3d-fsm_exec-is-action2-wait_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action2-exit_f3d-2-1-364) (not (fault-count-3_lost_heli1_fcl-return-canceled_n0)) (not (fly3d-fsm_exec-is-action2-wait_f3d-2-1-364))))
 (:action fly3d-enter_turn_to_goal_heading_yaw_wait_cancel_1-flightcontrol-fcl-return-canceled-1_f3d-3-0-369_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-return-canceled_n0) (fly3d-mode-is-running_f3d-3-0-369) (fly3d-in_start_call-is-no_f3d-3-0-369) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-3-0-369) (fly3d-fsm_exec-is-action2-wait_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action2-exit_f3d-3-0-369) (not (fault-count-3_lost_heli0_fcl-return-canceled_n0)) (not (fly3d-fsm_exec-is-action2-wait_f3d-3-0-369))))
 (:action fly3d-enter_turn_to_goal_heading_yaw_wait_cancel_2-flightcontrol-fcl-return-manual-1_f3d-2-1-364_heli1_heli1_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli1_fcl-return-manual_n0) (fly3d-mode-is-running_f3d-2-1-364) (fly3d-in_start_call-is-no_f3d-2-1-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-2-1-364) (fly3d-fsm_exec-is-action2-wait_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action2-exit_f3d-2-1-364) (not (fault-count-3_lost_heli1_fcl-return-manual_n0)) (not (fly3d-fsm_exec-is-action2-wait_f3d-2-1-364))))
 (:action fly3d-enter_turn_to_goal_heading_yaw_wait_cancel_2-flightcontrol-fcl-return-manual-1_f3d-3-0-369_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-return-manual_n0) (fly3d-mode-is-running_f3d-3-0-369) (fly3d-in_start_call-is-no_f3d-3-0-369) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-3-0-369) (fly3d-fsm_exec-is-action2-wait_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action2-exit_f3d-3-0-369) (not (fault-count-3_lost_heli0_fcl-return-manual_n0)) (not (fly3d-fsm_exec-is-action2-wait_f3d-3-0-369))))
 (:action fly3d-enter_turn_to_goal_heading_yaw_wait_error-flightcontrol-fcl-return-not_accepted-1_f3d-2-1-364_heli1_heli1_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli1_fcl-return-not_accepted_n0) (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-2-1-364) (fly3d-fsm_exec-is-action2-wait_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action2-fail_f3d-2-1-364) (not (fault-count-3_lost_heli1_fcl-return-not_accepted_n0)) (not (fly3d-fsm_exec-is-action2-wait_f3d-2-1-364))))
 (:action fly3d-enter_turn_to_goal_heading_yaw_wait_error-flightcontrol-fcl-return-not_accepted-1_f3d-3-0-369_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-return-not_accepted_n0) (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-3-0-369) (fly3d-fsm_exec-is-action2-wait_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action2-fail_f3d-3-0-369) (not (fault-count-3_lost_heli0_fcl-return-not_accepted_n0)) (not (fly3d-fsm_exec-is-action2-wait_f3d-3-0-369))))
 (:action fly3d-enter_turn_to_goal_heading_checkpoint31a-1_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_checkpoint31_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_state-is-goal_point_wait_f3d-2-1-364) (not (fly3d-fsm_state-is-turn_to_goal_heading_f3d-2-1-364)) (not (fault-count-3_lost_f3d-2-1-364_checkpoint31_n0))))
 (:action fly3d-enter_turn_to_goal_heading_checkpoint31a-1_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_checkpoint31_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_state-is-goal_point_wait_f3d-3-0-369) (not (fly3d-fsm_state-is-turn_to_goal_heading_f3d-3-0-369)) (not (fault-count-3_lost_f3d-3-0-369_checkpoint31_n0))))
 (:action fly3d-enter_turn_to_goal_heading_checkpoint31b-1_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_checkpoint31_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action2-exit_f3d-2-1-364) (not (fly3d-fsm_exec-is-action1_f3d-2-1-364)) (not (fault-count-3_lost_f3d-2-1-364_checkpoint31_n0))))
 (:action fly3d-enter_turn_to_goal_heading_checkpoint31b-1_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_checkpoint31_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action2-exit_f3d-3-0-369) (not (fly3d-fsm_exec-is-action1_f3d-3-0-369)) (not (fault-count-3_lost_f3d-3-0-369_checkpoint31_n0))))
 (:action fly3d-enter_goal_point_wait_checkpoint40-1_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-fsm_state-is-goal_point_wait_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_checkpoint40_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (not (fly3d-fsm_exec-is-action1_f3d-2-1-364)) (not (fault-count-3_lost_f3d-2-1-364_checkpoint40_n0))))
 (:action fly3d-enter_goal_point_wait_checkpoint40-1_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (fly3d-fsm_state-is-goal_point_wait_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_checkpoint40_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (not (fly3d-fsm_exec-is-action1_f3d-3-0-369)) (not (fault-count-3_lost_f3d-3-0-369_checkpoint40_n0))))
 (:action fly3d-goal_point_wait_cmd_continue_1_f3d-2-1-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (fly3d-fsm_state-is-goal_point_wait_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_state-is-turn_to_segment_heading_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (not (fly3d-fsm_exec-is-nothing_f3d-2-1-364)) (not (fly3d-fsm_state-is-goal_point_wait_f3d-2-1-364))))
 (:action fly3d-goal_point_wait_cmd_continue_1_f3d-3-0-369
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (fly3d-fsm_state-is-goal_point_wait_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_state-is-turn_to_segment_heading_f3d-3-0-369) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (not (fly3d-fsm_exec-is-nothing_f3d-3-0-369)) (not (fly3d-fsm_state-is-goal_point_wait_f3d-3-0-369))))
 (:action fly3d-goal_point_wait_idle_1_f3d-2-1-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (fly3d-fsm_state-is-goal_point_wait_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_state-is-turn_to_segment_heading_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (not (fly3d-fsm_exec-is-nothing_f3d-2-1-364)) (not (fly3d-fsm_state-is-goal_point_wait_f3d-2-1-364))))
 (:action fly3d-goal_point_wait_idle_1_f3d-3-0-369
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (fly3d-fsm_state-is-goal_point_wait_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_state-is-turn_to_segment_heading_f3d-3-0-369) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (not (fly3d-fsm_exec-is-nothing_f3d-3-0-369)) (not (fly3d-fsm_state-is-goal_point_wait_f3d-3-0-369))))
 (:action fly3d-global_fcl_canceled-flightcontrol-fcl-event-canceled-1_f3d-2-1-364_heli1_heli1_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli1_fcl-event-canceled_n0) (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-global_reaction_cancel_1_f3d-2-1-364) (not (fault-count-3_lost_heli1_fcl-event-canceled_n0)) (not (dominates-3_hyp2_lost_heli1_fcl-event-canceled)) (not (dominates-3_hyp1_lost_heli1_fcl-event-canceled)) (not (fly3d-fsm_exec-is-nothing_f3d-2-1-364))))
 (:action fly3d-global_fcl_canceled-flightcontrol-fcl-event-canceled-1_f3d-3-0-369_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-canceled_n0) (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-global_reaction_cancel_1_f3d-3-0-369) (not (fault-count-3_lost_heli0_fcl-event-canceled_n0)) (not (dominates-3_hyp2_lost_heli0_fcl-event-canceled)) (not (fly3d-fsm_exec-is-nothing_f3d-3-0-369))))
 (:action fly3d-global_fcl_manual-flightcontrol-fcl-event-manual-1_f3d-2-1-364_heli1_heli1_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli1_fcl-event-manual_n0) (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-global_reaction_cancel_1_f3d-2-1-364) (not (fault-count-3_lost_heli1_fcl-event-manual_n0)) (not (fly3d-fsm_exec-is-nothing_f3d-2-1-364))))
 (:action fly3d-global_fcl_manual-flightcontrol-fcl-event-manual-1_f3d-3-0-369_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-manual_n0) (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-global_reaction_cancel_1_f3d-3-0-369) (not (fault-count-3_lost_heli0_fcl-event-manual_n0)) (not (dominates-3_hyp1_lost_heli0_fcl-event-manual)) (not (fly3d-fsm_exec-is-nothing_f3d-3-0-369))))
 (:action fly3d-global_fcl_error-flightcontrol-fcl-event-not_accepted-1_f3d-2-1-364_heli1_heli1_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli1_fcl-event-not_accepted_n0) (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-global_reaction_error_1_f3d-2-1-364) (not (fault-count-3_lost_heli1_fcl-event-not_accepted_n0)) (not (fly3d-fsm_exec-is-nothing_f3d-2-1-364))))
 (:action fly3d-global_fcl_error-flightcontrol-fcl-event-not_accepted-1_f3d-3-0-369_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-not_accepted_n0) (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-global_reaction_error_1_f3d-3-0-369) (not (fault-count-3_lost_heli0_fcl-event-not_accepted_n0)) (not (fly3d-fsm_exec-is-nothing_f3d-3-0-369))))
 (:action navtopoint-start_decouple_idle_time_out_nav-4-1-362
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-4-1-362) (navtopoint-fsm_state-is-start_decouple_nav-4-1-362) (navtopoint-fsm_exec-is-nothing_nav-4-1-362) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-action1_nav-4-1-362) (navtopoint-fsm_state-is-plan_path_nav-4-1-362) (not (navtopoint-fsm_state-is-start_decouple_nav-4-1-362)) (not (navtopoint-fsm_exec-is-nothing_nav-4-1-362))))
 (:action navtopoint-start_decouple_idle_time_out_nav-3-1-259
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_state-is-start_decouple_nav-3-1-259) (navtopoint-fsm_exec-is-nothing_nav-3-1-259) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-action1_nav-3-1-259) (navtopoint-fsm_state-is-plan_path_nav-3-1-259) (not (navtopoint-fsm_state-is-start_decouple_nav-3-1-259)) (not (navtopoint-fsm_exec-is-nothing_nav-3-1-259))))
 (:action navtopoint-start_decouple_idle_time_out_nav-3-0-257
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_state-is-start_decouple_nav-3-0-257) (navtopoint-fsm_exec-is-nothing_nav-3-0-257) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-action1_nav-3-0-257) (navtopoint-fsm_state-is-plan_path_nav-3-0-257) (not (navtopoint-fsm_state-is-start_decouple_nav-3-0-257)) (not (navtopoint-fsm_exec-is-nothing_nav-3-0-257))))
 (:action navtopoint-plan_path_action1_checkpoint1-0_nav-4-1-362_obs26
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-4-1-362) (navtopoint-fsm_exec-is-action1_nav-4-1-362) (navtopoint-fsm_state-is-plan_path_nav-4-1-362) (pending_obs26) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-action2_nav-4-1-362) (observed_obs26) (not (navtopoint-fsm_exec-is-action1_nav-4-1-362)) (not (pending_obs26))))
 (:action navtopoint-plan_path_action1_checkpoint1-0_nav-3-1-259_obs11
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_exec-is-action1_nav-3-1-259) (navtopoint-fsm_state-is-plan_path_nav-3-1-259) (pending_obs11) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-action2_nav-3-1-259) (observed_obs11) (not (navtopoint-fsm_exec-is-action1_nav-3-1-259)) (not (pending_obs11))))
 (:action navtopoint-plan_path_action1_checkpoint1-1_nav-4-1-362_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-4-1-362) (navtopoint-fsm_exec-is-action1_nav-4-1-362) (navtopoint-fsm_state-is-plan_path_nav-4-1-362) (fault-count-3_lost_nav-4-1-362_checkpoint1_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-action2_nav-4-1-362) (not (navtopoint-fsm_exec-is-action1_nav-4-1-362)) (not (fault-count-3_lost_nav-4-1-362_checkpoint1_n0))))
 (:action navtopoint-plan_path_action1_checkpoint1-1_nav-3-1-259_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_exec-is-action1_nav-3-1-259) (navtopoint-fsm_state-is-plan_path_nav-3-1-259) (fault-count-3_lost_nav-3-1-259_checkpoint1_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-action2_nav-3-1-259) (not (navtopoint-fsm_exec-is-action1_nav-3-1-259)) (not (fault-count-3_lost_nav-3-1-259_checkpoint1_n0))))
 (:action navtopoint-plan_path_action1_checkpoint1-1_nav-3-0-257_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_exec-is-action1_nav-3-0-257) (navtopoint-fsm_state-is-plan_path_nav-3-0-257) (fault-count-3_lost_nav-3-0-257_checkpoint1_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-action2_nav-3-0-257) (not (navtopoint-fsm_exec-is-action1_nav-3-0-257)) (not (fault-count-3_lost_nav-3-0-257_checkpoint1_n0)) (not (dominates-3_hyp2_lost_nav-3-0-257_checkpoint1)) (not (dominates-3_hyp1_lost_nav-3-0-257_checkpoint1))))
 (:action navtopoint-plan_path_action2_checkpoint4a-0_nav-3-1-259_obs14
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_state-is-plan_path_nav-3-1-259) (navtopoint-fsm_exec-is-action2_nav-3-1-259) (navtopoint-in_start_call-is-no_nav-3-1-259) (pending_obs14) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-nothing_nav-3-1-259) (navtopoint-fsm_state-is-wait_for_go_nav-3-1-259) (observed_obs14) (not (navtopoint-fsm_state-is-plan_path_nav-3-1-259)) (not (navtopoint-fsm_exec-is-action2_nav-3-1-259)) (not (pending_obs14))))
 (:action navtopoint-plan_path_action2_checkpoint4a-1_nav-4-1-362_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-4-1-362) (navtopoint-fsm_state-is-plan_path_nav-4-1-362) (navtopoint-fsm_exec-is-action2_nav-4-1-362) (navtopoint-in_start_call-is-no_nav-4-1-362) (fault-count-3_lost_nav-4-1-362_checkpoint4_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-nothing_nav-4-1-362) (navtopoint-fsm_state-is-wait_for_go_nav-4-1-362) (not (navtopoint-fsm_state-is-plan_path_nav-4-1-362)) (not (navtopoint-fsm_exec-is-action2_nav-4-1-362)) (not (fault-count-3_lost_nav-4-1-362_checkpoint4_n0))))
 (:action navtopoint-plan_path_action2_checkpoint4a-1_nav-3-1-259_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_state-is-plan_path_nav-3-1-259) (navtopoint-fsm_exec-is-action2_nav-3-1-259) (navtopoint-in_start_call-is-no_nav-3-1-259) (fault-count-3_lost_nav-3-1-259_checkpoint4_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-nothing_nav-3-1-259) (navtopoint-fsm_state-is-wait_for_go_nav-3-1-259) (not (navtopoint-fsm_state-is-plan_path_nav-3-1-259)) (not (navtopoint-fsm_exec-is-action2_nav-3-1-259)) (not (fault-count-3_lost_nav-3-1-259_checkpoint4_n0))))
 (:action navtopoint-plan_path_action2_checkpoint4a-1_nav-3-0-257_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_state-is-plan_path_nav-3-0-257) (navtopoint-fsm_exec-is-action2_nav-3-0-257) (navtopoint-in_start_call-is-no_nav-3-0-257) (fault-count-3_lost_nav-3-0-257_checkpoint4_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-nothing_nav-3-0-257) (navtopoint-fsm_state-is-wait_for_go_nav-3-0-257) (not (navtopoint-fsm_state-is-plan_path_nav-3-0-257)) (not (navtopoint-fsm_exec-is-action2_nav-3-0-257)) (not (fault-count-3_lost_nav-3-0-257_checkpoint4_n0)) (not (dominates-3_hyp2_lost_nav-3-0-257_checkpoint4)) (not (dominates-3_hyp1_lost_nav-3-0-257_checkpoint4))))
 (:action navtopoint-plan_path_action2_checkpoint4b-0_nav-3-1-259_obs14
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_state-is-plan_path_nav-3-1-259) (navtopoint-fsm_exec-is-action2_nav-3-1-259) (pending_obs14) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-action1_nav-3-1-259) (observed_obs14) (navtopoint-fsm_state-is-fly_path_nav-3-1-259) (not (navtopoint-fsm_state-is-plan_path_nav-3-1-259)) (not (navtopoint-fsm_exec-is-action2_nav-3-1-259)) (not (pending_obs14))))
 (:action navtopoint-plan_path_action2_checkpoint4b-1_nav-4-1-362_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-4-1-362) (navtopoint-fsm_state-is-plan_path_nav-4-1-362) (navtopoint-fsm_exec-is-action2_nav-4-1-362) (fault-count-3_lost_nav-4-1-362_checkpoint4_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-action1_nav-4-1-362) (navtopoint-fsm_state-is-fly_path_nav-4-1-362) (not (navtopoint-fsm_state-is-plan_path_nav-4-1-362)) (not (navtopoint-fsm_exec-is-action2_nav-4-1-362)) (not (fault-count-3_lost_nav-4-1-362_checkpoint4_n0))))
 (:action navtopoint-plan_path_action2_checkpoint4b-1_nav-3-1-259_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_state-is-plan_path_nav-3-1-259) (navtopoint-fsm_exec-is-action2_nav-3-1-259) (fault-count-3_lost_nav-3-1-259_checkpoint4_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-action1_nav-3-1-259) (navtopoint-fsm_state-is-fly_path_nav-3-1-259) (not (navtopoint-fsm_state-is-plan_path_nav-3-1-259)) (not (navtopoint-fsm_exec-is-action2_nav-3-1-259)) (not (fault-count-3_lost_nav-3-1-259_checkpoint4_n0))))
 (:action navtopoint-plan_path_action2_checkpoint4b-1_nav-3-0-257_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_state-is-plan_path_nav-3-0-257) (navtopoint-fsm_exec-is-action2_nav-3-0-257) (fault-count-3_lost_nav-3-0-257_checkpoint4_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-action1_nav-3-0-257) (navtopoint-fsm_state-is-fly_path_nav-3-0-257) (not (navtopoint-fsm_state-is-plan_path_nav-3-0-257)) (not (navtopoint-fsm_exec-is-action2_nav-3-0-257)) (not (fault-count-3_lost_nav-3-0-257_checkpoint4_n0)) (not (dominates-3_hyp2_lost_nav-3-0-257_checkpoint4)) (not (dominates-3_hyp1_lost_nav-3-0-257_checkpoint4))))
 (:action navtopoint-wait_for_go_ok_nav-4-1-362
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-4-1-362) (navtopoint-fsm_exec-is-nothing_nav-4-1-362) (navtopoint-fsm_state-is-wait_for_go_nav-4-1-362) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-action1_nav-4-1-362) (navtopoint-fsm_state-is-fly_path_nav-4-1-362) (not (navtopoint-fsm_exec-is-nothing_nav-4-1-362)) (not (navtopoint-fsm_state-is-wait_for_go_nav-4-1-362))))
 (:action navtopoint-wait_for_go_ok_nav-3-1-259
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_exec-is-nothing_nav-3-1-259) (navtopoint-fsm_state-is-wait_for_go_nav-3-1-259) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-action1_nav-3-1-259) (navtopoint-fsm_state-is-fly_path_nav-3-1-259) (not (navtopoint-fsm_exec-is-nothing_nav-3-1-259)) (not (navtopoint-fsm_state-is-wait_for_go_nav-3-1-259))))
 (:action navtopoint-wait_for_go_ok_nav-3-0-257
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_exec-is-nothing_nav-3-0-257) (navtopoint-fsm_state-is-wait_for_go_nav-3-0-257) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-action1_nav-3-0-257) (navtopoint-fsm_state-is-fly_path_nav-3-0-257) (not (navtopoint-fsm_exec-is-nothing_nav-3-0-257)) (not (navtopoint-fsm_state-is-wait_for_go_nav-3-0-257))))
 (:action navtopoint-fly_path_action1_proxy_init_ok-fly3d-call_set_args_nav-4-1-362_f3d-2-1-364_heli1_f3d-2-1-364_nav-4-1-362
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-4-1-362) (navtopoint-fsm_exec-is-action1_nav-4-1-362) (navtopoint-in_start_call-is-no_nav-4-1-362) (navtopoint-fsm_state-is-fly_path_nav-4-1-362) (fly3d-mode-is-pre_init_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-nothing_nav-4-1-362) (navtopoint-fly_trajectory_task_nav-4-1-362_f3d-2-1-364) (fly3d-mode-is-processing_f3d-2-1-364) (called-by_f3d-2-1-364_nav-4-1-362) (not (navtopoint-fsm_exec-is-action1_nav-4-1-362)) (not (fly3d-mode-is-pre_init_f3d-2-1-364))))
 (:action navtopoint-fly_path_action1_proxy_init_ok-fly3d-call_set_args_nav-3-1-259_f3d-2-1-364_heli1_f3d-2-1-364_nav-3-1-259
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_exec-is-action1_nav-3-1-259) (navtopoint-in_start_call-is-no_nav-3-1-259) (navtopoint-fsm_state-is-fly_path_nav-3-1-259) (fly3d-mode-is-pre_init_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-nothing_nav-3-1-259) (fly3d-mode-is-processing_f3d-2-1-364) (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364) (called-by_f3d-2-1-364_nav-3-1-259) (not (navtopoint-fsm_exec-is-action1_nav-3-1-259)) (not (fly3d-mode-is-pre_init_f3d-2-1-364))))
 (:action navtopoint-fly_path_action1_proxy_init_ok-fly3d-call_set_args_nav-3-0-257_f3d-3-0-369_heli0_f3d-3-0-369_nav-3-0-257
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_exec-is-action1_nav-3-0-257) (navtopoint-in_start_call-is-no_nav-3-0-257) (navtopoint-fsm_state-is-fly_path_nav-3-0-257) (fly3d-mode-is-pre_init_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-nothing_nav-3-0-257) (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369) (fly3d-mode-is-processing_f3d-3-0-369) (called-by_f3d-3-0-369_nav-3-0-257) (not (navtopoint-fsm_exec-is-action1_nav-3-0-257)) (not (fly3d-mode-is-pre_init_f3d-3-0-369))))
 (:action navtopoint-fly_path_fly3d_ready-fly3d-init_ok-0_nav-3-1-259_f3d-2-1-364_f3d-2-1-364_nav-3-1-259_obs15
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_exec-is-nothing_nav-3-1-259) (navtopoint-fsm_state-is-fly_path_nav-3-1-259) (fly3d-mode-is-processing_f3d-2-1-364) (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364) (called-by_f3d-2-1-364_nav-3-1-259) (pending_obs15) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-ready_f3d-2-1-364) (observed_obs15) (navtopoint-fsm_exec-is-reaction_f3d_ready_nav-3-1-259) (not (navtopoint-fsm_exec-is-nothing_nav-3-1-259)) (not (fly3d-mode-is-processing_f3d-2-1-364)) (not (pending_obs15))))
 (:action navtopoint-fly_path_fly3d_ready-fly3d-init_ok-0_nav-3-0-257_f3d-3-0-369_f3d-3-0-369_nav-3-0-257_obs12
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_exec-is-nothing_nav-3-0-257) (navtopoint-fsm_state-is-fly_path_nav-3-0-257) (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369) (fly3d-mode-is-processing_f3d-3-0-369) (called-by_f3d-3-0-369_nav-3-0-257) (pending_obs12) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-ready_f3d-3-0-369) (observed_obs12) (navtopoint-fsm_exec-is-reaction_f3d_ready_nav-3-0-257) (not (navtopoint-fsm_exec-is-nothing_nav-3-0-257)) (not (fly3d-mode-is-processing_f3d-3-0-369)) (not (pending_obs12))))
 (:action navtopoint-fly_path_fly3d_ready-fly3d-init_ok-1_nav-4-1-362_f3d-2-1-364_f3d-2-1-364_nav-4-1-362_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-4-1-362) (navtopoint-fsm_exec-is-nothing_nav-4-1-362) (navtopoint-fsm_state-is-fly_path_nav-4-1-362) (navtopoint-fly_trajectory_task_nav-4-1-362_f3d-2-1-364) (fly3d-mode-is-processing_f3d-2-1-364) (called-by_f3d-2-1-364_nav-4-1-362) (fault-count-4_lost_f3d-2-1-364_created_nav-4-1-362_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-reaction_f3d_ready_nav-4-1-362) (fly3d-mode-is-ready_f3d-2-1-364) (not (navtopoint-fsm_exec-is-nothing_nav-4-1-362)) (not (fly3d-mode-is-processing_f3d-2-1-364)) (not (fault-count-4_lost_f3d-2-1-364_created_nav-4-1-362_n0))))
 (:action navtopoint-fly_path_fly3d_ready-fly3d-init_ok-1_nav-3-1-259_f3d-2-1-364_f3d-2-1-364_nav-3-1-259_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_exec-is-nothing_nav-3-1-259) (navtopoint-fsm_state-is-fly_path_nav-3-1-259) (fly3d-mode-is-processing_f3d-2-1-364) (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364) (called-by_f3d-2-1-364_nav-3-1-259) (fault-count-4_lost_f3d-2-1-364_created_nav-3-1-259_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-ready_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_ready_nav-3-1-259) (not (navtopoint-fsm_exec-is-nothing_nav-3-1-259)) (not (fly3d-mode-is-processing_f3d-2-1-364)) (not (fault-count-4_lost_f3d-2-1-364_created_nav-3-1-259_n0))))
 (:action navtopoint-fly_path_fly3d_ready-fly3d-init_ok-1_nav-3-0-257_f3d-3-0-369_f3d-3-0-369_nav-3-0-257_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_exec-is-nothing_nav-3-0-257) (navtopoint-fsm_state-is-fly_path_nav-3-0-257) (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369) (fly3d-mode-is-processing_f3d-3-0-369) (called-by_f3d-3-0-369_nav-3-0-257) (fault-count-4_lost_f3d-3-0-369_created_nav-3-0-257_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-ready_f3d-3-0-369) (navtopoint-fsm_exec-is-reaction_f3d_ready_nav-3-0-257) (not (navtopoint-fsm_exec-is-nothing_nav-3-0-257)) (not (fly3d-mode-is-processing_f3d-3-0-369)) (not (fault-count-4_lost_f3d-3-0-369_created_nav-3-0-257_n0))))
 (:action navtopoint-fly_path_fly3d_ready_call_start-fly3d-call_start_nav-4-1-362_f3d-2-1-364_f3d-2-1-364
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-4-1-362) (navtopoint-fsm_state-is-fly_path_nav-4-1-362) (navtopoint-fly_trajectory_task_nav-4-1-362_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_ready_nav-4-1-362) (fly3d-mode-is-ready_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-start_f3d-2-1-364) (navtopoint-fsm_exec-is-nothing_nav-4-1-362) (fly3d-in_start_call-is-yes_f3d-2-1-364) (not (navtopoint-fsm_exec-is-reaction_f3d_ready_nav-4-1-362)) (not (fly3d-mode-is-ready_f3d-2-1-364))))
 (:action navtopoint-fly_path_fly3d_ready_call_start-fly3d-call_start_nav-3-1-259_f3d-2-1-364_f3d-2-1-364
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_state-is-fly_path_nav-3-1-259) (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364) (fly3d-mode-is-ready_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_ready_nav-3-1-259) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-start_f3d-2-1-364) (navtopoint-fsm_exec-is-nothing_nav-3-1-259) (fly3d-in_start_call-is-yes_f3d-2-1-364) (not (fly3d-mode-is-ready_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-reaction_f3d_ready_nav-3-1-259))))
 (:action navtopoint-fly_path_fly3d_ready_call_start-fly3d-call_start_nav-3-0-257_f3d-3-0-369_f3d-3-0-369
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_state-is-fly_path_nav-3-0-257) (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369) (fly3d-mode-is-ready_f3d-3-0-369) (navtopoint-fsm_exec-is-reaction_f3d_ready_nav-3-0-257) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-start_f3d-3-0-369) (navtopoint-fsm_exec-is-nothing_nav-3-0-257) (fly3d-in_start_call-is-yes_f3d-3-0-369) (not (fly3d-mode-is-ready_f3d-3-0-369)) (not (navtopoint-fsm_exec-is-reaction_f3d_ready_nav-3-0-257))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_starting_yaw_command_ok_sync_nav-4-1-362_f3d-2-1-364_f3d-2-1-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-1-364) (navtopoint-fly_trajectory_task_nav-4-1-362_f3d-2-1-364) (fly3d-in_start_call-is-yes_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-2-1-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (not (fly3d-fsm_exec-is-action1_f3d-2-1-364)) (not (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-1-364)) (not (fly3d-in_start_call-is-yes_f3d-2-1-364))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_starting_yaw_command_ok_sync_nav-3-1-259_f3d-2-1-364_f3d-2-1-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-1-364) (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364) (fly3d-in_start_call-is-yes_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-2-1-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (not (fly3d-fsm_exec-is-action1_f3d-2-1-364)) (not (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-1-364)) (not (fly3d-in_start_call-is-yes_f3d-2-1-364))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_starting_yaw_command_ok_sync_nav-3-0-257_f3d-3-0-369_f3d-3-0-369
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-3-0-369) (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369) (fly3d-in_start_call-is-yes_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-3-0-369) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (not (fly3d-fsm_exec-is-action1_f3d-3-0-369)) (not (fly3d-fsm_state-is-send_starting_yaw_command_f3d-3-0-369)) (not (fly3d-in_start_call-is-yes_f3d-3-0-369))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_starting_yaw_command_checkpoint12_sync-1_nav-4-1-362_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_checkpoint12_n0) (navtopoint-fly_trajectory_task_nav-4-1-362_f3d-2-1-364) (fly3d-in_start_call-is-yes_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (not (fly3d-fsm_exec-is-action1_f3d-2-1-364)) (not (fault-count-3_lost_f3d-2-1-364_checkpoint12_n0)) (not (fly3d-in_start_call-is-yes_f3d-2-1-364))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_starting_yaw_command_checkpoint12_sync-1_nav-3-1-259_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_checkpoint12_n0) (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364) (fly3d-in_start_call-is-yes_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (not (fly3d-fsm_exec-is-action1_f3d-2-1-364)) (not (fault-count-3_lost_f3d-2-1-364_checkpoint12_n0)) (not (fly3d-in_start_call-is-yes_f3d-2-1-364))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_starting_yaw_command_checkpoint12_sync-1_nav-3-0-257_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_checkpoint12_n0) (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369) (fly3d-in_start_call-is-yes_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (not (fly3d-fsm_exec-is-action1_f3d-3-0-369)) (not (fault-count-3_lost_f3d-3-0-369_checkpoint12_n0)) (not (fly3d-in_start_call-is-yes_f3d-3-0-369))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_first_trajectory_checkpoint20_sync-1_nav-4-1-362_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_checkpoint20_n0) (navtopoint-fly_trajectory_task_nav-4-1-362_f3d-2-1-364) (fly3d-in_start_call-is-yes_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (not (fly3d-fsm_exec-is-action1_f3d-2-1-364)) (not (fault-count-3_lost_f3d-2-1-364_checkpoint20_n0)) (not (fly3d-trajectory-not-sent_f3d-2-1-364)) (not (fly3d-in_start_call-is-yes_f3d-2-1-364))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_first_trajectory_checkpoint20_sync-1_nav-3-1-259_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_checkpoint20_n0) (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364) (fly3d-in_start_call-is-yes_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (not (fly3d-fsm_exec-is-action1_f3d-2-1-364)) (not (fault-count-3_lost_f3d-2-1-364_checkpoint20_n0)) (not (fly3d-trajectory-not-sent_f3d-2-1-364)) (not (fly3d-in_start_call-is-yes_f3d-2-1-364))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_first_trajectory_checkpoint20_sync-1_nav-3-0-257_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (fly3d-fsm_state-is-send_first_trajectory_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_checkpoint20_n0) (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369) (fly3d-in_start_call-is-yes_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (not (fly3d-fsm_exec-is-action1_f3d-3-0-369)) (not (fault-count-3_lost_f3d-3-0-369_checkpoint20_n0)) (not (fly3d-trajectory-not-sent_f3d-3-0-369)) (not (fly3d-in_start_call-is-yes_f3d-3-0-369))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_first_trajectory_checkpoint21_sync-0_nav-3-1-259_f3d-2-1-364_f3d-2-1-364_obs19
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (pending_obs19) (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364) (fly3d-in_start_call-is-yes_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-1-364) (observed_obs19) (not (fly3d-fsm_exec-is-action1_f3d-2-1-364)) (not (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364)) (not (fly3d-trajectory-not-sent_f3d-2-1-364)) (not (pending_obs19)) (not (fly3d-in_start_call-is-yes_f3d-2-1-364))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_first_trajectory_checkpoint21_sync-1_nav-4-1-362_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_checkpoint21_n0) (navtopoint-fly_trajectory_task_nav-4-1-362_f3d-2-1-364) (fly3d-in_start_call-is-yes_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-1-364) (not (fly3d-fsm_exec-is-action1_f3d-2-1-364)) (not (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364)) (not (fly3d-trajectory-not-sent_f3d-2-1-364)) (not (fault-count-3_lost_f3d-2-1-364_checkpoint21_n0)) (not (fly3d-in_start_call-is-yes_f3d-2-1-364))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_first_trajectory_checkpoint21_sync-1_nav-3-1-259_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_checkpoint21_n0) (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364) (fly3d-in_start_call-is-yes_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-1-364) (not (fly3d-fsm_exec-is-action1_f3d-2-1-364)) (not (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364)) (not (fly3d-trajectory-not-sent_f3d-2-1-364)) (not (fault-count-3_lost_f3d-2-1-364_checkpoint21_n0)) (not (fly3d-in_start_call-is-yes_f3d-2-1-364))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_first_trajectory_checkpoint21_sync-1_nav-3-0-257_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (fly3d-fsm_state-is-send_first_trajectory_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_checkpoint21_n0) (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369) (fly3d-in_start_call-is-yes_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (fly3d-fsm_state-is-wait_trajectory_end_f3d-3-0-369) (not (fly3d-fsm_exec-is-action1_f3d-3-0-369)) (not (fly3d-fsm_state-is-send_first_trajectory_f3d-3-0-369)) (not (fly3d-trajectory-not-sent_f3d-3-0-369)) (not (fault-count-3_lost_f3d-3-0-369_checkpoint21_n0)) (not (fly3d-in_start_call-is-yes_f3d-3-0-369))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_first_trajectory_checkpoint21_after22_sync-0_nav-3-1-259_f3d-2-1-364_f3d-2-1-364_obs19
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (pending_obs19) (fly3d-fsm_exec-is-action2_f3d-2-1-364) (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364) (fly3d-in_start_call-is-yes_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-1-364) (observed_obs19) (not (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364)) (not (fly3d-trajectory-not-sent_f3d-2-1-364)) (not (pending_obs19)) (not (fly3d-fsm_exec-is-action2_f3d-2-1-364)) (not (fly3d-in_start_call-is-yes_f3d-2-1-364))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_first_trajectory_checkpoint21_after22_sync-1_nav-4-1-362_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_checkpoint21_n0) (fly3d-fsm_exec-is-action2_f3d-2-1-364) (navtopoint-fly_trajectory_task_nav-4-1-362_f3d-2-1-364) (fly3d-in_start_call-is-yes_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-1-364) (not (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364)) (not (fly3d-trajectory-not-sent_f3d-2-1-364)) (not (fault-count-3_lost_f3d-2-1-364_checkpoint21_n0)) (not (fly3d-fsm_exec-is-action2_f3d-2-1-364)) (not (fly3d-in_start_call-is-yes_f3d-2-1-364))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_first_trajectory_checkpoint21_after22_sync-1_nav-3-1-259_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_checkpoint21_n0) (fly3d-fsm_exec-is-action2_f3d-2-1-364) (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364) (fly3d-in_start_call-is-yes_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-1-364) (not (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364)) (not (fly3d-trajectory-not-sent_f3d-2-1-364)) (not (fault-count-3_lost_f3d-2-1-364_checkpoint21_n0)) (not (fly3d-fsm_exec-is-action2_f3d-2-1-364)) (not (fly3d-in_start_call-is-yes_f3d-2-1-364))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_first_trajectory_checkpoint21_after22_sync-1_nav-3-0-257_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-send_first_trajectory_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_checkpoint21_n0) (fly3d-fsm_exec-is-action2_f3d-3-0-369) (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369) (fly3d-in_start_call-is-yes_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (fly3d-fsm_state-is-wait_trajectory_end_f3d-3-0-369) (not (fly3d-fsm_state-is-send_first_trajectory_f3d-3-0-369)) (not (fly3d-trajectory-not-sent_f3d-3-0-369)) (not (fault-count-3_lost_f3d-3-0-369_checkpoint21_n0)) (not (fly3d-fsm_exec-is-action2_f3d-3-0-369)) (not (fly3d-in_start_call-is-yes_f3d-3-0-369))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_first_trajectory_busy_sync_nav-4-1-362_f3d-2-1-364_f3d-2-1-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (navtopoint-fly_trajectory_task_nav-4-1-362_f3d-2-1-364) (fly3d-in_start_call-is-yes_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (fly3d-trajectory-not-sent_f3d-2-1-364) (not (fly3d-fsm_exec-is-action1_f3d-2-1-364)) (not (fly3d-in_start_call-is-yes_f3d-2-1-364))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_first_trajectory_busy_sync_nav-3-1-259_f3d-2-1-364_f3d-2-1-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364) (fly3d-in_start_call-is-yes_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (fly3d-trajectory-not-sent_f3d-2-1-364) (not (fly3d-fsm_exec-is-action1_f3d-2-1-364)) (not (fly3d-in_start_call-is-yes_f3d-2-1-364))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_first_trajectory_busy_sync_nav-3-0-257_f3d-3-0-369_f3d-3-0-369
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (fly3d-fsm_state-is-send_first_trajectory_f3d-3-0-369) (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369) (fly3d-in_start_call-is-yes_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (fly3d-trajectory-not-sent_f3d-3-0-369) (not (fly3d-fsm_exec-is-action1_f3d-3-0-369)) (not (fly3d-in_start_call-is-yes_f3d-3-0-369))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_first_trajectory_busy_after22_sync_nav-4-1-362_f3d-2-1-364_f3d-2-1-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (fly3d-fsm_exec-is-action2_f3d-2-1-364) (navtopoint-fly_trajectory_task_nav-4-1-362_f3d-2-1-364) (fly3d-in_start_call-is-yes_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (fly3d-trajectory-not-sent_f3d-2-1-364) (not (fly3d-fsm_exec-is-action2_f3d-2-1-364)) (not (fly3d-in_start_call-is-yes_f3d-2-1-364))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_first_trajectory_busy_after22_sync_nav-3-1-259_f3d-2-1-364_f3d-2-1-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (fly3d-fsm_exec-is-action2_f3d-2-1-364) (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364) (fly3d-in_start_call-is-yes_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (fly3d-trajectory-not-sent_f3d-2-1-364) (not (fly3d-fsm_exec-is-action2_f3d-2-1-364)) (not (fly3d-in_start_call-is-yes_f3d-2-1-364))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_first_trajectory_busy_after22_sync_nav-3-0-257_f3d-3-0-369_f3d-3-0-369
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-send_first_trajectory_f3d-3-0-369) (fly3d-fsm_exec-is-action2_f3d-3-0-369) (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369) (fly3d-in_start_call-is-yes_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (fly3d-trajectory-not-sent_f3d-3-0-369) (not (fly3d-fsm_exec-is-action2_f3d-3-0-369)) (not (fly3d-in_start_call-is-yes_f3d-3-0-369))))
 (:action navtopoint-fly_path_fly3d_sync_done-fly3d-start_exit_nav-4-1-362_f3d-2-1-364_f3d-2-1-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-start_f3d-2-1-364) (navtopoint-mode-is-running_nav-4-1-362) (navtopoint-fsm_exec-is-nothing_nav-4-1-362) (navtopoint-fsm_state-is-fly_path_nav-4-1-362) (navtopoint-fly_trajectory_task_nav-4-1-362_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-4-1-362) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-4-1-362))))
 (:action navtopoint-fly_path_fly3d_sync_done-fly3d-start_exit_nav-3-1-259_f3d-2-1-364_f3d-2-1-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-start_f3d-2-1-364) (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_exec-is-nothing_nav-3-1-259) (navtopoint-fsm_state-is-fly_path_nav-3-1-259) (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-3-1-259) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-3-1-259))))
 (:action navtopoint-fly_path_fly3d_sync_done-fly3d-start_exit_nav-3-0-257_f3d-3-0-369_f3d-3-0-369
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-start_f3d-3-0-369) (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_exec-is-nothing_nav-3-0-257) (navtopoint-fsm_state-is-fly_path_nav-3-0-257) (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-3-0-369) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-3-0-257) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (navtopoint-fsm_exec-is-nothing_nav-3-0-257))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-in_send_starting_yaw_command_fcl_cancel_reaction1-0_nav-3-1-259_f3d-2-1-364_f3d-2-1-364_obs22
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-1-364) (fly3d-fsm_exec-is-reaction_cancel_1_f3d-2-1-364) (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_exec-is-nothing_nav-3-1-259) (navtopoint-fsm_state-is-fly_path_nav-3-1-259) (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364) (pending_obs22) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-3-1-259) (observed_obs22) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-3-1-259)) (not (pending_obs22))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-in_send_starting_yaw_command_fcl_cancel_reaction1-0_nav-3-0-257_f3d-3-0-369_f3d-3-0-369_obs28
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-3-0-369) (fly3d-fsm_exec-is-reaction_cancel_1_f3d-3-0-369) (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_exec-is-nothing_nav-3-0-257) (navtopoint-fsm_state-is-fly_path_nav-3-0-257) (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369) (pending_obs28) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-3-0-369) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-3-0-257) (observed_obs28) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (navtopoint-fsm_exec-is-nothing_nav-3-0-257)) (not (pending_obs28))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-in_send_starting_yaw_command_fcl_cancel_reaction1-1_nav-4-1-362_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-1-364) (fly3d-fsm_exec-is-reaction_cancel_1_f3d-2-1-364) (navtopoint-mode-is-running_nav-4-1-362) (navtopoint-fsm_exec-is-nothing_nav-4-1-362) (navtopoint-fsm_state-is-fly_path_nav-4-1-362) (navtopoint-fly_trajectory_task_nav-4-1-362_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-4-1-362) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-4-1-362)) (not (fault-count-3_lost_f3d-2-1-364_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-in_send_starting_yaw_command_fcl_cancel_reaction1-1_nav-3-1-259_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-1-364) (fly3d-fsm_exec-is-reaction_cancel_1_f3d-2-1-364) (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_exec-is-nothing_nav-3-1-259) (navtopoint-fsm_state-is-fly_path_nav-3-1-259) (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-3-1-259) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-3-1-259)) (not (fault-count-3_lost_f3d-2-1-364_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-in_send_starting_yaw_command_fcl_cancel_reaction1-1_nav-3-0-257_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-3-0-369) (fly3d-fsm_exec-is-reaction_cancel_1_f3d-3-0-369) (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_exec-is-nothing_nav-3-0-257) (navtopoint-fsm_state-is-fly_path_nav-3-0-257) (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-3-0-369) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-3-0-257) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (navtopoint-fsm_exec-is-nothing_nav-3-0-257)) (not (fault-count-3_lost_f3d-3-0-369_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-in_wait_for_yaw_finish_fcl_cancel_reaction1-0_nav-3-1-259_f3d-2-1-364_f3d-2-1-364_obs22
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-1-364) (fly3d-fsm_exec-is-reaction_cancel_1_f3d-2-1-364) (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_exec-is-nothing_nav-3-1-259) (navtopoint-fsm_state-is-fly_path_nav-3-1-259) (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364) (pending_obs22) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-3-1-259) (observed_obs22) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-3-1-259)) (not (pending_obs22))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-in_wait_for_yaw_finish_fcl_cancel_reaction1-0_nav-3-0-257_f3d-3-0-369_f3d-3-0-369_obs28
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-3-0-369) (fly3d-fsm_exec-is-reaction_cancel_1_f3d-3-0-369) (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_exec-is-nothing_nav-3-0-257) (navtopoint-fsm_state-is-fly_path_nav-3-0-257) (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369) (pending_obs28) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-3-0-369) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-3-0-257) (observed_obs28) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (navtopoint-fsm_exec-is-nothing_nav-3-0-257)) (not (pending_obs28))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-in_wait_for_yaw_finish_fcl_cancel_reaction1-1_nav-4-1-362_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-1-364) (fly3d-fsm_exec-is-reaction_cancel_1_f3d-2-1-364) (navtopoint-mode-is-running_nav-4-1-362) (navtopoint-fsm_exec-is-nothing_nav-4-1-362) (navtopoint-fsm_state-is-fly_path_nav-4-1-362) (navtopoint-fly_trajectory_task_nav-4-1-362_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-4-1-362) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-4-1-362)) (not (fault-count-3_lost_f3d-2-1-364_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-in_wait_for_yaw_finish_fcl_cancel_reaction1-1_nav-3-1-259_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-1-364) (fly3d-fsm_exec-is-reaction_cancel_1_f3d-2-1-364) (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_exec-is-nothing_nav-3-1-259) (navtopoint-fsm_state-is-fly_path_nav-3-1-259) (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-3-1-259) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-3-1-259)) (not (fault-count-3_lost_f3d-2-1-364_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-in_wait_for_yaw_finish_fcl_cancel_reaction1-1_nav-3-0-257_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-3-0-369) (fly3d-fsm_exec-is-reaction_cancel_1_f3d-3-0-369) (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_exec-is-nothing_nav-3-0-257) (navtopoint-fsm_state-is-fly_path_nav-3-0-257) (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-3-0-369) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-3-0-257) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (navtopoint-fsm_exec-is-nothing_nav-3-0-257)) (not (fault-count-3_lost_f3d-3-0-369_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-in_wait_trajectory_end_fcl_finished_reaction2c-0_nav-3-1-259_f3d-2-1-364_f3d-2-1-364_obs22
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-1-364) (fly3d-fsm_exec-is-reaction_finished_2_f3d-2-1-364) (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_exec-is-nothing_nav-3-1-259) (navtopoint-fsm_state-is-fly_path_nav-3-1-259) (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364) (pending_obs22) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-3-1-259) (observed_obs22) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-3-1-259)) (not (pending_obs22))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-in_wait_trajectory_end_fcl_finished_reaction2c-0_nav-3-0-257_f3d-3-0-369_f3d-3-0-369_obs28
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-wait_trajectory_end_f3d-3-0-369) (fly3d-fsm_exec-is-reaction_finished_2_f3d-3-0-369) (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_exec-is-nothing_nav-3-0-257) (navtopoint-fsm_state-is-fly_path_nav-3-0-257) (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369) (pending_obs28) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-3-0-369) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-3-0-257) (observed_obs28) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (navtopoint-fsm_exec-is-nothing_nav-3-0-257)) (not (pending_obs28))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-in_wait_trajectory_end_fcl_finished_reaction2c-1_nav-4-1-362_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-1-364) (fly3d-fsm_exec-is-reaction_finished_2_f3d-2-1-364) (navtopoint-mode-is-running_nav-4-1-362) (navtopoint-fsm_exec-is-nothing_nav-4-1-362) (navtopoint-fsm_state-is-fly_path_nav-4-1-362) (navtopoint-fly_trajectory_task_nav-4-1-362_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-4-1-362) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-4-1-362)) (not (fault-count-3_lost_f3d-2-1-364_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-in_wait_trajectory_end_fcl_finished_reaction2c-1_nav-3-1-259_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-1-364) (fly3d-fsm_exec-is-reaction_finished_2_f3d-2-1-364) (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_exec-is-nothing_nav-3-1-259) (navtopoint-fsm_state-is-fly_path_nav-3-1-259) (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-3-1-259) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-3-1-259)) (not (fault-count-3_lost_f3d-2-1-364_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-in_wait_trajectory_end_fcl_finished_reaction2c-1_nav-3-0-257_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-wait_trajectory_end_f3d-3-0-369) (fly3d-fsm_exec-is-reaction_finished_2_f3d-3-0-369) (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_exec-is-nothing_nav-3-0-257) (navtopoint-fsm_state-is-fly_path_nav-3-0-257) (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-3-0-369) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-3-0-257) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (navtopoint-fsm_exec-is-nothing_nav-3-0-257)) (not (fault-count-3_lost_f3d-3-0-369_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-enter_turn_to_goal_heading_action2-exit-0_nav-3-1-259_f3d-2-1-364_f3d-2-1-364_obs22
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-2-1-364) (fly3d-fsm_exec-is-action2-exit_f3d-2-1-364) (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_exec-is-nothing_nav-3-1-259) (navtopoint-fsm_state-is-fly_path_nav-3-1-259) (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364) (pending_obs22) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-3-1-259) (observed_obs22) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-3-1-259)) (not (pending_obs22))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-enter_turn_to_goal_heading_action2-exit-0_nav-3-0-257_f3d-3-0-369_f3d-3-0-369_obs28
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-3-0-369) (fly3d-fsm_exec-is-action2-exit_f3d-3-0-369) (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_exec-is-nothing_nav-3-0-257) (navtopoint-fsm_state-is-fly_path_nav-3-0-257) (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369) (pending_obs28) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-3-0-369) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-3-0-257) (observed_obs28) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (navtopoint-fsm_exec-is-nothing_nav-3-0-257)) (not (pending_obs28))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-enter_turn_to_goal_heading_action2-exit-1_nav-4-1-362_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-2-1-364) (fly3d-fsm_exec-is-action2-exit_f3d-2-1-364) (navtopoint-mode-is-running_nav-4-1-362) (navtopoint-fsm_exec-is-nothing_nav-4-1-362) (navtopoint-fsm_state-is-fly_path_nav-4-1-362) (navtopoint-fly_trajectory_task_nav-4-1-362_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-4-1-362) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-4-1-362)) (not (fault-count-3_lost_f3d-2-1-364_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-enter_turn_to_goal_heading_action2-exit-1_nav-3-1-259_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-2-1-364) (fly3d-fsm_exec-is-action2-exit_f3d-2-1-364) (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_exec-is-nothing_nav-3-1-259) (navtopoint-fsm_state-is-fly_path_nav-3-1-259) (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-3-1-259) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-3-1-259)) (not (fault-count-3_lost_f3d-2-1-364_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-enter_turn_to_goal_heading_action2-exit-1_nav-3-0-257_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-3-0-369) (fly3d-fsm_exec-is-action2-exit_f3d-3-0-369) (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_exec-is-nothing_nav-3-0-257) (navtopoint-fsm_state-is-fly_path_nav-3-0-257) (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-3-0-369) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-3-0-257) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (navtopoint-fsm_exec-is-nothing_nav-3-0-257)) (not (fault-count-3_lost_f3d-3-0-369_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-goal_point_wait_cmd_continue_exit-0_nav-3-1-259_f3d-2-1-364_f3d-2-1-364_obs22
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (fly3d-fsm_state-is-goal_point_wait_f3d-2-1-364) (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_exec-is-nothing_nav-3-1-259) (navtopoint-fsm_state-is-fly_path_nav-3-1-259) (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364) (pending_obs22) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-3-1-259) (observed_obs22) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-3-1-259)) (not (pending_obs22))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-goal_point_wait_cmd_continue_exit-0_nav-3-0-257_f3d-3-0-369_f3d-3-0-369_obs28
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (fly3d-fsm_state-is-goal_point_wait_f3d-3-0-369) (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_exec-is-nothing_nav-3-0-257) (navtopoint-fsm_state-is-fly_path_nav-3-0-257) (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369) (pending_obs28) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-3-0-369) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-3-0-257) (observed_obs28) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (navtopoint-fsm_exec-is-nothing_nav-3-0-257)) (not (pending_obs28))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-goal_point_wait_cmd_continue_exit-1_nav-4-1-362_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (fly3d-fsm_state-is-goal_point_wait_f3d-2-1-364) (navtopoint-mode-is-running_nav-4-1-362) (navtopoint-fsm_exec-is-nothing_nav-4-1-362) (navtopoint-fsm_state-is-fly_path_nav-4-1-362) (navtopoint-fly_trajectory_task_nav-4-1-362_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-4-1-362) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-4-1-362)) (not (fault-count-3_lost_f3d-2-1-364_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-goal_point_wait_cmd_continue_exit-1_nav-3-1-259_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (fly3d-fsm_state-is-goal_point_wait_f3d-2-1-364) (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_exec-is-nothing_nav-3-1-259) (navtopoint-fsm_state-is-fly_path_nav-3-1-259) (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-3-1-259) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-3-1-259)) (not (fault-count-3_lost_f3d-2-1-364_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-goal_point_wait_cmd_continue_exit-1_nav-3-0-257_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (fly3d-fsm_state-is-goal_point_wait_f3d-3-0-369) (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_exec-is-nothing_nav-3-0-257) (navtopoint-fsm_state-is-fly_path_nav-3-0-257) (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-3-0-369) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-3-0-257) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (navtopoint-fsm_exec-is-nothing_nav-3-0-257)) (not (fault-count-3_lost_f3d-3-0-369_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-goal_point_wait_idle_exit-0_nav-3-1-259_f3d-2-1-364_f3d-2-1-364_obs22
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (fly3d-fsm_state-is-goal_point_wait_f3d-2-1-364) (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_exec-is-nothing_nav-3-1-259) (navtopoint-fsm_state-is-fly_path_nav-3-1-259) (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364) (pending_obs22) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-3-1-259) (observed_obs22) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-3-1-259)) (not (pending_obs22))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-goal_point_wait_idle_exit-0_nav-3-0-257_f3d-3-0-369_f3d-3-0-369_obs28
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (fly3d-fsm_state-is-goal_point_wait_f3d-3-0-369) (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_exec-is-nothing_nav-3-0-257) (navtopoint-fsm_state-is-fly_path_nav-3-0-257) (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369) (pending_obs28) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-3-0-369) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-3-0-257) (observed_obs28) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (navtopoint-fsm_exec-is-nothing_nav-3-0-257)) (not (pending_obs28))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-goal_point_wait_idle_exit-1_nav-4-1-362_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (fly3d-fsm_state-is-goal_point_wait_f3d-2-1-364) (navtopoint-mode-is-running_nav-4-1-362) (navtopoint-fsm_exec-is-nothing_nav-4-1-362) (navtopoint-fsm_state-is-fly_path_nav-4-1-362) (navtopoint-fly_trajectory_task_nav-4-1-362_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-4-1-362) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-4-1-362)) (not (fault-count-3_lost_f3d-2-1-364_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-goal_point_wait_idle_exit-1_nav-3-1-259_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (fly3d-fsm_state-is-goal_point_wait_f3d-2-1-364) (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_exec-is-nothing_nav-3-1-259) (navtopoint-fsm_state-is-fly_path_nav-3-1-259) (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-3-1-259) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-3-1-259)) (not (fault-count-3_lost_f3d-2-1-364_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-goal_point_wait_idle_exit-1_nav-3-0-257_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (fly3d-fsm_state-is-goal_point_wait_f3d-3-0-369) (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_exec-is-nothing_nav-3-0-257) (navtopoint-fsm_state-is-fly_path_nav-3-0-257) (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-3-0-369) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-3-0-257) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (navtopoint-fsm_exec-is-nothing_nav-3-0-257)) (not (fault-count-3_lost_f3d-3-0-369_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-global_fcl_cancel_reaction1-0_nav-3-1-259_f3d-2-1-364_f3d-2-1-364_obs22
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-global_reaction_cancel_1_f3d-2-1-364) (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_exec-is-nothing_nav-3-1-259) (navtopoint-fsm_state-is-fly_path_nav-3-1-259) (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364) (pending_obs22) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-3-1-259) (observed_obs22) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-3-1-259)) (not (pending_obs22))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-global_fcl_cancel_reaction1-0_nav-3-0-257_f3d-3-0-369_f3d-3-0-369_obs28
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-global_reaction_cancel_1_f3d-3-0-369) (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_exec-is-nothing_nav-3-0-257) (navtopoint-fsm_state-is-fly_path_nav-3-0-257) (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369) (pending_obs28) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-3-0-369) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-3-0-257) (observed_obs28) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (navtopoint-fsm_exec-is-nothing_nav-3-0-257)) (not (pending_obs28))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-global_fcl_cancel_reaction1-1_nav-4-1-362_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-global_reaction_cancel_1_f3d-2-1-364) (navtopoint-mode-is-running_nav-4-1-362) (navtopoint-fsm_exec-is-nothing_nav-4-1-362) (navtopoint-fsm_state-is-fly_path_nav-4-1-362) (navtopoint-fly_trajectory_task_nav-4-1-362_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-4-1-362) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-4-1-362)) (not (fault-count-3_lost_f3d-2-1-364_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-global_fcl_cancel_reaction1-1_nav-3-1-259_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-global_reaction_cancel_1_f3d-2-1-364) (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_exec-is-nothing_nav-3-1-259) (navtopoint-fsm_state-is-fly_path_nav-3-1-259) (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-3-1-259) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-3-1-259)) (not (fault-count-3_lost_f3d-2-1-364_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-global_fcl_cancel_reaction1-1_nav-3-0-257_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-global_reaction_cancel_1_f3d-3-0-369) (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_exec-is-nothing_nav-3-0-257) (navtopoint-fsm_state-is-fly_path_nav-3-0-257) (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-3-0-369) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-3-0-257) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (navtopoint-fsm_exec-is-nothing_nav-3-0-257)) (not (fault-count-3_lost_f3d-3-0-369_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_done_1-fly3d-call_destroy_when_done-0_nav-3-1-259_f3d-2-1-364_f3d-2-1-364_obs23
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_state-is-fly_path_nav-3-1-259) (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364) (fly3d-mode-is-done_f3d-2-1-364) (pending_obs23) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-3-1-259) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs23) (navtopoint-fsm_exec-is-reaction_f3d_done_2_nav-3-1-259) (not (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364)) (not (fly3d-mode-is-done_f3d-2-1-364)) (not (pending_obs23)) (not (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-3-1-259))))
 (:action navtopoint-fly_path_fly3d_done_1-fly3d-call_destroy_when_done-0_nav-3-0-257_f3d-3-0-369_f3d-3-0-369_obs29
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_state-is-fly_path_nav-3-0-257) (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369) (fly3d-mode-is-done_f3d-3-0-369) (pending_obs29) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-3-0-257) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs29) (navtopoint-fsm_exec-is-reaction_f3d_done_2_nav-3-0-257) (not (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369)) (not (fly3d-mode-is-done_f3d-3-0-369)) (not (pending_obs29)) (not (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-3-0-257))))
 (:action navtopoint-fly_path_fly3d_done_1-fly3d-call_destroy_when_done-1_nav-4-1-362_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-4-1-362) (navtopoint-fsm_state-is-fly_path_nav-4-1-362) (navtopoint-fly_trajectory_task_nav-4-1-362_f3d-2-1-364) (fly3d-mode-is-done_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_destroyed_n0) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-4-1-362) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-reaction_f3d_done_2_nav-4-1-362) (not (navtopoint-fly_trajectory_task_nav-4-1-362_f3d-2-1-364)) (not (fly3d-mode-is-done_f3d-2-1-364)) (not (fault-count-3_lost_f3d-2-1-364_destroyed_n0)) (not (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-4-1-362))))
 (:action navtopoint-fly_path_fly3d_done_1-fly3d-call_destroy_when_done-1_nav-3-1-259_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_state-is-fly_path_nav-3-1-259) (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364) (fly3d-mode-is-done_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_destroyed_n0) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-3-1-259) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-reaction_f3d_done_2_nav-3-1-259) (not (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364)) (not (fly3d-mode-is-done_f3d-2-1-364)) (not (fault-count-3_lost_f3d-2-1-364_destroyed_n0)) (not (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-3-1-259))))
 (:action navtopoint-fly_path_fly3d_done_1-fly3d-call_destroy_when_done-1_nav-3-0-257_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_state-is-fly_path_nav-3-0-257) (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369) (fly3d-mode-is-done_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_destroyed_n0) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-3-0-257) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-reaction_f3d_done_2_nav-3-0-257) (not (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369)) (not (fly3d-mode-is-done_f3d-3-0-369)) (not (fault-count-3_lost_f3d-3-0-369_destroyed_n0)) (not (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-3-0-257))))
 (:action navtopoint-fly_path_fly3d_sync_fail-fly3d-init_fail_nav-4-1-362_f3d-2-1-364_f3d-2-1-364
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-4-1-362) (navtopoint-fsm_exec-is-nothing_nav-4-1-362) (navtopoint-fsm_state-is-fly_path_nav-4-1-362) (navtopoint-fly_trajectory_task_nav-4-1-362_f3d-2-1-364) (fly3d-mode-is-processing_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-4-1-362) (not (navtopoint-fsm_exec-is-nothing_nav-4-1-362)) (not (fly3d-mode-is-processing_f3d-2-1-364))))
 (:action navtopoint-fly_path_fly3d_sync_fail-fly3d-init_fail_nav-3-1-259_f3d-2-1-364_f3d-2-1-364
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_exec-is-nothing_nav-3-1-259) (navtopoint-fsm_state-is-fly_path_nav-3-1-259) (fly3d-mode-is-processing_f3d-2-1-364) (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-3-1-259) (not (navtopoint-fsm_exec-is-nothing_nav-3-1-259)) (not (fly3d-mode-is-processing_f3d-2-1-364))))
 (:action navtopoint-fly_path_fly3d_sync_fail-fly3d-init_fail_nav-3-0-257_f3d-3-0-369_f3d-3-0-369
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_exec-is-nothing_nav-3-0-257) (navtopoint-fsm_state-is-fly_path_nav-3-0-257) (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369) (fly3d-mode-is-processing_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-3-0-369) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-3-0-257) (not (navtopoint-fsm_exec-is-nothing_nav-3-0-257)) (not (fly3d-mode-is-processing_f3d-3-0-369))))
 (:action navtopoint-fly_path_fly3d_sync_fail-fly3d-fail_in_start_call_nav-4-1-362_f3d-2-1-364_f3d-2-1-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (navtopoint-mode-is-running_nav-4-1-362) (navtopoint-fsm_exec-is-nothing_nav-4-1-362) (navtopoint-fsm_state-is-fly_path_nav-4-1-362) (navtopoint-fly_trajectory_task_nav-4-1-362_f3d-2-1-364) (fly3d-in_start_call-is-yes_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-4-1-362) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-4-1-362))))
 (:action navtopoint-fly_path_fly3d_sync_fail-fly3d-fail_in_start_call_nav-3-1-259_f3d-2-1-364_f3d-2-1-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_exec-is-nothing_nav-3-1-259) (navtopoint-fsm_state-is-fly_path_nav-3-1-259) (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364) (fly3d-in_start_call-is-yes_f3d-2-1-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-3-1-259) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-3-1-259))))
 (:action navtopoint-fly_path_fly3d_sync_fail-fly3d-fail_in_start_call_nav-3-0-257_f3d-3-0-369_f3d-3-0-369
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_exec-is-nothing_nav-3-0-257) (navtopoint-fsm_state-is-fly_path_nav-3-0-257) (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369) (fly3d-in_start_call-is-yes_f3d-3-0-369) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-3-0-369) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-3-0-257) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (navtopoint-fsm_exec-is-nothing_nav-3-0-257))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_turn_to_segment_heading_fail_service-1_nav-4-1-362_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-in_start_call-is-no_f3d-2-1-364) (navtopoint-mode-is-running_nav-4-1-362) (navtopoint-fsm_exec-is-nothing_nav-4-1-362) (navtopoint-fsm_state-is-fly_path_nav-4-1-362) (navtopoint-fly_trajectory_task_nav-4-1-362_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-4-1-362) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-4-1-362)) (not (fault-count-3_lost_f3d-2-1-364_fail-service_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_turn_to_segment_heading_fail_service-1_nav-3-1-259_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-in_start_call-is-no_f3d-2-1-364) (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_exec-is-nothing_nav-3-1-259) (navtopoint-fsm_state-is-fly_path_nav-3-1-259) (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-3-1-259) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-3-1-259)) (not (fault-count-3_lost_f3d-2-1-364_fail-service_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_turn_to_segment_heading_fail_service-1_nav-3-0-257_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-3-0-369) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (fly3d-in_start_call-is-no_f3d-3-0-369) (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_exec-is-nothing_nav-3-0-257) (navtopoint-fsm_state-is-fly_path_nav-3-0-257) (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-3-0-369) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-3-0-257) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (navtopoint-fsm_exec-is-nothing_nav-3-0-257)) (not (fault-count-3_lost_f3d-3-0-369_fail-service_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_turn_to_segment_heading_fail_specific_221-1_nav-4-1-362_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-in_start_call-is-no_f3d-2-1-364) (navtopoint-mode-is-running_nav-4-1-362) (navtopoint-fsm_exec-is-nothing_nav-4-1-362) (navtopoint-fsm_state-is-fly_path_nav-4-1-362) (navtopoint-fly_trajectory_task_nav-4-1-362_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_fail-specific-221_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-4-1-362) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-4-1-362)) (not (fault-count-3_lost_f3d-2-1-364_fail-specific-221_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_turn_to_segment_heading_fail_specific_221-1_nav-3-1-259_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-in_start_call-is-no_f3d-2-1-364) (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_exec-is-nothing_nav-3-1-259) (navtopoint-fsm_state-is-fly_path_nav-3-1-259) (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_fail-specific-221_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-3-1-259) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-3-1-259)) (not (fault-count-3_lost_f3d-2-1-364_fail-specific-221_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_turn_to_segment_heading_fail_specific_221-1_nav-3-0-257_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-3-0-369) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (fly3d-in_start_call-is-no_f3d-3-0-369) (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_exec-is-nothing_nav-3-0-257) (navtopoint-fsm_state-is-fly_path_nav-3-0-257) (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_fail-specific-221_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-3-0-369) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-3-0-257) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (navtopoint-fsm_exec-is-nothing_nav-3-0-257)) (not (fault-count-3_lost_f3d-3-0-369_fail-specific-221_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_turn_to_segment_heading_fail_specific_222-1_nav-4-1-362_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-in_start_call-is-no_f3d-2-1-364) (navtopoint-mode-is-running_nav-4-1-362) (navtopoint-fsm_exec-is-nothing_nav-4-1-362) (navtopoint-fsm_state-is-fly_path_nav-4-1-362) (navtopoint-fly_trajectory_task_nav-4-1-362_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_fail-specific-222_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-4-1-362) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-4-1-362)) (not (fault-count-3_lost_f3d-2-1-364_fail-specific-222_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_turn_to_segment_heading_fail_specific_222-1_nav-3-1-259_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-in_start_call-is-no_f3d-2-1-364) (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_exec-is-nothing_nav-3-1-259) (navtopoint-fsm_state-is-fly_path_nav-3-1-259) (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_fail-specific-222_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-3-1-259) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-3-1-259)) (not (fault-count-3_lost_f3d-2-1-364_fail-specific-222_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_turn_to_segment_heading_fail_specific_222-1_nav-3-0-257_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-3-0-369) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (fly3d-in_start_call-is-no_f3d-3-0-369) (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_exec-is-nothing_nav-3-0-257) (navtopoint-fsm_state-is-fly_path_nav-3-0-257) (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_fail-specific-222_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-3-0-369) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-3-0-257) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (navtopoint-fsm_exec-is-nothing_nav-3-0-257)) (not (fault-count-3_lost_f3d-3-0-369_fail-specific-222_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_turn_to_segment_heading_fail_specific_223-1_nav-4-1-362_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-in_start_call-is-no_f3d-2-1-364) (navtopoint-mode-is-running_nav-4-1-362) (navtopoint-fsm_exec-is-nothing_nav-4-1-362) (navtopoint-fsm_state-is-fly_path_nav-4-1-362) (navtopoint-fly_trajectory_task_nav-4-1-362_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_fail-specific-223_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-4-1-362) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-4-1-362)) (not (fault-count-3_lost_f3d-2-1-364_fail-specific-223_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_turn_to_segment_heading_fail_specific_223-1_nav-3-1-259_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-in_start_call-is-no_f3d-2-1-364) (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_exec-is-nothing_nav-3-1-259) (navtopoint-fsm_state-is-fly_path_nav-3-1-259) (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_fail-specific-223_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-3-1-259) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-3-1-259)) (not (fault-count-3_lost_f3d-2-1-364_fail-specific-223_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_turn_to_segment_heading_fail_specific_223-1_nav-3-0-257_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-3-0-369) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (fly3d-in_start_call-is-no_f3d-3-0-369) (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_exec-is-nothing_nav-3-0-257) (navtopoint-fsm_state-is-fly_path_nav-3-0-257) (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_fail-specific-223_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-3-0-369) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-3-0-257) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (navtopoint-fsm_exec-is-nothing_nav-3-0-257)) (not (fault-count-3_lost_f3d-3-0-369_fail-specific-223_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_send_starting_yaw_command_fail_service-1_nav-4-1-362_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-1-364) (fly3d-in_start_call-is-no_f3d-2-1-364) (navtopoint-mode-is-running_nav-4-1-362) (navtopoint-fsm_exec-is-nothing_nav-4-1-362) (navtopoint-fsm_state-is-fly_path_nav-4-1-362) (navtopoint-fly_trajectory_task_nav-4-1-362_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-4-1-362) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-4-1-362)) (not (fault-count-3_lost_f3d-2-1-364_fail-service_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_send_starting_yaw_command_fail_service-1_nav-3-1-259_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-1-364) (fly3d-in_start_call-is-no_f3d-2-1-364) (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_exec-is-nothing_nav-3-1-259) (navtopoint-fsm_state-is-fly_path_nav-3-1-259) (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-3-1-259) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-3-1-259)) (not (fault-count-3_lost_f3d-2-1-364_fail-service_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_send_starting_yaw_command_fail_service-1_nav-3-0-257_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-3-0-369) (fly3d-in_start_call-is-no_f3d-3-0-369) (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_exec-is-nothing_nav-3-0-257) (navtopoint-fsm_state-is-fly_path_nav-3-0-257) (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-3-0-369) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-3-0-257) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (navtopoint-fsm_exec-is-nothing_nav-3-0-257)) (not (fault-count-3_lost_f3d-3-0-369_fail-service_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-in_send_starting_yaw_command_fcl_error_reaction1-1_nav-4-1-362_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-1-364) (fly3d-fsm_exec-is-reaction_error_1_f3d-2-1-364) (navtopoint-mode-is-running_nav-4-1-362) (navtopoint-fsm_exec-is-nothing_nav-4-1-362) (navtopoint-fsm_state-is-fly_path_nav-4-1-362) (navtopoint-fly_trajectory_task_nav-4-1-362_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_fail-specific-211_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-4-1-362) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-4-1-362)) (not (fault-count-3_lost_f3d-2-1-364_fail-specific-211_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-in_send_starting_yaw_command_fcl_error_reaction1-1_nav-3-1-259_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-1-364) (fly3d-fsm_exec-is-reaction_error_1_f3d-2-1-364) (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_exec-is-nothing_nav-3-1-259) (navtopoint-fsm_state-is-fly_path_nav-3-1-259) (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_fail-specific-211_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-3-1-259) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-3-1-259)) (not (fault-count-3_lost_f3d-2-1-364_fail-specific-211_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-in_send_starting_yaw_command_fcl_error_reaction1-1_nav-3-0-257_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-3-0-369) (fly3d-fsm_exec-is-reaction_error_1_f3d-3-0-369) (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_exec-is-nothing_nav-3-0-257) (navtopoint-fsm_state-is-fly_path_nav-3-0-257) (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_fail-specific-211_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-3-0-369) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-3-0-257) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (navtopoint-fsm_exec-is-nothing_nav-3-0-257)) (not (fault-count-3_lost_f3d-3-0-369_fail-specific-211_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-in_wait_for_yaw_finish_fcl_error_reaction1-1_nav-4-1-362_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-1-364) (fly3d-fsm_exec-is-reaction_error_1_f3d-2-1-364) (navtopoint-mode-is-running_nav-4-1-362) (navtopoint-fsm_exec-is-nothing_nav-4-1-362) (navtopoint-fsm_state-is-fly_path_nav-4-1-362) (navtopoint-fly_trajectory_task_nav-4-1-362_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_fail-specific-211_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-4-1-362) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-4-1-362)) (not (fault-count-3_lost_f3d-2-1-364_fail-specific-211_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-in_wait_for_yaw_finish_fcl_error_reaction1-1_nav-3-1-259_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-1-364) (fly3d-fsm_exec-is-reaction_error_1_f3d-2-1-364) (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_exec-is-nothing_nav-3-1-259) (navtopoint-fsm_state-is-fly_path_nav-3-1-259) (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_fail-specific-211_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-3-1-259) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-3-1-259)) (not (fault-count-3_lost_f3d-2-1-364_fail-specific-211_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-in_wait_for_yaw_finish_fcl_error_reaction1-1_nav-3-0-257_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-3-0-369) (fly3d-fsm_exec-is-reaction_error_1_f3d-3-0-369) (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_exec-is-nothing_nav-3-0-257) (navtopoint-fsm_state-is-fly_path_nav-3-0-257) (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_fail-specific-211_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-3-0-369) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-3-0-257) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (navtopoint-fsm_exec-is-nothing_nav-3-0-257)) (not (fault-count-3_lost_f3d-3-0-369_fail-specific-211_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_send_first_trajectory_fail_service-1_nav-4-1-362_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (fly3d-in_start_call-is-no_f3d-2-1-364) (navtopoint-mode-is-running_nav-4-1-362) (navtopoint-fsm_exec-is-nothing_nav-4-1-362) (navtopoint-fsm_state-is-fly_path_nav-4-1-362) (navtopoint-fly_trajectory_task_nav-4-1-362_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-4-1-362) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-4-1-362)) (not (fault-count-3_lost_f3d-2-1-364_fail-service_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_send_first_trajectory_fail_service-1_nav-3-1-259_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (fly3d-in_start_call-is-no_f3d-2-1-364) (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_exec-is-nothing_nav-3-1-259) (navtopoint-fsm_state-is-fly_path_nav-3-1-259) (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-3-1-259) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-3-1-259)) (not (fault-count-3_lost_f3d-2-1-364_fail-service_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_send_first_trajectory_fail_service-1_nav-3-0-257_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (fly3d-fsm_state-is-send_first_trajectory_f3d-3-0-369) (fly3d-in_start_call-is-no_f3d-3-0-369) (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_exec-is-nothing_nav-3-0-257) (navtopoint-fsm_state-is-fly_path_nav-3-0-257) (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-3-0-369) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-3-0-257) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (navtopoint-fsm_exec-is-nothing_nav-3-0-257)) (not (fault-count-3_lost_f3d-3-0-369_fail-service_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_send_first_trajectory_fail_specific_220-1_nav-4-1-362_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (fly3d-in_start_call-is-no_f3d-2-1-364) (navtopoint-mode-is-running_nav-4-1-362) (navtopoint-fsm_exec-is-nothing_nav-4-1-362) (navtopoint-fsm_state-is-fly_path_nav-4-1-362) (navtopoint-fly_trajectory_task_nav-4-1-362_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_fail-specific-220_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-4-1-362) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-4-1-362)) (not (fault-count-3_lost_f3d-2-1-364_fail-specific-220_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_send_first_trajectory_fail_specific_220-1_nav-3-1-259_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (fly3d-in_start_call-is-no_f3d-2-1-364) (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_exec-is-nothing_nav-3-1-259) (navtopoint-fsm_state-is-fly_path_nav-3-1-259) (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_fail-specific-220_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-3-1-259) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-3-1-259)) (not (fault-count-3_lost_f3d-2-1-364_fail-specific-220_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_send_first_trajectory_fail_specific_220-1_nav-3-0-257_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (fly3d-fsm_state-is-send_first_trajectory_f3d-3-0-369) (fly3d-in_start_call-is-no_f3d-3-0-369) (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_exec-is-nothing_nav-3-0-257) (navtopoint-fsm_state-is-fly_path_nav-3-0-257) (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_fail-specific-220_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-3-0-369) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-3-0-257) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (navtopoint-fsm_exec-is-nothing_nav-3-0-257)) (not (fault-count-3_lost_f3d-3-0-369_fail-specific-220_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-in_send_first_trajectory_fcl_finished_reaction1-1_nav-4-1-362_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (fly3d-fsm_exec-is-reaction_finished_1_f3d-2-1-364) (navtopoint-mode-is-running_nav-4-1-362) (navtopoint-fsm_exec-is-nothing_nav-4-1-362) (navtopoint-fsm_state-is-fly_path_nav-4-1-362) (navtopoint-fly_trajectory_task_nav-4-1-362_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_fail-specific-213_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-4-1-362) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-4-1-362)) (not (fault-count-3_lost_f3d-2-1-364_fail-specific-213_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-in_send_first_trajectory_fcl_finished_reaction1-1_nav-3-1-259_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (fly3d-fsm_exec-is-reaction_finished_1_f3d-2-1-364) (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_exec-is-nothing_nav-3-1-259) (navtopoint-fsm_state-is-fly_path_nav-3-1-259) (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_fail-specific-213_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-3-1-259) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-3-1-259)) (not (fault-count-3_lost_f3d-2-1-364_fail-specific-213_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-in_send_first_trajectory_fcl_finished_reaction1-1_nav-3-0-257_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-send_first_trajectory_f3d-3-0-369) (fly3d-fsm_exec-is-reaction_finished_1_f3d-3-0-369) (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_exec-is-nothing_nav-3-0-257) (navtopoint-fsm_state-is-fly_path_nav-3-0-257) (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_fail-specific-213_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-3-0-369) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-3-0-257) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (navtopoint-fsm_exec-is-nothing_nav-3-0-257)) (not (fault-count-3_lost_f3d-3-0-369_fail-specific-213_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_turn_to_goal_heading_fail_service-1_nav-4-1-362_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-in_start_call-is-no_f3d-2-1-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-2-1-364) (navtopoint-mode-is-running_nav-4-1-362) (navtopoint-fsm_exec-is-nothing_nav-4-1-362) (navtopoint-fsm_state-is-fly_path_nav-4-1-362) (navtopoint-fly_trajectory_task_nav-4-1-362_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-4-1-362) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-4-1-362)) (not (fault-count-3_lost_f3d-2-1-364_fail-service_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_turn_to_goal_heading_fail_service-1_nav-3-1-259_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-in_start_call-is-no_f3d-2-1-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-2-1-364) (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_exec-is-nothing_nav-3-1-259) (navtopoint-fsm_state-is-fly_path_nav-3-1-259) (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-3-1-259) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-3-1-259)) (not (fault-count-3_lost_f3d-2-1-364_fail-service_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_turn_to_goal_heading_fail_service-1_nav-3-0-257_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (fly3d-in_start_call-is-no_f3d-3-0-369) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-3-0-369) (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_exec-is-nothing_nav-3-0-257) (navtopoint-fsm_state-is-fly_path_nav-3-0-257) (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-3-0-369) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-3-0-257) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (navtopoint-fsm_exec-is-nothing_nav-3-0-257)) (not (fault-count-3_lost_f3d-3-0-369_fail-service_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_turn_to_goal_heading_action2-fail-1_nav-4-1-362_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-2-1-364) (fly3d-fsm_exec-is-action2-fail_f3d-2-1-364) (navtopoint-mode-is-running_nav-4-1-362) (navtopoint-fsm_exec-is-nothing_nav-4-1-362) (navtopoint-fsm_state-is-fly_path_nav-4-1-362) (navtopoint-fly_trajectory_task_nav-4-1-362_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_fail-specific-214_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-4-1-362) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-4-1-362)) (not (fault-count-3_lost_f3d-2-1-364_fail-specific-214_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_turn_to_goal_heading_action2-fail-1_nav-3-1-259_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-2-1-364) (fly3d-fsm_exec-is-action2-fail_f3d-2-1-364) (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_exec-is-nothing_nav-3-1-259) (navtopoint-fsm_state-is-fly_path_nav-3-1-259) (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_fail-specific-214_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-3-1-259) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-3-1-259)) (not (fault-count-3_lost_f3d-2-1-364_fail-specific-214_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_turn_to_goal_heading_action2-fail-1_nav-3-0-257_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-3-0-369) (fly3d-fsm_exec-is-action2-fail_f3d-3-0-369) (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_exec-is-nothing_nav-3-0-257) (navtopoint-fsm_state-is-fly_path_nav-3-0-257) (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_fail-specific-214_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-3-0-369) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-3-0-257) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (navtopoint-fsm_exec-is-nothing_nav-3-0-257)) (not (fault-count-3_lost_f3d-3-0-369_fail-specific-214_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_goal_point_wait_fail_service-1_nav-4-1-362_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-in_start_call-is-no_f3d-2-1-364) (fly3d-fsm_state-is-goal_point_wait_f3d-2-1-364) (navtopoint-mode-is-running_nav-4-1-362) (navtopoint-fsm_exec-is-nothing_nav-4-1-362) (navtopoint-fsm_state-is-fly_path_nav-4-1-362) (navtopoint-fly_trajectory_task_nav-4-1-362_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-4-1-362) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-4-1-362)) (not (fault-count-3_lost_f3d-2-1-364_fail-service_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_goal_point_wait_fail_service-1_nav-3-1-259_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-in_start_call-is-no_f3d-2-1-364) (fly3d-fsm_state-is-goal_point_wait_f3d-2-1-364) (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_exec-is-nothing_nav-3-1-259) (navtopoint-fsm_state-is-fly_path_nav-3-1-259) (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-3-1-259) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-3-1-259)) (not (fault-count-3_lost_f3d-2-1-364_fail-service_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_goal_point_wait_fail_service-1_nav-3-0-257_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (fly3d-in_start_call-is-no_f3d-3-0-369) (fly3d-fsm_state-is-goal_point_wait_f3d-3-0-369) (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_exec-is-nothing_nav-3-0-257) (navtopoint-fsm_state-is-fly_path_nav-3-0-257) (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-3-0-369) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-3-0-257) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (navtopoint-fsm_exec-is-nothing_nav-3-0-257)) (not (fault-count-3_lost_f3d-3-0-369_fail-service_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-global_fcl_error_reaction1-1_nav-4-1-362_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-global_reaction_error_1_f3d-2-1-364) (navtopoint-mode-is-running_nav-4-1-362) (navtopoint-fsm_exec-is-nothing_nav-4-1-362) (navtopoint-fsm_state-is-fly_path_nav-4-1-362) (navtopoint-fly_trajectory_task_nav-4-1-362_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_fail-specific-210_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-4-1-362) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-4-1-362)) (not (fault-count-3_lost_f3d-2-1-364_fail-specific-210_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-global_fcl_error_reaction1-1_nav-3-1-259_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-global_reaction_error_1_f3d-2-1-364) (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_exec-is-nothing_nav-3-1-259) (navtopoint-fsm_state-is-fly_path_nav-3-1-259) (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_fail-specific-210_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-3-1-259) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-nothing_nav-3-1-259)) (not (fault-count-3_lost_f3d-2-1-364_fail-specific-210_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-global_fcl_error_reaction1-1_nav-3-0-257_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-global_reaction_error_1_f3d-3-0-369) (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_exec-is-nothing_nav-3-0-257) (navtopoint-fsm_state-is-fly_path_nav-3-0-257) (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_fail-specific-210_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-3-0-369) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-3-0-257) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (navtopoint-fsm_exec-is-nothing_nav-3-0-257)) (not (fault-count-3_lost_f3d-3-0-369_fail-specific-210_n0))))
 (:action navtopoint-fly_path_fly3d_subtask_fail_1-fly3d-call_destroy_when_failed-0_nav-3-0-257_f3d-3-0-369_f3d-3-0-369_obs29
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_state-is-fly_path_nav-3-0-257) (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369) (pending_obs29) (fly3d-mode-is-failed_f3d-3-0-369) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-3-0-257) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs29) (navtopoint-fsm_exec-is-reaction_f3d_fail_2_nav-3-0-257) (not (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369)) (not (pending_obs29)) (not (fly3d-mode-is-failed_f3d-3-0-369)) (not (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-3-0-257))))
 (:action navtopoint-fly_path_fly3d_subtask_fail_1-fly3d-call_destroy_when_failed-1_nav-4-1-362_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-4-1-362) (navtopoint-fsm_state-is-fly_path_nav-4-1-362) (navtopoint-fly_trajectory_task_nav-4-1-362_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_destroyed_n0) (fly3d-mode-is-failed_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-4-1-362) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-reaction_f3d_fail_2_nav-4-1-362) (not (navtopoint-fly_trajectory_task_nav-4-1-362_f3d-2-1-364)) (not (fault-count-3_lost_f3d-2-1-364_destroyed_n0)) (not (fly3d-mode-is-failed_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-4-1-362))))
 (:action navtopoint-fly_path_fly3d_subtask_fail_1-fly3d-call_destroy_when_failed-1_nav-3-1-259_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_state-is-fly_path_nav-3-1-259) (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_destroyed_n0) (fly3d-mode-is-failed_f3d-2-1-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-3-1-259) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-reaction_f3d_fail_2_nav-3-1-259) (not (navtopoint-fly_trajectory_task_nav-3-1-259_f3d-2-1-364)) (not (fault-count-3_lost_f3d-2-1-364_destroyed_n0)) (not (fly3d-mode-is-failed_f3d-2-1-364)) (not (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-3-1-259))))
 (:action navtopoint-fly_path_fly3d_subtask_fail_1-fly3d-call_destroy_when_failed-1_nav-3-0-257_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_state-is-fly_path_nav-3-0-257) (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_destroyed_n0) (fly3d-mode-is-failed_f3d-3-0-369) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-3-0-257) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-reaction_f3d_fail_2_nav-3-0-257) (not (navtopoint-fly_trajectory_task_nav-3-0-257_f3d-3-0-369)) (not (fault-count-3_lost_f3d-3-0-369_destroyed_n0)) (not (fly3d-mode-is-failed_f3d-3-0-369)) (not (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-3-0-257))))
 (:action missionexec-init-mission-fly3d-call_set_args_heli1_f3d-2-1-364_f3d-2-1-364_missionexecutor
  :parameters ()
  :precondition (and (fly3d-mode-is-pre_init_f3d-2-1-364) (missionexec-mission-idle_heli1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-processing_f3d-2-1-364) (called-by_f3d-2-1-364_missionexecutor) (missionexec-active-mission_heli1_f3d-2-1-364) (missionexec-mission-init-call_heli1) (not (fly3d-mode-is-pre_init_f3d-2-1-364)) (not (missionexec-mission-idle_heli1))))
 (:action missionexec-init-mission-fly3d-call_set_args_heli0_f3d-3-0-369_f3d-3-0-369_missionexecutor
  :parameters ()
  :precondition (and (fly3d-mode-is-pre_init_f3d-3-0-369) (missionexec-mission-idle_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-processing_f3d-3-0-369) (called-by_f3d-3-0-369_missionexecutor) (missionexec-active-mission_heli0_f3d-3-0-369) (missionexec-mission-init-call_heli0) (not (fly3d-mode-is-pre_init_f3d-3-0-369)) (not (missionexec-mission-idle_heli0))))
 (:action missionexec-init-mission-navtopoint-call_set_args_heli1_nav-4-1-362_nav-4-1-362_missionexecutor
  :parameters ()
  :precondition (and (missionexec-mission-idle_heli1) (navtopoint-mode-is-pre_init_nav-4-1-362) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-init-call_heli1) (missionexec-active-mission_heli1_nav-4-1-362) (navtopoint-mode-is-processing_nav-4-1-362) (called-by_nav-4-1-362_missionexecutor) (not (missionexec-mission-idle_heli1)) (not (navtopoint-mode-is-pre_init_nav-4-1-362))))
 (:action missionexec-init-mission-navtopoint-call_set_args_heli1_nav-3-1-259_nav-3-1-259_missionexecutor
  :parameters ()
  :precondition (and (missionexec-mission-idle_heli1) (navtopoint-mode-is-pre_init_nav-3-1-259) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-init-call_heli1) (missionexec-active-mission_heli1_nav-3-1-259) (navtopoint-mode-is-processing_nav-3-1-259) (called-by_nav-3-1-259_missionexecutor) (not (missionexec-mission-idle_heli1)) (not (navtopoint-mode-is-pre_init_nav-3-1-259))))
 (:action missionexec-init-mission-navtopoint-call_set_args_heli0_nav-3-0-257_nav-3-0-257_missionexecutor
  :parameters ()
  :precondition (and (missionexec-mission-idle_heli0) (navtopoint-mode-is-pre_init_nav-3-0-257) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-init-call_heli0) (missionexec-active-mission_heli0_nav-3-0-257) (navtopoint-mode-is-processing_nav-3-0-257) (called-by_nav-3-0-257_missionexecutor) (not (missionexec-mission-idle_heli0)) (not (navtopoint-mode-is-pre_init_nav-3-0-257))))
 (:action missionexec-init-mission-ok-fly3d-init_ok-1_heli1_f3d-2-1-364_f3d-2-1-364_missionexecutor_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-processing_f3d-2-1-364) (called-by_f3d-2-1-364_missionexecutor) (fault-count-4_lost_f3d-2-1-364_created_missionexecutor_n0) (missionexec-active-mission_heli1_f3d-2-1-364) (missionexec-mission-init-call_heli1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-ready_f3d-2-1-364) (missionexec-mission-ready_heli1) (not (fly3d-mode-is-processing_f3d-2-1-364)) (not (fault-count-4_lost_f3d-2-1-364_created_missionexecutor_n0)) (not (missionexec-mission-init-call_heli1))))
 (:action missionexec-init-mission-ok-fly3d-init_ok-1_heli0_f3d-3-0-369_f3d-3-0-369_missionexecutor_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-processing_f3d-3-0-369) (called-by_f3d-3-0-369_missionexecutor) (fault-count-4_lost_f3d-3-0-369_created_missionexecutor_n0) (missionexec-active-mission_heli0_f3d-3-0-369) (missionexec-mission-init-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-ready_f3d-3-0-369) (missionexec-mission-ready_heli0) (not (fly3d-mode-is-processing_f3d-3-0-369)) (not (fault-count-4_lost_f3d-3-0-369_created_missionexecutor_n0)) (not (missionexec-mission-init-call_heli0))))
 (:action missionexec-init-mission-ok-navtopoint-init_ok-0_heli1_nav-4-1-362_nav-4-1-362_missionexecutor_obs25
  :parameters ()
  :precondition (and (missionexec-mission-init-call_heli1) (missionexec-active-mission_heli1_nav-4-1-362) (navtopoint-mode-is-processing_nav-4-1-362) (called-by_nav-4-1-362_missionexecutor) (pending_obs25) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-ready_heli1) (navtopoint-mode-is-ready_nav-4-1-362) (observed_obs25) (not (missionexec-mission-init-call_heli1)) (not (navtopoint-mode-is-processing_nav-4-1-362)) (not (pending_obs25))))
 (:action missionexec-init-mission-ok-navtopoint-init_ok-0_heli1_nav-3-1-259_nav-3-1-259_missionexecutor_obs10
  :parameters ()
  :precondition (and (missionexec-mission-init-call_heli1) (missionexec-active-mission_heli1_nav-3-1-259) (navtopoint-mode-is-processing_nav-3-1-259) (called-by_nav-3-1-259_missionexecutor) (pending_obs10) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-ready_heli1) (navtopoint-mode-is-ready_nav-3-1-259) (observed_obs10) (not (missionexec-mission-init-call_heli1)) (not (navtopoint-mode-is-processing_nav-3-1-259)) (not (pending_obs10))))
 (:action missionexec-init-mission-ok-navtopoint-init_ok-0_heli0_nav-3-0-257_nav-3-0-257_missionexecutor_obs9
  :parameters ()
  :precondition (and (missionexec-mission-init-call_heli0) (missionexec-active-mission_heli0_nav-3-0-257) (navtopoint-mode-is-processing_nav-3-0-257) (called-by_nav-3-0-257_missionexecutor) (pending_obs9) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-ready_heli0) (navtopoint-mode-is-ready_nav-3-0-257) (observed_obs9) (not (missionexec-mission-init-call_heli0)) (not (navtopoint-mode-is-processing_nav-3-0-257)) (not (pending_obs9))))
 (:action missionexec-init-mission-ok-navtopoint-init_ok-1_heli1_nav-4-1-362_nav-4-1-362_missionexecutor_n0_n1
  :parameters ()
  :precondition (and (missionexec-mission-init-call_heli1) (missionexec-active-mission_heli1_nav-4-1-362) (navtopoint-mode-is-processing_nav-4-1-362) (called-by_nav-4-1-362_missionexecutor) (fault-count-4_lost_nav-4-1-362_created_missionexecutor_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-ready_heli1) (navtopoint-mode-is-ready_nav-4-1-362) (not (missionexec-mission-init-call_heli1)) (not (navtopoint-mode-is-processing_nav-4-1-362)) (not (fault-count-4_lost_nav-4-1-362_created_missionexecutor_n0))))
 (:action missionexec-init-mission-ok-navtopoint-init_ok-1_heli1_nav-3-1-259_nav-3-1-259_missionexecutor_n0_n1
  :parameters ()
  :precondition (and (missionexec-mission-init-call_heli1) (missionexec-active-mission_heli1_nav-3-1-259) (navtopoint-mode-is-processing_nav-3-1-259) (called-by_nav-3-1-259_missionexecutor) (fault-count-4_lost_nav-3-1-259_created_missionexecutor_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-ready_heli1) (navtopoint-mode-is-ready_nav-3-1-259) (not (missionexec-mission-init-call_heli1)) (not (navtopoint-mode-is-processing_nav-3-1-259)) (not (fault-count-4_lost_nav-3-1-259_created_missionexecutor_n0))))
 (:action missionexec-init-mission-ok-navtopoint-init_ok-1_heli0_nav-3-0-257_nav-3-0-257_missionexecutor_n0_n1
  :parameters ()
  :precondition (and (missionexec-mission-init-call_heli0) (missionexec-active-mission_heli0_nav-3-0-257) (navtopoint-mode-is-processing_nav-3-0-257) (called-by_nav-3-0-257_missionexecutor) (fault-count-4_lost_nav-3-0-257_created_missionexecutor_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-ready_heli0) (navtopoint-mode-is-ready_nav-3-0-257) (not (missionexec-mission-init-call_heli0)) (not (navtopoint-mode-is-processing_nav-3-0-257)) (not (fault-count-4_lost_nav-3-0-257_created_missionexecutor_n0))))
 (:action missionexec-init-mission-fail-fly3d-init_fail_heli1_f3d-2-1-364_f3d-2-1-364
  :parameters ()
  :precondition (and (fly3d-mode-is-processing_f3d-2-1-364) (missionexec-active-mission_heli1_f3d-2-1-364) (missionexec-mission-init-call_heli1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-1-364) (missionexec-mission-over_heli1) (not (fly3d-mode-is-processing_f3d-2-1-364)) (not (missionexec-mission-init-call_heli1))))
 (:action missionexec-init-mission-fail-fly3d-init_fail_heli0_f3d-3-0-369_f3d-3-0-369
  :parameters ()
  :precondition (and (fly3d-mode-is-processing_f3d-3-0-369) (missionexec-active-mission_heli0_f3d-3-0-369) (missionexec-mission-init-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-3-0-369) (missionexec-mission-over_heli0) (not (fly3d-mode-is-processing_f3d-3-0-369)) (not (missionexec-mission-init-call_heli0))))
 (:action missionexec-init-mission-fail-fly3d-fail_in_start_call_heli1_f3d-2-1-364_f3d-2-1-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-in_start_call-is-yes_f3d-2-1-364) (missionexec-active-mission_heli1_f3d-2-1-364) (missionexec-mission-init-call_heli1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-1-364) (missionexec-mission-over_heli1) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (missionexec-mission-init-call_heli1))))
 (:action missionexec-init-mission-fail-fly3d-fail_in_start_call_heli0_f3d-3-0-369_f3d-3-0-369
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-in_start_call-is-yes_f3d-3-0-369) (missionexec-active-mission_heli0_f3d-3-0-369) (missionexec-mission-init-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-3-0-369) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (missionexec-mission-init-call_heli0))))
 (:action missionexec-init-mission-fail-navtopoint-init_fail_heli1_nav-4-1-362_nav-4-1-362
  :parameters ()
  :precondition (and (missionexec-mission-init-call_heli1) (missionexec-active-mission_heli1_nav-4-1-362) (navtopoint-mode-is-processing_nav-4-1-362) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli1) (navtopoint-mode-is-failed_nav-4-1-362) (not (missionexec-mission-init-call_heli1)) (not (navtopoint-mode-is-processing_nav-4-1-362))))
 (:action missionexec-init-mission-fail-navtopoint-init_fail_heli1_nav-3-1-259_nav-3-1-259
  :parameters ()
  :precondition (and (missionexec-mission-init-call_heli1) (missionexec-active-mission_heli1_nav-3-1-259) (navtopoint-mode-is-processing_nav-3-1-259) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli1) (navtopoint-mode-is-failed_nav-3-1-259) (not (missionexec-mission-init-call_heli1)) (not (navtopoint-mode-is-processing_nav-3-1-259))))
 (:action missionexec-init-mission-fail-navtopoint-init_fail_heli0_nav-3-0-257_nav-3-0-257
  :parameters ()
  :precondition (and (missionexec-mission-init-call_heli0) (missionexec-active-mission_heli0_nav-3-0-257) (navtopoint-mode-is-processing_nav-3-0-257) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-3-0-257) (not (missionexec-mission-init-call_heli0)) (not (navtopoint-mode-is-processing_nav-3-0-257))))
 (:action missionexec-init-mission-fail-navtopoint-fail_in_start_call_heli1_nav-4-1-362_nav-4-1-362
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-4-1-362) (missionexec-mission-init-call_heli1) (missionexec-active-mission_heli1_nav-4-1-362) (navtopoint-in_start_call-is-yes_nav-4-1-362) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli1) (navtopoint-mode-is-failed_nav-4-1-362) (not (navtopoint-mode-is-running_nav-4-1-362)) (not (missionexec-mission-init-call_heli1))))
 (:action missionexec-init-mission-fail-navtopoint-fail_in_start_call_heli1_nav-3-1-259_nav-3-1-259
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-1-259) (missionexec-mission-init-call_heli1) (missionexec-active-mission_heli1_nav-3-1-259) (navtopoint-in_start_call-is-yes_nav-3-1-259) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli1) (navtopoint-mode-is-failed_nav-3-1-259) (not (navtopoint-mode-is-running_nav-3-1-259)) (not (missionexec-mission-init-call_heli1))))
 (:action missionexec-init-mission-fail-navtopoint-fail_in_start_call_heli0_nav-3-0-257_nav-3-0-257
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-0-257) (missionexec-mission-init-call_heli0) (missionexec-active-mission_heli0_nav-3-0-257) (navtopoint-in_start_call-is-yes_nav-3-0-257) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-3-0-257) (not (navtopoint-mode-is-running_nav-3-0-257)) (not (missionexec-mission-init-call_heli0))))
 (:action missionexec-start-mission-fly3d-call_start_heli1_f3d-2-1-364_f3d-2-1-364
  :parameters ()
  :precondition (and (fly3d-mode-is-ready_f3d-2-1-364) (missionexec-active-mission_heli1_f3d-2-1-364) (missionexec-mission-ready_heli1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-start_f3d-2-1-364) (fly3d-in_start_call-is-yes_f3d-2-1-364) (missionexec-mission-start-call_heli1) (not (fly3d-mode-is-ready_f3d-2-1-364)) (not (missionexec-mission-ready_heli1))))
 (:action missionexec-start-mission-fly3d-call_start_heli0_f3d-3-0-369_f3d-3-0-369
  :parameters ()
  :precondition (and (fly3d-mode-is-ready_f3d-3-0-369) (missionexec-active-mission_heli0_f3d-3-0-369) (missionexec-mission-ready_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-start_f3d-3-0-369) (fly3d-in_start_call-is-yes_f3d-3-0-369) (missionexec-mission-start-call_heli0) (not (fly3d-mode-is-ready_f3d-3-0-369)) (not (missionexec-mission-ready_heli0))))
 (:action missionexec-start-mission-navtopoint-call_start_heli1_nav-4-1-362_nav-4-1-362
  :parameters ()
  :precondition (and (missionexec-active-mission_heli1_nav-4-1-362) (missionexec-mission-ready_heli1) (navtopoint-mode-is-ready_nav-4-1-362) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-mode-is-running_nav-4-1-362) (navtopoint-in_start_call-is-yes_nav-4-1-362) (missionexec-mission-start-call_heli1) (navtopoint-fsm_exec-is-start_nav-4-1-362) (not (missionexec-mission-ready_heli1)) (not (navtopoint-mode-is-ready_nav-4-1-362))))
 (:action missionexec-start-mission-navtopoint-call_start_heli1_nav-3-1-259_nav-3-1-259
  :parameters ()
  :precondition (and (missionexec-active-mission_heli1_nav-3-1-259) (missionexec-mission-ready_heli1) (navtopoint-mode-is-ready_nav-3-1-259) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-in_start_call-is-yes_nav-3-1-259) (missionexec-mission-start-call_heli1) (navtopoint-fsm_exec-is-start_nav-3-1-259) (not (missionexec-mission-ready_heli1)) (not (navtopoint-mode-is-ready_nav-3-1-259))))
 (:action missionexec-start-mission-navtopoint-call_start_heli0_nav-3-0-257_nav-3-0-257
  :parameters ()
  :precondition (and (missionexec-active-mission_heli0_nav-3-0-257) (missionexec-mission-ready_heli0) (navtopoint-mode-is-ready_nav-3-0-257) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-in_start_call-is-yes_nav-3-0-257) (missionexec-mission-start-call_heli0) (navtopoint-fsm_exec-is-start_nav-3-0-257) (not (missionexec-mission-ready_heli0)) (not (navtopoint-mode-is-ready_nav-3-0-257))))
 (:action missionexec-start-mission-ok-fly3d-enter_send_starting_yaw_command_ok_sync_heli1_f3d-2-1-364_f3d-2-1-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-1-364) (fly3d-in_start_call-is-yes_f3d-2-1-364) (missionexec-active-mission_heli1_f3d-2-1-364) (missionexec-mission-start-call_heli1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-2-1-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (missionexec-mission-running_heli1) (not (fly3d-fsm_exec-is-action1_f3d-2-1-364)) (not (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-1-364)) (not (fly3d-in_start_call-is-yes_f3d-2-1-364)) (not (missionexec-mission-start-call_heli1))))
 (:action missionexec-start-mission-ok-fly3d-enter_send_starting_yaw_command_ok_sync_heli0_f3d-3-0-369_f3d-3-0-369
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-3-0-369) (fly3d-in_start_call-is-yes_f3d-3-0-369) (missionexec-active-mission_heli0_f3d-3-0-369) (missionexec-mission-start-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-3-0-369) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (missionexec-mission-running_heli0) (not (fly3d-fsm_exec-is-action1_f3d-3-0-369)) (not (fly3d-fsm_state-is-send_starting_yaw_command_f3d-3-0-369)) (not (fly3d-in_start_call-is-yes_f3d-3-0-369)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-ok-fly3d-enter_send_starting_yaw_command_checkpoint12_sync-1_heli1_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_checkpoint12_n0) (fly3d-in_start_call-is-yes_f3d-2-1-364) (missionexec-active-mission_heli1_f3d-2-1-364) (missionexec-mission-start-call_heli1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (missionexec-mission-running_heli1) (not (fly3d-fsm_exec-is-action1_f3d-2-1-364)) (not (fault-count-3_lost_f3d-2-1-364_checkpoint12_n0)) (not (fly3d-in_start_call-is-yes_f3d-2-1-364)) (not (missionexec-mission-start-call_heli1))))
 (:action missionexec-start-mission-ok-fly3d-enter_send_starting_yaw_command_checkpoint12_sync-1_heli0_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_checkpoint12_n0) (fly3d-in_start_call-is-yes_f3d-3-0-369) (missionexec-active-mission_heli0_f3d-3-0-369) (missionexec-mission-start-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (missionexec-mission-running_heli0) (not (fly3d-fsm_exec-is-action1_f3d-3-0-369)) (not (fault-count-3_lost_f3d-3-0-369_checkpoint12_n0)) (not (fly3d-in_start_call-is-yes_f3d-3-0-369)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-ok-fly3d-enter_send_first_trajectory_checkpoint20_sync-1_heli1_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_checkpoint20_n0) (fly3d-in_start_call-is-yes_f3d-2-1-364) (missionexec-active-mission_heli1_f3d-2-1-364) (missionexec-mission-start-call_heli1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (missionexec-mission-running_heli1) (not (fly3d-fsm_exec-is-action1_f3d-2-1-364)) (not (fault-count-3_lost_f3d-2-1-364_checkpoint20_n0)) (not (fly3d-trajectory-not-sent_f3d-2-1-364)) (not (fly3d-in_start_call-is-yes_f3d-2-1-364)) (not (missionexec-mission-start-call_heli1))))
 (:action missionexec-start-mission-ok-fly3d-enter_send_first_trajectory_checkpoint20_sync-1_heli0_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (fly3d-fsm_state-is-send_first_trajectory_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_checkpoint20_n0) (fly3d-in_start_call-is-yes_f3d-3-0-369) (missionexec-active-mission_heli0_f3d-3-0-369) (missionexec-mission-start-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (missionexec-mission-running_heli0) (not (fly3d-fsm_exec-is-action1_f3d-3-0-369)) (not (fault-count-3_lost_f3d-3-0-369_checkpoint20_n0)) (not (fly3d-trajectory-not-sent_f3d-3-0-369)) (not (fly3d-in_start_call-is-yes_f3d-3-0-369)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-ok-fly3d-enter_send_first_trajectory_checkpoint21_sync-1_heli1_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_checkpoint21_n0) (fly3d-in_start_call-is-yes_f3d-2-1-364) (missionexec-active-mission_heli1_f3d-2-1-364) (missionexec-mission-start-call_heli1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-1-364) (missionexec-mission-running_heli1) (not (fly3d-fsm_exec-is-action1_f3d-2-1-364)) (not (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364)) (not (fly3d-trajectory-not-sent_f3d-2-1-364)) (not (fault-count-3_lost_f3d-2-1-364_checkpoint21_n0)) (not (fly3d-in_start_call-is-yes_f3d-2-1-364)) (not (missionexec-mission-start-call_heli1))))
 (:action missionexec-start-mission-ok-fly3d-enter_send_first_trajectory_checkpoint21_sync-1_heli0_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (fly3d-fsm_state-is-send_first_trajectory_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_checkpoint21_n0) (fly3d-in_start_call-is-yes_f3d-3-0-369) (missionexec-active-mission_heli0_f3d-3-0-369) (missionexec-mission-start-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (fly3d-fsm_state-is-wait_trajectory_end_f3d-3-0-369) (missionexec-mission-running_heli0) (not (fly3d-fsm_exec-is-action1_f3d-3-0-369)) (not (fly3d-fsm_state-is-send_first_trajectory_f3d-3-0-369)) (not (fly3d-trajectory-not-sent_f3d-3-0-369)) (not (fault-count-3_lost_f3d-3-0-369_checkpoint21_n0)) (not (fly3d-in_start_call-is-yes_f3d-3-0-369)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-ok-fly3d-enter_send_first_trajectory_checkpoint21_after22_sync-1_heli1_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_checkpoint21_n0) (fly3d-fsm_exec-is-action2_f3d-2-1-364) (fly3d-in_start_call-is-yes_f3d-2-1-364) (missionexec-active-mission_heli1_f3d-2-1-364) (missionexec-mission-start-call_heli1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-1-364) (missionexec-mission-running_heli1) (not (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364)) (not (fly3d-trajectory-not-sent_f3d-2-1-364)) (not (fault-count-3_lost_f3d-2-1-364_checkpoint21_n0)) (not (fly3d-fsm_exec-is-action2_f3d-2-1-364)) (not (fly3d-in_start_call-is-yes_f3d-2-1-364)) (not (missionexec-mission-start-call_heli1))))
 (:action missionexec-start-mission-ok-fly3d-enter_send_first_trajectory_checkpoint21_after22_sync-1_heli0_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-send_first_trajectory_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_checkpoint21_n0) (fly3d-fsm_exec-is-action2_f3d-3-0-369) (fly3d-in_start_call-is-yes_f3d-3-0-369) (missionexec-active-mission_heli0_f3d-3-0-369) (missionexec-mission-start-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (fly3d-fsm_state-is-wait_trajectory_end_f3d-3-0-369) (missionexec-mission-running_heli0) (not (fly3d-fsm_state-is-send_first_trajectory_f3d-3-0-369)) (not (fly3d-trajectory-not-sent_f3d-3-0-369)) (not (fault-count-3_lost_f3d-3-0-369_checkpoint21_n0)) (not (fly3d-fsm_exec-is-action2_f3d-3-0-369)) (not (fly3d-in_start_call-is-yes_f3d-3-0-369)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-ok-fly3d-enter_send_first_trajectory_busy_sync_heli1_f3d-2-1-364_f3d-2-1-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (fly3d-in_start_call-is-yes_f3d-2-1-364) (missionexec-active-mission_heli1_f3d-2-1-364) (missionexec-mission-start-call_heli1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (fly3d-trajectory-not-sent_f3d-2-1-364) (missionexec-mission-running_heli1) (not (fly3d-fsm_exec-is-action1_f3d-2-1-364)) (not (fly3d-in_start_call-is-yes_f3d-2-1-364)) (not (missionexec-mission-start-call_heli1))))
 (:action missionexec-start-mission-ok-fly3d-enter_send_first_trajectory_busy_sync_heli0_f3d-3-0-369_f3d-3-0-369
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (fly3d-fsm_state-is-send_first_trajectory_f3d-3-0-369) (fly3d-in_start_call-is-yes_f3d-3-0-369) (missionexec-active-mission_heli0_f3d-3-0-369) (missionexec-mission-start-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (fly3d-trajectory-not-sent_f3d-3-0-369) (missionexec-mission-running_heli0) (not (fly3d-fsm_exec-is-action1_f3d-3-0-369)) (not (fly3d-in_start_call-is-yes_f3d-3-0-369)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-ok-fly3d-enter_send_first_trajectory_busy_after22_sync_heli1_f3d-2-1-364_f3d-2-1-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (fly3d-fsm_exec-is-action2_f3d-2-1-364) (fly3d-in_start_call-is-yes_f3d-2-1-364) (missionexec-active-mission_heli1_f3d-2-1-364) (missionexec-mission-start-call_heli1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (fly3d-trajectory-not-sent_f3d-2-1-364) (missionexec-mission-running_heli1) (not (fly3d-fsm_exec-is-action2_f3d-2-1-364)) (not (fly3d-in_start_call-is-yes_f3d-2-1-364)) (not (missionexec-mission-start-call_heli1))))
 (:action missionexec-start-mission-ok-fly3d-enter_send_first_trajectory_busy_after22_sync_heli0_f3d-3-0-369_f3d-3-0-369
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-send_first_trajectory_f3d-3-0-369) (fly3d-fsm_exec-is-action2_f3d-3-0-369) (fly3d-in_start_call-is-yes_f3d-3-0-369) (missionexec-active-mission_heli0_f3d-3-0-369) (missionexec-mission-start-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (fly3d-trajectory-not-sent_f3d-3-0-369) (missionexec-mission-running_heli0) (not (fly3d-fsm_exec-is-action2_f3d-3-0-369)) (not (fly3d-in_start_call-is-yes_f3d-3-0-369)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-ok-navtopoint-start_ok_heli1_nav-4-1-362_nav-4-1-362
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-4-1-362) (missionexec-active-mission_heli1_nav-4-1-362) (missionexec-mission-start-call_heli1) (navtopoint-fsm_exec-is-start_nav-4-1-362) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_state-is-start_decouple_nav-4-1-362) (navtopoint-fsm_exec-is-nothing_nav-4-1-362) (navtopoint-in_start_call-is-no_nav-4-1-362) (missionexec-mission-running_heli1) (not (navtopoint-in_start_call-is-yes_nav-4-1-362)) (not (missionexec-mission-start-call_heli1)) (not (navtopoint-fsm_exec-is-start_nav-4-1-362))))
 (:action missionexec-start-mission-ok-navtopoint-start_ok_heli1_nav-3-1-259_nav-3-1-259
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-1-259) (missionexec-active-mission_heli1_nav-3-1-259) (missionexec-mission-start-call_heli1) (navtopoint-fsm_exec-is-start_nav-3-1-259) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_state-is-start_decouple_nav-3-1-259) (navtopoint-fsm_exec-is-nothing_nav-3-1-259) (navtopoint-in_start_call-is-no_nav-3-1-259) (missionexec-mission-running_heli1) (not (navtopoint-in_start_call-is-yes_nav-3-1-259)) (not (missionexec-mission-start-call_heli1)) (not (navtopoint-fsm_exec-is-start_nav-3-1-259))))
 (:action missionexec-start-mission-ok-navtopoint-start_ok_heli0_nav-3-0-257_nav-3-0-257
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-0-257) (missionexec-active-mission_heli0_nav-3-0-257) (missionexec-mission-start-call_heli0) (navtopoint-fsm_exec-is-start_nav-3-0-257) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_state-is-start_decouple_nav-3-0-257) (navtopoint-fsm_exec-is-nothing_nav-3-0-257) (navtopoint-in_start_call-is-no_nav-3-0-257) (missionexec-mission-running_heli0) (not (navtopoint-in_start_call-is-yes_nav-3-0-257)) (not (missionexec-mission-start-call_heli0)) (not (navtopoint-fsm_exec-is-start_nav-3-0-257))))
 (:action missionexec-start-mission-done-fly3d-start_exit_heli1_f3d-2-1-364_f3d-2-1-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-start_f3d-2-1-364) (missionexec-active-mission_heli1_f3d-2-1-364) (missionexec-mission-start-call_heli1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-1-364) (missionexec-mission-over_heli1) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (missionexec-mission-start-call_heli1))))
 (:action missionexec-start-mission-done-fly3d-start_exit_heli0_f3d-3-0-369_f3d-3-0-369
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-start_f3d-3-0-369) (missionexec-active-mission_heli0_f3d-3-0-369) (missionexec-mission-start-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-3-0-369) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-fail-fly3d-init_fail_heli1_f3d-2-1-364_f3d-2-1-364
  :parameters ()
  :precondition (and (fly3d-mode-is-processing_f3d-2-1-364) (missionexec-active-mission_heli1_f3d-2-1-364) (missionexec-mission-start-call_heli1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-1-364) (missionexec-mission-over_heli1) (not (fly3d-mode-is-processing_f3d-2-1-364)) (not (missionexec-mission-start-call_heli1))))
 (:action missionexec-start-mission-fail-fly3d-init_fail_heli0_f3d-3-0-369_f3d-3-0-369
  :parameters ()
  :precondition (and (fly3d-mode-is-processing_f3d-3-0-369) (missionexec-active-mission_heli0_f3d-3-0-369) (missionexec-mission-start-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-3-0-369) (missionexec-mission-over_heli0) (not (fly3d-mode-is-processing_f3d-3-0-369)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-fail-fly3d-fail_in_start_call_heli1_f3d-2-1-364_f3d-2-1-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-in_start_call-is-yes_f3d-2-1-364) (missionexec-active-mission_heli1_f3d-2-1-364) (missionexec-mission-start-call_heli1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-1-364) (missionexec-mission-over_heli1) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (missionexec-mission-start-call_heli1))))
 (:action missionexec-start-mission-fail-fly3d-fail_in_start_call_heli0_f3d-3-0-369_f3d-3-0-369
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-in_start_call-is-yes_f3d-3-0-369) (missionexec-active-mission_heli0_f3d-3-0-369) (missionexec-mission-start-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-3-0-369) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-fail-navtopoint-init_fail_heli1_nav-4-1-362_nav-4-1-362
  :parameters ()
  :precondition (and (missionexec-active-mission_heli1_nav-4-1-362) (navtopoint-mode-is-processing_nav-4-1-362) (missionexec-mission-start-call_heli1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli1) (navtopoint-mode-is-failed_nav-4-1-362) (not (navtopoint-mode-is-processing_nav-4-1-362)) (not (missionexec-mission-start-call_heli1))))
 (:action missionexec-start-mission-fail-navtopoint-init_fail_heli1_nav-3-1-259_nav-3-1-259
  :parameters ()
  :precondition (and (missionexec-active-mission_heli1_nav-3-1-259) (navtopoint-mode-is-processing_nav-3-1-259) (missionexec-mission-start-call_heli1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli1) (navtopoint-mode-is-failed_nav-3-1-259) (not (navtopoint-mode-is-processing_nav-3-1-259)) (not (missionexec-mission-start-call_heli1))))
 (:action missionexec-start-mission-fail-navtopoint-init_fail_heli0_nav-3-0-257_nav-3-0-257
  :parameters ()
  :precondition (and (missionexec-active-mission_heli0_nav-3-0-257) (navtopoint-mode-is-processing_nav-3-0-257) (missionexec-mission-start-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-3-0-257) (not (navtopoint-mode-is-processing_nav-3-0-257)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-fail-navtopoint-fail_in_start_call_heli1_nav-4-1-362_nav-4-1-362
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-4-1-362) (missionexec-active-mission_heli1_nav-4-1-362) (navtopoint-in_start_call-is-yes_nav-4-1-362) (missionexec-mission-start-call_heli1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli1) (navtopoint-mode-is-failed_nav-4-1-362) (not (navtopoint-mode-is-running_nav-4-1-362)) (not (missionexec-mission-start-call_heli1))))
 (:action missionexec-start-mission-fail-navtopoint-fail_in_start_call_heli1_nav-3-1-259_nav-3-1-259
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-1-259) (missionexec-active-mission_heli1_nav-3-1-259) (navtopoint-in_start_call-is-yes_nav-3-1-259) (missionexec-mission-start-call_heli1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli1) (navtopoint-mode-is-failed_nav-3-1-259) (not (navtopoint-mode-is-running_nav-3-1-259)) (not (missionexec-mission-start-call_heli1))))
 (:action missionexec-start-mission-fail-navtopoint-fail_in_start_call_heli0_nav-3-0-257_nav-3-0-257
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-0-257) (missionexec-active-mission_heli0_nav-3-0-257) (navtopoint-in_start_call-is-yes_nav-3-0-257) (missionexec-mission-start-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-3-0-257) (not (navtopoint-mode-is-running_nav-3-0-257)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-mission-done-fly3d-in_send_starting_yaw_command_fcl_cancel_reaction1-1_heli1_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-1-364) (fly3d-fsm_exec-is-reaction_cancel_1_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_task-done_n0) (missionexec-active-mission_heli1_f3d-2-1-364) (missionexec-mission-running_heli1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-1-364) (missionexec-mission-over_heli1) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (fault-count-3_lost_f3d-2-1-364_task-done_n0)) (not (missionexec-mission-running_heli1))))
 (:action missionexec-mission-done-fly3d-in_send_starting_yaw_command_fcl_cancel_reaction1-1_heli0_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-3-0-369) (fly3d-fsm_exec-is-reaction_cancel_1_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_task-done_n0) (missionexec-active-mission_heli0_f3d-3-0-369) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-3-0-369) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (fault-count-3_lost_f3d-3-0-369_task-done_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-done-fly3d-in_wait_for_yaw_finish_fcl_cancel_reaction1-1_heli1_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-1-364) (fly3d-fsm_exec-is-reaction_cancel_1_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_task-done_n0) (missionexec-active-mission_heli1_f3d-2-1-364) (missionexec-mission-running_heli1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-1-364) (missionexec-mission-over_heli1) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (fault-count-3_lost_f3d-2-1-364_task-done_n0)) (not (missionexec-mission-running_heli1))))
 (:action missionexec-mission-done-fly3d-in_wait_for_yaw_finish_fcl_cancel_reaction1-1_heli0_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-3-0-369) (fly3d-fsm_exec-is-reaction_cancel_1_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_task-done_n0) (missionexec-active-mission_heli0_f3d-3-0-369) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-3-0-369) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (fault-count-3_lost_f3d-3-0-369_task-done_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-done-fly3d-in_wait_trajectory_end_fcl_finished_reaction2c-1_heli1_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-1-364) (fly3d-fsm_exec-is-reaction_finished_2_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_task-done_n0) (missionexec-active-mission_heli1_f3d-2-1-364) (missionexec-mission-running_heli1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-1-364) (missionexec-mission-over_heli1) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (fault-count-3_lost_f3d-2-1-364_task-done_n0)) (not (missionexec-mission-running_heli1))))
 (:action missionexec-mission-done-fly3d-in_wait_trajectory_end_fcl_finished_reaction2c-1_heli0_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-wait_trajectory_end_f3d-3-0-369) (fly3d-fsm_exec-is-reaction_finished_2_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_task-done_n0) (missionexec-active-mission_heli0_f3d-3-0-369) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-3-0-369) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (fault-count-3_lost_f3d-3-0-369_task-done_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-done-fly3d-enter_turn_to_goal_heading_action2-exit-1_heli1_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-2-1-364) (fly3d-fsm_exec-is-action2-exit_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_task-done_n0) (missionexec-active-mission_heli1_f3d-2-1-364) (missionexec-mission-running_heli1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-1-364) (missionexec-mission-over_heli1) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (fault-count-3_lost_f3d-2-1-364_task-done_n0)) (not (missionexec-mission-running_heli1))))
 (:action missionexec-mission-done-fly3d-enter_turn_to_goal_heading_action2-exit-1_heli0_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-3-0-369) (fly3d-fsm_exec-is-action2-exit_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_task-done_n0) (missionexec-active-mission_heli0_f3d-3-0-369) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-3-0-369) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (fault-count-3_lost_f3d-3-0-369_task-done_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-done-fly3d-goal_point_wait_cmd_continue_exit-1_heli1_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (fly3d-fsm_state-is-goal_point_wait_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_task-done_n0) (missionexec-active-mission_heli1_f3d-2-1-364) (missionexec-mission-running_heli1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-1-364) (missionexec-mission-over_heli1) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (fault-count-3_lost_f3d-2-1-364_task-done_n0)) (not (missionexec-mission-running_heli1))))
 (:action missionexec-mission-done-fly3d-goal_point_wait_cmd_continue_exit-1_heli0_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (fly3d-fsm_state-is-goal_point_wait_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_task-done_n0) (missionexec-active-mission_heli0_f3d-3-0-369) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-3-0-369) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (fault-count-3_lost_f3d-3-0-369_task-done_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-done-fly3d-goal_point_wait_idle_exit-1_heli1_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-nothing_f3d-2-1-364) (fly3d-fsm_state-is-goal_point_wait_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_task-done_n0) (missionexec-active-mission_heli1_f3d-2-1-364) (missionexec-mission-running_heli1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-1-364) (missionexec-mission-over_heli1) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (fault-count-3_lost_f3d-2-1-364_task-done_n0)) (not (missionexec-mission-running_heli1))))
 (:action missionexec-mission-done-fly3d-goal_point_wait_idle_exit-1_heli0_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-nothing_f3d-3-0-369) (fly3d-fsm_state-is-goal_point_wait_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_task-done_n0) (missionexec-active-mission_heli0_f3d-3-0-369) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-3-0-369) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (fault-count-3_lost_f3d-3-0-369_task-done_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-done-fly3d-global_fcl_cancel_reaction1-1_heli1_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-global_reaction_cancel_1_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_task-done_n0) (missionexec-active-mission_heli1_f3d-2-1-364) (missionexec-mission-running_heli1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-1-364) (missionexec-mission-over_heli1) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (fault-count-3_lost_f3d-2-1-364_task-done_n0)) (not (missionexec-mission-running_heli1))))
 (:action missionexec-mission-done-fly3d-global_fcl_cancel_reaction1-1_heli0_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-global_reaction_cancel_1_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_task-done_n0) (missionexec-active-mission_heli0_f3d-3-0-369) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-3-0-369) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (fault-count-3_lost_f3d-3-0-369_task-done_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-done-navtopoint-wait_for_go_exit-1_heli1_nav-4-1-362_nav-4-1-362_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-4-1-362) (navtopoint-fsm_exec-is-nothing_nav-4-1-362) (navtopoint-fsm_state-is-wait_for_go_nav-4-1-362) (missionexec-active-mission_heli1_nav-4-1-362) (missionexec-mission-running_heli1) (fault-count-3_lost_nav-4-1-362_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli1) (navtopoint-mode-is-done_nav-4-1-362) (not (navtopoint-mode-is-running_nav-4-1-362)) (not (missionexec-mission-running_heli1)) (not (fault-count-3_lost_nav-4-1-362_task-done_n0))))
 (:action missionexec-mission-done-navtopoint-wait_for_go_exit-1_heli1_nav-3-1-259_nav-3-1-259_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_exec-is-nothing_nav-3-1-259) (navtopoint-fsm_state-is-wait_for_go_nav-3-1-259) (missionexec-active-mission_heli1_nav-3-1-259) (missionexec-mission-running_heli1) (fault-count-3_lost_nav-3-1-259_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli1) (navtopoint-mode-is-done_nav-3-1-259) (not (navtopoint-mode-is-running_nav-3-1-259)) (not (missionexec-mission-running_heli1)) (not (fault-count-3_lost_nav-3-1-259_task-done_n0))))
 (:action missionexec-mission-done-navtopoint-wait_for_go_exit-1_heli0_nav-3-0-257_nav-3-0-257_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_exec-is-nothing_nav-3-0-257) (navtopoint-fsm_state-is-wait_for_go_nav-3-0-257) (missionexec-active-mission_heli0_nav-3-0-257) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-3-0-257_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-done_nav-3-0-257) (not (navtopoint-mode-is-running_nav-3-0-257)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-3-0-257_task-done_n0))))
 (:action missionexec-mission-done-navtopoint-fly_path_fly3d_done_2-0_heli1_nav-3-1-259_nav-3-1-259_obs24
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_state-is-fly_path_nav-3-1-259) (navtopoint-fsm_exec-is-reaction_f3d_done_2_nav-3-1-259) (missionexec-active-mission_heli1_nav-3-1-259) (missionexec-mission-running_heli1) (pending_obs24) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli1) (navtopoint-mode-is-done_nav-3-1-259) (observed_obs24) (not (navtopoint-mode-is-running_nav-3-1-259)) (not (missionexec-mission-running_heli1)) (not (pending_obs24))))
 (:action missionexec-mission-done-navtopoint-fly_path_fly3d_done_2-1_heli1_nav-4-1-362_nav-4-1-362_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-4-1-362) (navtopoint-fsm_state-is-fly_path_nav-4-1-362) (navtopoint-fsm_exec-is-reaction_f3d_done_2_nav-4-1-362) (missionexec-active-mission_heli1_nav-4-1-362) (missionexec-mission-running_heli1) (fault-count-3_lost_nav-4-1-362_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli1) (navtopoint-mode-is-done_nav-4-1-362) (not (navtopoint-mode-is-running_nav-4-1-362)) (not (missionexec-mission-running_heli1)) (not (fault-count-3_lost_nav-4-1-362_task-done_n0))))
 (:action missionexec-mission-done-navtopoint-fly_path_fly3d_done_2-1_heli1_nav-3-1-259_nav-3-1-259_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_state-is-fly_path_nav-3-1-259) (navtopoint-fsm_exec-is-reaction_f3d_done_2_nav-3-1-259) (missionexec-active-mission_heli1_nav-3-1-259) (missionexec-mission-running_heli1) (fault-count-3_lost_nav-3-1-259_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli1) (navtopoint-mode-is-done_nav-3-1-259) (not (navtopoint-mode-is-running_nav-3-1-259)) (not (missionexec-mission-running_heli1)) (not (fault-count-3_lost_nav-3-1-259_task-done_n0))))
 (:action missionexec-mission-done-navtopoint-fly_path_fly3d_done_2-1_heli0_nav-3-0-257_nav-3-0-257_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_state-is-fly_path_nav-3-0-257) (navtopoint-fsm_exec-is-reaction_f3d_done_2_nav-3-0-257) (missionexec-active-mission_heli0_nav-3-0-257) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-3-0-257_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-done_nav-3-0-257) (not (navtopoint-mode-is-running_nav-3-0-257)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-3-0-257_task-done_n0))))
 (:action missionexec-mission-failed-fly3d-enter_turn_to_segment_heading_fail_service-1_heli1_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-in_start_call-is-no_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_fail-service_n0) (missionexec-active-mission_heli1_f3d-2-1-364) (missionexec-mission-running_heli1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-1-364) (missionexec-mission-over_heli1) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (fault-count-3_lost_f3d-2-1-364_fail-service_n0)) (not (missionexec-mission-running_heli1))))
 (:action missionexec-mission-failed-fly3d-enter_turn_to_segment_heading_fail_service-1_heli0_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-3-0-369) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (fly3d-in_start_call-is-no_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_fail-service_n0) (missionexec-active-mission_heli0_f3d-3-0-369) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-3-0-369) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (fault-count-3_lost_f3d-3-0-369_fail-service_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-enter_turn_to_segment_heading_fail_specific_221-1_heli1_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-in_start_call-is-no_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_fail-specific-221_n0) (missionexec-active-mission_heli1_f3d-2-1-364) (missionexec-mission-running_heli1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-1-364) (missionexec-mission-over_heli1) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (fault-count-3_lost_f3d-2-1-364_fail-specific-221_n0)) (not (missionexec-mission-running_heli1))))
 (:action missionexec-mission-failed-fly3d-enter_turn_to_segment_heading_fail_specific_221-1_heli0_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-3-0-369) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (fly3d-in_start_call-is-no_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_fail-specific-221_n0) (missionexec-active-mission_heli0_f3d-3-0-369) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-3-0-369) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (fault-count-3_lost_f3d-3-0-369_fail-specific-221_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-enter_turn_to_segment_heading_fail_specific_222-1_heli1_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-in_start_call-is-no_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_fail-specific-222_n0) (missionexec-active-mission_heli1_f3d-2-1-364) (missionexec-mission-running_heli1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-1-364) (missionexec-mission-over_heli1) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (fault-count-3_lost_f3d-2-1-364_fail-specific-222_n0)) (not (missionexec-mission-running_heli1))))
 (:action missionexec-mission-failed-fly3d-enter_turn_to_segment_heading_fail_specific_222-1_heli0_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-3-0-369) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (fly3d-in_start_call-is-no_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_fail-specific-222_n0) (missionexec-active-mission_heli0_f3d-3-0-369) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-3-0-369) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (fault-count-3_lost_f3d-3-0-369_fail-specific-222_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-enter_turn_to_segment_heading_fail_specific_223-1_heli1_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-in_start_call-is-no_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_fail-specific-223_n0) (missionexec-active-mission_heli1_f3d-2-1-364) (missionexec-mission-running_heli1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-1-364) (missionexec-mission-over_heli1) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (fault-count-3_lost_f3d-2-1-364_fail-specific-223_n0)) (not (missionexec-mission-running_heli1))))
 (:action missionexec-mission-failed-fly3d-enter_turn_to_segment_heading_fail_specific_223-1_heli0_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-3-0-369) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (fly3d-in_start_call-is-no_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_fail-specific-223_n0) (missionexec-active-mission_heli0_f3d-3-0-369) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-3-0-369) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (fault-count-3_lost_f3d-3-0-369_fail-specific-223_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-enter_send_starting_yaw_command_fail_service-1_heli1_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-1-364) (fly3d-in_start_call-is-no_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_fail-service_n0) (missionexec-active-mission_heli1_f3d-2-1-364) (missionexec-mission-running_heli1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-1-364) (missionexec-mission-over_heli1) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (fault-count-3_lost_f3d-2-1-364_fail-service_n0)) (not (missionexec-mission-running_heli1))))
 (:action missionexec-mission-failed-fly3d-enter_send_starting_yaw_command_fail_service-1_heli0_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-3-0-369) (fly3d-in_start_call-is-no_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_fail-service_n0) (missionexec-active-mission_heli0_f3d-3-0-369) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-3-0-369) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (fault-count-3_lost_f3d-3-0-369_fail-service_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-in_send_starting_yaw_command_fcl_error_reaction1-1_heli1_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-1-364) (fly3d-fsm_exec-is-reaction_error_1_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_fail-specific-211_n0) (missionexec-active-mission_heli1_f3d-2-1-364) (missionexec-mission-running_heli1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-1-364) (missionexec-mission-over_heli1) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (fault-count-3_lost_f3d-2-1-364_fail-specific-211_n0)) (not (missionexec-mission-running_heli1))))
 (:action missionexec-mission-failed-fly3d-in_send_starting_yaw_command_fcl_error_reaction1-1_heli0_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-3-0-369) (fly3d-fsm_exec-is-reaction_error_1_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_fail-specific-211_n0) (missionexec-active-mission_heli0_f3d-3-0-369) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-3-0-369) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (fault-count-3_lost_f3d-3-0-369_fail-specific-211_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-in_wait_for_yaw_finish_fcl_error_reaction1-1_heli1_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-1-364) (fly3d-fsm_exec-is-reaction_error_1_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_fail-specific-211_n0) (missionexec-active-mission_heli1_f3d-2-1-364) (missionexec-mission-running_heli1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-1-364) (missionexec-mission-over_heli1) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (fault-count-3_lost_f3d-2-1-364_fail-specific-211_n0)) (not (missionexec-mission-running_heli1))))
 (:action missionexec-mission-failed-fly3d-in_wait_for_yaw_finish_fcl_error_reaction1-1_heli0_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-3-0-369) (fly3d-fsm_exec-is-reaction_error_1_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_fail-specific-211_n0) (missionexec-active-mission_heli0_f3d-3-0-369) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-3-0-369) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (fault-count-3_lost_f3d-3-0-369_fail-specific-211_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-enter_send_first_trajectory_fail_service-1_heli1_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (fly3d-in_start_call-is-no_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_fail-service_n0) (missionexec-active-mission_heli1_f3d-2-1-364) (missionexec-mission-running_heli1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-1-364) (missionexec-mission-over_heli1) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (fault-count-3_lost_f3d-2-1-364_fail-service_n0)) (not (missionexec-mission-running_heli1))))
 (:action missionexec-mission-failed-fly3d-enter_send_first_trajectory_fail_service-1_heli0_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (fly3d-fsm_state-is-send_first_trajectory_f3d-3-0-369) (fly3d-in_start_call-is-no_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_fail-service_n0) (missionexec-active-mission_heli0_f3d-3-0-369) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-3-0-369) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (fault-count-3_lost_f3d-3-0-369_fail-service_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-enter_send_first_trajectory_fail_specific_220-1_heli1_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (fly3d-in_start_call-is-no_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_fail-specific-220_n0) (missionexec-active-mission_heli1_f3d-2-1-364) (missionexec-mission-running_heli1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-1-364) (missionexec-mission-over_heli1) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (fault-count-3_lost_f3d-2-1-364_fail-specific-220_n0)) (not (missionexec-mission-running_heli1))))
 (:action missionexec-mission-failed-fly3d-enter_send_first_trajectory_fail_specific_220-1_heli0_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (fly3d-fsm_state-is-send_first_trajectory_f3d-3-0-369) (fly3d-in_start_call-is-no_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_fail-specific-220_n0) (missionexec-active-mission_heli0_f3d-3-0-369) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-3-0-369) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (fault-count-3_lost_f3d-3-0-369_fail-specific-220_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-in_send_first_trajectory_fcl_finished_reaction1-1_heli1_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-1-364) (fly3d-fsm_exec-is-reaction_finished_1_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_fail-specific-213_n0) (missionexec-active-mission_heli1_f3d-2-1-364) (missionexec-mission-running_heli1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-1-364) (missionexec-mission-over_heli1) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (fault-count-3_lost_f3d-2-1-364_fail-specific-213_n0)) (not (missionexec-mission-running_heli1))))
 (:action missionexec-mission-failed-fly3d-in_send_first_trajectory_fcl_finished_reaction1-1_heli0_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-send_first_trajectory_f3d-3-0-369) (fly3d-fsm_exec-is-reaction_finished_1_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_fail-specific-213_n0) (missionexec-active-mission_heli0_f3d-3-0-369) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-3-0-369) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (fault-count-3_lost_f3d-3-0-369_fail-specific-213_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-enter_turn_to_goal_heading_fail_service-1_heli1_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-in_start_call-is-no_f3d-2-1-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_fail-service_n0) (missionexec-active-mission_heli1_f3d-2-1-364) (missionexec-mission-running_heli1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-1-364) (missionexec-mission-over_heli1) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (fault-count-3_lost_f3d-2-1-364_fail-service_n0)) (not (missionexec-mission-running_heli1))))
 (:action missionexec-mission-failed-fly3d-enter_turn_to_goal_heading_fail_service-1_heli0_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (fly3d-in_start_call-is-no_f3d-3-0-369) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_fail-service_n0) (missionexec-active-mission_heli0_f3d-3-0-369) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-3-0-369) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (fault-count-3_lost_f3d-3-0-369_fail-service_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-enter_turn_to_goal_heading_action2-fail-1_heli1_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-2-1-364) (fly3d-fsm_exec-is-action2-fail_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_fail-specific-214_n0) (missionexec-active-mission_heli1_f3d-2-1-364) (missionexec-mission-running_heli1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-1-364) (missionexec-mission-over_heli1) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (fault-count-3_lost_f3d-2-1-364_fail-specific-214_n0)) (not (missionexec-mission-running_heli1))))
 (:action missionexec-mission-failed-fly3d-enter_turn_to_goal_heading_action2-fail-1_heli0_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-3-0-369) (fly3d-fsm_exec-is-action2-fail_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_fail-specific-214_n0) (missionexec-active-mission_heli0_f3d-3-0-369) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-3-0-369) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (fault-count-3_lost_f3d-3-0-369_fail-specific-214_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-enter_goal_point_wait_fail_service-1_heli1_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-action1_f3d-2-1-364) (fly3d-in_start_call-is-no_f3d-2-1-364) (fly3d-fsm_state-is-goal_point_wait_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_fail-service_n0) (missionexec-active-mission_heli1_f3d-2-1-364) (missionexec-mission-running_heli1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-1-364) (missionexec-mission-over_heli1) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (fault-count-3_lost_f3d-2-1-364_fail-service_n0)) (not (missionexec-mission-running_heli1))))
 (:action missionexec-mission-failed-fly3d-enter_goal_point_wait_fail_service-1_heli0_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-action1_f3d-3-0-369) (fly3d-in_start_call-is-no_f3d-3-0-369) (fly3d-fsm_state-is-goal_point_wait_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_fail-service_n0) (missionexec-active-mission_heli0_f3d-3-0-369) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-3-0-369) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (fault-count-3_lost_f3d-3-0-369_fail-service_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-global_fcl_error_reaction1-1_heli1_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-1-364) (fly3d-fsm_exec-is-global_reaction_error_1_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_fail-specific-210_n0) (missionexec-active-mission_heli1_f3d-2-1-364) (missionexec-mission-running_heli1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-1-364) (missionexec-mission-over_heli1) (not (fly3d-mode-is-running_f3d-2-1-364)) (not (fault-count-3_lost_f3d-2-1-364_fail-specific-210_n0)) (not (missionexec-mission-running_heli1))))
 (:action missionexec-mission-failed-fly3d-global_fcl_error_reaction1-1_heli0_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-3-0-369) (fly3d-fsm_exec-is-global_reaction_error_1_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_fail-specific-210_n0) (missionexec-active-mission_heli0_f3d-3-0-369) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-3-0-369) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-3-0-369)) (not (fault-count-3_lost_f3d-3-0-369_fail-specific-210_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-navtopoint-plan_path_action1_fail_service-1_heli1_nav-4-1-362_nav-4-1-362_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-4-1-362) (navtopoint-fsm_exec-is-action1_nav-4-1-362) (navtopoint-fsm_state-is-plan_path_nav-4-1-362) (navtopoint-in_start_call-is-no_nav-4-1-362) (missionexec-active-mission_heli1_nav-4-1-362) (missionexec-mission-running_heli1) (fault-count-3_lost_nav-4-1-362_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli1) (navtopoint-mode-is-failed_nav-4-1-362) (not (navtopoint-mode-is-running_nav-4-1-362)) (not (missionexec-mission-running_heli1)) (not (fault-count-3_lost_nav-4-1-362_fail-service_n0))))
 (:action missionexec-mission-failed-navtopoint-plan_path_action1_fail_service-1_heli1_nav-3-1-259_nav-3-1-259_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_exec-is-action1_nav-3-1-259) (navtopoint-fsm_state-is-plan_path_nav-3-1-259) (navtopoint-in_start_call-is-no_nav-3-1-259) (missionexec-active-mission_heli1_nav-3-1-259) (missionexec-mission-running_heli1) (fault-count-3_lost_nav-3-1-259_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli1) (navtopoint-mode-is-failed_nav-3-1-259) (not (navtopoint-mode-is-running_nav-3-1-259)) (not (missionexec-mission-running_heli1)) (not (fault-count-3_lost_nav-3-1-259_fail-service_n0))))
 (:action missionexec-mission-failed-navtopoint-plan_path_action1_fail_service-1_heli0_nav-3-0-257_nav-3-0-257_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_exec-is-action1_nav-3-0-257) (navtopoint-fsm_state-is-plan_path_nav-3-0-257) (navtopoint-in_start_call-is-no_nav-3-0-257) (missionexec-active-mission_heli0_nav-3-0-257) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-3-0-257_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-3-0-257) (not (navtopoint-mode-is-running_nav-3-0-257)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-3-0-257_fail-service_n0))))
 (:action missionexec-mission-failed-navtopoint-plan_path_action1_fail_specific_101-1_heli1_nav-4-1-362_nav-4-1-362_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-4-1-362) (navtopoint-fsm_exec-is-action1_nav-4-1-362) (navtopoint-fsm_state-is-plan_path_nav-4-1-362) (navtopoint-in_start_call-is-no_nav-4-1-362) (missionexec-active-mission_heli1_nav-4-1-362) (missionexec-mission-running_heli1) (fault-count-3_lost_nav-4-1-362_fail-specific-101_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli1) (navtopoint-mode-is-failed_nav-4-1-362) (not (navtopoint-mode-is-running_nav-4-1-362)) (not (missionexec-mission-running_heli1)) (not (fault-count-3_lost_nav-4-1-362_fail-specific-101_n0))))
 (:action missionexec-mission-failed-navtopoint-plan_path_action1_fail_specific_101-1_heli1_nav-3-1-259_nav-3-1-259_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_exec-is-action1_nav-3-1-259) (navtopoint-fsm_state-is-plan_path_nav-3-1-259) (navtopoint-in_start_call-is-no_nav-3-1-259) (missionexec-active-mission_heli1_nav-3-1-259) (missionexec-mission-running_heli1) (fault-count-3_lost_nav-3-1-259_fail-specific-101_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli1) (navtopoint-mode-is-failed_nav-3-1-259) (not (navtopoint-mode-is-running_nav-3-1-259)) (not (missionexec-mission-running_heli1)) (not (fault-count-3_lost_nav-3-1-259_fail-specific-101_n0))))
 (:action missionexec-mission-failed-navtopoint-plan_path_action1_fail_specific_101-1_heli0_nav-3-0-257_nav-3-0-257_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_exec-is-action1_nav-3-0-257) (navtopoint-fsm_state-is-plan_path_nav-3-0-257) (navtopoint-in_start_call-is-no_nav-3-0-257) (missionexec-active-mission_heli0_nav-3-0-257) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-3-0-257_fail-specific-101_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-3-0-257) (not (navtopoint-mode-is-running_nav-3-0-257)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-3-0-257_fail-specific-101_n0))))
 (:action missionexec-mission-failed-navtopoint-plan_path_action1_fail_specific_102-1_heli1_nav-4-1-362_nav-4-1-362_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-4-1-362) (navtopoint-fsm_exec-is-action1_nav-4-1-362) (navtopoint-fsm_state-is-plan_path_nav-4-1-362) (navtopoint-in_start_call-is-no_nav-4-1-362) (missionexec-active-mission_heli1_nav-4-1-362) (missionexec-mission-running_heli1) (fault-count-3_lost_nav-4-1-362_fail-specific-102_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli1) (navtopoint-mode-is-failed_nav-4-1-362) (not (navtopoint-mode-is-running_nav-4-1-362)) (not (missionexec-mission-running_heli1)) (not (fault-count-3_lost_nav-4-1-362_fail-specific-102_n0))))
 (:action missionexec-mission-failed-navtopoint-plan_path_action1_fail_specific_102-1_heli1_nav-3-1-259_nav-3-1-259_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_exec-is-action1_nav-3-1-259) (navtopoint-fsm_state-is-plan_path_nav-3-1-259) (navtopoint-in_start_call-is-no_nav-3-1-259) (missionexec-active-mission_heli1_nav-3-1-259) (missionexec-mission-running_heli1) (fault-count-3_lost_nav-3-1-259_fail-specific-102_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli1) (navtopoint-mode-is-failed_nav-3-1-259) (not (navtopoint-mode-is-running_nav-3-1-259)) (not (missionexec-mission-running_heli1)) (not (fault-count-3_lost_nav-3-1-259_fail-specific-102_n0))))
 (:action missionexec-mission-failed-navtopoint-plan_path_action1_fail_specific_102-1_heli0_nav-3-0-257_nav-3-0-257_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_exec-is-action1_nav-3-0-257) (navtopoint-fsm_state-is-plan_path_nav-3-0-257) (navtopoint-in_start_call-is-no_nav-3-0-257) (missionexec-active-mission_heli0_nav-3-0-257) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-3-0-257_fail-specific-102_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-3-0-257) (not (navtopoint-mode-is-running_nav-3-0-257)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-3-0-257_fail-specific-102_n0))))
 (:action missionexec-mission-failed-navtopoint-plan_path_action2_fail_service-1_heli1_nav-4-1-362_nav-4-1-362_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-4-1-362) (navtopoint-fsm_state-is-plan_path_nav-4-1-362) (navtopoint-fsm_exec-is-action2_nav-4-1-362) (navtopoint-in_start_call-is-no_nav-4-1-362) (missionexec-active-mission_heli1_nav-4-1-362) (missionexec-mission-running_heli1) (fault-count-3_lost_nav-4-1-362_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli1) (navtopoint-mode-is-failed_nav-4-1-362) (not (navtopoint-mode-is-running_nav-4-1-362)) (not (missionexec-mission-running_heli1)) (not (fault-count-3_lost_nav-4-1-362_fail-service_n0))))
 (:action missionexec-mission-failed-navtopoint-plan_path_action2_fail_service-1_heli1_nav-3-1-259_nav-3-1-259_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_state-is-plan_path_nav-3-1-259) (navtopoint-fsm_exec-is-action2_nav-3-1-259) (navtopoint-in_start_call-is-no_nav-3-1-259) (missionexec-active-mission_heli1_nav-3-1-259) (missionexec-mission-running_heli1) (fault-count-3_lost_nav-3-1-259_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli1) (navtopoint-mode-is-failed_nav-3-1-259) (not (navtopoint-mode-is-running_nav-3-1-259)) (not (missionexec-mission-running_heli1)) (not (fault-count-3_lost_nav-3-1-259_fail-service_n0))))
 (:action missionexec-mission-failed-navtopoint-plan_path_action2_fail_service-1_heli0_nav-3-0-257_nav-3-0-257_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_state-is-plan_path_nav-3-0-257) (navtopoint-fsm_exec-is-action2_nav-3-0-257) (navtopoint-in_start_call-is-no_nav-3-0-257) (missionexec-active-mission_heli0_nav-3-0-257) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-3-0-257_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-3-0-257) (not (navtopoint-mode-is-running_nav-3-0-257)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-3-0-257_fail-service_n0))))
 (:action missionexec-mission-failed-navtopoint-plan_path_action2_fail_specific_402-1_heli1_nav-4-1-362_nav-4-1-362_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-4-1-362) (navtopoint-fsm_state-is-plan_path_nav-4-1-362) (navtopoint-fsm_exec-is-action2_nav-4-1-362) (navtopoint-in_start_call-is-no_nav-4-1-362) (missionexec-active-mission_heli1_nav-4-1-362) (missionexec-mission-running_heli1) (fault-count-3_lost_nav-4-1-362_fail-specific-402_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli1) (navtopoint-mode-is-failed_nav-4-1-362) (not (navtopoint-mode-is-running_nav-4-1-362)) (not (missionexec-mission-running_heli1)) (not (fault-count-3_lost_nav-4-1-362_fail-specific-402_n0))))
 (:action missionexec-mission-failed-navtopoint-plan_path_action2_fail_specific_402-1_heli1_nav-3-1-259_nav-3-1-259_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_state-is-plan_path_nav-3-1-259) (navtopoint-fsm_exec-is-action2_nav-3-1-259) (navtopoint-in_start_call-is-no_nav-3-1-259) (missionexec-active-mission_heli1_nav-3-1-259) (missionexec-mission-running_heli1) (fault-count-3_lost_nav-3-1-259_fail-specific-402_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli1) (navtopoint-mode-is-failed_nav-3-1-259) (not (navtopoint-mode-is-running_nav-3-1-259)) (not (missionexec-mission-running_heli1)) (not (fault-count-3_lost_nav-3-1-259_fail-specific-402_n0))))
 (:action missionexec-mission-failed-navtopoint-plan_path_action2_fail_specific_402-1_heli0_nav-3-0-257_nav-3-0-257_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_state-is-plan_path_nav-3-0-257) (navtopoint-fsm_exec-is-action2_nav-3-0-257) (navtopoint-in_start_call-is-no_nav-3-0-257) (missionexec-active-mission_heli0_nav-3-0-257) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-3-0-257_fail-specific-402_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-3-0-257) (not (navtopoint-mode-is-running_nav-3-0-257)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-3-0-257_fail-specific-402_n0))))
 (:action missionexec-mission-failed-navtopoint-plan_path_action2_fail_specific_403-1_heli1_nav-4-1-362_nav-4-1-362_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-4-1-362) (navtopoint-fsm_state-is-plan_path_nav-4-1-362) (navtopoint-fsm_exec-is-action2_nav-4-1-362) (navtopoint-in_start_call-is-no_nav-4-1-362) (missionexec-active-mission_heli1_nav-4-1-362) (missionexec-mission-running_heli1) (fault-count-3_lost_nav-4-1-362_fail-specific-403_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli1) (navtopoint-mode-is-failed_nav-4-1-362) (not (navtopoint-mode-is-running_nav-4-1-362)) (not (missionexec-mission-running_heli1)) (not (fault-count-3_lost_nav-4-1-362_fail-specific-403_n0))))
 (:action missionexec-mission-failed-navtopoint-plan_path_action2_fail_specific_403-1_heli1_nav-3-1-259_nav-3-1-259_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_state-is-plan_path_nav-3-1-259) (navtopoint-fsm_exec-is-action2_nav-3-1-259) (navtopoint-in_start_call-is-no_nav-3-1-259) (missionexec-active-mission_heli1_nav-3-1-259) (missionexec-mission-running_heli1) (fault-count-3_lost_nav-3-1-259_fail-specific-403_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli1) (navtopoint-mode-is-failed_nav-3-1-259) (not (navtopoint-mode-is-running_nav-3-1-259)) (not (missionexec-mission-running_heli1)) (not (fault-count-3_lost_nav-3-1-259_fail-specific-403_n0))))
 (:action missionexec-mission-failed-navtopoint-plan_path_action2_fail_specific_403-1_heli0_nav-3-0-257_nav-3-0-257_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_state-is-plan_path_nav-3-0-257) (navtopoint-fsm_exec-is-action2_nav-3-0-257) (navtopoint-in_start_call-is-no_nav-3-0-257) (missionexec-active-mission_heli0_nav-3-0-257) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-3-0-257_fail-specific-403_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-3-0-257) (not (navtopoint-mode-is-running_nav-3-0-257)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-3-0-257_fail-specific-403_n0))))
 (:action missionexec-mission-failed-navtopoint-plan_path_action2_fail_specific_404-1_heli1_nav-4-1-362_nav-4-1-362_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-4-1-362) (navtopoint-fsm_state-is-plan_path_nav-4-1-362) (navtopoint-fsm_exec-is-action2_nav-4-1-362) (navtopoint-in_start_call-is-no_nav-4-1-362) (missionexec-active-mission_heli1_nav-4-1-362) (missionexec-mission-running_heli1) (fault-count-3_lost_nav-4-1-362_fail-specific-404_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli1) (navtopoint-mode-is-failed_nav-4-1-362) (not (navtopoint-mode-is-running_nav-4-1-362)) (not (missionexec-mission-running_heli1)) (not (fault-count-3_lost_nav-4-1-362_fail-specific-404_n0))))
 (:action missionexec-mission-failed-navtopoint-plan_path_action2_fail_specific_404-1_heli1_nav-3-1-259_nav-3-1-259_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_state-is-plan_path_nav-3-1-259) (navtopoint-fsm_exec-is-action2_nav-3-1-259) (navtopoint-in_start_call-is-no_nav-3-1-259) (missionexec-active-mission_heli1_nav-3-1-259) (missionexec-mission-running_heli1) (fault-count-3_lost_nav-3-1-259_fail-specific-404_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli1) (navtopoint-mode-is-failed_nav-3-1-259) (not (navtopoint-mode-is-running_nav-3-1-259)) (not (missionexec-mission-running_heli1)) (not (fault-count-3_lost_nav-3-1-259_fail-specific-404_n0))))
 (:action missionexec-mission-failed-navtopoint-plan_path_action2_fail_specific_404-1_heli0_nav-3-0-257_nav-3-0-257_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_state-is-plan_path_nav-3-0-257) (navtopoint-fsm_exec-is-action2_nav-3-0-257) (navtopoint-in_start_call-is-no_nav-3-0-257) (missionexec-active-mission_heli0_nav-3-0-257) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-3-0-257_fail-specific-404_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-3-0-257) (not (navtopoint-mode-is-running_nav-3-0-257)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-3-0-257_fail-specific-404_n0))))
 (:action missionexec-mission-failed-navtopoint-fly_path_action1_fail_service-1_heli1_nav-4-1-362_nav-4-1-362_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-4-1-362) (navtopoint-fsm_exec-is-action1_nav-4-1-362) (navtopoint-in_start_call-is-no_nav-4-1-362) (navtopoint-fsm_state-is-fly_path_nav-4-1-362) (missionexec-active-mission_heli1_nav-4-1-362) (missionexec-mission-running_heli1) (fault-count-3_lost_nav-4-1-362_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli1) (navtopoint-mode-is-failed_nav-4-1-362) (not (navtopoint-mode-is-running_nav-4-1-362)) (not (missionexec-mission-running_heli1)) (not (fault-count-3_lost_nav-4-1-362_fail-service_n0))))
 (:action missionexec-mission-failed-navtopoint-fly_path_action1_fail_service-1_heli1_nav-3-1-259_nav-3-1-259_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_exec-is-action1_nav-3-1-259) (navtopoint-in_start_call-is-no_nav-3-1-259) (navtopoint-fsm_state-is-fly_path_nav-3-1-259) (missionexec-active-mission_heli1_nav-3-1-259) (missionexec-mission-running_heli1) (fault-count-3_lost_nav-3-1-259_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli1) (navtopoint-mode-is-failed_nav-3-1-259) (not (navtopoint-mode-is-running_nav-3-1-259)) (not (missionexec-mission-running_heli1)) (not (fault-count-3_lost_nav-3-1-259_fail-service_n0))))
 (:action missionexec-mission-failed-navtopoint-fly_path_action1_fail_service-1_heli0_nav-3-0-257_nav-3-0-257_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_exec-is-action1_nav-3-0-257) (navtopoint-in_start_call-is-no_nav-3-0-257) (navtopoint-fsm_state-is-fly_path_nav-3-0-257) (missionexec-active-mission_heli0_nav-3-0-257) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-3-0-257_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-3-0-257) (not (navtopoint-mode-is-running_nav-3-0-257)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-3-0-257_fail-service_n0))))
 (:action missionexec-mission-failed-navtopoint-fly_path_action1_fail_proxy_init-1_heli1_nav-4-1-362_nav-4-1-362_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-4-1-362) (navtopoint-fsm_exec-is-action1_nav-4-1-362) (navtopoint-in_start_call-is-no_nav-4-1-362) (navtopoint-fsm_state-is-fly_path_nav-4-1-362) (missionexec-active-mission_heli1_nav-4-1-362) (missionexec-mission-running_heli1) (fault-count-3_lost_nav-4-1-362_fail-subtask_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli1) (navtopoint-mode-is-failed_nav-4-1-362) (not (navtopoint-mode-is-running_nav-4-1-362)) (not (missionexec-mission-running_heli1)) (not (fault-count-3_lost_nav-4-1-362_fail-subtask_n0))))
 (:action missionexec-mission-failed-navtopoint-fly_path_action1_fail_proxy_init-1_heli1_nav-3-1-259_nav-3-1-259_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_exec-is-action1_nav-3-1-259) (navtopoint-in_start_call-is-no_nav-3-1-259) (navtopoint-fsm_state-is-fly_path_nav-3-1-259) (missionexec-active-mission_heli1_nav-3-1-259) (missionexec-mission-running_heli1) (fault-count-3_lost_nav-3-1-259_fail-subtask_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli1) (navtopoint-mode-is-failed_nav-3-1-259) (not (navtopoint-mode-is-running_nav-3-1-259)) (not (missionexec-mission-running_heli1)) (not (fault-count-3_lost_nav-3-1-259_fail-subtask_n0))))
 (:action missionexec-mission-failed-navtopoint-fly_path_action1_fail_proxy_init-1_heli0_nav-3-0-257_nav-3-0-257_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_exec-is-action1_nav-3-0-257) (navtopoint-in_start_call-is-no_nav-3-0-257) (navtopoint-fsm_state-is-fly_path_nav-3-0-257) (missionexec-active-mission_heli0_nav-3-0-257) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-3-0-257_fail-subtask_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-3-0-257) (not (navtopoint-mode-is-running_nav-3-0-257)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-3-0-257_fail-subtask_n0))))
 (:action missionexec-mission-failed-navtopoint-fly_path_subtask_fail_2-1_heli1_nav-4-1-362_nav-4-1-362_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-4-1-362) (navtopoint-fsm_state-is-fly_path_nav-4-1-362) (navtopoint-fsm_exec-is-reaction_f3d_fail_2_nav-4-1-362) (missionexec-active-mission_heli1_nav-4-1-362) (missionexec-mission-running_heli1) (fault-count-3_lost_nav-4-1-362_fail-subtask_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli1) (navtopoint-mode-is-failed_nav-4-1-362) (not (navtopoint-mode-is-running_nav-4-1-362)) (not (missionexec-mission-running_heli1)) (not (fault-count-3_lost_nav-4-1-362_fail-subtask_n0))))
 (:action missionexec-mission-failed-navtopoint-fly_path_subtask_fail_2-1_heli1_nav-3-1-259_nav-3-1-259_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-1-259) (navtopoint-fsm_state-is-fly_path_nav-3-1-259) (navtopoint-fsm_exec-is-reaction_f3d_fail_2_nav-3-1-259) (missionexec-active-mission_heli1_nav-3-1-259) (missionexec-mission-running_heli1) (fault-count-3_lost_nav-3-1-259_fail-subtask_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli1) (navtopoint-mode-is-failed_nav-3-1-259) (not (navtopoint-mode-is-running_nav-3-1-259)) (not (missionexec-mission-running_heli1)) (not (fault-count-3_lost_nav-3-1-259_fail-subtask_n0))))
 (:action missionexec-mission-failed-navtopoint-fly_path_subtask_fail_2-1_heli0_nav-3-0-257_nav-3-0-257_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-3-0-257) (navtopoint-fsm_state-is-fly_path_nav-3-0-257) (navtopoint-fsm_exec-is-reaction_f3d_fail_2_nav-3-0-257) (missionexec-active-mission_heli0_nav-3-0-257) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-3-0-257_fail-subtask_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-3-0-257) (not (navtopoint-mode-is-running_nav-3-0-257)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-3-0-257_fail-subtask_n0))))
 (:action missionexec-destroy-mission-fly3d-call_destroy_when_done-1_heli1_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-done_f3d-2-1-364) (fault-count-3_lost_f3d-2-1-364_destroyed_n0) (missionexec-active-mission_heli1_f3d-2-1-364) (missionexec-mission-over_heli1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-idle_heli1) (not (fly3d-mode-is-done_f3d-2-1-364)) (not (fault-count-3_lost_f3d-2-1-364_destroyed_n0)) (not (missionexec-mission-over_heli1))))
 (:action missionexec-destroy-mission-fly3d-call_destroy_when_done-1_heli0_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-done_f3d-3-0-369) (fault-count-3_lost_f3d-3-0-369_destroyed_n0) (missionexec-active-mission_heli0_f3d-3-0-369) (missionexec-mission-over_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-idle_heli0) (not (fly3d-mode-is-done_f3d-3-0-369)) (not (fault-count-3_lost_f3d-3-0-369_destroyed_n0)) (not (missionexec-mission-over_heli0))))
 (:action missionexec-destroy-mission-fly3d-call_destroy_when_failed-1_heli1_f3d-2-1-364_f3d-2-1-364_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_f3d-2-1-364_destroyed_n0) (fly3d-mode-is-failed_f3d-2-1-364) (missionexec-active-mission_heli1_f3d-2-1-364) (missionexec-mission-over_heli1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-idle_heli1) (not (fault-count-3_lost_f3d-2-1-364_destroyed_n0)) (not (fly3d-mode-is-failed_f3d-2-1-364)) (not (missionexec-mission-over_heli1))))
 (:action missionexec-destroy-mission-fly3d-call_destroy_when_failed-1_heli0_f3d-3-0-369_f3d-3-0-369_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_f3d-3-0-369_destroyed_n0) (fly3d-mode-is-failed_f3d-3-0-369) (missionexec-active-mission_heli0_f3d-3-0-369) (missionexec-mission-over_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-idle_heli0) (not (fault-count-3_lost_f3d-3-0-369_destroyed_n0)) (not (fly3d-mode-is-failed_f3d-3-0-369)) (not (missionexec-mission-over_heli0))))
 (:action missionexec-destroy-mission-navtopoint-call_destroy_when_done-1_heli1_nav-4-1-362_nav-4-1-362_n0_n1
  :parameters ()
  :precondition (and (missionexec-active-mission_heli1_nav-4-1-362) (missionexec-mission-over_heli1) (navtopoint-mode-is-done_nav-4-1-362) (fault-count-3_lost_nav-4-1-362_destroyed_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-idle_heli1) (not (missionexec-mission-over_heli1)) (not (navtopoint-mode-is-done_nav-4-1-362)) (not (fault-count-3_lost_nav-4-1-362_destroyed_n0))))
 (:action missionexec-destroy-mission-navtopoint-call_destroy_when_done-1_heli1_nav-3-1-259_nav-3-1-259_n0_n1
  :parameters ()
  :precondition (and (missionexec-active-mission_heli1_nav-3-1-259) (missionexec-mission-over_heli1) (navtopoint-mode-is-done_nav-3-1-259) (fault-count-3_lost_nav-3-1-259_destroyed_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-idle_heli1) (not (missionexec-mission-over_heli1)) (not (navtopoint-mode-is-done_nav-3-1-259)) (not (fault-count-3_lost_nav-3-1-259_destroyed_n0)) (not (dominates-3_hyp2_lost_nav-3-1-259_destroyed)) (not (dominates-3_hyp1_lost_nav-3-1-259_destroyed))))
 (:action missionexec-destroy-mission-navtopoint-call_destroy_when_done-1_heli0_nav-3-0-257_nav-3-0-257_n0_n1
  :parameters ()
  :precondition (and (missionexec-active-mission_heli0_nav-3-0-257) (missionexec-mission-over_heli0) (navtopoint-mode-is-done_nav-3-0-257) (fault-count-3_lost_nav-3-0-257_destroyed_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-idle_heli0) (not (missionexec-mission-over_heli0)) (not (navtopoint-mode-is-done_nav-3-0-257)) (not (fault-count-3_lost_nav-3-0-257_destroyed_n0))))
 (:action missionexec-destroy-mission-navtopoint-call_destroy_when_failed-1_heli1_nav-4-1-362_nav-4-1-362_n0_n1
  :parameters ()
  :precondition (and (missionexec-active-mission_heli1_nav-4-1-362) (missionexec-mission-over_heli1) (navtopoint-mode-is-failed_nav-4-1-362) (fault-count-3_lost_nav-4-1-362_destroyed_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-idle_heli1) (not (missionexec-mission-over_heli1)) (not (navtopoint-mode-is-failed_nav-4-1-362)) (not (fault-count-3_lost_nav-4-1-362_destroyed_n0))))
 (:action missionexec-destroy-mission-navtopoint-call_destroy_when_failed-1_heli1_nav-3-1-259_nav-3-1-259_n0_n1
  :parameters ()
  :precondition (and (missionexec-active-mission_heli1_nav-3-1-259) (missionexec-mission-over_heli1) (navtopoint-mode-is-failed_nav-3-1-259) (fault-count-3_lost_nav-3-1-259_destroyed_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-idle_heli1) (not (missionexec-mission-over_heli1)) (not (navtopoint-mode-is-failed_nav-3-1-259)) (not (fault-count-3_lost_nav-3-1-259_destroyed_n0)) (not (dominates-3_hyp2_lost_nav-3-1-259_destroyed)) (not (dominates-3_hyp1_lost_nav-3-1-259_destroyed))))
 (:action missionexec-destroy-mission-navtopoint-call_destroy_when_failed-1_heli0_nav-3-0-257_nav-3-0-257_n0_n1
  :parameters ()
  :precondition (and (missionexec-active-mission_heli0_nav-3-0-257) (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-3-0-257) (fault-count-3_lost_nav-3-0-257_destroyed_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-idle_heli0) (not (missionexec-mission-over_heli0)) (not (navtopoint-mode-is-failed_nav-3-0-257)) (not (fault-count-3_lost_nav-3-0-257_destroyed_n0))))
 (:action advance-to-obs-1_obs1_obs0
  :parameters ()
  :precondition (and (observed_obs0) (future_obs1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs1) (not (future_obs1))))
 (:action advance-to-obs-1_obs2_obs1
  :parameters ()
  :precondition (and (observed_obs1) (future_obs2) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs2) (not (future_obs2))))
 (:action advance-to-obs-1_obs3_obs1
  :parameters ()
  :precondition (and (observed_obs1) (future_obs3) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs3) (not (future_obs3))))
 (:action advance-to-obs-1_obs7_obs6
  :parameters ()
  :precondition (and (observed_obs6) (future_obs7) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs7) (not (future_obs7))))
 (:action advance-to-obs-1_obs8_obs7
  :parameters ()
  :precondition (and (observed_obs7) (future_obs8) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs8) (not (future_obs8))))
 (:action advance-to-obs-1_obs9_obs7
  :parameters ()
  :precondition (and (observed_obs7) (future_obs9) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs9) (not (future_obs9))))
 (:action advance-to-obs-1_obs11_obs10
  :parameters ()
  :precondition (and (observed_obs10) (future_obs11) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs11) (not (future_obs11))))
 (:action advance-to-obs-1_obs12_obs10
  :parameters ()
  :precondition (and (observed_obs10) (future_obs12) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs12) (not (future_obs12))))
 (:action advance-to-obs-1_obs13_obs10
  :parameters ()
  :precondition (and (observed_obs10) (future_obs13) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs13) (not (future_obs13))))
 (:action advance-to-obs-1_obs15_obs14
  :parameters ()
  :precondition (and (observed_obs14) (future_obs15) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs15) (not (future_obs15))))
 (:action advance-to-obs-1_obs16_obs15
  :parameters ()
  :precondition (and (observed_obs15) (future_obs16) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs16) (not (future_obs16))))
 (:action advance-to-obs-1_obs17_obs16
  :parameters ()
  :precondition (and (observed_obs16) (future_obs17) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs17) (not (future_obs17))))
 (:action advance-to-obs-1_obs18_obs17
  :parameters ()
  :precondition (and (observed_obs17) (future_obs18) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs18) (not (future_obs18))))
 (:action advance-to-obs-1_obs19_obs18
  :parameters ()
  :precondition (and (observed_obs18) (future_obs19) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs19) (not (future_obs19))))
 (:action advance-to-obs-1_obs20_obs18
  :parameters ()
  :precondition (and (observed_obs18) (future_obs20) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs20) (not (future_obs20))))
 (:action advance-to-obs-1_obs22_obs21
  :parameters ()
  :precondition (and (observed_obs21) (future_obs22) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs22) (not (future_obs22))))
 (:action advance-to-obs-1_obs23_obs22
  :parameters ()
  :precondition (and (observed_obs22) (future_obs23) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs23) (not (future_obs23))))
 (:action advance-to-obs-1_obs24_obs23
  :parameters ()
  :precondition (and (observed_obs23) (future_obs24) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs24) (not (future_obs24))))
 (:action advance-to-obs-1_obs25_obs24
  :parameters ()
  :precondition (and (observed_obs24) (future_obs25) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs25) (not (future_obs25))))
 (:action advance-to-obs-1_obs26_obs25
  :parameters ()
  :precondition (and (observed_obs25) (future_obs26) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs26) (not (future_obs26))))
 (:action advance-to-obs-1_obs27_obs25
  :parameters ()
  :precondition (and (observed_obs25) (future_obs27) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs27) (not (future_obs27))))
 (:action advance-to-obs-1_obs28_obs25
  :parameters ()
  :precondition (and (observed_obs25) (future_obs28) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs28) (not (future_obs28))))
 (:action advance-to-obs-1_obs29_obs25
  :parameters ()
  :precondition (and (observed_obs25) (future_obs29) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs29) (not (future_obs29))))
 (:action advance-to-obs-2_obs4_obs2_obs3
  :parameters ()
  :precondition (and (observed_obs2) (observed_obs3) (future_obs4) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs4) (not (future_obs4))))
 (:action advance-to-obs-2_obs5_obs2_obs3
  :parameters ()
  :precondition (and (observed_obs2) (observed_obs3) (future_obs5) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs5) (not (future_obs5))))
 (:action advance-to-obs-2_obs6_obs4_obs5
  :parameters ()
  :precondition (and (observed_obs4) (observed_obs5) (future_obs6) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs6) (not (future_obs6))))
 (:action advance-to-obs-2_obs10_obs8_obs9
  :parameters ()
  :precondition (and (observed_obs8) (observed_obs9) (future_obs10) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs10) (not (future_obs10))))
 (:action advance-to-obs-2_obs21_obs19_obs20
  :parameters ()
  :precondition (and (observed_obs20) (observed_obs19) (future_obs21) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs21) (not (future_obs21))))
 (:action advance-to-obs-3_obs14_obs11_obs12_obs13
  :parameters ()
  :precondition (and (observed_obs13) (observed_obs11) (observed_obs12) (future_obs14) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs14) (not (future_obs14))))
 (:action set_goal_0_constraint0
  :parameters ()
  :precondition (and (observed_obs2) (observed_obs4) (observed_obs6) (observed_obs8) (observed_obs17) (observed_obs21) (observed_obs3) (observed_obs5) (observed_obs7) (observed_obs20) (observed_obs27) (dominates-3_hyp2_lost_heli1_fcl-event-canceled) (observed_obs1) (observed_obs0) (observed_obs16) (observed_obs13) (observed_obs19) (observed_obs18) (observed_obs26) (observed_obs11) (observed_obs14) (observed_obs15) (observed_obs12) (observed_obs23) (observed_obs29) (observed_obs22) (observed_obs28) (observed_obs25) (observed_obs10) (observed_obs9) (observed_obs24) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (achieved_constraint0) (not (not_at_end_constraint0))))
 (:action set_goal_1_constraint0
  :parameters ()
  :precondition (and (observed_obs2) (observed_obs4) (observed_obs6) (observed_obs8) (observed_obs17) (observed_obs21) (observed_obs3) (observed_obs5) (observed_obs7) (observed_obs20) (observed_obs27) (dominates-3_hyp2_lost_heli0_fcl-event-canceled) (observed_obs1) (observed_obs0) (observed_obs16) (observed_obs13) (observed_obs19) (observed_obs18) (observed_obs26) (observed_obs11) (observed_obs14) (observed_obs15) (observed_obs12) (observed_obs23) (observed_obs29) (observed_obs22) (observed_obs28) (observed_obs25) (observed_obs10) (observed_obs9) (observed_obs24) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (achieved_constraint0) (not (not_at_end_constraint0))))
 (:action set_goal_4_constraint0
  :parameters ()
  :precondition (and (observed_obs2) (observed_obs4) (observed_obs6) (observed_obs8) (observed_obs17) (observed_obs21) (observed_obs3) (observed_obs5) (observed_obs7) (observed_obs20) (observed_obs27) (observed_obs1) (observed_obs0) (observed_obs16) (observed_obs13) (observed_obs19) (observed_obs18) (observed_obs26) (observed_obs11) (observed_obs14) (observed_obs15) (observed_obs12) (observed_obs23) (observed_obs29) (observed_obs22) (observed_obs28) (observed_obs25) (observed_obs10) (observed_obs9) (observed_obs24) (dominates-3_hyp2_lost_nav-3-1-259_destroyed) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (achieved_constraint0) (not (not_at_end_constraint0))))
 (:action set_goal_0_constraint1
  :parameters ()
  :precondition (and (observed_obs2) (observed_obs4) (observed_obs6) (observed_obs8) (observed_obs17) (observed_obs21) (observed_obs3) (observed_obs5) (observed_obs7) (observed_obs20) (observed_obs27) (dominates-3_hyp1_lost_heli1_fcl-event-canceled) (observed_obs1) (observed_obs0) (observed_obs16) (observed_obs13) (observed_obs19) (observed_obs18) (observed_obs26) (observed_obs11) (observed_obs14) (observed_obs15) (observed_obs12) (observed_obs23) (observed_obs29) (observed_obs22) (observed_obs28) (observed_obs25) (observed_obs10) (observed_obs9) (observed_obs24) (achieved_constraint0) (not_at_end_constraint1))
  :effect (and (achieved_constraint1) (not (not_at_end_constraint1))))
 (:action set_goal_1_constraint1
  :parameters ()
  :precondition (and (observed_obs2) (observed_obs4) (observed_obs6) (observed_obs8) (observed_obs17) (observed_obs21) (observed_obs3) (observed_obs5) (observed_obs7) (observed_obs20) (observed_obs27) (dominates-3_hyp1_lost_heli0_fcl-event-manual) (observed_obs1) (observed_obs0) (observed_obs16) (observed_obs13) (observed_obs19) (observed_obs18) (observed_obs26) (observed_obs11) (observed_obs14) (observed_obs15) (observed_obs12) (observed_obs23) (observed_obs29) (observed_obs22) (observed_obs28) (observed_obs25) (observed_obs10) (observed_obs9) (observed_obs24) (achieved_constraint0) (not_at_end_constraint1))
  :effect (and (achieved_constraint1) (not (not_at_end_constraint1))))
 (:action set_goal_4_constraint1
  :parameters ()
  :precondition (and (observed_obs2) (observed_obs4) (observed_obs6) (observed_obs8) (observed_obs17) (observed_obs21) (observed_obs3) (observed_obs5) (observed_obs7) (observed_obs20) (observed_obs27) (observed_obs1) (observed_obs0) (observed_obs16) (observed_obs13) (observed_obs19) (observed_obs18) (observed_obs26) (observed_obs11) (observed_obs14) (observed_obs15) (observed_obs12) (observed_obs23) (observed_obs29) (observed_obs22) (observed_obs28) (observed_obs25) (observed_obs10) (observed_obs9) (observed_obs24) (dominates-3_hyp1_lost_nav-3-1-259_destroyed) (achieved_constraint0) (not_at_end_constraint1))
  :effect (and (achieved_constraint1) (not (not_at_end_constraint1))))
)
