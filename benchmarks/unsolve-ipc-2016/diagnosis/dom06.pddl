(define (domain appn-pls)
 (:requirements :strips :equality)
 (:predicates (breaker-state-is-unknown_breaker_x1_x2) (breaker-state-is-unknown_breaker_x3_x4) (breaker-state-is-unknown_breaker_x5_x6) (breaker-state-is-open_breaker_x5_x6) (breaker-state-is-closed_breaker_x1_x2) (breaker-state-is-closed_breaker_x3_x4) (breaker-ar-status-is-unknown_breaker_x1_x2) (breaker-ar-status-is-auto_breaker_x1_x2) (breaker-ar-status-is-unknown_breaker_x3_x4) (breaker-ar-status-is-auto_breaker_x3_x4) (pending_obs414) (fault-count-2_count-as-fault_breaker_x1_x2_n0) (observed_obs414) (dominates-2_hyp2_count-as-fault_breaker_x1_x2) (pending_obs413) (fault-count-2_count-as-fault_breaker_x3_x4_n0) (observed_obs413) (dominates-2_hyp2_count-as-fault_breaker_x3_x4) (dominates-2_hyp1_count-as-fault_breaker_x3_x4) (pending_obs417) (fault-count-2_count-as-fault_breaker_x5_x6_n0) (observed_obs417) (dominates-2_hyp2_count-as-fault_breaker_x5_x6) (dominates-2_hyp1_count-as-fault_breaker_x5_x6) (pending_obs416) (fault-count-2_count-as-fault_bus_x2_n0) (observed_obs416) (bus-isolated_bus_x2) (generator-status-is-off_generator_x2_1) (bus-iso-state-changed_bus_x2_obs414) (pending_obs415) (fault-count-2_count-as-fault_line_x7_x8_n0) (observed_obs415) (dominates-2_hyp2_count-as-fault_line_x7_x8) (dominates-2_hyp1_count-as-fault_line_x7_x8) (generator-status-is-unknown_generator_x2_1) (generator-status-is-on_generator_x2_1) (fault-count-2_count-as-fault_generator_x2_1_n0) (generator-status-is-shutting-down_generator_x2_1) (dominates-2_hyp1_count-as-fault_generator_x2_1) (generator-status-is-starting-up_generator_x2_1) (future_obs415) (future_obs416) (future_obs417) (not_at_end_constraint0) (achieved_constraint0) (not_at_end_constraint1) (achieved_constraint1) (static-true))
 (:action breaker-init-state-was-open_breaker_x5_x6
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x5_x6) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-state-is-open_breaker_x5_x6) (not (breaker-state-is-unknown_breaker_x5_x6))))
 (:action breaker-init-state-was-closed_breaker_x1_x2
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x1_x2) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-state-is-closed_breaker_x1_x2) (not (breaker-state-is-unknown_breaker_x1_x2))))
 (:action breaker-init-state-was-closed_breaker_x3_x4
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x3_x4) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-state-is-closed_breaker_x3_x4) (not (breaker-state-is-unknown_breaker_x3_x4))))
 (:action breaker-init-ar-status-was-auto_breaker_x1_x2
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x1_x2) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-ar-status-is-auto_breaker_x1_x2) (not (breaker-ar-status-is-unknown_breaker_x1_x2))))
 (:action breaker-init-ar-status-was-auto_breaker_x3_x4
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x3_x4) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-ar-status-is-auto_breaker_x3_x4) (not (breaker-ar-status-is-unknown_breaker_x3_x4))))
 (:action breaker-open-unexplained_breaker_x1_x2_obs414_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x1_x2) (pending_obs414) (fault-count-2_count-as-fault_breaker_x1_x2_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs414) (not (breaker-state-is-closed_breaker_x1_x2)) (not (pending_obs414)) (not (fault-count-2_count-as-fault_breaker_x1_x2_n0)) (not (dominates-2_hyp2_count-as-fault_breaker_x1_x2))))
 (:action breaker-open-unexplained_breaker_x3_x4_obs413_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x3_x4) (pending_obs413) (fault-count-2_count-as-fault_breaker_x3_x4_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs413) (not (breaker-state-is-closed_breaker_x3_x4)) (not (pending_obs413)) (not (fault-count-2_count-as-fault_breaker_x3_x4_n0)) (not (dominates-2_hyp2_count-as-fault_breaker_x3_x4)) (not (dominates-2_hyp1_count-as-fault_breaker_x3_x4))))
 (:action breaker-trip-unexplained_breaker_x1_x2_obs414_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x1_x2) (breaker-ar-status-is-auto_breaker_x1_x2) (pending_obs414) (fault-count-2_count-as-fault_breaker_x1_x2_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs414) (not (breaker-state-is-closed_breaker_x1_x2)) (not (pending_obs414)) (not (fault-count-2_count-as-fault_breaker_x1_x2_n0)) (not (dominates-2_hyp2_count-as-fault_breaker_x1_x2))))
 (:action breaker-trip-unexplained_breaker_x3_x4_obs413_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x3_x4) (breaker-ar-status-is-auto_breaker_x3_x4) (pending_obs413) (fault-count-2_count-as-fault_breaker_x3_x4_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs413) (not (breaker-state-is-closed_breaker_x3_x4)) (not (pending_obs413)) (not (fault-count-2_count-as-fault_breaker_x3_x4_n0)) (not (dominates-2_hyp2_count-as-fault_breaker_x3_x4)) (not (dominates-2_hyp1_count-as-fault_breaker_x3_x4))))
 (:action breaker-close-unexplained_breaker_x5_x6_obs417_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x5_x6) (pending_obs417) (fault-count-2_count-as-fault_breaker_x5_x6_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs417) (not (breaker-state-is-open_breaker_x5_x6)) (not (pending_obs417)) (not (fault-count-2_count-as-fault_breaker_x5_x6_n0)) (not (dominates-2_hyp2_count-as-fault_breaker_x5_x6)) (not (dominates-2_hyp1_count-as-fault_breaker_x5_x6))))
 (:action bus-mw-goes-to-zero-unexplained_bus_x2_obs416_n0_n1
  :parameters ()
  :precondition (and (pending_obs416) (fault-count-2_count-as-fault_bus_x2_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs416) (not (pending_obs416)) (not (fault-count-2_count-as-fault_bus_x2_n0))))
 (:action bus-mw-goes-to-zero-when-isolated_bus_x2_obs416_obs414
  :parameters ()
  :precondition (and (pending_obs416) (bus-isolated_bus_x2) (generator-status-is-off_generator_x2_1) (bus-iso-state-changed_bus_x2_obs414) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs416) (not (pending_obs416))))
 (:action line-voltage-goes-to-zero-unexplained-1_line_x7_x8_obs415_n0_n1
  :parameters ()
  :precondition (and (pending_obs415) (fault-count-2_count-as-fault_line_x7_x8_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs415) (not (pending_obs415)) (not (fault-count-2_count-as-fault_line_x7_x8_n0)) (not (dominates-2_hyp2_count-as-fault_line_x7_x8)) (not (dominates-2_hyp1_count-as-fault_line_x7_x8))))
 (:action generator-init-status-was-on_generator_x2_1
  :parameters ()
  :precondition (and (generator-status-is-unknown_generator_x2_1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (generator-status-is-on_generator_x2_1) (not (generator-status-is-unknown_generator_x2_1))))
 (:action generator-init-status-was-off_generator_x2_1
  :parameters ()
  :precondition (and (generator-status-is-unknown_generator_x2_1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (generator-status-is-off_generator_x2_1) (not (generator-status-is-unknown_generator_x2_1))))
 (:action generator-begin-shutdown_generator_x2_1_n0_n1
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x2_1) (fault-count-2_count-as-fault_generator_x2_1_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (generator-status-is-shutting-down_generator_x2_1) (not (generator-status-is-on_generator_x2_1)) (not (fault-count-2_count-as-fault_generator_x2_1_n0)) (not (dominates-2_hyp1_count-as-fault_generator_x2_1))))
 (:action generator-shutdown-breaker-open-breaker-open_generator_x2_1_breaker_x1_x2_bus_x2_breaker_x1_x2_obs414
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x1_x2) (pending_obs414) (generator-status-is-shutting-down_generator_x2_1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs414) (bus-isolated_bus_x2) (bus-iso-state-changed_bus_x2_obs414) (not (breaker-state-is-closed_breaker_x1_x2)) (not (pending_obs414))))
 (:action generator-shutdown-complete_generator_x2_1
  :parameters ()
  :precondition (and (generator-status-is-shutting-down_generator_x2_1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (generator-status-is-off_generator_x2_1) (not (generator-status-is-shutting-down_generator_x2_1))))
 (:action generator-begin-startup_generator_x2_1_n0_n1
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x2_1) (fault-count-2_count-as-fault_generator_x2_1_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (generator-status-is-starting-up_generator_x2_1) (not (generator-status-is-on_generator_x2_1)) (not (fault-count-2_count-as-fault_generator_x2_1_n0)) (not (dominates-2_hyp1_count-as-fault_generator_x2_1))))
 (:action generator-startup-complete_generator_x2_1
  :parameters ()
  :precondition (and (generator-status-is-starting-up_generator_x2_1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (generator-status-is-on_generator_x2_1) (not (generator-status-is-starting-up_generator_x2_1))))
 (:action advance-to-obs_obs415
  :parameters ()
  :precondition (and (observed_obs414) (observed_obs413) (future_obs415) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs415) (not (future_obs415))))
 (:action advance-to-obs_obs416
  :parameters ()
  :precondition (and (observed_obs415) (future_obs416) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs416) (not (future_obs416))))
 (:action advance-to-obs_obs417
  :parameters ()
  :precondition (and (observed_obs416) (future_obs417) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs417) (not (future_obs417))))
 (:action set_goal_0_constraint0
  :parameters ()
  :precondition (and (observed_obs414) (dominates-2_hyp2_count-as-fault_breaker_x1_x2) (observed_obs413) (observed_obs417) (observed_obs416) (observed_obs415) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (achieved_constraint0) (not (not_at_end_constraint0))))
 (:action set_goal_3_constraint1
  :parameters ()
  :precondition (and (observed_obs414) (observed_obs413) (observed_obs417) (observed_obs416) (observed_obs415) (dominates-2_hyp1_count-as-fault_generator_x2_1) (achieved_constraint0) (not_at_end_constraint1))
  :effect (and (achieved_constraint1) (not (not_at_end_constraint1))))
)
