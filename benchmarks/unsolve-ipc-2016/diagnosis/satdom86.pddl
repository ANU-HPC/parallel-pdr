(define (domain appn-pls)
 (:requirements :strips :equality)
 (:predicates (breaker-state-is-unknown_breaker_x3_x4) (breaker-state-is-open_breaker_x3_x4) (breaker-state-is-unknown_breaker_x13_x14) (breaker-state-is-open_breaker_x13_x14) (breaker-state-is-unknown_breaker_x15_x16) (breaker-state-is-unknown_breaker_x17_x18) (breaker-state-is-open_breaker_x17_x18) (breaker-state-is-unknown_breaker_x19_x20) (breaker-state-is-open_breaker_x19_x20) (breaker-state-is-unknown_breaker_x23_x24) (breaker-state-is-open_breaker_x23_x24) (breaker-state-is-unknown_breaker_x25_x26) (breaker-state-is-unknown_breaker_x34_x35) (breaker-state-is-open_breaker_x34_x35) (breaker-state-is-unknown_breaker_x46_x47) (breaker-state-is-open_breaker_x46_x47) (breaker-state-is-unknown_breaker_x48_x49) (breaker-state-is-open_breaker_x48_x49) (breaker-state-is-unknown_breaker_x50_x51) (breaker-state-is-open_breaker_x50_x51) (breaker-state-is-unknown_breaker_x52_x53) (breaker-state-is-open_breaker_x52_x53) (breaker-state-is-unknown_breaker_x56_x57) (breaker-state-is-open_breaker_x56_x57) (breaker-state-is-closed_breaker_x13_x14) (breaker-state-is-closed_breaker_x15_x16) (breaker-state-is-closed_breaker_x17_x18) (breaker-state-is-closed_breaker_x19_x20) (breaker-state-is-closed_breaker_x23_x24) (breaker-state-is-closed_breaker_x25_x26) (breaker-state-is-closed_breaker_x34_x35) (breaker-state-is-closed_breaker_x46_x47) (breaker-state-is-closed_breaker_x48_x49) (breaker-state-is-closed_breaker_x50_x51) (breaker-state-is-closed_breaker_x52_x53) (breaker-state-is-closed_breaker_x56_x57) (breaker-ar-status-is-unknown_breaker_x13_x14) (breaker-ar-status-is-auto_breaker_x13_x14) (breaker-ar-status-is-unknown_breaker_x15_x16) (breaker-ar-status-is-auto_breaker_x15_x16) (breaker-ar-status-is-unknown_breaker_x17_x18) (breaker-ar-status-is-auto_breaker_x17_x18) (breaker-ar-status-is-unknown_breaker_x19_x20) (breaker-ar-status-is-auto_breaker_x19_x20) (breaker-ar-status-is-unknown_breaker_x23_x24) (breaker-ar-status-is-auto_breaker_x23_x24) (breaker-ar-status-is-unknown_breaker_x25_x26) (breaker-ar-status-is-auto_breaker_x25_x26) (breaker-ar-status-is-non-auto_breaker_x13_x14) (breaker-ar-status-is-non-auto_breaker_x17_x18) (breaker-ar-status-is-non-auto_breaker_x19_x20) (breaker-ar-status-is-non-auto_breaker_x23_x24) (pending_obs2655) (fault-count-2_count-as-fault_breaker_x13_x14_n0) (observed_obs2655) (line-iso-state-may-have-changed_line_x11_x12_obs2655) (pending_obs2668) (fault-count-2_count-as-fault_breaker_x15_x16_n0) (observed_obs2668) (dominates-2_hyp3_count-as-fault_breaker_x15_x16) (dominates-2_hyp2_count-as-fault_breaker_x15_x16) (dominates-2_hyp1_count-as-fault_breaker_x15_x16) (pending_obs2660) (fault-count-2_count-as-fault_breaker_x17_x18_n0) (observed_obs2660) (line-iso-state-may-have-changed_line_x44_x45_obs2660) (dominates-2_hyp3_count-as-fault_breaker_x17_x18) (dominates-2_hyp2_count-as-fault_breaker_x17_x18) (pending_obs2666) (fault-count-2_count-as-fault_breaker_x19_x20_n0) (observed_obs2666) (line-iso-state-may-have-changed_line_x32_x33_obs2666) (dominates-2_hyp2_count-as-fault_breaker_x19_x20) (dominates-2_hyp1_count-as-fault_breaker_x19_x20) (pending_obs2662) (fault-count-2_count-as-fault_breaker_x23_x24_n0) (observed_obs2662) (line-iso-state-may-have-changed_line_x44_x45_obs2662) (dominates-2_hyp3_count-as-fault_breaker_x23_x24) (dominates-2_hyp2_count-as-fault_breaker_x23_x24) (pending_obs2665) (fault-count-2_count-as-fault_breaker_x25_x26_n0) (observed_obs2665) (dominates-2_hyp3_count-as-fault_breaker_x25_x26) (dominates-2_hyp2_count-as-fault_breaker_x25_x26) (dominates-2_hyp1_count-as-fault_breaker_x25_x26) (pending_obs2673) (fault-count-2_count-as-fault_breaker_x3_x4_n0) (observed_obs2673) (dominates-2_hyp3_count-as-fault_breaker_x3_x4) (dominates-2_hyp2_count-as-fault_breaker_x3_x4) (dominates-2_hyp1_count-as-fault_breaker_x3_x4) (pending_obs2654) (breaker-commanded-open_breaker_x13_x14_obs2654) (observed_obs2654) (pending_obs2659) (observed_obs2659) (pending_obs2672) (observed_obs2672) (pending_obs2661) (breaker-commanded-ar-non-auto_breaker_x9_x10_obs2661) (observed_obs2661) (pending_obs2658) (observed_obs2658) (pending_obs2664) (observed_obs2664) (fault-count-2_count-as-fault_breaker_x7_x8_n0) (dominates-2_hyp3_count-as-fault_breaker_x7_x8) (dominates-2_hyp2_count-as-fault_breaker_x7_x8) (dominates-2_hyp1_count-as-fault_breaker_x7_x8) (fault-count-2_count-as-fault_breaker_x9_x10_n0) (pending_obs2670) (fault-count-2_count-as-fault_bus_x29_n0) (observed_obs2670) (dominates-2_hyp3_count-as-fault_bus_x29) (dominates-2_hyp2_count-as-fault_bus_x29) (dominates-2_hyp1_count-as-fault_bus_x29) (pending_obs2671) (fault-count-2_count-as-fault_bus_x27_n0) (observed_obs2671) (dominates-2_hyp3_count-as-fault_bus_x27) (dominates-2_hyp2_count-as-fault_bus_x27) (dominates-2_hyp1_count-as-fault_bus_x27) (pending_obs2657) (fault-count-2_count-as-fault_bus_x28_n0) (observed_obs2657) (dominates-2_hyp3_count-as-fault_bus_x28) (dominates-2_hyp2_count-as-fault_bus_x28) (dominates-2_hyp1_count-as-fault_bus_x28) (fault-count-2_count-as-fault_line_x11_x12_n0) (not_line-isolated_line_x11_x12) (line-iso-trip-in-progress_line_x11_x12_obs2655) (not_line-iso-trip-in-progress_line_x11_x12_obs2655) (fault-count-2_count-as-fault_line_x32_x33_n0) (not_line-isolated_line_x32_x33) (line-iso-trip-in-progress_line_x32_x33_obs2666) (not_line-iso-trip-in-progress_line_x32_x33_obs2666) (dominates-2_hyp3_count-as-fault_line_x32_x33) (fault-count-2_count-as-fault_line_x44_x45_n0) (not_line-isolated_line_x44_x45) (line-iso-trip-in-progress_line_x44_x45_obs2660) (not_line-iso-trip-in-progress_line_x44_x45_obs2660) (dominates-2_hyp1_count-as-fault_line_x44_x45) (line-iso-trip-in-progress_line_x44_x45_obs2662) (not_line-iso-trip-in-progress_line_x44_x45_obs2662) (line-isolated_line_x32_x33) (line-isolated_line_x11_x12) (line-iso-state-changed_line_x11_x12_obs2655) (line-isolated_line_x44_x45) (pending_obs2656) (observed_obs2656) (pending_obs2663) (fault-count-2_count-as-fault_line_x21_x22_n0) (observed_obs2663) (dominates-2_hyp3_count-as-fault_line_x21_x22) (dominates-2_hyp2_count-as-fault_line_x21_x22) (dominates-2_hyp1_count-as-fault_line_x21_x22) (generator-status-is-unknown_generator_x30_1) (generator-status-is-on_generator_x30_1) (generator-status-is-off_generator_x30_1) (fault-count-2_count-as-fault_generator_x30_1_n0) (generator-status-is-shutting-down_generator_x30_1) (dominates-2_hyp3_count-as-fault_generator_x30_1) (dominates-2_hyp2_count-as-fault_generator_x30_1) (dominates-2_hyp1_count-as-fault_generator_x30_1) (fault-count-2_count-as-fault_generator_x31_1_n0) (dominates-2_hyp3_count-as-fault_generator_x31_1) (dominates-2_hyp2_count-as-fault_generator_x31_1) (dominates-2_hyp1_count-as-fault_generator_x31_1) (pending_obs2669) (observed_obs2669) (generator-status-is-starting-up_generator_x30_1) (pending_obs2667) (observed_obs2667) (future_obs2655) (future_obs2656) (future_obs2657) (future_obs2658) (future_obs2659) (future_obs2660) (future_obs2661) (future_obs2662) (future_obs2663) (future_obs2664) (future_obs2665) (future_obs2666) (future_obs2667) (future_obs2668) (future_obs2669) (future_obs2670) (future_obs2671) (future_obs2672) (future_obs2673) (not_at_end_constraint0) (achieved_constraint0) (not_at_end_constraint1) (achieved_constraint1) (not_at_end_constraint2) (achieved_constraint2) (static-true))
 (:action breaker-init-state-was-open_breaker_x3_x4
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x3_x4) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x3_x4) (not (breaker-state-is-unknown_breaker_x3_x4))))
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
 (:action breaker-init-state-was-open_breaker_x23_x24
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x23_x24) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x23_x24) (not (breaker-state-is-unknown_breaker_x23_x24))))
 (:action breaker-init-state-was-open_breaker_x34_x35
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x34_x35) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x34_x35) (not (breaker-state-is-unknown_breaker_x34_x35))))
 (:action breaker-init-state-was-open_breaker_x46_x47
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x46_x47) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x46_x47) (not (breaker-state-is-unknown_breaker_x46_x47))))
 (:action breaker-init-state-was-open_breaker_x48_x49
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x48_x49) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x48_x49) (not (breaker-state-is-unknown_breaker_x48_x49))))
 (:action breaker-init-state-was-open_breaker_x50_x51
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x50_x51) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x50_x51) (not (breaker-state-is-unknown_breaker_x50_x51))))
 (:action breaker-init-state-was-open_breaker_x52_x53
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x52_x53) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x52_x53) (not (breaker-state-is-unknown_breaker_x52_x53))))
 (:action breaker-init-state-was-open_breaker_x56_x57
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x56_x57) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x56_x57) (not (breaker-state-is-unknown_breaker_x56_x57))))
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
 (:action breaker-init-state-was-closed_breaker_x23_x24
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x23_x24) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-closed_breaker_x23_x24) (not (breaker-state-is-unknown_breaker_x23_x24))))
 (:action breaker-init-state-was-closed_breaker_x25_x26
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x25_x26) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-closed_breaker_x25_x26) (not (breaker-state-is-unknown_breaker_x25_x26))))
 (:action breaker-init-state-was-closed_breaker_x34_x35
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x34_x35) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-closed_breaker_x34_x35) (not (breaker-state-is-unknown_breaker_x34_x35))))
 (:action breaker-init-state-was-closed_breaker_x46_x47
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x46_x47) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-closed_breaker_x46_x47) (not (breaker-state-is-unknown_breaker_x46_x47))))
 (:action breaker-init-state-was-closed_breaker_x48_x49
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x48_x49) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-closed_breaker_x48_x49) (not (breaker-state-is-unknown_breaker_x48_x49))))
 (:action breaker-init-state-was-closed_breaker_x50_x51
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x50_x51) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-closed_breaker_x50_x51) (not (breaker-state-is-unknown_breaker_x50_x51))))
 (:action breaker-init-state-was-closed_breaker_x52_x53
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x52_x53) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-closed_breaker_x52_x53) (not (breaker-state-is-unknown_breaker_x52_x53))))
 (:action breaker-init-state-was-closed_breaker_x56_x57
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x56_x57) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-closed_breaker_x56_x57) (not (breaker-state-is-unknown_breaker_x56_x57))))
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
 (:action breaker-init-ar-status-was-auto_breaker_x23_x24
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x23_x24) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-ar-status-is-auto_breaker_x23_x24) (not (breaker-ar-status-is-unknown_breaker_x23_x24))))
 (:action breaker-init-ar-status-was-auto_breaker_x25_x26
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x25_x26) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-ar-status-is-auto_breaker_x25_x26) (not (breaker-ar-status-is-unknown_breaker_x25_x26))))
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
 (:action breaker-init-ar-status-was-non-auto_breaker_x23_x24
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x23_x24) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-ar-status-is-non-auto_breaker_x23_x24) (not (breaker-ar-status-is-unknown_breaker_x23_x24))))
 (:action breaker-open-unexplained_breaker_x13_x14_obs2655_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x13_x14) (pending_obs2655) (fault-count-2_count-as-fault_breaker_x13_x14_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x13_x14) (observed_obs2655) (line-iso-state-may-have-changed_line_x11_x12_obs2655) (not (breaker-state-is-closed_breaker_x13_x14)) (not (pending_obs2655)) (not (fault-count-2_count-as-fault_breaker_x13_x14_n0))))
 (:action breaker-open-unexplained_breaker_x15_x16_obs2668_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x15_x16) (pending_obs2668) (fault-count-2_count-as-fault_breaker_x15_x16_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs2668) (not (breaker-state-is-closed_breaker_x15_x16)) (not (pending_obs2668)) (not (fault-count-2_count-as-fault_breaker_x15_x16_n0)) (not (dominates-2_hyp3_count-as-fault_breaker_x15_x16)) (not (dominates-2_hyp2_count-as-fault_breaker_x15_x16)) (not (dominates-2_hyp1_count-as-fault_breaker_x15_x16))))
 (:action breaker-open-unexplained_breaker_x17_x18_obs2660_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x17_x18) (pending_obs2660) (fault-count-2_count-as-fault_breaker_x17_x18_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x17_x18) (observed_obs2660) (line-iso-state-may-have-changed_line_x44_x45_obs2660) (not (breaker-state-is-closed_breaker_x17_x18)) (not (pending_obs2660)) (not (fault-count-2_count-as-fault_breaker_x17_x18_n0)) (not (dominates-2_hyp3_count-as-fault_breaker_x17_x18)) (not (dominates-2_hyp2_count-as-fault_breaker_x17_x18))))
 (:action breaker-open-unexplained_breaker_x19_x20_obs2666_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x19_x20) (pending_obs2666) (fault-count-2_count-as-fault_breaker_x19_x20_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x19_x20) (observed_obs2666) (line-iso-state-may-have-changed_line_x32_x33_obs2666) (not (breaker-state-is-closed_breaker_x19_x20)) (not (pending_obs2666)) (not (fault-count-2_count-as-fault_breaker_x19_x20_n0)) (not (dominates-2_hyp2_count-as-fault_breaker_x19_x20)) (not (dominates-2_hyp1_count-as-fault_breaker_x19_x20))))
 (:action breaker-open-unexplained_breaker_x23_x24_obs2662_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x23_x24) (pending_obs2662) (fault-count-2_count-as-fault_breaker_x23_x24_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x23_x24) (observed_obs2662) (line-iso-state-may-have-changed_line_x44_x45_obs2662) (not (breaker-state-is-closed_breaker_x23_x24)) (not (pending_obs2662)) (not (fault-count-2_count-as-fault_breaker_x23_x24_n0)) (not (dominates-2_hyp3_count-as-fault_breaker_x23_x24)) (not (dominates-2_hyp2_count-as-fault_breaker_x23_x24))))
 (:action breaker-open-unexplained_breaker_x25_x26_obs2665_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x25_x26) (pending_obs2665) (fault-count-2_count-as-fault_breaker_x25_x26_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs2665) (not (breaker-state-is-closed_breaker_x25_x26)) (not (pending_obs2665)) (not (fault-count-2_count-as-fault_breaker_x25_x26_n0)) (not (dominates-2_hyp3_count-as-fault_breaker_x25_x26)) (not (dominates-2_hyp2_count-as-fault_breaker_x25_x26)) (not (dominates-2_hyp1_count-as-fault_breaker_x25_x26))))
 (:action breaker-trip-unexplained_breaker_x13_x14_obs2655_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x13_x14) (breaker-ar-status-is-auto_breaker_x13_x14) (pending_obs2655) (fault-count-2_count-as-fault_breaker_x13_x14_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x13_x14) (observed_obs2655) (line-iso-state-may-have-changed_line_x11_x12_obs2655) (not (breaker-state-is-closed_breaker_x13_x14)) (not (pending_obs2655)) (not (fault-count-2_count-as-fault_breaker_x13_x14_n0))))
 (:action breaker-trip-unexplained_breaker_x15_x16_obs2668_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x15_x16) (breaker-ar-status-is-auto_breaker_x15_x16) (pending_obs2668) (fault-count-2_count-as-fault_breaker_x15_x16_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs2668) (not (breaker-state-is-closed_breaker_x15_x16)) (not (pending_obs2668)) (not (fault-count-2_count-as-fault_breaker_x15_x16_n0)) (not (dominates-2_hyp3_count-as-fault_breaker_x15_x16)) (not (dominates-2_hyp2_count-as-fault_breaker_x15_x16)) (not (dominates-2_hyp1_count-as-fault_breaker_x15_x16))))
 (:action breaker-trip-unexplained_breaker_x17_x18_obs2660_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x17_x18) (breaker-ar-status-is-auto_breaker_x17_x18) (pending_obs2660) (fault-count-2_count-as-fault_breaker_x17_x18_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x17_x18) (observed_obs2660) (line-iso-state-may-have-changed_line_x44_x45_obs2660) (not (breaker-state-is-closed_breaker_x17_x18)) (not (pending_obs2660)) (not (fault-count-2_count-as-fault_breaker_x17_x18_n0)) (not (dominates-2_hyp3_count-as-fault_breaker_x17_x18)) (not (dominates-2_hyp2_count-as-fault_breaker_x17_x18))))
 (:action breaker-trip-unexplained_breaker_x19_x20_obs2666_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x19_x20) (breaker-ar-status-is-auto_breaker_x19_x20) (pending_obs2666) (fault-count-2_count-as-fault_breaker_x19_x20_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x19_x20) (observed_obs2666) (line-iso-state-may-have-changed_line_x32_x33_obs2666) (not (breaker-state-is-closed_breaker_x19_x20)) (not (pending_obs2666)) (not (fault-count-2_count-as-fault_breaker_x19_x20_n0)) (not (dominates-2_hyp2_count-as-fault_breaker_x19_x20)) (not (dominates-2_hyp1_count-as-fault_breaker_x19_x20))))
 (:action breaker-trip-unexplained_breaker_x23_x24_obs2662_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x23_x24) (breaker-ar-status-is-auto_breaker_x23_x24) (pending_obs2662) (fault-count-2_count-as-fault_breaker_x23_x24_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x23_x24) (observed_obs2662) (line-iso-state-may-have-changed_line_x44_x45_obs2662) (not (breaker-state-is-closed_breaker_x23_x24)) (not (pending_obs2662)) (not (fault-count-2_count-as-fault_breaker_x23_x24_n0)) (not (dominates-2_hyp3_count-as-fault_breaker_x23_x24)) (not (dominates-2_hyp2_count-as-fault_breaker_x23_x24))))
 (:action breaker-trip-unexplained_breaker_x25_x26_obs2665_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x25_x26) (breaker-ar-status-is-auto_breaker_x25_x26) (pending_obs2665) (fault-count-2_count-as-fault_breaker_x25_x26_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs2665) (not (breaker-state-is-closed_breaker_x25_x26)) (not (pending_obs2665)) (not (fault-count-2_count-as-fault_breaker_x25_x26_n0)) (not (dominates-2_hyp3_count-as-fault_breaker_x25_x26)) (not (dominates-2_hyp2_count-as-fault_breaker_x25_x26)) (not (dominates-2_hyp1_count-as-fault_breaker_x25_x26))))
 (:action breaker-close-unexplained_breaker_x3_x4_obs2673_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x3_x4) (pending_obs2673) (fault-count-2_count-as-fault_breaker_x3_x4_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs2673) (not (breaker-state-is-open_breaker_x3_x4)) (not (pending_obs2673)) (not (fault-count-2_count-as-fault_breaker_x3_x4_n0)) (not (dominates-2_hyp3_count-as-fault_breaker_x3_x4)) (not (dominates-2_hyp2_count-as-fault_breaker_x3_x4)) (not (dominates-2_hyp1_count-as-fault_breaker_x3_x4))))
 (:action breaker-command-open_breaker_x13_x14_obs2654
  :parameters ()
  :precondition (and (pending_obs2654) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-commanded-open_breaker_x13_x14_obs2654) (observed_obs2654) (not (pending_obs2654))))
 (:action breaker-open-on-command_breaker_x13_x14_obs2655_obs2654
  :parameters ()
  :precondition (and (pending_obs2655) (breaker-commanded-open_breaker_x13_x14_obs2654) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x13_x14) (observed_obs2655) (line-iso-state-may-have-changed_line_x11_x12_obs2655) (not (breaker-state-is-unknown_breaker_x13_x14)) (not (breaker-state-is-closed_breaker_x13_x14)) (not (pending_obs2655))))
 (:action breaker-command-ar-non-auto-1_breaker_x1_x2_obs2659
  :parameters ()
  :precondition (and (pending_obs2659) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs2659) (not (pending_obs2659))))
 (:action breaker-command-ar-non-auto-1_breaker_x5_x6_obs2672
  :parameters ()
  :precondition (and (pending_obs2672) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs2672) (not (pending_obs2672))))
 (:action breaker-command-ar-non-auto-1_breaker_x9_x10_obs2661
  :parameters ()
  :precondition (and (pending_obs2661) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-commanded-ar-non-auto_breaker_x9_x10_obs2661) (observed_obs2661) (not (pending_obs2661))))
 (:action breaker-ar-status-non-auto-1_breaker_x9_x10_obs2664_obs2661
  :parameters ()
  :precondition (and (breaker-commanded-ar-non-auto_breaker_x9_x10_obs2661) (pending_obs2664) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs2664) (not (pending_obs2664))))
 (:action breaker-ar-status-non-auto-unexplained-1_breaker_x7_x8_obs2658_n0_n1
  :parameters ()
  :precondition (and (pending_obs2658) (fault-count-2_count-as-fault_breaker_x7_x8_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs2658) (not (pending_obs2658)) (not (fault-count-2_count-as-fault_breaker_x7_x8_n0)) (not (dominates-2_hyp3_count-as-fault_breaker_x7_x8)) (not (dominates-2_hyp2_count-as-fault_breaker_x7_x8)) (not (dominates-2_hyp1_count-as-fault_breaker_x7_x8))))
 (:action breaker-ar-status-non-auto-unexplained-1_breaker_x9_x10_obs2664_n0_n1
  :parameters ()
  :precondition (and (pending_obs2664) (fault-count-2_count-as-fault_breaker_x9_x10_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs2664) (not (pending_obs2664)) (not (fault-count-2_count-as-fault_breaker_x9_x10_n0))))
 (:action bus-voltage-goes-high-unexplained_bus_x29_high_obs2670_n0_n1
  :parameters ()
  :precondition (and (pending_obs2670) (fault-count-2_count-as-fault_bus_x29_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs2670) (not (pending_obs2670)) (not (fault-count-2_count-as-fault_bus_x29_n0)) (not (dominates-2_hyp3_count-as-fault_bus_x29)) (not (dominates-2_hyp2_count-as-fault_bus_x29)) (not (dominates-2_hyp1_count-as-fault_bus_x29))))
 (:action bus-voltage-goes-normal-unexplained_bus_x27_obs2671_n0_n1
  :parameters ()
  :precondition (and (pending_obs2671) (fault-count-2_count-as-fault_bus_x27_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs2671) (not (pending_obs2671)) (not (fault-count-2_count-as-fault_bus_x27_n0)) (not (dominates-2_hyp3_count-as-fault_bus_x27)) (not (dominates-2_hyp2_count-as-fault_bus_x27)) (not (dominates-2_hyp1_count-as-fault_bus_x27))))
 (:action bus-voltage-goes-normal-unexplained_bus_x28_obs2657_n0_n1
  :parameters ()
  :precondition (and (pending_obs2657) (fault-count-2_count-as-fault_bus_x28_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs2657) (not (pending_obs2657)) (not (fault-count-2_count-as-fault_bus_x28_n0)) (not (dominates-2_hyp3_count-as-fault_bus_x28)) (not (dominates-2_hyp2_count-as-fault_bus_x28)) (not (dominates-2_hyp1_count-as-fault_bus_x28))))
 (:action line-iso-trip-first-breaker-simple-trip-1_line_x11_x12_breaker_x13_x14_breaker_x13_x14_obs2655_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x13_x14) (breaker-ar-status-is-auto_breaker_x13_x14) (pending_obs2655) (fault-count-2_count-as-fault_line_x11_x12_n0) (not_line-isolated_line_x11_x12) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x13_x14) (observed_obs2655) (line-iso-trip-in-progress_line_x11_x12_obs2655) (not (breaker-state-is-closed_breaker_x13_x14)) (not (pending_obs2655)) (not (fault-count-2_count-as-fault_line_x11_x12_n0)) (not (not_line-iso-trip-in-progress_line_x11_x12_obs2655))))
 (:action line-iso-trip-first-breaker-simple-trip-1_line_x32_x33_breaker_x19_x20_breaker_x19_x20_obs2666_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x19_x20) (breaker-ar-status-is-auto_breaker_x19_x20) (pending_obs2666) (fault-count-2_count-as-fault_line_x32_x33_n0) (not_line-isolated_line_x32_x33) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x19_x20) (observed_obs2666) (line-iso-trip-in-progress_line_x32_x33_obs2666) (not (breaker-state-is-closed_breaker_x19_x20)) (not (pending_obs2666)) (not (fault-count-2_count-as-fault_line_x32_x33_n0)) (not (not_line-iso-trip-in-progress_line_x32_x33_obs2666)) (not (dominates-2_hyp3_count-as-fault_line_x32_x33))))
 (:action line-iso-trip-first-breaker-simple-trip-1_line_x44_x45_breaker_x17_x18_breaker_x17_x18_obs2660_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x17_x18) (breaker-ar-status-is-auto_breaker_x17_x18) (pending_obs2660) (fault-count-2_count-as-fault_line_x44_x45_n0) (not_line-isolated_line_x44_x45) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x17_x18) (observed_obs2660) (line-iso-trip-in-progress_line_x44_x45_obs2660) (not (breaker-state-is-closed_breaker_x17_x18)) (not (pending_obs2660)) (not (fault-count-2_count-as-fault_line_x44_x45_n0)) (not (not_line-iso-trip-in-progress_line_x44_x45_obs2660)) (not (dominates-2_hyp1_count-as-fault_line_x44_x45))))
 (:action line-iso-trip-first-breaker-simple-trip-1_line_x44_x45_breaker_x23_x24_breaker_x23_x24_obs2662_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x23_x24) (breaker-ar-status-is-auto_breaker_x23_x24) (pending_obs2662) (fault-count-2_count-as-fault_line_x44_x45_n0) (not_line-isolated_line_x44_x45) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x23_x24) (observed_obs2662) (line-iso-trip-in-progress_line_x44_x45_obs2662) (not (breaker-state-is-closed_breaker_x23_x24)) (not (pending_obs2662)) (not (fault-count-2_count-as-fault_line_x44_x45_n0)) (not (dominates-2_hyp1_count-as-fault_line_x44_x45)) (not (not_line-iso-trip-in-progress_line_x44_x45_obs2662))))
 (:action line-iso-trip-first-breaker-simple-trip-2_line_x11_x12_breaker_x13_x14_breaker_x13_x14_obs2655_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x13_x14) (breaker-ar-status-is-non-auto_breaker_x13_x14) (pending_obs2655) (fault-count-2_count-as-fault_line_x11_x12_n0) (not_line-isolated_line_x11_x12) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x13_x14) (observed_obs2655) (line-iso-trip-in-progress_line_x11_x12_obs2655) (not (breaker-state-is-closed_breaker_x13_x14)) (not (pending_obs2655)) (not (fault-count-2_count-as-fault_line_x11_x12_n0)) (not (not_line-iso-trip-in-progress_line_x11_x12_obs2655))))
 (:action line-iso-trip-first-breaker-simple-trip-2_line_x32_x33_breaker_x19_x20_breaker_x19_x20_obs2666_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x19_x20) (breaker-ar-status-is-non-auto_breaker_x19_x20) (pending_obs2666) (fault-count-2_count-as-fault_line_x32_x33_n0) (not_line-isolated_line_x32_x33) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x19_x20) (observed_obs2666) (line-iso-trip-in-progress_line_x32_x33_obs2666) (not (breaker-state-is-closed_breaker_x19_x20)) (not (pending_obs2666)) (not (fault-count-2_count-as-fault_line_x32_x33_n0)) (not (not_line-iso-trip-in-progress_line_x32_x33_obs2666)) (not (dominates-2_hyp3_count-as-fault_line_x32_x33))))
 (:action line-iso-trip-first-breaker-simple-trip-2_line_x44_x45_breaker_x17_x18_breaker_x17_x18_obs2660_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x17_x18) (breaker-ar-status-is-non-auto_breaker_x17_x18) (pending_obs2660) (fault-count-2_count-as-fault_line_x44_x45_n0) (not_line-isolated_line_x44_x45) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x17_x18) (observed_obs2660) (line-iso-trip-in-progress_line_x44_x45_obs2660) (not (breaker-state-is-closed_breaker_x17_x18)) (not (pending_obs2660)) (not (fault-count-2_count-as-fault_line_x44_x45_n0)) (not (not_line-iso-trip-in-progress_line_x44_x45_obs2660)) (not (dominates-2_hyp1_count-as-fault_line_x44_x45))))
 (:action line-iso-trip-first-breaker-simple-trip-2_line_x44_x45_breaker_x23_x24_breaker_x23_x24_obs2662_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x23_x24) (breaker-ar-status-is-non-auto_breaker_x23_x24) (pending_obs2662) (fault-count-2_count-as-fault_line_x44_x45_n0) (not_line-isolated_line_x44_x45) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x23_x24) (observed_obs2662) (line-iso-trip-in-progress_line_x44_x45_obs2662) (not (breaker-state-is-closed_breaker_x23_x24)) (not (pending_obs2662)) (not (fault-count-2_count-as-fault_line_x44_x45_n0)) (not (dominates-2_hyp1_count-as-fault_line_x44_x45)) (not (not_line-iso-trip-in-progress_line_x44_x45_obs2662))))
 (:action line-iso-trip-more-breaker-simple-trip-1_line_x44_x45_breaker_x17_x18_breaker_x17_x18_obs2660_obs2662
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x17_x18) (breaker-ar-status-is-auto_breaker_x17_x18) (pending_obs2660) (line-iso-trip-in-progress_line_x44_x45_obs2662) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x17_x18) (observed_obs2660) (not (breaker-state-is-closed_breaker_x17_x18)) (not (pending_obs2660))))
 (:action line-iso-trip-more-breaker-simple-trip-1_line_x44_x45_breaker_x23_x24_breaker_x23_x24_obs2662_obs2660
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x23_x24) (breaker-ar-status-is-auto_breaker_x23_x24) (pending_obs2662) (line-iso-trip-in-progress_line_x44_x45_obs2660) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x23_x24) (observed_obs2662) (not (breaker-state-is-closed_breaker_x23_x24)) (not (pending_obs2662))))
 (:action line-iso-trip-more-breaker-simple-trip-2_line_x44_x45_breaker_x17_x18_breaker_x17_x18_obs2660_obs2662
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x17_x18) (breaker-ar-status-is-non-auto_breaker_x17_x18) (pending_obs2660) (line-iso-trip-in-progress_line_x44_x45_obs2662) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x17_x18) (observed_obs2660) (not (breaker-state-is-closed_breaker_x17_x18)) (not (pending_obs2660))))
 (:action line-iso-trip-more-breaker-simple-trip-2_line_x44_x45_breaker_x23_x24_breaker_x23_x24_obs2662_obs2660
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x23_x24) (breaker-ar-status-is-non-auto_breaker_x23_x24) (pending_obs2662) (line-iso-trip-in-progress_line_x44_x45_obs2660) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x23_x24) (observed_obs2662) (not (breaker-state-is-closed_breaker_x23_x24)) (not (pending_obs2662))))
 (:action line-finish-iso-trip-2_line_x32_x33_breaker_x34_x35_breaker_x19_x20_obs2666
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x19_x20) (breaker-state-is-open_breaker_x34_x35) (line-iso-trip-in-progress_line_x32_x33_obs2666) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (not_line-iso-trip-in-progress_line_x32_x33_obs2666) (line-isolated_line_x32_x33) (not (not_line-isolated_line_x32_x33)) (not (line-iso-trip-in-progress_line_x32_x33_obs2666))))
 (:action line-finish-iso-trip-4_line_x11_x12_breaker_x13_x14_breaker_x48_x49_breaker_x50_x51_breaker_x56_x57_obs2655
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x13_x14) (breaker-state-is-open_breaker_x48_x49) (breaker-state-is-open_breaker_x50_x51) (breaker-state-is-open_breaker_x56_x57) (line-iso-trip-in-progress_line_x11_x12_obs2655) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (not_line-iso-trip-in-progress_line_x11_x12_obs2655) (line-isolated_line_x11_x12) (line-iso-state-changed_line_x11_x12_obs2655) (not (not_line-isolated_line_x11_x12)) (not (line-iso-trip-in-progress_line_x11_x12_obs2655))))
 (:action line-finish-iso-trip-4_line_x44_x45_breaker_x46_x47_breaker_x23_x24_breaker_x52_x53_breaker_x17_x18_obs2660
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x17_x18) (breaker-state-is-open_breaker_x23_x24) (breaker-state-is-open_breaker_x46_x47) (breaker-state-is-open_breaker_x52_x53) (line-iso-trip-in-progress_line_x44_x45_obs2660) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (not_line-iso-trip-in-progress_line_x44_x45_obs2660) (line-isolated_line_x44_x45) (not (not_line-isolated_line_x44_x45)) (not (line-iso-trip-in-progress_line_x44_x45_obs2660))))
 (:action line-finish-iso-trip-4_line_x44_x45_breaker_x46_x47_breaker_x23_x24_breaker_x52_x53_breaker_x17_x18_obs2662
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x17_x18) (breaker-state-is-open_breaker_x23_x24) (breaker-state-is-open_breaker_x46_x47) (breaker-state-is-open_breaker_x52_x53) (line-iso-trip-in-progress_line_x44_x45_obs2662) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (not_line-iso-trip-in-progress_line_x44_x45_obs2662) (line-isolated_line_x44_x45) (not (not_line-isolated_line_x44_x45)) (not (line-iso-trip-in-progress_line_x44_x45_obs2662))))
 (:action line-set-state-isolated-2_line_x32_x33_breaker_x34_x35_breaker_x19_x20_obs2666
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x19_x20) (breaker-state-is-open_breaker_x34_x35) (line-iso-state-may-have-changed_line_x32_x33_obs2666) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (line-isolated_line_x32_x33) (not (not_line-isolated_line_x32_x33))))
 (:action line-set-state-isolated-4_line_x11_x12_breaker_x13_x14_breaker_x48_x49_breaker_x50_x51_breaker_x56_x57_obs2655
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x13_x14) (breaker-state-is-open_breaker_x48_x49) (breaker-state-is-open_breaker_x50_x51) (breaker-state-is-open_breaker_x56_x57) (line-iso-state-may-have-changed_line_x11_x12_obs2655) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (line-isolated_line_x11_x12) (line-iso-state-changed_line_x11_x12_obs2655) (not (not_line-isolated_line_x11_x12))))
 (:action line-set-state-isolated-4_line_x44_x45_breaker_x46_x47_breaker_x23_x24_breaker_x52_x53_breaker_x17_x18_obs2660
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x17_x18) (breaker-state-is-open_breaker_x23_x24) (breaker-state-is-open_breaker_x46_x47) (breaker-state-is-open_breaker_x52_x53) (line-iso-state-may-have-changed_line_x44_x45_obs2660) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (line-isolated_line_x44_x45) (not (not_line-isolated_line_x44_x45))))
 (:action line-set-state-isolated-4_line_x44_x45_breaker_x46_x47_breaker_x23_x24_breaker_x52_x53_breaker_x17_x18_obs2662
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x17_x18) (breaker-state-is-open_breaker_x23_x24) (breaker-state-is-open_breaker_x46_x47) (breaker-state-is-open_breaker_x52_x53) (line-iso-state-may-have-changed_line_x44_x45_obs2662) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (line-isolated_line_x44_x45) (not (not_line-isolated_line_x44_x45))))
 (:action line-init-state-isolated-2_line_x32_x33_breaker_x34_x35_breaker_x19_x20
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x19_x20) (breaker-state-is-open_breaker_x34_x35) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (line-isolated_line_x32_x33) (not (not_line-isolated_line_x32_x33))))
 (:action line-init-state-isolated-4_line_x11_x12_breaker_x13_x14_breaker_x48_x49_breaker_x50_x51_breaker_x56_x57
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x13_x14) (breaker-state-is-open_breaker_x48_x49) (breaker-state-is-open_breaker_x50_x51) (breaker-state-is-open_breaker_x56_x57) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (line-isolated_line_x11_x12) (not (not_line-isolated_line_x11_x12))))
 (:action line-init-state-isolated-4_line_x44_x45_breaker_x46_x47_breaker_x23_x24_breaker_x52_x53_breaker_x17_x18
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x17_x18) (breaker-state-is-open_breaker_x23_x24) (breaker-state-is-open_breaker_x46_x47) (breaker-state-is-open_breaker_x52_x53) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (line-isolated_line_x44_x45) (not (not_line-isolated_line_x44_x45))))
 (:action line-voltage-goes-to-zero-unexplained-1_line_x11_x12_obs2656_n0_n1
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_line_x11_x12_n0) (pending_obs2656) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs2656) (not (fault-count-2_count-as-fault_line_x11_x12_n0)) (not (pending_obs2656))))
 (:action line-voltage-goes-to-zero-unexplained-1_line_x21_x22_obs2663_n0_n1
  :parameters ()
  :precondition (and (pending_obs2663) (fault-count-2_count-as-fault_line_x21_x22_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs2663) (not (pending_obs2663)) (not (fault-count-2_count-as-fault_line_x21_x22_n0)) (not (dominates-2_hyp3_count-as-fault_line_x21_x22)) (not (dominates-2_hyp2_count-as-fault_line_x21_x22)) (not (dominates-2_hyp1_count-as-fault_line_x21_x22))))
 (:action line-voltage-goes-to-zero-when-isolated-1_line_x11_x12_obs2656_obs2655
  :parameters ()
  :precondition (and (line-isolated_line_x11_x12) (line-iso-state-changed_line_x11_x12_obs2655) (pending_obs2656) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs2656) (not (pending_obs2656))))
 (:action generator-init-status-was-on_generator_x30_1
  :parameters ()
  :precondition (and (generator-status-is-unknown_generator_x30_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (generator-status-is-on_generator_x30_1) (not (generator-status-is-unknown_generator_x30_1))))
 (:action generator-init-status-was-off_generator_x30_1
  :parameters ()
  :precondition (and (generator-status-is-unknown_generator_x30_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (generator-status-is-off_generator_x30_1) (not (generator-status-is-unknown_generator_x30_1))))
 (:action generator-begin-shutdown_generator_x30_1_n0_n1
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x30_1) (fault-count-2_count-as-fault_generator_x30_1_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (generator-status-is-shutting-down_generator_x30_1) (not (generator-status-is-on_generator_x30_1)) (not (fault-count-2_count-as-fault_generator_x30_1_n0)) (not (dominates-2_hyp3_count-as-fault_generator_x30_1)) (not (dominates-2_hyp2_count-as-fault_generator_x30_1)) (not (dominates-2_hyp1_count-as-fault_generator_x30_1))))
 (:action generator-shutdown-turn-off_generator_x30_1_obs2669
  :parameters ()
  :precondition (and (generator-status-is-shutting-down_generator_x30_1) (pending_obs2669) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs2669) (not (pending_obs2669))))
 (:action generator-shutdown-complete_generator_x30_1
  :parameters ()
  :precondition (and (generator-status-is-shutting-down_generator_x30_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (generator-status-is-off_generator_x30_1) (not (generator-status-is-shutting-down_generator_x30_1))))
 (:action generator-begin-startup_generator_x30_1_n0_n1
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x30_1) (fault-count-2_count-as-fault_generator_x30_1_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (generator-status-is-starting-up_generator_x30_1) (not (generator-status-is-on_generator_x30_1)) (not (fault-count-2_count-as-fault_generator_x30_1_n0)) (not (dominates-2_hyp3_count-as-fault_generator_x30_1)) (not (dominates-2_hyp2_count-as-fault_generator_x30_1)) (not (dominates-2_hyp1_count-as-fault_generator_x30_1))))
 (:action generator-startup-complete_generator_x30_1
  :parameters ()
  :precondition (and (generator-status-is-starting-up_generator_x30_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (generator-status-is-on_generator_x30_1) (not (generator-status-is-starting-up_generator_x30_1))))
 (:action generator-runback-alarm_generator_x31_1_obs2667_n0_n1
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x31_1_n0) (pending_obs2667) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs2667) (not (fault-count-2_count-as-fault_generator_x31_1_n0)) (not (dominates-2_hyp3_count-as-fault_generator_x31_1)) (not (dominates-2_hyp2_count-as-fault_generator_x31_1)) (not (dominates-2_hyp1_count-as-fault_generator_x31_1)) (not (pending_obs2667))))
 (:action advance-to-obs_obs2655
  :parameters ()
  :precondition (and (observed_obs2654) (future_obs2655) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs2655) (not (future_obs2655))))
 (:action advance-to-obs_obs2656
  :parameters ()
  :precondition (and (observed_obs2655) (future_obs2656) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs2656) (not (future_obs2656))))
 (:action advance-to-obs_obs2657
  :parameters ()
  :precondition (and (not_line-iso-trip-in-progress_line_x11_x12_obs2655) (observed_obs2656) (future_obs2657) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs2657) (not (future_obs2657))))
 (:action advance-to-obs_obs2658
  :parameters ()
  :precondition (and (observed_obs2657) (future_obs2658) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs2658) (not (future_obs2658))))
 (:action advance-to-obs_obs2659
  :parameters ()
  :precondition (and (observed_obs2658) (future_obs2659) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs2659) (not (line-iso-state-may-have-changed_line_x11_x12_obs2655)) (not (line-iso-state-changed_line_x11_x12_obs2655)) (not (future_obs2659))))
 (:action advance-to-obs_obs2660
  :parameters ()
  :precondition (and (observed_obs2659) (future_obs2660) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs2660) (not (breaker-commanded-open_breaker_x13_x14_obs2654)) (not (future_obs2660))))
 (:action advance-to-obs_obs2661
  :parameters ()
  :precondition (and (observed_obs2659) (future_obs2661) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs2661) (not (future_obs2661))))
 (:action advance-to-obs_obs2662
  :parameters ()
  :precondition (and (observed_obs2659) (future_obs2662) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs2662) (not (future_obs2662))))
 (:action advance-to-obs_obs2663
  :parameters ()
  :precondition (and (observed_obs2660) (observed_obs2662) (observed_obs2661) (not_line-iso-trip-in-progress_line_x44_x45_obs2660) (not_line-iso-trip-in-progress_line_x44_x45_obs2662) (future_obs2663) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs2663) (not (future_obs2663))))
 (:action advance-to-obs_obs2664
  :parameters ()
  :precondition (and (observed_obs2663) (future_obs2664) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs2664) (not (future_obs2664))))
 (:action advance-to-obs_obs2665
  :parameters ()
  :precondition (and (observed_obs2664) (future_obs2665) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs2665) (not (line-iso-state-may-have-changed_line_x44_x45_obs2660)) (not (line-iso-state-may-have-changed_line_x44_x45_obs2662)) (not (future_obs2665))))
 (:action advance-to-obs_obs2666
  :parameters ()
  :precondition (and (observed_obs2665) (future_obs2666) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs2666) (not (future_obs2666))))
 (:action advance-to-obs_obs2667
  :parameters ()
  :precondition (and (observed_obs2665) (future_obs2667) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs2667) (not (future_obs2667))))
 (:action advance-to-obs_obs2668
  :parameters ()
  :precondition (and (observed_obs2666) (observed_obs2667) (future_obs2668) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs2668) (not (future_obs2668))))
 (:action advance-to-obs_obs2669
  :parameters ()
  :precondition (and (observed_obs2668) (not_line-iso-trip-in-progress_line_x32_x33_obs2666) (future_obs2669) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs2669) (not (future_obs2669))))
 (:action advance-to-obs_obs2670
  :parameters ()
  :precondition (and (observed_obs2669) (future_obs2670) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs2670) (not (future_obs2670))))
 (:action advance-to-obs_obs2671
  :parameters ()
  :precondition (and (observed_obs2670) (future_obs2671) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs2671) (not (future_obs2671))))
 (:action advance-to-obs_obs2672
  :parameters ()
  :precondition (and (observed_obs2671) (future_obs2672) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs2672) (not (future_obs2672))))
 (:action advance-to-obs_obs2673
  :parameters ()
  :precondition (and (observed_obs2671) (future_obs2673) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs2673) (not (future_obs2673))))
 (:action set_goal_1_constraint0
  :parameters ()
  :precondition (and (observed_obs2655) (observed_obs2668) (observed_obs2660) (dominates-2_hyp3_count-as-fault_breaker_x17_x18) (observed_obs2666) (observed_obs2662) (observed_obs2665) (observed_obs2673) (observed_obs2654) (observed_obs2659) (observed_obs2672) (observed_obs2661) (observed_obs2658) (observed_obs2664) (observed_obs2670) (observed_obs2671) (observed_obs2657) (observed_obs2656) (observed_obs2663) (observed_obs2669) (observed_obs2667) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (achieved_constraint0) (not (not_at_end_constraint0))))
 (:action set_goal_2_constraint0
  :parameters ()
  :precondition (and (observed_obs2655) (observed_obs2668) (observed_obs2660) (observed_obs2666) (observed_obs2662) (dominates-2_hyp3_count-as-fault_breaker_x23_x24) (observed_obs2665) (observed_obs2673) (observed_obs2654) (observed_obs2659) (observed_obs2672) (observed_obs2661) (observed_obs2658) (observed_obs2664) (observed_obs2670) (observed_obs2671) (observed_obs2657) (observed_obs2656) (observed_obs2663) (observed_obs2669) (observed_obs2667) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (achieved_constraint0) (not (not_at_end_constraint0))))
 (:action set_goal_9_constraint0
  :parameters ()
  :precondition (and (observed_obs2655) (observed_obs2668) (observed_obs2660) (observed_obs2666) (observed_obs2662) (observed_obs2665) (observed_obs2673) (observed_obs2654) (observed_obs2659) (observed_obs2672) (observed_obs2661) (observed_obs2658) (observed_obs2664) (observed_obs2670) (observed_obs2671) (observed_obs2657) (dominates-2_hyp3_count-as-fault_line_x32_x33) (observed_obs2656) (observed_obs2663) (observed_obs2669) (observed_obs2667) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (achieved_constraint0) (not (not_at_end_constraint0))))
 (:action set_goal_1_constraint1
  :parameters ()
  :precondition (and (observed_obs2655) (observed_obs2668) (observed_obs2660) (dominates-2_hyp2_count-as-fault_breaker_x17_x18) (observed_obs2666) (observed_obs2662) (observed_obs2665) (observed_obs2673) (observed_obs2654) (observed_obs2659) (observed_obs2672) (observed_obs2661) (observed_obs2658) (observed_obs2664) (observed_obs2670) (observed_obs2671) (observed_obs2657) (observed_obs2656) (observed_obs2663) (observed_obs2669) (observed_obs2667) (achieved_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (achieved_constraint1) (not (not_at_end_constraint1))))
 (:action set_goal_2_constraint1
  :parameters ()
  :precondition (and (observed_obs2655) (observed_obs2668) (observed_obs2660) (observed_obs2666) (dominates-2_hyp2_count-as-fault_breaker_x19_x20) (observed_obs2662) (observed_obs2665) (observed_obs2673) (observed_obs2654) (observed_obs2659) (observed_obs2672) (observed_obs2661) (observed_obs2658) (observed_obs2664) (observed_obs2670) (observed_obs2671) (observed_obs2657) (observed_obs2656) (observed_obs2663) (observed_obs2669) (observed_obs2667) (achieved_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (achieved_constraint1) (not (not_at_end_constraint1))))
 (:action set_goal_3_constraint1
  :parameters ()
  :precondition (and (observed_obs2655) (observed_obs2668) (observed_obs2660) (observed_obs2666) (observed_obs2662) (dominates-2_hyp2_count-as-fault_breaker_x23_x24) (observed_obs2665) (observed_obs2673) (observed_obs2654) (observed_obs2659) (observed_obs2672) (observed_obs2661) (observed_obs2658) (observed_obs2664) (observed_obs2670) (observed_obs2671) (observed_obs2657) (observed_obs2656) (observed_obs2663) (observed_obs2669) (observed_obs2667) (achieved_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (achieved_constraint1) (not (not_at_end_constraint1))))
 (:action set_goal_1_constraint2
  :parameters ()
  :precondition (and (observed_obs2655) (observed_obs2668) (observed_obs2660) (observed_obs2666) (dominates-2_hyp1_count-as-fault_breaker_x19_x20) (observed_obs2662) (observed_obs2665) (observed_obs2673) (observed_obs2654) (observed_obs2659) (observed_obs2672) (observed_obs2661) (observed_obs2658) (observed_obs2664) (observed_obs2670) (observed_obs2671) (observed_obs2657) (observed_obs2656) (observed_obs2663) (observed_obs2669) (observed_obs2667) (achieved_constraint0) (achieved_constraint1) (not_at_end_constraint2))
  :effect (and (achieved_constraint2) (not (not_at_end_constraint2))))
 (:action set_goal_8_constraint2
  :parameters ()
  :precondition (and (observed_obs2655) (observed_obs2668) (observed_obs2660) (observed_obs2666) (observed_obs2662) (observed_obs2665) (observed_obs2673) (observed_obs2654) (observed_obs2659) (observed_obs2672) (observed_obs2661) (observed_obs2658) (observed_obs2664) (observed_obs2670) (observed_obs2671) (observed_obs2657) (dominates-2_hyp1_count-as-fault_line_x44_x45) (observed_obs2656) (observed_obs2663) (observed_obs2669) (observed_obs2667) (achieved_constraint0) (achieved_constraint1) (not_at_end_constraint2))
  :effect (and (achieved_constraint2) (not (not_at_end_constraint2))))
)
