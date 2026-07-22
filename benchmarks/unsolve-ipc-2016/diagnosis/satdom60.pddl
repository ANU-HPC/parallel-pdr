(define (domain appn-pls)
 (:requirements :strips :equality)
 (:predicates (breaker-state-is-unknown_breaker_x1_x2) (breaker-state-is-unknown_breaker_x5_x6) (breaker-state-is-open_breaker_x5_x6) (breaker-state-is-unknown_breaker_x9_x10) (breaker-state-is-open_breaker_x9_x10) (breaker-state-is-unknown_breaker_x11_x12) (breaker-state-is-unknown_breaker_x13_x14) (breaker-state-is-open_breaker_x13_x14) (breaker-state-is-unknown_breaker_x15_x16) (breaker-state-is-open_breaker_x15_x16) (breaker-state-is-unknown_breaker_x17_x18) (breaker-state-is-open_breaker_x17_x18) (breaker-state-is-unknown_breaker_x21_x22) (breaker-state-is-open_breaker_x21_x22) (breaker-state-is-unknown_breaker_x28_x29) (breaker-state-is-open_breaker_x28_x29) (breaker-state-is-unknown_breaker_x30_x31) (breaker-state-is-open_breaker_x30_x31) (breaker-state-is-unknown_breaker_x32_x33) (breaker-state-is-open_breaker_x32_x33) (breaker-state-is-unknown_breaker_x34_x35) (breaker-state-is-open_breaker_x34_x35) (breaker-state-is-unknown_breaker_x36_x37) (breaker-state-is-open_breaker_x36_x37) (breaker-state-is-unknown_breaker_x38_x39) (breaker-state-is-open_breaker_x38_x39) (breaker-state-is-unknown_breaker_x42_x43) (breaker-state-is-open_breaker_x42_x43) (breaker-state-is-unknown_breaker_x46_x47) (breaker-state-is-open_breaker_x46_x47) (breaker-state-is-unknown_breaker_x48_x49) (breaker-state-is-open_breaker_x48_x49) (breaker-state-is-unknown_breaker_x50_x51) (breaker-state-is-open_breaker_x50_x51) (breaker-state-is-closed_breaker_x1_x2) (breaker-state-is-closed_breaker_x5_x6) (breaker-state-is-closed_breaker_x9_x10) (breaker-state-is-closed_breaker_x11_x12) (breaker-state-is-closed_breaker_x13_x14) (breaker-state-is-closed_breaker_x17_x18) (breaker-state-is-closed_breaker_x28_x29) (breaker-state-is-closed_breaker_x30_x31) (breaker-state-is-closed_breaker_x32_x33) (breaker-state-is-closed_breaker_x34_x35) (breaker-state-is-closed_breaker_x36_x37) (breaker-state-is-closed_breaker_x38_x39) (breaker-state-is-closed_breaker_x42_x43) (breaker-state-is-closed_breaker_x46_x47) (breaker-state-is-closed_breaker_x48_x49) (breaker-state-is-closed_breaker_x50_x51) (breaker-ar-status-is-unknown_breaker_x1_x2) (breaker-ar-status-is-auto_breaker_x1_x2) (breaker-ar-status-is-unknown_breaker_x9_x10) (breaker-ar-status-is-auto_breaker_x9_x10) (breaker-ar-status-is-unknown_breaker_x11_x12) (breaker-ar-status-is-auto_breaker_x11_x12) (breaker-ar-status-is-unknown_breaker_x13_x14) (breaker-ar-status-is-auto_breaker_x13_x14) (breaker-ar-status-is-unknown_breaker_x17_x18) (breaker-ar-status-is-auto_breaker_x17_x18) (breaker-ar-status-is-non-auto_breaker_x9_x10) (breaker-ar-status-is-non-auto_breaker_x13_x14) (breaker-ar-status-is-non-auto_breaker_x17_x18) (pending_obs2538) (fault-count-2_count-as-fault_breaker_x1_x2_n0) (observed_obs2538) (fault-count-2_count-as-fault_breaker_x1_x2_n1) (pending_obs2525) (fault-count-2_count-as-fault_breaker_x9_x10_n0) (observed_obs2525) (fault-count-2_count-as-fault_breaker_x9_x10_n1) (line-iso-state-may-have-changed_line_x3_x4_obs2525) (line-iso-state-may-have-changed_line_x7_x8_obs2525) (pending_obs2534) (fault-count-2_count-as-fault_breaker_x11_x12_n0) (observed_obs2534) (fault-count-2_count-as-fault_breaker_x11_x12_n1) (dominates-2_hyp3_count-as-fault_breaker_x11_x12) (dominates-2_hyp2_count-as-fault_breaker_x11_x12) (dominates-2_hyp1_count-as-fault_breaker_x11_x12) (pending_obs2535) (fault-count-2_count-as-fault_breaker_x13_x14_n0) (observed_obs2535) (fault-count-2_count-as-fault_breaker_x13_x14_n1) (line-iso-state-may-have-changed_line_x24_x25_obs2535) (dominates-2_hyp3_count-as-fault_breaker_x13_x14) (pending_obs2526) (fault-count-2_count-as-fault_breaker_x17_x18_n0) (observed_obs2526) (fault-count-2_count-as-fault_breaker_x17_x18_n1) (line-iso-state-may-have-changed_line_x19_x20_obs2526) (dominates-2_hyp1_count-as-fault_breaker_x17_x18) (pending_obs2537) (fault-count-2_count-as-fault_breaker_x15_x16_n0) (observed_obs2537) (fault-count-2_count-as-fault_breaker_x15_x16_n1) (dominates-2_hyp3_count-as-fault_breaker_x15_x16) (dominates-2_hyp2_count-as-fault_breaker_x15_x16) (dominates-2_hyp1_count-as-fault_breaker_x15_x16) (pending_obs2539) (fault-count-2_count-as-fault_breaker_x21_x22_n0) (observed_obs2539) (fault-count-2_count-as-fault_breaker_x21_x22_n1) (dominates-2_hyp3_count-as-fault_breaker_x21_x22) (dominates-2_hyp2_count-as-fault_breaker_x21_x22) (dominates-2_hyp1_count-as-fault_breaker_x21_x22) (pending_obs2536) (observed_obs2536) (pending_obs2524) (breaker-commanded-open_breaker_x9_x10_obs2524) (observed_obs2524) (pending_obs2529) (observed_obs2529) (fault-count-2_count-as-fault_breaker_x5_x6_n0) (fault-count-2_count-as-fault_breaker_x5_x6_n1) (dominates-2_hyp3_count-as-fault_breaker_x5_x6) (dominates-2_hyp2_count-as-fault_breaker_x5_x6) (dominates-2_hyp1_count-as-fault_breaker_x5_x6) (pending_obs2530) (fault-count-2_count-as-fault_bus_x23_n0) (observed_obs2530) (fault-count-2_count-as-fault_bus_x23_n1) (dominates-2_hyp3_count-as-fault_bus_x23) (dominates-2_hyp2_count-as-fault_bus_x23) (dominates-2_hyp1_count-as-fault_bus_x23) (pending_obs2540) (fault-count-2_count-as-fault_bus_x2_n0) (observed_obs2540) (fault-count-2_count-as-fault_bus_x2_n1) (generator-status-is-off_generator_x23_1) (bus-isolated_bus_x2) (generator-status-is-off_generator_x2_1) (bus-iso-state-changed_bus_x2_obs2538) (fault-count-2_count-as-fault_line_x3_x4_n0) (not_line-isolated_line_x3_x4) (line-iso-trip-in-progress_line_x3_x4_obs2525) (not_line-iso-trip-in-progress_line_x3_x4_obs2525) (fault-count-2_count-as-fault_line_x3_x4_n1) (fault-count-2_count-as-fault_line_x3_x4_n2) (fault-count-2_count-as-fault_line_x7_x8_n0) (not_line-isolated_line_x7_x8) (line-iso-trip-in-progress_line_x7_x8_obs2525) (not_line-iso-trip-in-progress_line_x7_x8_obs2525) (fault-count-2_count-as-fault_line_x7_x8_n1) (fault-count-2_count-as-fault_line_x7_x8_n2) (fault-count-2_count-as-fault_line_x19_x20_n0) (not_line-isolated_line_x19_x20) (line-iso-trip-in-progress_line_x19_x20_obs2526) (not_line-iso-trip-in-progress_line_x19_x20_obs2526) (fault-count-2_count-as-fault_line_x19_x20_n1) (dominates-2_hyp3_count-as-fault_line_x19_x20) (dominates-2_hyp2_count-as-fault_line_x19_x20) (fault-count-2_count-as-fault_line_x19_x20_n2) (fault-count-2_count-as-fault_line_x24_x25_n0) (not_line-isolated_line_x24_x25) (line-iso-trip-in-progress_line_x24_x25_obs2535) (not_line-iso-trip-in-progress_line_x24_x25_obs2535) (fault-count-2_count-as-fault_line_x24_x25_n1) (dominates-2_hyp2_count-as-fault_line_x24_x25) (dominates-2_hyp1_count-as-fault_line_x24_x25) (line-isolated_line_x3_x4) (line-iso-state-changed_line_x3_x4_obs2525) (line-isolated_line_x7_x8) (line-iso-state-changed_line_x7_x8_obs2525) (line-isolated_line_x19_x20) (line-iso-state-changed_line_x19_x20_obs2526) (line-isolated_line_x24_x25) (pending_obs2531) (observed_obs2531) (pending_obs2527) (observed_obs2527) (pending_obs2528) (observed_obs2528) (generator-status-is-unknown_generator_x23_1) (generator-status-is-on_generator_x23_1) (generator-status-is-unknown_generator_x2_1) (generator-status-is-on_generator_x2_1) (fault-count-2_count-as-fault_generator_x23_1_n0) (generator-status-is-shutting-down_generator_x23_1) (fault-count-2_count-as-fault_generator_x23_1_n1) (fault-count-2_count-as-fault_generator_x23_1_n2) (dominates-2_hyp3_count-as-fault_generator_x23_1) (dominates-2_hyp2_count-as-fault_generator_x23_1) (dominates-2_hyp1_count-as-fault_generator_x23_1) (fault-count-2_count-as-fault_generator_x2_1_n0) (generator-status-is-shutting-down_generator_x2_1) (fault-count-2_count-as-fault_generator_x2_1_n1) (fault-count-2_count-as-fault_generator_x2_1_n2) (dominates-2_hyp3_count-as-fault_generator_x2_1) (dominates-2_hyp2_count-as-fault_generator_x2_1) (dominates-2_hyp1_count-as-fault_generator_x2_1) (pending_obs2542) (observed_obs2542) (pending_obs2541) (observed_obs2541) (generator-status-is-starting-up_generator_x23_1) (generator-status-is-starting-up_generator_x2_1) (pending_obs2533) (observed_obs2533) (pending_obs2543) (observed_obs2543) (pending_obs2532) (observed_obs2532) (future_obs2525) (future_obs2526) (future_obs2527) (future_obs2528) (future_obs2529) (future_obs2530) (future_obs2531) (future_obs2532) (future_obs2533) (future_obs2534) (future_obs2535) (future_obs2536) (future_obs2537) (future_obs2538) (future_obs2539) (future_obs2540) (future_obs2541) (future_obs2542) (future_obs2543) (not_at_end_constraint0) (achieved_constraint0) (not_at_end_constraint1) (achieved_constraint1) (not_at_end_constraint2) (achieved_constraint2) (static-true))
 (:action breaker-init-state-was-open_breaker_x5_x6
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x5_x6) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x5_x6) (not (breaker-state-is-unknown_breaker_x5_x6))))
 (:action breaker-init-state-was-open_breaker_x9_x10
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x9_x10) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x9_x10) (not (breaker-state-is-unknown_breaker_x9_x10))))
 (:action breaker-init-state-was-open_breaker_x13_x14
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x13_x14) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x13_x14) (not (breaker-state-is-unknown_breaker_x13_x14))))
 (:action breaker-init-state-was-open_breaker_x15_x16
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x15_x16) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x15_x16) (not (breaker-state-is-unknown_breaker_x15_x16))))
 (:action breaker-init-state-was-open_breaker_x17_x18
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x17_x18) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x17_x18) (not (breaker-state-is-unknown_breaker_x17_x18))))
 (:action breaker-init-state-was-open_breaker_x21_x22
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x21_x22) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x21_x22) (not (breaker-state-is-unknown_breaker_x21_x22))))
 (:action breaker-init-state-was-open_breaker_x28_x29
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x28_x29) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x28_x29) (not (breaker-state-is-unknown_breaker_x28_x29))))
 (:action breaker-init-state-was-open_breaker_x30_x31
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x30_x31) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x30_x31) (not (breaker-state-is-unknown_breaker_x30_x31))))
 (:action breaker-init-state-was-open_breaker_x32_x33
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x32_x33) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x32_x33) (not (breaker-state-is-unknown_breaker_x32_x33))))
 (:action breaker-init-state-was-open_breaker_x34_x35
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x34_x35) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x34_x35) (not (breaker-state-is-unknown_breaker_x34_x35))))
 (:action breaker-init-state-was-open_breaker_x36_x37
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x36_x37) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x36_x37) (not (breaker-state-is-unknown_breaker_x36_x37))))
 (:action breaker-init-state-was-open_breaker_x38_x39
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x38_x39) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x38_x39) (not (breaker-state-is-unknown_breaker_x38_x39))))
 (:action breaker-init-state-was-open_breaker_x42_x43
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x42_x43) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x42_x43) (not (breaker-state-is-unknown_breaker_x42_x43))))
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
 (:action breaker-init-state-was-closed_breaker_x1_x2
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x1_x2) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-closed_breaker_x1_x2) (not (breaker-state-is-unknown_breaker_x1_x2))))
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
 (:action breaker-init-state-was-closed_breaker_x17_x18
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x17_x18) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-closed_breaker_x17_x18) (not (breaker-state-is-unknown_breaker_x17_x18))))
 (:action breaker-init-state-was-closed_breaker_x28_x29
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x28_x29) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-closed_breaker_x28_x29) (not (breaker-state-is-unknown_breaker_x28_x29))))
 (:action breaker-init-state-was-closed_breaker_x30_x31
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x30_x31) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-closed_breaker_x30_x31) (not (breaker-state-is-unknown_breaker_x30_x31))))
 (:action breaker-init-state-was-closed_breaker_x32_x33
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x32_x33) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-closed_breaker_x32_x33) (not (breaker-state-is-unknown_breaker_x32_x33))))
 (:action breaker-init-state-was-closed_breaker_x34_x35
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x34_x35) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-closed_breaker_x34_x35) (not (breaker-state-is-unknown_breaker_x34_x35))))
 (:action breaker-init-state-was-closed_breaker_x36_x37
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x36_x37) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-closed_breaker_x36_x37) (not (breaker-state-is-unknown_breaker_x36_x37))))
 (:action breaker-init-state-was-closed_breaker_x38_x39
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x38_x39) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-closed_breaker_x38_x39) (not (breaker-state-is-unknown_breaker_x38_x39))))
 (:action breaker-init-state-was-closed_breaker_x42_x43
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x42_x43) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-closed_breaker_x42_x43) (not (breaker-state-is-unknown_breaker_x42_x43))))
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
 (:action breaker-init-ar-status-was-auto_breaker_x1_x2
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x1_x2) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-ar-status-is-auto_breaker_x1_x2) (not (breaker-ar-status-is-unknown_breaker_x1_x2))))
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
 (:action breaker-init-ar-status-was-auto_breaker_x17_x18
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x17_x18) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-ar-status-is-auto_breaker_x17_x18) (not (breaker-ar-status-is-unknown_breaker_x17_x18))))
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
 (:action breaker-open-unexplained_breaker_x1_x2_obs2538_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x1_x2) (pending_obs2538) (fault-count-2_count-as-fault_breaker_x1_x2_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs2538) (fault-count-2_count-as-fault_breaker_x1_x2_n1) (not (breaker-state-is-closed_breaker_x1_x2)) (not (pending_obs2538)) (not (fault-count-2_count-as-fault_breaker_x1_x2_n0))))
 (:action breaker-open-unexplained_breaker_x9_x10_obs2525_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x9_x10) (pending_obs2525) (fault-count-2_count-as-fault_breaker_x9_x10_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x9_x10) (observed_obs2525) (fault-count-2_count-as-fault_breaker_x9_x10_n1) (line-iso-state-may-have-changed_line_x3_x4_obs2525) (line-iso-state-may-have-changed_line_x7_x8_obs2525) (not (breaker-state-is-closed_breaker_x9_x10)) (not (pending_obs2525)) (not (fault-count-2_count-as-fault_breaker_x9_x10_n0))))
 (:action breaker-open-unexplained_breaker_x11_x12_obs2534_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x11_x12) (pending_obs2534) (fault-count-2_count-as-fault_breaker_x11_x12_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs2534) (fault-count-2_count-as-fault_breaker_x11_x12_n1) (not (breaker-state-is-closed_breaker_x11_x12)) (not (pending_obs2534)) (not (fault-count-2_count-as-fault_breaker_x11_x12_n0)) (not (dominates-2_hyp3_count-as-fault_breaker_x11_x12)) (not (dominates-2_hyp2_count-as-fault_breaker_x11_x12)) (not (dominates-2_hyp1_count-as-fault_breaker_x11_x12))))
 (:action breaker-open-unexplained_breaker_x13_x14_obs2535_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x13_x14) (pending_obs2535) (fault-count-2_count-as-fault_breaker_x13_x14_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x13_x14) (observed_obs2535) (fault-count-2_count-as-fault_breaker_x13_x14_n1) (line-iso-state-may-have-changed_line_x24_x25_obs2535) (not (breaker-state-is-closed_breaker_x13_x14)) (not (pending_obs2535)) (not (fault-count-2_count-as-fault_breaker_x13_x14_n0)) (not (dominates-2_hyp3_count-as-fault_breaker_x13_x14))))
 (:action breaker-open-unexplained_breaker_x17_x18_obs2526_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x17_x18) (pending_obs2526) (fault-count-2_count-as-fault_breaker_x17_x18_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x17_x18) (observed_obs2526) (fault-count-2_count-as-fault_breaker_x17_x18_n1) (line-iso-state-may-have-changed_line_x19_x20_obs2526) (not (breaker-state-is-closed_breaker_x17_x18)) (not (pending_obs2526)) (not (fault-count-2_count-as-fault_breaker_x17_x18_n0)) (not (dominates-2_hyp1_count-as-fault_breaker_x17_x18))))
 (:action breaker-trip-unexplained_breaker_x1_x2_obs2538_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x1_x2) (breaker-ar-status-is-auto_breaker_x1_x2) (pending_obs2538) (fault-count-2_count-as-fault_breaker_x1_x2_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs2538) (fault-count-2_count-as-fault_breaker_x1_x2_n1) (not (breaker-state-is-closed_breaker_x1_x2)) (not (pending_obs2538)) (not (fault-count-2_count-as-fault_breaker_x1_x2_n0))))
 (:action breaker-trip-unexplained_breaker_x9_x10_obs2525_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x9_x10) (breaker-ar-status-is-auto_breaker_x9_x10) (pending_obs2525) (fault-count-2_count-as-fault_breaker_x9_x10_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x9_x10) (observed_obs2525) (fault-count-2_count-as-fault_breaker_x9_x10_n1) (line-iso-state-may-have-changed_line_x3_x4_obs2525) (line-iso-state-may-have-changed_line_x7_x8_obs2525) (not (breaker-state-is-closed_breaker_x9_x10)) (not (pending_obs2525)) (not (fault-count-2_count-as-fault_breaker_x9_x10_n0))))
 (:action breaker-trip-unexplained_breaker_x11_x12_obs2534_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x11_x12) (breaker-ar-status-is-auto_breaker_x11_x12) (pending_obs2534) (fault-count-2_count-as-fault_breaker_x11_x12_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs2534) (fault-count-2_count-as-fault_breaker_x11_x12_n1) (not (breaker-state-is-closed_breaker_x11_x12)) (not (pending_obs2534)) (not (fault-count-2_count-as-fault_breaker_x11_x12_n0)) (not (dominates-2_hyp3_count-as-fault_breaker_x11_x12)) (not (dominates-2_hyp2_count-as-fault_breaker_x11_x12)) (not (dominates-2_hyp1_count-as-fault_breaker_x11_x12))))
 (:action breaker-trip-unexplained_breaker_x13_x14_obs2535_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x13_x14) (breaker-ar-status-is-auto_breaker_x13_x14) (pending_obs2535) (fault-count-2_count-as-fault_breaker_x13_x14_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x13_x14) (observed_obs2535) (fault-count-2_count-as-fault_breaker_x13_x14_n1) (line-iso-state-may-have-changed_line_x24_x25_obs2535) (not (breaker-state-is-closed_breaker_x13_x14)) (not (pending_obs2535)) (not (fault-count-2_count-as-fault_breaker_x13_x14_n0)) (not (dominates-2_hyp3_count-as-fault_breaker_x13_x14))))
 (:action breaker-trip-unexplained_breaker_x17_x18_obs2526_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x17_x18) (breaker-ar-status-is-auto_breaker_x17_x18) (pending_obs2526) (fault-count-2_count-as-fault_breaker_x17_x18_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x17_x18) (observed_obs2526) (fault-count-2_count-as-fault_breaker_x17_x18_n1) (line-iso-state-may-have-changed_line_x19_x20_obs2526) (not (breaker-state-is-closed_breaker_x17_x18)) (not (pending_obs2526)) (not (fault-count-2_count-as-fault_breaker_x17_x18_n0)) (not (dominates-2_hyp1_count-as-fault_breaker_x17_x18))))
 (:action breaker-close-unexplained_breaker_x15_x16_obs2537_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x15_x16) (pending_obs2537) (fault-count-2_count-as-fault_breaker_x15_x16_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs2537) (fault-count-2_count-as-fault_breaker_x15_x16_n1) (not (breaker-state-is-open_breaker_x15_x16)) (not (pending_obs2537)) (not (fault-count-2_count-as-fault_breaker_x15_x16_n0)) (not (dominates-2_hyp3_count-as-fault_breaker_x15_x16)) (not (dominates-2_hyp2_count-as-fault_breaker_x15_x16)) (not (dominates-2_hyp1_count-as-fault_breaker_x15_x16))))
 (:action breaker-close-unexplained_breaker_x21_x22_obs2539_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x21_x22) (pending_obs2539) (fault-count-2_count-as-fault_breaker_x21_x22_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs2539) (fault-count-2_count-as-fault_breaker_x21_x22_n1) (not (breaker-state-is-open_breaker_x21_x22)) (not (pending_obs2539)) (not (fault-count-2_count-as-fault_breaker_x21_x22_n0)) (not (dominates-2_hyp3_count-as-fault_breaker_x21_x22)) (not (dominates-2_hyp2_count-as-fault_breaker_x21_x22)) (not (dominates-2_hyp1_count-as-fault_breaker_x21_x22))))
 (:action breaker-command-open_breaker_x5_x6_obs2536
  :parameters ()
  :precondition (and (pending_obs2536) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs2536) (not (pending_obs2536))))
 (:action breaker-command-open_breaker_x9_x10_obs2524
  :parameters ()
  :precondition (and (pending_obs2524) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-commanded-open_breaker_x9_x10_obs2524) (observed_obs2524) (not (pending_obs2524))))
 (:action breaker-open-on-command_breaker_x9_x10_obs2525_obs2524
  :parameters ()
  :precondition (and (pending_obs2525) (breaker-commanded-open_breaker_x9_x10_obs2524) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x9_x10) (observed_obs2525) (line-iso-state-may-have-changed_line_x3_x4_obs2525) (line-iso-state-may-have-changed_line_x7_x8_obs2525) (not (breaker-state-is-unknown_breaker_x9_x10)) (not (breaker-state-is-closed_breaker_x9_x10)) (not (pending_obs2525))))
 (:action breaker-ar-status-non-auto-unexplained-1_breaker_x5_x6_obs2529_n0_n1
  :parameters ()
  :precondition (and (pending_obs2529) (fault-count-2_count-as-fault_breaker_x5_x6_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs2529) (fault-count-2_count-as-fault_breaker_x5_x6_n1) (not (pending_obs2529)) (not (fault-count-2_count-as-fault_breaker_x5_x6_n0)) (not (dominates-2_hyp3_count-as-fault_breaker_x5_x6)) (not (dominates-2_hyp2_count-as-fault_breaker_x5_x6)) (not (dominates-2_hyp1_count-as-fault_breaker_x5_x6))))
 (:action bus-mw-goes-to-zero-unexplained_bus_x23_obs2530_n0_n1
  :parameters ()
  :precondition (and (pending_obs2530) (fault-count-2_count-as-fault_bus_x23_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs2530) (fault-count-2_count-as-fault_bus_x23_n1) (not (pending_obs2530)) (not (fault-count-2_count-as-fault_bus_x23_n0)) (not (dominates-2_hyp3_count-as-fault_bus_x23)) (not (dominates-2_hyp2_count-as-fault_bus_x23)) (not (dominates-2_hyp1_count-as-fault_bus_x23))))
 (:action bus-mw-goes-to-zero-unexplained_bus_x2_obs2540_n0_n1
  :parameters ()
  :precondition (and (pending_obs2540) (fault-count-2_count-as-fault_bus_x2_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs2540) (fault-count-2_count-as-fault_bus_x2_n1) (not (pending_obs2540)) (not (fault-count-2_count-as-fault_bus_x2_n0))))
 (:action bus-mw-goes-to-zero-when-isolated_bus_x2_obs2540_obs2538
  :parameters ()
  :precondition (and (pending_obs2540) (bus-isolated_bus_x2) (generator-status-is-off_generator_x2_1) (bus-iso-state-changed_bus_x2_obs2538) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs2540) (not (pending_obs2540))))
 (:action line-iso-trip-first-breaker-simple-trip-1_line_x3_x4_breaker_x9_x10_breaker_x9_x10_obs2525_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x9_x10) (breaker-ar-status-is-auto_breaker_x9_x10) (pending_obs2525) (fault-count-2_count-as-fault_line_x3_x4_n0) (not_line-isolated_line_x3_x4) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x9_x10) (observed_obs2525) (line-iso-trip-in-progress_line_x3_x4_obs2525) (fault-count-2_count-as-fault_line_x3_x4_n1) (not (breaker-state-is-closed_breaker_x9_x10)) (not (pending_obs2525)) (not (fault-count-2_count-as-fault_line_x3_x4_n0)) (not (not_line-iso-trip-in-progress_line_x3_x4_obs2525))))
 (:action line-iso-trip-first-breaker-simple-trip-1_line_x7_x8_breaker_x9_x10_breaker_x9_x10_obs2525_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x9_x10) (breaker-ar-status-is-auto_breaker_x9_x10) (pending_obs2525) (fault-count-2_count-as-fault_line_x7_x8_n0) (not_line-isolated_line_x7_x8) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x9_x10) (observed_obs2525) (line-iso-trip-in-progress_line_x7_x8_obs2525) (fault-count-2_count-as-fault_line_x7_x8_n1) (not (breaker-state-is-closed_breaker_x9_x10)) (not (pending_obs2525)) (not (fault-count-2_count-as-fault_line_x7_x8_n0)) (not (not_line-iso-trip-in-progress_line_x7_x8_obs2525))))
 (:action line-iso-trip-first-breaker-simple-trip-1_line_x19_x20_breaker_x17_x18_breaker_x17_x18_obs2526_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x17_x18) (breaker-ar-status-is-auto_breaker_x17_x18) (pending_obs2526) (fault-count-2_count-as-fault_line_x19_x20_n0) (not_line-isolated_line_x19_x20) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x17_x18) (observed_obs2526) (line-iso-trip-in-progress_line_x19_x20_obs2526) (fault-count-2_count-as-fault_line_x19_x20_n1) (not (breaker-state-is-closed_breaker_x17_x18)) (not (pending_obs2526)) (not (fault-count-2_count-as-fault_line_x19_x20_n0)) (not (not_line-iso-trip-in-progress_line_x19_x20_obs2526)) (not (dominates-2_hyp3_count-as-fault_line_x19_x20)) (not (dominates-2_hyp2_count-as-fault_line_x19_x20))))
 (:action line-iso-trip-first-breaker-simple-trip-1_line_x24_x25_breaker_x13_x14_breaker_x13_x14_obs2535_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x13_x14) (breaker-ar-status-is-auto_breaker_x13_x14) (pending_obs2535) (fault-count-2_count-as-fault_line_x24_x25_n0) (not_line-isolated_line_x24_x25) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x13_x14) (observed_obs2535) (line-iso-trip-in-progress_line_x24_x25_obs2535) (fault-count-2_count-as-fault_line_x24_x25_n1) (not (breaker-state-is-closed_breaker_x13_x14)) (not (pending_obs2535)) (not (fault-count-2_count-as-fault_line_x24_x25_n0)) (not (not_line-iso-trip-in-progress_line_x24_x25_obs2535)) (not (dominates-2_hyp2_count-as-fault_line_x24_x25)) (not (dominates-2_hyp1_count-as-fault_line_x24_x25))))
 (:action line-iso-trip-first-breaker-simple-trip-2_line_x3_x4_breaker_x9_x10_breaker_x9_x10_obs2525_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x9_x10) (breaker-ar-status-is-non-auto_breaker_x9_x10) (pending_obs2525) (fault-count-2_count-as-fault_line_x3_x4_n0) (not_line-isolated_line_x3_x4) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x9_x10) (observed_obs2525) (line-iso-trip-in-progress_line_x3_x4_obs2525) (fault-count-2_count-as-fault_line_x3_x4_n1) (not (breaker-state-is-closed_breaker_x9_x10)) (not (pending_obs2525)) (not (fault-count-2_count-as-fault_line_x3_x4_n0)) (not (not_line-iso-trip-in-progress_line_x3_x4_obs2525))))
 (:action line-iso-trip-first-breaker-simple-trip-2_line_x7_x8_breaker_x9_x10_breaker_x9_x10_obs2525_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x9_x10) (breaker-ar-status-is-non-auto_breaker_x9_x10) (pending_obs2525) (fault-count-2_count-as-fault_line_x7_x8_n0) (not_line-isolated_line_x7_x8) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x9_x10) (observed_obs2525) (line-iso-trip-in-progress_line_x7_x8_obs2525) (fault-count-2_count-as-fault_line_x7_x8_n1) (not (breaker-state-is-closed_breaker_x9_x10)) (not (pending_obs2525)) (not (fault-count-2_count-as-fault_line_x7_x8_n0)) (not (not_line-iso-trip-in-progress_line_x7_x8_obs2525))))
 (:action line-iso-trip-first-breaker-simple-trip-2_line_x19_x20_breaker_x17_x18_breaker_x17_x18_obs2526_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x17_x18) (breaker-ar-status-is-non-auto_breaker_x17_x18) (pending_obs2526) (fault-count-2_count-as-fault_line_x19_x20_n0) (not_line-isolated_line_x19_x20) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x17_x18) (observed_obs2526) (line-iso-trip-in-progress_line_x19_x20_obs2526) (fault-count-2_count-as-fault_line_x19_x20_n1) (not (breaker-state-is-closed_breaker_x17_x18)) (not (pending_obs2526)) (not (fault-count-2_count-as-fault_line_x19_x20_n0)) (not (not_line-iso-trip-in-progress_line_x19_x20_obs2526)) (not (dominates-2_hyp3_count-as-fault_line_x19_x20)) (not (dominates-2_hyp2_count-as-fault_line_x19_x20))))
 (:action line-iso-trip-first-breaker-simple-trip-2_line_x24_x25_breaker_x13_x14_breaker_x13_x14_obs2535_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x13_x14) (breaker-ar-status-is-non-auto_breaker_x13_x14) (pending_obs2535) (fault-count-2_count-as-fault_line_x24_x25_n0) (not_line-isolated_line_x24_x25) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x13_x14) (observed_obs2535) (line-iso-trip-in-progress_line_x24_x25_obs2535) (fault-count-2_count-as-fault_line_x24_x25_n1) (not (breaker-state-is-closed_breaker_x13_x14)) (not (pending_obs2535)) (not (fault-count-2_count-as-fault_line_x24_x25_n0)) (not (not_line-iso-trip-in-progress_line_x24_x25_obs2535)) (not (dominates-2_hyp2_count-as-fault_line_x24_x25)) (not (dominates-2_hyp1_count-as-fault_line_x24_x25))))
 (:action line-finish-iso-trip-4_line_x3_x4_breaker_x30_x31_breaker_x5_x6_breaker_x9_x10_breaker_x46_x47_obs2525
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x5_x6) (breaker-state-is-open_breaker_x9_x10) (breaker-state-is-open_breaker_x30_x31) (breaker-state-is-open_breaker_x46_x47) (line-iso-trip-in-progress_line_x3_x4_obs2525) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (not_line-iso-trip-in-progress_line_x3_x4_obs2525) (line-isolated_line_x3_x4) (line-iso-state-changed_line_x3_x4_obs2525) (not (not_line-isolated_line_x3_x4)) (not (line-iso-trip-in-progress_line_x3_x4_obs2525))))
 (:action line-finish-iso-trip-4_line_x7_x8_breaker_x28_x29_breaker_x36_x37_breaker_x9_x10_breaker_x46_x47_obs2525
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x9_x10) (breaker-state-is-open_breaker_x28_x29) (breaker-state-is-open_breaker_x36_x37) (breaker-state-is-open_breaker_x46_x47) (line-iso-trip-in-progress_line_x7_x8_obs2525) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (not_line-iso-trip-in-progress_line_x7_x8_obs2525) (line-isolated_line_x7_x8) (line-iso-state-changed_line_x7_x8_obs2525) (not (not_line-isolated_line_x7_x8)) (not (line-iso-trip-in-progress_line_x7_x8_obs2525))))
 (:action line-finish-iso-trip-4_line_x19_x20_breaker_x34_x35_breaker_x38_x39_breaker_x17_x18_breaker_x50_x51_obs2526
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x17_x18) (breaker-state-is-open_breaker_x34_x35) (breaker-state-is-open_breaker_x38_x39) (breaker-state-is-open_breaker_x50_x51) (line-iso-trip-in-progress_line_x19_x20_obs2526) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (not_line-iso-trip-in-progress_line_x19_x20_obs2526) (line-isolated_line_x19_x20) (line-iso-state-changed_line_x19_x20_obs2526) (not (not_line-isolated_line_x19_x20)) (not (line-iso-trip-in-progress_line_x19_x20_obs2526))))
 (:action line-finish-iso-trip-4_line_x24_x25_breaker_x32_x33_breaker_x13_x14_breaker_x42_x43_breaker_x48_x49_obs2535
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x13_x14) (breaker-state-is-open_breaker_x32_x33) (breaker-state-is-open_breaker_x42_x43) (breaker-state-is-open_breaker_x48_x49) (line-iso-trip-in-progress_line_x24_x25_obs2535) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (not_line-iso-trip-in-progress_line_x24_x25_obs2535) (line-isolated_line_x24_x25) (not (not_line-isolated_line_x24_x25)) (not (line-iso-trip-in-progress_line_x24_x25_obs2535))))
 (:action line-set-state-isolated-4_line_x3_x4_breaker_x30_x31_breaker_x5_x6_breaker_x9_x10_breaker_x46_x47_obs2525
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x5_x6) (breaker-state-is-open_breaker_x9_x10) (breaker-state-is-open_breaker_x30_x31) (breaker-state-is-open_breaker_x46_x47) (line-iso-state-may-have-changed_line_x3_x4_obs2525) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (line-isolated_line_x3_x4) (line-iso-state-changed_line_x3_x4_obs2525) (not (not_line-isolated_line_x3_x4))))
 (:action line-set-state-isolated-4_line_x7_x8_breaker_x28_x29_breaker_x36_x37_breaker_x9_x10_breaker_x46_x47_obs2525
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x9_x10) (breaker-state-is-open_breaker_x28_x29) (breaker-state-is-open_breaker_x36_x37) (breaker-state-is-open_breaker_x46_x47) (line-iso-state-may-have-changed_line_x7_x8_obs2525) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (line-isolated_line_x7_x8) (line-iso-state-changed_line_x7_x8_obs2525) (not (not_line-isolated_line_x7_x8))))
 (:action line-set-state-isolated-4_line_x19_x20_breaker_x34_x35_breaker_x38_x39_breaker_x17_x18_breaker_x50_x51_obs2526
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x17_x18) (breaker-state-is-open_breaker_x34_x35) (breaker-state-is-open_breaker_x38_x39) (breaker-state-is-open_breaker_x50_x51) (line-iso-state-may-have-changed_line_x19_x20_obs2526) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (line-isolated_line_x19_x20) (line-iso-state-changed_line_x19_x20_obs2526) (not (not_line-isolated_line_x19_x20))))
 (:action line-set-state-isolated-4_line_x24_x25_breaker_x32_x33_breaker_x13_x14_breaker_x42_x43_breaker_x48_x49_obs2535
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x13_x14) (breaker-state-is-open_breaker_x32_x33) (breaker-state-is-open_breaker_x42_x43) (breaker-state-is-open_breaker_x48_x49) (line-iso-state-may-have-changed_line_x24_x25_obs2535) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (line-isolated_line_x24_x25) (not (not_line-isolated_line_x24_x25))))
 (:action line-init-state-isolated-4_line_x3_x4_breaker_x30_x31_breaker_x5_x6_breaker_x9_x10_breaker_x46_x47
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x5_x6) (breaker-state-is-open_breaker_x9_x10) (breaker-state-is-open_breaker_x30_x31) (breaker-state-is-open_breaker_x46_x47) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (line-isolated_line_x3_x4) (not (not_line-isolated_line_x3_x4))))
 (:action line-init-state-isolated-4_line_x7_x8_breaker_x28_x29_breaker_x36_x37_breaker_x9_x10_breaker_x46_x47
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x9_x10) (breaker-state-is-open_breaker_x28_x29) (breaker-state-is-open_breaker_x36_x37) (breaker-state-is-open_breaker_x46_x47) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (line-isolated_line_x7_x8) (not (not_line-isolated_line_x7_x8))))
 (:action line-init-state-isolated-4_line_x19_x20_breaker_x34_x35_breaker_x38_x39_breaker_x17_x18_breaker_x50_x51
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x17_x18) (breaker-state-is-open_breaker_x34_x35) (breaker-state-is-open_breaker_x38_x39) (breaker-state-is-open_breaker_x50_x51) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (line-isolated_line_x19_x20) (not (not_line-isolated_line_x19_x20))))
 (:action line-init-state-isolated-4_line_x24_x25_breaker_x32_x33_breaker_x13_x14_breaker_x42_x43_breaker_x48_x49
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x13_x14) (breaker-state-is-open_breaker_x32_x33) (breaker-state-is-open_breaker_x42_x43) (breaker-state-is-open_breaker_x48_x49) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (line-isolated_line_x24_x25) (not (not_line-isolated_line_x24_x25))))
 (:action line-voltage-goes-to-zero-unexplained-1_line_x3_x4_obs2531_n0_n1
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_line_x3_x4_n0) (pending_obs2531) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (fault-count-2_count-as-fault_line_x3_x4_n1) (observed_obs2531) (not (fault-count-2_count-as-fault_line_x3_x4_n0)) (not (pending_obs2531))))
 (:action line-voltage-goes-to-zero-unexplained-1_line_x3_x4_obs2531_n1_n2
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_line_x3_x4_n1) (pending_obs2531) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (fault-count-2_count-as-fault_line_x3_x4_n2) (observed_obs2531) (not (fault-count-2_count-as-fault_line_x3_x4_n1)) (not (pending_obs2531))))
 (:action line-voltage-goes-to-zero-unexplained-1_line_x7_x8_obs2527_n0_n1
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_line_x7_x8_n0) (pending_obs2527) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (fault-count-2_count-as-fault_line_x7_x8_n1) (observed_obs2527) (not (fault-count-2_count-as-fault_line_x7_x8_n0)) (not (pending_obs2527))))
 (:action line-voltage-goes-to-zero-unexplained-1_line_x7_x8_obs2527_n1_n2
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_line_x7_x8_n1) (pending_obs2527) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (fault-count-2_count-as-fault_line_x7_x8_n2) (observed_obs2527) (not (fault-count-2_count-as-fault_line_x7_x8_n1)) (not (pending_obs2527))))
 (:action line-voltage-goes-to-zero-unexplained-1_line_x19_x20_obs2528_n0_n1
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_line_x19_x20_n0) (pending_obs2528) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (fault-count-2_count-as-fault_line_x19_x20_n1) (observed_obs2528) (not (fault-count-2_count-as-fault_line_x19_x20_n0)) (not (dominates-2_hyp3_count-as-fault_line_x19_x20)) (not (dominates-2_hyp2_count-as-fault_line_x19_x20)) (not (pending_obs2528))))
 (:action line-voltage-goes-to-zero-unexplained-1_line_x19_x20_obs2528_n1_n2
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_line_x19_x20_n1) (pending_obs2528) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (fault-count-2_count-as-fault_line_x19_x20_n2) (observed_obs2528) (not (fault-count-2_count-as-fault_line_x19_x20_n1)) (not (pending_obs2528))))
 (:action line-voltage-goes-to-zero-when-isolated-1_line_x3_x4_obs2531_obs2525
  :parameters ()
  :precondition (and (line-isolated_line_x3_x4) (line-iso-state-changed_line_x3_x4_obs2525) (pending_obs2531) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs2531) (not (pending_obs2531))))
 (:action line-voltage-goes-to-zero-when-isolated-1_line_x7_x8_obs2527_obs2525
  :parameters ()
  :precondition (and (line-isolated_line_x7_x8) (line-iso-state-changed_line_x7_x8_obs2525) (pending_obs2527) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs2527) (not (pending_obs2527))))
 (:action line-voltage-goes-to-zero-when-isolated-1_line_x19_x20_obs2528_obs2526
  :parameters ()
  :precondition (and (line-isolated_line_x19_x20) (line-iso-state-changed_line_x19_x20_obs2526) (pending_obs2528) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs2528) (not (pending_obs2528))))
 (:action generator-init-status-was-on_generator_x23_1
  :parameters ()
  :precondition (and (generator-status-is-unknown_generator_x23_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (generator-status-is-on_generator_x23_1) (not (generator-status-is-unknown_generator_x23_1))))
 (:action generator-init-status-was-on_generator_x2_1
  :parameters ()
  :precondition (and (generator-status-is-unknown_generator_x2_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (generator-status-is-on_generator_x2_1) (not (generator-status-is-unknown_generator_x2_1))))
 (:action generator-init-status-was-off_generator_x23_1
  :parameters ()
  :precondition (and (generator-status-is-unknown_generator_x23_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (generator-status-is-off_generator_x23_1) (not (generator-status-is-unknown_generator_x23_1))))
 (:action generator-init-status-was-off_generator_x2_1
  :parameters ()
  :precondition (and (generator-status-is-unknown_generator_x2_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (generator-status-is-off_generator_x2_1) (not (generator-status-is-unknown_generator_x2_1))))
 (:action generator-begin-shutdown_generator_x23_1_n0_n1
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x23_1) (fault-count-2_count-as-fault_generator_x23_1_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (generator-status-is-shutting-down_generator_x23_1) (fault-count-2_count-as-fault_generator_x23_1_n1) (not (generator-status-is-on_generator_x23_1)) (not (fault-count-2_count-as-fault_generator_x23_1_n0))))
 (:action generator-begin-shutdown_generator_x23_1_n1_n2
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x23_1) (fault-count-2_count-as-fault_generator_x23_1_n1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (generator-status-is-shutting-down_generator_x23_1) (fault-count-2_count-as-fault_generator_x23_1_n2) (not (generator-status-is-on_generator_x23_1)) (not (fault-count-2_count-as-fault_generator_x23_1_n1)) (not (dominates-2_hyp3_count-as-fault_generator_x23_1)) (not (dominates-2_hyp2_count-as-fault_generator_x23_1)) (not (dominates-2_hyp1_count-as-fault_generator_x23_1))))
 (:action generator-begin-shutdown_generator_x23_1_n2_n3
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x23_1) (fault-count-2_count-as-fault_generator_x23_1_n2) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (generator-status-is-shutting-down_generator_x23_1) (not (generator-status-is-on_generator_x23_1)) (not (fault-count-2_count-as-fault_generator_x23_1_n2))))
 (:action generator-begin-shutdown_generator_x2_1_n0_n1
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x2_1) (fault-count-2_count-as-fault_generator_x2_1_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (generator-status-is-shutting-down_generator_x2_1) (fault-count-2_count-as-fault_generator_x2_1_n1) (not (generator-status-is-on_generator_x2_1)) (not (fault-count-2_count-as-fault_generator_x2_1_n0))))
 (:action generator-begin-shutdown_generator_x2_1_n1_n2
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x2_1) (fault-count-2_count-as-fault_generator_x2_1_n1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (generator-status-is-shutting-down_generator_x2_1) (fault-count-2_count-as-fault_generator_x2_1_n2) (not (generator-status-is-on_generator_x2_1)) (not (fault-count-2_count-as-fault_generator_x2_1_n1))))
 (:action generator-begin-shutdown_generator_x2_1_n2_n3
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x2_1) (fault-count-2_count-as-fault_generator_x2_1_n2) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (generator-status-is-shutting-down_generator_x2_1) (not (generator-status-is-on_generator_x2_1)) (not (fault-count-2_count-as-fault_generator_x2_1_n2)) (not (dominates-2_hyp3_count-as-fault_generator_x2_1)) (not (dominates-2_hyp2_count-as-fault_generator_x2_1)) (not (dominates-2_hyp1_count-as-fault_generator_x2_1))))
 (:action generator-shutdown-breaker-open-breaker-open_generator_x2_1_breaker_x1_x2_bus_x2_breaker_x1_x2_obs2538
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x1_x2) (pending_obs2538) (generator-status-is-shutting-down_generator_x2_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs2538) (bus-isolated_bus_x2) (bus-iso-state-changed_bus_x2_obs2538) (not (breaker-state-is-closed_breaker_x1_x2)) (not (pending_obs2538))))
 (:action generator-shutdown-turn-off_generator_x23_1_obs2542
  :parameters ()
  :precondition (and (generator-status-is-shutting-down_generator_x23_1) (pending_obs2542) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs2542) (not (pending_obs2542))))
 (:action generator-shutdown-turn-off_generator_x2_1_obs2541
  :parameters ()
  :precondition (and (generator-status-is-shutting-down_generator_x2_1) (pending_obs2541) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs2541) (not (pending_obs2541))))
 (:action generator-shutdown-complete_generator_x23_1
  :parameters ()
  :precondition (and (generator-status-is-shutting-down_generator_x23_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (generator-status-is-off_generator_x23_1) (not (generator-status-is-shutting-down_generator_x23_1))))
 (:action generator-shutdown-complete_generator_x2_1
  :parameters ()
  :precondition (and (generator-status-is-shutting-down_generator_x2_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (generator-status-is-off_generator_x2_1) (not (generator-status-is-shutting-down_generator_x2_1))))
 (:action generator-begin-startup_generator_x23_1_n0_n1
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x23_1) (fault-count-2_count-as-fault_generator_x23_1_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (fault-count-2_count-as-fault_generator_x23_1_n1) (generator-status-is-starting-up_generator_x23_1) (not (generator-status-is-on_generator_x23_1)) (not (fault-count-2_count-as-fault_generator_x23_1_n0))))
 (:action generator-begin-startup_generator_x23_1_n1_n2
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x23_1) (fault-count-2_count-as-fault_generator_x23_1_n1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (fault-count-2_count-as-fault_generator_x23_1_n2) (generator-status-is-starting-up_generator_x23_1) (not (generator-status-is-on_generator_x23_1)) (not (fault-count-2_count-as-fault_generator_x23_1_n1)) (not (dominates-2_hyp3_count-as-fault_generator_x23_1)) (not (dominates-2_hyp2_count-as-fault_generator_x23_1)) (not (dominates-2_hyp1_count-as-fault_generator_x23_1))))
 (:action generator-begin-startup_generator_x23_1_n2_n3
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x23_1) (fault-count-2_count-as-fault_generator_x23_1_n2) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (generator-status-is-starting-up_generator_x23_1) (not (generator-status-is-on_generator_x23_1)) (not (fault-count-2_count-as-fault_generator_x23_1_n2))))
 (:action generator-begin-startup_generator_x2_1_n0_n1
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x2_1) (fault-count-2_count-as-fault_generator_x2_1_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (fault-count-2_count-as-fault_generator_x2_1_n1) (generator-status-is-starting-up_generator_x2_1) (not (generator-status-is-on_generator_x2_1)) (not (fault-count-2_count-as-fault_generator_x2_1_n0))))
 (:action generator-begin-startup_generator_x2_1_n1_n2
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x2_1) (fault-count-2_count-as-fault_generator_x2_1_n1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (fault-count-2_count-as-fault_generator_x2_1_n2) (generator-status-is-starting-up_generator_x2_1) (not (generator-status-is-on_generator_x2_1)) (not (fault-count-2_count-as-fault_generator_x2_1_n1))))
 (:action generator-begin-startup_generator_x2_1_n2_n3
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x2_1) (fault-count-2_count-as-fault_generator_x2_1_n2) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (generator-status-is-starting-up_generator_x2_1) (not (generator-status-is-on_generator_x2_1)) (not (fault-count-2_count-as-fault_generator_x2_1_n2)) (not (dominates-2_hyp3_count-as-fault_generator_x2_1)) (not (dominates-2_hyp2_count-as-fault_generator_x2_1)) (not (dominates-2_hyp1_count-as-fault_generator_x2_1))))
 (:action generator-startup-complete_generator_x23_1
  :parameters ()
  :precondition (and (generator-status-is-starting-up_generator_x23_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (generator-status-is-on_generator_x23_1) (not (generator-status-is-starting-up_generator_x23_1))))
 (:action generator-startup-complete_generator_x2_1
  :parameters ()
  :precondition (and (generator-status-is-starting-up_generator_x2_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (generator-status-is-on_generator_x2_1) (not (generator-status-is-starting-up_generator_x2_1))))
 (:action generator-runback-alarm_generator_x2_1_obs2533_n0_n1
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x2_1_n0) (pending_obs2533) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (fault-count-2_count-as-fault_generator_x2_1_n1) (observed_obs2533) (not (fault-count-2_count-as-fault_generator_x2_1_n0)) (not (pending_obs2533))))
 (:action generator-runback-alarm_generator_x2_1_obs2533_n1_n2
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x2_1_n1) (pending_obs2533) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (fault-count-2_count-as-fault_generator_x2_1_n2) (observed_obs2533) (not (fault-count-2_count-as-fault_generator_x2_1_n1)) (not (pending_obs2533))))
 (:action generator-runback-alarm_generator_x2_1_obs2533_n2_n3
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x2_1_n2) (pending_obs2533) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs2533) (not (fault-count-2_count-as-fault_generator_x2_1_n2)) (not (dominates-2_hyp3_count-as-fault_generator_x2_1)) (not (dominates-2_hyp2_count-as-fault_generator_x2_1)) (not (dominates-2_hyp1_count-as-fault_generator_x2_1)) (not (pending_obs2533))))
 (:action generator-runback-alarm_generator_x2_1_obs2543_n1_n2
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x2_1_n1) (pending_obs2543) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (fault-count-2_count-as-fault_generator_x2_1_n2) (observed_obs2543) (not (fault-count-2_count-as-fault_generator_x2_1_n1)) (not (pending_obs2543))))
 (:action generator-runback-alarm_generator_x2_1_obs2543_n2_n3
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x2_1_n2) (pending_obs2543) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs2543) (not (fault-count-2_count-as-fault_generator_x2_1_n2)) (not (dominates-2_hyp3_count-as-fault_generator_x2_1)) (not (dominates-2_hyp2_count-as-fault_generator_x2_1)) (not (dominates-2_hyp1_count-as-fault_generator_x2_1)) (not (pending_obs2543))))
 (:action generator-runback-alarm-reset_generator_x23_1_obs2532_n0_n1
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x23_1_n0) (pending_obs2532) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (fault-count-2_count-as-fault_generator_x23_1_n1) (observed_obs2532) (not (fault-count-2_count-as-fault_generator_x23_1_n0)) (not (pending_obs2532))))
 (:action generator-runback-alarm-reset_generator_x23_1_obs2532_n1_n2
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x23_1_n1) (pending_obs2532) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (fault-count-2_count-as-fault_generator_x23_1_n2) (observed_obs2532) (not (fault-count-2_count-as-fault_generator_x23_1_n1)) (not (dominates-2_hyp3_count-as-fault_generator_x23_1)) (not (dominates-2_hyp2_count-as-fault_generator_x23_1)) (not (dominates-2_hyp1_count-as-fault_generator_x23_1)) (not (pending_obs2532))))
 (:action generator-runback-alarm-reset_generator_x23_1_obs2532_n2_n3
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x23_1_n2) (pending_obs2532) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs2532) (not (fault-count-2_count-as-fault_generator_x23_1_n2)) (not (pending_obs2532))))
 (:action generator-runback-reset-when-off_generator_x23_1_obs2532
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x23_1) (pending_obs2532) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs2532) (not (pending_obs2532))))
 (:action advance-to-obs_obs2525
  :parameters ()
  :precondition (and (observed_obs2524) (future_obs2525) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs2525) (not (future_obs2525))))
 (:action advance-to-obs_obs2526
  :parameters ()
  :precondition (and (observed_obs2525) (not_line-iso-trip-in-progress_line_x3_x4_obs2525) (not_line-iso-trip-in-progress_line_x7_x8_obs2525) (future_obs2526) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs2526) (not (future_obs2526))))
 (:action advance-to-obs_obs2527
  :parameters ()
  :precondition (and (observed_obs2526) (future_obs2527) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs2527) (not (future_obs2527))))
 (:action advance-to-obs_obs2528
  :parameters ()
  :precondition (and (not_line-iso-trip-in-progress_line_x19_x20_obs2526) (observed_obs2527) (future_obs2528) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs2528) (not (future_obs2528))))
 (:action advance-to-obs_obs2529
  :parameters ()
  :precondition (and (observed_obs2528) (future_obs2529) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs2529) (not (future_obs2529))))
 (:action advance-to-obs_obs2530
  :parameters ()
  :precondition (and (observed_obs2529) (future_obs2530) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs2530) (not (future_obs2530))))
 (:action advance-to-obs_obs2531
  :parameters ()
  :precondition (and (observed_obs2529) (future_obs2531) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs2531) (not (future_obs2531))))
 (:action advance-to-obs_obs2532
  :parameters ()
  :precondition (and (observed_obs2530) (observed_obs2531) (future_obs2532) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs2532) (not (future_obs2532))))
 (:action advance-to-obs_obs2533
  :parameters ()
  :precondition (and (observed_obs2530) (observed_obs2531) (future_obs2533) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs2533) (not (future_obs2533))))
 (:action advance-to-obs_obs2534
  :parameters ()
  :precondition (and (observed_obs2533) (observed_obs2532) (future_obs2534) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs2534) (not (future_obs2534))))
 (:action advance-to-obs_obs2535
  :parameters ()
  :precondition (and (observed_obs2534) (future_obs2535) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs2535) (not (line-iso-state-may-have-changed_line_x3_x4_obs2525)) (not (line-iso-state-may-have-changed_line_x7_x8_obs2525)) (not (line-iso-state-changed_line_x3_x4_obs2525)) (not (line-iso-state-changed_line_x7_x8_obs2525)) (not (future_obs2535))))
 (:action advance-to-obs_obs2536
  :parameters ()
  :precondition (and (observed_obs2535) (not_line-iso-trip-in-progress_line_x24_x25_obs2535) (future_obs2536) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs2536) (not (line-iso-state-may-have-changed_line_x19_x20_obs2526)) (not (line-iso-state-changed_line_x19_x20_obs2526)) (not (future_obs2536))))
 (:action advance-to-obs_obs2537
  :parameters ()
  :precondition (and (observed_obs2535) (not_line-iso-trip-in-progress_line_x24_x25_obs2535) (future_obs2537) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs2537) (not (line-iso-state-may-have-changed_line_x19_x20_obs2526)) (not (line-iso-state-changed_line_x19_x20_obs2526)) (not (future_obs2537))))
 (:action advance-to-obs_obs2538
  :parameters ()
  :precondition (and (observed_obs2537) (observed_obs2536) (future_obs2538) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs2538) (not (future_obs2538))))
 (:action advance-to-obs_obs2539
  :parameters ()
  :precondition (and (observed_obs2537) (observed_obs2536) (future_obs2539) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs2539) (not (future_obs2539))))
 (:action advance-to-obs_obs2540
  :parameters ()
  :precondition (and (observed_obs2538) (observed_obs2539) (future_obs2540) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs2540) (not (future_obs2540))))
 (:action advance-to-obs_obs2541
  :parameters ()
  :precondition (and (observed_obs2538) (observed_obs2539) (future_obs2541) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs2541) (not (future_obs2541))))
 (:action advance-to-obs_obs2542
  :parameters ()
  :precondition (and (observed_obs2538) (observed_obs2539) (future_obs2542) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs2542) (not (future_obs2542))))
 (:action advance-to-obs_obs2543
  :parameters ()
  :precondition (and (observed_obs2538) (observed_obs2539) (future_obs2543) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs2543) (not (future_obs2543))))
 (:action set_goal_1_constraint0
  :parameters ()
  :precondition (and (observed_obs2538) (observed_obs2525) (observed_obs2534) (observed_obs2535) (dominates-2_hyp3_count-as-fault_breaker_x13_x14) (observed_obs2526) (observed_obs2537) (observed_obs2539) (observed_obs2536) (observed_obs2524) (observed_obs2529) (observed_obs2530) (observed_obs2540) (observed_obs2531) (observed_obs2527) (observed_obs2528) (observed_obs2542) (observed_obs2541) (observed_obs2533) (observed_obs2543) (observed_obs2532) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (achieved_constraint0) (not (not_at_end_constraint0))))
 (:action set_goal_6_constraint0
  :parameters ()
  :precondition (and (observed_obs2538) (observed_obs2525) (observed_obs2534) (observed_obs2535) (observed_obs2526) (observed_obs2537) (observed_obs2539) (observed_obs2536) (observed_obs2524) (observed_obs2529) (observed_obs2530) (observed_obs2540) (dominates-2_hyp3_count-as-fault_line_x19_x20) (observed_obs2531) (observed_obs2527) (observed_obs2528) (observed_obs2542) (observed_obs2541) (observed_obs2533) (observed_obs2543) (observed_obs2532) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (achieved_constraint0) (not (not_at_end_constraint0))))
 (:action set_goal_7_constraint0
  :parameters ()
  :precondition (and (observed_obs2538) (observed_obs2525) (observed_obs2534) (observed_obs2535) (observed_obs2526) (observed_obs2537) (observed_obs2539) (observed_obs2536) (observed_obs2524) (observed_obs2529) (observed_obs2530) (observed_obs2540) (observed_obs2531) (observed_obs2527) (observed_obs2528) (dominates-2_hyp3_count-as-fault_generator_x23_1) (observed_obs2542) (observed_obs2541) (observed_obs2533) (observed_obs2543) (observed_obs2532) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (achieved_constraint0) (not (not_at_end_constraint0))))
 (:action set_goal_8_constraint0
  :parameters ()
  :precondition (and (observed_obs2538) (observed_obs2525) (observed_obs2534) (observed_obs2535) (observed_obs2526) (observed_obs2537) (observed_obs2539) (observed_obs2536) (observed_obs2524) (observed_obs2529) (observed_obs2530) (observed_obs2540) (observed_obs2531) (observed_obs2527) (observed_obs2528) (dominates-2_hyp3_count-as-fault_generator_x2_1) (observed_obs2542) (observed_obs2541) (observed_obs2533) (observed_obs2543) (observed_obs2532) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (achieved_constraint0) (not (not_at_end_constraint0))))
 (:action set_goal_5_constraint1
  :parameters ()
  :precondition (and (observed_obs2538) (observed_obs2525) (observed_obs2534) (observed_obs2535) (observed_obs2526) (observed_obs2537) (observed_obs2539) (observed_obs2536) (observed_obs2524) (observed_obs2529) (observed_obs2530) (observed_obs2540) (dominates-2_hyp2_count-as-fault_line_x19_x20) (observed_obs2531) (observed_obs2527) (observed_obs2528) (observed_obs2542) (observed_obs2541) (observed_obs2533) (observed_obs2543) (observed_obs2532) (achieved_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (achieved_constraint1) (not (not_at_end_constraint1))))
 (:action set_goal_6_constraint1
  :parameters ()
  :precondition (and (observed_obs2538) (observed_obs2525) (observed_obs2534) (observed_obs2535) (observed_obs2526) (observed_obs2537) (observed_obs2539) (observed_obs2536) (observed_obs2524) (observed_obs2529) (observed_obs2530) (observed_obs2540) (dominates-2_hyp2_count-as-fault_line_x24_x25) (observed_obs2531) (observed_obs2527) (observed_obs2528) (observed_obs2542) (observed_obs2541) (observed_obs2533) (observed_obs2543) (observed_obs2532) (achieved_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (achieved_constraint1) (not (not_at_end_constraint1))))
 (:action set_goal_7_constraint1
  :parameters ()
  :precondition (and (observed_obs2538) (observed_obs2525) (observed_obs2534) (observed_obs2535) (observed_obs2526) (observed_obs2537) (observed_obs2539) (observed_obs2536) (observed_obs2524) (observed_obs2529) (observed_obs2530) (observed_obs2540) (observed_obs2531) (observed_obs2527) (observed_obs2528) (dominates-2_hyp2_count-as-fault_generator_x23_1) (observed_obs2542) (observed_obs2541) (observed_obs2533) (observed_obs2543) (observed_obs2532) (achieved_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (achieved_constraint1) (not (not_at_end_constraint1))))
 (:action set_goal_8_constraint1
  :parameters ()
  :precondition (and (observed_obs2538) (observed_obs2525) (observed_obs2534) (observed_obs2535) (observed_obs2526) (observed_obs2537) (observed_obs2539) (observed_obs2536) (observed_obs2524) (observed_obs2529) (observed_obs2530) (observed_obs2540) (observed_obs2531) (observed_obs2527) (observed_obs2528) (dominates-2_hyp2_count-as-fault_generator_x2_1) (observed_obs2542) (observed_obs2541) (observed_obs2533) (observed_obs2543) (observed_obs2532) (achieved_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (achieved_constraint1) (not (not_at_end_constraint1))))
 (:action set_goal_1_constraint2
  :parameters ()
  :precondition (and (observed_obs2538) (observed_obs2525) (observed_obs2534) (observed_obs2535) (observed_obs2526) (dominates-2_hyp1_count-as-fault_breaker_x17_x18) (observed_obs2537) (observed_obs2539) (observed_obs2536) (observed_obs2524) (observed_obs2529) (observed_obs2530) (observed_obs2540) (observed_obs2531) (observed_obs2527) (observed_obs2528) (observed_obs2542) (observed_obs2541) (observed_obs2533) (observed_obs2543) (observed_obs2532) (achieved_constraint0) (achieved_constraint1) (not_at_end_constraint2))
  :effect (and (achieved_constraint2) (not (not_at_end_constraint2))))
 (:action set_goal_6_constraint2
  :parameters ()
  :precondition (and (observed_obs2538) (observed_obs2525) (observed_obs2534) (observed_obs2535) (observed_obs2526) (observed_obs2537) (observed_obs2539) (observed_obs2536) (observed_obs2524) (observed_obs2529) (observed_obs2530) (observed_obs2540) (dominates-2_hyp1_count-as-fault_line_x24_x25) (observed_obs2531) (observed_obs2527) (observed_obs2528) (observed_obs2542) (observed_obs2541) (observed_obs2533) (observed_obs2543) (observed_obs2532) (achieved_constraint0) (achieved_constraint1) (not_at_end_constraint2))
  :effect (and (achieved_constraint2) (not (not_at_end_constraint2))))
 (:action set_goal_7_constraint2
  :parameters ()
  :precondition (and (observed_obs2538) (observed_obs2525) (observed_obs2534) (observed_obs2535) (observed_obs2526) (observed_obs2537) (observed_obs2539) (observed_obs2536) (observed_obs2524) (observed_obs2529) (observed_obs2530) (observed_obs2540) (observed_obs2531) (observed_obs2527) (observed_obs2528) (dominates-2_hyp1_count-as-fault_generator_x23_1) (observed_obs2542) (observed_obs2541) (observed_obs2533) (observed_obs2543) (observed_obs2532) (achieved_constraint0) (achieved_constraint1) (not_at_end_constraint2))
  :effect (and (achieved_constraint2) (not (not_at_end_constraint2))))
 (:action set_goal_8_constraint2
  :parameters ()
  :precondition (and (observed_obs2538) (observed_obs2525) (observed_obs2534) (observed_obs2535) (observed_obs2526) (observed_obs2537) (observed_obs2539) (observed_obs2536) (observed_obs2524) (observed_obs2529) (observed_obs2530) (observed_obs2540) (observed_obs2531) (observed_obs2527) (observed_obs2528) (dominates-2_hyp1_count-as-fault_generator_x2_1) (observed_obs2542) (observed_obs2541) (observed_obs2533) (observed_obs2543) (observed_obs2532) (achieved_constraint0) (achieved_constraint1) (not_at_end_constraint2))
  :effect (and (achieved_constraint2) (not (not_at_end_constraint2))))
)
