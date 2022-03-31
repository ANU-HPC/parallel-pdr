(define (domain appn-pls)
 (:requirements :strips :equality)
 (:predicates (breaker-state-is-unknown_breaker_x1_x2) (breaker-state-is-unknown_breaker_x3_x1) (breaker-state-is-unknown_breaker_x4_x2) (breaker-state-is-unknown_breaker_x5_x6) (breaker-state-is-unknown_breaker_x9_x10) (breaker-state-is-open_breaker_x9_x10) (breaker-state-is-unknown_breaker_x11_x12) (breaker-state-is-unknown_breaker_x13_x14) (breaker-state-is-open_breaker_x13_x14) (breaker-state-is-unknown_breaker_x15_x16) (breaker-state-is-unknown_breaker_x17_x18) (breaker-state-is-open_breaker_x17_x18) (breaker-state-is-unknown_breaker_x19_x20) (breaker-state-is-open_breaker_x19_x20) (breaker-state-is-unknown_breaker_x27_x28) (breaker-state-is-open_breaker_x27_x28) (breaker-state-is-closed_breaker_x1_x2) (breaker-state-is-closed_breaker_x3_x1) (breaker-state-is-closed_breaker_x4_x2) (breaker-state-is-closed_breaker_x5_x6) (breaker-state-is-closed_breaker_x9_x10) (breaker-state-is-closed_breaker_x11_x12) (breaker-state-is-closed_breaker_x13_x14) (breaker-state-is-closed_breaker_x15_x16) (breaker-state-is-closed_breaker_x17_x18) (breaker-state-is-closed_breaker_x19_x20) (breaker-state-is-closed_breaker_x27_x28) (breaker-ar-status-is-unknown_breaker_x1_x2) (breaker-ar-status-is-auto_breaker_x1_x2) (breaker-ar-status-is-unknown_breaker_x3_x1) (breaker-ar-status-is-auto_breaker_x3_x1) (breaker-ar-status-is-unknown_breaker_x4_x2) (breaker-ar-status-is-auto_breaker_x4_x2) (breaker-ar-status-is-unknown_breaker_x5_x6) (breaker-ar-status-is-auto_breaker_x5_x6) (breaker-ar-status-is-unknown_breaker_x9_x10) (breaker-ar-status-is-auto_breaker_x9_x10) (breaker-ar-status-is-unknown_breaker_x11_x12) (breaker-ar-status-is-auto_breaker_x11_x12) (breaker-ar-status-is-unknown_breaker_x13_x14) (breaker-ar-status-is-auto_breaker_x13_x14) (breaker-ar-status-is-unknown_breaker_x15_x16) (breaker-ar-status-is-auto_breaker_x15_x16) (breaker-ar-status-is-unknown_breaker_x17_x18) (breaker-ar-status-is-auto_breaker_x17_x18) (breaker-ar-status-is-unknown_breaker_x19_x20) (breaker-ar-status-is-auto_breaker_x19_x20) (breaker-ar-status-is-non-auto_breaker_x9_x10) (breaker-ar-status-is-non-auto_breaker_x13_x14) (breaker-ar-status-is-non-auto_breaker_x17_x18) (breaker-ar-status-is-non-auto_breaker_x19_x20) (pending_obs3063) (fault-count-2_count-as-fault_breaker_x1_x2_n0) (observed_obs3063) (fault-count-2_count-as-fault_breaker_x1_x2_n1) (dominates-2_hyp3_count-as-fault_breaker_x1_x2) (dominates-2_hyp2_count-as-fault_breaker_x1_x2) (dominates-2_hyp1_count-as-fault_breaker_x1_x2) (pending_obs3064) (fault-count-2_count-as-fault_breaker_x3_x1_n0) (observed_obs3064) (fault-count-2_count-as-fault_breaker_x3_x1_n1) (dominates-2_hyp3_count-as-fault_breaker_x3_x1) (dominates-2_hyp2_count-as-fault_breaker_x3_x1) (dominates-2_hyp1_count-as-fault_breaker_x3_x1) (pending_obs3060) (fault-count-2_count-as-fault_breaker_x4_x2_n0) (observed_obs3060) (fault-count-2_count-as-fault_breaker_x4_x2_n1) (dominates-2_hyp3_count-as-fault_breaker_x4_x2) (dominates-2_hyp2_count-as-fault_breaker_x4_x2) (dominates-2_hyp1_count-as-fault_breaker_x4_x2) (pending_obs3059) (fault-count-2_count-as-fault_breaker_x5_x6_n0) (observed_obs3059) (fault-count-2_count-as-fault_breaker_x5_x6_n1) (dominates-2_hyp3_count-as-fault_breaker_x5_x6) (dominates-2_hyp2_count-as-fault_breaker_x5_x6) (dominates-2_hyp1_count-as-fault_breaker_x5_x6) (pending_obs3051) (fault-count-2_count-as-fault_breaker_x9_x10_n0) (observed_obs3051) (fault-count-2_count-as-fault_breaker_x9_x10_n1) (line-iso-state-may-have-changed_line_x7_x8_obs3051) (dominates-2_hyp3_count-as-fault_breaker_x9_x10) (dominates-2_hyp2_count-as-fault_breaker_x9_x10) (pending_obs3057) (fault-count-2_count-as-fault_breaker_x11_x12_n0) (observed_obs3057) (fault-count-2_count-as-fault_breaker_x11_x12_n1) (dominates-2_hyp3_count-as-fault_breaker_x11_x12) (dominates-2_hyp2_count-as-fault_breaker_x11_x12) (dominates-2_hyp1_count-as-fault_breaker_x11_x12) (pending_obs3050) (fault-count-2_count-as-fault_breaker_x13_x14_n0) (observed_obs3050) (fault-count-2_count-as-fault_breaker_x13_x14_n1) (line-iso-state-may-have-changed_line_x21_x22_obs3050) (dominates-2_hyp3_count-as-fault_breaker_x13_x14) (dominates-2_hyp1_count-as-fault_breaker_x13_x14) (pending_obs3065) (fault-count-2_count-as-fault_breaker_x15_x16_n0) (observed_obs3065) (fault-count-2_count-as-fault_breaker_x15_x16_n1) (pending_obs3049) (fault-count-2_count-as-fault_breaker_x17_x18_n0) (observed_obs3049) (fault-count-2_count-as-fault_breaker_x17_x18_n1) (line-iso-state-may-have-changed_line_x7_x8_obs3049) (dominates-2_hyp3_count-as-fault_breaker_x17_x18) (dominates-2_hyp2_count-as-fault_breaker_x17_x18) (pending_obs3048) (fault-count-2_count-as-fault_breaker_x19_x20_n0) (observed_obs3048) (fault-count-2_count-as-fault_breaker_x19_x20_n1) (line-iso-state-may-have-changed_line_x7_x8_obs3048) (dominates-2_hyp3_count-as-fault_breaker_x19_x20) (dominates-2_hyp2_count-as-fault_breaker_x19_x20) (breaker-auto-reclose-wait_breaker_x17_x18_obs3049) (pending_obs3062) (observed_obs3062) (line-iso-state-may-have-changed_line_x7_x8_obs3062) (breaker-auto-reopen-wait_breaker_x17_x18_obs3062) (pending_obs3066) (fault-count-2_count-as-fault_bus_x23_n0) (observed_obs3066) (fault-count-2_count-as-fault_bus_x23_n1) (dominates-2_hyp3_count-as-fault_bus_x23) (dominates-2_hyp2_count-as-fault_bus_x23) (dominates-2_hyp1_count-as-fault_bus_x23) (pending_obs3053) (fault-count-2_count-as-fault_bus_x5_n0) (observed_obs3053) (fault-count-2_count-as-fault_bus_x5_n1) (dominates-2_hyp3_count-as-fault_bus_x5) (dominates-2_hyp2_count-as-fault_bus_x5) (dominates-2_hyp1_count-as-fault_bus_x5) (pending_obs3054) (fault-count-2_count-as-fault_bus_x24_n0) (observed_obs3054) (fault-count-2_count-as-fault_bus_x24_n1) (dominates-2_hyp3_count-as-fault_bus_x24) (dominates-2_hyp2_count-as-fault_bus_x24) (dominates-2_hyp1_count-as-fault_bus_x24) (pending_obs3056) (fault-count-2_count-as-fault_bus_x25_n0) (observed_obs3056) (fault-count-2_count-as-fault_bus_x25_n1) (dominates-2_hyp3_count-as-fault_bus_x25) (dominates-2_hyp2_count-as-fault_bus_x25) (dominates-2_hyp1_count-as-fault_bus_x25) (fault-count-2_count-as-fault_line_x7_x8_n0) (not_line-isolated_line_x7_x8) (line-iso-trip-in-progress_line_x7_x8_obs3051) (not_line-iso-trip-in-progress_line_x7_x8_obs3051) (fault-count-2_count-as-fault_line_x7_x8_n1) (dominates-2_hyp1_count-as-fault_line_x7_x8) (line-iso-trip-in-progress_line_x7_x8_obs3049) (not_line-iso-trip-in-progress_line_x7_x8_obs3049) (line-iso-trip-in-progress_line_x7_x8_obs3048) (not_line-iso-trip-in-progress_line_x7_x8_obs3048) (fault-count-2_count-as-fault_line_x21_x22_n0) (not_line-isolated_line_x21_x22) (line-iso-trip-in-progress_line_x21_x22_obs3050) (not_line-iso-trip-in-progress_line_x21_x22_obs3050) (fault-count-2_count-as-fault_line_x21_x22_n1) (dominates-2_hyp2_count-as-fault_line_x21_x22) (line-isolated_line_x21_x22) (line-iso-state-changed_line_x21_x22_obs3050) (line-iso-state-changed_line_x7_x8_obs3048) (line-isolated_line_x7_x8) (line-iso-state-changed_line_x7_x8_obs3049) (line-iso-state-changed_line_x7_x8_obs3051) (line-iso-state-changed_line_x7_x8_obs3062) (pending_obs3052) (observed_obs3052) (pending_obs3058) (observed_obs3058) (generator-status-is-unknown_generator_x26_1) (generator-status-is-on_generator_x26_1) (generator-status-is-unknown_generator_x16_1) (generator-status-is-on_generator_x16_1) (generator-status-is-off_generator_x26_1) (generator-status-is-off_generator_x16_1) (fault-count-2_count-as-fault_generator_x26_1_n0) (generator-status-is-shutting-down_generator_x26_1) (fault-count-2_count-as-fault_generator_x26_1_n1) (dominates-2_hyp3_count-as-fault_generator_x26_1) (dominates-2_hyp2_count-as-fault_generator_x26_1) (dominates-2_hyp1_count-as-fault_generator_x26_1) (fault-count-2_count-as-fault_generator_x16_1_n0) (generator-status-is-shutting-down_generator_x16_1) (fault-count-2_count-as-fault_generator_x16_1_n1) (dominates-2_hyp3_count-as-fault_generator_x16_1) (dominates-2_hyp2_count-as-fault_generator_x16_1) (dominates-2_hyp1_count-as-fault_generator_x16_1) (pending_obs3055) (observed_obs3055) (generator-status-is-starting-up_generator_x26_1) (generator-status-is-starting-up_generator_x16_1) (pending_obs3067) (observed_obs3067) (pending_obs3061) (observed_obs3061) (future_obs3053) (future_obs3054) (future_obs3055) (future_obs3056) (future_obs3057) (future_obs3058) (future_obs3059) (future_obs3060) (future_obs3061) (future_obs3062) (future_obs3063) (future_obs3064) (future_obs3065) (future_obs3066) (future_obs3067) (not_at_end_constraint0) (achieved_constraint0) (not_at_end_constraint1) (achieved_constraint1) (not_at_end_constraint2) (achieved_constraint2) (static-true))
 (:action breaker-init-state-was-open_breaker_x9_x10
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x9_x10) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x9_x10) (not (breaker-state-is-unknown_breaker_x9_x10))))
 (:action breaker-init-state-was-open_breaker_x13_x14
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x13_x14) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x13_x14) (not (breaker-state-is-unknown_breaker_x13_x14))))
 (:action breaker-init-state-was-open_breaker_x17_x18
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x17_x18) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x17_x18) (not (breaker-state-is-unknown_breaker_x17_x18))))
 (:action breaker-init-state-was-open_breaker_x19_x20
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x19_x20) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x19_x20) (not (breaker-state-is-unknown_breaker_x19_x20))))
 (:action breaker-init-state-was-open_breaker_x27_x28
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x27_x28) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x27_x28) (not (breaker-state-is-unknown_breaker_x27_x28))))
 (:action breaker-init-state-was-closed_breaker_x1_x2
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x1_x2) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-closed_breaker_x1_x2) (not (breaker-state-is-unknown_breaker_x1_x2))))
 (:action breaker-init-state-was-closed_breaker_x3_x1
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x3_x1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-closed_breaker_x3_x1) (not (breaker-state-is-unknown_breaker_x3_x1))))
 (:action breaker-init-state-was-closed_breaker_x4_x2
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x4_x2) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-closed_breaker_x4_x2) (not (breaker-state-is-unknown_breaker_x4_x2))))
 (:action breaker-init-state-was-closed_breaker_x5_x6
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x5_x6) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-closed_breaker_x5_x6) (not (breaker-state-is-unknown_breaker_x5_x6))))
 (:action breaker-init-state-was-closed_breaker_x9_x10
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x9_x10) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-closed_breaker_x9_x10) (not (breaker-state-is-unknown_breaker_x9_x10))))
 (:action breaker-init-state-was-closed_breaker_x11_x12
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x11_x12) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-closed_breaker_x11_x12) (not (breaker-state-is-unknown_breaker_x11_x12))))
 (:action breaker-init-state-was-closed_breaker_x13_x14
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x13_x14) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-closed_breaker_x13_x14) (not (breaker-state-is-unknown_breaker_x13_x14))))
 (:action breaker-init-state-was-closed_breaker_x15_x16
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x15_x16) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-closed_breaker_x15_x16) (not (breaker-state-is-unknown_breaker_x15_x16))))
 (:action breaker-init-state-was-closed_breaker_x17_x18
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x17_x18) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-closed_breaker_x17_x18) (not (breaker-state-is-unknown_breaker_x17_x18))))
 (:action breaker-init-state-was-closed_breaker_x19_x20
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x19_x20) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-closed_breaker_x19_x20) (not (breaker-state-is-unknown_breaker_x19_x20))))
 (:action breaker-init-state-was-closed_breaker_x27_x28
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x27_x28) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-closed_breaker_x27_x28) (not (breaker-state-is-unknown_breaker_x27_x28))))
 (:action breaker-init-ar-status-was-auto_breaker_x1_x2
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x1_x2) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-ar-status-is-auto_breaker_x1_x2) (not (breaker-ar-status-is-unknown_breaker_x1_x2))))
 (:action breaker-init-ar-status-was-auto_breaker_x3_x1
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x3_x1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-ar-status-is-auto_breaker_x3_x1) (not (breaker-ar-status-is-unknown_breaker_x3_x1))))
 (:action breaker-init-ar-status-was-auto_breaker_x4_x2
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x4_x2) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-ar-status-is-auto_breaker_x4_x2) (not (breaker-ar-status-is-unknown_breaker_x4_x2))))
 (:action breaker-init-ar-status-was-auto_breaker_x5_x6
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x5_x6) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-ar-status-is-auto_breaker_x5_x6) (not (breaker-ar-status-is-unknown_breaker_x5_x6))))
 (:action breaker-init-ar-status-was-auto_breaker_x9_x10
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x9_x10) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-ar-status-is-auto_breaker_x9_x10) (not (breaker-ar-status-is-unknown_breaker_x9_x10))))
 (:action breaker-init-ar-status-was-auto_breaker_x11_x12
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x11_x12) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-ar-status-is-auto_breaker_x11_x12) (not (breaker-ar-status-is-unknown_breaker_x11_x12))))
 (:action breaker-init-ar-status-was-auto_breaker_x13_x14
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x13_x14) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-ar-status-is-auto_breaker_x13_x14) (not (breaker-ar-status-is-unknown_breaker_x13_x14))))
 (:action breaker-init-ar-status-was-auto_breaker_x15_x16
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x15_x16) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-ar-status-is-auto_breaker_x15_x16) (not (breaker-ar-status-is-unknown_breaker_x15_x16))))
 (:action breaker-init-ar-status-was-auto_breaker_x17_x18
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x17_x18) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-ar-status-is-auto_breaker_x17_x18) (not (breaker-ar-status-is-unknown_breaker_x17_x18))))
 (:action breaker-init-ar-status-was-auto_breaker_x19_x20
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x19_x20) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-ar-status-is-auto_breaker_x19_x20) (not (breaker-ar-status-is-unknown_breaker_x19_x20))))
 (:action breaker-init-ar-status-was-non-auto_breaker_x9_x10
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x9_x10) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-ar-status-is-non-auto_breaker_x9_x10) (not (breaker-ar-status-is-unknown_breaker_x9_x10))))
 (:action breaker-init-ar-status-was-non-auto_breaker_x13_x14
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x13_x14) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-ar-status-is-non-auto_breaker_x13_x14) (not (breaker-ar-status-is-unknown_breaker_x13_x14))))
 (:action breaker-init-ar-status-was-non-auto_breaker_x17_x18
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x17_x18) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-ar-status-is-non-auto_breaker_x17_x18) (not (breaker-ar-status-is-unknown_breaker_x17_x18))))
 (:action breaker-init-ar-status-was-non-auto_breaker_x19_x20
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x19_x20) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-ar-status-is-non-auto_breaker_x19_x20) (not (breaker-ar-status-is-unknown_breaker_x19_x20))))
 (:action breaker-open-unexplained_breaker_x1_x2_obs3063_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x1_x2) (pending_obs3063) (fault-count-2_count-as-fault_breaker_x1_x2_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs3063) (fault-count-2_count-as-fault_breaker_x1_x2_n1) (not (breaker-state-is-closed_breaker_x1_x2)) (not (pending_obs3063)) (not (fault-count-2_count-as-fault_breaker_x1_x2_n0)) (not (dominates-2_hyp3_count-as-fault_breaker_x1_x2)) (not (dominates-2_hyp2_count-as-fault_breaker_x1_x2)) (not (dominates-2_hyp1_count-as-fault_breaker_x1_x2))))
 (:action breaker-open-unexplained_breaker_x3_x1_obs3064_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x3_x1) (pending_obs3064) (fault-count-2_count-as-fault_breaker_x3_x1_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs3064) (fault-count-2_count-as-fault_breaker_x3_x1_n1) (not (breaker-state-is-closed_breaker_x3_x1)) (not (pending_obs3064)) (not (fault-count-2_count-as-fault_breaker_x3_x1_n0)) (not (dominates-2_hyp3_count-as-fault_breaker_x3_x1)) (not (dominates-2_hyp2_count-as-fault_breaker_x3_x1)) (not (dominates-2_hyp1_count-as-fault_breaker_x3_x1))))
 (:action breaker-open-unexplained_breaker_x4_x2_obs3060_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x4_x2) (pending_obs3060) (fault-count-2_count-as-fault_breaker_x4_x2_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs3060) (fault-count-2_count-as-fault_breaker_x4_x2_n1) (not (breaker-state-is-closed_breaker_x4_x2)) (not (pending_obs3060)) (not (fault-count-2_count-as-fault_breaker_x4_x2_n0)) (not (dominates-2_hyp3_count-as-fault_breaker_x4_x2)) (not (dominates-2_hyp2_count-as-fault_breaker_x4_x2)) (not (dominates-2_hyp1_count-as-fault_breaker_x4_x2))))
 (:action breaker-open-unexplained_breaker_x5_x6_obs3059_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x5_x6) (pending_obs3059) (fault-count-2_count-as-fault_breaker_x5_x6_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs3059) (fault-count-2_count-as-fault_breaker_x5_x6_n1) (not (breaker-state-is-closed_breaker_x5_x6)) (not (pending_obs3059)) (not (fault-count-2_count-as-fault_breaker_x5_x6_n0)) (not (dominates-2_hyp3_count-as-fault_breaker_x5_x6)) (not (dominates-2_hyp2_count-as-fault_breaker_x5_x6)) (not (dominates-2_hyp1_count-as-fault_breaker_x5_x6))))
 (:action breaker-open-unexplained_breaker_x9_x10_obs3051_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x9_x10) (pending_obs3051) (fault-count-2_count-as-fault_breaker_x9_x10_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x9_x10) (observed_obs3051) (fault-count-2_count-as-fault_breaker_x9_x10_n1) (line-iso-state-may-have-changed_line_x7_x8_obs3051) (not (breaker-state-is-closed_breaker_x9_x10)) (not (pending_obs3051)) (not (fault-count-2_count-as-fault_breaker_x9_x10_n0)) (not (dominates-2_hyp3_count-as-fault_breaker_x9_x10)) (not (dominates-2_hyp2_count-as-fault_breaker_x9_x10))))
 (:action breaker-open-unexplained_breaker_x11_x12_obs3057_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x11_x12) (pending_obs3057) (fault-count-2_count-as-fault_breaker_x11_x12_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs3057) (fault-count-2_count-as-fault_breaker_x11_x12_n1) (not (breaker-state-is-closed_breaker_x11_x12)) (not (pending_obs3057)) (not (fault-count-2_count-as-fault_breaker_x11_x12_n0)) (not (dominates-2_hyp3_count-as-fault_breaker_x11_x12)) (not (dominates-2_hyp2_count-as-fault_breaker_x11_x12)) (not (dominates-2_hyp1_count-as-fault_breaker_x11_x12))))
 (:action breaker-open-unexplained_breaker_x13_x14_obs3050_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x13_x14) (pending_obs3050) (fault-count-2_count-as-fault_breaker_x13_x14_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x13_x14) (observed_obs3050) (fault-count-2_count-as-fault_breaker_x13_x14_n1) (line-iso-state-may-have-changed_line_x21_x22_obs3050) (not (breaker-state-is-closed_breaker_x13_x14)) (not (pending_obs3050)) (not (fault-count-2_count-as-fault_breaker_x13_x14_n0)) (not (dominates-2_hyp3_count-as-fault_breaker_x13_x14)) (not (dominates-2_hyp1_count-as-fault_breaker_x13_x14))))
 (:action breaker-open-unexplained_breaker_x15_x16_obs3065_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x15_x16) (pending_obs3065) (fault-count-2_count-as-fault_breaker_x15_x16_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs3065) (fault-count-2_count-as-fault_breaker_x15_x16_n1) (not (breaker-state-is-closed_breaker_x15_x16)) (not (pending_obs3065)) (not (fault-count-2_count-as-fault_breaker_x15_x16_n0))))
 (:action breaker-open-unexplained_breaker_x17_x18_obs3049_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x17_x18) (pending_obs3049) (fault-count-2_count-as-fault_breaker_x17_x18_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x17_x18) (observed_obs3049) (fault-count-2_count-as-fault_breaker_x17_x18_n1) (line-iso-state-may-have-changed_line_x7_x8_obs3049) (not (breaker-state-is-closed_breaker_x17_x18)) (not (pending_obs3049)) (not (fault-count-2_count-as-fault_breaker_x17_x18_n0)) (not (dominates-2_hyp3_count-as-fault_breaker_x17_x18)) (not (dominates-2_hyp2_count-as-fault_breaker_x17_x18))))
 (:action breaker-open-unexplained_breaker_x19_x20_obs3048_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x19_x20) (pending_obs3048) (fault-count-2_count-as-fault_breaker_x19_x20_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x19_x20) (observed_obs3048) (fault-count-2_count-as-fault_breaker_x19_x20_n1) (line-iso-state-may-have-changed_line_x7_x8_obs3048) (not (breaker-state-is-closed_breaker_x19_x20)) (not (pending_obs3048)) (not (fault-count-2_count-as-fault_breaker_x19_x20_n0)) (not (dominates-2_hyp3_count-as-fault_breaker_x19_x20)) (not (dominates-2_hyp2_count-as-fault_breaker_x19_x20))))
 (:action breaker-trip-unexplained_breaker_x1_x2_obs3063_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x1_x2) (breaker-ar-status-is-auto_breaker_x1_x2) (pending_obs3063) (fault-count-2_count-as-fault_breaker_x1_x2_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs3063) (fault-count-2_count-as-fault_breaker_x1_x2_n1) (not (breaker-state-is-closed_breaker_x1_x2)) (not (pending_obs3063)) (not (fault-count-2_count-as-fault_breaker_x1_x2_n0)) (not (dominates-2_hyp3_count-as-fault_breaker_x1_x2)) (not (dominates-2_hyp2_count-as-fault_breaker_x1_x2)) (not (dominates-2_hyp1_count-as-fault_breaker_x1_x2))))
 (:action breaker-trip-unexplained_breaker_x3_x1_obs3064_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x3_x1) (breaker-ar-status-is-auto_breaker_x3_x1) (pending_obs3064) (fault-count-2_count-as-fault_breaker_x3_x1_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs3064) (fault-count-2_count-as-fault_breaker_x3_x1_n1) (not (breaker-state-is-closed_breaker_x3_x1)) (not (pending_obs3064)) (not (fault-count-2_count-as-fault_breaker_x3_x1_n0)) (not (dominates-2_hyp3_count-as-fault_breaker_x3_x1)) (not (dominates-2_hyp2_count-as-fault_breaker_x3_x1)) (not (dominates-2_hyp1_count-as-fault_breaker_x3_x1))))
 (:action breaker-trip-unexplained_breaker_x4_x2_obs3060_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x4_x2) (breaker-ar-status-is-auto_breaker_x4_x2) (pending_obs3060) (fault-count-2_count-as-fault_breaker_x4_x2_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs3060) (fault-count-2_count-as-fault_breaker_x4_x2_n1) (not (breaker-state-is-closed_breaker_x4_x2)) (not (pending_obs3060)) (not (fault-count-2_count-as-fault_breaker_x4_x2_n0)) (not (dominates-2_hyp3_count-as-fault_breaker_x4_x2)) (not (dominates-2_hyp2_count-as-fault_breaker_x4_x2)) (not (dominates-2_hyp1_count-as-fault_breaker_x4_x2))))
 (:action breaker-trip-unexplained_breaker_x5_x6_obs3059_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x5_x6) (breaker-ar-status-is-auto_breaker_x5_x6) (pending_obs3059) (fault-count-2_count-as-fault_breaker_x5_x6_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs3059) (fault-count-2_count-as-fault_breaker_x5_x6_n1) (not (breaker-state-is-closed_breaker_x5_x6)) (not (pending_obs3059)) (not (fault-count-2_count-as-fault_breaker_x5_x6_n0)) (not (dominates-2_hyp3_count-as-fault_breaker_x5_x6)) (not (dominates-2_hyp2_count-as-fault_breaker_x5_x6)) (not (dominates-2_hyp1_count-as-fault_breaker_x5_x6))))
 (:action breaker-trip-unexplained_breaker_x9_x10_obs3051_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x9_x10) (breaker-ar-status-is-auto_breaker_x9_x10) (pending_obs3051) (fault-count-2_count-as-fault_breaker_x9_x10_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x9_x10) (observed_obs3051) (fault-count-2_count-as-fault_breaker_x9_x10_n1) (line-iso-state-may-have-changed_line_x7_x8_obs3051) (not (breaker-state-is-closed_breaker_x9_x10)) (not (pending_obs3051)) (not (fault-count-2_count-as-fault_breaker_x9_x10_n0)) (not (dominates-2_hyp3_count-as-fault_breaker_x9_x10)) (not (dominates-2_hyp2_count-as-fault_breaker_x9_x10))))
 (:action breaker-trip-unexplained_breaker_x11_x12_obs3057_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x11_x12) (breaker-ar-status-is-auto_breaker_x11_x12) (pending_obs3057) (fault-count-2_count-as-fault_breaker_x11_x12_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs3057) (fault-count-2_count-as-fault_breaker_x11_x12_n1) (not (breaker-state-is-closed_breaker_x11_x12)) (not (pending_obs3057)) (not (fault-count-2_count-as-fault_breaker_x11_x12_n0)) (not (dominates-2_hyp3_count-as-fault_breaker_x11_x12)) (not (dominates-2_hyp2_count-as-fault_breaker_x11_x12)) (not (dominates-2_hyp1_count-as-fault_breaker_x11_x12))))
 (:action breaker-trip-unexplained_breaker_x13_x14_obs3050_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x13_x14) (breaker-ar-status-is-auto_breaker_x13_x14) (pending_obs3050) (fault-count-2_count-as-fault_breaker_x13_x14_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x13_x14) (observed_obs3050) (fault-count-2_count-as-fault_breaker_x13_x14_n1) (line-iso-state-may-have-changed_line_x21_x22_obs3050) (not (breaker-state-is-closed_breaker_x13_x14)) (not (pending_obs3050)) (not (fault-count-2_count-as-fault_breaker_x13_x14_n0)) (not (dominates-2_hyp3_count-as-fault_breaker_x13_x14)) (not (dominates-2_hyp1_count-as-fault_breaker_x13_x14))))
 (:action breaker-trip-unexplained_breaker_x15_x16_obs3065_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x15_x16) (breaker-ar-status-is-auto_breaker_x15_x16) (pending_obs3065) (fault-count-2_count-as-fault_breaker_x15_x16_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs3065) (fault-count-2_count-as-fault_breaker_x15_x16_n1) (not (breaker-state-is-closed_breaker_x15_x16)) (not (pending_obs3065)) (not (fault-count-2_count-as-fault_breaker_x15_x16_n0))))
 (:action breaker-trip-unexplained_breaker_x17_x18_obs3049_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x17_x18) (breaker-ar-status-is-auto_breaker_x17_x18) (pending_obs3049) (fault-count-2_count-as-fault_breaker_x17_x18_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x17_x18) (observed_obs3049) (fault-count-2_count-as-fault_breaker_x17_x18_n1) (line-iso-state-may-have-changed_line_x7_x8_obs3049) (breaker-auto-reclose-wait_breaker_x17_x18_obs3049) (not (breaker-state-is-closed_breaker_x17_x18)) (not (pending_obs3049)) (not (fault-count-2_count-as-fault_breaker_x17_x18_n0)) (not (dominates-2_hyp3_count-as-fault_breaker_x17_x18)) (not (dominates-2_hyp2_count-as-fault_breaker_x17_x18))))
 (:action breaker-trip-unexplained_breaker_x19_x20_obs3048_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x19_x20) (breaker-ar-status-is-auto_breaker_x19_x20) (pending_obs3048) (fault-count-2_count-as-fault_breaker_x19_x20_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x19_x20) (observed_obs3048) (fault-count-2_count-as-fault_breaker_x19_x20_n1) (line-iso-state-may-have-changed_line_x7_x8_obs3048) (not (breaker-state-is-closed_breaker_x19_x20)) (not (pending_obs3048)) (not (fault-count-2_count-as-fault_breaker_x19_x20_n0)) (not (dominates-2_hyp3_count-as-fault_breaker_x19_x20)) (not (dominates-2_hyp2_count-as-fault_breaker_x19_x20))))
 (:action breaker-close-unexplained_breaker_x17_x18_obs3062_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x17_x18) (fault-count-2_count-as-fault_breaker_x17_x18_n0) (pending_obs3062) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-closed_breaker_x17_x18) (fault-count-2_count-as-fault_breaker_x17_x18_n1) (observed_obs3062) (line-iso-state-may-have-changed_line_x7_x8_obs3062) (not (breaker-state-is-open_breaker_x17_x18)) (not (fault-count-2_count-as-fault_breaker_x17_x18_n0)) (not (dominates-2_hyp3_count-as-fault_breaker_x17_x18)) (not (dominates-2_hyp2_count-as-fault_breaker_x17_x18)) (not (pending_obs3062))))
 (:action breaker-close-unexplained_breaker_x17_x18_obs3062_n1_n2
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x17_x18) (fault-count-2_count-as-fault_breaker_x17_x18_n1) (pending_obs3062) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-closed_breaker_x17_x18) (observed_obs3062) (line-iso-state-may-have-changed_line_x7_x8_obs3062) (not (breaker-state-is-open_breaker_x17_x18)) (not (fault-count-2_count-as-fault_breaker_x17_x18_n1)) (not (pending_obs3062))))
 (:action breaker-reclose_breaker_x17_x18_obs3062_obs3049
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x17_x18) (breaker-auto-reclose-wait_breaker_x17_x18_obs3049) (pending_obs3062) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-closed_breaker_x17_x18) (observed_obs3062) (line-iso-state-may-have-changed_line_x7_x8_obs3062) (breaker-auto-reopen-wait_breaker_x17_x18_obs3062) (not (breaker-state-is-open_breaker_x17_x18)) (not (pending_obs3062))))
 (:action bus-voltage-goes-low-unexplained_bus_x23_low_obs3066_n0_n1
  :parameters ()
  :precondition (and (pending_obs3066) (fault-count-2_count-as-fault_bus_x23_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs3066) (fault-count-2_count-as-fault_bus_x23_n1) (not (pending_obs3066)) (not (fault-count-2_count-as-fault_bus_x23_n0)) (not (dominates-2_hyp3_count-as-fault_bus_x23)) (not (dominates-2_hyp2_count-as-fault_bus_x23)) (not (dominates-2_hyp1_count-as-fault_bus_x23))))
 (:action bus-voltage-goes-normal-unexplained_bus_x5_obs3053_n0_n1
  :parameters ()
  :precondition (and (pending_obs3053) (fault-count-2_count-as-fault_bus_x5_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs3053) (fault-count-2_count-as-fault_bus_x5_n1) (not (pending_obs3053)) (not (fault-count-2_count-as-fault_bus_x5_n0)) (not (dominates-2_hyp3_count-as-fault_bus_x5)) (not (dominates-2_hyp2_count-as-fault_bus_x5)) (not (dominates-2_hyp1_count-as-fault_bus_x5))))
 (:action bus-voltage-goes-normal-unexplained_bus_x24_obs3054_n0_n1
  :parameters ()
  :precondition (and (pending_obs3054) (fault-count-2_count-as-fault_bus_x24_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs3054) (fault-count-2_count-as-fault_bus_x24_n1) (not (pending_obs3054)) (not (fault-count-2_count-as-fault_bus_x24_n0)) (not (dominates-2_hyp3_count-as-fault_bus_x24)) (not (dominates-2_hyp2_count-as-fault_bus_x24)) (not (dominates-2_hyp1_count-as-fault_bus_x24))))
 (:action bus-voltage-goes-normal-unexplained_bus_x25_obs3056_n0_n1
  :parameters ()
  :precondition (and (pending_obs3056) (fault-count-2_count-as-fault_bus_x25_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs3056) (fault-count-2_count-as-fault_bus_x25_n1) (not (pending_obs3056)) (not (fault-count-2_count-as-fault_bus_x25_n0)) (not (dominates-2_hyp3_count-as-fault_bus_x25)) (not (dominates-2_hyp2_count-as-fault_bus_x25)) (not (dominates-2_hyp1_count-as-fault_bus_x25))))
 (:action line-iso-trip-first-breaker-simple-trip-1_line_x7_x8_breaker_x9_x10_breaker_x9_x10_obs3051_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x9_x10) (breaker-ar-status-is-auto_breaker_x9_x10) (pending_obs3051) (fault-count-2_count-as-fault_line_x7_x8_n0) (not_line-isolated_line_x7_x8) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x9_x10) (observed_obs3051) (line-iso-trip-in-progress_line_x7_x8_obs3051) (fault-count-2_count-as-fault_line_x7_x8_n1) (not (breaker-state-is-closed_breaker_x9_x10)) (not (pending_obs3051)) (not (fault-count-2_count-as-fault_line_x7_x8_n0)) (not (not_line-iso-trip-in-progress_line_x7_x8_obs3051)) (not (dominates-2_hyp1_count-as-fault_line_x7_x8))))
 (:action line-iso-trip-first-breaker-simple-trip-1_line_x7_x8_breaker_x9_x10_breaker_x9_x10_obs3051_n1_n2
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x9_x10) (breaker-ar-status-is-auto_breaker_x9_x10) (pending_obs3051) (not_line-isolated_line_x7_x8) (fault-count-2_count-as-fault_line_x7_x8_n1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x9_x10) (observed_obs3051) (line-iso-trip-in-progress_line_x7_x8_obs3051) (not (breaker-state-is-closed_breaker_x9_x10)) (not (pending_obs3051)) (not (not_line-iso-trip-in-progress_line_x7_x8_obs3051)) (not (fault-count-2_count-as-fault_line_x7_x8_n1))))
 (:action line-iso-trip-first-breaker-simple-trip-1_line_x7_x8_breaker_x17_x18_breaker_x17_x18_obs3049_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x17_x18) (breaker-ar-status-is-auto_breaker_x17_x18) (pending_obs3049) (fault-count-2_count-as-fault_line_x7_x8_n0) (not_line-isolated_line_x7_x8) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x17_x18) (observed_obs3049) (breaker-auto-reclose-wait_breaker_x17_x18_obs3049) (fault-count-2_count-as-fault_line_x7_x8_n1) (line-iso-trip-in-progress_line_x7_x8_obs3049) (not (breaker-state-is-closed_breaker_x17_x18)) (not (pending_obs3049)) (not (fault-count-2_count-as-fault_line_x7_x8_n0)) (not (dominates-2_hyp1_count-as-fault_line_x7_x8)) (not (not_line-iso-trip-in-progress_line_x7_x8_obs3049))))
 (:action line-iso-trip-first-breaker-simple-trip-1_line_x7_x8_breaker_x17_x18_breaker_x17_x18_obs3049_n1_n2
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x17_x18) (breaker-ar-status-is-auto_breaker_x17_x18) (pending_obs3049) (not_line-isolated_line_x7_x8) (fault-count-2_count-as-fault_line_x7_x8_n1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x17_x18) (observed_obs3049) (breaker-auto-reclose-wait_breaker_x17_x18_obs3049) (line-iso-trip-in-progress_line_x7_x8_obs3049) (not (breaker-state-is-closed_breaker_x17_x18)) (not (pending_obs3049)) (not (fault-count-2_count-as-fault_line_x7_x8_n1)) (not (not_line-iso-trip-in-progress_line_x7_x8_obs3049))))
 (:action line-iso-trip-first-breaker-simple-trip-1_line_x7_x8_breaker_x19_x20_breaker_x19_x20_obs3048_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x19_x20) (breaker-ar-status-is-auto_breaker_x19_x20) (pending_obs3048) (fault-count-2_count-as-fault_line_x7_x8_n0) (not_line-isolated_line_x7_x8) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x19_x20) (observed_obs3048) (fault-count-2_count-as-fault_line_x7_x8_n1) (line-iso-trip-in-progress_line_x7_x8_obs3048) (not (breaker-state-is-closed_breaker_x19_x20)) (not (pending_obs3048)) (not (fault-count-2_count-as-fault_line_x7_x8_n0)) (not (dominates-2_hyp1_count-as-fault_line_x7_x8)) (not (not_line-iso-trip-in-progress_line_x7_x8_obs3048))))
 (:action line-iso-trip-first-breaker-simple-trip-1_line_x7_x8_breaker_x19_x20_breaker_x19_x20_obs3048_n1_n2
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x19_x20) (breaker-ar-status-is-auto_breaker_x19_x20) (pending_obs3048) (not_line-isolated_line_x7_x8) (fault-count-2_count-as-fault_line_x7_x8_n1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x19_x20) (observed_obs3048) (line-iso-trip-in-progress_line_x7_x8_obs3048) (not (breaker-state-is-closed_breaker_x19_x20)) (not (pending_obs3048)) (not (fault-count-2_count-as-fault_line_x7_x8_n1)) (not (not_line-iso-trip-in-progress_line_x7_x8_obs3048))))
 (:action line-iso-trip-first-breaker-simple-trip-1_line_x21_x22_breaker_x13_x14_breaker_x13_x14_obs3050_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x13_x14) (breaker-ar-status-is-auto_breaker_x13_x14) (pending_obs3050) (fault-count-2_count-as-fault_line_x21_x22_n0) (not_line-isolated_line_x21_x22) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x13_x14) (observed_obs3050) (line-iso-trip-in-progress_line_x21_x22_obs3050) (fault-count-2_count-as-fault_line_x21_x22_n1) (not (breaker-state-is-closed_breaker_x13_x14)) (not (pending_obs3050)) (not (fault-count-2_count-as-fault_line_x21_x22_n0)) (not (not_line-iso-trip-in-progress_line_x21_x22_obs3050)) (not (dominates-2_hyp2_count-as-fault_line_x21_x22))))
 (:action line-iso-trip-first-breaker-simple-trip-2_line_x7_x8_breaker_x9_x10_breaker_x9_x10_obs3051_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x9_x10) (breaker-ar-status-is-non-auto_breaker_x9_x10) (pending_obs3051) (fault-count-2_count-as-fault_line_x7_x8_n0) (not_line-isolated_line_x7_x8) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x9_x10) (observed_obs3051) (line-iso-trip-in-progress_line_x7_x8_obs3051) (fault-count-2_count-as-fault_line_x7_x8_n1) (not (breaker-state-is-closed_breaker_x9_x10)) (not (pending_obs3051)) (not (fault-count-2_count-as-fault_line_x7_x8_n0)) (not (not_line-iso-trip-in-progress_line_x7_x8_obs3051)) (not (dominates-2_hyp1_count-as-fault_line_x7_x8))))
 (:action line-iso-trip-first-breaker-simple-trip-2_line_x7_x8_breaker_x9_x10_breaker_x9_x10_obs3051_n1_n2
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x9_x10) (breaker-ar-status-is-non-auto_breaker_x9_x10) (pending_obs3051) (not_line-isolated_line_x7_x8) (fault-count-2_count-as-fault_line_x7_x8_n1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x9_x10) (observed_obs3051) (line-iso-trip-in-progress_line_x7_x8_obs3051) (not (breaker-state-is-closed_breaker_x9_x10)) (not (pending_obs3051)) (not (not_line-iso-trip-in-progress_line_x7_x8_obs3051)) (not (fault-count-2_count-as-fault_line_x7_x8_n1))))
 (:action line-iso-trip-first-breaker-simple-trip-2_line_x7_x8_breaker_x17_x18_breaker_x17_x18_obs3049_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x17_x18) (breaker-ar-status-is-non-auto_breaker_x17_x18) (pending_obs3049) (fault-count-2_count-as-fault_line_x7_x8_n0) (not_line-isolated_line_x7_x8) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x17_x18) (observed_obs3049) (fault-count-2_count-as-fault_line_x7_x8_n1) (line-iso-trip-in-progress_line_x7_x8_obs3049) (not (breaker-state-is-closed_breaker_x17_x18)) (not (pending_obs3049)) (not (fault-count-2_count-as-fault_line_x7_x8_n0)) (not (dominates-2_hyp1_count-as-fault_line_x7_x8)) (not (not_line-iso-trip-in-progress_line_x7_x8_obs3049))))
 (:action line-iso-trip-first-breaker-simple-trip-2_line_x7_x8_breaker_x17_x18_breaker_x17_x18_obs3049_n1_n2
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x17_x18) (breaker-ar-status-is-non-auto_breaker_x17_x18) (pending_obs3049) (not_line-isolated_line_x7_x8) (fault-count-2_count-as-fault_line_x7_x8_n1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x17_x18) (observed_obs3049) (line-iso-trip-in-progress_line_x7_x8_obs3049) (not (breaker-state-is-closed_breaker_x17_x18)) (not (pending_obs3049)) (not (fault-count-2_count-as-fault_line_x7_x8_n1)) (not (not_line-iso-trip-in-progress_line_x7_x8_obs3049))))
 (:action line-iso-trip-first-breaker-simple-trip-2_line_x7_x8_breaker_x19_x20_breaker_x19_x20_obs3048_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x19_x20) (breaker-ar-status-is-non-auto_breaker_x19_x20) (pending_obs3048) (fault-count-2_count-as-fault_line_x7_x8_n0) (not_line-isolated_line_x7_x8) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x19_x20) (observed_obs3048) (fault-count-2_count-as-fault_line_x7_x8_n1) (line-iso-trip-in-progress_line_x7_x8_obs3048) (not (breaker-state-is-closed_breaker_x19_x20)) (not (pending_obs3048)) (not (fault-count-2_count-as-fault_line_x7_x8_n0)) (not (dominates-2_hyp1_count-as-fault_line_x7_x8)) (not (not_line-iso-trip-in-progress_line_x7_x8_obs3048))))
 (:action line-iso-trip-first-breaker-simple-trip-2_line_x7_x8_breaker_x19_x20_breaker_x19_x20_obs3048_n1_n2
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x19_x20) (breaker-ar-status-is-non-auto_breaker_x19_x20) (pending_obs3048) (not_line-isolated_line_x7_x8) (fault-count-2_count-as-fault_line_x7_x8_n1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x19_x20) (observed_obs3048) (line-iso-trip-in-progress_line_x7_x8_obs3048) (not (breaker-state-is-closed_breaker_x19_x20)) (not (pending_obs3048)) (not (fault-count-2_count-as-fault_line_x7_x8_n1)) (not (not_line-iso-trip-in-progress_line_x7_x8_obs3048))))
 (:action line-iso-trip-first-breaker-simple-trip-2_line_x21_x22_breaker_x13_x14_breaker_x13_x14_obs3050_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x13_x14) (breaker-ar-status-is-non-auto_breaker_x13_x14) (pending_obs3050) (fault-count-2_count-as-fault_line_x21_x22_n0) (not_line-isolated_line_x21_x22) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x13_x14) (observed_obs3050) (line-iso-trip-in-progress_line_x21_x22_obs3050) (fault-count-2_count-as-fault_line_x21_x22_n1) (not (breaker-state-is-closed_breaker_x13_x14)) (not (pending_obs3050)) (not (fault-count-2_count-as-fault_line_x21_x22_n0)) (not (not_line-iso-trip-in-progress_line_x21_x22_obs3050)) (not (dominates-2_hyp2_count-as-fault_line_x21_x22))))
 (:action line-iso-trip-more-breaker-simple-trip-1_line_x7_x8_breaker_x9_x10_breaker_x9_x10_obs3051_obs3048
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x9_x10) (breaker-ar-status-is-auto_breaker_x9_x10) (pending_obs3051) (line-iso-trip-in-progress_line_x7_x8_obs3048) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x9_x10) (observed_obs3051) (not (breaker-state-is-closed_breaker_x9_x10)) (not (pending_obs3051))))
 (:action line-iso-trip-more-breaker-simple-trip-1_line_x7_x8_breaker_x9_x10_breaker_x9_x10_obs3051_obs3049
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x9_x10) (breaker-ar-status-is-auto_breaker_x9_x10) (pending_obs3051) (line-iso-trip-in-progress_line_x7_x8_obs3049) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x9_x10) (observed_obs3051) (not (breaker-state-is-closed_breaker_x9_x10)) (not (pending_obs3051))))
 (:action line-iso-trip-more-breaker-simple-trip-1_line_x7_x8_breaker_x17_x18_breaker_x17_x18_obs3049_obs3048
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x17_x18) (breaker-ar-status-is-auto_breaker_x17_x18) (pending_obs3049) (line-iso-trip-in-progress_line_x7_x8_obs3048) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x17_x18) (observed_obs3049) (breaker-auto-reclose-wait_breaker_x17_x18_obs3049) (not (breaker-state-is-closed_breaker_x17_x18)) (not (pending_obs3049))))
 (:action line-iso-trip-more-breaker-simple-trip-1_line_x7_x8_breaker_x17_x18_breaker_x17_x18_obs3049_obs3051
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x17_x18) (breaker-ar-status-is-auto_breaker_x17_x18) (pending_obs3049) (line-iso-trip-in-progress_line_x7_x8_obs3051) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x17_x18) (observed_obs3049) (breaker-auto-reclose-wait_breaker_x17_x18_obs3049) (not (breaker-state-is-closed_breaker_x17_x18)) (not (pending_obs3049))))
 (:action line-iso-trip-more-breaker-simple-trip-1_line_x7_x8_breaker_x19_x20_breaker_x19_x20_obs3048_obs3049
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x19_x20) (breaker-ar-status-is-auto_breaker_x19_x20) (pending_obs3048) (line-iso-trip-in-progress_line_x7_x8_obs3049) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x19_x20) (observed_obs3048) (not (breaker-state-is-closed_breaker_x19_x20)) (not (pending_obs3048))))
 (:action line-iso-trip-more-breaker-simple-trip-1_line_x7_x8_breaker_x19_x20_breaker_x19_x20_obs3048_obs3051
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x19_x20) (breaker-ar-status-is-auto_breaker_x19_x20) (pending_obs3048) (line-iso-trip-in-progress_line_x7_x8_obs3051) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x19_x20) (observed_obs3048) (not (breaker-state-is-closed_breaker_x19_x20)) (not (pending_obs3048))))
 (:action line-iso-trip-more-breaker-simple-trip-2_line_x7_x8_breaker_x9_x10_breaker_x9_x10_obs3051_obs3048
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x9_x10) (breaker-ar-status-is-non-auto_breaker_x9_x10) (pending_obs3051) (line-iso-trip-in-progress_line_x7_x8_obs3048) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x9_x10) (observed_obs3051) (not (breaker-state-is-closed_breaker_x9_x10)) (not (pending_obs3051))))
 (:action line-iso-trip-more-breaker-simple-trip-2_line_x7_x8_breaker_x9_x10_breaker_x9_x10_obs3051_obs3049
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x9_x10) (breaker-ar-status-is-non-auto_breaker_x9_x10) (pending_obs3051) (line-iso-trip-in-progress_line_x7_x8_obs3049) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x9_x10) (observed_obs3051) (not (breaker-state-is-closed_breaker_x9_x10)) (not (pending_obs3051))))
 (:action line-iso-trip-more-breaker-simple-trip-2_line_x7_x8_breaker_x17_x18_breaker_x17_x18_obs3049_obs3048
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x17_x18) (breaker-ar-status-is-non-auto_breaker_x17_x18) (pending_obs3049) (line-iso-trip-in-progress_line_x7_x8_obs3048) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x17_x18) (observed_obs3049) (not (breaker-state-is-closed_breaker_x17_x18)) (not (pending_obs3049))))
 (:action line-iso-trip-more-breaker-simple-trip-2_line_x7_x8_breaker_x17_x18_breaker_x17_x18_obs3049_obs3051
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x17_x18) (breaker-ar-status-is-non-auto_breaker_x17_x18) (pending_obs3049) (line-iso-trip-in-progress_line_x7_x8_obs3051) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x17_x18) (observed_obs3049) (not (breaker-state-is-closed_breaker_x17_x18)) (not (pending_obs3049))))
 (:action line-iso-trip-more-breaker-simple-trip-2_line_x7_x8_breaker_x19_x20_breaker_x19_x20_obs3048_obs3049
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x19_x20) (breaker-ar-status-is-non-auto_breaker_x19_x20) (pending_obs3048) (line-iso-trip-in-progress_line_x7_x8_obs3049) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x19_x20) (observed_obs3048) (not (breaker-state-is-closed_breaker_x19_x20)) (not (pending_obs3048))))
 (:action line-iso-trip-more-breaker-simple-trip-2_line_x7_x8_breaker_x19_x20_breaker_x19_x20_obs3048_obs3051
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x19_x20) (breaker-ar-status-is-non-auto_breaker_x19_x20) (pending_obs3048) (line-iso-trip-in-progress_line_x7_x8_obs3051) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x19_x20) (observed_obs3048) (not (breaker-state-is-closed_breaker_x19_x20)) (not (pending_obs3048))))
 (:action line-finish-iso-trip-2_line_x21_x22_breaker_x27_x28_breaker_x13_x14_obs3050
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x13_x14) (breaker-state-is-open_breaker_x27_x28) (line-iso-trip-in-progress_line_x21_x22_obs3050) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (not_line-iso-trip-in-progress_line_x21_x22_obs3050) (line-isolated_line_x21_x22) (line-iso-state-changed_line_x21_x22_obs3050) (not (not_line-isolated_line_x21_x22)) (not (line-iso-trip-in-progress_line_x21_x22_obs3050))))
 (:action line-finish-iso-trip-3_line_x7_x8_breaker_x9_x10_breaker_x19_x20_breaker_x17_x18_obs3048
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x9_x10) (breaker-state-is-open_breaker_x17_x18) (breaker-state-is-open_breaker_x19_x20) (line-iso-trip-in-progress_line_x7_x8_obs3048) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (not_line-iso-trip-in-progress_line_x7_x8_obs3048) (line-iso-state-changed_line_x7_x8_obs3048) (line-isolated_line_x7_x8) (not (not_line-isolated_line_x7_x8)) (not (line-iso-trip-in-progress_line_x7_x8_obs3048))))
 (:action line-finish-iso-trip-3_line_x7_x8_breaker_x9_x10_breaker_x19_x20_breaker_x17_x18_obs3049
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x9_x10) (breaker-state-is-open_breaker_x17_x18) (breaker-state-is-open_breaker_x19_x20) (line-iso-trip-in-progress_line_x7_x8_obs3049) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (not_line-iso-trip-in-progress_line_x7_x8_obs3049) (line-isolated_line_x7_x8) (line-iso-state-changed_line_x7_x8_obs3049) (not (not_line-isolated_line_x7_x8)) (not (line-iso-trip-in-progress_line_x7_x8_obs3049))))
 (:action line-finish-iso-trip-3_line_x7_x8_breaker_x9_x10_breaker_x19_x20_breaker_x17_x18_obs3051
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x9_x10) (breaker-state-is-open_breaker_x17_x18) (breaker-state-is-open_breaker_x19_x20) (line-iso-trip-in-progress_line_x7_x8_obs3051) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (not_line-iso-trip-in-progress_line_x7_x8_obs3051) (line-isolated_line_x7_x8) (line-iso-state-changed_line_x7_x8_obs3051) (not (not_line-isolated_line_x7_x8)) (not (line-iso-trip-in-progress_line_x7_x8_obs3051))))
 (:action line-set-state-isolated-2_line_x21_x22_breaker_x27_x28_breaker_x13_x14_obs3050
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x13_x14) (breaker-state-is-open_breaker_x27_x28) (line-iso-state-may-have-changed_line_x21_x22_obs3050) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (line-isolated_line_x21_x22) (line-iso-state-changed_line_x21_x22_obs3050) (not (not_line-isolated_line_x21_x22))))
 (:action line-set-state-isolated-3_line_x7_x8_breaker_x9_x10_breaker_x19_x20_breaker_x17_x18_obs3048
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x9_x10) (breaker-state-is-open_breaker_x17_x18) (breaker-state-is-open_breaker_x19_x20) (line-iso-state-may-have-changed_line_x7_x8_obs3048) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (line-iso-state-changed_line_x7_x8_obs3048) (line-isolated_line_x7_x8) (not (not_line-isolated_line_x7_x8))))
 (:action line-set-state-isolated-3_line_x7_x8_breaker_x9_x10_breaker_x19_x20_breaker_x17_x18_obs3049
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x9_x10) (breaker-state-is-open_breaker_x17_x18) (breaker-state-is-open_breaker_x19_x20) (line-iso-state-may-have-changed_line_x7_x8_obs3049) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (line-isolated_line_x7_x8) (line-iso-state-changed_line_x7_x8_obs3049) (not (not_line-isolated_line_x7_x8))))
 (:action line-set-state-isolated-3_line_x7_x8_breaker_x9_x10_breaker_x19_x20_breaker_x17_x18_obs3051
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x9_x10) (breaker-state-is-open_breaker_x17_x18) (breaker-state-is-open_breaker_x19_x20) (line-iso-state-may-have-changed_line_x7_x8_obs3051) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (line-isolated_line_x7_x8) (line-iso-state-changed_line_x7_x8_obs3051) (not (not_line-isolated_line_x7_x8))))
 (:action line-re-energise-isolated-3c_line_x7_x8_breaker_x9_x10_breaker_x19_x20_breaker_x17_x18_obs3048
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x17_x18) (line-iso-state-may-have-changed_line_x7_x8_obs3048) (line-isolated_line_x7_x8) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (not_line-isolated_line_x7_x8) (line-iso-state-changed_line_x7_x8_obs3048) (not (line-isolated_line_x7_x8))))
 (:action line-re-energise-isolated-3c_line_x7_x8_breaker_x9_x10_breaker_x19_x20_breaker_x17_x18_obs3049
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x17_x18) (line-iso-state-may-have-changed_line_x7_x8_obs3049) (line-isolated_line_x7_x8) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (not_line-isolated_line_x7_x8) (line-iso-state-changed_line_x7_x8_obs3049) (not (line-isolated_line_x7_x8))))
 (:action line-re-energise-isolated-3c_line_x7_x8_breaker_x9_x10_breaker_x19_x20_breaker_x17_x18_obs3051
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x17_x18) (line-iso-state-may-have-changed_line_x7_x8_obs3051) (line-isolated_line_x7_x8) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (not_line-isolated_line_x7_x8) (line-iso-state-changed_line_x7_x8_obs3051) (not (line-isolated_line_x7_x8))))
 (:action line-re-energise-isolated-3c_line_x7_x8_breaker_x9_x10_breaker_x19_x20_breaker_x17_x18_obs3062
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x17_x18) (line-iso-state-may-have-changed_line_x7_x8_obs3062) (line-isolated_line_x7_x8) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (not_line-isolated_line_x7_x8) (line-iso-state-changed_line_x7_x8_obs3062) (not (line-isolated_line_x7_x8))))
 (:action line-init-state-isolated-2_line_x21_x22_breaker_x27_x28_breaker_x13_x14
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x13_x14) (breaker-state-is-open_breaker_x27_x28) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (line-isolated_line_x21_x22) (not (not_line-isolated_line_x21_x22))))
 (:action line-init-state-isolated-3_line_x7_x8_breaker_x9_x10_breaker_x19_x20_breaker_x17_x18
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x9_x10) (breaker-state-is-open_breaker_x17_x18) (breaker-state-is-open_breaker_x19_x20) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (line-isolated_line_x7_x8) (not (not_line-isolated_line_x7_x8))))
 (:action line-voltage-goes-low-unexplained-1_line_x7_x8_low_obs3052_n0_n1
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_line_x7_x8_n0) (pending_obs3052) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (fault-count-2_count-as-fault_line_x7_x8_n1) (observed_obs3052) (not (fault-count-2_count-as-fault_line_x7_x8_n0)) (not (dominates-2_hyp1_count-as-fault_line_x7_x8)) (not (pending_obs3052))))
 (:action line-voltage-goes-low-unexplained-1_line_x7_x8_low_obs3052_n1_n2
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_line_x7_x8_n1) (pending_obs3052) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs3052) (not (fault-count-2_count-as-fault_line_x7_x8_n1)) (not (pending_obs3052))))
 (:action line-voltage-goes-to-zero-unexplained-1_line_x21_x22_obs3058_n0_n1
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_line_x21_x22_n0) (pending_obs3058) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (fault-count-2_count-as-fault_line_x21_x22_n1) (observed_obs3058) (not (fault-count-2_count-as-fault_line_x21_x22_n0)) (not (dominates-2_hyp2_count-as-fault_line_x21_x22)) (not (pending_obs3058))))
 (:action line-voltage-goes-to-zero-unexplained-1_line_x21_x22_obs3058_n1_n2
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_line_x21_x22_n1) (pending_obs3058) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs3058) (not (fault-count-2_count-as-fault_line_x21_x22_n1)) (not (pending_obs3058))))
 (:action line-voltage-goes-low-when-isolated-1_line_x7_x8_low_obs3052_obs3048
  :parameters ()
  :precondition (and (line-iso-state-changed_line_x7_x8_obs3048) (line-isolated_line_x7_x8) (pending_obs3052) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs3052) (not (pending_obs3052))))
 (:action line-voltage-goes-low-when-isolated-1_line_x7_x8_low_obs3052_obs3049
  :parameters ()
  :precondition (and (line-isolated_line_x7_x8) (line-iso-state-changed_line_x7_x8_obs3049) (pending_obs3052) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs3052) (not (pending_obs3052))))
 (:action line-voltage-goes-low-when-isolated-1_line_x7_x8_low_obs3052_obs3051
  :parameters ()
  :precondition (and (line-isolated_line_x7_x8) (line-iso-state-changed_line_x7_x8_obs3051) (pending_obs3052) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs3052) (not (pending_obs3052))))
 (:action line-voltage-goes-to-zero-when-isolated-1_line_x21_x22_obs3058_obs3050
  :parameters ()
  :precondition (and (line-isolated_line_x21_x22) (line-iso-state-changed_line_x21_x22_obs3050) (pending_obs3058) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs3058) (not (pending_obs3058))))
 (:action line-voltage-goes-low-when-re-energised-1_line_x7_x8_low_obs3052_obs3048
  :parameters ()
  :precondition (and (not_line-isolated_line_x7_x8) (line-iso-state-changed_line_x7_x8_obs3048) (pending_obs3052) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs3052) (not (pending_obs3052))))
 (:action line-voltage-goes-low-when-re-energised-1_line_x7_x8_low_obs3052_obs3049
  :parameters ()
  :precondition (and (not_line-isolated_line_x7_x8) (line-iso-state-changed_line_x7_x8_obs3049) (pending_obs3052) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs3052) (not (pending_obs3052))))
 (:action line-voltage-goes-low-when-re-energised-1_line_x7_x8_low_obs3052_obs3051
  :parameters ()
  :precondition (and (not_line-isolated_line_x7_x8) (line-iso-state-changed_line_x7_x8_obs3051) (pending_obs3052) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs3052) (not (pending_obs3052))))
 (:action generator-init-status-was-on_generator_x26_1
  :parameters ()
  :precondition (and (generator-status-is-unknown_generator_x26_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (generator-status-is-on_generator_x26_1) (not (generator-status-is-unknown_generator_x26_1))))
 (:action generator-init-status-was-on_generator_x16_1
  :parameters ()
  :precondition (and (generator-status-is-unknown_generator_x16_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (generator-status-is-on_generator_x16_1) (not (generator-status-is-unknown_generator_x16_1))))
 (:action generator-init-status-was-off_generator_x26_1
  :parameters ()
  :precondition (and (generator-status-is-unknown_generator_x26_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (generator-status-is-off_generator_x26_1) (not (generator-status-is-unknown_generator_x26_1))))
 (:action generator-init-status-was-off_generator_x16_1
  :parameters ()
  :precondition (and (generator-status-is-unknown_generator_x16_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (generator-status-is-off_generator_x16_1) (not (generator-status-is-unknown_generator_x16_1))))
 (:action generator-begin-shutdown_generator_x26_1_n0_n1
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x26_1) (fault-count-2_count-as-fault_generator_x26_1_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (generator-status-is-shutting-down_generator_x26_1) (fault-count-2_count-as-fault_generator_x26_1_n1) (not (generator-status-is-on_generator_x26_1)) (not (fault-count-2_count-as-fault_generator_x26_1_n0)) (not (dominates-2_hyp3_count-as-fault_generator_x26_1)) (not (dominates-2_hyp2_count-as-fault_generator_x26_1)) (not (dominates-2_hyp1_count-as-fault_generator_x26_1))))
 (:action generator-begin-shutdown_generator_x26_1_n1_n2
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x26_1) (fault-count-2_count-as-fault_generator_x26_1_n1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (generator-status-is-shutting-down_generator_x26_1) (not (generator-status-is-on_generator_x26_1)) (not (fault-count-2_count-as-fault_generator_x26_1_n1))))
 (:action generator-begin-shutdown_generator_x16_1_n0_n1
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x16_1) (fault-count-2_count-as-fault_generator_x16_1_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (generator-status-is-shutting-down_generator_x16_1) (fault-count-2_count-as-fault_generator_x16_1_n1) (not (generator-status-is-on_generator_x16_1)) (not (fault-count-2_count-as-fault_generator_x16_1_n0))))
 (:action generator-begin-shutdown_generator_x16_1_n1_n2
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x16_1) (fault-count-2_count-as-fault_generator_x16_1_n1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (generator-status-is-shutting-down_generator_x16_1) (not (generator-status-is-on_generator_x16_1)) (not (fault-count-2_count-as-fault_generator_x16_1_n1)) (not (dominates-2_hyp3_count-as-fault_generator_x16_1)) (not (dominates-2_hyp2_count-as-fault_generator_x16_1)) (not (dominates-2_hyp1_count-as-fault_generator_x16_1))))
 (:action generator-shutdown-breaker-open-breaker-open_generator_x16_1_breaker_x15_x16_bus_x16_breaker_x15_x16_obs3065
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x15_x16) (pending_obs3065) (generator-status-is-shutting-down_generator_x16_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs3065) (not (breaker-state-is-closed_breaker_x15_x16)) (not (pending_obs3065))))
 (:action generator-shutdown-turn-off_generator_x16_1_obs3055
  :parameters ()
  :precondition (and (generator-status-is-shutting-down_generator_x16_1) (pending_obs3055) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs3055) (not (pending_obs3055))))
 (:action generator-shutdown-complete_generator_x26_1
  :parameters ()
  :precondition (and (generator-status-is-shutting-down_generator_x26_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (generator-status-is-off_generator_x26_1) (not (generator-status-is-shutting-down_generator_x26_1))))
 (:action generator-shutdown-complete_generator_x16_1
  :parameters ()
  :precondition (and (generator-status-is-shutting-down_generator_x16_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (generator-status-is-off_generator_x16_1) (not (generator-status-is-shutting-down_generator_x16_1))))
 (:action generator-begin-startup_generator_x26_1_n0_n1
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x26_1) (fault-count-2_count-as-fault_generator_x26_1_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (fault-count-2_count-as-fault_generator_x26_1_n1) (generator-status-is-starting-up_generator_x26_1) (not (generator-status-is-on_generator_x26_1)) (not (fault-count-2_count-as-fault_generator_x26_1_n0)) (not (dominates-2_hyp3_count-as-fault_generator_x26_1)) (not (dominates-2_hyp2_count-as-fault_generator_x26_1)) (not (dominates-2_hyp1_count-as-fault_generator_x26_1))))
 (:action generator-begin-startup_generator_x26_1_n1_n2
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x26_1) (fault-count-2_count-as-fault_generator_x26_1_n1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (generator-status-is-starting-up_generator_x26_1) (not (generator-status-is-on_generator_x26_1)) (not (fault-count-2_count-as-fault_generator_x26_1_n1))))
 (:action generator-begin-startup_generator_x16_1_n0_n1
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x16_1) (fault-count-2_count-as-fault_generator_x16_1_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (fault-count-2_count-as-fault_generator_x16_1_n1) (generator-status-is-starting-up_generator_x16_1) (not (generator-status-is-on_generator_x16_1)) (not (fault-count-2_count-as-fault_generator_x16_1_n0))))
 (:action generator-begin-startup_generator_x16_1_n1_n2
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x16_1) (fault-count-2_count-as-fault_generator_x16_1_n1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (generator-status-is-starting-up_generator_x16_1) (not (generator-status-is-on_generator_x16_1)) (not (fault-count-2_count-as-fault_generator_x16_1_n1)) (not (dominates-2_hyp3_count-as-fault_generator_x16_1)) (not (dominates-2_hyp2_count-as-fault_generator_x16_1)) (not (dominates-2_hyp1_count-as-fault_generator_x16_1))))
 (:action generator-startup-complete_generator_x26_1
  :parameters ()
  :precondition (and (generator-status-is-starting-up_generator_x26_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (generator-status-is-on_generator_x26_1) (not (generator-status-is-starting-up_generator_x26_1))))
 (:action generator-startup-complete_generator_x16_1
  :parameters ()
  :precondition (and (generator-status-is-starting-up_generator_x16_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (generator-status-is-on_generator_x16_1) (not (generator-status-is-starting-up_generator_x16_1))))
 (:action generator-runback-alarm_generator_x26_1_obs3067_n0_n1
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x26_1_n0) (pending_obs3067) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (fault-count-2_count-as-fault_generator_x26_1_n1) (observed_obs3067) (not (fault-count-2_count-as-fault_generator_x26_1_n0)) (not (dominates-2_hyp3_count-as-fault_generator_x26_1)) (not (dominates-2_hyp2_count-as-fault_generator_x26_1)) (not (dominates-2_hyp1_count-as-fault_generator_x26_1)) (not (pending_obs3067))))
 (:action generator-runback-alarm_generator_x26_1_obs3067_n1_n2
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x26_1_n1) (pending_obs3067) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs3067) (not (fault-count-2_count-as-fault_generator_x26_1_n1)) (not (pending_obs3067))))
 (:action generator-runback-alarm_generator_x16_1_obs3061_n1_n2
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x16_1_n1) (pending_obs3061) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs3061) (not (fault-count-2_count-as-fault_generator_x16_1_n1)) (not (dominates-2_hyp3_count-as-fault_generator_x16_1)) (not (dominates-2_hyp2_count-as-fault_generator_x16_1)) (not (dominates-2_hyp1_count-as-fault_generator_x16_1)) (not (pending_obs3061))))
 (:action advance-to-obs_obs3053
  :parameters ()
  :precondition (and (observed_obs3051) (observed_obs3050) (observed_obs3049) (observed_obs3048) (observed_obs3052) (future_obs3053) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs3053) (not (future_obs3053))))
 (:action advance-to-obs_obs3054
  :parameters ()
  :precondition (and (observed_obs3051) (observed_obs3050) (observed_obs3049) (observed_obs3048) (observed_obs3052) (future_obs3054) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs3054) (not (future_obs3054))))
 (:action advance-to-obs_obs3055
  :parameters ()
  :precondition (and (observed_obs3051) (observed_obs3050) (observed_obs3049) (observed_obs3048) (observed_obs3052) (future_obs3055) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs3055) (not (future_obs3055))))
 (:action advance-to-obs_obs3056
  :parameters ()
  :precondition (and (observed_obs3051) (observed_obs3050) (observed_obs3049) (observed_obs3048) (observed_obs3052) (future_obs3056) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs3056) (not (future_obs3056))))
 (:action advance-to-obs_obs3057
  :parameters ()
  :precondition (and (observed_obs3051) (observed_obs3050) (observed_obs3049) (observed_obs3048) (observed_obs3052) (future_obs3057) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs3057) (not (future_obs3057))))
 (:action advance-to-obs_obs3058
  :parameters ()
  :precondition (and (observed_obs3057) (observed_obs3053) (observed_obs3054) (observed_obs3056) (not_line-iso-trip-in-progress_line_x7_x8_obs3051) (not_line-iso-trip-in-progress_line_x7_x8_obs3049) (not_line-iso-trip-in-progress_line_x7_x8_obs3048) (not_line-iso-trip-in-progress_line_x21_x22_obs3050) (observed_obs3055) (future_obs3058) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs3058) (not (future_obs3058))))
 (:action advance-to-obs_obs3059
  :parameters ()
  :precondition (and (observed_obs3057) (observed_obs3053) (observed_obs3054) (observed_obs3056) (not_line-iso-trip-in-progress_line_x7_x8_obs3051) (not_line-iso-trip-in-progress_line_x7_x8_obs3049) (not_line-iso-trip-in-progress_line_x7_x8_obs3048) (not_line-iso-trip-in-progress_line_x21_x22_obs3050) (observed_obs3055) (future_obs3059) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs3059) (not (future_obs3059))))
 (:action advance-to-obs_obs3060
  :parameters ()
  :precondition (and (observed_obs3057) (observed_obs3053) (observed_obs3054) (observed_obs3056) (not_line-iso-trip-in-progress_line_x7_x8_obs3051) (not_line-iso-trip-in-progress_line_x7_x8_obs3049) (not_line-iso-trip-in-progress_line_x7_x8_obs3048) (not_line-iso-trip-in-progress_line_x21_x22_obs3050) (observed_obs3055) (future_obs3060) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs3060) (not (future_obs3060))))
 (:action advance-to-obs_obs3061
  :parameters ()
  :precondition (and (observed_obs3057) (observed_obs3053) (observed_obs3054) (observed_obs3056) (not_line-iso-trip-in-progress_line_x7_x8_obs3051) (not_line-iso-trip-in-progress_line_x7_x8_obs3049) (not_line-iso-trip-in-progress_line_x7_x8_obs3048) (not_line-iso-trip-in-progress_line_x21_x22_obs3050) (observed_obs3055) (future_obs3061) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs3061) (not (future_obs3061))))
 (:action advance-to-obs_obs3062
  :parameters ()
  :precondition (and (observed_obs3057) (observed_obs3053) (observed_obs3054) (observed_obs3056) (not_line-iso-trip-in-progress_line_x7_x8_obs3051) (not_line-iso-trip-in-progress_line_x7_x8_obs3049) (not_line-iso-trip-in-progress_line_x7_x8_obs3048) (not_line-iso-trip-in-progress_line_x21_x22_obs3050) (observed_obs3055) (future_obs3062) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs3062) (not (future_obs3062))))
 (:action advance-to-obs_obs3063
  :parameters ()
  :precondition (and (observed_obs3057) (observed_obs3053) (observed_obs3054) (observed_obs3056) (not_line-iso-trip-in-progress_line_x7_x8_obs3051) (not_line-iso-trip-in-progress_line_x7_x8_obs3049) (not_line-iso-trip-in-progress_line_x7_x8_obs3048) (not_line-iso-trip-in-progress_line_x21_x22_obs3050) (observed_obs3055) (future_obs3063) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs3063) (not (future_obs3063))))
 (:action advance-to-obs_obs3064
  :parameters ()
  :precondition (and (observed_obs3057) (observed_obs3053) (observed_obs3054) (observed_obs3056) (not_line-iso-trip-in-progress_line_x7_x8_obs3051) (not_line-iso-trip-in-progress_line_x7_x8_obs3049) (not_line-iso-trip-in-progress_line_x7_x8_obs3048) (not_line-iso-trip-in-progress_line_x21_x22_obs3050) (observed_obs3055) (future_obs3064) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs3064) (not (future_obs3064))))
 (:action advance-to-obs_obs3065
  :parameters ()
  :precondition (and (observed_obs3057) (observed_obs3053) (observed_obs3054) (observed_obs3056) (not_line-iso-trip-in-progress_line_x7_x8_obs3051) (not_line-iso-trip-in-progress_line_x7_x8_obs3049) (not_line-iso-trip-in-progress_line_x7_x8_obs3048) (not_line-iso-trip-in-progress_line_x21_x22_obs3050) (observed_obs3055) (future_obs3065) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs3065) (not (future_obs3065))))
 (:action advance-to-obs_obs3066
  :parameters ()
  :precondition (and (observed_obs3057) (observed_obs3053) (observed_obs3054) (observed_obs3056) (not_line-iso-trip-in-progress_line_x7_x8_obs3051) (not_line-iso-trip-in-progress_line_x7_x8_obs3049) (not_line-iso-trip-in-progress_line_x7_x8_obs3048) (not_line-iso-trip-in-progress_line_x21_x22_obs3050) (observed_obs3055) (future_obs3066) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs3066) (not (future_obs3066))))
 (:action advance-to-obs_obs3067
  :parameters ()
  :precondition (and (observed_obs3057) (observed_obs3053) (observed_obs3054) (observed_obs3056) (not_line-iso-trip-in-progress_line_x7_x8_obs3051) (not_line-iso-trip-in-progress_line_x7_x8_obs3049) (not_line-iso-trip-in-progress_line_x7_x8_obs3048) (not_line-iso-trip-in-progress_line_x21_x22_obs3050) (observed_obs3055) (future_obs3067) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs3067) (not (future_obs3067))))
 (:action set_goal_4_constraint0
  :parameters ()
  :precondition (and (observed_obs3063) (observed_obs3064) (observed_obs3060) (observed_obs3059) (observed_obs3051) (dominates-2_hyp3_count-as-fault_breaker_x9_x10) (observed_obs3057) (observed_obs3050) (observed_obs3065) (observed_obs3049) (observed_obs3048) (observed_obs3062) (observed_obs3066) (observed_obs3053) (observed_obs3054) (observed_obs3056) (observed_obs3052) (observed_obs3058) (observed_obs3055) (observed_obs3067) (observed_obs3061) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (achieved_constraint0) (not (not_at_end_constraint0))))
 (:action set_goal_6_constraint0
  :parameters ()
  :precondition (and (observed_obs3063) (observed_obs3064) (observed_obs3060) (observed_obs3059) (observed_obs3051) (observed_obs3057) (observed_obs3050) (dominates-2_hyp3_count-as-fault_breaker_x13_x14) (observed_obs3065) (observed_obs3049) (observed_obs3048) (observed_obs3062) (observed_obs3066) (observed_obs3053) (observed_obs3054) (observed_obs3056) (observed_obs3052) (observed_obs3058) (observed_obs3055) (observed_obs3067) (observed_obs3061) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (achieved_constraint0) (not (not_at_end_constraint0))))
 (:action set_goal_7_constraint0
  :parameters ()
  :precondition (and (observed_obs3063) (observed_obs3064) (observed_obs3060) (observed_obs3059) (observed_obs3051) (observed_obs3057) (observed_obs3050) (observed_obs3065) (observed_obs3049) (dominates-2_hyp3_count-as-fault_breaker_x17_x18) (observed_obs3048) (observed_obs3062) (observed_obs3066) (observed_obs3053) (observed_obs3054) (observed_obs3056) (observed_obs3052) (observed_obs3058) (observed_obs3055) (observed_obs3067) (observed_obs3061) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (achieved_constraint0) (not (not_at_end_constraint0))))
 (:action set_goal_8_constraint0
  :parameters ()
  :precondition (and (observed_obs3063) (observed_obs3064) (observed_obs3060) (observed_obs3059) (observed_obs3051) (observed_obs3057) (observed_obs3050) (observed_obs3065) (observed_obs3049) (observed_obs3048) (dominates-2_hyp3_count-as-fault_breaker_x19_x20) (observed_obs3062) (observed_obs3066) (observed_obs3053) (observed_obs3054) (observed_obs3056) (observed_obs3052) (observed_obs3058) (observed_obs3055) (observed_obs3067) (observed_obs3061) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (achieved_constraint0) (not (not_at_end_constraint0))))
 (:action set_goal_4_constraint1
  :parameters ()
  :precondition (and (observed_obs3063) (observed_obs3064) (observed_obs3060) (observed_obs3059) (observed_obs3051) (dominates-2_hyp2_count-as-fault_breaker_x9_x10) (observed_obs3057) (observed_obs3050) (observed_obs3065) (observed_obs3049) (observed_obs3048) (observed_obs3062) (observed_obs3066) (observed_obs3053) (observed_obs3054) (observed_obs3056) (observed_obs3052) (observed_obs3058) (observed_obs3055) (observed_obs3067) (observed_obs3061) (achieved_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (achieved_constraint1) (not (not_at_end_constraint1))))
 (:action set_goal_6_constraint1
  :parameters ()
  :precondition (and (observed_obs3063) (observed_obs3064) (observed_obs3060) (observed_obs3059) (observed_obs3051) (observed_obs3057) (observed_obs3050) (observed_obs3065) (observed_obs3049) (dominates-2_hyp2_count-as-fault_breaker_x17_x18) (observed_obs3048) (observed_obs3062) (observed_obs3066) (observed_obs3053) (observed_obs3054) (observed_obs3056) (observed_obs3052) (observed_obs3058) (observed_obs3055) (observed_obs3067) (observed_obs3061) (achieved_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (achieved_constraint1) (not (not_at_end_constraint1))))
 (:action set_goal_7_constraint1
  :parameters ()
  :precondition (and (observed_obs3063) (observed_obs3064) (observed_obs3060) (observed_obs3059) (observed_obs3051) (observed_obs3057) (observed_obs3050) (observed_obs3065) (observed_obs3049) (observed_obs3048) (dominates-2_hyp2_count-as-fault_breaker_x19_x20) (observed_obs3062) (observed_obs3066) (observed_obs3053) (observed_obs3054) (observed_obs3056) (observed_obs3052) (observed_obs3058) (observed_obs3055) (observed_obs3067) (observed_obs3061) (achieved_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (achieved_constraint1) (not (not_at_end_constraint1))))
 (:action set_goal_12_constraint1
  :parameters ()
  :precondition (and (observed_obs3063) (observed_obs3064) (observed_obs3060) (observed_obs3059) (observed_obs3051) (observed_obs3057) (observed_obs3050) (observed_obs3065) (observed_obs3049) (observed_obs3048) (observed_obs3062) (observed_obs3066) (observed_obs3053) (observed_obs3054) (observed_obs3056) (dominates-2_hyp2_count-as-fault_line_x21_x22) (observed_obs3052) (observed_obs3058) (observed_obs3055) (observed_obs3067) (observed_obs3061) (achieved_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (achieved_constraint1) (not (not_at_end_constraint1))))
 (:action set_goal_5_constraint2
  :parameters ()
  :precondition (and (observed_obs3063) (observed_obs3064) (observed_obs3060) (observed_obs3059) (observed_obs3051) (observed_obs3057) (observed_obs3050) (dominates-2_hyp1_count-as-fault_breaker_x13_x14) (observed_obs3065) (observed_obs3049) (observed_obs3048) (observed_obs3062) (observed_obs3066) (observed_obs3053) (observed_obs3054) (observed_obs3056) (observed_obs3052) (observed_obs3058) (observed_obs3055) (observed_obs3067) (observed_obs3061) (achieved_constraint0) (achieved_constraint1) (not_at_end_constraint2))
  :effect (and (achieved_constraint2) (not (not_at_end_constraint2))))
 (:action set_goal_10_constraint2
  :parameters ()
  :precondition (and (observed_obs3063) (observed_obs3064) (observed_obs3060) (observed_obs3059) (observed_obs3051) (observed_obs3057) (observed_obs3050) (observed_obs3065) (observed_obs3049) (observed_obs3048) (observed_obs3062) (observed_obs3066) (observed_obs3053) (observed_obs3054) (observed_obs3056) (dominates-2_hyp1_count-as-fault_line_x7_x8) (observed_obs3052) (observed_obs3058) (observed_obs3055) (observed_obs3067) (observed_obs3061) (achieved_constraint0) (achieved_constraint1) (not_at_end_constraint2))
  :effect (and (achieved_constraint2) (not (not_at_end_constraint2))))
)
