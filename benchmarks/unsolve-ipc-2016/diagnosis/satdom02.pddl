(define (domain witas-dddl-compiled)
 (:requirements :strips :equality)
 (:predicates (pending_obs6) (observed_obs6) (pending_obs8) (observed_obs8) (pending_obs15) (observed_obs15) (pending_obs17) (observed_obs17) (pending_obs29) (observed_obs29) (fault-count-3_lost_heli0_fcl-event-finished_n0) (fault-count-3_lost_heli0_fcl-event-canceled_n0) (fault-count-3_lost_heli0_fcl-event-manual_n0) (fault-count-3_lost_heli0_fcl-event-not_accepted_n0) (fault-count-3_lost_heli0_fcl-event-traj3d_next_segment_n0) (pending_obs3) (observed_obs3) (fault-count-3_lost_heli0_fcl-return-finished_n0) (fault-count-3_lost_heli0_fcl-return-canceled_n0) (fault-count-3_lost_heli0_fcl-return-manual_n0) (fault-count-3_lost_heli0_fcl-return-not_accepted_n0) (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-start_f3d-2-0-370) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-start_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (pending_obs28) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-0-370) (observed_obs28) (pending_obs14) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364) (observed_obs14) (fault-count-3_lost_f3d-2-0-370_checkpoint10_n0) (fault-count-3_lost_f3d-1-0-364_checkpoint10_n0) (fault-count-3_lost_f3d-2-0-370_checkpoint11_n0) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370) (fault-count-3_lost_f3d-1-0-364_checkpoint11_n0) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-2-0-370) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fault-count-3_lost_f3d-2-0-370_checkpoint12_n0) (fault-count-3_lost_f3d-1-0-364_checkpoint12_n0) (fly3d-fsm_exec-is-reaction_cancel_1_f3d-2-0-370) (fly3d-fsm_exec-is-reaction_cancel_1_f3d-1-0-364) (fly3d-fsm_exec-is-reaction_error_1_f3d-2-0-370) (fly3d-fsm_exec-is-reaction_error_1_f3d-1-0-364) (fault-count-3_lost_f3d-2-0-370_checkpoint20_n0) (fly3d-trajectory-not-sent_f3d-2-0-370) (fault-count-3_lost_f3d-1-0-364_checkpoint20_n0) (fly3d-trajectory-not-sent_f3d-1-0-364) (pending_obs16) (fly3d-fsm_state-is-wait_trajectory_end_f3d-1-0-364) (observed_obs16) (fault-count-3_lost_f3d-2-0-370_checkpoint21_n0) (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-0-370) (fault-count-3_lost_f3d-1-0-364_checkpoint21_n0) (fault-count-3_lost_f3d-2-0-370_checkpoint22_n0) (fly3d-fsm_exec-is-action2_f3d-2-0-370) (fault-count-3_lost_f3d-1-0-364_checkpoint22_n0) (fly3d-fsm_exec-is-action2_f3d-1-0-364) (fly3d-fsm_exec-is-reaction_finished_1_f3d-2-0-370) (fly3d-fsm_exec-is-reaction_finished_1_f3d-1-0-364) (pending_obs18) (fly3d-fsm_exec-is-reaction_finished_2_f3d-1-0-364) (observed_obs18) (fault-count-3_lost_f3d-2-0-370_checkpoint24_n0) (fly3d-fsm_exec-is-reaction_finished_2_f3d-2-0-370) (fault-count-3_lost_f3d-1-0-364_checkpoint24_n0) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-2-0-370) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-1-0-364) (fly3d-fsm_state-is-goal_point_wait_f3d-2-0-370) (fly3d-fsm_state-is-goal_point_wait_f3d-1-0-364) (fault-count-3_lost_f3d-2-0-370_checkpoint30_n0) (fly3d-fsm_exec-is-action2-wait_f3d-2-0-370) (fault-count-3_lost_f3d-1-0-364_checkpoint30_n0) (fly3d-fsm_exec-is-action2-wait_f3d-1-0-364) (fly3d-fsm_exec-is-action2-exit_f3d-2-0-370) (fly3d-fsm_exec-is-action2-exit_f3d-1-0-364) (fly3d-fsm_exec-is-action2-fail_f3d-2-0-370) (fly3d-fsm_exec-is-action2-fail_f3d-1-0-364) (fault-count-3_lost_f3d-2-0-370_checkpoint31_n0) (fault-count-3_lost_f3d-1-0-364_checkpoint31_n0) (fault-count-3_lost_f3d-2-0-370_checkpoint40_n0) (fault-count-3_lost_f3d-1-0-364_checkpoint40_n0) (fly3d-fsm_exec-is-global_reaction_cancel_1_f3d-2-0-370) (fly3d-fsm_exec-is-global_reaction_cancel_1_f3d-1-0-364) (fly3d-fsm_exec-is-global_reaction_error_1_f3d-2-0-370) (fly3d-fsm_exec-is-global_reaction_error_1_f3d-1-0-364) (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_exec-is-start_ato-1-0-275) (autotakeoff-fsm_state-is-takeoff_ato-1-0-275) (autotakeoff-fsm_exec-is-action1_ato-1-0-275) (autotakeoff-in_start_call-is-yes_ato-1-0-275) (pending_obs1) (autotakeoff-fsm_exec-is-action2_ato-1-0-275) (observed_obs1) (fault-count-3_lost_ato-1-0-275_checkpoint1_n0) (autotakeoff-fsm_exec-is-nothing_ato-1-0-275) (autotakeoff-fsm_exec-is-reaction_finished_1_ato-1-0-275) (fault-count-3_lost_ato-1-0-275_checkpoint2_n0) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-1-0-275) (dominates-3_hyp2_lost_ato-1-0-275_checkpoint2) (dominates-3_hyp1_lost_ato-1-0-275_checkpoint2) (autotakeoff-fsm_exec-is-reaction_error_1_ato-1-0-275) (autotakeoff-fsm_exec-is-reaction_cancel_1_ato-1-0-275) (pending_obs2) (observed_obs2) (pending_obs4) (observed_obs4) (pending_obs5) (observed_obs5) (autotakeoff-in_start_call-is-no_ato-1-0-275) (fault-count-3_lost_ato-1-0-275_checkpoint7_n0) (autotakeoff-fsm_exec-is-action2-exit_ato-1-0-275) (pending_obs7) (autotakeoff-fsm_exec-is-action2-climb_ato-1-0-275) (observed_obs7) (fault-count-3_lost_ato-1-0-275_checkpoint5_n0) (pending_obs9) (autotakeoff-fsm_exec-is-reaction_finished_2_ato-1-0-275) (observed_obs9) (fault-count-3_lost_ato-1-0-275_checkpoint6_n0) (fault-count-2_lost_ccl-event-goal_elevation_achieved_n0) (fault-count-2_lost_ccl-event-goal_azimuth_achieved_n0) (fault-count-2_lost_ccl-event-goal_elevation_not_achieved_n0) (fault-count-2_lost_ccl-event-goal_azimuth_not_achieved_n0) (fault-count-2_lost_ccl-event-ccl_manual_control_n0) (fault-count-2_lost_ccl-event-ccl_ipc_control_n0) (fault-count-2_lost_ccl-event-ccl_drc_control_n0) (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-start_bcc-0-0-275) (basiccameracontrol-fsm_state-is-select_initial_mode_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-not_in_control_bcc-0-0-275) (basiccameracontrol-fsm_state-is-start_tracking_position_bcc-0-0-275) (basiccameracontrol-fsm_state-is-start_tracking_bearing_bcc-0-0-275) (basiccameracontrol-fsm_state-is-set_locked_mode_bcc-0-0-275) (fault-count-3_lost_bcc-0-0-275_checkpoint101_n0) (basiccameracontrol-fsm_state-is-seq_position_command_bcc-0-0-275) (fault-count-3_lost_bcc-0-0-275_checkpoint111_n0) (basiccameracontrol-fsm_state-is-seq_lock_command_bcc-0-0-275) (dominates-3_hyp1_lost_bcc-0-0-275_checkpoint111) (fault-count-3_lost_bcc-0-0-275_checkpoint112_n0) (basiccameracontrol-in_start_call-is-no_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275) (basiccameracontrol-fsm_state-is-converge_bcc-0-0-275) (pending_obs23) (basiccameracontrol-fsm_state-is-seq_bearing_command_bcc-0-0-275) (observed_obs23) (fault-count-3_lost_bcc-0-0-275_checkpoint102_n0) (basiccameracontrol-fsm_state-is-converge_wait_bcc-0-0-275) (basiccameracontrol-fsm_state-is-converge_final_wait_bcc-0-0-275) (basiccameracontrol-fsm_state-is-converge_failed_bcc-0-0-275) (basiccameracontrol-fsm_state-is-tracking_bcc-0-0-275) (fault-count-3_lost_bcc-0-0-275_checkpoint301_n0) (fault-count-3_lost_bcc-0-0-275_checkpoint201_n0) (basiccameracontrol-fsm_exec-is-action2_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-elevation_lost_reaction1_bcc-0-0-275) (fault-count-3_lost_bcc-0-0-275_checkpoint311_n0) (basiccameracontrol-fsm_exec-is-azimuth_lost_reaction1_bcc-0-0-275) (fault-count-3_lost_bcc-0-0-275_checkpoint312_n0) (fault-count-3_lost_bcc-0-0-275_checkpoint104_n0) (basiccameracontrol-fsm_state-is-seq_turn_command_bcc-0-0-275) (dominates-3_hyp2_lost_bcc-0-0-275_checkpoint104) (fault-count-3_lost_bcc-0-0-275_checkpoint404_n0) (basiccameracontrol-fsm_state-is-locked_camera_mode_bcc-0-0-275) (pending_obs22) (observed_obs22) (fault-count-3_lost_bcc-0-0-275_checkpoint400_n0) (fault-count-3_lost_bcc-0-0-275_checkpoint700_n0) (fault-count-3_lost_bcc-0-0-275_checkpoint410_n0) (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_state-is-start_decouple_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_exec-is-action1_nav-2-0-275) (navtopoint-fsm_state-is-plan_path_nav-2-0-275) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_state-is-start_decouple_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_exec-is-action1_nav-1-0-275) (navtopoint-fsm_state-is-plan_path_nav-1-0-275) (pending_obs26) (navtopoint-fsm_exec-is-action2_nav-2-0-275) (observed_obs26) (fault-count-3_lost_nav-2-0-275_checkpoint1_n0) (fault-count-3_lost_nav-1-0-275_checkpoint1_n0) (navtopoint-fsm_exec-is-action2_nav-1-0-275) (dominates-3_hyp2_lost_nav-1-0-275_checkpoint1) (dominates-3_hyp1_lost_nav-1-0-275_checkpoint1) (navtopoint-in_start_call-is-no_nav-2-0-275) (pending_obs27) (navtopoint-fsm_state-is-wait_for_go_nav-2-0-275) (observed_obs27) (navtopoint-in_start_call-is-no_nav-1-0-275) (pending_obs12) (navtopoint-fsm_state-is-wait_for_go_nav-1-0-275) (observed_obs12) (fault-count-3_lost_nav-2-0-275_checkpoint4_n0) (fault-count-3_lost_nav-1-0-275_checkpoint4_n0) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (fly3d-mode-is-pre_init_f3d-2-0-370) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-2-0-370) (fly3d-mode-is-processing_f3d-2-0-370) (called-by_f3d-2-0-370_nav-2-0-275) (fly3d-mode-is-pre_init_f3d-1-0-364) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-1-0-364) (fly3d-mode-is-processing_f3d-1-0-364) (called-by_f3d-1-0-364_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-2-0-370) (called-by_f3d-2-0-370_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (called-by_f3d-1-0-364_nav-1-0-275) (pending_obs13) (navtopoint-fsm_exec-is-reaction_f3d_ready_nav-2-0-275) (fly3d-mode-is-ready_f3d-1-0-364) (observed_obs13) (navtopoint-fsm_exec-is-reaction_f3d_ready_nav-1-0-275) (called-by_f3d-2-0-370_missionexecutor) (fault-count-4_lost_f3d-2-0-370_created_missionexecutor_n0) (fly3d-mode-is-ready_f3d-2-0-370) (fault-count-4_lost_f3d-2-0-370_created_nav-2-0-275_n0) (dominates-4_hyp2_lost_f3d-2-0-370_created_nav-2-0-275) (dominates-4_hyp1_lost_f3d-2-0-370_created_nav-2-0-275) (fault-count-4_lost_f3d-2-0-370_created_nav-1-0-275_n0) (called-by_f3d-1-0-364_missionexecutor) (fault-count-4_lost_f3d-1-0-364_created_missionexecutor_n0) (fault-count-4_lost_f3d-1-0-364_created_nav-2-0-275_n0) (fault-count-4_lost_f3d-1-0-364_created_nav-1-0-275_n0) (fly3d-in_start_call-is-yes_f3d-2-0-370) (fly3d-in_start_call-is-yes_f3d-1-0-364) (fly3d-mode-is-done_f3d-1-0-364) (pending_obs20) (navtopoint-fsm_exec-is-reaction_f3d_fail_2_nav-2-0-275) (observed_obs20) (navtopoint-fsm_exec-is-reaction_f3d_fail_2_nav-1-0-275) (fly3d-mode-is-done_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_destroyed_n0) (fault-count-3_lost_f3d-1-0-364_destroyed_n0) (fly3d-mode-is-failed_f3d-1-0-364) (fly3d-mode-is-failed_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-2-0-275) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-1-0-275) (pending_obs19) (observed_obs19) (fault-count-3_lost_f3d-2-0-370_task-done_n0) (fault-count-3_lost_f3d-1-0-364_task-done_n0) (navtopoint-fsm_exec-is-reaction_f3d_done_2_nav-2-0-275) (navtopoint-fsm_exec-is-reaction_f3d_done_2_nav-1-0-275) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-2-0-275) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (fault-count-3_lost_f3d-2-0-370_fail-service_n0) (fault-count-3_lost_f3d-1-0-364_fail-service_n0) (fault-count-3_lost_f3d-2-0-370_fail-specific-221_n0) (fault-count-3_lost_f3d-1-0-364_fail-specific-221_n0) (fault-count-3_lost_f3d-2-0-370_fail-specific-222_n0) (fault-count-3_lost_f3d-1-0-364_fail-specific-222_n0) (fault-count-3_lost_f3d-2-0-370_fail-specific-223_n0) (fault-count-3_lost_f3d-1-0-364_fail-specific-223_n0) (fault-count-3_lost_f3d-2-0-370_fail-specific-211_n0) (fault-count-3_lost_f3d-1-0-364_fail-specific-211_n0) (fault-count-3_lost_f3d-2-0-370_fail-specific-220_n0) (fault-count-3_lost_f3d-1-0-364_fail-specific-220_n0) (fault-count-3_lost_f3d-2-0-370_fail-specific-213_n0) (fault-count-3_lost_f3d-1-0-364_fail-specific-213_n0) (fault-count-3_lost_f3d-2-0-370_fail-specific-214_n0) (fault-count-3_lost_f3d-1-0-364_fail-specific-214_n0) (fault-count-3_lost_f3d-2-0-370_fail-specific-210_n0) (fault-count-3_lost_f3d-1-0-364_fail-specific-210_n0) (missionexec-mission-idle_heli0) (missionexec-active-mission_heli0_f3d-2-0-370) (missionexec-mission-init-call_heli0) (missionexec-active-mission_heli0_f3d-1-0-364) (autotakeoff-mode-is-pre_init_ato-1-0-275) (missionexec-active-mission_heli0_ato-1-0-275) (autotakeoff-mode-is-processing_ato-1-0-275) (called-by_ato-1-0-275_missionexecutor) (basiccameracontrol-mode-is-pre_init_bcc-0-0-275) (missionexec-active-mission_heli0_bcc-0-0-275) (basiccameracontrol-mode-is-processing_bcc-0-0-275) (called-by_bcc-0-0-275_missionexecutor) (navtopoint-mode-is-pre_init_nav-2-0-275) (missionexec-active-mission_heli0_nav-2-0-275) (navtopoint-mode-is-processing_nav-2-0-275) (called-by_nav-2-0-275_missionexecutor) (navtopoint-mode-is-pre_init_nav-1-0-275) (missionexec-active-mission_heli0_nav-1-0-275) (navtopoint-mode-is-processing_nav-1-0-275) (called-by_nav-1-0-275_missionexecutor) (missionexec-mission-ready_heli0) (pending_obs0) (autotakeoff-mode-is-ready_ato-1-0-275) (observed_obs0) (fault-count-4_lost_ato-1-0-275_created_missionexecutor_n0) (pending_obs21) (basiccameracontrol-mode-is-ready_bcc-0-0-275) (observed_obs21) (fault-count-4_lost_bcc-0-0-275_created_missionexecutor_n0) (pending_obs25) (navtopoint-mode-is-ready_nav-2-0-275) (observed_obs25) (pending_obs11) (navtopoint-mode-is-ready_nav-1-0-275) (observed_obs11) (fault-count-4_lost_nav-2-0-275_created_missionexecutor_n0) (fault-count-4_lost_nav-1-0-275_created_missionexecutor_n0) (missionexec-mission-over_heli0) (autotakeoff-mode-is-failed_ato-1-0-275) (basiccameracontrol-mode-is-failed_bcc-0-0-275) (basiccameracontrol-in_start_call-is-yes_bcc-0-0-275) (navtopoint-mode-is-failed_nav-2-0-275) (navtopoint-mode-is-failed_nav-1-0-275) (navtopoint-in_start_call-is-yes_nav-2-0-275) (navtopoint-in_start_call-is-yes_nav-1-0-275) (missionexec-mission-start-call_heli0) (navtopoint-fsm_exec-is-start_nav-2-0-275) (navtopoint-fsm_exec-is-start_nav-1-0-275) (missionexec-mission-running_heli0) (basiccameracontrol-mode-is-done_bcc-0-0-275) (fault-count-3_lost_ato-1-0-275_task-done_n0) (autotakeoff-mode-is-done_ato-1-0-275) (dominates-3_hyp2_lost_ato-1-0-275_task-done) (dominates-3_hyp1_lost_ato-1-0-275_task-done) (fault-count-3_lost_bcc-0-0-275_task-done_n0) (fault-count-3_lost_nav-2-0-275_task-done_n0) (navtopoint-mode-is-done_nav-2-0-275) (fault-count-3_lost_nav-1-0-275_task-done_n0) (navtopoint-mode-is-done_nav-1-0-275) (dominates-3_hyp2_lost_nav-1-0-275_task-done) (dominates-3_hyp1_lost_nav-1-0-275_task-done) (fault-count-3_lost_ato-1-0-275_fail-specific-210_n0) (fault-count-3_lost_ato-1-0-275_fail-service_n0) (fault-count-3_lost_ato-1-0-275_fail-specific-101_n0) (fault-count-3_lost_ato-1-0-275_fail-specific-102_n0) (pending_obs24) (observed_obs24) (fault-count-3_lost_bcc-0-0-275_fail-service_n0) (fault-count-3_lost_bcc-0-0-275_fail-specific-101_n0) (fault-count-3_lost_bcc-0-0-275_fail-specific-102_n0) (fault-count-3_lost_bcc-0-0-275_fail-specific-310_n0) (fault-count-3_lost_bcc-0-0-275_fail-specific-401_n0) (fault-count-3_lost_bcc-0-0-275_fail-specific-402_n0) (fault-count-3_lost_bcc-0-0-275_fail-specific-700_n0) (fault-count-3_lost_nav-2-0-275_fail-service_n0) (fault-count-3_lost_nav-1-0-275_fail-service_n0) (fault-count-3_lost_nav-2-0-275_fail-specific-101_n0) (fault-count-3_lost_nav-1-0-275_fail-specific-101_n0) (fault-count-3_lost_nav-2-0-275_fail-specific-102_n0) (fault-count-3_lost_nav-1-0-275_fail-specific-102_n0) (fault-count-3_lost_nav-2-0-275_fail-specific-402_n0) (fault-count-3_lost_nav-1-0-275_fail-specific-402_n0) (fault-count-3_lost_nav-2-0-275_fail-specific-403_n0) (fault-count-3_lost_nav-1-0-275_fail-specific-403_n0) (fault-count-3_lost_nav-2-0-275_fail-specific-404_n0) (fault-count-3_lost_nav-1-0-275_fail-specific-404_n0) (fault-count-3_lost_nav-2-0-275_fail-subtask_n0) (fault-count-3_lost_nav-1-0-275_fail-subtask_n0) (pending_obs10) (observed_obs10) (fault-count-3_lost_ato-1-0-275_destroyed_n0) (fault-count-3_lost_bcc-0-0-275_destroyed_n0) (dominates-3_hyp2_lost_bcc-0-0-275_destroyed) (dominates-3_hyp1_lost_bcc-0-0-275_destroyed) (fault-count-3_lost_nav-2-0-275_destroyed_n0) (fault-count-3_lost_nav-1-0-275_destroyed_n0) (dominates-3_hyp2_lost_nav-1-0-275_destroyed) (dominates-3_hyp1_lost_nav-1-0-275_destroyed) (future_obs1) (future_obs2) (future_obs3) (future_obs4) (future_obs5) (future_obs6) (future_obs7) (future_obs8) (future_obs9) (future_obs10) (future_obs11) (future_obs12) (future_obs13) (future_obs14) (future_obs15) (future_obs16) (future_obs17) (future_obs18) (future_obs19) (future_obs20) (future_obs21) (future_obs22) (future_obs23) (future_obs24) (future_obs25) (future_obs26) (future_obs27) (future_obs28) (future_obs29) (not_at_end_constraint0) (achieved_constraint0) (not_at_end_constraint1) (achieved_constraint1) (static-true))
 (:action flightcontrol-fcl-event-finished-0_heli0_obs6
  :parameters ()
  :precondition (and (pending_obs6) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs6) (not (pending_obs6))))
 (:action flightcontrol-fcl-event-finished-0_heli0_obs8
  :parameters ()
  :precondition (and (pending_obs8) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs8) (not (pending_obs8))))
 (:action flightcontrol-fcl-event-finished-0_heli0_obs15
  :parameters ()
  :precondition (and (pending_obs15) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs15) (not (pending_obs15))))
 (:action flightcontrol-fcl-event-finished-0_heli0_obs17
  :parameters ()
  :precondition (and (pending_obs17) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs17) (not (pending_obs17))))
 (:action flightcontrol-fcl-event-finished-0_heli0_obs29
  :parameters ()
  :precondition (and (pending_obs29) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs29) (not (pending_obs29))))
 (:action flightcontrol-fcl-event-in_the_air-0_heli0_obs3
  :parameters ()
  :precondition (and (pending_obs3) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs3) (not (pending_obs3))))
 (:action fly3d-start_ok_f3d-2-0-370
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-start_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_state-is-turn_to_segment_heading_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (not (fly3d-fsm_exec-is-start_f3d-2-0-370))))
 (:action fly3d-start_ok_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-start_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_state-is-turn_to_segment_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (not (fly3d-fsm_exec-is-start_f3d-1-0-364))))
 (:action fly3d-enter_turn_to_segment_heading_checkpoint10-0_f3d-2-0-370_obs28
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (pending_obs28) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-0-370) (observed_obs28) (not (fly3d-fsm_state-is-turn_to_segment_heading_f3d-2-0-370)) (not (pending_obs28))))
 (:action fly3d-enter_turn_to_segment_heading_checkpoint10-0_f3d-1-0-364_obs14
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (pending_obs14) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364) (observed_obs14) (not (fly3d-fsm_state-is-turn_to_segment_heading_f3d-1-0-364)) (not (pending_obs14))))
 (:action fly3d-enter_turn_to_segment_heading_checkpoint10-1_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_checkpoint10_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-0-370) (not (fly3d-fsm_state-is-turn_to_segment_heading_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_checkpoint10_n0))))
 (:action fly3d-enter_turn_to_segment_heading_checkpoint10-1_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint10_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364) (not (fly3d-fsm_state-is-turn_to_segment_heading_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_checkpoint10_n0))))
 (:action fly3d-enter_turn_to_segment_heading_checkpoint11-1_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_checkpoint11_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370) (not (fly3d-fsm_state-is-turn_to_segment_heading_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_checkpoint11_n0))))
 (:action fly3d-enter_turn_to_segment_heading_checkpoint11-1_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint11_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (not (fly3d-fsm_state-is-turn_to_segment_heading_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_checkpoint11_n0))))
 (:action fly3d-enter_send_starting_yaw_command_ok_f3d-2-0-370
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-0-370) (fly3d-in_start_call-is-no_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (not (fly3d-fsm_exec-is-action1_f3d-2-0-370)) (not (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-0-370))))
 (:action fly3d-enter_send_starting_yaw_command_ok_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not (fly3d-fsm_exec-is-action1_f3d-1-0-364)) (not (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364))))
 (:action fly3d-enter_send_starting_yaw_command_checkpoint12-1_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-0-370) (fly3d-in_start_call-is-no_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_checkpoint12_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (not (fly3d-fsm_exec-is-action1_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_checkpoint12_n0))))
 (:action fly3d-enter_send_starting_yaw_command_checkpoint12-1_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint12_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not (fly3d-fsm_exec-is-action1_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_checkpoint12_n0))))
 (:action fly3d-in_send_starting_yaw_command_idle_f3d-2-0-370
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action1_f3d-2-0-370) (not (fly3d-fsm_exec-is-nothing_f3d-2-0-370))))
 (:action fly3d-in_send_starting_yaw_command_idle_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action1_f3d-1-0-364) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364))))
 (:action fly3d-in_send_starting_yaw_command_fcl_cancel_1-flightcontrol-fcl-event-canceled-1_f3d-2-0-370_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-canceled_n0) (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-reaction_cancel_1_f3d-2-0-370) (not (fault-count-3_lost_heli0_fcl-event-canceled_n0)) (not (fly3d-fsm_exec-is-nothing_f3d-2-0-370))))
 (:action fly3d-in_send_starting_yaw_command_fcl_cancel_1-flightcontrol-fcl-event-canceled-1_f3d-1-0-364_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-canceled_n0) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-reaction_cancel_1_f3d-1-0-364) (not (fault-count-3_lost_heli0_fcl-event-canceled_n0)) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364))))
 (:action fly3d-in_send_starting_yaw_command_fcl_cancel_2-flightcontrol-fcl-event-manual-1_f3d-2-0-370_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-manual_n0) (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-reaction_cancel_1_f3d-2-0-370) (not (fault-count-3_lost_heli0_fcl-event-manual_n0)) (not (fly3d-fsm_exec-is-nothing_f3d-2-0-370))))
 (:action fly3d-in_send_starting_yaw_command_fcl_cancel_2-flightcontrol-fcl-event-manual-1_f3d-1-0-364_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-manual_n0) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-reaction_cancel_1_f3d-1-0-364) (not (fault-count-3_lost_heli0_fcl-event-manual_n0)) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364))))
 (:action fly3d-in_send_starting_yaw_command_fcl_error-flightcontrol-fcl-event-not_accepted-1_f3d-2-0-370_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-not_accepted_n0) (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-reaction_error_1_f3d-2-0-370) (not (fault-count-3_lost_heli0_fcl-event-not_accepted_n0)) (not (fly3d-fsm_exec-is-nothing_f3d-2-0-370))))
 (:action fly3d-in_send_starting_yaw_command_fcl_error-flightcontrol-fcl-event-not_accepted-1_f3d-1-0-364_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-not_accepted_n0) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-reaction_error_1_f3d-1-0-364) (not (fault-count-3_lost_heli0_fcl-event-not_accepted_n0)) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364))))
 (:action fly3d-in_wait_for_yaw_finish_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-2-0-370_heli0_heli0_obs6
  :parameters ()
  :precondition (and (pending_obs6) (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs6) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370) (not (pending_obs6)) (not (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-0-370)) (not (fly3d-fsm_exec-is-nothing_f3d-2-0-370))))
 (:action fly3d-in_wait_for_yaw_finish_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-2-0-370_heli0_heli0_obs8
  :parameters ()
  :precondition (and (pending_obs8) (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs8) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370) (not (pending_obs8)) (not (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-0-370)) (not (fly3d-fsm_exec-is-nothing_f3d-2-0-370))))
 (:action fly3d-in_wait_for_yaw_finish_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-2-0-370_heli0_heli0_obs15
  :parameters ()
  :precondition (and (pending_obs15) (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs15) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370) (not (pending_obs15)) (not (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-0-370)) (not (fly3d-fsm_exec-is-nothing_f3d-2-0-370))))
 (:action fly3d-in_wait_for_yaw_finish_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-2-0-370_heli0_heli0_obs17
  :parameters ()
  :precondition (and (pending_obs17) (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs17) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370) (not (pending_obs17)) (not (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-0-370)) (not (fly3d-fsm_exec-is-nothing_f3d-2-0-370))))
 (:action fly3d-in_wait_for_yaw_finish_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-2-0-370_heli0_heli0_obs29
  :parameters ()
  :precondition (and (pending_obs29) (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs29) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370) (not (pending_obs29)) (not (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-0-370)) (not (fly3d-fsm_exec-is-nothing_f3d-2-0-370))))
 (:action fly3d-in_wait_for_yaw_finish_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-1-0-364_heli0_heli0_obs6
  :parameters ()
  :precondition (and (pending_obs6) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs6) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (not (pending_obs6)) (not (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-1-0-364)) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364))))
 (:action fly3d-in_wait_for_yaw_finish_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-1-0-364_heli0_heli0_obs8
  :parameters ()
  :precondition (and (pending_obs8) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs8) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (not (pending_obs8)) (not (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-1-0-364)) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364))))
 (:action fly3d-in_wait_for_yaw_finish_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-1-0-364_heli0_heli0_obs15
  :parameters ()
  :precondition (and (pending_obs15) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs15) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (not (pending_obs15)) (not (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-1-0-364)) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364))))
 (:action fly3d-in_wait_for_yaw_finish_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-1-0-364_heli0_heli0_obs17
  :parameters ()
  :precondition (and (pending_obs17) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs17) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (not (pending_obs17)) (not (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-1-0-364)) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364))))
 (:action fly3d-in_wait_for_yaw_finish_fcl_finished-flightcontrol-fcl-event-finished-1_f3d-2-0-370_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-finished_n0) (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370) (not (fault-count-3_lost_heli0_fcl-event-finished_n0)) (not (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-0-370)) (not (fly3d-fsm_exec-is-nothing_f3d-2-0-370))))
 (:action fly3d-in_wait_for_yaw_finish_fcl_finished-flightcontrol-fcl-event-finished-1_f3d-1-0-364_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-finished_n0) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (not (fault-count-3_lost_heli0_fcl-event-finished_n0)) (not (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-1-0-364)) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364))))
 (:action fly3d-in_wait_for_yaw_finish_fcl_cancel_1-flightcontrol-fcl-event-canceled-1_f3d-2-0-370_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-canceled_n0) (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-reaction_cancel_1_f3d-2-0-370) (not (fault-count-3_lost_heli0_fcl-event-canceled_n0)) (not (fly3d-fsm_exec-is-nothing_f3d-2-0-370))))
 (:action fly3d-in_wait_for_yaw_finish_fcl_cancel_1-flightcontrol-fcl-event-canceled-1_f3d-1-0-364_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-canceled_n0) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-reaction_cancel_1_f3d-1-0-364) (not (fault-count-3_lost_heli0_fcl-event-canceled_n0)) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364))))
 (:action fly3d-in_wait_for_yaw_finish_fcl_cancel_2-flightcontrol-fcl-event-canceled-1_f3d-2-0-370_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-canceled_n0) (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-reaction_cancel_1_f3d-2-0-370) (not (fault-count-3_lost_heli0_fcl-event-canceled_n0)) (not (fly3d-fsm_exec-is-nothing_f3d-2-0-370))))
 (:action fly3d-in_wait_for_yaw_finish_fcl_cancel_2-flightcontrol-fcl-event-canceled-1_f3d-1-0-364_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-canceled_n0) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-reaction_cancel_1_f3d-1-0-364) (not (fault-count-3_lost_heli0_fcl-event-canceled_n0)) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364))))
 (:action fly3d-in_wait_for_yaw_finish_fcl_error-flightcontrol-fcl-event-not_accepted-1_f3d-2-0-370_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-not_accepted_n0) (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-reaction_error_1_f3d-2-0-370) (not (fault-count-3_lost_heli0_fcl-event-not_accepted_n0)) (not (fly3d-fsm_exec-is-nothing_f3d-2-0-370))))
 (:action fly3d-in_wait_for_yaw_finish_fcl_error-flightcontrol-fcl-event-not_accepted-1_f3d-1-0-364_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-not_accepted_n0) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-reaction_error_1_f3d-1-0-364) (not (fault-count-3_lost_heli0_fcl-event-not_accepted_n0)) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364))))
 (:action fly3d-enter_send_first_trajectory_checkpoint20-1_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370) (fly3d-in_start_call-is-no_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_checkpoint20_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (not (fly3d-fsm_exec-is-action1_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_checkpoint20_n0)) (not (fly3d-trajectory-not-sent_f3d-2-0-370))))
 (:action fly3d-enter_send_first_trajectory_checkpoint20-1_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint20_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not (fly3d-fsm_exec-is-action1_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_checkpoint20_n0)) (not (fly3d-trajectory-not-sent_f3d-1-0-364))))
 (:action fly3d-enter_send_first_trajectory_checkpoint21-0_f3d-1-0-364_obs16
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (pending_obs16) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-1-0-364) (observed_obs16) (not (fly3d-fsm_exec-is-action1_f3d-1-0-364)) (not (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364)) (not (fly3d-trajectory-not-sent_f3d-1-0-364)) (not (pending_obs16))))
 (:action fly3d-enter_send_first_trajectory_checkpoint21-1_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370) (fly3d-in_start_call-is-no_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_checkpoint21_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-0-370) (not (fly3d-fsm_exec-is-action1_f3d-2-0-370)) (not (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370)) (not (fly3d-trajectory-not-sent_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_checkpoint21_n0))))
 (:action fly3d-enter_send_first_trajectory_checkpoint21-1_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint21_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-1-0-364) (not (fly3d-fsm_exec-is-action1_f3d-1-0-364)) (not (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364)) (not (fly3d-trajectory-not-sent_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_checkpoint21_n0))))
 (:action fly3d-enter_send_first_trajectory_checkpoint22-1_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_checkpoint22_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action2_f3d-2-0-370) (not (fly3d-fsm_exec-is-action1_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_checkpoint22_n0))))
 (:action fly3d-enter_send_first_trajectory_checkpoint22-1_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint22_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action2_f3d-1-0-364) (not (fly3d-fsm_exec-is-action1_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_checkpoint22_n0))))
 (:action fly3d-enter_send_first_trajectory_checkpoint21_after22-0_f3d-1-0-364_obs16
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (pending_obs16) (fly3d-fsm_exec-is-action2_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-1-0-364) (observed_obs16) (not (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364)) (not (fly3d-trajectory-not-sent_f3d-1-0-364)) (not (pending_obs16)) (not (fly3d-fsm_exec-is-action2_f3d-1-0-364))))
 (:action fly3d-enter_send_first_trajectory_checkpoint21_after22-1_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370) (fly3d-in_start_call-is-no_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_checkpoint21_n0) (fly3d-fsm_exec-is-action2_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-0-370) (not (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370)) (not (fly3d-trajectory-not-sent_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_checkpoint21_n0)) (not (fly3d-fsm_exec-is-action2_f3d-2-0-370))))
 (:action fly3d-enter_send_first_trajectory_checkpoint21_after22-1_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint21_n0) (fly3d-fsm_exec-is-action2_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-1-0-364) (not (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364)) (not (fly3d-trajectory-not-sent_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_checkpoint21_n0)) (not (fly3d-fsm_exec-is-action2_f3d-1-0-364))))
 (:action fly3d-enter_send_first_trajectory_busy_f3d-2-0-370
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370) (fly3d-in_start_call-is-no_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (fly3d-trajectory-not-sent_f3d-2-0-370) (not (fly3d-fsm_exec-is-action1_f3d-2-0-370))))
 (:action fly3d-enter_send_first_trajectory_busy_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-trajectory-not-sent_f3d-1-0-364) (not (fly3d-fsm_exec-is-action1_f3d-1-0-364))))
 (:action fly3d-enter_send_first_trajectory_after22_busy_f3d-2-0-370
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370) (fly3d-in_start_call-is-no_f3d-2-0-370) (fly3d-fsm_exec-is-action2_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (fly3d-trajectory-not-sent_f3d-2-0-370) (not (fly3d-fsm_exec-is-action2_f3d-2-0-370))))
 (:action fly3d-enter_send_first_trajectory_after22_busy_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_exec-is-action2_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-trajectory-not-sent_f3d-1-0-364) (not (fly3d-fsm_exec-is-action2_f3d-1-0-364))))
 (:action fly3d-in_send_first_trajectory_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-2-0-370_heli0_heli0_obs6
  :parameters ()
  :precondition (and (pending_obs6) (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs6) (fly3d-fsm_exec-is-reaction_finished_1_f3d-2-0-370) (not (pending_obs6)) (not (fly3d-fsm_exec-is-nothing_f3d-2-0-370))))
 (:action fly3d-in_send_first_trajectory_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-2-0-370_heli0_heli0_obs8
  :parameters ()
  :precondition (and (pending_obs8) (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs8) (fly3d-fsm_exec-is-reaction_finished_1_f3d-2-0-370) (not (pending_obs8)) (not (fly3d-fsm_exec-is-nothing_f3d-2-0-370))))
 (:action fly3d-in_send_first_trajectory_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-2-0-370_heli0_heli0_obs15
  :parameters ()
  :precondition (and (pending_obs15) (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs15) (fly3d-fsm_exec-is-reaction_finished_1_f3d-2-0-370) (not (pending_obs15)) (not (fly3d-fsm_exec-is-nothing_f3d-2-0-370))))
 (:action fly3d-in_send_first_trajectory_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-2-0-370_heli0_heli0_obs17
  :parameters ()
  :precondition (and (pending_obs17) (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs17) (fly3d-fsm_exec-is-reaction_finished_1_f3d-2-0-370) (not (pending_obs17)) (not (fly3d-fsm_exec-is-nothing_f3d-2-0-370))))
 (:action fly3d-in_send_first_trajectory_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-2-0-370_heli0_heli0_obs29
  :parameters ()
  :precondition (and (pending_obs29) (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs29) (fly3d-fsm_exec-is-reaction_finished_1_f3d-2-0-370) (not (pending_obs29)) (not (fly3d-fsm_exec-is-nothing_f3d-2-0-370))))
 (:action fly3d-in_send_first_trajectory_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-1-0-364_heli0_heli0_obs6
  :parameters ()
  :precondition (and (pending_obs6) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs6) (fly3d-fsm_exec-is-reaction_finished_1_f3d-1-0-364) (not (pending_obs6)) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364))))
 (:action fly3d-in_send_first_trajectory_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-1-0-364_heli0_heli0_obs8
  :parameters ()
  :precondition (and (pending_obs8) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs8) (fly3d-fsm_exec-is-reaction_finished_1_f3d-1-0-364) (not (pending_obs8)) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364))))
 (:action fly3d-in_send_first_trajectory_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-1-0-364_heli0_heli0_obs15
  :parameters ()
  :precondition (and (pending_obs15) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs15) (fly3d-fsm_exec-is-reaction_finished_1_f3d-1-0-364) (not (pending_obs15)) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364))))
 (:action fly3d-in_send_first_trajectory_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-1-0-364_heli0_heli0_obs17
  :parameters ()
  :precondition (and (pending_obs17) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs17) (fly3d-fsm_exec-is-reaction_finished_1_f3d-1-0-364) (not (pending_obs17)) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364))))
 (:action fly3d-in_send_first_trajectory_fcl_finished-flightcontrol-fcl-event-finished-1_f3d-2-0-370_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-finished_n0) (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-reaction_finished_1_f3d-2-0-370) (not (fault-count-3_lost_heli0_fcl-event-finished_n0)) (not (fly3d-fsm_exec-is-nothing_f3d-2-0-370))))
 (:action fly3d-in_send_first_trajectory_fcl_finished-flightcontrol-fcl-event-finished-1_f3d-1-0-364_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-finished_n0) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-reaction_finished_1_f3d-1-0-364) (not (fault-count-3_lost_heli0_fcl-event-finished_n0)) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364))))
 (:action fly3d-in_send_first_trajectory_fcl_next_trajectory-flightcontrol-fcl-event-traj3d_next_segment-1_f3d-2-0-370_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-traj3d_next_segment_n0) (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action1_f3d-2-0-370) (not (fault-count-3_lost_heli0_fcl-event-traj3d_next_segment_n0)) (not (fly3d-fsm_exec-is-nothing_f3d-2-0-370))))
 (:action fly3d-in_send_first_trajectory_fcl_next_trajectory-flightcontrol-fcl-event-traj3d_next_segment-1_f3d-1-0-364_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-traj3d_next_segment_n0) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action1_f3d-1-0-364) (not (fault-count-3_lost_heli0_fcl-event-traj3d_next_segment_n0)) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364))))
 (:action fly3d-in_send_first_trajectory_idle_timeout_f3d-2-0-370
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (fly3d-trajectory-not-sent_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action1_f3d-2-0-370) (not (fly3d-fsm_exec-is-nothing_f3d-2-0-370))))
 (:action fly3d-in_send_first_trajectory_idle_timeout_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-trajectory-not-sent_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action1_f3d-1-0-364) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364))))
 (:action fly3d-in_wait_trajectory_end_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-2-0-370_heli0_heli0_obs6
  :parameters ()
  :precondition (and (pending_obs6) (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs6) (fly3d-fsm_exec-is-reaction_finished_1_f3d-2-0-370) (not (pending_obs6)) (not (fly3d-fsm_exec-is-nothing_f3d-2-0-370))))
 (:action fly3d-in_wait_trajectory_end_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-2-0-370_heli0_heli0_obs8
  :parameters ()
  :precondition (and (pending_obs8) (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs8) (fly3d-fsm_exec-is-reaction_finished_1_f3d-2-0-370) (not (pending_obs8)) (not (fly3d-fsm_exec-is-nothing_f3d-2-0-370))))
 (:action fly3d-in_wait_trajectory_end_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-2-0-370_heli0_heli0_obs15
  :parameters ()
  :precondition (and (pending_obs15) (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs15) (fly3d-fsm_exec-is-reaction_finished_1_f3d-2-0-370) (not (pending_obs15)) (not (fly3d-fsm_exec-is-nothing_f3d-2-0-370))))
 (:action fly3d-in_wait_trajectory_end_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-2-0-370_heli0_heli0_obs17
  :parameters ()
  :precondition (and (pending_obs17) (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs17) (fly3d-fsm_exec-is-reaction_finished_1_f3d-2-0-370) (not (pending_obs17)) (not (fly3d-fsm_exec-is-nothing_f3d-2-0-370))))
 (:action fly3d-in_wait_trajectory_end_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-2-0-370_heli0_heli0_obs29
  :parameters ()
  :precondition (and (pending_obs29) (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs29) (fly3d-fsm_exec-is-reaction_finished_1_f3d-2-0-370) (not (pending_obs29)) (not (fly3d-fsm_exec-is-nothing_f3d-2-0-370))))
 (:action fly3d-in_wait_trajectory_end_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-1-0-364_heli0_heli0_obs6
  :parameters ()
  :precondition (and (pending_obs6) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs6) (fly3d-fsm_exec-is-reaction_finished_1_f3d-1-0-364) (not (pending_obs6)) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364))))
 (:action fly3d-in_wait_trajectory_end_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-1-0-364_heli0_heli0_obs8
  :parameters ()
  :precondition (and (pending_obs8) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs8) (fly3d-fsm_exec-is-reaction_finished_1_f3d-1-0-364) (not (pending_obs8)) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364))))
 (:action fly3d-in_wait_trajectory_end_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-1-0-364_heli0_heli0_obs15
  :parameters ()
  :precondition (and (pending_obs15) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs15) (fly3d-fsm_exec-is-reaction_finished_1_f3d-1-0-364) (not (pending_obs15)) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364))))
 (:action fly3d-in_wait_trajectory_end_fcl_finished-flightcontrol-fcl-event-finished-0_f3d-1-0-364_heli0_heli0_obs17
  :parameters ()
  :precondition (and (pending_obs17) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs17) (fly3d-fsm_exec-is-reaction_finished_1_f3d-1-0-364) (not (pending_obs17)) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364))))
 (:action fly3d-in_wait_trajectory_end_fcl_finished-flightcontrol-fcl-event-finished-1_f3d-2-0-370_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-finished_n0) (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-reaction_finished_1_f3d-2-0-370) (not (fault-count-3_lost_heli0_fcl-event-finished_n0)) (not (fly3d-fsm_exec-is-nothing_f3d-2-0-370))))
 (:action fly3d-in_wait_trajectory_end_fcl_finished-flightcontrol-fcl-event-finished-1_f3d-1-0-364_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-finished_n0) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-reaction_finished_1_f3d-1-0-364) (not (fault-count-3_lost_heli0_fcl-event-finished_n0)) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364))))
 (:action fly3d-in_wait_trajectory_end_fcl_finished_reaction1-0_f3d-1-0-364_obs18
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-1-0-364) (fly3d-fsm_exec-is-reaction_finished_1_f3d-1-0-364) (pending_obs18) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-reaction_finished_2_f3d-1-0-364) (observed_obs18) (not (fly3d-fsm_exec-is-reaction_finished_1_f3d-1-0-364)) (not (pending_obs18))))
 (:action fly3d-in_wait_trajectory_end_fcl_finished_reaction1-1_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-0-370) (fly3d-fsm_exec-is-reaction_finished_1_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_checkpoint24_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-reaction_finished_2_f3d-2-0-370) (not (fly3d-fsm_exec-is-reaction_finished_1_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_checkpoint24_n0))))
 (:action fly3d-in_wait_trajectory_end_fcl_finished_reaction1-1_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-1-0-364) (fly3d-fsm_exec-is-reaction_finished_1_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint24_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-reaction_finished_2_f3d-1-0-364) (not (fly3d-fsm_exec-is-reaction_finished_1_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_checkpoint24_n0))))
 (:action fly3d-in_wait_trajectory_end_fcl_finished_reaction2a_f3d-2-0-370
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-0-370) (fly3d-fsm_exec-is-reaction_finished_2_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-2-0-370) (not (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-0-370)) (not (fly3d-fsm_exec-is-reaction_finished_2_f3d-2-0-370))))
 (:action fly3d-in_wait_trajectory_end_fcl_finished_reaction2a_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-1-0-364) (fly3d-fsm_exec-is-reaction_finished_2_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-1-0-364) (not (fly3d-fsm_state-is-wait_trajectory_end_f3d-1-0-364)) (not (fly3d-fsm_exec-is-reaction_finished_2_f3d-1-0-364))))
 (:action fly3d-in_wait_trajectory_end_fcl_finished_reaction2b_f3d-2-0-370
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-0-370) (fly3d-fsm_exec-is-reaction_finished_2_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-fsm_state-is-goal_point_wait_f3d-2-0-370) (not (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-0-370)) (not (fly3d-fsm_exec-is-reaction_finished_2_f3d-2-0-370))))
 (:action fly3d-in_wait_trajectory_end_fcl_finished_reaction2b_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-1-0-364) (fly3d-fsm_exec-is-reaction_finished_2_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-goal_point_wait_f3d-1-0-364) (not (fly3d-fsm_state-is-wait_trajectory_end_f3d-1-0-364)) (not (fly3d-fsm_exec-is-reaction_finished_2_f3d-1-0-364))))
 (:action fly3d-in_wait_trajectory_end_fcl_finished_reaction2d_f3d-2-0-370
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-0-370) (fly3d-fsm_exec-is-reaction_finished_2_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_state-is-turn_to_segment_heading_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (not (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-0-370)) (not (fly3d-fsm_exec-is-reaction_finished_2_f3d-2-0-370))))
 (:action fly3d-in_wait_trajectory_end_fcl_finished_reaction2d_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-1-0-364) (fly3d-fsm_exec-is-reaction_finished_2_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_state-is-turn_to_segment_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (not (fly3d-fsm_state-is-wait_trajectory_end_f3d-1-0-364)) (not (fly3d-fsm_exec-is-reaction_finished_2_f3d-1-0-364))))
 (:action fly3d-enter_turn_to_goal_heading_checkpoint30-1_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_checkpoint30_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action2-wait_f3d-2-0-370) (not (fly3d-fsm_exec-is-action1_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_checkpoint30_n0))))
 (:action fly3d-enter_turn_to_goal_heading_checkpoint30-1_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint30_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action2-wait_f3d-1-0-364) (not (fly3d-fsm_exec-is-action1_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_checkpoint30_n0))))
 (:action fly3d-enter_turn_to_goal_heading_yaw_wait_finish_1-flightcontrol-fcl-return-finished-1_f3d-2-0-370_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-return-finished_n0) (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-2-0-370) (fly3d-fsm_exec-is-action2-wait_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-fsm_state-is-goal_point_wait_f3d-2-0-370) (not (fault-count-3_lost_heli0_fcl-return-finished_n0)) (not (fly3d-fsm_state-is-turn_to_goal_heading_f3d-2-0-370)) (not (fly3d-fsm_exec-is-action2-wait_f3d-2-0-370))))
 (:action fly3d-enter_turn_to_goal_heading_yaw_wait_finish_1-flightcontrol-fcl-return-finished-1_f3d-1-0-364_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-return-finished_n0) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action2-wait_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-goal_point_wait_f3d-1-0-364) (not (fault-count-3_lost_heli0_fcl-return-finished_n0)) (not (fly3d-fsm_state-is-turn_to_goal_heading_f3d-1-0-364)) (not (fly3d-fsm_exec-is-action2-wait_f3d-1-0-364))))
 (:action fly3d-enter_turn_to_goal_heading_yaw_wait_finish_2-flightcontrol-fcl-return-finished-1_f3d-2-0-370_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-return-finished_n0) (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-2-0-370) (fly3d-fsm_exec-is-action2-wait_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action2-exit_f3d-2-0-370) (not (fault-count-3_lost_heli0_fcl-return-finished_n0)) (not (fly3d-fsm_exec-is-action2-wait_f3d-2-0-370))))
 (:action fly3d-enter_turn_to_goal_heading_yaw_wait_finish_2-flightcontrol-fcl-return-finished-1_f3d-1-0-364_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-return-finished_n0) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action2-wait_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action2-exit_f3d-1-0-364) (not (fault-count-3_lost_heli0_fcl-return-finished_n0)) (not (fly3d-fsm_exec-is-action2-wait_f3d-1-0-364))))
 (:action fly3d-enter_turn_to_goal_heading_yaw_wait_cancel_1-flightcontrol-fcl-return-canceled-1_f3d-2-0-370_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-return-canceled_n0) (fly3d-mode-is-running_f3d-2-0-370) (fly3d-in_start_call-is-no_f3d-2-0-370) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-2-0-370) (fly3d-fsm_exec-is-action2-wait_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action2-exit_f3d-2-0-370) (not (fault-count-3_lost_heli0_fcl-return-canceled_n0)) (not (fly3d-fsm_exec-is-action2-wait_f3d-2-0-370))))
 (:action fly3d-enter_turn_to_goal_heading_yaw_wait_cancel_1-flightcontrol-fcl-return-canceled-1_f3d-1-0-364_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-return-canceled_n0) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action2-wait_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action2-exit_f3d-1-0-364) (not (fault-count-3_lost_heli0_fcl-return-canceled_n0)) (not (fly3d-fsm_exec-is-action2-wait_f3d-1-0-364))))
 (:action fly3d-enter_turn_to_goal_heading_yaw_wait_cancel_2-flightcontrol-fcl-return-manual-1_f3d-2-0-370_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-return-manual_n0) (fly3d-mode-is-running_f3d-2-0-370) (fly3d-in_start_call-is-no_f3d-2-0-370) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-2-0-370) (fly3d-fsm_exec-is-action2-wait_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action2-exit_f3d-2-0-370) (not (fault-count-3_lost_heli0_fcl-return-manual_n0)) (not (fly3d-fsm_exec-is-action2-wait_f3d-2-0-370))))
 (:action fly3d-enter_turn_to_goal_heading_yaw_wait_cancel_2-flightcontrol-fcl-return-manual-1_f3d-1-0-364_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-return-manual_n0) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action2-wait_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action2-exit_f3d-1-0-364) (not (fault-count-3_lost_heli0_fcl-return-manual_n0)) (not (fly3d-fsm_exec-is-action2-wait_f3d-1-0-364))))
 (:action fly3d-enter_turn_to_goal_heading_yaw_wait_error-flightcontrol-fcl-return-not_accepted-1_f3d-2-0-370_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-return-not_accepted_n0) (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-2-0-370) (fly3d-fsm_exec-is-action2-wait_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action2-fail_f3d-2-0-370) (not (fault-count-3_lost_heli0_fcl-return-not_accepted_n0)) (not (fly3d-fsm_exec-is-action2-wait_f3d-2-0-370))))
 (:action fly3d-enter_turn_to_goal_heading_yaw_wait_error-flightcontrol-fcl-return-not_accepted-1_f3d-1-0-364_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-return-not_accepted_n0) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action2-wait_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action2-fail_f3d-1-0-364) (not (fault-count-3_lost_heli0_fcl-return-not_accepted_n0)) (not (fly3d-fsm_exec-is-action2-wait_f3d-1-0-364))))
 (:action fly3d-enter_turn_to_goal_heading_checkpoint31a-1_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_checkpoint31_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_state-is-goal_point_wait_f3d-2-0-370) (not (fly3d-fsm_state-is-turn_to_goal_heading_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_checkpoint31_n0))))
 (:action fly3d-enter_turn_to_goal_heading_checkpoint31a-1_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint31_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_state-is-goal_point_wait_f3d-1-0-364) (not (fly3d-fsm_state-is-turn_to_goal_heading_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_checkpoint31_n0))))
 (:action fly3d-enter_turn_to_goal_heading_checkpoint31b-1_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_checkpoint31_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action2-exit_f3d-2-0-370) (not (fly3d-fsm_exec-is-action1_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_checkpoint31_n0))))
 (:action fly3d-enter_turn_to_goal_heading_checkpoint31b-1_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint31_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-action2-exit_f3d-1-0-364) (not (fly3d-fsm_exec-is-action1_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_checkpoint31_n0))))
 (:action fly3d-enter_goal_point_wait_checkpoint40-1_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-fsm_state-is-goal_point_wait_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_checkpoint40_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (not (fly3d-fsm_exec-is-action1_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_checkpoint40_n0))))
 (:action fly3d-enter_goal_point_wait_checkpoint40-1_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-goal_point_wait_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint40_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not (fly3d-fsm_exec-is-action1_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_checkpoint40_n0))))
 (:action fly3d-goal_point_wait_cmd_continue_1_f3d-2-0-370
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (fly3d-fsm_state-is-goal_point_wait_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_state-is-turn_to_segment_heading_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (not (fly3d-fsm_exec-is-nothing_f3d-2-0-370)) (not (fly3d-fsm_state-is-goal_point_wait_f3d-2-0-370))))
 (:action fly3d-goal_point_wait_cmd_continue_1_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-fsm_state-is-goal_point_wait_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_state-is-turn_to_segment_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364)) (not (fly3d-fsm_state-is-goal_point_wait_f3d-1-0-364))))
 (:action fly3d-goal_point_wait_idle_1_f3d-2-0-370
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (fly3d-fsm_state-is-goal_point_wait_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_state-is-turn_to_segment_heading_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (not (fly3d-fsm_exec-is-nothing_f3d-2-0-370)) (not (fly3d-fsm_state-is-goal_point_wait_f3d-2-0-370))))
 (:action fly3d-goal_point_wait_idle_1_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-fsm_state-is-goal_point_wait_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_state-is-turn_to_segment_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364)) (not (fly3d-fsm_state-is-goal_point_wait_f3d-1-0-364))))
 (:action fly3d-global_fcl_canceled-flightcontrol-fcl-event-canceled-1_f3d-2-0-370_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-canceled_n0) (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-global_reaction_cancel_1_f3d-2-0-370) (not (fault-count-3_lost_heli0_fcl-event-canceled_n0)) (not (fly3d-fsm_exec-is-nothing_f3d-2-0-370))))
 (:action fly3d-global_fcl_canceled-flightcontrol-fcl-event-canceled-1_f3d-1-0-364_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-canceled_n0) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-global_reaction_cancel_1_f3d-1-0-364) (not (fault-count-3_lost_heli0_fcl-event-canceled_n0)) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364))))
 (:action fly3d-global_fcl_manual-flightcontrol-fcl-event-manual-1_f3d-2-0-370_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-manual_n0) (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-global_reaction_cancel_1_f3d-2-0-370) (not (fault-count-3_lost_heli0_fcl-event-manual_n0)) (not (fly3d-fsm_exec-is-nothing_f3d-2-0-370))))
 (:action fly3d-global_fcl_manual-flightcontrol-fcl-event-manual-1_f3d-1-0-364_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-manual_n0) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-global_reaction_cancel_1_f3d-1-0-364) (not (fault-count-3_lost_heli0_fcl-event-manual_n0)) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364))))
 (:action fly3d-global_fcl_error-flightcontrol-fcl-event-not_accepted-1_f3d-2-0-370_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-not_accepted_n0) (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-global_reaction_error_1_f3d-2-0-370) (not (fault-count-3_lost_heli0_fcl-event-not_accepted_n0)) (not (fly3d-fsm_exec-is-nothing_f3d-2-0-370))))
 (:action fly3d-global_fcl_error-flightcontrol-fcl-event-not_accepted-1_f3d-1-0-364_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-not_accepted_n0) (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-fsm_exec-is-global_reaction_error_1_f3d-1-0-364) (not (fault-count-3_lost_heli0_fcl-event-not_accepted_n0)) (not (fly3d-fsm_exec-is-nothing_f3d-1-0-364))))
 (:action autotakeoff-start_ok_ato-1-0-275
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_exec-is-start_ato-1-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (autotakeoff-fsm_state-is-takeoff_ato-1-0-275) (autotakeoff-fsm_exec-is-action1_ato-1-0-275) (not (autotakeoff-fsm_exec-is-start_ato-1-0-275))))
 (:action autotakeoff-takeoff_action1-0_ato-1-0-275_obs1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_state-is-takeoff_ato-1-0-275) (autotakeoff-fsm_exec-is-action1_ato-1-0-275) (autotakeoff-in_start_call-is-yes_ato-1-0-275) (pending_obs1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (autotakeoff-fsm_exec-is-action2_ato-1-0-275) (observed_obs1) (not (autotakeoff-fsm_exec-is-action1_ato-1-0-275)) (not (pending_obs1))))
 (:action autotakeoff-takeoff_action1-1_ato-1-0-275_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_state-is-takeoff_ato-1-0-275) (autotakeoff-fsm_exec-is-action1_ato-1-0-275) (autotakeoff-in_start_call-is-yes_ato-1-0-275) (fault-count-3_lost_ato-1-0-275_checkpoint1_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (autotakeoff-fsm_exec-is-action2_ato-1-0-275) (not (autotakeoff-fsm_exec-is-action1_ato-1-0-275)) (not (fault-count-3_lost_ato-1-0-275_checkpoint1_n0))))
 (:action autotakeoff-takeoff_fcl_finished-flightcontrol-fcl-event-finished-0_ato-1-0-275_heli0_heli0_obs6
  :parameters ()
  :precondition (and (pending_obs6) (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_state-is-takeoff_ato-1-0-275) (autotakeoff-fsm_exec-is-nothing_ato-1-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs6) (autotakeoff-fsm_exec-is-reaction_finished_1_ato-1-0-275) (not (pending_obs6)) (not (autotakeoff-fsm_exec-is-nothing_ato-1-0-275))))
 (:action autotakeoff-takeoff_fcl_finished-flightcontrol-fcl-event-finished-1_ato-1-0-275_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-finished_n0) (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_state-is-takeoff_ato-1-0-275) (autotakeoff-fsm_exec-is-nothing_ato-1-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (autotakeoff-fsm_exec-is-reaction_finished_1_ato-1-0-275) (not (fault-count-3_lost_heli0_fcl-event-finished_n0)) (not (autotakeoff-fsm_exec-is-nothing_ato-1-0-275))))
 (:action autotakeoff-takeoff_fcl_finished_reaction1-1_ato-1-0-275_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_state-is-takeoff_ato-1-0-275) (autotakeoff-fsm_exec-is-reaction_finished_1_ato-1-0-275) (fault-count-3_lost_ato-1-0-275_checkpoint2_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (autotakeoff-fsm_exec-is-action1_ato-1-0-275) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-1-0-275) (not (autotakeoff-fsm_state-is-takeoff_ato-1-0-275)) (not (autotakeoff-fsm_exec-is-reaction_finished_1_ato-1-0-275)) (not (fault-count-3_lost_ato-1-0-275_checkpoint2_n0)) (not (dominates-3_hyp2_lost_ato-1-0-275_checkpoint2)) (not (dominates-3_hyp1_lost_ato-1-0-275_checkpoint2))))
 (:action autotakeoff-takeoff_fcl_error_1-flightcontrol-fcl-event-not_accepted-1_ato-1-0-275_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-not_accepted_n0) (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_state-is-takeoff_ato-1-0-275) (autotakeoff-fsm_exec-is-nothing_ato-1-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (autotakeoff-fsm_exec-is-reaction_error_1_ato-1-0-275) (not (fault-count-3_lost_heli0_fcl-event-not_accepted_n0)) (not (autotakeoff-fsm_exec-is-nothing_ato-1-0-275))))
 (:action autotakeoff-takeoff_fcl_cancel_1-flightcontrol-fcl-event-canceled-1_ato-1-0-275_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-canceled_n0) (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_state-is-takeoff_ato-1-0-275) (autotakeoff-fsm_exec-is-nothing_ato-1-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (autotakeoff-fsm_exec-is-reaction_cancel_1_ato-1-0-275) (not (fault-count-3_lost_heli0_fcl-event-canceled_n0)) (not (autotakeoff-fsm_exec-is-nothing_ato-1-0-275))))
 (:action autotakeoff-takeoff_fcl_cancel_2-flightcontrol-fcl-event-manual-1_ato-1-0-275_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-manual_n0) (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_state-is-takeoff_ato-1-0-275) (autotakeoff-fsm_exec-is-nothing_ato-1-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (autotakeoff-fsm_exec-is-reaction_cancel_1_ato-1-0-275) (not (fault-count-3_lost_heli0_fcl-event-manual_n0)) (not (autotakeoff-fsm_exec-is-nothing_ato-1-0-275))))
 (:action autotakeoff-takeoff_idle-0_ato-1-0-275_obs2
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_state-is-takeoff_ato-1-0-275) (autotakeoff-fsm_exec-is-nothing_ato-1-0-275) (pending_obs2) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs2) (not (pending_obs2))))
 (:action autotakeoff-takeoff_idle-0_ato-1-0-275_obs4
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_state-is-takeoff_ato-1-0-275) (autotakeoff-fsm_exec-is-nothing_ato-1-0-275) (pending_obs4) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs4) (not (pending_obs4))))
 (:action autotakeoff-takeoff_idle-0_ato-1-0-275_obs5
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_state-is-takeoff_ato-1-0-275) (autotakeoff-fsm_exec-is-nothing_ato-1-0-275) (pending_obs5) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs5) (not (pending_obs5))))
 (:action autotakeoff-go_to_final_altitude_action1_no_climb-1_ato-1-0-275_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_exec-is-action1_ato-1-0-275) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-1-0-275) (autotakeoff-in_start_call-is-no_ato-1-0-275) (fault-count-3_lost_ato-1-0-275_checkpoint7_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (autotakeoff-fsm_exec-is-action2-exit_ato-1-0-275) (not (autotakeoff-fsm_exec-is-action1_ato-1-0-275)) (not (fault-count-3_lost_ato-1-0-275_checkpoint7_n0))))
 (:action autotakeoff-go_to_final_altitude_action1_climb-0_ato-1-0-275_obs7
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_exec-is-action1_ato-1-0-275) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-1-0-275) (autotakeoff-in_start_call-is-no_ato-1-0-275) (pending_obs7) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (autotakeoff-fsm_exec-is-action2-climb_ato-1-0-275) (observed_obs7) (not (autotakeoff-fsm_exec-is-action1_ato-1-0-275)) (not (pending_obs7))))
 (:action autotakeoff-go_to_final_altitude_action1_climb-1_ato-1-0-275_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_exec-is-action1_ato-1-0-275) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-1-0-275) (autotakeoff-in_start_call-is-no_ato-1-0-275) (fault-count-3_lost_ato-1-0-275_checkpoint5_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (autotakeoff-fsm_exec-is-action2-climb_ato-1-0-275) (not (autotakeoff-fsm_exec-is-action1_ato-1-0-275)) (not (fault-count-3_lost_ato-1-0-275_checkpoint5_n0))))
 (:action autotakeoff-go_to_final_altitude_climb_ok_ato-1-0-275
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-1-0-275) (autotakeoff-in_start_call-is-no_ato-1-0-275) (autotakeoff-fsm_exec-is-action2-climb_ato-1-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (autotakeoff-fsm_exec-is-nothing_ato-1-0-275) (not (autotakeoff-fsm_exec-is-action2-climb_ato-1-0-275))))
 (:action autotakeoff-go_to_final_altitude_fcl_finished-flightcontrol-fcl-event-finished-0_ato-1-0-275_heli0_heli0_obs6
  :parameters ()
  :precondition (and (pending_obs6) (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_exec-is-nothing_ato-1-0-275) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-1-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs6) (autotakeoff-fsm_exec-is-reaction_finished_1_ato-1-0-275) (not (pending_obs6)) (not (autotakeoff-fsm_exec-is-nothing_ato-1-0-275))))
 (:action autotakeoff-go_to_final_altitude_fcl_finished-flightcontrol-fcl-event-finished-0_ato-1-0-275_heli0_heli0_obs8
  :parameters ()
  :precondition (and (pending_obs8) (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_exec-is-nothing_ato-1-0-275) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-1-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs8) (autotakeoff-fsm_exec-is-reaction_finished_1_ato-1-0-275) (not (pending_obs8)) (not (autotakeoff-fsm_exec-is-nothing_ato-1-0-275))))
 (:action autotakeoff-go_to_final_altitude_fcl_finished-flightcontrol-fcl-event-finished-1_ato-1-0-275_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-finished_n0) (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_exec-is-nothing_ato-1-0-275) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-1-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (autotakeoff-fsm_exec-is-reaction_finished_1_ato-1-0-275) (not (fault-count-3_lost_heli0_fcl-event-finished_n0)) (not (autotakeoff-fsm_exec-is-nothing_ato-1-0-275))))
 (:action autotakeoff-go_to_final_altitude_fcl_finished_reaction1-0_ato-1-0-275_obs9
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_exec-is-reaction_finished_1_ato-1-0-275) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-1-0-275) (pending_obs9) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (autotakeoff-fsm_exec-is-reaction_finished_2_ato-1-0-275) (observed_obs9) (not (autotakeoff-fsm_exec-is-reaction_finished_1_ato-1-0-275)) (not (pending_obs9))))
 (:action autotakeoff-go_to_final_altitude_fcl_finished_reaction1-1_ato-1-0-275_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_exec-is-reaction_finished_1_ato-1-0-275) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-1-0-275) (fault-count-3_lost_ato-1-0-275_checkpoint6_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (autotakeoff-fsm_exec-is-reaction_finished_2_ato-1-0-275) (not (autotakeoff-fsm_exec-is-reaction_finished_1_ato-1-0-275)) (not (fault-count-3_lost_ato-1-0-275_checkpoint6_n0))))
 (:action autotakeoff-go_to_final_altitude_fcl_error_1-flightcontrol-fcl-event-not_accepted-1_ato-1-0-275_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-not_accepted_n0) (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_exec-is-nothing_ato-1-0-275) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-1-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (autotakeoff-fsm_exec-is-reaction_error_1_ato-1-0-275) (not (fault-count-3_lost_heli0_fcl-event-not_accepted_n0)) (not (autotakeoff-fsm_exec-is-nothing_ato-1-0-275))))
 (:action autotakeoff-go_to_final_altitude_fcl_cancel_1-flightcontrol-fcl-event-canceled-1_ato-1-0-275_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-canceled_n0) (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_exec-is-nothing_ato-1-0-275) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-1-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (autotakeoff-fsm_exec-is-reaction_cancel_1_ato-1-0-275) (not (fault-count-3_lost_heli0_fcl-event-canceled_n0)) (not (autotakeoff-fsm_exec-is-nothing_ato-1-0-275))))
 (:action autotakeoff-go_to_final_altitude_fcl_cancel_2-flightcontrol-fcl-event-manual-1_ato-1-0-275_heli0_heli0_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_heli0_fcl-event-manual_n0) (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_exec-is-nothing_ato-1-0-275) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-1-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (autotakeoff-fsm_exec-is-reaction_cancel_1_ato-1-0-275) (not (fault-count-3_lost_heli0_fcl-event-manual_n0)) (not (autotakeoff-fsm_exec-is-nothing_ato-1-0-275))))
 (:action basiccameracontrol-start_ok_1_bcc-0-0-275
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-start_bcc-0-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_state-is-select_initial_mode_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (not (basiccameracontrol-fsm_exec-is-start_bcc-0-0-275))))
 (:action basiccameracontrol-start_ok_2_bcc-0-0-275
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-start_bcc-0-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-not_in_control_bcc-0-0-275) (not (basiccameracontrol-fsm_exec-is-start_bcc-0-0-275))))
 (:action basiccameracontrol-select_initial_mode_action1_1_bcc-0-0-275
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_state-is-select_initial_mode_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_state-is-start_tracking_position_bcc-0-0-275) (not (basiccameracontrol-fsm_state-is-select_initial_mode_bcc-0-0-275))))
 (:action basiccameracontrol-select_initial_mode_action1_2_bcc-0-0-275
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_state-is-select_initial_mode_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_state-is-start_tracking_bearing_bcc-0-0-275) (not (basiccameracontrol-fsm_state-is-select_initial_mode_bcc-0-0-275))))
 (:action basiccameracontrol-select_initial_mode_action1_3_bcc-0-0-275
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_state-is-select_initial_mode_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_state-is-set_locked_mode_bcc-0-0-275) (not (basiccameracontrol-fsm_state-is-select_initial_mode_bcc-0-0-275))))
 (:action basiccameracontrol-start_tracking_position_ok-1_bcc-0-0-275_n0_n1
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-start_tracking_position_bcc-0-0-275) (fault-count-3_lost_bcc-0-0-275_checkpoint101_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_state-is-seq_position_command_bcc-0-0-275) (not (basiccameracontrol-fsm_state-is-start_tracking_position_bcc-0-0-275)) (not (fault-count-3_lost_bcc-0-0-275_checkpoint101_n0))))
 (:action basiccameracontrol-start_tracking_position_no_fail_111-1_bcc-0-0-275_n0_n1
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-start_tracking_position_bcc-0-0-275) (fault-count-3_lost_bcc-0-0-275_checkpoint111_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_state-is-seq_lock_command_bcc-0-0-275) (not (basiccameracontrol-fsm_state-is-start_tracking_position_bcc-0-0-275)) (not (fault-count-3_lost_bcc-0-0-275_checkpoint111_n0)) (not (dominates-3_hyp1_lost_bcc-0-0-275_checkpoint111))))
 (:action basiccameracontrol-start_tracking_position_no_fail_112-1_bcc-0-0-275_n0_n1
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-start_tracking_position_bcc-0-0-275) (fault-count-3_lost_bcc-0-0-275_checkpoint112_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_state-is-seq_lock_command_bcc-0-0-275) (not (basiccameracontrol-fsm_state-is-start_tracking_position_bcc-0-0-275)) (not (fault-count-3_lost_bcc-0-0-275_checkpoint112_n0))))
 (:action basiccameracontrol-seq_position_command_wait_2_bcc-0-0-275
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-seq_position_command_bcc-0-0-275) (basiccameracontrol-in_start_call-is-no_bcc-0-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275) (not (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275))))
 (:action basiccameracontrol-seq_position_command_not_in_control_bcc-0-0-275
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-seq_position_command_bcc-0-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_state-is-not_in_control_bcc-0-0-275) (not (basiccameracontrol-fsm_state-is-seq_position_command_bcc-0-0-275))))
 (:action basiccameracontrol-seq_position_command_ok_bcc-0-0-275
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-seq_position_command_bcc-0-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_state-is-converge_bcc-0-0-275) (not (basiccameracontrol-fsm_state-is-seq_position_command_bcc-0-0-275))))
 (:action basiccameracontrol-seq_position_command_idle_bcc-0-0-275
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_state-is-seq_position_command_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (not (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275))))
 (:action basiccameracontrol-start_tracking_bearing_ok-0_bcc-0-0-275_obs23
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-start_tracking_bearing_bcc-0-0-275) (pending_obs23) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_state-is-seq_bearing_command_bcc-0-0-275) (observed_obs23) (not (basiccameracontrol-fsm_state-is-start_tracking_bearing_bcc-0-0-275)) (not (pending_obs23))))
 (:action basiccameracontrol-start_tracking_bearing_ok-1_bcc-0-0-275_n0_n1
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-start_tracking_bearing_bcc-0-0-275) (fault-count-3_lost_bcc-0-0-275_checkpoint102_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_state-is-seq_bearing_command_bcc-0-0-275) (not (basiccameracontrol-fsm_state-is-start_tracking_bearing_bcc-0-0-275)) (not (fault-count-3_lost_bcc-0-0-275_checkpoint102_n0))))
 (:action basiccameracontrol-seq_bearing_command_wait_2_bcc-0-0-275
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-in_start_call-is-no_bcc-0-0-275) (basiccameracontrol-fsm_state-is-seq_bearing_command_bcc-0-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275) (not (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275))))
 (:action basiccameracontrol-seq_bearing_command_not_in_control_bcc-0-0-275
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-seq_bearing_command_bcc-0-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_state-is-not_in_control_bcc-0-0-275) (not (basiccameracontrol-fsm_state-is-seq_bearing_command_bcc-0-0-275))))
 (:action basiccameracontrol-seq_bearing_command_ok_1_bcc-0-0-275
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-seq_bearing_command_bcc-0-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_state-is-converge_bcc-0-0-275) (not (basiccameracontrol-fsm_state-is-seq_bearing_command_bcc-0-0-275))))
 (:action basiccameracontrol-seq_bearing_command_idle_bcc-0-0-275
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275) (basiccameracontrol-fsm_state-is-seq_bearing_command_bcc-0-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (not (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275))))
 (:action basiccameracontrol-converge_ok_1_bcc-0-0-275
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-converge_bcc-0-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_state-is-converge_wait_bcc-0-0-275) (not (basiccameracontrol-fsm_state-is-converge_bcc-0-0-275))))
 (:action basiccameracontrol-converge_ok_2_bcc-0-0-275
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-converge_bcc-0-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_state-is-converge_final_wait_bcc-0-0-275) (not (basiccameracontrol-fsm_state-is-converge_bcc-0-0-275))))
 (:action basiccameracontrol-converge_wait_wait_2_bcc-0-0-275
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-in_start_call-is-no_bcc-0-0-275) (basiccameracontrol-fsm_state-is-converge_wait_bcc-0-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275) (not (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275))))
 (:action basiccameracontrol-converge_wait_elevation_reached_2-cameracontrol-ccl-event-goal_elevation_achieved-1_bcc-0-0-275_n0_n1
  :parameters ()
  :precondition (and (fault-count-2_lost_ccl-event-goal_elevation_achieved_n0) (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275) (basiccameracontrol-fsm_state-is-converge_wait_bcc-0-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-converge_final_wait_bcc-0-0-275) (not (fault-count-2_lost_ccl-event-goal_elevation_achieved_n0)) (not (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-converge_wait_bcc-0-0-275))))
 (:action basiccameracontrol-converge_wait_azimuth_reached_2-cameracontrol-ccl-event-goal_azimuth_achieved-1_bcc-0-0-275_n0_n1
  :parameters ()
  :precondition (and (fault-count-2_lost_ccl-event-goal_azimuth_achieved_n0) (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275) (basiccameracontrol-fsm_state-is-converge_wait_bcc-0-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-converge_final_wait_bcc-0-0-275) (not (fault-count-2_lost_ccl-event-goal_azimuth_achieved_n0)) (not (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-converge_wait_bcc-0-0-275))))
 (:action basiccameracontrol-converge_wait_timeout_1_bcc-0-0-275
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-converge_wait_bcc-0-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_state-is-converge_failed_bcc-0-0-275) (not (basiccameracontrol-fsm_state-is-converge_wait_bcc-0-0-275))))
 (:action basiccameracontrol-converge_wait_timeout_2_bcc-0-0-275
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275) (basiccameracontrol-fsm_state-is-converge_wait_bcc-0-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-converge_failed_bcc-0-0-275) (not (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-converge_wait_bcc-0-0-275))))
 (:action basiccameracontrol-converge_final_wait_wait_2_bcc-0-0-275
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-in_start_call-is-no_bcc-0-0-275) (basiccameracontrol-fsm_state-is-converge_final_wait_bcc-0-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275) (not (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275))))
 (:action basiccameracontrol-converge_final_wait_azimuth_not_reached-cameracontrol-ccl-event-goal_azimuth_not_achieved-1_bcc-0-0-275_n0_n1
  :parameters ()
  :precondition (and (fault-count-2_lost_ccl-event-goal_azimuth_not_achieved_n0) (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275) (basiccameracontrol-fsm_state-is-converge_final_wait_bcc-0-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-converge_wait_bcc-0-0-275) (not (fault-count-2_lost_ccl-event-goal_azimuth_not_achieved_n0)) (not (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-converge_final_wait_bcc-0-0-275))))
 (:action basiccameracontrol-converge_final_wait_elevation_not_reached-cameracontrol-ccl-event-goal_elevation_not_achieved-1_bcc-0-0-275_n0_n1
  :parameters ()
  :precondition (and (fault-count-2_lost_ccl-event-goal_elevation_not_achieved_n0) (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275) (basiccameracontrol-fsm_state-is-converge_final_wait_bcc-0-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-converge_wait_bcc-0-0-275) (not (fault-count-2_lost_ccl-event-goal_elevation_not_achieved_n0)) (not (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-converge_final_wait_bcc-0-0-275))))
 (:action basiccameracontrol-converge_final_wait_idle_bcc-0-0-275
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275) (basiccameracontrol-fsm_state-is-converge_final_wait_bcc-0-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-tracking_bcc-0-0-275) (not (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-converge_final_wait_bcc-0-0-275))))
 (:action basiccameracontrol-converge_failed_try_again-1_bcc-0-0-275_n0_n1
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-converge_failed_bcc-0-0-275) (fault-count-3_lost_bcc-0-0-275_checkpoint301_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_state-is-converge_wait_bcc-0-0-275) (not (basiccameracontrol-fsm_state-is-converge_failed_bcc-0-0-275)) (not (fault-count-3_lost_bcc-0-0-275_checkpoint301_n0))))
 (:action basiccameracontrol-enter_tracking_1-1_bcc-0-0-275_n0_n1
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-tracking_bcc-0-0-275) (fault-count-3_lost_bcc-0-0-275_checkpoint201_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_exec-is-action2_bcc-0-0-275) (not (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275)) (not (fault-count-3_lost_bcc-0-0-275_checkpoint201_n0))))
 (:action basiccameracontrol-enter_tracking_2b_bcc-0-0-275
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-in_start_call-is-no_bcc-0-0-275) (basiccameracontrol-fsm_state-is-tracking_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action2_bcc-0-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275) (not (basiccameracontrol-fsm_exec-is-action2_bcc-0-0-275))))
 (:action basiccameracontrol-tracking_elevation_lost-cameracontrol-ccl-event-goal_elevation_not_achieved-1_bcc-0-0-275_n0_n1
  :parameters ()
  :precondition (and (fault-count-2_lost_ccl-event-goal_elevation_not_achieved_n0) (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275) (basiccameracontrol-fsm_state-is-tracking_bcc-0-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_exec-is-elevation_lost_reaction1_bcc-0-0-275) (not (fault-count-2_lost_ccl-event-goal_elevation_not_achieved_n0)) (not (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275))))
 (:action basiccameracontrol-tracking_elevation_lost_reaction1-1_bcc-0-0-275_n0_n1
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_state-is-tracking_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-elevation_lost_reaction1_bcc-0-0-275) (fault-count-3_lost_bcc-0-0-275_checkpoint311_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-converge_bcc-0-0-275) (not (basiccameracontrol-fsm_state-is-tracking_bcc-0-0-275)) (not (basiccameracontrol-fsm_exec-is-elevation_lost_reaction1_bcc-0-0-275)) (not (fault-count-3_lost_bcc-0-0-275_checkpoint311_n0))))
 (:action basiccameracontrol-tracking_azimuth_lost-cameracontrol-ccl-event-goal_azimuth_not_achieved-1_bcc-0-0-275_n0_n1
  :parameters ()
  :precondition (and (fault-count-2_lost_ccl-event-goal_azimuth_not_achieved_n0) (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275) (basiccameracontrol-fsm_state-is-tracking_bcc-0-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_exec-is-azimuth_lost_reaction1_bcc-0-0-275) (not (fault-count-2_lost_ccl-event-goal_azimuth_not_achieved_n0)) (not (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275))))
 (:action basiccameracontrol-tracking_azimuth_lost_reaction1-1_bcc-0-0-275_n0_n1
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_state-is-tracking_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-azimuth_lost_reaction1_bcc-0-0-275) (fault-count-3_lost_bcc-0-0-275_checkpoint312_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-converge_bcc-0-0-275) (not (basiccameracontrol-fsm_state-is-tracking_bcc-0-0-275)) (not (basiccameracontrol-fsm_exec-is-azimuth_lost_reaction1_bcc-0-0-275)) (not (fault-count-3_lost_bcc-0-0-275_checkpoint312_n0))))
 (:action basiccameracontrol-set_locked_mode_ok-1_bcc-0-0-275_n0_n1
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-set_locked_mode_bcc-0-0-275) (fault-count-3_lost_bcc-0-0-275_checkpoint104_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_state-is-seq_turn_command_bcc-0-0-275) (not (basiccameracontrol-fsm_state-is-set_locked_mode_bcc-0-0-275)) (not (fault-count-3_lost_bcc-0-0-275_checkpoint104_n0)) (not (dominates-3_hyp2_lost_bcc-0-0-275_checkpoint104))))
 (:action basiccameracontrol-set_locked_mode_action1_error-1_bcc-0-0-275_n0_n1
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-set_locked_mode_bcc-0-0-275) (fault-count-3_lost_bcc-0-0-275_checkpoint404_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_exec-is-action2_bcc-0-0-275) (not (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275)) (not (fault-count-3_lost_bcc-0-0-275_checkpoint404_n0))))
 (:action basiccameracontrol-seq_turn_command_wait_2_bcc-0-0-275
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-in_start_call-is-no_bcc-0-0-275) (basiccameracontrol-fsm_state-is-seq_turn_command_bcc-0-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275) (not (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275))))
 (:action basiccameracontrol-seq_turn_command_not_in_control_bcc-0-0-275
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-seq_turn_command_bcc-0-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_state-is-not_in_control_bcc-0-0-275) (not (basiccameracontrol-fsm_state-is-seq_turn_command_bcc-0-0-275))))
 (:action basiccameracontrol-seq_turn_command_ok_bcc-0-0-275
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-seq_turn_command_bcc-0-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_state-is-locked_camera_mode_bcc-0-0-275) (not (basiccameracontrol-fsm_state-is-seq_turn_command_bcc-0-0-275))))
 (:action basiccameracontrol-seq_turn_command_idle_bcc-0-0-275
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275) (basiccameracontrol-fsm_state-is-seq_turn_command_bcc-0-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (not (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275))))
 (:action basiccameracontrol-seq_lock_command_wait_2_bcc-0-0-275
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-seq_lock_command_bcc-0-0-275) (basiccameracontrol-in_start_call-is-no_bcc-0-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275) (not (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275))))
 (:action basiccameracontrol-seq_lock_command_not_in_control_bcc-0-0-275
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-seq_lock_command_bcc-0-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_state-is-not_in_control_bcc-0-0-275) (not (basiccameracontrol-fsm_state-is-seq_lock_command_bcc-0-0-275))))
 (:action basiccameracontrol-seq_lock_command_ok_bcc-0-0-275
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-seq_lock_command_bcc-0-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_state-is-locked_camera_mode_bcc-0-0-275) (not (basiccameracontrol-fsm_state-is-seq_lock_command_bcc-0-0-275))))
 (:action basiccameracontrol-seq_lock_command_idle_bcc-0-0-275
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_state-is-seq_lock_command_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (not (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275))))
 (:action basiccameracontrol-locked_camera_mode_action1-0_bcc-0-0-275_obs22
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-locked_camera_mode_bcc-0-0-275) (pending_obs22) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_exec-is-action2_bcc-0-0-275) (observed_obs22) (not (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275)) (not (pending_obs22))))
 (:action basiccameracontrol-locked_camera_mode_action1-1_bcc-0-0-275_n0_n1
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-locked_camera_mode_bcc-0-0-275) (fault-count-3_lost_bcc-0-0-275_checkpoint400_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_exec-is-action2_bcc-0-0-275) (not (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275)) (not (fault-count-3_lost_bcc-0-0-275_checkpoint400_n0))))
 (:action basiccameracontrol-locked_camera_mode_action2b_bcc-0-0-275
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-in_start_call-is-no_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action2_bcc-0-0-275) (basiccameracontrol-fsm_state-is-locked_camera_mode_bcc-0-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275) (not (basiccameracontrol-fsm_exec-is-action2_bcc-0-0-275))))
 (:action basiccameracontrol-not_in_control_wait-1_bcc-0-0-275_n0_n1
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-not_in_control_bcc-0-0-275) (fault-count-3_lost_bcc-0-0-275_checkpoint700_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_exec-is-action2_bcc-0-0-275) (not (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275)) (not (fault-count-3_lost_bcc-0-0-275_checkpoint700_n0))))
 (:action basiccameracontrol-not_in_control_action2_2_bcc-0-0-275
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_state-is-not_in_control_bcc-0-0-275) (basiccameracontrol-in_start_call-is-no_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action2_bcc-0-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275) (not (basiccameracontrol-fsm_exec-is-action2_bcc-0-0-275))))
 (:action basiccameracontrol-not_in_control_cmd_resume_control_no_bcc-0-0-275
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_state-is-not_in_control_bcc-0-0-275) (basiccameracontrol-in_start_call-is-no_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (not (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275))))
 (:action basiccameracontrol-not_in_control_drc_control-cameracontrol-ccl-event-ccl_drc_control-1_bcc-0-0-275_n0_n1
  :parameters ()
  :precondition (and (fault-count-2_lost_ccl-event-ccl_drc_control_n0) (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_state-is-not_in_control_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-locked_camera_mode_bcc-0-0-275) (not (fault-count-2_lost_ccl-event-ccl_drc_control_n0)) (not (basiccameracontrol-fsm_state-is-not_in_control_bcc-0-0-275)) (not (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275))))
 (:action basiccameracontrol-global_cmd_set_position_bcc-0-0-275
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-start_tracking_position_bcc-0-0-275) (not (basiccameracontrol-fsm_state-is-select_initial_mode_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-not_in_control_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-start_tracking_bearing_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-set_locked_mode_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-seq_position_command_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-seq_lock_command_bcc-0-0-275)) (not (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-converge_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-seq_bearing_command_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-converge_wait_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-converge_final_wait_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-converge_failed_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-tracking_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-seq_turn_command_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-locked_camera_mode_bcc-0-0-275))))
 (:action basiccameracontrol-global_cmd_set_bearing_bcc-0-0-275
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-start_tracking_bearing_bcc-0-0-275) (not (basiccameracontrol-fsm_state-is-select_initial_mode_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-not_in_control_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-start_tracking_position_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-set_locked_mode_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-seq_position_command_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-seq_lock_command_bcc-0-0-275)) (not (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-converge_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-seq_bearing_command_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-converge_wait_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-converge_final_wait_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-converge_failed_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-tracking_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-seq_turn_command_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-locked_camera_mode_bcc-0-0-275))))
 (:action basiccameracontrol-global_cmd_lock_at_bcc-0-0-275
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-set_locked_mode_bcc-0-0-275) (not (basiccameracontrol-fsm_state-is-select_initial_mode_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-not_in_control_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-start_tracking_position_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-start_tracking_bearing_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-seq_position_command_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-seq_lock_command_bcc-0-0-275)) (not (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-converge_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-seq_bearing_command_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-converge_wait_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-converge_final_wait_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-converge_failed_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-tracking_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-seq_turn_command_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-locked_camera_mode_bcc-0-0-275))))
 (:action basiccameracontrol-global_cmd_lock_at_current-1_bcc-0-0-275_n0_n1
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275) (fault-count-3_lost_bcc-0-0-275_checkpoint410_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-set_locked_mode_bcc-0-0-275) (not (basiccameracontrol-fsm_state-is-select_initial_mode_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-not_in_control_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-start_tracking_position_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-start_tracking_bearing_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-seq_position_command_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-seq_lock_command_bcc-0-0-275)) (not (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-converge_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-seq_bearing_command_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-converge_wait_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-converge_final_wait_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-converge_failed_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-tracking_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-seq_turn_command_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-locked_camera_mode_bcc-0-0-275)) (not (fault-count-3_lost_bcc-0-0-275_checkpoint410_n0))))
 (:action basiccameracontrol-global_cmd_pan_bcc-0-0-275
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-start_tracking_bearing_bcc-0-0-275) (not (basiccameracontrol-fsm_state-is-select_initial_mode_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-not_in_control_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-start_tracking_position_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-set_locked_mode_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-seq_position_command_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-seq_lock_command_bcc-0-0-275)) (not (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-converge_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-seq_bearing_command_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-converge_wait_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-converge_final_wait_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-converge_failed_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-tracking_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-seq_turn_command_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-locked_camera_mode_bcc-0-0-275))))
 (:action basiccameracontrol-global_manual_control-cameracontrol-ccl-event-ccl_manual_control-1_bcc-0-0-275_n0_n1
  :parameters ()
  :precondition (and (fault-count-2_lost_ccl-event-ccl_manual_control_n0) (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-not_in_control_bcc-0-0-275) (not (fault-count-2_lost_ccl-event-ccl_manual_control_n0)) (not (basiccameracontrol-fsm_state-is-select_initial_mode_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-start_tracking_position_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-start_tracking_bearing_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-set_locked_mode_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-seq_position_command_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-seq_lock_command_bcc-0-0-275)) (not (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-converge_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-seq_bearing_command_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-converge_wait_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-converge_final_wait_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-converge_failed_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-tracking_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-seq_turn_command_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-locked_camera_mode_bcc-0-0-275))))
 (:action basiccameracontrol-global_ipc_control-cameracontrol-ccl-event-ccl_ipc_control-1_bcc-0-0-275_n0_n1
  :parameters ()
  :precondition (and (fault-count-2_lost_ccl-event-ccl_ipc_control_n0) (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-not_in_control_bcc-0-0-275) (not (fault-count-2_lost_ccl-event-ccl_ipc_control_n0)) (not (basiccameracontrol-fsm_state-is-select_initial_mode_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-start_tracking_position_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-start_tracking_bearing_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-set_locked_mode_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-seq_position_command_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-seq_lock_command_bcc-0-0-275)) (not (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-converge_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-seq_bearing_command_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-converge_wait_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-converge_final_wait_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-converge_failed_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-tracking_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-seq_turn_command_bcc-0-0-275)) (not (basiccameracontrol-fsm_state-is-locked_camera_mode_bcc-0-0-275))))
 (:action navtopoint-start_decouple_idle_time_out_nav-2-0-275
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_state-is-start_decouple_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-action1_nav-2-0-275) (navtopoint-fsm_state-is-plan_path_nav-2-0-275) (not (navtopoint-fsm_state-is-start_decouple_nav-2-0-275)) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275))))
 (:action navtopoint-start_decouple_idle_time_out_nav-1-0-275
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_state-is-start_decouple_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-action1_nav-1-0-275) (navtopoint-fsm_state-is-plan_path_nav-1-0-275) (not (navtopoint-fsm_state-is-start_decouple_nav-1-0-275)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275))))
 (:action navtopoint-plan_path_action1_checkpoint1-0_nav-2-0-275_obs26
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-action1_nav-2-0-275) (navtopoint-fsm_state-is-plan_path_nav-2-0-275) (pending_obs26) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-action2_nav-2-0-275) (observed_obs26) (not (navtopoint-fsm_exec-is-action1_nav-2-0-275)) (not (pending_obs26))))
 (:action navtopoint-plan_path_action1_checkpoint1-1_nav-2-0-275_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-action1_nav-2-0-275) (navtopoint-fsm_state-is-plan_path_nav-2-0-275) (fault-count-3_lost_nav-2-0-275_checkpoint1_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-action2_nav-2-0-275) (not (navtopoint-fsm_exec-is-action1_nav-2-0-275)) (not (fault-count-3_lost_nav-2-0-275_checkpoint1_n0))))
 (:action navtopoint-plan_path_action1_checkpoint1-1_nav-1-0-275_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-action1_nav-1-0-275) (navtopoint-fsm_state-is-plan_path_nav-1-0-275) (fault-count-3_lost_nav-1-0-275_checkpoint1_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-action2_nav-1-0-275) (not (navtopoint-fsm_exec-is-action1_nav-1-0-275)) (not (fault-count-3_lost_nav-1-0-275_checkpoint1_n0)) (not (dominates-3_hyp2_lost_nav-1-0-275_checkpoint1)) (not (dominates-3_hyp1_lost_nav-1-0-275_checkpoint1))))
 (:action navtopoint-plan_path_action2_checkpoint4a-0_nav-2-0-275_obs27
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_state-is-plan_path_nav-2-0-275) (navtopoint-fsm_exec-is-action2_nav-2-0-275) (navtopoint-in_start_call-is-no_nav-2-0-275) (pending_obs27) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-wait_for_go_nav-2-0-275) (observed_obs27) (not (navtopoint-fsm_state-is-plan_path_nav-2-0-275)) (not (navtopoint-fsm_exec-is-action2_nav-2-0-275)) (not (pending_obs27))))
 (:action navtopoint-plan_path_action2_checkpoint4a-0_nav-1-0-275_obs12
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_state-is-plan_path_nav-1-0-275) (navtopoint-fsm_exec-is-action2_nav-1-0-275) (navtopoint-in_start_call-is-no_nav-1-0-275) (pending_obs12) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-wait_for_go_nav-1-0-275) (observed_obs12) (not (navtopoint-fsm_state-is-plan_path_nav-1-0-275)) (not (navtopoint-fsm_exec-is-action2_nav-1-0-275)) (not (pending_obs12))))
 (:action navtopoint-plan_path_action2_checkpoint4a-1_nav-2-0-275_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_state-is-plan_path_nav-2-0-275) (navtopoint-fsm_exec-is-action2_nav-2-0-275) (navtopoint-in_start_call-is-no_nav-2-0-275) (fault-count-3_lost_nav-2-0-275_checkpoint4_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-wait_for_go_nav-2-0-275) (not (navtopoint-fsm_state-is-plan_path_nav-2-0-275)) (not (navtopoint-fsm_exec-is-action2_nav-2-0-275)) (not (fault-count-3_lost_nav-2-0-275_checkpoint4_n0))))
 (:action navtopoint-plan_path_action2_checkpoint4a-1_nav-1-0-275_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_state-is-plan_path_nav-1-0-275) (navtopoint-fsm_exec-is-action2_nav-1-0-275) (navtopoint-in_start_call-is-no_nav-1-0-275) (fault-count-3_lost_nav-1-0-275_checkpoint4_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-wait_for_go_nav-1-0-275) (not (navtopoint-fsm_state-is-plan_path_nav-1-0-275)) (not (navtopoint-fsm_exec-is-action2_nav-1-0-275)) (not (fault-count-3_lost_nav-1-0-275_checkpoint4_n0))))
 (:action navtopoint-plan_path_action2_checkpoint4b-0_nav-2-0-275_obs27
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_state-is-plan_path_nav-2-0-275) (navtopoint-fsm_exec-is-action2_nav-2-0-275) (pending_obs27) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-action1_nav-2-0-275) (observed_obs27) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (not (navtopoint-fsm_state-is-plan_path_nav-2-0-275)) (not (navtopoint-fsm_exec-is-action2_nav-2-0-275)) (not (pending_obs27))))
 (:action navtopoint-plan_path_action2_checkpoint4b-0_nav-1-0-275_obs12
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_state-is-plan_path_nav-1-0-275) (navtopoint-fsm_exec-is-action2_nav-1-0-275) (pending_obs12) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-action1_nav-1-0-275) (observed_obs12) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (not (navtopoint-fsm_state-is-plan_path_nav-1-0-275)) (not (navtopoint-fsm_exec-is-action2_nav-1-0-275)) (not (pending_obs12))))
 (:action navtopoint-plan_path_action2_checkpoint4b-1_nav-2-0-275_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_state-is-plan_path_nav-2-0-275) (navtopoint-fsm_exec-is-action2_nav-2-0-275) (fault-count-3_lost_nav-2-0-275_checkpoint4_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-action1_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (not (navtopoint-fsm_state-is-plan_path_nav-2-0-275)) (not (navtopoint-fsm_exec-is-action2_nav-2-0-275)) (not (fault-count-3_lost_nav-2-0-275_checkpoint4_n0))))
 (:action navtopoint-plan_path_action2_checkpoint4b-1_nav-1-0-275_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_state-is-plan_path_nav-1-0-275) (navtopoint-fsm_exec-is-action2_nav-1-0-275) (fault-count-3_lost_nav-1-0-275_checkpoint4_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-action1_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (not (navtopoint-fsm_state-is-plan_path_nav-1-0-275)) (not (navtopoint-fsm_exec-is-action2_nav-1-0-275)) (not (fault-count-3_lost_nav-1-0-275_checkpoint4_n0))))
 (:action navtopoint-wait_for_go_ok_nav-2-0-275
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-wait_for_go_nav-2-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-action1_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275)) (not (navtopoint-fsm_state-is-wait_for_go_nav-2-0-275))))
 (:action navtopoint-wait_for_go_ok_nav-1-0-275
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-wait_for_go_nav-1-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-action1_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (navtopoint-fsm_state-is-wait_for_go_nav-1-0-275))))
 (:action navtopoint-fly_path_action1_proxy_init_ok-fly3d-call_set_args_nav-2-0-275_f3d-2-0-370_heli0_f3d-2-0-370_nav-2-0-275
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-action1_nav-2-0-275) (navtopoint-in_start_call-is-no_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (fly3d-mode-is-pre_init_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-2-0-370) (fly3d-mode-is-processing_f3d-2-0-370) (called-by_f3d-2-0-370_nav-2-0-275) (not (navtopoint-fsm_exec-is-action1_nav-2-0-275)) (not (fly3d-mode-is-pre_init_f3d-2-0-370))))
 (:action navtopoint-fly_path_action1_proxy_init_ok-fly3d-call_set_args_nav-2-0-275_f3d-1-0-364_heli0_f3d-1-0-364_nav-2-0-275
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-action1_nav-2-0-275) (navtopoint-in_start_call-is-no_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (fly3d-mode-is-pre_init_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-1-0-364) (fly3d-mode-is-processing_f3d-1-0-364) (called-by_f3d-1-0-364_nav-2-0-275) (not (navtopoint-fsm_exec-is-action1_nav-2-0-275)) (not (fly3d-mode-is-pre_init_f3d-1-0-364))))
 (:action navtopoint-fly_path_action1_proxy_init_ok-fly3d-call_set_args_nav-1-0-275_f3d-2-0-370_heli0_f3d-2-0-370_nav-1-0-275
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-action1_nav-1-0-275) (navtopoint-in_start_call-is-no_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (fly3d-mode-is-pre_init_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (fly3d-mode-is-processing_f3d-2-0-370) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-2-0-370) (called-by_f3d-2-0-370_nav-1-0-275) (not (navtopoint-fsm_exec-is-action1_nav-1-0-275)) (not (fly3d-mode-is-pre_init_f3d-2-0-370))))
 (:action navtopoint-fly_path_action1_proxy_init_ok-fly3d-call_set_args_nav-1-0-275_f3d-1-0-364_heli0_f3d-1-0-364_nav-1-0-275
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-action1_nav-1-0-275) (navtopoint-in_start_call-is-no_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (fly3d-mode-is-pre_init_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (fly3d-mode-is-processing_f3d-1-0-364) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (called-by_f3d-1-0-364_nav-1-0-275) (not (navtopoint-fsm_exec-is-action1_nav-1-0-275)) (not (fly3d-mode-is-pre_init_f3d-1-0-364))))
 (:action navtopoint-fly_path_fly3d_ready-fly3d-init_ok-0_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_nav-1-0-275_obs13
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (fly3d-mode-is-processing_f3d-1-0-364) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (called-by_f3d-1-0-364_nav-1-0-275) (pending_obs13) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-ready_f3d-1-0-364) (observed_obs13) (navtopoint-fsm_exec-is-reaction_f3d_ready_nav-1-0-275) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fly3d-mode-is-processing_f3d-1-0-364)) (not (pending_obs13))))
 (:action navtopoint-fly_path_fly3d_ready-fly3d-init_ok-1_nav-2-0-275_f3d-2-0-370_f3d-2-0-370_nav-2-0-275_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-2-0-370) (fly3d-mode-is-processing_f3d-2-0-370) (called-by_f3d-2-0-370_nav-2-0-275) (fault-count-4_lost_f3d-2-0-370_created_nav-2-0-275_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-reaction_f3d_ready_nav-2-0-275) (fly3d-mode-is-ready_f3d-2-0-370) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275)) (not (fly3d-mode-is-processing_f3d-2-0-370)) (not (fault-count-4_lost_f3d-2-0-370_created_nav-2-0-275_n0)) (not (dominates-4_hyp2_lost_f3d-2-0-370_created_nav-2-0-275)) (not (dominates-4_hyp1_lost_f3d-2-0-370_created_nav-2-0-275))))
 (:action navtopoint-fly_path_fly3d_ready-fly3d-init_ok-1_nav-2-0-275_f3d-1-0-364_f3d-1-0-364_nav-2-0-275_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-1-0-364) (fly3d-mode-is-processing_f3d-1-0-364) (called-by_f3d-1-0-364_nav-2-0-275) (fault-count-4_lost_f3d-1-0-364_created_nav-2-0-275_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-reaction_f3d_ready_nav-2-0-275) (fly3d-mode-is-ready_f3d-1-0-364) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275)) (not (fly3d-mode-is-processing_f3d-1-0-364)) (not (fault-count-4_lost_f3d-1-0-364_created_nav-2-0-275_n0))))
 (:action navtopoint-fly_path_fly3d_ready-fly3d-init_ok-1_nav-1-0-275_f3d-2-0-370_f3d-2-0-370_nav-1-0-275_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (fly3d-mode-is-processing_f3d-2-0-370) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-2-0-370) (called-by_f3d-2-0-370_nav-1-0-275) (fault-count-4_lost_f3d-2-0-370_created_nav-1-0-275_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-reaction_f3d_ready_nav-1-0-275) (fly3d-mode-is-ready_f3d-2-0-370) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fly3d-mode-is-processing_f3d-2-0-370)) (not (fault-count-4_lost_f3d-2-0-370_created_nav-1-0-275_n0))))
 (:action navtopoint-fly_path_fly3d_ready-fly3d-init_ok-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_nav-1-0-275_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (fly3d-mode-is-processing_f3d-1-0-364) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (called-by_f3d-1-0-364_nav-1-0-275) (fault-count-4_lost_f3d-1-0-364_created_nav-1-0-275_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-ready_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_ready_nav-1-0-275) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fly3d-mode-is-processing_f3d-1-0-364)) (not (fault-count-4_lost_f3d-1-0-364_created_nav-1-0-275_n0))))
 (:action navtopoint-fly_path_fly3d_ready_call_start-fly3d-call_start_nav-2-0-275_f3d-2-0-370_f3d-2-0-370
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_ready_nav-2-0-275) (fly3d-mode-is-ready_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-start_f3d-2-0-370) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (fly3d-in_start_call-is-yes_f3d-2-0-370) (not (navtopoint-fsm_exec-is-reaction_f3d_ready_nav-2-0-275)) (not (fly3d-mode-is-ready_f3d-2-0-370))))
 (:action navtopoint-fly_path_fly3d_ready_call_start-fly3d-call_start_nav-2-0-275_f3d-1-0-364_f3d-1-0-364
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_ready_nav-2-0-275) (fly3d-mode-is-ready_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-start_f3d-1-0-364) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (fly3d-in_start_call-is-yes_f3d-1-0-364) (not (navtopoint-fsm_exec-is-reaction_f3d_ready_nav-2-0-275)) (not (fly3d-mode-is-ready_f3d-1-0-364))))
 (:action navtopoint-fly_path_fly3d_ready_call_start-fly3d-call_start_nav-1-0-275_f3d-2-0-370_f3d-2-0-370
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_ready_nav-1-0-275) (fly3d-mode-is-ready_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-start_f3d-2-0-370) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (fly3d-in_start_call-is-yes_f3d-2-0-370) (not (navtopoint-fsm_exec-is-reaction_f3d_ready_nav-1-0-275)) (not (fly3d-mode-is-ready_f3d-2-0-370))))
 (:action navtopoint-fly_path_fly3d_ready_call_start-fly3d-call_start_nav-1-0-275_f3d-1-0-364_f3d-1-0-364
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fly3d-mode-is-ready_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_ready_nav-1-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-start_f3d-1-0-364) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (fly3d-in_start_call-is-yes_f3d-1-0-364) (not (fly3d-mode-is-ready_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-reaction_f3d_ready_nav-1-0-275))))
 (:action navtopoint-fly_path_fly3d_ready_proxy_fail-fly3d-call_destroy_when_done-1_nav-2-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_ready_nav-2-0-275) (fly3d-mode-is-done_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_destroyed_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-reaction_f3d_fail_2_nav-2-0-275) (not (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-reaction_f3d_ready_nav-2-0-275)) (not (fly3d-mode-is-done_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_destroyed_n0))))
 (:action navtopoint-fly_path_fly3d_ready_proxy_fail-fly3d-call_destroy_when_done-1_nav-2-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_ready_nav-2-0-275) (fly3d-mode-is-done_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_destroyed_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-reaction_f3d_fail_2_nav-2-0-275) (not (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-reaction_f3d_ready_nav-2-0-275)) (not (fly3d-mode-is-done_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_destroyed_n0))))
 (:action navtopoint-fly_path_fly3d_ready_proxy_fail-fly3d-call_destroy_when_done-1_nav-1-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_ready_nav-1-0-275) (fly3d-mode-is-done_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_destroyed_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-reaction_f3d_fail_2_nav-1-0-275) (not (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-reaction_f3d_ready_nav-1-0-275)) (not (fly3d-mode-is-done_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_destroyed_n0))))
 (:action navtopoint-fly_path_fly3d_ready_proxy_fail-fly3d-call_destroy_when_done-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_ready_nav-1-0-275) (fly3d-mode-is-done_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_destroyed_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-reaction_f3d_fail_2_nav-1-0-275) (not (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-reaction_f3d_ready_nav-1-0-275)) (not (fly3d-mode-is-done_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_destroyed_n0))))
 (:action navtopoint-fly_path_fly3d_ready_proxy_fail-fly3d-call_destroy_when_failed-1_nav-2-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_ready_nav-2-0-275) (fault-count-3_lost_f3d-2-0-370_destroyed_n0) (fly3d-mode-is-failed_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-reaction_f3d_fail_2_nav-2-0-275) (not (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-reaction_f3d_ready_nav-2-0-275)) (not (fault-count-3_lost_f3d-2-0-370_destroyed_n0)) (not (fly3d-mode-is-failed_f3d-2-0-370))))
 (:action navtopoint-fly_path_fly3d_ready_proxy_fail-fly3d-call_destroy_when_failed-1_nav-2-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_ready_nav-2-0-275) (fault-count-3_lost_f3d-1-0-364_destroyed_n0) (fly3d-mode-is-failed_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-reaction_f3d_fail_2_nav-2-0-275) (not (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-reaction_f3d_ready_nav-2-0-275)) (not (fault-count-3_lost_f3d-1-0-364_destroyed_n0)) (not (fly3d-mode-is-failed_f3d-1-0-364))))
 (:action navtopoint-fly_path_fly3d_ready_proxy_fail-fly3d-call_destroy_when_failed-1_nav-1-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_ready_nav-1-0-275) (fault-count-3_lost_f3d-2-0-370_destroyed_n0) (fly3d-mode-is-failed_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-reaction_f3d_fail_2_nav-1-0-275) (not (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-reaction_f3d_ready_nav-1-0-275)) (not (fault-count-3_lost_f3d-2-0-370_destroyed_n0)) (not (fly3d-mode-is-failed_f3d-2-0-370))))
 (:action navtopoint-fly_path_fly3d_ready_proxy_fail-fly3d-call_destroy_when_failed-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_ready_nav-1-0-275) (fault-count-3_lost_f3d-1-0-364_destroyed_n0) (fly3d-mode-is-failed_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-reaction_f3d_fail_2_nav-1-0-275) (not (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-reaction_f3d_ready_nav-1-0-275)) (not (fault-count-3_lost_f3d-1-0-364_destroyed_n0)) (not (fly3d-mode-is-failed_f3d-1-0-364))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_starting_yaw_command_ok_sync_nav-2-0-275_f3d-2-0-370_f3d-2-0-370
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-0-370) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-2-0-370) (fly3d-in_start_call-is-yes_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-2-0-370) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (not (fly3d-fsm_exec-is-action1_f3d-2-0-370)) (not (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-0-370)) (not (fly3d-in_start_call-is-yes_f3d-2-0-370))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_starting_yaw_command_ok_sync_nav-2-0-275_f3d-1-0-364_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-1-0-364) (fly3d-in_start_call-is-yes_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not (fly3d-fsm_exec-is-action1_f3d-1-0-364)) (not (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364)) (not (fly3d-in_start_call-is-yes_f3d-1-0-364))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_starting_yaw_command_ok_sync_nav-1-0-275_f3d-2-0-370_f3d-2-0-370
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-0-370) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-2-0-370) (fly3d-in_start_call-is-yes_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-2-0-370) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (not (fly3d-fsm_exec-is-action1_f3d-2-0-370)) (not (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-0-370)) (not (fly3d-in_start_call-is-yes_f3d-2-0-370))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_starting_yaw_command_ok_sync_nav-1-0-275_f3d-1-0-364_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fly3d-in_start_call-is-yes_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not (fly3d-fsm_exec-is-action1_f3d-1-0-364)) (not (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364)) (not (fly3d-in_start_call-is-yes_f3d-1-0-364))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_starting_yaw_command_checkpoint12_sync-1_nav-2-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_checkpoint12_n0) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-2-0-370) (fly3d-in_start_call-is-yes_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (not (fly3d-fsm_exec-is-action1_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_checkpoint12_n0)) (not (fly3d-in_start_call-is-yes_f3d-2-0-370))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_starting_yaw_command_checkpoint12_sync-1_nav-2-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint12_n0) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-1-0-364) (fly3d-in_start_call-is-yes_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not (fly3d-fsm_exec-is-action1_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_checkpoint12_n0)) (not (fly3d-in_start_call-is-yes_f3d-1-0-364))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_starting_yaw_command_checkpoint12_sync-1_nav-1-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_checkpoint12_n0) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-2-0-370) (fly3d-in_start_call-is-yes_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (not (fly3d-fsm_exec-is-action1_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_checkpoint12_n0)) (not (fly3d-in_start_call-is-yes_f3d-2-0-370))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_starting_yaw_command_checkpoint12_sync-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint12_n0) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fly3d-in_start_call-is-yes_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not (fly3d-fsm_exec-is-action1_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_checkpoint12_n0)) (not (fly3d-in_start_call-is-yes_f3d-1-0-364))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_first_trajectory_checkpoint20_sync-1_nav-2-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_checkpoint20_n0) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-2-0-370) (fly3d-in_start_call-is-yes_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (not (fly3d-fsm_exec-is-action1_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_checkpoint20_n0)) (not (fly3d-trajectory-not-sent_f3d-2-0-370)) (not (fly3d-in_start_call-is-yes_f3d-2-0-370))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_first_trajectory_checkpoint20_sync-1_nav-2-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint20_n0) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-1-0-364) (fly3d-in_start_call-is-yes_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not (fly3d-fsm_exec-is-action1_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_checkpoint20_n0)) (not (fly3d-trajectory-not-sent_f3d-1-0-364)) (not (fly3d-in_start_call-is-yes_f3d-1-0-364))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_first_trajectory_checkpoint20_sync-1_nav-1-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_checkpoint20_n0) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-2-0-370) (fly3d-in_start_call-is-yes_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (not (fly3d-fsm_exec-is-action1_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_checkpoint20_n0)) (not (fly3d-trajectory-not-sent_f3d-2-0-370)) (not (fly3d-in_start_call-is-yes_f3d-2-0-370))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_first_trajectory_checkpoint20_sync-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint20_n0) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fly3d-in_start_call-is-yes_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (not (fly3d-fsm_exec-is-action1_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_checkpoint20_n0)) (not (fly3d-trajectory-not-sent_f3d-1-0-364)) (not (fly3d-in_start_call-is-yes_f3d-1-0-364))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_first_trajectory_checkpoint21_sync-0_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_obs16
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (pending_obs16) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fly3d-in_start_call-is-yes_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-1-0-364) (observed_obs16) (not (fly3d-fsm_exec-is-action1_f3d-1-0-364)) (not (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364)) (not (fly3d-trajectory-not-sent_f3d-1-0-364)) (not (pending_obs16)) (not (fly3d-in_start_call-is-yes_f3d-1-0-364))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_first_trajectory_checkpoint21_sync-1_nav-2-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_checkpoint21_n0) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-2-0-370) (fly3d-in_start_call-is-yes_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-0-370) (not (fly3d-fsm_exec-is-action1_f3d-2-0-370)) (not (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370)) (not (fly3d-trajectory-not-sent_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_checkpoint21_n0)) (not (fly3d-in_start_call-is-yes_f3d-2-0-370))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_first_trajectory_checkpoint21_sync-1_nav-2-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint21_n0) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-1-0-364) (fly3d-in_start_call-is-yes_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-1-0-364) (not (fly3d-fsm_exec-is-action1_f3d-1-0-364)) (not (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364)) (not (fly3d-trajectory-not-sent_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_checkpoint21_n0)) (not (fly3d-in_start_call-is-yes_f3d-1-0-364))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_first_trajectory_checkpoint21_sync-1_nav-1-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_checkpoint21_n0) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-2-0-370) (fly3d-in_start_call-is-yes_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-0-370) (not (fly3d-fsm_exec-is-action1_f3d-2-0-370)) (not (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370)) (not (fly3d-trajectory-not-sent_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_checkpoint21_n0)) (not (fly3d-in_start_call-is-yes_f3d-2-0-370))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_first_trajectory_checkpoint21_sync-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint21_n0) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fly3d-in_start_call-is-yes_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-1-0-364) (not (fly3d-fsm_exec-is-action1_f3d-1-0-364)) (not (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364)) (not (fly3d-trajectory-not-sent_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_checkpoint21_n0)) (not (fly3d-in_start_call-is-yes_f3d-1-0-364))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_first_trajectory_checkpoint21_after22_sync-0_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_obs16
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (pending_obs16) (fly3d-fsm_exec-is-action2_f3d-1-0-364) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fly3d-in_start_call-is-yes_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-1-0-364) (observed_obs16) (not (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364)) (not (fly3d-trajectory-not-sent_f3d-1-0-364)) (not (pending_obs16)) (not (fly3d-fsm_exec-is-action2_f3d-1-0-364)) (not (fly3d-in_start_call-is-yes_f3d-1-0-364))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_first_trajectory_checkpoint21_after22_sync-1_nav-2-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_checkpoint21_n0) (fly3d-fsm_exec-is-action2_f3d-2-0-370) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-2-0-370) (fly3d-in_start_call-is-yes_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-0-370) (not (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370)) (not (fly3d-trajectory-not-sent_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_checkpoint21_n0)) (not (fly3d-fsm_exec-is-action2_f3d-2-0-370)) (not (fly3d-in_start_call-is-yes_f3d-2-0-370))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_first_trajectory_checkpoint21_after22_sync-1_nav-2-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint21_n0) (fly3d-fsm_exec-is-action2_f3d-1-0-364) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-1-0-364) (fly3d-in_start_call-is-yes_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-1-0-364) (not (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364)) (not (fly3d-trajectory-not-sent_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_checkpoint21_n0)) (not (fly3d-fsm_exec-is-action2_f3d-1-0-364)) (not (fly3d-in_start_call-is-yes_f3d-1-0-364))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_first_trajectory_checkpoint21_after22_sync-1_nav-1-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_checkpoint21_n0) (fly3d-fsm_exec-is-action2_f3d-2-0-370) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-2-0-370) (fly3d-in_start_call-is-yes_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-0-370) (not (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370)) (not (fly3d-trajectory-not-sent_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_checkpoint21_n0)) (not (fly3d-fsm_exec-is-action2_f3d-2-0-370)) (not (fly3d-in_start_call-is-yes_f3d-2-0-370))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_first_trajectory_checkpoint21_after22_sync-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint21_n0) (fly3d-fsm_exec-is-action2_f3d-1-0-364) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fly3d-in_start_call-is-yes_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-1-0-364) (not (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364)) (not (fly3d-trajectory-not-sent_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_checkpoint21_n0)) (not (fly3d-fsm_exec-is-action2_f3d-1-0-364)) (not (fly3d-in_start_call-is-yes_f3d-1-0-364))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_first_trajectory_busy_sync_nav-2-0-275_f3d-2-0-370_f3d-2-0-370
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-2-0-370) (fly3d-in_start_call-is-yes_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (fly3d-trajectory-not-sent_f3d-2-0-370) (not (fly3d-fsm_exec-is-action1_f3d-2-0-370)) (not (fly3d-in_start_call-is-yes_f3d-2-0-370))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_first_trajectory_busy_sync_nav-2-0-275_f3d-1-0-364_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-1-0-364) (fly3d-in_start_call-is-yes_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-trajectory-not-sent_f3d-1-0-364) (not (fly3d-fsm_exec-is-action1_f3d-1-0-364)) (not (fly3d-in_start_call-is-yes_f3d-1-0-364))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_first_trajectory_busy_sync_nav-1-0-275_f3d-2-0-370_f3d-2-0-370
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-2-0-370) (fly3d-in_start_call-is-yes_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (fly3d-trajectory-not-sent_f3d-2-0-370) (not (fly3d-fsm_exec-is-action1_f3d-2-0-370)) (not (fly3d-in_start_call-is-yes_f3d-2-0-370))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_first_trajectory_busy_sync_nav-1-0-275_f3d-1-0-364_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fly3d-in_start_call-is-yes_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-trajectory-not-sent_f3d-1-0-364) (not (fly3d-fsm_exec-is-action1_f3d-1-0-364)) (not (fly3d-in_start_call-is-yes_f3d-1-0-364))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_first_trajectory_busy_after22_sync_nav-2-0-275_f3d-2-0-370_f3d-2-0-370
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370) (fly3d-fsm_exec-is-action2_f3d-2-0-370) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-2-0-370) (fly3d-in_start_call-is-yes_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (fly3d-trajectory-not-sent_f3d-2-0-370) (not (fly3d-fsm_exec-is-action2_f3d-2-0-370)) (not (fly3d-in_start_call-is-yes_f3d-2-0-370))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_first_trajectory_busy_after22_sync_nav-2-0-275_f3d-1-0-364_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fly3d-fsm_exec-is-action2_f3d-1-0-364) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-1-0-364) (fly3d-in_start_call-is-yes_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-trajectory-not-sent_f3d-1-0-364) (not (fly3d-fsm_exec-is-action2_f3d-1-0-364)) (not (fly3d-in_start_call-is-yes_f3d-1-0-364))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_first_trajectory_busy_after22_sync_nav-1-0-275_f3d-2-0-370_f3d-2-0-370
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370) (fly3d-fsm_exec-is-action2_f3d-2-0-370) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-2-0-370) (fly3d-in_start_call-is-yes_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (fly3d-trajectory-not-sent_f3d-2-0-370) (not (fly3d-fsm_exec-is-action2_f3d-2-0-370)) (not (fly3d-in_start_call-is-yes_f3d-2-0-370))))
 (:action navtopoint-fly_path_f3d_running-fly3d-enter_send_first_trajectory_busy_after22_sync_nav-1-0-275_f3d-1-0-364_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fly3d-fsm_exec-is-action2_f3d-1-0-364) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fly3d-in_start_call-is-yes_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-trajectory-not-sent_f3d-1-0-364) (not (fly3d-fsm_exec-is-action2_f3d-1-0-364)) (not (fly3d-in_start_call-is-yes_f3d-1-0-364))))
 (:action navtopoint-fly_path_fly3d_sync_done-fly3d-start_exit_nav-2-0-275_f3d-2-0-370_f3d-2-0-370
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-start_f3d-2-0-370) (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-2-0-275) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275))))
 (:action navtopoint-fly_path_fly3d_sync_done-fly3d-start_exit_nav-2-0-275_f3d-1-0-364_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-start_f3d-1-0-364) (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-2-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275))))
 (:action navtopoint-fly_path_fly3d_sync_done-fly3d-start_exit_nav-1-0-275_f3d-2-0-370_f3d-2-0-370
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-start_f3d-2-0-370) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275))))
 (:action navtopoint-fly_path_fly3d_sync_done-fly3d-start_exit_nav-1-0-275_f3d-1-0-364_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-start_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-in_send_starting_yaw_command_fcl_cancel_reaction1-0_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_obs19
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364) (fly3d-fsm_exec-is-reaction_cancel_1_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (pending_obs19) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-1-0-275) (observed_obs19) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (pending_obs19))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-in_send_starting_yaw_command_fcl_cancel_reaction1-1_nav-2-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-0-370) (fly3d-fsm_exec-is-reaction_cancel_1_f3d-2-0-370) (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-2-0-275) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275)) (not (fault-count-3_lost_f3d-2-0-370_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-in_send_starting_yaw_command_fcl_cancel_reaction1-1_nav-2-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364) (fly3d-fsm_exec-is-reaction_cancel_1_f3d-1-0-364) (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-2-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275)) (not (fault-count-3_lost_f3d-1-0-364_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-in_send_starting_yaw_command_fcl_cancel_reaction1-1_nav-1-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-0-370) (fly3d-fsm_exec-is-reaction_cancel_1_f3d-2-0-370) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-2-0-370_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-in_send_starting_yaw_command_fcl_cancel_reaction1-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364) (fly3d-fsm_exec-is-reaction_cancel_1_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-1-0-364_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-in_wait_for_yaw_finish_fcl_cancel_reaction1-0_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_obs19
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-1-0-364) (fly3d-fsm_exec-is-reaction_cancel_1_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (pending_obs19) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-1-0-275) (observed_obs19) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (pending_obs19))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-in_wait_for_yaw_finish_fcl_cancel_reaction1-1_nav-2-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-0-370) (fly3d-fsm_exec-is-reaction_cancel_1_f3d-2-0-370) (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-2-0-275) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275)) (not (fault-count-3_lost_f3d-2-0-370_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-in_wait_for_yaw_finish_fcl_cancel_reaction1-1_nav-2-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-1-0-364) (fly3d-fsm_exec-is-reaction_cancel_1_f3d-1-0-364) (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-2-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275)) (not (fault-count-3_lost_f3d-1-0-364_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-in_wait_for_yaw_finish_fcl_cancel_reaction1-1_nav-1-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-0-370) (fly3d-fsm_exec-is-reaction_cancel_1_f3d-2-0-370) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-2-0-370_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-in_wait_for_yaw_finish_fcl_cancel_reaction1-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-1-0-364) (fly3d-fsm_exec-is-reaction_cancel_1_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-1-0-364_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-in_wait_trajectory_end_fcl_finished_reaction2c-0_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_obs19
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-1-0-364) (fly3d-fsm_exec-is-reaction_finished_2_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (pending_obs19) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-1-0-275) (observed_obs19) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (pending_obs19))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-in_wait_trajectory_end_fcl_finished_reaction2c-1_nav-2-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-0-370) (fly3d-fsm_exec-is-reaction_finished_2_f3d-2-0-370) (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-2-0-275) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275)) (not (fault-count-3_lost_f3d-2-0-370_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-in_wait_trajectory_end_fcl_finished_reaction2c-1_nav-2-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-1-0-364) (fly3d-fsm_exec-is-reaction_finished_2_f3d-1-0-364) (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-2-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275)) (not (fault-count-3_lost_f3d-1-0-364_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-in_wait_trajectory_end_fcl_finished_reaction2c-1_nav-1-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-0-370) (fly3d-fsm_exec-is-reaction_finished_2_f3d-2-0-370) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-2-0-370_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-in_wait_trajectory_end_fcl_finished_reaction2c-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-1-0-364) (fly3d-fsm_exec-is-reaction_finished_2_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-1-0-364_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-enter_turn_to_goal_heading_action2-exit-0_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_obs19
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action2-exit_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (pending_obs19) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-1-0-275) (observed_obs19) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (pending_obs19))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-enter_turn_to_goal_heading_action2-exit-1_nav-2-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-2-0-370) (fly3d-fsm_exec-is-action2-exit_f3d-2-0-370) (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-2-0-275) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275)) (not (fault-count-3_lost_f3d-2-0-370_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-enter_turn_to_goal_heading_action2-exit-1_nav-2-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action2-exit_f3d-1-0-364) (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-2-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275)) (not (fault-count-3_lost_f3d-1-0-364_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-enter_turn_to_goal_heading_action2-exit-1_nav-1-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-2-0-370) (fly3d-fsm_exec-is-action2-exit_f3d-2-0-370) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-2-0-370_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-enter_turn_to_goal_heading_action2-exit-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action2-exit_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-1-0-364_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-goal_point_wait_cmd_continue_exit-0_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_obs19
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-fsm_state-is-goal_point_wait_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (pending_obs19) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-1-0-275) (observed_obs19) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (pending_obs19))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-goal_point_wait_cmd_continue_exit-1_nav-2-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (fly3d-fsm_state-is-goal_point_wait_f3d-2-0-370) (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-2-0-275) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275)) (not (fault-count-3_lost_f3d-2-0-370_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-goal_point_wait_cmd_continue_exit-1_nav-2-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-fsm_state-is-goal_point_wait_f3d-1-0-364) (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-2-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275)) (not (fault-count-3_lost_f3d-1-0-364_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-goal_point_wait_cmd_continue_exit-1_nav-1-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (fly3d-fsm_state-is-goal_point_wait_f3d-2-0-370) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-2-0-370_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-goal_point_wait_cmd_continue_exit-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-fsm_state-is-goal_point_wait_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-1-0-364_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-goal_point_wait_idle_exit-0_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_obs19
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-fsm_state-is-goal_point_wait_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (pending_obs19) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-1-0-275) (observed_obs19) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (pending_obs19))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-goal_point_wait_idle_exit-1_nav-2-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (fly3d-fsm_state-is-goal_point_wait_f3d-2-0-370) (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-2-0-275) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275)) (not (fault-count-3_lost_f3d-2-0-370_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-goal_point_wait_idle_exit-1_nav-2-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-fsm_state-is-goal_point_wait_f3d-1-0-364) (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-2-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275)) (not (fault-count-3_lost_f3d-1-0-364_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-goal_point_wait_idle_exit-1_nav-1-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (fly3d-fsm_state-is-goal_point_wait_f3d-2-0-370) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-2-0-370_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-goal_point_wait_idle_exit-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-fsm_state-is-goal_point_wait_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-1-0-364_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-global_fcl_cancel_reaction1-0_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_obs19
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-global_reaction_cancel_1_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (pending_obs19) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-1-0-275) (observed_obs19) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (pending_obs19))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-global_fcl_cancel_reaction1-1_nav-2-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-global_reaction_cancel_1_f3d-2-0-370) (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-2-0-275) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275)) (not (fault-count-3_lost_f3d-2-0-370_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-global_fcl_cancel_reaction1-1_nav-2-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-global_reaction_cancel_1_f3d-1-0-364) (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-2-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275)) (not (fault-count-3_lost_f3d-1-0-364_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-global_fcl_cancel_reaction1-1_nav-1-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-global_reaction_cancel_1_f3d-2-0-370) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-2-0-370_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_async_done-fly3d-global_fcl_cancel_reaction1-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-global_reaction_cancel_1_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-1-0-364_task-done_n0))))
 (:action navtopoint-fly_path_fly3d_done_1-fly3d-call_destroy_when_done-0_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_obs20
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fly3d-mode-is-done_f3d-1-0-364) (pending_obs20) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-1-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs20) (navtopoint-fsm_exec-is-reaction_f3d_done_2_nav-1-0-275) (not (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364)) (not (fly3d-mode-is-done_f3d-1-0-364)) (not (pending_obs20)) (not (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-1-0-275))))
 (:action navtopoint-fly_path_fly3d_done_1-fly3d-call_destroy_when_done-1_nav-2-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-2-0-370) (fly3d-mode-is-done_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_destroyed_n0) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-2-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-reaction_f3d_done_2_nav-2-0-275) (not (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-2-0-370)) (not (fly3d-mode-is-done_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_destroyed_n0)) (not (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-2-0-275))))
 (:action navtopoint-fly_path_fly3d_done_1-fly3d-call_destroy_when_done-1_nav-2-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-1-0-364) (fly3d-mode-is-done_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_destroyed_n0) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-2-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-reaction_f3d_done_2_nav-2-0-275) (not (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-1-0-364)) (not (fly3d-mode-is-done_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_destroyed_n0)) (not (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-2-0-275))))
 (:action navtopoint-fly_path_fly3d_done_1-fly3d-call_destroy_when_done-1_nav-1-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-2-0-370) (fly3d-mode-is-done_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_destroyed_n0) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-1-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-reaction_f3d_done_2_nav-1-0-275) (not (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-2-0-370)) (not (fly3d-mode-is-done_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_destroyed_n0)) (not (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-1-0-275))))
 (:action navtopoint-fly_path_fly3d_done_1-fly3d-call_destroy_when_done-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fly3d-mode-is-done_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_destroyed_n0) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-1-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-reaction_f3d_done_2_nav-1-0-275) (not (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364)) (not (fly3d-mode-is-done_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_destroyed_n0)) (not (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-1-0-275))))
 (:action navtopoint-fly_path_fly3d_done_1-fly3d-call_destroy_when_failed-1_nav-2-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_destroyed_n0) (fly3d-mode-is-failed_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-2-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-reaction_f3d_done_2_nav-2-0-275) (not (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_destroyed_n0)) (not (fly3d-mode-is-failed_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-2-0-275))))
 (:action navtopoint-fly_path_fly3d_done_1-fly3d-call_destroy_when_failed-1_nav-2-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_destroyed_n0) (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-2-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-reaction_f3d_done_2_nav-2-0-275) (not (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_destroyed_n0)) (not (fly3d-mode-is-failed_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-2-0-275))))
 (:action navtopoint-fly_path_fly3d_done_1-fly3d-call_destroy_when_failed-1_nav-1-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_destroyed_n0) (fly3d-mode-is-failed_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-1-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-reaction_f3d_done_2_nav-1-0-275) (not (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_destroyed_n0)) (not (fly3d-mode-is-failed_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-1-0-275))))
 (:action navtopoint-fly_path_fly3d_done_1-fly3d-call_destroy_when_failed-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_destroyed_n0) (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-1-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-reaction_f3d_done_2_nav-1-0-275) (not (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_destroyed_n0)) (not (fly3d-mode-is-failed_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-reaction_f3d_done_1_nav-1-0-275))))
 (:action navtopoint-fly_path_fly3d_sync_fail-fly3d-init_fail_nav-2-0-275_f3d-2-0-370_f3d-2-0-370
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-2-0-370) (fly3d-mode-is-processing_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-2-0-275) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275)) (not (fly3d-mode-is-processing_f3d-2-0-370))))
 (:action navtopoint-fly_path_fly3d_sync_fail-fly3d-init_fail_nav-2-0-275_f3d-1-0-364_f3d-1-0-364
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-1-0-364) (fly3d-mode-is-processing_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-2-0-275) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275)) (not (fly3d-mode-is-processing_f3d-1-0-364))))
 (:action navtopoint-fly_path_fly3d_sync_fail-fly3d-init_fail_nav-1-0-275_f3d-2-0-370_f3d-2-0-370
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (fly3d-mode-is-processing_f3d-2-0-370) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fly3d-mode-is-processing_f3d-2-0-370))))
 (:action navtopoint-fly_path_fly3d_sync_fail-fly3d-init_fail_nav-1-0-275_f3d-1-0-364_f3d-1-0-364
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (fly3d-mode-is-processing_f3d-1-0-364) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fly3d-mode-is-processing_f3d-1-0-364))))
 (:action navtopoint-fly_path_fly3d_sync_fail-fly3d-fail_in_start_call_nav-2-0-275_f3d-2-0-370_f3d-2-0-370
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-2-0-370) (fly3d-in_start_call-is-yes_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-2-0-275) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275))))
 (:action navtopoint-fly_path_fly3d_sync_fail-fly3d-fail_in_start_call_nav-2-0-275_f3d-1-0-364_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-1-0-364) (fly3d-in_start_call-is-yes_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-2-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275))))
 (:action navtopoint-fly_path_fly3d_sync_fail-fly3d-fail_in_start_call_nav-1-0-275_f3d-2-0-370_f3d-2-0-370
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-2-0-370) (fly3d-in_start_call-is-yes_f3d-2-0-370) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275))))
 (:action navtopoint-fly_path_fly3d_sync_fail-fly3d-fail_in_start_call_nav-1-0-275_f3d-1-0-364_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fly3d-in_start_call-is-yes_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_turn_to_segment_heading_fail_service-1_nav-2-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-in_start_call-is-no_f3d-2-0-370) (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-2-0-275) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275)) (not (fault-count-3_lost_f3d-2-0-370_fail-service_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_turn_to_segment_heading_fail_service-1_nav-2-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-2-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275)) (not (fault-count-3_lost_f3d-1-0-364_fail-service_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_turn_to_segment_heading_fail_service-1_nav-1-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-in_start_call-is-no_f3d-2-0-370) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-2-0-370_fail-service_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_turn_to_segment_heading_fail_service-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-1-0-364_fail-service_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_turn_to_segment_heading_fail_specific_221-1_nav-2-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-in_start_call-is-no_f3d-2-0-370) (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_fail-specific-221_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-2-0-275) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275)) (not (fault-count-3_lost_f3d-2-0-370_fail-specific-221_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_turn_to_segment_heading_fail_specific_221-1_nav-2-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-specific-221_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-2-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275)) (not (fault-count-3_lost_f3d-1-0-364_fail-specific-221_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_turn_to_segment_heading_fail_specific_221-1_nav-1-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-in_start_call-is-no_f3d-2-0-370) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_fail-specific-221_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-2-0-370_fail-specific-221_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_turn_to_segment_heading_fail_specific_221-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-specific-221_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-1-0-364_fail-specific-221_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_turn_to_segment_heading_fail_specific_222-1_nav-2-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-in_start_call-is-no_f3d-2-0-370) (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_fail-specific-222_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-2-0-275) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275)) (not (fault-count-3_lost_f3d-2-0-370_fail-specific-222_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_turn_to_segment_heading_fail_specific_222-1_nav-2-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-specific-222_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-2-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275)) (not (fault-count-3_lost_f3d-1-0-364_fail-specific-222_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_turn_to_segment_heading_fail_specific_222-1_nav-1-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-in_start_call-is-no_f3d-2-0-370) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_fail-specific-222_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-2-0-370_fail-specific-222_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_turn_to_segment_heading_fail_specific_222-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-specific-222_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-1-0-364_fail-specific-222_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_turn_to_segment_heading_fail_specific_223-1_nav-2-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-in_start_call-is-no_f3d-2-0-370) (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_fail-specific-223_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-2-0-275) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275)) (not (fault-count-3_lost_f3d-2-0-370_fail-specific-223_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_turn_to_segment_heading_fail_specific_223-1_nav-2-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-specific-223_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-2-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275)) (not (fault-count-3_lost_f3d-1-0-364_fail-specific-223_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_turn_to_segment_heading_fail_specific_223-1_nav-1-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-in_start_call-is-no_f3d-2-0-370) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_fail-specific-223_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-2-0-370_fail-specific-223_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_turn_to_segment_heading_fail_specific_223-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-specific-223_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-1-0-364_fail-specific-223_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_send_starting_yaw_command_fail_service-1_nav-2-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-0-370) (fly3d-in_start_call-is-no_f3d-2-0-370) (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-2-0-275) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275)) (not (fault-count-3_lost_f3d-2-0-370_fail-service_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_send_starting_yaw_command_fail_service-1_nav-2-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-2-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275)) (not (fault-count-3_lost_f3d-1-0-364_fail-service_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_send_starting_yaw_command_fail_service-1_nav-1-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-0-370) (fly3d-in_start_call-is-no_f3d-2-0-370) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-2-0-370_fail-service_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_send_starting_yaw_command_fail_service-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-1-0-364_fail-service_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-in_send_starting_yaw_command_fcl_error_reaction1-1_nav-2-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-0-370) (fly3d-fsm_exec-is-reaction_error_1_f3d-2-0-370) (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_fail-specific-211_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-2-0-275) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275)) (not (fault-count-3_lost_f3d-2-0-370_fail-specific-211_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-in_send_starting_yaw_command_fcl_error_reaction1-1_nav-2-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364) (fly3d-fsm_exec-is-reaction_error_1_f3d-1-0-364) (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-specific-211_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-2-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275)) (not (fault-count-3_lost_f3d-1-0-364_fail-specific-211_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-in_send_starting_yaw_command_fcl_error_reaction1-1_nav-1-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-0-370) (fly3d-fsm_exec-is-reaction_error_1_f3d-2-0-370) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_fail-specific-211_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-2-0-370_fail-specific-211_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-in_send_starting_yaw_command_fcl_error_reaction1-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364) (fly3d-fsm_exec-is-reaction_error_1_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-specific-211_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-1-0-364_fail-specific-211_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-in_wait_for_yaw_finish_fcl_error_reaction1-1_nav-2-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-0-370) (fly3d-fsm_exec-is-reaction_error_1_f3d-2-0-370) (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_fail-specific-211_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-2-0-275) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275)) (not (fault-count-3_lost_f3d-2-0-370_fail-specific-211_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-in_wait_for_yaw_finish_fcl_error_reaction1-1_nav-2-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-1-0-364) (fly3d-fsm_exec-is-reaction_error_1_f3d-1-0-364) (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-specific-211_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-2-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275)) (not (fault-count-3_lost_f3d-1-0-364_fail-specific-211_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-in_wait_for_yaw_finish_fcl_error_reaction1-1_nav-1-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-0-370) (fly3d-fsm_exec-is-reaction_error_1_f3d-2-0-370) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_fail-specific-211_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-2-0-370_fail-specific-211_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-in_wait_for_yaw_finish_fcl_error_reaction1-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-1-0-364) (fly3d-fsm_exec-is-reaction_error_1_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-specific-211_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-1-0-364_fail-specific-211_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_send_first_trajectory_fail_service-1_nav-2-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370) (fly3d-in_start_call-is-no_f3d-2-0-370) (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-2-0-275) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275)) (not (fault-count-3_lost_f3d-2-0-370_fail-service_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_send_first_trajectory_fail_service-1_nav-2-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-2-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275)) (not (fault-count-3_lost_f3d-1-0-364_fail-service_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_send_first_trajectory_fail_service-1_nav-1-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370) (fly3d-in_start_call-is-no_f3d-2-0-370) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-2-0-370_fail-service_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_send_first_trajectory_fail_service-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-1-0-364_fail-service_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_send_first_trajectory_fail_specific_220-1_nav-2-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370) (fly3d-in_start_call-is-no_f3d-2-0-370) (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_fail-specific-220_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-2-0-275) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275)) (not (fault-count-3_lost_f3d-2-0-370_fail-specific-220_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_send_first_trajectory_fail_specific_220-1_nav-2-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-specific-220_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-2-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275)) (not (fault-count-3_lost_f3d-1-0-364_fail-specific-220_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_send_first_trajectory_fail_specific_220-1_nav-1-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370) (fly3d-in_start_call-is-no_f3d-2-0-370) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_fail-specific-220_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-2-0-370_fail-specific-220_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_send_first_trajectory_fail_specific_220-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-specific-220_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-1-0-364_fail-specific-220_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-in_send_first_trajectory_fcl_finished_reaction1-1_nav-2-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370) (fly3d-fsm_exec-is-reaction_finished_1_f3d-2-0-370) (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_fail-specific-213_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-2-0-275) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275)) (not (fault-count-3_lost_f3d-2-0-370_fail-specific-213_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-in_send_first_trajectory_fcl_finished_reaction1-1_nav-2-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fly3d-fsm_exec-is-reaction_finished_1_f3d-1-0-364) (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-specific-213_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-2-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275)) (not (fault-count-3_lost_f3d-1-0-364_fail-specific-213_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-in_send_first_trajectory_fcl_finished_reaction1-1_nav-1-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370) (fly3d-fsm_exec-is-reaction_finished_1_f3d-2-0-370) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_fail-specific-213_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-2-0-370_fail-specific-213_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-in_send_first_trajectory_fcl_finished_reaction1-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fly3d-fsm_exec-is-reaction_finished_1_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-specific-213_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-1-0-364_fail-specific-213_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_turn_to_goal_heading_fail_service-1_nav-2-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-in_start_call-is-no_f3d-2-0-370) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-2-0-370) (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-2-0-275) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275)) (not (fault-count-3_lost_f3d-2-0-370_fail-service_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_turn_to_goal_heading_fail_service-1_nav-2-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-1-0-364) (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-2-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275)) (not (fault-count-3_lost_f3d-1-0-364_fail-service_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_turn_to_goal_heading_fail_service-1_nav-1-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-in_start_call-is-no_f3d-2-0-370) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-2-0-370) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-2-0-370_fail-service_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_turn_to_goal_heading_fail_service-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-1-0-364_fail-service_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_turn_to_goal_heading_action2-fail-1_nav-2-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-2-0-370) (fly3d-fsm_exec-is-action2-fail_f3d-2-0-370) (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_fail-specific-214_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-2-0-275) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275)) (not (fault-count-3_lost_f3d-2-0-370_fail-specific-214_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_turn_to_goal_heading_action2-fail-1_nav-2-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action2-fail_f3d-1-0-364) (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-specific-214_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-2-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275)) (not (fault-count-3_lost_f3d-1-0-364_fail-specific-214_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_turn_to_goal_heading_action2-fail-1_nav-1-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-2-0-370) (fly3d-fsm_exec-is-action2-fail_f3d-2-0-370) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_fail-specific-214_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-2-0-370_fail-specific-214_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_turn_to_goal_heading_action2-fail-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action2-fail_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-specific-214_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-1-0-364_fail-specific-214_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_goal_point_wait_fail_service-1_nav-2-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-in_start_call-is-no_f3d-2-0-370) (fly3d-fsm_state-is-goal_point_wait_f3d-2-0-370) (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-2-0-275) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275)) (not (fault-count-3_lost_f3d-2-0-370_fail-service_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_goal_point_wait_fail_service-1_nav-2-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_state-is-goal_point_wait_f3d-1-0-364) (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-2-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275)) (not (fault-count-3_lost_f3d-1-0-364_fail-service_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_goal_point_wait_fail_service-1_nav-1-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-in_start_call-is-no_f3d-2-0-370) (fly3d-fsm_state-is-goal_point_wait_f3d-2-0-370) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-2-0-370_fail-service_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-enter_goal_point_wait_fail_service-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_state-is-goal_point_wait_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-1-0-364_fail-service_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-global_fcl_error_reaction1-1_nav-2-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-global_reaction_error_1_f3d-2-0-370) (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_fail-specific-210_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-2-0-275) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275)) (not (fault-count-3_lost_f3d-2-0-370_fail-specific-210_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-global_fcl_error_reaction1-1_nav-2-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-global_reaction_error_1_f3d-1-0-364) (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-specific-210_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-2-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-2-0-275)) (not (fault-count-3_lost_f3d-1-0-364_fail-specific-210_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-global_fcl_error_reaction1-1_nav-1-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-global_reaction_error_1_f3d-2-0-370) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_fail-specific-210_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-2-0-370_fail-specific-210_n0))))
 (:action navtopoint-fly_path_fly3d_async_fail-fly3d-global_fcl_error_reaction1-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-global_reaction_error_1_f3d-1-0-364) (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-specific-210_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-nothing_nav-1-0-275)) (not (fault-count-3_lost_f3d-1-0-364_fail-specific-210_n0))))
 (:action navtopoint-fly_path_fly3d_subtask_fail_1-fly3d-call_destroy_when_done-1_nav-2-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-2-0-370) (fly3d-mode-is-done_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_destroyed_n0) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-2-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-reaction_f3d_fail_2_nav-2-0-275) (not (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-2-0-370)) (not (fly3d-mode-is-done_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_destroyed_n0)) (not (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-2-0-275))))
 (:action navtopoint-fly_path_fly3d_subtask_fail_1-fly3d-call_destroy_when_done-1_nav-2-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-1-0-364) (fly3d-mode-is-done_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_destroyed_n0) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-2-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-reaction_f3d_fail_2_nav-2-0-275) (not (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-1-0-364)) (not (fly3d-mode-is-done_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_destroyed_n0)) (not (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-2-0-275))))
 (:action navtopoint-fly_path_fly3d_subtask_fail_1-fly3d-call_destroy_when_done-1_nav-1-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-2-0-370) (fly3d-mode-is-done_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_destroyed_n0) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-reaction_f3d_fail_2_nav-1-0-275) (not (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-2-0-370)) (not (fly3d-mode-is-done_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_destroyed_n0)) (not (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275))))
 (:action navtopoint-fly_path_fly3d_subtask_fail_1-fly3d-call_destroy_when_done-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fly3d-mode-is-done_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_destroyed_n0) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-reaction_f3d_fail_2_nav-1-0-275) (not (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364)) (not (fly3d-mode-is-done_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_destroyed_n0)) (not (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275))))
 (:action navtopoint-fly_path_fly3d_subtask_fail_1-fly3d-call_destroy_when_failed-1_nav-2-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_destroyed_n0) (fly3d-mode-is-failed_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-2-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-reaction_f3d_fail_2_nav-2-0-275) (not (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_destroyed_n0)) (not (fly3d-mode-is-failed_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-2-0-275))))
 (:action navtopoint-fly_path_fly3d_subtask_fail_1-fly3d-call_destroy_when_failed-1_nav-2-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_destroyed_n0) (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-2-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-reaction_f3d_fail_2_nav-2-0-275) (not (navtopoint-fly_trajectory_task_nav-2-0-275_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_destroyed_n0)) (not (fly3d-mode-is-failed_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-2-0-275))))
 (:action navtopoint-fly_path_fly3d_subtask_fail_1-fly3d-call_destroy_when_failed-1_nav-1-0-275_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_destroyed_n0) (fly3d-mode-is-failed_f3d-2-0-370) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-reaction_f3d_fail_2_nav-1-0-275) (not (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_destroyed_n0)) (not (fly3d-mode-is-failed_f3d-2-0-370)) (not (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275))))
 (:action navtopoint-fly_path_fly3d_subtask_fail_1-fly3d-call_destroy_when_failed-1_nav-1-0-275_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_destroyed_n0) (fly3d-mode-is-failed_f3d-1-0-364) (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_exec-is-reaction_f3d_fail_2_nav-1-0-275) (not (navtopoint-fly_trajectory_task_nav-1-0-275_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_destroyed_n0)) (not (fly3d-mode-is-failed_f3d-1-0-364)) (not (navtopoint-fsm_exec-is-reaction_f3d_fail_1_nav-1-0-275))))
 (:action missionexec-init-mission-fly3d-call_set_args_heli0_f3d-2-0-370_f3d-2-0-370_missionexecutor
  :parameters ()
  :precondition (and (fly3d-mode-is-pre_init_f3d-2-0-370) (missionexec-mission-idle_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-processing_f3d-2-0-370) (called-by_f3d-2-0-370_missionexecutor) (missionexec-active-mission_heli0_f3d-2-0-370) (missionexec-mission-init-call_heli0) (not (fly3d-mode-is-pre_init_f3d-2-0-370)) (not (missionexec-mission-idle_heli0))))
 (:action missionexec-init-mission-fly3d-call_set_args_heli0_f3d-1-0-364_f3d-1-0-364_missionexecutor
  :parameters ()
  :precondition (and (fly3d-mode-is-pre_init_f3d-1-0-364) (missionexec-mission-idle_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-processing_f3d-1-0-364) (called-by_f3d-1-0-364_missionexecutor) (missionexec-mission-init-call_heli0) (missionexec-active-mission_heli0_f3d-1-0-364) (not (fly3d-mode-is-pre_init_f3d-1-0-364)) (not (missionexec-mission-idle_heli0))))
 (:action missionexec-init-mission-autotakeoff-call_set_args_heli0_ato-1-0-275_ato-1-0-275_missionexecutor
  :parameters ()
  :precondition (and (missionexec-mission-idle_heli0) (autotakeoff-mode-is-pre_init_ato-1-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-init-call_heli0) (missionexec-active-mission_heli0_ato-1-0-275) (autotakeoff-mode-is-processing_ato-1-0-275) (called-by_ato-1-0-275_missionexecutor) (not (missionexec-mission-idle_heli0)) (not (autotakeoff-mode-is-pre_init_ato-1-0-275))))
 (:action missionexec-init-mission-basiccameracontrol-call_set_args_heli0_bcc-0-0-275_bcc-0-0-275_missionexecutor
  :parameters ()
  :precondition (and (missionexec-mission-idle_heli0) (basiccameracontrol-mode-is-pre_init_bcc-0-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-init-call_heli0) (missionexec-active-mission_heli0_bcc-0-0-275) (basiccameracontrol-mode-is-processing_bcc-0-0-275) (called-by_bcc-0-0-275_missionexecutor) (not (missionexec-mission-idle_heli0)) (not (basiccameracontrol-mode-is-pre_init_bcc-0-0-275))))
 (:action missionexec-init-mission-navtopoint-call_set_args_heli0_nav-2-0-275_nav-2-0-275_missionexecutor
  :parameters ()
  :precondition (and (missionexec-mission-idle_heli0) (navtopoint-mode-is-pre_init_nav-2-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-init-call_heli0) (missionexec-active-mission_heli0_nav-2-0-275) (navtopoint-mode-is-processing_nav-2-0-275) (called-by_nav-2-0-275_missionexecutor) (not (missionexec-mission-idle_heli0)) (not (navtopoint-mode-is-pre_init_nav-2-0-275))))
 (:action missionexec-init-mission-navtopoint-call_set_args_heli0_nav-1-0-275_nav-1-0-275_missionexecutor
  :parameters ()
  :precondition (and (missionexec-mission-idle_heli0) (navtopoint-mode-is-pre_init_nav-1-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-init-call_heli0) (missionexec-active-mission_heli0_nav-1-0-275) (navtopoint-mode-is-processing_nav-1-0-275) (called-by_nav-1-0-275_missionexecutor) (not (missionexec-mission-idle_heli0)) (not (navtopoint-mode-is-pre_init_nav-1-0-275))))
 (:action missionexec-init-mission-ok-fly3d-init_ok-1_heli0_f3d-2-0-370_f3d-2-0-370_missionexecutor_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-processing_f3d-2-0-370) (called-by_f3d-2-0-370_missionexecutor) (fault-count-4_lost_f3d-2-0-370_created_missionexecutor_n0) (missionexec-active-mission_heli0_f3d-2-0-370) (missionexec-mission-init-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-ready_f3d-2-0-370) (missionexec-mission-ready_heli0) (not (fly3d-mode-is-processing_f3d-2-0-370)) (not (fault-count-4_lost_f3d-2-0-370_created_missionexecutor_n0)) (not (missionexec-mission-init-call_heli0))))
 (:action missionexec-init-mission-ok-fly3d-init_ok-1_heli0_f3d-1-0-364_f3d-1-0-364_missionexecutor_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-processing_f3d-1-0-364) (called-by_f3d-1-0-364_missionexecutor) (fault-count-4_lost_f3d-1-0-364_created_missionexecutor_n0) (missionexec-mission-init-call_heli0) (missionexec-active-mission_heli0_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-ready_f3d-1-0-364) (missionexec-mission-ready_heli0) (not (fly3d-mode-is-processing_f3d-1-0-364)) (not (fault-count-4_lost_f3d-1-0-364_created_missionexecutor_n0)) (not (missionexec-mission-init-call_heli0))))
 (:action missionexec-init-mission-ok-autotakeoff-init_ok-0_heli0_ato-1-0-275_ato-1-0-275_missionexecutor_obs0
  :parameters ()
  :precondition (and (missionexec-mission-init-call_heli0) (missionexec-active-mission_heli0_ato-1-0-275) (autotakeoff-mode-is-processing_ato-1-0-275) (called-by_ato-1-0-275_missionexecutor) (pending_obs0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-ready_heli0) (autotakeoff-mode-is-ready_ato-1-0-275) (observed_obs0) (not (missionexec-mission-init-call_heli0)) (not (autotakeoff-mode-is-processing_ato-1-0-275)) (not (pending_obs0))))
 (:action missionexec-init-mission-ok-autotakeoff-init_ok-1_heli0_ato-1-0-275_ato-1-0-275_missionexecutor_n0_n1
  :parameters ()
  :precondition (and (missionexec-mission-init-call_heli0) (missionexec-active-mission_heli0_ato-1-0-275) (autotakeoff-mode-is-processing_ato-1-0-275) (called-by_ato-1-0-275_missionexecutor) (fault-count-4_lost_ato-1-0-275_created_missionexecutor_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-ready_heli0) (autotakeoff-mode-is-ready_ato-1-0-275) (not (missionexec-mission-init-call_heli0)) (not (autotakeoff-mode-is-processing_ato-1-0-275)) (not (fault-count-4_lost_ato-1-0-275_created_missionexecutor_n0))))
 (:action missionexec-init-mission-ok-basiccameracontrol-init_ok-0_heli0_bcc-0-0-275_bcc-0-0-275_missionexecutor_obs21
  :parameters ()
  :precondition (and (missionexec-mission-init-call_heli0) (missionexec-active-mission_heli0_bcc-0-0-275) (basiccameracontrol-mode-is-processing_bcc-0-0-275) (called-by_bcc-0-0-275_missionexecutor) (pending_obs21) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-ready_heli0) (basiccameracontrol-mode-is-ready_bcc-0-0-275) (observed_obs21) (not (missionexec-mission-init-call_heli0)) (not (basiccameracontrol-mode-is-processing_bcc-0-0-275)) (not (pending_obs21))))
 (:action missionexec-init-mission-ok-basiccameracontrol-init_ok-1_heli0_bcc-0-0-275_bcc-0-0-275_missionexecutor_n0_n1
  :parameters ()
  :precondition (and (missionexec-mission-init-call_heli0) (missionexec-active-mission_heli0_bcc-0-0-275) (basiccameracontrol-mode-is-processing_bcc-0-0-275) (called-by_bcc-0-0-275_missionexecutor) (fault-count-4_lost_bcc-0-0-275_created_missionexecutor_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-ready_heli0) (basiccameracontrol-mode-is-ready_bcc-0-0-275) (not (missionexec-mission-init-call_heli0)) (not (basiccameracontrol-mode-is-processing_bcc-0-0-275)) (not (fault-count-4_lost_bcc-0-0-275_created_missionexecutor_n0))))
 (:action missionexec-init-mission-ok-navtopoint-init_ok-0_heli0_nav-2-0-275_nav-2-0-275_missionexecutor_obs25
  :parameters ()
  :precondition (and (missionexec-mission-init-call_heli0) (missionexec-active-mission_heli0_nav-2-0-275) (navtopoint-mode-is-processing_nav-2-0-275) (called-by_nav-2-0-275_missionexecutor) (pending_obs25) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-ready_heli0) (navtopoint-mode-is-ready_nav-2-0-275) (observed_obs25) (not (missionexec-mission-init-call_heli0)) (not (navtopoint-mode-is-processing_nav-2-0-275)) (not (pending_obs25))))
 (:action missionexec-init-mission-ok-navtopoint-init_ok-0_heli0_nav-1-0-275_nav-1-0-275_missionexecutor_obs11
  :parameters ()
  :precondition (and (missionexec-mission-init-call_heli0) (missionexec-active-mission_heli0_nav-1-0-275) (navtopoint-mode-is-processing_nav-1-0-275) (called-by_nav-1-0-275_missionexecutor) (pending_obs11) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-ready_heli0) (navtopoint-mode-is-ready_nav-1-0-275) (observed_obs11) (not (missionexec-mission-init-call_heli0)) (not (navtopoint-mode-is-processing_nav-1-0-275)) (not (pending_obs11))))
 (:action missionexec-init-mission-ok-navtopoint-init_ok-1_heli0_nav-2-0-275_nav-2-0-275_missionexecutor_n0_n1
  :parameters ()
  :precondition (and (missionexec-mission-init-call_heli0) (missionexec-active-mission_heli0_nav-2-0-275) (navtopoint-mode-is-processing_nav-2-0-275) (called-by_nav-2-0-275_missionexecutor) (fault-count-4_lost_nav-2-0-275_created_missionexecutor_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-ready_heli0) (navtopoint-mode-is-ready_nav-2-0-275) (not (missionexec-mission-init-call_heli0)) (not (navtopoint-mode-is-processing_nav-2-0-275)) (not (fault-count-4_lost_nav-2-0-275_created_missionexecutor_n0))))
 (:action missionexec-init-mission-ok-navtopoint-init_ok-1_heli0_nav-1-0-275_nav-1-0-275_missionexecutor_n0_n1
  :parameters ()
  :precondition (and (missionexec-mission-init-call_heli0) (missionexec-active-mission_heli0_nav-1-0-275) (navtopoint-mode-is-processing_nav-1-0-275) (called-by_nav-1-0-275_missionexecutor) (fault-count-4_lost_nav-1-0-275_created_missionexecutor_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-ready_heli0) (navtopoint-mode-is-ready_nav-1-0-275) (not (missionexec-mission-init-call_heli0)) (not (navtopoint-mode-is-processing_nav-1-0-275)) (not (fault-count-4_lost_nav-1-0-275_created_missionexecutor_n0))))
 (:action missionexec-init-mission-fail-fly3d-init_fail_heli0_f3d-2-0-370_f3d-2-0-370
  :parameters ()
  :precondition (and (fly3d-mode-is-processing_f3d-2-0-370) (missionexec-active-mission_heli0_f3d-2-0-370) (missionexec-mission-init-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-0-370) (missionexec-mission-over_heli0) (not (fly3d-mode-is-processing_f3d-2-0-370)) (not (missionexec-mission-init-call_heli0))))
 (:action missionexec-init-mission-fail-fly3d-init_fail_heli0_f3d-1-0-364_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-processing_f3d-1-0-364) (missionexec-mission-init-call_heli0) (missionexec-active-mission_heli0_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-processing_f3d-1-0-364)) (not (missionexec-mission-init-call_heli0))))
 (:action missionexec-init-mission-fail-fly3d-fail_in_start_call_heli0_f3d-2-0-370_f3d-2-0-370
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-in_start_call-is-yes_f3d-2-0-370) (missionexec-active-mission_heli0_f3d-2-0-370) (missionexec-mission-init-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-0-370) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (missionexec-mission-init-call_heli0))))
 (:action missionexec-init-mission-fail-fly3d-fail_in_start_call_heli0_f3d-1-0-364_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-in_start_call-is-yes_f3d-1-0-364) (missionexec-mission-init-call_heli0) (missionexec-active-mission_heli0_f3d-1-0-364) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (missionexec-mission-init-call_heli0))))
 (:action missionexec-init-mission-fail-autotakeoff-init_fail_heli0_ato-1-0-275_ato-1-0-275
  :parameters ()
  :precondition (and (missionexec-mission-init-call_heli0) (missionexec-active-mission_heli0_ato-1-0-275) (autotakeoff-mode-is-processing_ato-1-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-failed_ato-1-0-275) (not (missionexec-mission-init-call_heli0)) (not (autotakeoff-mode-is-processing_ato-1-0-275))))
 (:action missionexec-init-mission-fail-autotakeoff-fail_in_start_call_heli0_ato-1-0-275_ato-1-0-275
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-in_start_call-is-yes_ato-1-0-275) (missionexec-mission-init-call_heli0) (missionexec-active-mission_heli0_ato-1-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-failed_ato-1-0-275) (not (autotakeoff-mode-is-running_ato-1-0-275)) (not (missionexec-mission-init-call_heli0))))
 (:action missionexec-init-mission-fail-basiccameracontrol-init_fail_heli0_bcc-0-0-275_bcc-0-0-275
  :parameters ()
  :precondition (and (missionexec-mission-init-call_heli0) (missionexec-active-mission_heli0_bcc-0-0-275) (basiccameracontrol-mode-is-processing_bcc-0-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (basiccameracontrol-mode-is-failed_bcc-0-0-275) (not (missionexec-mission-init-call_heli0)) (not (basiccameracontrol-mode-is-processing_bcc-0-0-275))))
 (:action missionexec-init-mission-fail-basiccameracontrol-fail_in_start_call_heli0_bcc-0-0-275_bcc-0-0-275
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (missionexec-mission-init-call_heli0) (missionexec-active-mission_heli0_bcc-0-0-275) (basiccameracontrol-in_start_call-is-yes_bcc-0-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (basiccameracontrol-mode-is-failed_bcc-0-0-275) (not (basiccameracontrol-mode-is-running_bcc-0-0-275)) (not (missionexec-mission-init-call_heli0))))
 (:action missionexec-init-mission-fail-navtopoint-init_fail_heli0_nav-2-0-275_nav-2-0-275
  :parameters ()
  :precondition (and (missionexec-mission-init-call_heli0) (missionexec-active-mission_heli0_nav-2-0-275) (navtopoint-mode-is-processing_nav-2-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-2-0-275) (not (missionexec-mission-init-call_heli0)) (not (navtopoint-mode-is-processing_nav-2-0-275))))
 (:action missionexec-init-mission-fail-navtopoint-init_fail_heli0_nav-1-0-275_nav-1-0-275
  :parameters ()
  :precondition (and (missionexec-mission-init-call_heli0) (missionexec-active-mission_heli0_nav-1-0-275) (navtopoint-mode-is-processing_nav-1-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-1-0-275) (not (missionexec-mission-init-call_heli0)) (not (navtopoint-mode-is-processing_nav-1-0-275))))
 (:action missionexec-init-mission-fail-navtopoint-fail_in_start_call_heli0_nav-2-0-275_nav-2-0-275
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-2-0-275) (missionexec-mission-init-call_heli0) (missionexec-active-mission_heli0_nav-2-0-275) (navtopoint-in_start_call-is-yes_nav-2-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-2-0-275) (not (navtopoint-mode-is-running_nav-2-0-275)) (not (missionexec-mission-init-call_heli0))))
 (:action missionexec-init-mission-fail-navtopoint-fail_in_start_call_heli0_nav-1-0-275_nav-1-0-275
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (missionexec-mission-init-call_heli0) (missionexec-active-mission_heli0_nav-1-0-275) (navtopoint-in_start_call-is-yes_nav-1-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-1-0-275) (not (navtopoint-mode-is-running_nav-1-0-275)) (not (missionexec-mission-init-call_heli0))))
 (:action missionexec-start-mission-fly3d-call_start_heli0_f3d-2-0-370_f3d-2-0-370
  :parameters ()
  :precondition (and (fly3d-mode-is-ready_f3d-2-0-370) (missionexec-active-mission_heli0_f3d-2-0-370) (missionexec-mission-ready_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-start_f3d-2-0-370) (fly3d-in_start_call-is-yes_f3d-2-0-370) (missionexec-mission-start-call_heli0) (not (fly3d-mode-is-ready_f3d-2-0-370)) (not (missionexec-mission-ready_heli0))))
 (:action missionexec-start-mission-fly3d-call_start_heli0_f3d-1-0-364_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-ready_f3d-1-0-364) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-ready_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-start_f3d-1-0-364) (fly3d-in_start_call-is-yes_f3d-1-0-364) (missionexec-mission-start-call_heli0) (not (fly3d-mode-is-ready_f3d-1-0-364)) (not (missionexec-mission-ready_heli0))))
 (:action missionexec-start-mission-autotakeoff-call_start_heli0_ato-1-0-275_ato-1-0-275
  :parameters ()
  :precondition (and (missionexec-active-mission_heli0_ato-1-0-275) (missionexec-mission-ready_heli0) (autotakeoff-mode-is-ready_ato-1-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_exec-is-start_ato-1-0-275) (autotakeoff-in_start_call-is-yes_ato-1-0-275) (missionexec-mission-start-call_heli0) (not (missionexec-mission-ready_heli0)) (not (autotakeoff-mode-is-ready_ato-1-0-275))))
 (:action missionexec-start-mission-basiccameracontrol-call_start_heli0_bcc-0-0-275_bcc-0-0-275
  :parameters ()
  :precondition (and (missionexec-active-mission_heli0_bcc-0-0-275) (missionexec-mission-ready_heli0) (basiccameracontrol-mode-is-ready_bcc-0-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-start_bcc-0-0-275) (basiccameracontrol-in_start_call-is-yes_bcc-0-0-275) (missionexec-mission-start-call_heli0) (not (missionexec-mission-ready_heli0)) (not (basiccameracontrol-mode-is-ready_bcc-0-0-275))))
 (:action missionexec-start-mission-navtopoint-call_start_heli0_nav-2-0-275_nav-2-0-275
  :parameters ()
  :precondition (and (missionexec-active-mission_heli0_nav-2-0-275) (missionexec-mission-ready_heli0) (navtopoint-mode-is-ready_nav-2-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-in_start_call-is-yes_nav-2-0-275) (missionexec-mission-start-call_heli0) (navtopoint-fsm_exec-is-start_nav-2-0-275) (not (missionexec-mission-ready_heli0)) (not (navtopoint-mode-is-ready_nav-2-0-275))))
 (:action missionexec-start-mission-navtopoint-call_start_heli0_nav-1-0-275_nav-1-0-275
  :parameters ()
  :precondition (and (missionexec-active-mission_heli0_nav-1-0-275) (missionexec-mission-ready_heli0) (navtopoint-mode-is-ready_nav-1-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-in_start_call-is-yes_nav-1-0-275) (missionexec-mission-start-call_heli0) (navtopoint-fsm_exec-is-start_nav-1-0-275) (not (missionexec-mission-ready_heli0)) (not (navtopoint-mode-is-ready_nav-1-0-275))))
 (:action missionexec-start-mission-ok-fly3d-enter_send_starting_yaw_command_ok_sync_heli0_f3d-2-0-370_f3d-2-0-370
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-0-370) (fly3d-in_start_call-is-yes_f3d-2-0-370) (missionexec-active-mission_heli0_f3d-2-0-370) (missionexec-mission-start-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-2-0-370) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (missionexec-mission-running_heli0) (not (fly3d-fsm_exec-is-action1_f3d-2-0-370)) (not (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-0-370)) (not (fly3d-in_start_call-is-yes_f3d-2-0-370)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-ok-fly3d-enter_send_starting_yaw_command_ok_sync_heli0_f3d-1-0-364_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364) (fly3d-in_start_call-is-yes_f3d-1-0-364) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-start-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (missionexec-mission-running_heli0) (not (fly3d-fsm_exec-is-action1_f3d-1-0-364)) (not (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364)) (not (fly3d-in_start_call-is-yes_f3d-1-0-364)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-ok-fly3d-enter_send_starting_yaw_command_checkpoint12_sync-1_heli0_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_checkpoint12_n0) (fly3d-in_start_call-is-yes_f3d-2-0-370) (missionexec-active-mission_heli0_f3d-2-0-370) (missionexec-mission-start-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (missionexec-mission-running_heli0) (not (fly3d-fsm_exec-is-action1_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_checkpoint12_n0)) (not (fly3d-in_start_call-is-yes_f3d-2-0-370)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-ok-fly3d-enter_send_starting_yaw_command_checkpoint12_sync-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint12_n0) (fly3d-in_start_call-is-yes_f3d-1-0-364) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-start-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (missionexec-mission-running_heli0) (not (fly3d-fsm_exec-is-action1_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_checkpoint12_n0)) (not (fly3d-in_start_call-is-yes_f3d-1-0-364)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-ok-fly3d-enter_send_first_trajectory_checkpoint20_sync-1_heli0_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_checkpoint20_n0) (fly3d-in_start_call-is-yes_f3d-2-0-370) (missionexec-active-mission_heli0_f3d-2-0-370) (missionexec-mission-start-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (missionexec-mission-running_heli0) (not (fly3d-fsm_exec-is-action1_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_checkpoint20_n0)) (not (fly3d-trajectory-not-sent_f3d-2-0-370)) (not (fly3d-in_start_call-is-yes_f3d-2-0-370)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-ok-fly3d-enter_send_first_trajectory_checkpoint20_sync-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint20_n0) (fly3d-in_start_call-is-yes_f3d-1-0-364) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-start-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (missionexec-mission-running_heli0) (not (fly3d-fsm_exec-is-action1_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_checkpoint20_n0)) (not (fly3d-trajectory-not-sent_f3d-1-0-364)) (not (fly3d-in_start_call-is-yes_f3d-1-0-364)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-ok-fly3d-enter_send_first_trajectory_checkpoint21_sync-1_heli0_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_checkpoint21_n0) (fly3d-in_start_call-is-yes_f3d-2-0-370) (missionexec-active-mission_heli0_f3d-2-0-370) (missionexec-mission-start-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-0-370) (missionexec-mission-running_heli0) (not (fly3d-fsm_exec-is-action1_f3d-2-0-370)) (not (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370)) (not (fly3d-trajectory-not-sent_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_checkpoint21_n0)) (not (fly3d-in_start_call-is-yes_f3d-2-0-370)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-ok-fly3d-enter_send_first_trajectory_checkpoint21_sync-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint21_n0) (fly3d-in_start_call-is-yes_f3d-1-0-364) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-start-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-1-0-364) (missionexec-mission-running_heli0) (not (fly3d-fsm_exec-is-action1_f3d-1-0-364)) (not (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364)) (not (fly3d-trajectory-not-sent_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_checkpoint21_n0)) (not (fly3d-in_start_call-is-yes_f3d-1-0-364)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-ok-fly3d-enter_send_first_trajectory_checkpoint21_after22_sync-1_heli0_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_checkpoint21_n0) (fly3d-fsm_exec-is-action2_f3d-2-0-370) (fly3d-in_start_call-is-yes_f3d-2-0-370) (missionexec-active-mission_heli0_f3d-2-0-370) (missionexec-mission-start-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-0-370) (missionexec-mission-running_heli0) (not (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370)) (not (fly3d-trajectory-not-sent_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_checkpoint21_n0)) (not (fly3d-fsm_exec-is-action2_f3d-2-0-370)) (not (fly3d-in_start_call-is-yes_f3d-2-0-370)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-ok-fly3d-enter_send_first_trajectory_checkpoint21_after22_sync-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_checkpoint21_n0) (fly3d-fsm_exec-is-action2_f3d-1-0-364) (fly3d-in_start_call-is-yes_f3d-1-0-364) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-start-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-1-0-364) (missionexec-mission-running_heli0) (not (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364)) (not (fly3d-trajectory-not-sent_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_checkpoint21_n0)) (not (fly3d-fsm_exec-is-action2_f3d-1-0-364)) (not (fly3d-in_start_call-is-yes_f3d-1-0-364)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-ok-fly3d-enter_send_first_trajectory_busy_sync_heli0_f3d-2-0-370_f3d-2-0-370
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370) (fly3d-in_start_call-is-yes_f3d-2-0-370) (missionexec-active-mission_heli0_f3d-2-0-370) (missionexec-mission-start-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (fly3d-trajectory-not-sent_f3d-2-0-370) (missionexec-mission-running_heli0) (not (fly3d-fsm_exec-is-action1_f3d-2-0-370)) (not (fly3d-in_start_call-is-yes_f3d-2-0-370)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-ok-fly3d-enter_send_first_trajectory_busy_sync_heli0_f3d-1-0-364_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fly3d-in_start_call-is-yes_f3d-1-0-364) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-start-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-trajectory-not-sent_f3d-1-0-364) (missionexec-mission-running_heli0) (not (fly3d-fsm_exec-is-action1_f3d-1-0-364)) (not (fly3d-in_start_call-is-yes_f3d-1-0-364)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-ok-fly3d-enter_send_first_trajectory_busy_after22_sync_heli0_f3d-2-0-370_f3d-2-0-370
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370) (fly3d-fsm_exec-is-action2_f3d-2-0-370) (fly3d-in_start_call-is-yes_f3d-2-0-370) (missionexec-active-mission_heli0_f3d-2-0-370) (missionexec-mission-start-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (fly3d-trajectory-not-sent_f3d-2-0-370) (missionexec-mission-running_heli0) (not (fly3d-fsm_exec-is-action2_f3d-2-0-370)) (not (fly3d-in_start_call-is-yes_f3d-2-0-370)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-ok-fly3d-enter_send_first_trajectory_busy_after22_sync_heli0_f3d-1-0-364_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fly3d-fsm_exec-is-action2_f3d-1-0-364) (fly3d-in_start_call-is-yes_f3d-1-0-364) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-start-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-trajectory-not-sent_f3d-1-0-364) (missionexec-mission-running_heli0) (not (fly3d-fsm_exec-is-action2_f3d-1-0-364)) (not (fly3d-in_start_call-is-yes_f3d-1-0-364)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-ok-autotakeoff-takeoff_action2_heli0_ato-1-0-275_ato-1-0-275
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_state-is-takeoff_ato-1-0-275) (autotakeoff-in_start_call-is-yes_ato-1-0-275) (autotakeoff-fsm_exec-is-action2_ato-1-0-275) (missionexec-active-mission_heli0_ato-1-0-275) (missionexec-mission-start-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (autotakeoff-fsm_exec-is-nothing_ato-1-0-275) (autotakeoff-in_start_call-is-no_ato-1-0-275) (missionexec-mission-running_heli0) (not (autotakeoff-in_start_call-is-yes_ato-1-0-275)) (not (autotakeoff-fsm_exec-is-action2_ato-1-0-275)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-ok-basiccameracontrol-seq_position_command_wait_1_heli0_bcc-0-0-275_bcc-0-0-275
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-seq_position_command_bcc-0-0-275) (missionexec-active-mission_heli0_bcc-0-0-275) (basiccameracontrol-in_start_call-is-yes_bcc-0-0-275) (missionexec-mission-start-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-in_start_call-is-no_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275) (missionexec-mission-running_heli0) (not (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275)) (not (basiccameracontrol-in_start_call-is-yes_bcc-0-0-275)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-ok-basiccameracontrol-seq_bearing_command_wait_1_heli0_bcc-0-0-275_bcc-0-0-275
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-seq_bearing_command_bcc-0-0-275) (missionexec-active-mission_heli0_bcc-0-0-275) (basiccameracontrol-in_start_call-is-yes_bcc-0-0-275) (missionexec-mission-start-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-in_start_call-is-no_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275) (missionexec-mission-running_heli0) (not (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275)) (not (basiccameracontrol-in_start_call-is-yes_bcc-0-0-275)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-ok-basiccameracontrol-converge_wait_wait_1_heli0_bcc-0-0-275_bcc-0-0-275
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-converge_wait_bcc-0-0-275) (missionexec-active-mission_heli0_bcc-0-0-275) (basiccameracontrol-in_start_call-is-yes_bcc-0-0-275) (missionexec-mission-start-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-in_start_call-is-no_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275) (missionexec-mission-running_heli0) (not (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275)) (not (basiccameracontrol-in_start_call-is-yes_bcc-0-0-275)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-ok-basiccameracontrol-converge_final_wait_wait_1_heli0_bcc-0-0-275_bcc-0-0-275
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-converge_final_wait_bcc-0-0-275) (missionexec-active-mission_heli0_bcc-0-0-275) (basiccameracontrol-in_start_call-is-yes_bcc-0-0-275) (missionexec-mission-start-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-in_start_call-is-no_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275) (missionexec-mission-running_heli0) (not (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275)) (not (basiccameracontrol-in_start_call-is-yes_bcc-0-0-275)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-ok-basiccameracontrol-seq_turn_command_wait_1_heli0_bcc-0-0-275_bcc-0-0-275
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-seq_turn_command_bcc-0-0-275) (missionexec-active-mission_heli0_bcc-0-0-275) (basiccameracontrol-in_start_call-is-yes_bcc-0-0-275) (missionexec-mission-start-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-in_start_call-is-no_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275) (missionexec-mission-running_heli0) (not (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275)) (not (basiccameracontrol-in_start_call-is-yes_bcc-0-0-275)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-ok-basiccameracontrol-seq_lock_command_wait_1_heli0_bcc-0-0-275_bcc-0-0-275
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-seq_lock_command_bcc-0-0-275) (missionexec-active-mission_heli0_bcc-0-0-275) (basiccameracontrol-in_start_call-is-yes_bcc-0-0-275) (missionexec-mission-start-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-in_start_call-is-no_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275) (missionexec-mission-running_heli0) (not (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275)) (not (basiccameracontrol-in_start_call-is-yes_bcc-0-0-275)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-ok-basiccameracontrol-locked_camera_mode_action2a_heli0_bcc-0-0-275_bcc-0-0-275
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action2_bcc-0-0-275) (basiccameracontrol-fsm_state-is-locked_camera_mode_bcc-0-0-275) (missionexec-active-mission_heli0_bcc-0-0-275) (basiccameracontrol-in_start_call-is-yes_bcc-0-0-275) (missionexec-mission-start-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-in_start_call-is-no_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275) (missionexec-mission-running_heli0) (not (basiccameracontrol-fsm_exec-is-action2_bcc-0-0-275)) (not (basiccameracontrol-in_start_call-is-yes_bcc-0-0-275)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-ok-basiccameracontrol-not_in_control_action2_1_heli0_bcc-0-0-275_bcc-0-0-275
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_state-is-not_in_control_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action2_bcc-0-0-275) (missionexec-active-mission_heli0_bcc-0-0-275) (basiccameracontrol-in_start_call-is-yes_bcc-0-0-275) (missionexec-mission-start-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (basiccameracontrol-in_start_call-is-no_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275) (missionexec-mission-running_heli0) (not (basiccameracontrol-fsm_exec-is-action2_bcc-0-0-275)) (not (basiccameracontrol-in_start_call-is-yes_bcc-0-0-275)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-ok-navtopoint-start_ok_heli0_nav-2-0-275_nav-2-0-275
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-2-0-275) (missionexec-active-mission_heli0_nav-2-0-275) (missionexec-mission-start-call_heli0) (navtopoint-fsm_exec-is-start_nav-2-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_state-is-start_decouple_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-in_start_call-is-no_nav-2-0-275) (missionexec-mission-running_heli0) (not (navtopoint-in_start_call-is-yes_nav-2-0-275)) (not (missionexec-mission-start-call_heli0)) (not (navtopoint-fsm_exec-is-start_nav-2-0-275))))
 (:action missionexec-start-mission-ok-navtopoint-start_ok_heli0_nav-1-0-275_nav-1-0-275
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (missionexec-active-mission_heli0_nav-1-0-275) (missionexec-mission-start-call_heli0) (navtopoint-fsm_exec-is-start_nav-1-0-275) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (navtopoint-fsm_state-is-start_decouple_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-in_start_call-is-no_nav-1-0-275) (missionexec-mission-running_heli0) (not (navtopoint-in_start_call-is-yes_nav-1-0-275)) (not (missionexec-mission-start-call_heli0)) (not (navtopoint-fsm_exec-is-start_nav-1-0-275))))
 (:action missionexec-start-mission-done-fly3d-start_exit_heli0_f3d-2-0-370_f3d-2-0-370
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-start_f3d-2-0-370) (missionexec-active-mission_heli0_f3d-2-0-370) (missionexec-mission-start-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-0-370) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-done-fly3d-start_exit_heli0_f3d-1-0-364_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-start_f3d-1-0-364) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-start-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-done-basiccameracontrol-not_in_control_exit_1_heli0_bcc-0-0-275_bcc-0-0-275
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-not_in_control_bcc-0-0-275) (missionexec-active-mission_heli0_bcc-0-0-275) (basiccameracontrol-in_start_call-is-yes_bcc-0-0-275) (missionexec-mission-start-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (basiccameracontrol-mode-is-done_bcc-0-0-275) (not (basiccameracontrol-mode-is-running_bcc-0-0-275)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-fail-fly3d-init_fail_heli0_f3d-2-0-370_f3d-2-0-370
  :parameters ()
  :precondition (and (fly3d-mode-is-processing_f3d-2-0-370) (missionexec-active-mission_heli0_f3d-2-0-370) (missionexec-mission-start-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-0-370) (missionexec-mission-over_heli0) (not (fly3d-mode-is-processing_f3d-2-0-370)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-fail-fly3d-init_fail_heli0_f3d-1-0-364_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-processing_f3d-1-0-364) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-start-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-processing_f3d-1-0-364)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-fail-fly3d-fail_in_start_call_heli0_f3d-2-0-370_f3d-2-0-370
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-in_start_call-is-yes_f3d-2-0-370) (missionexec-active-mission_heli0_f3d-2-0-370) (missionexec-mission-start-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-0-370) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-fail-fly3d-fail_in_start_call_heli0_f3d-1-0-364_f3d-1-0-364
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-in_start_call-is-yes_f3d-1-0-364) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-start-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-fail-autotakeoff-init_fail_heli0_ato-1-0-275_ato-1-0-275
  :parameters ()
  :precondition (and (missionexec-active-mission_heli0_ato-1-0-275) (autotakeoff-mode-is-processing_ato-1-0-275) (missionexec-mission-start-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-failed_ato-1-0-275) (not (autotakeoff-mode-is-processing_ato-1-0-275)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-fail-autotakeoff-fail_in_start_call_heli0_ato-1-0-275_ato-1-0-275
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-in_start_call-is-yes_ato-1-0-275) (missionexec-active-mission_heli0_ato-1-0-275) (missionexec-mission-start-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-failed_ato-1-0-275) (not (autotakeoff-mode-is-running_ato-1-0-275)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-fail-basiccameracontrol-init_fail_heli0_bcc-0-0-275_bcc-0-0-275
  :parameters ()
  :precondition (and (missionexec-active-mission_heli0_bcc-0-0-275) (basiccameracontrol-mode-is-processing_bcc-0-0-275) (missionexec-mission-start-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (basiccameracontrol-mode-is-failed_bcc-0-0-275) (not (basiccameracontrol-mode-is-processing_bcc-0-0-275)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-fail-basiccameracontrol-fail_in_start_call_heli0_bcc-0-0-275_bcc-0-0-275
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (missionexec-active-mission_heli0_bcc-0-0-275) (basiccameracontrol-in_start_call-is-yes_bcc-0-0-275) (missionexec-mission-start-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (basiccameracontrol-mode-is-failed_bcc-0-0-275) (not (basiccameracontrol-mode-is-running_bcc-0-0-275)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-fail-navtopoint-init_fail_heli0_nav-2-0-275_nav-2-0-275
  :parameters ()
  :precondition (and (missionexec-active-mission_heli0_nav-2-0-275) (navtopoint-mode-is-processing_nav-2-0-275) (missionexec-mission-start-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-2-0-275) (not (navtopoint-mode-is-processing_nav-2-0-275)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-fail-navtopoint-init_fail_heli0_nav-1-0-275_nav-1-0-275
  :parameters ()
  :precondition (and (missionexec-active-mission_heli0_nav-1-0-275) (navtopoint-mode-is-processing_nav-1-0-275) (missionexec-mission-start-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-1-0-275) (not (navtopoint-mode-is-processing_nav-1-0-275)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-fail-navtopoint-fail_in_start_call_heli0_nav-2-0-275_nav-2-0-275
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-2-0-275) (missionexec-active-mission_heli0_nav-2-0-275) (navtopoint-in_start_call-is-yes_nav-2-0-275) (missionexec-mission-start-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-2-0-275) (not (navtopoint-mode-is-running_nav-2-0-275)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-start-mission-fail-navtopoint-fail_in_start_call_heli0_nav-1-0-275_nav-1-0-275
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (missionexec-active-mission_heli0_nav-1-0-275) (navtopoint-in_start_call-is-yes_nav-1-0-275) (missionexec-mission-start-call_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-1-0-275) (not (navtopoint-mode-is-running_nav-1-0-275)) (not (missionexec-mission-start-call_heli0))))
 (:action missionexec-mission-done-fly3d-in_send_starting_yaw_command_fcl_cancel_reaction1-1_heli0_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-0-370) (fly3d-fsm_exec-is-reaction_cancel_1_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_task-done_n0) (missionexec-active-mission_heli0_f3d-2-0-370) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-0-370) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_task-done_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-done-fly3d-in_send_starting_yaw_command_fcl_cancel_reaction1-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364) (fly3d-fsm_exec-is-reaction_cancel_1_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_task-done_n0) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_task-done_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-done-fly3d-in_wait_for_yaw_finish_fcl_cancel_reaction1-1_heli0_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-0-370) (fly3d-fsm_exec-is-reaction_cancel_1_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_task-done_n0) (missionexec-active-mission_heli0_f3d-2-0-370) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-0-370) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_task-done_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-done-fly3d-in_wait_for_yaw_finish_fcl_cancel_reaction1-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-1-0-364) (fly3d-fsm_exec-is-reaction_cancel_1_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_task-done_n0) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_task-done_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-done-fly3d-in_wait_trajectory_end_fcl_finished_reaction2c-1_heli0_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-wait_trajectory_end_f3d-2-0-370) (fly3d-fsm_exec-is-reaction_finished_2_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_task-done_n0) (missionexec-active-mission_heli0_f3d-2-0-370) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-0-370) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_task-done_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-done-fly3d-in_wait_trajectory_end_fcl_finished_reaction2c-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-wait_trajectory_end_f3d-1-0-364) (fly3d-fsm_exec-is-reaction_finished_2_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_task-done_n0) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_task-done_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-done-fly3d-enter_turn_to_goal_heading_action2-exit-1_heli0_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-2-0-370) (fly3d-fsm_exec-is-action2-exit_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_task-done_n0) (missionexec-active-mission_heli0_f3d-2-0-370) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-0-370) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_task-done_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-done-fly3d-enter_turn_to_goal_heading_action2-exit-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action2-exit_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_task-done_n0) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_task-done_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-done-fly3d-goal_point_wait_cmd_continue_exit-1_heli0_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (fly3d-fsm_state-is-goal_point_wait_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_task-done_n0) (missionexec-active-mission_heli0_f3d-2-0-370) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-0-370) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_task-done_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-done-fly3d-goal_point_wait_cmd_continue_exit-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-fsm_state-is-goal_point_wait_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_task-done_n0) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_task-done_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-done-fly3d-goal_point_wait_idle_exit-1_heli0_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-nothing_f3d-2-0-370) (fly3d-fsm_state-is-goal_point_wait_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_task-done_n0) (missionexec-active-mission_heli0_f3d-2-0-370) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-0-370) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_task-done_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-done-fly3d-goal_point_wait_idle_exit-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-nothing_f3d-1-0-364) (fly3d-fsm_state-is-goal_point_wait_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_task-done_n0) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_task-done_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-done-fly3d-global_fcl_cancel_reaction1-1_heli0_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-global_reaction_cancel_1_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_task-done_n0) (missionexec-active-mission_heli0_f3d-2-0-370) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-2-0-370) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_task-done_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-done-fly3d-global_fcl_cancel_reaction1-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-global_reaction_cancel_1_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_task-done_n0) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-done_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_task-done_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-done-autotakeoff-takeoff_fcl_cancel_reaction1-1_heli0_ato-1-0-275_ato-1-0-275_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_state-is-takeoff_ato-1-0-275) (autotakeoff-fsm_exec-is-reaction_cancel_1_ato-1-0-275) (missionexec-active-mission_heli0_ato-1-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_ato-1-0-275_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-done_ato-1-0-275) (not (autotakeoff-mode-is-running_ato-1-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_ato-1-0-275_task-done_n0)) (not (dominates-3_hyp2_lost_ato-1-0-275_task-done)) (not (dominates-3_hyp1_lost_ato-1-0-275_task-done))))
 (:action missionexec-mission-done-autotakeoff-go_to_final_altitude_action2_exit-1_heli0_ato-1-0-275_ato-1-0-275_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-1-0-275) (autotakeoff-in_start_call-is-no_ato-1-0-275) (autotakeoff-fsm_exec-is-action2-exit_ato-1-0-275) (missionexec-active-mission_heli0_ato-1-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_ato-1-0-275_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-done_ato-1-0-275) (not (autotakeoff-mode-is-running_ato-1-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_ato-1-0-275_task-done_n0)) (not (dominates-3_hyp2_lost_ato-1-0-275_task-done)) (not (dominates-3_hyp1_lost_ato-1-0-275_task-done))))
 (:action missionexec-mission-done-autotakeoff-go_to_final_altitude_fcl_finished_reaction2-1_heli0_ato-1-0-275_ato-1-0-275_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-1-0-275) (autotakeoff-fsm_exec-is-reaction_finished_2_ato-1-0-275) (missionexec-active-mission_heli0_ato-1-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_ato-1-0-275_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-done_ato-1-0-275) (not (autotakeoff-mode-is-running_ato-1-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_ato-1-0-275_task-done_n0)) (not (dominates-3_hyp2_lost_ato-1-0-275_task-done)) (not (dominates-3_hyp1_lost_ato-1-0-275_task-done))))
 (:action missionexec-mission-done-autotakeoff-go_to_final_altitude_fcl_cancel_reaction1-1_heli0_ato-1-0-275_ato-1-0-275_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-1-0-275) (autotakeoff-fsm_exec-is-reaction_cancel_1_ato-1-0-275) (missionexec-active-mission_heli0_ato-1-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_ato-1-0-275_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-done_ato-1-0-275) (not (autotakeoff-mode-is-running_ato-1-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_ato-1-0-275_task-done_n0)) (not (dominates-3_hyp2_lost_ato-1-0-275_task-done)) (not (dominates-3_hyp1_lost_ato-1-0-275_task-done))))
 (:action missionexec-mission-done-basiccameracontrol-tracking_idle_exit-1_heli0_bcc-0-0-275_bcc-0-0-275_n0_n1
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275) (basiccameracontrol-fsm_state-is-tracking_bcc-0-0-275) (missionexec-active-mission_heli0_bcc-0-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_bcc-0-0-275_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (basiccameracontrol-mode-is-done_bcc-0-0-275) (not (basiccameracontrol-mode-is-running_bcc-0-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_bcc-0-0-275_task-done_n0))))
 (:action missionexec-mission-done-basiccameracontrol-locked_camera_mode_idle_exit-1_heli0_bcc-0-0-275_bcc-0-0-275_n0_n1
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275) (basiccameracontrol-fsm_state-is-locked_camera_mode_bcc-0-0-275) (missionexec-active-mission_heli0_bcc-0-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_bcc-0-0-275_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (basiccameracontrol-mode-is-done_bcc-0-0-275) (not (basiccameracontrol-mode-is-running_bcc-0-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_bcc-0-0-275_task-done_n0))))
 (:action missionexec-mission-done-basiccameracontrol-not_in_control_exit_2-1_heli0_bcc-0-0-275_bcc-0-0-275_n0_n1
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-not_in_control_bcc-0-0-275) (basiccameracontrol-in_start_call-is-no_bcc-0-0-275) (missionexec-active-mission_heli0_bcc-0-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_bcc-0-0-275_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (basiccameracontrol-mode-is-done_bcc-0-0-275) (not (basiccameracontrol-mode-is-running_bcc-0-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_bcc-0-0-275_task-done_n0))))
 (:action missionexec-mission-done-basiccameracontrol-global_cmd_stop-1_heli0_bcc-0-0-275_bcc-0-0-275_n0_n1
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275) (missionexec-active-mission_heli0_bcc-0-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_bcc-0-0-275_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (basiccameracontrol-mode-is-done_bcc-0-0-275) (not (basiccameracontrol-mode-is-running_bcc-0-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_bcc-0-0-275_task-done_n0))))
 (:action missionexec-mission-done-navtopoint-wait_for_go_exit-1_heli0_nav-2-0-275_nav-2-0-275_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-nothing_nav-2-0-275) (navtopoint-fsm_state-is-wait_for_go_nav-2-0-275) (missionexec-active-mission_heli0_nav-2-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-2-0-275_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-done_nav-2-0-275) (not (navtopoint-mode-is-running_nav-2-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-2-0-275_task-done_n0))))
 (:action missionexec-mission-done-navtopoint-wait_for_go_exit-1_heli0_nav-1-0-275_nav-1-0-275_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-nothing_nav-1-0-275) (navtopoint-fsm_state-is-wait_for_go_nav-1-0-275) (missionexec-active-mission_heli0_nav-1-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-1-0-275_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-done_nav-1-0-275) (not (navtopoint-mode-is-running_nav-1-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-1-0-275_task-done_n0)) (not (dominates-3_hyp2_lost_nav-1-0-275_task-done)) (not (dominates-3_hyp1_lost_nav-1-0-275_task-done))))
 (:action missionexec-mission-done-navtopoint-fly_path_fly3d_done_2-1_heli0_nav-2-0-275_nav-2-0-275_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fsm_exec-is-reaction_f3d_done_2_nav-2-0-275) (missionexec-active-mission_heli0_nav-2-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-2-0-275_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-done_nav-2-0-275) (not (navtopoint-mode-is-running_nav-2-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-2-0-275_task-done_n0))))
 (:action missionexec-mission-done-navtopoint-fly_path_fly3d_done_2-1_heli0_nav-1-0-275_nav-1-0-275_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fsm_exec-is-reaction_f3d_done_2_nav-1-0-275) (missionexec-active-mission_heli0_nav-1-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-1-0-275_task-done_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-done_nav-1-0-275) (not (navtopoint-mode-is-running_nav-1-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-1-0-275_task-done_n0)) (not (dominates-3_hyp2_lost_nav-1-0-275_task-done)) (not (dominates-3_hyp1_lost_nav-1-0-275_task-done))))
 (:action missionexec-mission-failed-fly3d-enter_turn_to_segment_heading_fail_service-1_heli0_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-in_start_call-is-no_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_fail-service_n0) (missionexec-active-mission_heli0_f3d-2-0-370) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-0-370) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_fail-service_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-enter_turn_to_segment_heading_fail_service-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-service_n0) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_fail-service_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-enter_turn_to_segment_heading_fail_specific_221-1_heli0_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-in_start_call-is-no_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_fail-specific-221_n0) (missionexec-active-mission_heli0_f3d-2-0-370) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-0-370) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_fail-specific-221_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-enter_turn_to_segment_heading_fail_specific_221-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-specific-221_n0) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_fail-specific-221_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-enter_turn_to_segment_heading_fail_specific_222-1_heli0_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-in_start_call-is-no_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_fail-specific-222_n0) (missionexec-active-mission_heli0_f3d-2-0-370) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-0-370) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_fail-specific-222_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-enter_turn_to_segment_heading_fail_specific_222-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-specific-222_n0) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_fail-specific-222_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-enter_turn_to_segment_heading_fail_specific_223-1_heli0_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-in_start_call-is-no_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_fail-specific-223_n0) (missionexec-active-mission_heli0_f3d-2-0-370) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-0-370) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_fail-specific-223_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-enter_turn_to_segment_heading_fail_specific_223-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_segment_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-specific-223_n0) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_fail-specific-223_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-enter_send_starting_yaw_command_fail_service-1_heli0_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-0-370) (fly3d-in_start_call-is-no_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_fail-service_n0) (missionexec-active-mission_heli0_f3d-2-0-370) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-0-370) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_fail-service_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-enter_send_starting_yaw_command_fail_service-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-service_n0) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_fail-service_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-in_send_starting_yaw_command_fcl_error_reaction1-1_heli0_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-2-0-370) (fly3d-fsm_exec-is-reaction_error_1_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_fail-specific-211_n0) (missionexec-active-mission_heli0_f3d-2-0-370) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-0-370) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_fail-specific-211_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-in_send_starting_yaw_command_fcl_error_reaction1-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_starting_yaw_command_f3d-1-0-364) (fly3d-fsm_exec-is-reaction_error_1_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-specific-211_n0) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_fail-specific-211_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-in_wait_for_yaw_finish_fcl_error_reaction1-1_heli0_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-2-0-370) (fly3d-fsm_exec-is-reaction_error_1_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_fail-specific-211_n0) (missionexec-active-mission_heli0_f3d-2-0-370) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-0-370) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_fail-specific-211_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-in_wait_for_yaw_finish_fcl_error_reaction1-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-wait_for_yaw_finish_f3d-1-0-364) (fly3d-fsm_exec-is-reaction_error_1_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-specific-211_n0) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_fail-specific-211_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-enter_send_first_trajectory_fail_service-1_heli0_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370) (fly3d-in_start_call-is-no_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_fail-service_n0) (missionexec-active-mission_heli0_f3d-2-0-370) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-0-370) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_fail-service_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-enter_send_first_trajectory_fail_service-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-service_n0) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_fail-service_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-enter_send_first_trajectory_fail_specific_220-1_heli0_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370) (fly3d-in_start_call-is-no_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_fail-specific-220_n0) (missionexec-active-mission_heli0_f3d-2-0-370) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-0-370) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_fail-specific-220_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-enter_send_first_trajectory_fail_specific_220-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-specific-220_n0) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_fail-specific-220_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-in_send_first_trajectory_fcl_finished_reaction1-1_heli0_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-send_first_trajectory_f3d-2-0-370) (fly3d-fsm_exec-is-reaction_finished_1_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_fail-specific-213_n0) (missionexec-active-mission_heli0_f3d-2-0-370) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-0-370) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_fail-specific-213_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-in_send_first_trajectory_fcl_finished_reaction1-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-send_first_trajectory_f3d-1-0-364) (fly3d-fsm_exec-is-reaction_finished_1_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-specific-213_n0) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_fail-specific-213_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-enter_turn_to_goal_heading_fail_service-1_heli0_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-in_start_call-is-no_f3d-2-0-370) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_fail-service_n0) (missionexec-active-mission_heli0_f3d-2-0-370) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-0-370) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_fail-service_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-enter_turn_to_goal_heading_fail_service-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-service_n0) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_fail-service_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-enter_turn_to_goal_heading_action2-fail-1_heli0_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-2-0-370) (fly3d-fsm_exec-is-action2-fail_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_fail-specific-214_n0) (missionexec-active-mission_heli0_f3d-2-0-370) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-0-370) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_fail-specific-214_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-enter_turn_to_goal_heading_action2-fail-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_state-is-turn_to_goal_heading_f3d-1-0-364) (fly3d-fsm_exec-is-action2-fail_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-specific-214_n0) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_fail-specific-214_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-enter_goal_point_wait_fail_service-1_heli0_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-action1_f3d-2-0-370) (fly3d-in_start_call-is-no_f3d-2-0-370) (fly3d-fsm_state-is-goal_point_wait_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_fail-service_n0) (missionexec-active-mission_heli0_f3d-2-0-370) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-0-370) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_fail-service_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-enter_goal_point_wait_fail_service-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-action1_f3d-1-0-364) (fly3d-in_start_call-is-no_f3d-1-0-364) (fly3d-fsm_state-is-goal_point_wait_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-service_n0) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_fail-service_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-global_fcl_error_reaction1-1_heli0_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-2-0-370) (fly3d-fsm_exec-is-global_reaction_error_1_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_fail-specific-210_n0) (missionexec-active-mission_heli0_f3d-2-0-370) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-2-0-370) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_fail-specific-210_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-fly3d-global_fcl_error_reaction1-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-running_f3d-1-0-364) (fly3d-fsm_exec-is-global_reaction_error_1_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_fail-specific-210_n0) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-running_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fly3d-mode-is-failed_f3d-1-0-364) (missionexec-mission-over_heli0) (not (fly3d-mode-is-running_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_fail-specific-210_n0)) (not (missionexec-mission-running_heli0))))
 (:action missionexec-mission-failed-autotakeoff-takeoff_fcl_error_reaction1-1_heli0_ato-1-0-275_ato-1-0-275_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_state-is-takeoff_ato-1-0-275) (autotakeoff-fsm_exec-is-reaction_error_1_ato-1-0-275) (missionexec-active-mission_heli0_ato-1-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_ato-1-0-275_fail-specific-210_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-failed_ato-1-0-275) (not (autotakeoff-mode-is-running_ato-1-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_ato-1-0-275_fail-specific-210_n0))))
 (:action missionexec-mission-failed-autotakeoff-go_to_final_altitude_action1_fail_service-1_heli0_ato-1-0-275_ato-1-0-275_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_exec-is-action1_ato-1-0-275) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-1-0-275) (autotakeoff-in_start_call-is-no_ato-1-0-275) (missionexec-active-mission_heli0_ato-1-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_ato-1-0-275_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-failed_ato-1-0-275) (not (autotakeoff-mode-is-running_ato-1-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_ato-1-0-275_fail-service_n0))))
 (:action missionexec-mission-failed-autotakeoff-go_to_final_altitude_action1_fail_specific_101-1_heli0_ato-1-0-275_ato-1-0-275_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_exec-is-action1_ato-1-0-275) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-1-0-275) (autotakeoff-in_start_call-is-no_ato-1-0-275) (missionexec-active-mission_heli0_ato-1-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_ato-1-0-275_fail-specific-101_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-failed_ato-1-0-275) (not (autotakeoff-mode-is-running_ato-1-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_ato-1-0-275_fail-specific-101_n0))))
 (:action missionexec-mission-failed-autotakeoff-go_to_final_altitude_action1_fail_specific_102-1_heli0_ato-1-0-275_ato-1-0-275_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_exec-is-action1_ato-1-0-275) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-1-0-275) (autotakeoff-in_start_call-is-no_ato-1-0-275) (missionexec-active-mission_heli0_ato-1-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_ato-1-0-275_fail-specific-102_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-failed_ato-1-0-275) (not (autotakeoff-mode-is-running_ato-1-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_ato-1-0-275_fail-specific-102_n0))))
 (:action missionexec-mission-failed-autotakeoff-go_to_final_altitude_climb_fail_service-1_heli0_ato-1-0-275_ato-1-0-275_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-1-0-275) (autotakeoff-in_start_call-is-no_ato-1-0-275) (autotakeoff-fsm_exec-is-action2-climb_ato-1-0-275) (missionexec-active-mission_heli0_ato-1-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_ato-1-0-275_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-failed_ato-1-0-275) (not (autotakeoff-mode-is-running_ato-1-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_ato-1-0-275_fail-service_n0))))
 (:action missionexec-mission-failed-autotakeoff-go_to_final_altitude_fcl_error_reaction-1_heli0_ato-1-0-275_ato-1-0-275_n0_n1
  :parameters ()
  :precondition (and (autotakeoff-mode-is-running_ato-1-0-275) (autotakeoff-fsm_state-is-go_to_final_altitude_ato-1-0-275) (autotakeoff-fsm_exec-is-reaction_error_1_ato-1-0-275) (missionexec-active-mission_heli0_ato-1-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_ato-1-0-275_fail-specific-210_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (autotakeoff-mode-is-failed_ato-1-0-275) (not (autotakeoff-mode-is-running_ato-1-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_ato-1-0-275_fail-specific-210_n0))))
 (:action missionexec-mission-failed-basiccameracontrol-start_tracking_position_fail_service-0_heli0_bcc-0-0-275_bcc-0-0-275_obs24
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-start_tracking_position_bcc-0-0-275) (basiccameracontrol-in_start_call-is-no_bcc-0-0-275) (missionexec-active-mission_heli0_bcc-0-0-275) (missionexec-mission-running_heli0) (pending_obs24) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (basiccameracontrol-mode-is-failed_bcc-0-0-275) (observed_obs24) (not (basiccameracontrol-mode-is-running_bcc-0-0-275)) (not (missionexec-mission-running_heli0)) (not (pending_obs24))))
 (:action missionexec-mission-failed-basiccameracontrol-start_tracking_position_fail_service-1_heli0_bcc-0-0-275_bcc-0-0-275_n0_n1
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-start_tracking_position_bcc-0-0-275) (basiccameracontrol-in_start_call-is-no_bcc-0-0-275) (missionexec-active-mission_heli0_bcc-0-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_bcc-0-0-275_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (basiccameracontrol-mode-is-failed_bcc-0-0-275) (not (basiccameracontrol-mode-is-running_bcc-0-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_bcc-0-0-275_fail-service_n0))))
 (:action missionexec-mission-failed-basiccameracontrol-start_tracking_position_fail_101-1_heli0_bcc-0-0-275_bcc-0-0-275_n0_n1
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-start_tracking_position_bcc-0-0-275) (basiccameracontrol-in_start_call-is-no_bcc-0-0-275) (missionexec-active-mission_heli0_bcc-0-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_bcc-0-0-275_fail-specific-101_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (basiccameracontrol-mode-is-failed_bcc-0-0-275) (not (basiccameracontrol-mode-is-running_bcc-0-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_bcc-0-0-275_fail-specific-101_n0))))
 (:action missionexec-mission-failed-basiccameracontrol-start_tracking_position_fail_102-1_heli0_bcc-0-0-275_bcc-0-0-275_n0_n1
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-start_tracking_position_bcc-0-0-275) (basiccameracontrol-in_start_call-is-no_bcc-0-0-275) (missionexec-active-mission_heli0_bcc-0-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_bcc-0-0-275_fail-specific-102_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (basiccameracontrol-mode-is-failed_bcc-0-0-275) (not (basiccameracontrol-mode-is-running_bcc-0-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_bcc-0-0-275_fail-specific-102_n0))))
 (:action missionexec-mission-failed-basiccameracontrol-seq_position_command_fail_service-0_heli0_bcc-0-0-275_bcc-0-0-275_obs24
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-seq_position_command_bcc-0-0-275) (basiccameracontrol-in_start_call-is-no_bcc-0-0-275) (missionexec-active-mission_heli0_bcc-0-0-275) (missionexec-mission-running_heli0) (pending_obs24) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (basiccameracontrol-mode-is-failed_bcc-0-0-275) (observed_obs24) (not (basiccameracontrol-mode-is-running_bcc-0-0-275)) (not (missionexec-mission-running_heli0)) (not (pending_obs24))))
 (:action missionexec-mission-failed-basiccameracontrol-seq_position_command_fail_service-1_heli0_bcc-0-0-275_bcc-0-0-275_n0_n1
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-seq_position_command_bcc-0-0-275) (basiccameracontrol-in_start_call-is-no_bcc-0-0-275) (missionexec-active-mission_heli0_bcc-0-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_bcc-0-0-275_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (basiccameracontrol-mode-is-failed_bcc-0-0-275) (not (basiccameracontrol-mode-is-running_bcc-0-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_bcc-0-0-275_fail-service_n0))))
 (:action missionexec-mission-failed-basiccameracontrol-seq_bearing_command_fail_service-0_heli0_bcc-0-0-275_bcc-0-0-275_obs24
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-in_start_call-is-no_bcc-0-0-275) (basiccameracontrol-fsm_state-is-seq_bearing_command_bcc-0-0-275) (missionexec-active-mission_heli0_bcc-0-0-275) (missionexec-mission-running_heli0) (pending_obs24) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (basiccameracontrol-mode-is-failed_bcc-0-0-275) (observed_obs24) (not (basiccameracontrol-mode-is-running_bcc-0-0-275)) (not (missionexec-mission-running_heli0)) (not (pending_obs24))))
 (:action missionexec-mission-failed-basiccameracontrol-seq_bearing_command_fail_service-1_heli0_bcc-0-0-275_bcc-0-0-275_n0_n1
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-in_start_call-is-no_bcc-0-0-275) (basiccameracontrol-fsm_state-is-seq_bearing_command_bcc-0-0-275) (missionexec-active-mission_heli0_bcc-0-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_bcc-0-0-275_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (basiccameracontrol-mode-is-failed_bcc-0-0-275) (not (basiccameracontrol-mode-is-running_bcc-0-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_bcc-0-0-275_fail-service_n0))))
 (:action missionexec-mission-failed-basiccameracontrol-converge_fail_service-0_heli0_bcc-0-0-275_bcc-0-0-275_obs24
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-in_start_call-is-no_bcc-0-0-275) (basiccameracontrol-fsm_state-is-converge_bcc-0-0-275) (missionexec-active-mission_heli0_bcc-0-0-275) (missionexec-mission-running_heli0) (pending_obs24) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (basiccameracontrol-mode-is-failed_bcc-0-0-275) (observed_obs24) (not (basiccameracontrol-mode-is-running_bcc-0-0-275)) (not (missionexec-mission-running_heli0)) (not (pending_obs24))))
 (:action missionexec-mission-failed-basiccameracontrol-converge_fail_service-1_heli0_bcc-0-0-275_bcc-0-0-275_n0_n1
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-in_start_call-is-no_bcc-0-0-275) (basiccameracontrol-fsm_state-is-converge_bcc-0-0-275) (missionexec-active-mission_heli0_bcc-0-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_bcc-0-0-275_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (basiccameracontrol-mode-is-failed_bcc-0-0-275) (not (basiccameracontrol-mode-is-running_bcc-0-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_bcc-0-0-275_fail-service_n0))))
 (:action missionexec-mission-failed-basiccameracontrol-converge_failed_fail_service-0_heli0_bcc-0-0-275_bcc-0-0-275_obs24
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-in_start_call-is-no_bcc-0-0-275) (basiccameracontrol-fsm_state-is-converge_failed_bcc-0-0-275) (missionexec-active-mission_heli0_bcc-0-0-275) (missionexec-mission-running_heli0) (pending_obs24) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (basiccameracontrol-mode-is-failed_bcc-0-0-275) (observed_obs24) (not (basiccameracontrol-mode-is-running_bcc-0-0-275)) (not (missionexec-mission-running_heli0)) (not (pending_obs24))))
 (:action missionexec-mission-failed-basiccameracontrol-converge_failed_fail_service-1_heli0_bcc-0-0-275_bcc-0-0-275_n0_n1
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-in_start_call-is-no_bcc-0-0-275) (basiccameracontrol-fsm_state-is-converge_failed_bcc-0-0-275) (missionexec-active-mission_heli0_bcc-0-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_bcc-0-0-275_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (basiccameracontrol-mode-is-failed_bcc-0-0-275) (not (basiccameracontrol-mode-is-running_bcc-0-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_bcc-0-0-275_fail-service_n0))))
 (:action missionexec-mission-failed-basiccameracontrol-converge_failed_fail_310-1_heli0_bcc-0-0-275_bcc-0-0-275_n0_n1
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-in_start_call-is-no_bcc-0-0-275) (basiccameracontrol-fsm_state-is-converge_failed_bcc-0-0-275) (missionexec-active-mission_heli0_bcc-0-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_bcc-0-0-275_fail-specific-310_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (basiccameracontrol-mode-is-failed_bcc-0-0-275) (not (basiccameracontrol-mode-is-running_bcc-0-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_bcc-0-0-275_fail-specific-310_n0))))
 (:action missionexec-mission-failed-basiccameracontrol-tracking_idle_fail_service-0_heli0_bcc-0-0-275_bcc-0-0-275_obs24
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-in_start_call-is-no_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275) (basiccameracontrol-fsm_state-is-tracking_bcc-0-0-275) (missionexec-active-mission_heli0_bcc-0-0-275) (missionexec-mission-running_heli0) (pending_obs24) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (basiccameracontrol-mode-is-failed_bcc-0-0-275) (observed_obs24) (not (basiccameracontrol-mode-is-running_bcc-0-0-275)) (not (missionexec-mission-running_heli0)) (not (pending_obs24))))
 (:action missionexec-mission-failed-basiccameracontrol-tracking_idle_fail_service-1_heli0_bcc-0-0-275_bcc-0-0-275_n0_n1
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-in_start_call-is-no_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275) (basiccameracontrol-fsm_state-is-tracking_bcc-0-0-275) (missionexec-active-mission_heli0_bcc-0-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_bcc-0-0-275_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (basiccameracontrol-mode-is-failed_bcc-0-0-275) (not (basiccameracontrol-mode-is-running_bcc-0-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_bcc-0-0-275_fail-service_n0))))
 (:action missionexec-mission-failed-basiccameracontrol-set_locked_mode_fail_service-0_heli0_bcc-0-0-275_bcc-0-0-275_obs24
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-set_locked_mode_bcc-0-0-275) (basiccameracontrol-in_start_call-is-no_bcc-0-0-275) (missionexec-active-mission_heli0_bcc-0-0-275) (missionexec-mission-running_heli0) (pending_obs24) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (basiccameracontrol-mode-is-failed_bcc-0-0-275) (observed_obs24) (not (basiccameracontrol-mode-is-running_bcc-0-0-275)) (not (missionexec-mission-running_heli0)) (not (pending_obs24))))
 (:action missionexec-mission-failed-basiccameracontrol-set_locked_mode_fail_service-1_heli0_bcc-0-0-275_bcc-0-0-275_n0_n1
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-set_locked_mode_bcc-0-0-275) (basiccameracontrol-in_start_call-is-no_bcc-0-0-275) (missionexec-active-mission_heli0_bcc-0-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_bcc-0-0-275_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (basiccameracontrol-mode-is-failed_bcc-0-0-275) (not (basiccameracontrol-mode-is-running_bcc-0-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_bcc-0-0-275_fail-service_n0))))
 (:action missionexec-mission-failed-basiccameracontrol-seq_turn_command_fail_service-0_heli0_bcc-0-0-275_bcc-0-0-275_obs24
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-in_start_call-is-no_bcc-0-0-275) (basiccameracontrol-fsm_state-is-seq_turn_command_bcc-0-0-275) (missionexec-active-mission_heli0_bcc-0-0-275) (missionexec-mission-running_heli0) (pending_obs24) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (basiccameracontrol-mode-is-failed_bcc-0-0-275) (observed_obs24) (not (basiccameracontrol-mode-is-running_bcc-0-0-275)) (not (missionexec-mission-running_heli0)) (not (pending_obs24))))
 (:action missionexec-mission-failed-basiccameracontrol-seq_turn_command_fail_service-1_heli0_bcc-0-0-275_bcc-0-0-275_n0_n1
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-in_start_call-is-no_bcc-0-0-275) (basiccameracontrol-fsm_state-is-seq_turn_command_bcc-0-0-275) (missionexec-active-mission_heli0_bcc-0-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_bcc-0-0-275_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (basiccameracontrol-mode-is-failed_bcc-0-0-275) (not (basiccameracontrol-mode-is-running_bcc-0-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_bcc-0-0-275_fail-service_n0))))
 (:action missionexec-mission-failed-basiccameracontrol-seq_turn_command_fail_401-1_heli0_bcc-0-0-275_bcc-0-0-275_n0_n1
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-in_start_call-is-no_bcc-0-0-275) (basiccameracontrol-fsm_state-is-seq_turn_command_bcc-0-0-275) (missionexec-active-mission_heli0_bcc-0-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_bcc-0-0-275_fail-specific-401_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (basiccameracontrol-mode-is-failed_bcc-0-0-275) (not (basiccameracontrol-mode-is-running_bcc-0-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_bcc-0-0-275_fail-specific-401_n0))))
 (:action missionexec-mission-failed-basiccameracontrol-seq_turn_command_fail_402-1_heli0_bcc-0-0-275_bcc-0-0-275_n0_n1
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-in_start_call-is-no_bcc-0-0-275) (basiccameracontrol-fsm_state-is-seq_turn_command_bcc-0-0-275) (missionexec-active-mission_heli0_bcc-0-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_bcc-0-0-275_fail-specific-402_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (basiccameracontrol-mode-is-failed_bcc-0-0-275) (not (basiccameracontrol-mode-is-running_bcc-0-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_bcc-0-0-275_fail-specific-402_n0))))
 (:action missionexec-mission-failed-basiccameracontrol-seq_lock_command_fail_service-0_heli0_bcc-0-0-275_bcc-0-0-275_obs24
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-seq_lock_command_bcc-0-0-275) (basiccameracontrol-in_start_call-is-no_bcc-0-0-275) (missionexec-active-mission_heli0_bcc-0-0-275) (missionexec-mission-running_heli0) (pending_obs24) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (basiccameracontrol-mode-is-failed_bcc-0-0-275) (observed_obs24) (not (basiccameracontrol-mode-is-running_bcc-0-0-275)) (not (missionexec-mission-running_heli0)) (not (pending_obs24))))
 (:action missionexec-mission-failed-basiccameracontrol-seq_lock_command_fail_service-1_heli0_bcc-0-0-275_bcc-0-0-275_n0_n1
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-seq_lock_command_bcc-0-0-275) (basiccameracontrol-in_start_call-is-no_bcc-0-0-275) (missionexec-active-mission_heli0_bcc-0-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_bcc-0-0-275_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (basiccameracontrol-mode-is-failed_bcc-0-0-275) (not (basiccameracontrol-mode-is-running_bcc-0-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_bcc-0-0-275_fail-service_n0))))
 (:action missionexec-mission-failed-basiccameracontrol-locked_camera_mode_idle_fail_service-0_heli0_bcc-0-0-275_bcc-0-0-275_obs24
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-in_start_call-is-no_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275) (basiccameracontrol-fsm_state-is-locked_camera_mode_bcc-0-0-275) (missionexec-active-mission_heli0_bcc-0-0-275) (missionexec-mission-running_heli0) (pending_obs24) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (basiccameracontrol-mode-is-failed_bcc-0-0-275) (observed_obs24) (not (basiccameracontrol-mode-is-running_bcc-0-0-275)) (not (missionexec-mission-running_heli0)) (not (pending_obs24))))
 (:action missionexec-mission-failed-basiccameracontrol-locked_camera_mode_idle_fail_service-1_heli0_bcc-0-0-275_bcc-0-0-275_n0_n1
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-in_start_call-is-no_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275) (basiccameracontrol-fsm_state-is-locked_camera_mode_bcc-0-0-275) (missionexec-active-mission_heli0_bcc-0-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_bcc-0-0-275_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (basiccameracontrol-mode-is-failed_bcc-0-0-275) (not (basiccameracontrol-mode-is-running_bcc-0-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_bcc-0-0-275_fail-service_n0))))
 (:action missionexec-mission-failed-basiccameracontrol-not_in_control_fail-1_heli0_bcc-0-0-275_bcc-0-0-275_n0_n1
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-action1_bcc-0-0-275) (basiccameracontrol-fsm_state-is-not_in_control_bcc-0-0-275) (basiccameracontrol-in_start_call-is-no_bcc-0-0-275) (missionexec-active-mission_heli0_bcc-0-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_bcc-0-0-275_fail-specific-700_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (basiccameracontrol-mode-is-failed_bcc-0-0-275) (not (basiccameracontrol-mode-is-running_bcc-0-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_bcc-0-0-275_fail-specific-700_n0))))
 (:action missionexec-mission-failed-basiccameracontrol-not_in_control_cmd_resume_control_fail-0_heli0_bcc-0-0-275_bcc-0-0-275_obs24
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_state-is-not_in_control_bcc-0-0-275) (basiccameracontrol-in_start_call-is-no_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275) (missionexec-active-mission_heli0_bcc-0-0-275) (missionexec-mission-running_heli0) (pending_obs24) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (basiccameracontrol-mode-is-failed_bcc-0-0-275) (observed_obs24) (not (basiccameracontrol-mode-is-running_bcc-0-0-275)) (not (missionexec-mission-running_heli0)) (not (pending_obs24))))
 (:action missionexec-mission-failed-basiccameracontrol-not_in_control_cmd_resume_control_fail-1_heli0_bcc-0-0-275_bcc-0-0-275_n0_n1
  :parameters ()
  :precondition (and (basiccameracontrol-mode-is-running_bcc-0-0-275) (basiccameracontrol-fsm_state-is-not_in_control_bcc-0-0-275) (basiccameracontrol-in_start_call-is-no_bcc-0-0-275) (basiccameracontrol-fsm_exec-is-nothing_bcc-0-0-275) (missionexec-active-mission_heli0_bcc-0-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_bcc-0-0-275_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (basiccameracontrol-mode-is-failed_bcc-0-0-275) (not (basiccameracontrol-mode-is-running_bcc-0-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_bcc-0-0-275_fail-service_n0))))
 (:action missionexec-mission-failed-navtopoint-plan_path_action1_fail_service-1_heli0_nav-2-0-275_nav-2-0-275_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-action1_nav-2-0-275) (navtopoint-fsm_state-is-plan_path_nav-2-0-275) (navtopoint-in_start_call-is-no_nav-2-0-275) (missionexec-active-mission_heli0_nav-2-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-2-0-275_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-2-0-275) (not (navtopoint-mode-is-running_nav-2-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-2-0-275_fail-service_n0))))
 (:action missionexec-mission-failed-navtopoint-plan_path_action1_fail_service-1_heli0_nav-1-0-275_nav-1-0-275_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-action1_nav-1-0-275) (navtopoint-fsm_state-is-plan_path_nav-1-0-275) (navtopoint-in_start_call-is-no_nav-1-0-275) (missionexec-active-mission_heli0_nav-1-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-1-0-275_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-1-0-275) (not (navtopoint-mode-is-running_nav-1-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-1-0-275_fail-service_n0))))
 (:action missionexec-mission-failed-navtopoint-plan_path_action1_fail_specific_101-1_heli0_nav-2-0-275_nav-2-0-275_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-action1_nav-2-0-275) (navtopoint-fsm_state-is-plan_path_nav-2-0-275) (navtopoint-in_start_call-is-no_nav-2-0-275) (missionexec-active-mission_heli0_nav-2-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-2-0-275_fail-specific-101_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-2-0-275) (not (navtopoint-mode-is-running_nav-2-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-2-0-275_fail-specific-101_n0))))
 (:action missionexec-mission-failed-navtopoint-plan_path_action1_fail_specific_101-1_heli0_nav-1-0-275_nav-1-0-275_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-action1_nav-1-0-275) (navtopoint-fsm_state-is-plan_path_nav-1-0-275) (navtopoint-in_start_call-is-no_nav-1-0-275) (missionexec-active-mission_heli0_nav-1-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-1-0-275_fail-specific-101_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-1-0-275) (not (navtopoint-mode-is-running_nav-1-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-1-0-275_fail-specific-101_n0))))
 (:action missionexec-mission-failed-navtopoint-plan_path_action1_fail_specific_102-1_heli0_nav-2-0-275_nav-2-0-275_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-action1_nav-2-0-275) (navtopoint-fsm_state-is-plan_path_nav-2-0-275) (navtopoint-in_start_call-is-no_nav-2-0-275) (missionexec-active-mission_heli0_nav-2-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-2-0-275_fail-specific-102_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-2-0-275) (not (navtopoint-mode-is-running_nav-2-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-2-0-275_fail-specific-102_n0))))
 (:action missionexec-mission-failed-navtopoint-plan_path_action1_fail_specific_102-1_heli0_nav-1-0-275_nav-1-0-275_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-action1_nav-1-0-275) (navtopoint-fsm_state-is-plan_path_nav-1-0-275) (navtopoint-in_start_call-is-no_nav-1-0-275) (missionexec-active-mission_heli0_nav-1-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-1-0-275_fail-specific-102_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-1-0-275) (not (navtopoint-mode-is-running_nav-1-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-1-0-275_fail-specific-102_n0))))
 (:action missionexec-mission-failed-navtopoint-plan_path_action2_fail_service-1_heli0_nav-2-0-275_nav-2-0-275_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_state-is-plan_path_nav-2-0-275) (navtopoint-fsm_exec-is-action2_nav-2-0-275) (navtopoint-in_start_call-is-no_nav-2-0-275) (missionexec-active-mission_heli0_nav-2-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-2-0-275_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-2-0-275) (not (navtopoint-mode-is-running_nav-2-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-2-0-275_fail-service_n0))))
 (:action missionexec-mission-failed-navtopoint-plan_path_action2_fail_service-1_heli0_nav-1-0-275_nav-1-0-275_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_state-is-plan_path_nav-1-0-275) (navtopoint-fsm_exec-is-action2_nav-1-0-275) (navtopoint-in_start_call-is-no_nav-1-0-275) (missionexec-active-mission_heli0_nav-1-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-1-0-275_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-1-0-275) (not (navtopoint-mode-is-running_nav-1-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-1-0-275_fail-service_n0))))
 (:action missionexec-mission-failed-navtopoint-plan_path_action2_fail_specific_402-1_heli0_nav-2-0-275_nav-2-0-275_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_state-is-plan_path_nav-2-0-275) (navtopoint-fsm_exec-is-action2_nav-2-0-275) (navtopoint-in_start_call-is-no_nav-2-0-275) (missionexec-active-mission_heli0_nav-2-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-2-0-275_fail-specific-402_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-2-0-275) (not (navtopoint-mode-is-running_nav-2-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-2-0-275_fail-specific-402_n0))))
 (:action missionexec-mission-failed-navtopoint-plan_path_action2_fail_specific_402-1_heli0_nav-1-0-275_nav-1-0-275_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_state-is-plan_path_nav-1-0-275) (navtopoint-fsm_exec-is-action2_nav-1-0-275) (navtopoint-in_start_call-is-no_nav-1-0-275) (missionexec-active-mission_heli0_nav-1-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-1-0-275_fail-specific-402_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-1-0-275) (not (navtopoint-mode-is-running_nav-1-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-1-0-275_fail-specific-402_n0))))
 (:action missionexec-mission-failed-navtopoint-plan_path_action2_fail_specific_403-1_heli0_nav-2-0-275_nav-2-0-275_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_state-is-plan_path_nav-2-0-275) (navtopoint-fsm_exec-is-action2_nav-2-0-275) (navtopoint-in_start_call-is-no_nav-2-0-275) (missionexec-active-mission_heli0_nav-2-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-2-0-275_fail-specific-403_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-2-0-275) (not (navtopoint-mode-is-running_nav-2-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-2-0-275_fail-specific-403_n0))))
 (:action missionexec-mission-failed-navtopoint-plan_path_action2_fail_specific_403-1_heli0_nav-1-0-275_nav-1-0-275_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_state-is-plan_path_nav-1-0-275) (navtopoint-fsm_exec-is-action2_nav-1-0-275) (navtopoint-in_start_call-is-no_nav-1-0-275) (missionexec-active-mission_heli0_nav-1-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-1-0-275_fail-specific-403_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-1-0-275) (not (navtopoint-mode-is-running_nav-1-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-1-0-275_fail-specific-403_n0))))
 (:action missionexec-mission-failed-navtopoint-plan_path_action2_fail_specific_404-1_heli0_nav-2-0-275_nav-2-0-275_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_state-is-plan_path_nav-2-0-275) (navtopoint-fsm_exec-is-action2_nav-2-0-275) (navtopoint-in_start_call-is-no_nav-2-0-275) (missionexec-active-mission_heli0_nav-2-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-2-0-275_fail-specific-404_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-2-0-275) (not (navtopoint-mode-is-running_nav-2-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-2-0-275_fail-specific-404_n0))))
 (:action missionexec-mission-failed-navtopoint-plan_path_action2_fail_specific_404-1_heli0_nav-1-0-275_nav-1-0-275_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_state-is-plan_path_nav-1-0-275) (navtopoint-fsm_exec-is-action2_nav-1-0-275) (navtopoint-in_start_call-is-no_nav-1-0-275) (missionexec-active-mission_heli0_nav-1-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-1-0-275_fail-specific-404_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-1-0-275) (not (navtopoint-mode-is-running_nav-1-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-1-0-275_fail-specific-404_n0))))
 (:action missionexec-mission-failed-navtopoint-fly_path_action1_fail_service-1_heli0_nav-2-0-275_nav-2-0-275_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-action1_nav-2-0-275) (navtopoint-in_start_call-is-no_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (missionexec-active-mission_heli0_nav-2-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-2-0-275_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-2-0-275) (not (navtopoint-mode-is-running_nav-2-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-2-0-275_fail-service_n0))))
 (:action missionexec-mission-failed-navtopoint-fly_path_action1_fail_service-1_heli0_nav-1-0-275_nav-1-0-275_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-action1_nav-1-0-275) (navtopoint-in_start_call-is-no_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (missionexec-active-mission_heli0_nav-1-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-1-0-275_fail-service_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-1-0-275) (not (navtopoint-mode-is-running_nav-1-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-1-0-275_fail-service_n0))))
 (:action missionexec-mission-failed-navtopoint-fly_path_action1_fail_proxy_init-1_heli0_nav-2-0-275_nav-2-0-275_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_exec-is-action1_nav-2-0-275) (navtopoint-in_start_call-is-no_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (missionexec-active-mission_heli0_nav-2-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-2-0-275_fail-subtask_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-2-0-275) (not (navtopoint-mode-is-running_nav-2-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-2-0-275_fail-subtask_n0))))
 (:action missionexec-mission-failed-navtopoint-fly_path_action1_fail_proxy_init-1_heli0_nav-1-0-275_nav-1-0-275_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_exec-is-action1_nav-1-0-275) (navtopoint-in_start_call-is-no_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (missionexec-active-mission_heli0_nav-1-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-1-0-275_fail-subtask_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-1-0-275) (not (navtopoint-mode-is-running_nav-1-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-1-0-275_fail-subtask_n0))))
 (:action missionexec-mission-failed-navtopoint-fly_path_subtask_fail_2-1_heli0_nav-2-0-275_nav-2-0-275_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-2-0-275) (navtopoint-fsm_state-is-fly_path_nav-2-0-275) (navtopoint-fsm_exec-is-reaction_f3d_fail_2_nav-2-0-275) (missionexec-active-mission_heli0_nav-2-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-2-0-275_fail-subtask_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-2-0-275) (not (navtopoint-mode-is-running_nav-2-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-2-0-275_fail-subtask_n0))))
 (:action missionexec-mission-failed-navtopoint-fly_path_subtask_fail_2-1_heli0_nav-1-0-275_nav-1-0-275_n0_n1
  :parameters ()
  :precondition (and (navtopoint-mode-is-running_nav-1-0-275) (navtopoint-fsm_state-is-fly_path_nav-1-0-275) (navtopoint-fsm_exec-is-reaction_f3d_fail_2_nav-1-0-275) (missionexec-active-mission_heli0_nav-1-0-275) (missionexec-mission-running_heli0) (fault-count-3_lost_nav-1-0-275_fail-subtask_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-1-0-275) (not (navtopoint-mode-is-running_nav-1-0-275)) (not (missionexec-mission-running_heli0)) (not (fault-count-3_lost_nav-1-0-275_fail-subtask_n0))))
 (:action missionexec-destroy-mission-fly3d-call_destroy_when_done-1_heli0_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-done_f3d-2-0-370) (fault-count-3_lost_f3d-2-0-370_destroyed_n0) (missionexec-active-mission_heli0_f3d-2-0-370) (missionexec-mission-over_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-idle_heli0) (not (fly3d-mode-is-done_f3d-2-0-370)) (not (fault-count-3_lost_f3d-2-0-370_destroyed_n0)) (not (missionexec-mission-over_heli0))))
 (:action missionexec-destroy-mission-fly3d-call_destroy_when_done-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fly3d-mode-is-done_f3d-1-0-364) (fault-count-3_lost_f3d-1-0-364_destroyed_n0) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-over_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-idle_heli0) (not (fly3d-mode-is-done_f3d-1-0-364)) (not (fault-count-3_lost_f3d-1-0-364_destroyed_n0)) (not (missionexec-mission-over_heli0))))
 (:action missionexec-destroy-mission-fly3d-call_destroy_when_failed-1_heli0_f3d-2-0-370_f3d-2-0-370_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_f3d-2-0-370_destroyed_n0) (fly3d-mode-is-failed_f3d-2-0-370) (missionexec-active-mission_heli0_f3d-2-0-370) (missionexec-mission-over_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-idle_heli0) (not (fault-count-3_lost_f3d-2-0-370_destroyed_n0)) (not (fly3d-mode-is-failed_f3d-2-0-370)) (not (missionexec-mission-over_heli0))))
 (:action missionexec-destroy-mission-fly3d-call_destroy_when_failed-1_heli0_f3d-1-0-364_f3d-1-0-364_n0_n1
  :parameters ()
  :precondition (and (fault-count-3_lost_f3d-1-0-364_destroyed_n0) (fly3d-mode-is-failed_f3d-1-0-364) (missionexec-active-mission_heli0_f3d-1-0-364) (missionexec-mission-over_heli0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-idle_heli0) (not (fault-count-3_lost_f3d-1-0-364_destroyed_n0)) (not (fly3d-mode-is-failed_f3d-1-0-364)) (not (missionexec-mission-over_heli0))))
 (:action missionexec-destroy-mission-autotakeoff-call_destroy_when_done-0_heli0_ato-1-0-275_ato-1-0-275_obs10
  :parameters ()
  :precondition (and (missionexec-active-mission_heli0_ato-1-0-275) (missionexec-mission-over_heli0) (autotakeoff-mode-is-done_ato-1-0-275) (pending_obs10) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-idle_heli0) (observed_obs10) (not (missionexec-mission-over_heli0)) (not (autotakeoff-mode-is-done_ato-1-0-275)) (not (pending_obs10))))
 (:action missionexec-destroy-mission-autotakeoff-call_destroy_when_done-1_heli0_ato-1-0-275_ato-1-0-275_n0_n1
  :parameters ()
  :precondition (and (missionexec-active-mission_heli0_ato-1-0-275) (missionexec-mission-over_heli0) (autotakeoff-mode-is-done_ato-1-0-275) (fault-count-3_lost_ato-1-0-275_destroyed_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-idle_heli0) (not (missionexec-mission-over_heli0)) (not (autotakeoff-mode-is-done_ato-1-0-275)) (not (fault-count-3_lost_ato-1-0-275_destroyed_n0))))
 (:action missionexec-destroy-mission-autotakeoff-call_destroy_when_failed-1_heli0_ato-1-0-275_ato-1-0-275_n0_n1
  :parameters ()
  :precondition (and (missionexec-active-mission_heli0_ato-1-0-275) (missionexec-mission-over_heli0) (autotakeoff-mode-is-failed_ato-1-0-275) (fault-count-3_lost_ato-1-0-275_destroyed_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-idle_heli0) (not (missionexec-mission-over_heli0)) (not (autotakeoff-mode-is-failed_ato-1-0-275)) (not (fault-count-3_lost_ato-1-0-275_destroyed_n0))))
 (:action missionexec-destroy-mission-basiccameracontrol-call_destroy_when_done-1_heli0_bcc-0-0-275_bcc-0-0-275_n0_n1
  :parameters ()
  :precondition (and (missionexec-active-mission_heli0_bcc-0-0-275) (missionexec-mission-over_heli0) (basiccameracontrol-mode-is-done_bcc-0-0-275) (fault-count-3_lost_bcc-0-0-275_destroyed_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-idle_heli0) (not (missionexec-mission-over_heli0)) (not (basiccameracontrol-mode-is-done_bcc-0-0-275)) (not (fault-count-3_lost_bcc-0-0-275_destroyed_n0)) (not (dominates-3_hyp2_lost_bcc-0-0-275_destroyed)) (not (dominates-3_hyp1_lost_bcc-0-0-275_destroyed))))
 (:action missionexec-destroy-mission-basiccameracontrol-call_destroy_when_failed-1_heli0_bcc-0-0-275_bcc-0-0-275_n0_n1
  :parameters ()
  :precondition (and (missionexec-active-mission_heli0_bcc-0-0-275) (missionexec-mission-over_heli0) (basiccameracontrol-mode-is-failed_bcc-0-0-275) (fault-count-3_lost_bcc-0-0-275_destroyed_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-idle_heli0) (not (missionexec-mission-over_heli0)) (not (basiccameracontrol-mode-is-failed_bcc-0-0-275)) (not (fault-count-3_lost_bcc-0-0-275_destroyed_n0)) (not (dominates-3_hyp2_lost_bcc-0-0-275_destroyed)) (not (dominates-3_hyp1_lost_bcc-0-0-275_destroyed))))
 (:action missionexec-destroy-mission-navtopoint-call_destroy_when_done-1_heli0_nav-2-0-275_nav-2-0-275_n0_n1
  :parameters ()
  :precondition (and (missionexec-active-mission_heli0_nav-2-0-275) (missionexec-mission-over_heli0) (navtopoint-mode-is-done_nav-2-0-275) (fault-count-3_lost_nav-2-0-275_destroyed_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-idle_heli0) (not (missionexec-mission-over_heli0)) (not (navtopoint-mode-is-done_nav-2-0-275)) (not (fault-count-3_lost_nav-2-0-275_destroyed_n0))))
 (:action missionexec-destroy-mission-navtopoint-call_destroy_when_done-1_heli0_nav-1-0-275_nav-1-0-275_n0_n1
  :parameters ()
  :precondition (and (missionexec-active-mission_heli0_nav-1-0-275) (missionexec-mission-over_heli0) (navtopoint-mode-is-done_nav-1-0-275) (fault-count-3_lost_nav-1-0-275_destroyed_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-idle_heli0) (not (missionexec-mission-over_heli0)) (not (navtopoint-mode-is-done_nav-1-0-275)) (not (fault-count-3_lost_nav-1-0-275_destroyed_n0)) (not (dominates-3_hyp2_lost_nav-1-0-275_destroyed)) (not (dominates-3_hyp1_lost_nav-1-0-275_destroyed))))
 (:action missionexec-destroy-mission-navtopoint-call_destroy_when_failed-1_heli0_nav-2-0-275_nav-2-0-275_n0_n1
  :parameters ()
  :precondition (and (missionexec-active-mission_heli0_nav-2-0-275) (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-2-0-275) (fault-count-3_lost_nav-2-0-275_destroyed_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-idle_heli0) (not (missionexec-mission-over_heli0)) (not (navtopoint-mode-is-failed_nav-2-0-275)) (not (fault-count-3_lost_nav-2-0-275_destroyed_n0))))
 (:action missionexec-destroy-mission-navtopoint-call_destroy_when_failed-1_heli0_nav-1-0-275_nav-1-0-275_n0_n1
  :parameters ()
  :precondition (and (missionexec-active-mission_heli0_nav-1-0-275) (missionexec-mission-over_heli0) (navtopoint-mode-is-failed_nav-1-0-275) (fault-count-3_lost_nav-1-0-275_destroyed_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (missionexec-mission-idle_heli0) (not (missionexec-mission-over_heli0)) (not (navtopoint-mode-is-failed_nav-1-0-275)) (not (fault-count-3_lost_nav-1-0-275_destroyed_n0)) (not (dominates-3_hyp2_lost_nav-1-0-275_destroyed)) (not (dominates-3_hyp1_lost_nav-1-0-275_destroyed))))
 (:action advance-to-obs-1_obs1_obs0
  :parameters ()
  :precondition (and (observed_obs0) (future_obs1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs1) (not (future_obs1))))
 (:action advance-to-obs-1_obs2_obs1
  :parameters ()
  :precondition (and (observed_obs1) (future_obs2) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs2) (not (future_obs2))))
 (:action advance-to-obs-1_obs3_obs2
  :parameters ()
  :precondition (and (observed_obs2) (future_obs3) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs3) (not (future_obs3))))
 (:action advance-to-obs-1_obs4_obs3
  :parameters ()
  :precondition (and (observed_obs3) (future_obs4) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs4) (not (future_obs4))))
 (:action advance-to-obs-1_obs5_obs4
  :parameters ()
  :precondition (and (observed_obs4) (future_obs5) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs5) (not (future_obs5))))
 (:action advance-to-obs-1_obs6_obs5
  :parameters ()
  :precondition (and (observed_obs5) (future_obs6) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs6) (not (future_obs6))))
 (:action advance-to-obs-1_obs7_obs6
  :parameters ()
  :precondition (and (observed_obs6) (future_obs7) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs7) (not (future_obs7))))
 (:action advance-to-obs-1_obs8_obs7
  :parameters ()
  :precondition (and (observed_obs7) (future_obs8) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs8) (not (future_obs8))))
 (:action advance-to-obs-1_obs9_obs8
  :parameters ()
  :precondition (and (observed_obs8) (future_obs9) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs9) (not (future_obs9))))
 (:action advance-to-obs-1_obs10_obs9
  :parameters ()
  :precondition (and (observed_obs9) (future_obs10) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs10) (not (future_obs10))))
 (:action advance-to-obs-1_obs11_obs10
  :parameters ()
  :precondition (and (observed_obs10) (future_obs11) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs11) (not (future_obs11))))
 (:action advance-to-obs-1_obs12_obs11
  :parameters ()
  :precondition (and (observed_obs11) (future_obs12) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs12) (not (future_obs12))))
 (:action advance-to-obs-1_obs13_obs12
  :parameters ()
  :precondition (and (observed_obs12) (future_obs13) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs13) (not (future_obs13))))
 (:action advance-to-obs-1_obs14_obs13
  :parameters ()
  :precondition (and (observed_obs13) (future_obs14) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs14) (not (future_obs14))))
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
 (:action advance-to-obs-1_obs20_obs19
  :parameters ()
  :precondition (and (observed_obs19) (future_obs20) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs20) (not (future_obs20))))
 (:action advance-to-obs-1_obs21_obs20
  :parameters ()
  :precondition (and (observed_obs20) (future_obs21) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs21) (not (future_obs21))))
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
 (:action advance-to-obs-1_obs27_obs26
  :parameters ()
  :precondition (and (observed_obs26) (future_obs27) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs27) (not (future_obs27))))
 (:action advance-to-obs-1_obs28_obs27
  :parameters ()
  :precondition (and (observed_obs27) (future_obs28) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs28) (not (future_obs28))))
 (:action advance-to-obs-1_obs29_obs28
  :parameters ()
  :precondition (and (observed_obs28) (future_obs29) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs29) (not (future_obs29))))
 (:action set_goal_1_constraint0
  :parameters ()
  :precondition (and (observed_obs6) (observed_obs8) (observed_obs15) (observed_obs17) (observed_obs29) (observed_obs3) (observed_obs28) (observed_obs14) (observed_obs16) (observed_obs18) (observed_obs1) (observed_obs2) (observed_obs4) (observed_obs5) (observed_obs7) (observed_obs9) (observed_obs23) (dominates-3_hyp2_lost_bcc-0-0-275_checkpoint104) (observed_obs22) (observed_obs26) (observed_obs27) (observed_obs12) (observed_obs13) (observed_obs20) (observed_obs19) (observed_obs0) (observed_obs21) (observed_obs25) (observed_obs11) (observed_obs24) (observed_obs10) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (achieved_constraint0) (not (not_at_end_constraint0))))
 (:action set_goal_3_constraint0
  :parameters ()
  :precondition (and (observed_obs6) (observed_obs8) (observed_obs15) (observed_obs17) (observed_obs29) (observed_obs3) (observed_obs28) (observed_obs14) (observed_obs16) (observed_obs18) (observed_obs1) (observed_obs2) (observed_obs4) (observed_obs5) (observed_obs7) (observed_obs9) (observed_obs23) (observed_obs22) (observed_obs26) (observed_obs27) (observed_obs12) (observed_obs13) (dominates-4_hyp2_lost_f3d-2-0-370_created_nav-2-0-275) (observed_obs20) (observed_obs19) (observed_obs0) (observed_obs21) (observed_obs25) (observed_obs11) (observed_obs24) (observed_obs10) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (achieved_constraint0) (not (not_at_end_constraint0))))
 (:action set_goal_5_constraint0
  :parameters ()
  :precondition (and (observed_obs6) (observed_obs8) (observed_obs15) (observed_obs17) (observed_obs29) (observed_obs3) (observed_obs28) (observed_obs14) (observed_obs16) (observed_obs18) (observed_obs1) (observed_obs2) (observed_obs4) (observed_obs5) (observed_obs7) (observed_obs9) (observed_obs23) (observed_obs22) (observed_obs26) (observed_obs27) (observed_obs12) (observed_obs13) (observed_obs20) (observed_obs19) (observed_obs0) (observed_obs21) (observed_obs25) (observed_obs11) (dominates-3_hyp2_lost_nav-1-0-275_task-done) (observed_obs24) (observed_obs10) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (achieved_constraint0) (not (not_at_end_constraint0))))
 (:action set_goal_6_constraint0
  :parameters ()
  :precondition (and (observed_obs6) (observed_obs8) (observed_obs15) (observed_obs17) (observed_obs29) (observed_obs3) (observed_obs28) (observed_obs14) (observed_obs16) (observed_obs18) (observed_obs1) (observed_obs2) (observed_obs4) (observed_obs5) (observed_obs7) (observed_obs9) (observed_obs23) (observed_obs22) (observed_obs26) (observed_obs27) (observed_obs12) (observed_obs13) (observed_obs20) (observed_obs19) (observed_obs0) (observed_obs21) (observed_obs25) (observed_obs11) (observed_obs24) (observed_obs10) (dominates-3_hyp2_lost_bcc-0-0-275_destroyed) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (achieved_constraint0) (not (not_at_end_constraint0))))
 (:action set_goal_7_constraint0
  :parameters ()
  :precondition (and (observed_obs6) (observed_obs8) (observed_obs15) (observed_obs17) (observed_obs29) (observed_obs3) (observed_obs28) (observed_obs14) (observed_obs16) (observed_obs18) (observed_obs1) (observed_obs2) (observed_obs4) (observed_obs5) (observed_obs7) (observed_obs9) (observed_obs23) (observed_obs22) (observed_obs26) (observed_obs27) (observed_obs12) (observed_obs13) (observed_obs20) (observed_obs19) (observed_obs0) (observed_obs21) (observed_obs25) (observed_obs11) (observed_obs24) (observed_obs10) (dominates-3_hyp2_lost_nav-1-0-275_destroyed) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (achieved_constraint0) (not (not_at_end_constraint0))))
 (:action set_goal_1_constraint1
  :parameters ()
  :precondition (and (observed_obs6) (observed_obs8) (observed_obs15) (observed_obs17) (observed_obs29) (observed_obs3) (observed_obs28) (observed_obs14) (observed_obs16) (observed_obs18) (observed_obs1) (observed_obs2) (observed_obs4) (observed_obs5) (observed_obs7) (observed_obs9) (dominates-3_hyp1_lost_bcc-0-0-275_checkpoint111) (observed_obs23) (observed_obs22) (observed_obs26) (observed_obs27) (observed_obs12) (observed_obs13) (observed_obs20) (observed_obs19) (observed_obs0) (observed_obs21) (observed_obs25) (observed_obs11) (observed_obs24) (observed_obs10) (achieved_constraint0) (not_at_end_constraint1))
  :effect (and (achieved_constraint1) (not (not_at_end_constraint1))))
 (:action set_goal_3_constraint1
  :parameters ()
  :precondition (and (observed_obs6) (observed_obs8) (observed_obs15) (observed_obs17) (observed_obs29) (observed_obs3) (observed_obs28) (observed_obs14) (observed_obs16) (observed_obs18) (observed_obs1) (observed_obs2) (observed_obs4) (observed_obs5) (observed_obs7) (observed_obs9) (observed_obs23) (observed_obs22) (observed_obs26) (observed_obs27) (observed_obs12) (observed_obs13) (dominates-4_hyp1_lost_f3d-2-0-370_created_nav-2-0-275) (observed_obs20) (observed_obs19) (observed_obs0) (observed_obs21) (observed_obs25) (observed_obs11) (observed_obs24) (observed_obs10) (achieved_constraint0) (not_at_end_constraint1))
  :effect (and (achieved_constraint1) (not (not_at_end_constraint1))))
 (:action set_goal_5_constraint1
  :parameters ()
  :precondition (and (observed_obs6) (observed_obs8) (observed_obs15) (observed_obs17) (observed_obs29) (observed_obs3) (observed_obs28) (observed_obs14) (observed_obs16) (observed_obs18) (observed_obs1) (observed_obs2) (observed_obs4) (observed_obs5) (observed_obs7) (observed_obs9) (observed_obs23) (observed_obs22) (observed_obs26) (observed_obs27) (observed_obs12) (observed_obs13) (observed_obs20) (observed_obs19) (observed_obs0) (observed_obs21) (observed_obs25) (observed_obs11) (dominates-3_hyp1_lost_nav-1-0-275_task-done) (observed_obs24) (observed_obs10) (achieved_constraint0) (not_at_end_constraint1))
  :effect (and (achieved_constraint1) (not (not_at_end_constraint1))))
 (:action set_goal_6_constraint1
  :parameters ()
  :precondition (and (observed_obs6) (observed_obs8) (observed_obs15) (observed_obs17) (observed_obs29) (observed_obs3) (observed_obs28) (observed_obs14) (observed_obs16) (observed_obs18) (observed_obs1) (observed_obs2) (observed_obs4) (observed_obs5) (observed_obs7) (observed_obs9) (observed_obs23) (observed_obs22) (observed_obs26) (observed_obs27) (observed_obs12) (observed_obs13) (observed_obs20) (observed_obs19) (observed_obs0) (observed_obs21) (observed_obs25) (observed_obs11) (observed_obs24) (observed_obs10) (dominates-3_hyp1_lost_bcc-0-0-275_destroyed) (achieved_constraint0) (not_at_end_constraint1))
  :effect (and (achieved_constraint1) (not (not_at_end_constraint1))))
 (:action set_goal_7_constraint1
  :parameters ()
  :precondition (and (observed_obs6) (observed_obs8) (observed_obs15) (observed_obs17) (observed_obs29) (observed_obs3) (observed_obs28) (observed_obs14) (observed_obs16) (observed_obs18) (observed_obs1) (observed_obs2) (observed_obs4) (observed_obs5) (observed_obs7) (observed_obs9) (observed_obs23) (observed_obs22) (observed_obs26) (observed_obs27) (observed_obs12) (observed_obs13) (observed_obs20) (observed_obs19) (observed_obs0) (observed_obs21) (observed_obs25) (observed_obs11) (observed_obs24) (observed_obs10) (dominates-3_hyp1_lost_nav-1-0-275_destroyed) (achieved_constraint0) (not_at_end_constraint1))
  :effect (and (achieved_constraint1) (not (not_at_end_constraint1))))
)
