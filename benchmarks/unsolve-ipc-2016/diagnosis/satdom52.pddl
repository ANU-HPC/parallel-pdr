(define (domain appn-pls)
 (:requirements :strips :equality)
 (:predicates (breaker-state-is-unknown_breaker_x3_x4) (breaker-state-is-unknown_breaker_x5_x6) (breaker-state-is-open_breaker_x5_x6) (breaker-state-is-unknown_breaker_x9_x10) (breaker-state-is-open_breaker_x9_x10) (breaker-state-is-unknown_breaker_x11_x12) (breaker-state-is-unknown_breaker_x17_x18) (breaker-state-is-open_breaker_x17_x18) (breaker-state-is-unknown_breaker_x19_x20) (breaker-state-is-unknown_breaker_x21_x22) (breaker-state-is-unknown_breaker_x23_x24) (breaker-state-is-open_breaker_x23_x24) (breaker-state-is-unknown_breaker_x31_x32) (breaker-state-is-open_breaker_x31_x32) (breaker-state-is-unknown_breaker_x33_x34) (breaker-state-is-open_breaker_x33_x34) (breaker-state-is-unknown_breaker_x35_x36) (breaker-state-is-open_breaker_x35_x36) (breaker-state-is-unknown_breaker_x37_x38) (breaker-state-is-open_breaker_x37_x38) (breaker-state-is-unknown_breaker_x39_x40) (breaker-state-is-open_breaker_x39_x40) (breaker-state-is-unknown_breaker_x41_x42) (breaker-state-is-open_breaker_x41_x42) (breaker-state-is-closed_breaker_x3_x4) (breaker-state-is-closed_breaker_x5_x6) (breaker-state-is-closed_breaker_x9_x10) (breaker-state-is-closed_breaker_x11_x12) (breaker-state-is-closed_breaker_x17_x18) (breaker-state-is-closed_breaker_x19_x20) (breaker-state-is-closed_breaker_x21_x22) (breaker-state-is-closed_breaker_x23_x24) (breaker-state-is-closed_breaker_x31_x32) (breaker-state-is-closed_breaker_x33_x34) (breaker-state-is-closed_breaker_x35_x36) (breaker-state-is-closed_breaker_x37_x38) (breaker-state-is-closed_breaker_x39_x40) (breaker-state-is-closed_breaker_x41_x42) (breaker-ar-status-is-unknown_breaker_x3_x4) (breaker-ar-status-is-auto_breaker_x3_x4) (breaker-ar-status-is-unknown_breaker_x5_x6) (breaker-ar-status-is-auto_breaker_x5_x6) (breaker-ar-status-is-unknown_breaker_x9_x10) (breaker-ar-status-is-auto_breaker_x9_x10) (breaker-ar-status-is-unknown_breaker_x11_x12) (breaker-ar-status-is-auto_breaker_x11_x12) (breaker-ar-status-is-unknown_breaker_x17_x18) (breaker-ar-status-is-auto_breaker_x17_x18) (breaker-ar-status-is-unknown_breaker_x19_x20) (breaker-ar-status-is-auto_breaker_x19_x20) (breaker-ar-status-is-unknown_breaker_x21_x22) (breaker-ar-status-is-auto_breaker_x21_x22) (breaker-ar-status-is-unknown_breaker_x23_x24) (breaker-ar-status-is-auto_breaker_x23_x24) (breaker-ar-status-is-non-auto_breaker_x5_x6) (breaker-ar-status-is-non-auto_breaker_x9_x10) (breaker-ar-status-is-non-auto_breaker_x17_x18) (breaker-ar-status-is-non-auto_breaker_x23_x24) (pending_obs998) (fault-count-2_count-as-fault_breaker_x3_x4_n0) (observed_obs998) (fault-count-2_count-as-fault_breaker_x3_x4_n1) (dominates-2_hyp7_count-as-fault_breaker_x3_x4) (dominates-2_hyp6_count-as-fault_breaker_x3_x4) (dominates-2_hyp5_count-as-fault_breaker_x3_x4) (dominates-2_hyp4_count-as-fault_breaker_x3_x4) (dominates-2_hyp3_count-as-fault_breaker_x3_x4) (dominates-2_hyp2_count-as-fault_breaker_x3_x4) (dominates-2_hyp1_count-as-fault_breaker_x3_x4) (pending_obs1004) (fault-count-2_count-as-fault_breaker_x5_x6_n0) (observed_obs1004) (fault-count-2_count-as-fault_breaker_x5_x6_n1) (line-iso-state-may-have-changed_line_x29_x30_obs1004) (dominates-2_hyp6_count-as-fault_breaker_x5_x6) (dominates-2_hyp4_count-as-fault_breaker_x5_x6) (dominates-2_hyp3_count-as-fault_breaker_x5_x6) (dominates-2_hyp2_count-as-fault_breaker_x5_x6) (pending_obs1000) (fault-count-2_count-as-fault_breaker_x9_x10_n0) (observed_obs1000) (fault-count-2_count-as-fault_breaker_x9_x10_n1) (line-iso-state-may-have-changed_line_x7_x8_obs1000) (dominates-2_hyp7_count-as-fault_breaker_x9_x10) (dominates-2_hyp6_count-as-fault_breaker_x9_x10) (dominates-2_hyp5_count-as-fault_breaker_x9_x10) (dominates-2_hyp4_count-as-fault_breaker_x9_x10) (pending_obs999) (fault-count-2_count-as-fault_breaker_x11_x12_n0) (observed_obs999) (fault-count-2_count-as-fault_breaker_x11_x12_n1) (pending_obs1006) (fault-count-2_count-as-fault_breaker_x17_x18_n0) (observed_obs1006) (fault-count-2_count-as-fault_breaker_x17_x18_n1) (line-iso-state-may-have-changed_line_x15_x16_obs1006) (dominates-2_hyp7_count-as-fault_breaker_x17_x18) (dominates-2_hyp6_count-as-fault_breaker_x17_x18) (dominates-2_hyp3_count-as-fault_breaker_x17_x18) (pending_obs1017) (fault-count-2_count-as-fault_breaker_x19_x20_n0) (observed_obs1017) (fault-count-2_count-as-fault_breaker_x19_x20_n1) (dominates-2_hyp7_count-as-fault_breaker_x19_x20) (dominates-2_hyp6_count-as-fault_breaker_x19_x20) (dominates-2_hyp5_count-as-fault_breaker_x19_x20) (dominates-2_hyp4_count-as-fault_breaker_x19_x20) (dominates-2_hyp3_count-as-fault_breaker_x19_x20) (dominates-2_hyp2_count-as-fault_breaker_x19_x20) (dominates-2_hyp1_count-as-fault_breaker_x19_x20) (pending_obs1007) (fault-count-2_count-as-fault_breaker_x21_x22_n0) (observed_obs1007) (fault-count-2_count-as-fault_breaker_x21_x22_n1) (dominates-2_hyp7_count-as-fault_breaker_x21_x22) (dominates-2_hyp6_count-as-fault_breaker_x21_x22) (dominates-2_hyp5_count-as-fault_breaker_x21_x22) (dominates-2_hyp4_count-as-fault_breaker_x21_x22) (dominates-2_hyp3_count-as-fault_breaker_x21_x22) (dominates-2_hyp2_count-as-fault_breaker_x21_x22) (dominates-2_hyp1_count-as-fault_breaker_x21_x22) (pending_obs1001) (fault-count-2_count-as-fault_breaker_x23_x24_n0) (observed_obs1001) (fault-count-2_count-as-fault_breaker_x23_x24_n1) (line-iso-state-may-have-changed_line_x7_x8_obs1001) (dominates-2_hyp7_count-as-fault_breaker_x23_x24) (dominates-2_hyp6_count-as-fault_breaker_x23_x24) (dominates-2_hyp5_count-as-fault_breaker_x23_x24) (dominates-2_hyp4_count-as-fault_breaker_x23_x24) (pending_obs1008) (fault-count-2_count-as-fault_bus_x10_n0) (observed_obs1008) (fault-count-2_count-as-fault_bus_x10_n1) (dominates-2_hyp7_count-as-fault_bus_x10) (dominates-2_hyp6_count-as-fault_bus_x10) (dominates-2_hyp5_count-as-fault_bus_x10) (dominates-2_hyp4_count-as-fault_bus_x10) (dominates-2_hyp3_count-as-fault_bus_x10) (dominates-2_hyp2_count-as-fault_bus_x10) (dominates-2_hyp1_count-as-fault_bus_x10) (pending_obs1010) (fault-count-2_count-as-fault_bus_x27_n0) (observed_obs1010) (fault-count-2_count-as-fault_bus_x27_n1) (dominates-2_hyp7_count-as-fault_bus_x27) (dominates-2_hyp6_count-as-fault_bus_x27) (dominates-2_hyp5_count-as-fault_bus_x27) (dominates-2_hyp4_count-as-fault_bus_x27) (dominates-2_hyp3_count-as-fault_bus_x27) (dominates-2_hyp2_count-as-fault_bus_x27) (dominates-2_hyp1_count-as-fault_bus_x27) (pending_obs1003) (fault-count-2_count-as-fault_bus_x28_n0) (observed_obs1003) (fault-count-2_count-as-fault_bus_x28_n1) (dominates-2_hyp7_count-as-fault_bus_x28) (dominates-2_hyp6_count-as-fault_bus_x28) (dominates-2_hyp5_count-as-fault_bus_x28) (dominates-2_hyp4_count-as-fault_bus_x28) (dominates-2_hyp3_count-as-fault_bus_x28) (dominates-2_hyp2_count-as-fault_bus_x28) (dominates-2_hyp1_count-as-fault_bus_x28) (pending_obs1015) (fault-count-2_count-as-fault_bus_x25_n0) (observed_obs1015) (fault-count-2_count-as-fault_bus_x25_n1) (dominates-2_hyp7_count-as-fault_bus_x25) (dominates-2_hyp6_count-as-fault_bus_x25) (dominates-2_hyp5_count-as-fault_bus_x25) (dominates-2_hyp4_count-as-fault_bus_x25) (dominates-2_hyp3_count-as-fault_bus_x25) (dominates-2_hyp2_count-as-fault_bus_x25) (dominates-2_hyp1_count-as-fault_bus_x25) (pending_obs1009) (fault-count-2_count-as-fault_bus_x26_n0) (observed_obs1009) (fault-count-2_count-as-fault_bus_x26_n1) (dominates-2_hyp7_count-as-fault_bus_x26) (dominates-2_hyp6_count-as-fault_bus_x26) (dominates-2_hyp5_count-as-fault_bus_x26) (dominates-2_hyp4_count-as-fault_bus_x26) (dominates-2_hyp3_count-as-fault_bus_x26) (dominates-2_hyp2_count-as-fault_bus_x26) (dominates-2_hyp1_count-as-fault_bus_x26) (fault-count-2_count-as-fault_line_x7_x8_n0) (not_line-isolated_line_x7_x8) (line-iso-trip-in-progress_line_x7_x8_obs1000) (not_line-iso-trip-in-progress_line_x7_x8_obs1000) (fault-count-2_count-as-fault_line_x7_x8_n1) (dominates-2_hyp3_count-as-fault_line_x7_x8) (dominates-2_hyp2_count-as-fault_line_x7_x8) (dominates-2_hyp1_count-as-fault_line_x7_x8) (line-iso-trip-in-progress_line_x7_x8_obs1001) (not_line-iso-trip-in-progress_line_x7_x8_obs1001) (fault-count-2_count-as-fault_line_x15_x16_n0) (not_line-isolated_line_x15_x16) (line-iso-trip-in-progress_line_x15_x16_obs1006) (not_line-iso-trip-in-progress_line_x15_x16_obs1006) (fault-count-2_count-as-fault_line_x15_x16_n1) (dominates-2_hyp5_count-as-fault_line_x15_x16) (dominates-2_hyp4_count-as-fault_line_x15_x16) (dominates-2_hyp2_count-as-fault_line_x15_x16) (dominates-2_hyp1_count-as-fault_line_x15_x16) (fault-count-2_count-as-fault_line_x29_x30_n0) (not_line-isolated_line_x29_x30) (line-iso-trip-in-progress_line_x29_x30_obs1004) (not_line-iso-trip-in-progress_line_x29_x30_obs1004) (fault-count-2_count-as-fault_line_x29_x30_n1) (dominates-2_hyp7_count-as-fault_line_x29_x30) (dominates-2_hyp5_count-as-fault_line_x29_x30) (dominates-2_hyp1_count-as-fault_line_x29_x30) (line-isolated_line_x7_x8) (line-iso-state-changed_line_x7_x8_obs1000) (line-iso-state-changed_line_x7_x8_obs1001) (line-isolated_line_x29_x30) (line-isolated_line_x15_x16) (line-iso-state-changed_line_x15_x16_obs1006) (pending_obs1005) (observed_obs1005) (pending_obs1016) (fault-count-2_count-as-fault_line_x1_x2_n0) (observed_obs1016) (fault-count-2_count-as-fault_line_x1_x2_n1) (dominates-2_hyp7_count-as-fault_line_x1_x2) (dominates-2_hyp6_count-as-fault_line_x1_x2) (dominates-2_hyp5_count-as-fault_line_x1_x2) (dominates-2_hyp4_count-as-fault_line_x1_x2) (dominates-2_hyp3_count-as-fault_line_x1_x2) (dominates-2_hyp2_count-as-fault_line_x1_x2) (dominates-2_hyp1_count-as-fault_line_x1_x2) (pending_obs1014) (fault-count-2_count-as-fault_line_x13_x14_n0) (observed_obs1014) (fault-count-2_count-as-fault_line_x13_x14_n1) (dominates-2_hyp7_count-as-fault_line_x13_x14) (dominates-2_hyp6_count-as-fault_line_x13_x14) (dominates-2_hyp5_count-as-fault_line_x13_x14) (dominates-2_hyp4_count-as-fault_line_x13_x14) (dominates-2_hyp3_count-as-fault_line_x13_x14) (dominates-2_hyp2_count-as-fault_line_x13_x14) (dominates-2_hyp1_count-as-fault_line_x13_x14) (pending_obs1013) (observed_obs1013) (generator-status-is-unknown_generator_x11_1) (generator-status-is-on_generator_x11_1) (generator-status-is-off_generator_x11_1) (fault-count-2_count-as-fault_generator_x11_1_n0) (generator-status-is-shutting-down_generator_x11_1) (fault-count-2_count-as-fault_generator_x11_1_n1) (dominates-2_hyp7_count-as-fault_generator_x11_1) (dominates-2_hyp6_count-as-fault_generator_x11_1) (dominates-2_hyp5_count-as-fault_generator_x11_1) (dominates-2_hyp4_count-as-fault_generator_x11_1) (dominates-2_hyp3_count-as-fault_generator_x11_1) (dominates-2_hyp2_count-as-fault_generator_x11_1) (dominates-2_hyp1_count-as-fault_generator_x11_1) (pending_obs1002) (observed_obs1002) (pending_obs1012) (observed_obs1012) (generator-status-is-starting-up_generator_x11_1) (pending_obs1011) (observed_obs1011) (future_obs999) (future_obs1000) (future_obs1001) (future_obs1002) (future_obs1003) (future_obs1004) (future_obs1005) (future_obs1006) (future_obs1007) (future_obs1008) (future_obs1009) (future_obs1010) (future_obs1011) (future_obs1012) (future_obs1013) (future_obs1014) (future_obs1015) (future_obs1016) (future_obs1017) (not_at_end_constraint0) (achieved_constraint0) (not_at_end_constraint1) (achieved_constraint1) (not_at_end_constraint2) (achieved_constraint2) (not_at_end_constraint3) (achieved_constraint3) (not_at_end_constraint4) (achieved_constraint4) (not_at_end_constraint5) (achieved_constraint5) (not_at_end_constraint6) (achieved_constraint6) (static-true))
 (:action breaker-init-state-was-open_breaker_x5_x6
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x5_x6) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-state-is-open_breaker_x5_x6) (not (breaker-state-is-unknown_breaker_x5_x6))))
 (:action breaker-init-state-was-open_breaker_x9_x10
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x9_x10) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-state-is-open_breaker_x9_x10) (not (breaker-state-is-unknown_breaker_x9_x10))))
 (:action breaker-init-state-was-open_breaker_x17_x18
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x17_x18) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-state-is-open_breaker_x17_x18) (not (breaker-state-is-unknown_breaker_x17_x18))))
 (:action breaker-init-state-was-open_breaker_x23_x24
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x23_x24) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-state-is-open_breaker_x23_x24) (not (breaker-state-is-unknown_breaker_x23_x24))))
 (:action breaker-init-state-was-open_breaker_x31_x32
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x31_x32) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-state-is-open_breaker_x31_x32) (not (breaker-state-is-unknown_breaker_x31_x32))))
 (:action breaker-init-state-was-open_breaker_x33_x34
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x33_x34) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-state-is-open_breaker_x33_x34) (not (breaker-state-is-unknown_breaker_x33_x34))))
 (:action breaker-init-state-was-open_breaker_x35_x36
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x35_x36) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-state-is-open_breaker_x35_x36) (not (breaker-state-is-unknown_breaker_x35_x36))))
 (:action breaker-init-state-was-open_breaker_x37_x38
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x37_x38) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-state-is-open_breaker_x37_x38) (not (breaker-state-is-unknown_breaker_x37_x38))))
 (:action breaker-init-state-was-open_breaker_x39_x40
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x39_x40) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-state-is-open_breaker_x39_x40) (not (breaker-state-is-unknown_breaker_x39_x40))))
 (:action breaker-init-state-was-open_breaker_x41_x42
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x41_x42) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-state-is-open_breaker_x41_x42) (not (breaker-state-is-unknown_breaker_x41_x42))))
 (:action breaker-init-state-was-closed_breaker_x3_x4
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x3_x4) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-state-is-closed_breaker_x3_x4) (not (breaker-state-is-unknown_breaker_x3_x4))))
 (:action breaker-init-state-was-closed_breaker_x5_x6
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x5_x6) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-state-is-closed_breaker_x5_x6) (not (breaker-state-is-unknown_breaker_x5_x6))))
 (:action breaker-init-state-was-closed_breaker_x9_x10
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x9_x10) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-state-is-closed_breaker_x9_x10) (not (breaker-state-is-unknown_breaker_x9_x10))))
 (:action breaker-init-state-was-closed_breaker_x11_x12
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x11_x12) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-state-is-closed_breaker_x11_x12) (not (breaker-state-is-unknown_breaker_x11_x12))))
 (:action breaker-init-state-was-closed_breaker_x17_x18
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x17_x18) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-state-is-closed_breaker_x17_x18) (not (breaker-state-is-unknown_breaker_x17_x18))))
 (:action breaker-init-state-was-closed_breaker_x19_x20
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x19_x20) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-state-is-closed_breaker_x19_x20) (not (breaker-state-is-unknown_breaker_x19_x20))))
 (:action breaker-init-state-was-closed_breaker_x21_x22
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x21_x22) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-state-is-closed_breaker_x21_x22) (not (breaker-state-is-unknown_breaker_x21_x22))))
 (:action breaker-init-state-was-closed_breaker_x23_x24
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x23_x24) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-state-is-closed_breaker_x23_x24) (not (breaker-state-is-unknown_breaker_x23_x24))))
 (:action breaker-init-state-was-closed_breaker_x31_x32
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x31_x32) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-state-is-closed_breaker_x31_x32) (not (breaker-state-is-unknown_breaker_x31_x32))))
 (:action breaker-init-state-was-closed_breaker_x33_x34
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x33_x34) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-state-is-closed_breaker_x33_x34) (not (breaker-state-is-unknown_breaker_x33_x34))))
 (:action breaker-init-state-was-closed_breaker_x35_x36
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x35_x36) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-state-is-closed_breaker_x35_x36) (not (breaker-state-is-unknown_breaker_x35_x36))))
 (:action breaker-init-state-was-closed_breaker_x37_x38
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x37_x38) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-state-is-closed_breaker_x37_x38) (not (breaker-state-is-unknown_breaker_x37_x38))))
 (:action breaker-init-state-was-closed_breaker_x39_x40
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x39_x40) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-state-is-closed_breaker_x39_x40) (not (breaker-state-is-unknown_breaker_x39_x40))))
 (:action breaker-init-state-was-closed_breaker_x41_x42
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x41_x42) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-state-is-closed_breaker_x41_x42) (not (breaker-state-is-unknown_breaker_x41_x42))))
 (:action breaker-init-ar-status-was-auto_breaker_x3_x4
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x3_x4) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-ar-status-is-auto_breaker_x3_x4) (not (breaker-ar-status-is-unknown_breaker_x3_x4))))
 (:action breaker-init-ar-status-was-auto_breaker_x5_x6
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x5_x6) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-ar-status-is-auto_breaker_x5_x6) (not (breaker-ar-status-is-unknown_breaker_x5_x6))))
 (:action breaker-init-ar-status-was-auto_breaker_x9_x10
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x9_x10) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-ar-status-is-auto_breaker_x9_x10) (not (breaker-ar-status-is-unknown_breaker_x9_x10))))
 (:action breaker-init-ar-status-was-auto_breaker_x11_x12
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x11_x12) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-ar-status-is-auto_breaker_x11_x12) (not (breaker-ar-status-is-unknown_breaker_x11_x12))))
 (:action breaker-init-ar-status-was-auto_breaker_x17_x18
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x17_x18) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-ar-status-is-auto_breaker_x17_x18) (not (breaker-ar-status-is-unknown_breaker_x17_x18))))
 (:action breaker-init-ar-status-was-auto_breaker_x19_x20
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x19_x20) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-ar-status-is-auto_breaker_x19_x20) (not (breaker-ar-status-is-unknown_breaker_x19_x20))))
 (:action breaker-init-ar-status-was-auto_breaker_x21_x22
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x21_x22) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-ar-status-is-auto_breaker_x21_x22) (not (breaker-ar-status-is-unknown_breaker_x21_x22))))
 (:action breaker-init-ar-status-was-auto_breaker_x23_x24
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x23_x24) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-ar-status-is-auto_breaker_x23_x24) (not (breaker-ar-status-is-unknown_breaker_x23_x24))))
 (:action breaker-init-ar-status-was-non-auto_breaker_x5_x6
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x5_x6) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-ar-status-is-non-auto_breaker_x5_x6) (not (breaker-ar-status-is-unknown_breaker_x5_x6))))
 (:action breaker-init-ar-status-was-non-auto_breaker_x9_x10
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x9_x10) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-ar-status-is-non-auto_breaker_x9_x10) (not (breaker-ar-status-is-unknown_breaker_x9_x10))))
 (:action breaker-init-ar-status-was-non-auto_breaker_x17_x18
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x17_x18) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-ar-status-is-non-auto_breaker_x17_x18) (not (breaker-ar-status-is-unknown_breaker_x17_x18))))
 (:action breaker-init-ar-status-was-non-auto_breaker_x23_x24
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x23_x24) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-ar-status-is-non-auto_breaker_x23_x24) (not (breaker-ar-status-is-unknown_breaker_x23_x24))))
 (:action breaker-open-unexplained_breaker_x3_x4_obs998_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x3_x4) (pending_obs998) (fault-count-2_count-as-fault_breaker_x3_x4_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (observed_obs998) (fault-count-2_count-as-fault_breaker_x3_x4_n1) (not (breaker-state-is-closed_breaker_x3_x4)) (not (pending_obs998)) (not (fault-count-2_count-as-fault_breaker_x3_x4_n0)) (not (dominates-2_hyp7_count-as-fault_breaker_x3_x4)) (not (dominates-2_hyp6_count-as-fault_breaker_x3_x4)) (not (dominates-2_hyp5_count-as-fault_breaker_x3_x4)) (not (dominates-2_hyp4_count-as-fault_breaker_x3_x4)) (not (dominates-2_hyp3_count-as-fault_breaker_x3_x4)) (not (dominates-2_hyp2_count-as-fault_breaker_x3_x4)) (not (dominates-2_hyp1_count-as-fault_breaker_x3_x4))))
 (:action breaker-open-unexplained_breaker_x5_x6_obs1004_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x5_x6) (pending_obs1004) (fault-count-2_count-as-fault_breaker_x5_x6_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-state-is-open_breaker_x5_x6) (observed_obs1004) (fault-count-2_count-as-fault_breaker_x5_x6_n1) (line-iso-state-may-have-changed_line_x29_x30_obs1004) (not (breaker-state-is-closed_breaker_x5_x6)) (not (pending_obs1004)) (not (fault-count-2_count-as-fault_breaker_x5_x6_n0)) (not (dominates-2_hyp6_count-as-fault_breaker_x5_x6)) (not (dominates-2_hyp4_count-as-fault_breaker_x5_x6)) (not (dominates-2_hyp3_count-as-fault_breaker_x5_x6)) (not (dominates-2_hyp2_count-as-fault_breaker_x5_x6))))
 (:action breaker-open-unexplained_breaker_x9_x10_obs1000_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x9_x10) (pending_obs1000) (fault-count-2_count-as-fault_breaker_x9_x10_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-state-is-open_breaker_x9_x10) (observed_obs1000) (fault-count-2_count-as-fault_breaker_x9_x10_n1) (line-iso-state-may-have-changed_line_x7_x8_obs1000) (not (breaker-state-is-closed_breaker_x9_x10)) (not (pending_obs1000)) (not (fault-count-2_count-as-fault_breaker_x9_x10_n0)) (not (dominates-2_hyp7_count-as-fault_breaker_x9_x10)) (not (dominates-2_hyp6_count-as-fault_breaker_x9_x10)) (not (dominates-2_hyp5_count-as-fault_breaker_x9_x10)) (not (dominates-2_hyp4_count-as-fault_breaker_x9_x10))))
 (:action breaker-open-unexplained_breaker_x11_x12_obs999_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x11_x12) (pending_obs999) (fault-count-2_count-as-fault_breaker_x11_x12_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (observed_obs999) (fault-count-2_count-as-fault_breaker_x11_x12_n1) (not (breaker-state-is-closed_breaker_x11_x12)) (not (pending_obs999)) (not (fault-count-2_count-as-fault_breaker_x11_x12_n0))))
 (:action breaker-open-unexplained_breaker_x17_x18_obs1006_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x17_x18) (pending_obs1006) (fault-count-2_count-as-fault_breaker_x17_x18_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-state-is-open_breaker_x17_x18) (observed_obs1006) (fault-count-2_count-as-fault_breaker_x17_x18_n1) (line-iso-state-may-have-changed_line_x15_x16_obs1006) (not (breaker-state-is-closed_breaker_x17_x18)) (not (pending_obs1006)) (not (fault-count-2_count-as-fault_breaker_x17_x18_n0)) (not (dominates-2_hyp7_count-as-fault_breaker_x17_x18)) (not (dominates-2_hyp6_count-as-fault_breaker_x17_x18)) (not (dominates-2_hyp3_count-as-fault_breaker_x17_x18))))
 (:action breaker-open-unexplained_breaker_x19_x20_obs1017_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x19_x20) (pending_obs1017) (fault-count-2_count-as-fault_breaker_x19_x20_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (observed_obs1017) (fault-count-2_count-as-fault_breaker_x19_x20_n1) (not (breaker-state-is-closed_breaker_x19_x20)) (not (pending_obs1017)) (not (fault-count-2_count-as-fault_breaker_x19_x20_n0)) (not (dominates-2_hyp7_count-as-fault_breaker_x19_x20)) (not (dominates-2_hyp6_count-as-fault_breaker_x19_x20)) (not (dominates-2_hyp5_count-as-fault_breaker_x19_x20)) (not (dominates-2_hyp4_count-as-fault_breaker_x19_x20)) (not (dominates-2_hyp3_count-as-fault_breaker_x19_x20)) (not (dominates-2_hyp2_count-as-fault_breaker_x19_x20)) (not (dominates-2_hyp1_count-as-fault_breaker_x19_x20))))
 (:action breaker-open-unexplained_breaker_x21_x22_obs1007_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x21_x22) (pending_obs1007) (fault-count-2_count-as-fault_breaker_x21_x22_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (observed_obs1007) (fault-count-2_count-as-fault_breaker_x21_x22_n1) (not (breaker-state-is-closed_breaker_x21_x22)) (not (pending_obs1007)) (not (fault-count-2_count-as-fault_breaker_x21_x22_n0)) (not (dominates-2_hyp7_count-as-fault_breaker_x21_x22)) (not (dominates-2_hyp6_count-as-fault_breaker_x21_x22)) (not (dominates-2_hyp5_count-as-fault_breaker_x21_x22)) (not (dominates-2_hyp4_count-as-fault_breaker_x21_x22)) (not (dominates-2_hyp3_count-as-fault_breaker_x21_x22)) (not (dominates-2_hyp2_count-as-fault_breaker_x21_x22)) (not (dominates-2_hyp1_count-as-fault_breaker_x21_x22))))
 (:action breaker-open-unexplained_breaker_x23_x24_obs1001_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x23_x24) (pending_obs1001) (fault-count-2_count-as-fault_breaker_x23_x24_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-state-is-open_breaker_x23_x24) (observed_obs1001) (fault-count-2_count-as-fault_breaker_x23_x24_n1) (line-iso-state-may-have-changed_line_x7_x8_obs1001) (not (breaker-state-is-closed_breaker_x23_x24)) (not (pending_obs1001)) (not (fault-count-2_count-as-fault_breaker_x23_x24_n0)) (not (dominates-2_hyp7_count-as-fault_breaker_x23_x24)) (not (dominates-2_hyp6_count-as-fault_breaker_x23_x24)) (not (dominates-2_hyp5_count-as-fault_breaker_x23_x24)) (not (dominates-2_hyp4_count-as-fault_breaker_x23_x24))))
 (:action breaker-trip-unexplained_breaker_x3_x4_obs998_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x3_x4) (breaker-ar-status-is-auto_breaker_x3_x4) (pending_obs998) (fault-count-2_count-as-fault_breaker_x3_x4_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (observed_obs998) (fault-count-2_count-as-fault_breaker_x3_x4_n1) (not (breaker-state-is-closed_breaker_x3_x4)) (not (pending_obs998)) (not (fault-count-2_count-as-fault_breaker_x3_x4_n0)) (not (dominates-2_hyp7_count-as-fault_breaker_x3_x4)) (not (dominates-2_hyp6_count-as-fault_breaker_x3_x4)) (not (dominates-2_hyp5_count-as-fault_breaker_x3_x4)) (not (dominates-2_hyp4_count-as-fault_breaker_x3_x4)) (not (dominates-2_hyp3_count-as-fault_breaker_x3_x4)) (not (dominates-2_hyp2_count-as-fault_breaker_x3_x4)) (not (dominates-2_hyp1_count-as-fault_breaker_x3_x4))))
 (:action breaker-trip-unexplained_breaker_x5_x6_obs1004_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x5_x6) (breaker-ar-status-is-auto_breaker_x5_x6) (pending_obs1004) (fault-count-2_count-as-fault_breaker_x5_x6_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-state-is-open_breaker_x5_x6) (observed_obs1004) (fault-count-2_count-as-fault_breaker_x5_x6_n1) (line-iso-state-may-have-changed_line_x29_x30_obs1004) (not (breaker-state-is-closed_breaker_x5_x6)) (not (pending_obs1004)) (not (fault-count-2_count-as-fault_breaker_x5_x6_n0)) (not (dominates-2_hyp6_count-as-fault_breaker_x5_x6)) (not (dominates-2_hyp4_count-as-fault_breaker_x5_x6)) (not (dominates-2_hyp3_count-as-fault_breaker_x5_x6)) (not (dominates-2_hyp2_count-as-fault_breaker_x5_x6))))
 (:action breaker-trip-unexplained_breaker_x9_x10_obs1000_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x9_x10) (breaker-ar-status-is-auto_breaker_x9_x10) (pending_obs1000) (fault-count-2_count-as-fault_breaker_x9_x10_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-state-is-open_breaker_x9_x10) (observed_obs1000) (fault-count-2_count-as-fault_breaker_x9_x10_n1) (line-iso-state-may-have-changed_line_x7_x8_obs1000) (not (breaker-state-is-closed_breaker_x9_x10)) (not (pending_obs1000)) (not (fault-count-2_count-as-fault_breaker_x9_x10_n0)) (not (dominates-2_hyp7_count-as-fault_breaker_x9_x10)) (not (dominates-2_hyp6_count-as-fault_breaker_x9_x10)) (not (dominates-2_hyp5_count-as-fault_breaker_x9_x10)) (not (dominates-2_hyp4_count-as-fault_breaker_x9_x10))))
 (:action breaker-trip-unexplained_breaker_x11_x12_obs999_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x11_x12) (breaker-ar-status-is-auto_breaker_x11_x12) (pending_obs999) (fault-count-2_count-as-fault_breaker_x11_x12_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (observed_obs999) (fault-count-2_count-as-fault_breaker_x11_x12_n1) (not (breaker-state-is-closed_breaker_x11_x12)) (not (pending_obs999)) (not (fault-count-2_count-as-fault_breaker_x11_x12_n0))))
 (:action breaker-trip-unexplained_breaker_x17_x18_obs1006_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x17_x18) (breaker-ar-status-is-auto_breaker_x17_x18) (pending_obs1006) (fault-count-2_count-as-fault_breaker_x17_x18_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-state-is-open_breaker_x17_x18) (observed_obs1006) (fault-count-2_count-as-fault_breaker_x17_x18_n1) (line-iso-state-may-have-changed_line_x15_x16_obs1006) (not (breaker-state-is-closed_breaker_x17_x18)) (not (pending_obs1006)) (not (fault-count-2_count-as-fault_breaker_x17_x18_n0)) (not (dominates-2_hyp7_count-as-fault_breaker_x17_x18)) (not (dominates-2_hyp6_count-as-fault_breaker_x17_x18)) (not (dominates-2_hyp3_count-as-fault_breaker_x17_x18))))
 (:action breaker-trip-unexplained_breaker_x19_x20_obs1017_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x19_x20) (breaker-ar-status-is-auto_breaker_x19_x20) (pending_obs1017) (fault-count-2_count-as-fault_breaker_x19_x20_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (observed_obs1017) (fault-count-2_count-as-fault_breaker_x19_x20_n1) (not (breaker-state-is-closed_breaker_x19_x20)) (not (pending_obs1017)) (not (fault-count-2_count-as-fault_breaker_x19_x20_n0)) (not (dominates-2_hyp7_count-as-fault_breaker_x19_x20)) (not (dominates-2_hyp6_count-as-fault_breaker_x19_x20)) (not (dominates-2_hyp5_count-as-fault_breaker_x19_x20)) (not (dominates-2_hyp4_count-as-fault_breaker_x19_x20)) (not (dominates-2_hyp3_count-as-fault_breaker_x19_x20)) (not (dominates-2_hyp2_count-as-fault_breaker_x19_x20)) (not (dominates-2_hyp1_count-as-fault_breaker_x19_x20))))
 (:action breaker-trip-unexplained_breaker_x21_x22_obs1007_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x21_x22) (breaker-ar-status-is-auto_breaker_x21_x22) (pending_obs1007) (fault-count-2_count-as-fault_breaker_x21_x22_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (observed_obs1007) (fault-count-2_count-as-fault_breaker_x21_x22_n1) (not (breaker-state-is-closed_breaker_x21_x22)) (not (pending_obs1007)) (not (fault-count-2_count-as-fault_breaker_x21_x22_n0)) (not (dominates-2_hyp7_count-as-fault_breaker_x21_x22)) (not (dominates-2_hyp6_count-as-fault_breaker_x21_x22)) (not (dominates-2_hyp5_count-as-fault_breaker_x21_x22)) (not (dominates-2_hyp4_count-as-fault_breaker_x21_x22)) (not (dominates-2_hyp3_count-as-fault_breaker_x21_x22)) (not (dominates-2_hyp2_count-as-fault_breaker_x21_x22)) (not (dominates-2_hyp1_count-as-fault_breaker_x21_x22))))
 (:action breaker-trip-unexplained_breaker_x23_x24_obs1001_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x23_x24) (breaker-ar-status-is-auto_breaker_x23_x24) (pending_obs1001) (fault-count-2_count-as-fault_breaker_x23_x24_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-state-is-open_breaker_x23_x24) (observed_obs1001) (fault-count-2_count-as-fault_breaker_x23_x24_n1) (line-iso-state-may-have-changed_line_x7_x8_obs1001) (not (breaker-state-is-closed_breaker_x23_x24)) (not (pending_obs1001)) (not (fault-count-2_count-as-fault_breaker_x23_x24_n0)) (not (dominates-2_hyp7_count-as-fault_breaker_x23_x24)) (not (dominates-2_hyp6_count-as-fault_breaker_x23_x24)) (not (dominates-2_hyp5_count-as-fault_breaker_x23_x24)) (not (dominates-2_hyp4_count-as-fault_breaker_x23_x24))))
 (:action bus-voltage-goes-low-unexplained_bus_x10_low_obs1008_n0_n1
  :parameters ()
  :precondition (and (pending_obs1008) (fault-count-2_count-as-fault_bus_x10_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (observed_obs1008) (fault-count-2_count-as-fault_bus_x10_n1) (not (pending_obs1008)) (not (fault-count-2_count-as-fault_bus_x10_n0)) (not (dominates-2_hyp7_count-as-fault_bus_x10)) (not (dominates-2_hyp6_count-as-fault_bus_x10)) (not (dominates-2_hyp5_count-as-fault_bus_x10)) (not (dominates-2_hyp4_count-as-fault_bus_x10)) (not (dominates-2_hyp3_count-as-fault_bus_x10)) (not (dominates-2_hyp2_count-as-fault_bus_x10)) (not (dominates-2_hyp1_count-as-fault_bus_x10))))
 (:action bus-voltage-goes-low-unexplained_bus_x27_low_obs1010_n0_n1
  :parameters ()
  :precondition (and (pending_obs1010) (fault-count-2_count-as-fault_bus_x27_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (observed_obs1010) (fault-count-2_count-as-fault_bus_x27_n1) (not (pending_obs1010)) (not (fault-count-2_count-as-fault_bus_x27_n0)) (not (dominates-2_hyp7_count-as-fault_bus_x27)) (not (dominates-2_hyp6_count-as-fault_bus_x27)) (not (dominates-2_hyp5_count-as-fault_bus_x27)) (not (dominates-2_hyp4_count-as-fault_bus_x27)) (not (dominates-2_hyp3_count-as-fault_bus_x27)) (not (dominates-2_hyp2_count-as-fault_bus_x27)) (not (dominates-2_hyp1_count-as-fault_bus_x27))))
 (:action bus-voltage-goes-low-unexplained_bus_x28_low_obs1003_n0_n1
  :parameters ()
  :precondition (and (pending_obs1003) (fault-count-2_count-as-fault_bus_x28_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (observed_obs1003) (fault-count-2_count-as-fault_bus_x28_n1) (not (pending_obs1003)) (not (fault-count-2_count-as-fault_bus_x28_n0)) (not (dominates-2_hyp7_count-as-fault_bus_x28)) (not (dominates-2_hyp6_count-as-fault_bus_x28)) (not (dominates-2_hyp5_count-as-fault_bus_x28)) (not (dominates-2_hyp4_count-as-fault_bus_x28)) (not (dominates-2_hyp3_count-as-fault_bus_x28)) (not (dominates-2_hyp2_count-as-fault_bus_x28)) (not (dominates-2_hyp1_count-as-fault_bus_x28))))
 (:action bus-voltage-goes-normal-unexplained_bus_x25_obs1015_n0_n1
  :parameters ()
  :precondition (and (pending_obs1015) (fault-count-2_count-as-fault_bus_x25_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (observed_obs1015) (fault-count-2_count-as-fault_bus_x25_n1) (not (pending_obs1015)) (not (fault-count-2_count-as-fault_bus_x25_n0)) (not (dominates-2_hyp7_count-as-fault_bus_x25)) (not (dominates-2_hyp6_count-as-fault_bus_x25)) (not (dominates-2_hyp5_count-as-fault_bus_x25)) (not (dominates-2_hyp4_count-as-fault_bus_x25)) (not (dominates-2_hyp3_count-as-fault_bus_x25)) (not (dominates-2_hyp2_count-as-fault_bus_x25)) (not (dominates-2_hyp1_count-as-fault_bus_x25))))
 (:action bus-mw-goes-to-zero-unexplained_bus_x26_obs1009_n0_n1
  :parameters ()
  :precondition (and (pending_obs1009) (fault-count-2_count-as-fault_bus_x26_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (observed_obs1009) (fault-count-2_count-as-fault_bus_x26_n1) (not (pending_obs1009)) (not (fault-count-2_count-as-fault_bus_x26_n0)) (not (dominates-2_hyp7_count-as-fault_bus_x26)) (not (dominates-2_hyp6_count-as-fault_bus_x26)) (not (dominates-2_hyp5_count-as-fault_bus_x26)) (not (dominates-2_hyp4_count-as-fault_bus_x26)) (not (dominates-2_hyp3_count-as-fault_bus_x26)) (not (dominates-2_hyp2_count-as-fault_bus_x26)) (not (dominates-2_hyp1_count-as-fault_bus_x26))))
 (:action line-iso-trip-first-breaker-simple-trip-1_line_x7_x8_breaker_x9_x10_breaker_x9_x10_obs1000_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x9_x10) (breaker-ar-status-is-auto_breaker_x9_x10) (pending_obs1000) (fault-count-2_count-as-fault_line_x7_x8_n0) (not_line-isolated_line_x7_x8) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-state-is-open_breaker_x9_x10) (observed_obs1000) (line-iso-trip-in-progress_line_x7_x8_obs1000) (fault-count-2_count-as-fault_line_x7_x8_n1) (not (breaker-state-is-closed_breaker_x9_x10)) (not (pending_obs1000)) (not (fault-count-2_count-as-fault_line_x7_x8_n0)) (not (not_line-iso-trip-in-progress_line_x7_x8_obs1000)) (not (dominates-2_hyp3_count-as-fault_line_x7_x8)) (not (dominates-2_hyp2_count-as-fault_line_x7_x8)) (not (dominates-2_hyp1_count-as-fault_line_x7_x8))))
 (:action line-iso-trip-first-breaker-simple-trip-1_line_x7_x8_breaker_x9_x10_breaker_x9_x10_obs1000_n1_n2
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x9_x10) (breaker-ar-status-is-auto_breaker_x9_x10) (pending_obs1000) (not_line-isolated_line_x7_x8) (fault-count-2_count-as-fault_line_x7_x8_n1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-state-is-open_breaker_x9_x10) (observed_obs1000) (line-iso-trip-in-progress_line_x7_x8_obs1000) (not (breaker-state-is-closed_breaker_x9_x10)) (not (pending_obs1000)) (not (not_line-iso-trip-in-progress_line_x7_x8_obs1000)) (not (fault-count-2_count-as-fault_line_x7_x8_n1))))
 (:action line-iso-trip-first-breaker-simple-trip-1_line_x7_x8_breaker_x23_x24_breaker_x23_x24_obs1001_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x23_x24) (breaker-ar-status-is-auto_breaker_x23_x24) (pending_obs1001) (fault-count-2_count-as-fault_line_x7_x8_n0) (not_line-isolated_line_x7_x8) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-state-is-open_breaker_x23_x24) (observed_obs1001) (fault-count-2_count-as-fault_line_x7_x8_n1) (line-iso-trip-in-progress_line_x7_x8_obs1001) (not (breaker-state-is-closed_breaker_x23_x24)) (not (pending_obs1001)) (not (fault-count-2_count-as-fault_line_x7_x8_n0)) (not (dominates-2_hyp3_count-as-fault_line_x7_x8)) (not (dominates-2_hyp2_count-as-fault_line_x7_x8)) (not (dominates-2_hyp1_count-as-fault_line_x7_x8)) (not (not_line-iso-trip-in-progress_line_x7_x8_obs1001))))
 (:action line-iso-trip-first-breaker-simple-trip-1_line_x7_x8_breaker_x23_x24_breaker_x23_x24_obs1001_n1_n2
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x23_x24) (breaker-ar-status-is-auto_breaker_x23_x24) (pending_obs1001) (not_line-isolated_line_x7_x8) (fault-count-2_count-as-fault_line_x7_x8_n1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-state-is-open_breaker_x23_x24) (observed_obs1001) (line-iso-trip-in-progress_line_x7_x8_obs1001) (not (breaker-state-is-closed_breaker_x23_x24)) (not (pending_obs1001)) (not (fault-count-2_count-as-fault_line_x7_x8_n1)) (not (not_line-iso-trip-in-progress_line_x7_x8_obs1001))))
 (:action line-iso-trip-first-breaker-simple-trip-1_line_x15_x16_breaker_x17_x18_breaker_x17_x18_obs1006_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x17_x18) (breaker-ar-status-is-auto_breaker_x17_x18) (pending_obs1006) (fault-count-2_count-as-fault_line_x15_x16_n0) (not_line-isolated_line_x15_x16) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-state-is-open_breaker_x17_x18) (observed_obs1006) (line-iso-trip-in-progress_line_x15_x16_obs1006) (fault-count-2_count-as-fault_line_x15_x16_n1) (not (breaker-state-is-closed_breaker_x17_x18)) (not (pending_obs1006)) (not (fault-count-2_count-as-fault_line_x15_x16_n0)) (not (not_line-iso-trip-in-progress_line_x15_x16_obs1006)) (not (dominates-2_hyp5_count-as-fault_line_x15_x16)) (not (dominates-2_hyp4_count-as-fault_line_x15_x16)) (not (dominates-2_hyp2_count-as-fault_line_x15_x16)) (not (dominates-2_hyp1_count-as-fault_line_x15_x16))))
 (:action line-iso-trip-first-breaker-simple-trip-1_line_x29_x30_breaker_x5_x6_breaker_x5_x6_obs1004_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x5_x6) (breaker-ar-status-is-auto_breaker_x5_x6) (pending_obs1004) (fault-count-2_count-as-fault_line_x29_x30_n0) (not_line-isolated_line_x29_x30) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-state-is-open_breaker_x5_x6) (observed_obs1004) (line-iso-trip-in-progress_line_x29_x30_obs1004) (fault-count-2_count-as-fault_line_x29_x30_n1) (not (breaker-state-is-closed_breaker_x5_x6)) (not (pending_obs1004)) (not (fault-count-2_count-as-fault_line_x29_x30_n0)) (not (not_line-iso-trip-in-progress_line_x29_x30_obs1004)) (not (dominates-2_hyp7_count-as-fault_line_x29_x30)) (not (dominates-2_hyp5_count-as-fault_line_x29_x30)) (not (dominates-2_hyp1_count-as-fault_line_x29_x30))))
 (:action line-iso-trip-first-breaker-simple-trip-2_line_x7_x8_breaker_x9_x10_breaker_x9_x10_obs1000_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x9_x10) (breaker-ar-status-is-non-auto_breaker_x9_x10) (pending_obs1000) (fault-count-2_count-as-fault_line_x7_x8_n0) (not_line-isolated_line_x7_x8) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-state-is-open_breaker_x9_x10) (observed_obs1000) (line-iso-trip-in-progress_line_x7_x8_obs1000) (fault-count-2_count-as-fault_line_x7_x8_n1) (not (breaker-state-is-closed_breaker_x9_x10)) (not (pending_obs1000)) (not (fault-count-2_count-as-fault_line_x7_x8_n0)) (not (not_line-iso-trip-in-progress_line_x7_x8_obs1000)) (not (dominates-2_hyp3_count-as-fault_line_x7_x8)) (not (dominates-2_hyp2_count-as-fault_line_x7_x8)) (not (dominates-2_hyp1_count-as-fault_line_x7_x8))))
 (:action line-iso-trip-first-breaker-simple-trip-2_line_x7_x8_breaker_x9_x10_breaker_x9_x10_obs1000_n1_n2
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x9_x10) (breaker-ar-status-is-non-auto_breaker_x9_x10) (pending_obs1000) (not_line-isolated_line_x7_x8) (fault-count-2_count-as-fault_line_x7_x8_n1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-state-is-open_breaker_x9_x10) (observed_obs1000) (line-iso-trip-in-progress_line_x7_x8_obs1000) (not (breaker-state-is-closed_breaker_x9_x10)) (not (pending_obs1000)) (not (not_line-iso-trip-in-progress_line_x7_x8_obs1000)) (not (fault-count-2_count-as-fault_line_x7_x8_n1))))
 (:action line-iso-trip-first-breaker-simple-trip-2_line_x7_x8_breaker_x23_x24_breaker_x23_x24_obs1001_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x23_x24) (breaker-ar-status-is-non-auto_breaker_x23_x24) (pending_obs1001) (fault-count-2_count-as-fault_line_x7_x8_n0) (not_line-isolated_line_x7_x8) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-state-is-open_breaker_x23_x24) (observed_obs1001) (fault-count-2_count-as-fault_line_x7_x8_n1) (line-iso-trip-in-progress_line_x7_x8_obs1001) (not (breaker-state-is-closed_breaker_x23_x24)) (not (pending_obs1001)) (not (fault-count-2_count-as-fault_line_x7_x8_n0)) (not (dominates-2_hyp3_count-as-fault_line_x7_x8)) (not (dominates-2_hyp2_count-as-fault_line_x7_x8)) (not (dominates-2_hyp1_count-as-fault_line_x7_x8)) (not (not_line-iso-trip-in-progress_line_x7_x8_obs1001))))
 (:action line-iso-trip-first-breaker-simple-trip-2_line_x7_x8_breaker_x23_x24_breaker_x23_x24_obs1001_n1_n2
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x23_x24) (breaker-ar-status-is-non-auto_breaker_x23_x24) (pending_obs1001) (not_line-isolated_line_x7_x8) (fault-count-2_count-as-fault_line_x7_x8_n1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-state-is-open_breaker_x23_x24) (observed_obs1001) (line-iso-trip-in-progress_line_x7_x8_obs1001) (not (breaker-state-is-closed_breaker_x23_x24)) (not (pending_obs1001)) (not (fault-count-2_count-as-fault_line_x7_x8_n1)) (not (not_line-iso-trip-in-progress_line_x7_x8_obs1001))))
 (:action line-iso-trip-first-breaker-simple-trip-2_line_x15_x16_breaker_x17_x18_breaker_x17_x18_obs1006_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x17_x18) (breaker-ar-status-is-non-auto_breaker_x17_x18) (pending_obs1006) (fault-count-2_count-as-fault_line_x15_x16_n0) (not_line-isolated_line_x15_x16) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-state-is-open_breaker_x17_x18) (observed_obs1006) (line-iso-trip-in-progress_line_x15_x16_obs1006) (fault-count-2_count-as-fault_line_x15_x16_n1) (not (breaker-state-is-closed_breaker_x17_x18)) (not (pending_obs1006)) (not (fault-count-2_count-as-fault_line_x15_x16_n0)) (not (not_line-iso-trip-in-progress_line_x15_x16_obs1006)) (not (dominates-2_hyp5_count-as-fault_line_x15_x16)) (not (dominates-2_hyp4_count-as-fault_line_x15_x16)) (not (dominates-2_hyp2_count-as-fault_line_x15_x16)) (not (dominates-2_hyp1_count-as-fault_line_x15_x16))))
 (:action line-iso-trip-first-breaker-simple-trip-2_line_x29_x30_breaker_x5_x6_breaker_x5_x6_obs1004_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x5_x6) (breaker-ar-status-is-non-auto_breaker_x5_x6) (pending_obs1004) (fault-count-2_count-as-fault_line_x29_x30_n0) (not_line-isolated_line_x29_x30) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-state-is-open_breaker_x5_x6) (observed_obs1004) (line-iso-trip-in-progress_line_x29_x30_obs1004) (fault-count-2_count-as-fault_line_x29_x30_n1) (not (breaker-state-is-closed_breaker_x5_x6)) (not (pending_obs1004)) (not (fault-count-2_count-as-fault_line_x29_x30_n0)) (not (not_line-iso-trip-in-progress_line_x29_x30_obs1004)) (not (dominates-2_hyp7_count-as-fault_line_x29_x30)) (not (dominates-2_hyp5_count-as-fault_line_x29_x30)) (not (dominates-2_hyp1_count-as-fault_line_x29_x30))))
 (:action line-iso-trip-more-breaker-simple-trip-1_line_x7_x8_breaker_x9_x10_breaker_x9_x10_obs1000_obs1001
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x9_x10) (breaker-ar-status-is-auto_breaker_x9_x10) (pending_obs1000) (line-iso-trip-in-progress_line_x7_x8_obs1001) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-state-is-open_breaker_x9_x10) (observed_obs1000) (not (breaker-state-is-closed_breaker_x9_x10)) (not (pending_obs1000))))
 (:action line-iso-trip-more-breaker-simple-trip-1_line_x7_x8_breaker_x23_x24_breaker_x23_x24_obs1001_obs1000
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x23_x24) (breaker-ar-status-is-auto_breaker_x23_x24) (pending_obs1001) (line-iso-trip-in-progress_line_x7_x8_obs1000) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-state-is-open_breaker_x23_x24) (observed_obs1001) (not (breaker-state-is-closed_breaker_x23_x24)) (not (pending_obs1001))))
 (:action line-iso-trip-more-breaker-simple-trip-2_line_x7_x8_breaker_x9_x10_breaker_x9_x10_obs1000_obs1001
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x9_x10) (breaker-ar-status-is-non-auto_breaker_x9_x10) (pending_obs1000) (line-iso-trip-in-progress_line_x7_x8_obs1001) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-state-is-open_breaker_x9_x10) (observed_obs1000) (not (breaker-state-is-closed_breaker_x9_x10)) (not (pending_obs1000))))
 (:action line-iso-trip-more-breaker-simple-trip-2_line_x7_x8_breaker_x23_x24_breaker_x23_x24_obs1001_obs1000
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x23_x24) (breaker-ar-status-is-non-auto_breaker_x23_x24) (pending_obs1001) (line-iso-trip-in-progress_line_x7_x8_obs1000) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (breaker-state-is-open_breaker_x23_x24) (observed_obs1001) (not (breaker-state-is-closed_breaker_x23_x24)) (not (pending_obs1001))))
 (:action line-finish-iso-trip-3_line_x7_x8_breaker_x9_x10_breaker_x33_x34_breaker_x23_x24_obs1000
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x9_x10) (breaker-state-is-open_breaker_x23_x24) (breaker-state-is-open_breaker_x33_x34) (line-iso-trip-in-progress_line_x7_x8_obs1000) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (not_line-iso-trip-in-progress_line_x7_x8_obs1000) (line-isolated_line_x7_x8) (line-iso-state-changed_line_x7_x8_obs1000) (not (not_line-isolated_line_x7_x8)) (not (line-iso-trip-in-progress_line_x7_x8_obs1000))))
 (:action line-finish-iso-trip-3_line_x7_x8_breaker_x9_x10_breaker_x33_x34_breaker_x23_x24_obs1001
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x9_x10) (breaker-state-is-open_breaker_x23_x24) (breaker-state-is-open_breaker_x33_x34) (line-iso-trip-in-progress_line_x7_x8_obs1001) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (not_line-iso-trip-in-progress_line_x7_x8_obs1001) (line-isolated_line_x7_x8) (line-iso-state-changed_line_x7_x8_obs1001) (not (not_line-isolated_line_x7_x8)) (not (line-iso-trip-in-progress_line_x7_x8_obs1001))))
 (:action line-finish-iso-trip-3_line_x29_x30_breaker_x5_x6_breaker_x31_x32_breaker_x35_x36_obs1004
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x5_x6) (breaker-state-is-open_breaker_x31_x32) (breaker-state-is-open_breaker_x35_x36) (line-iso-trip-in-progress_line_x29_x30_obs1004) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (not_line-iso-trip-in-progress_line_x29_x30_obs1004) (line-isolated_line_x29_x30) (not (not_line-isolated_line_x29_x30)) (not (line-iso-trip-in-progress_line_x29_x30_obs1004))))
 (:action line-finish-iso-trip-4_line_x15_x16_breaker_x37_x38_breaker_x17_x18_breaker_x39_x40_breaker_x41_x42_obs1006
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x17_x18) (breaker-state-is-open_breaker_x37_x38) (breaker-state-is-open_breaker_x39_x40) (breaker-state-is-open_breaker_x41_x42) (line-iso-trip-in-progress_line_x15_x16_obs1006) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (not_line-iso-trip-in-progress_line_x15_x16_obs1006) (line-isolated_line_x15_x16) (line-iso-state-changed_line_x15_x16_obs1006) (not (not_line-isolated_line_x15_x16)) (not (line-iso-trip-in-progress_line_x15_x16_obs1006))))
 (:action line-set-state-isolated-3_line_x7_x8_breaker_x9_x10_breaker_x33_x34_breaker_x23_x24_obs1000
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x9_x10) (breaker-state-is-open_breaker_x23_x24) (breaker-state-is-open_breaker_x33_x34) (line-iso-state-may-have-changed_line_x7_x8_obs1000) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (line-isolated_line_x7_x8) (line-iso-state-changed_line_x7_x8_obs1000) (not (not_line-isolated_line_x7_x8))))
 (:action line-set-state-isolated-3_line_x7_x8_breaker_x9_x10_breaker_x33_x34_breaker_x23_x24_obs1001
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x9_x10) (breaker-state-is-open_breaker_x23_x24) (breaker-state-is-open_breaker_x33_x34) (line-iso-state-may-have-changed_line_x7_x8_obs1001) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (line-isolated_line_x7_x8) (line-iso-state-changed_line_x7_x8_obs1001) (not (not_line-isolated_line_x7_x8))))
 (:action line-set-state-isolated-3_line_x29_x30_breaker_x5_x6_breaker_x31_x32_breaker_x35_x36_obs1004
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x5_x6) (breaker-state-is-open_breaker_x31_x32) (breaker-state-is-open_breaker_x35_x36) (line-iso-state-may-have-changed_line_x29_x30_obs1004) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (line-isolated_line_x29_x30) (not (not_line-isolated_line_x29_x30))))
 (:action line-set-state-isolated-4_line_x15_x16_breaker_x37_x38_breaker_x17_x18_breaker_x39_x40_breaker_x41_x42_obs1006
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x17_x18) (breaker-state-is-open_breaker_x37_x38) (breaker-state-is-open_breaker_x39_x40) (breaker-state-is-open_breaker_x41_x42) (line-iso-state-may-have-changed_line_x15_x16_obs1006) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (line-isolated_line_x15_x16) (line-iso-state-changed_line_x15_x16_obs1006) (not (not_line-isolated_line_x15_x16))))
 (:action line-init-state-isolated-3_line_x7_x8_breaker_x9_x10_breaker_x33_x34_breaker_x23_x24
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x9_x10) (breaker-state-is-open_breaker_x23_x24) (breaker-state-is-open_breaker_x33_x34) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (line-isolated_line_x7_x8) (not (not_line-isolated_line_x7_x8))))
 (:action line-init-state-isolated-3_line_x29_x30_breaker_x5_x6_breaker_x31_x32_breaker_x35_x36
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x5_x6) (breaker-state-is-open_breaker_x31_x32) (breaker-state-is-open_breaker_x35_x36) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (line-isolated_line_x29_x30) (not (not_line-isolated_line_x29_x30))))
 (:action line-init-state-isolated-4_line_x15_x16_breaker_x37_x38_breaker_x17_x18_breaker_x39_x40_breaker_x41_x42
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x17_x18) (breaker-state-is-open_breaker_x37_x38) (breaker-state-is-open_breaker_x39_x40) (breaker-state-is-open_breaker_x41_x42) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (line-isolated_line_x15_x16) (not (not_line-isolated_line_x15_x16))))
 (:action line-voltage-goes-low-unexplained-1_line_x7_x8_low_obs1005_n0_n1
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_line_x7_x8_n0) (pending_obs1005) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (fault-count-2_count-as-fault_line_x7_x8_n1) (observed_obs1005) (not (fault-count-2_count-as-fault_line_x7_x8_n0)) (not (dominates-2_hyp3_count-as-fault_line_x7_x8)) (not (dominates-2_hyp2_count-as-fault_line_x7_x8)) (not (dominates-2_hyp1_count-as-fault_line_x7_x8)) (not (pending_obs1005))))
 (:action line-voltage-goes-low-unexplained-1_line_x7_x8_low_obs1005_n1_n2
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_line_x7_x8_n1) (pending_obs1005) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (observed_obs1005) (not (fault-count-2_count-as-fault_line_x7_x8_n1)) (not (pending_obs1005))))
 (:action line-voltage-goes-to-zero-unexplained-1_line_x1_x2_obs1016_n0_n1
  :parameters ()
  :precondition (and (pending_obs1016) (fault-count-2_count-as-fault_line_x1_x2_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (observed_obs1016) (fault-count-2_count-as-fault_line_x1_x2_n1) (not (pending_obs1016)) (not (fault-count-2_count-as-fault_line_x1_x2_n0)) (not (dominates-2_hyp7_count-as-fault_line_x1_x2)) (not (dominates-2_hyp6_count-as-fault_line_x1_x2)) (not (dominates-2_hyp5_count-as-fault_line_x1_x2)) (not (dominates-2_hyp4_count-as-fault_line_x1_x2)) (not (dominates-2_hyp3_count-as-fault_line_x1_x2)) (not (dominates-2_hyp2_count-as-fault_line_x1_x2)) (not (dominates-2_hyp1_count-as-fault_line_x1_x2))))
 (:action line-voltage-goes-to-zero-unexplained-1_line_x13_x14_obs1014_n0_n1
  :parameters ()
  :precondition (and (pending_obs1014) (fault-count-2_count-as-fault_line_x13_x14_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (observed_obs1014) (fault-count-2_count-as-fault_line_x13_x14_n1) (not (pending_obs1014)) (not (fault-count-2_count-as-fault_line_x13_x14_n0)) (not (dominates-2_hyp7_count-as-fault_line_x13_x14)) (not (dominates-2_hyp6_count-as-fault_line_x13_x14)) (not (dominates-2_hyp5_count-as-fault_line_x13_x14)) (not (dominates-2_hyp4_count-as-fault_line_x13_x14)) (not (dominates-2_hyp3_count-as-fault_line_x13_x14)) (not (dominates-2_hyp2_count-as-fault_line_x13_x14)) (not (dominates-2_hyp1_count-as-fault_line_x13_x14))))
 (:action line-voltage-goes-to-zero-unexplained-1_line_x15_x16_obs1013_n0_n1
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_line_x15_x16_n0) (pending_obs1013) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (fault-count-2_count-as-fault_line_x15_x16_n1) (observed_obs1013) (not (fault-count-2_count-as-fault_line_x15_x16_n0)) (not (dominates-2_hyp5_count-as-fault_line_x15_x16)) (not (dominates-2_hyp4_count-as-fault_line_x15_x16)) (not (dominates-2_hyp2_count-as-fault_line_x15_x16)) (not (dominates-2_hyp1_count-as-fault_line_x15_x16)) (not (pending_obs1013))))
 (:action line-voltage-goes-to-zero-unexplained-1_line_x15_x16_obs1013_n1_n2
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_line_x15_x16_n1) (pending_obs1013) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (observed_obs1013) (not (fault-count-2_count-as-fault_line_x15_x16_n1)) (not (pending_obs1013))))
 (:action line-voltage-goes-low-when-isolated-1_line_x7_x8_low_obs1005_obs1000
  :parameters ()
  :precondition (and (line-isolated_line_x7_x8) (line-iso-state-changed_line_x7_x8_obs1000) (pending_obs1005) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (observed_obs1005) (not (pending_obs1005))))
 (:action line-voltage-goes-low-when-isolated-1_line_x7_x8_low_obs1005_obs1001
  :parameters ()
  :precondition (and (line-isolated_line_x7_x8) (line-iso-state-changed_line_x7_x8_obs1001) (pending_obs1005) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (observed_obs1005) (not (pending_obs1005))))
 (:action line-voltage-goes-to-zero-when-isolated-1_line_x15_x16_obs1013_obs1006
  :parameters ()
  :precondition (and (line-isolated_line_x15_x16) (line-iso-state-changed_line_x15_x16_obs1006) (pending_obs1013) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (observed_obs1013) (not (pending_obs1013))))
 (:action generator-init-status-was-on_generator_x11_1
  :parameters ()
  :precondition (and (generator-status-is-unknown_generator_x11_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (generator-status-is-on_generator_x11_1) (not (generator-status-is-unknown_generator_x11_1))))
 (:action generator-init-status-was-off_generator_x11_1
  :parameters ()
  :precondition (and (generator-status-is-unknown_generator_x11_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (generator-status-is-off_generator_x11_1) (not (generator-status-is-unknown_generator_x11_1))))
 (:action generator-begin-shutdown_generator_x11_1_n0_n1
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x11_1) (fault-count-2_count-as-fault_generator_x11_1_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (generator-status-is-shutting-down_generator_x11_1) (fault-count-2_count-as-fault_generator_x11_1_n1) (not (generator-status-is-on_generator_x11_1)) (not (fault-count-2_count-as-fault_generator_x11_1_n0))))
 (:action generator-begin-shutdown_generator_x11_1_n1_n2
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x11_1) (fault-count-2_count-as-fault_generator_x11_1_n1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (generator-status-is-shutting-down_generator_x11_1) (not (generator-status-is-on_generator_x11_1)) (not (fault-count-2_count-as-fault_generator_x11_1_n1)) (not (dominates-2_hyp7_count-as-fault_generator_x11_1)) (not (dominates-2_hyp6_count-as-fault_generator_x11_1)) (not (dominates-2_hyp5_count-as-fault_generator_x11_1)) (not (dominates-2_hyp4_count-as-fault_generator_x11_1)) (not (dominates-2_hyp3_count-as-fault_generator_x11_1)) (not (dominates-2_hyp2_count-as-fault_generator_x11_1)) (not (dominates-2_hyp1_count-as-fault_generator_x11_1))))
 (:action generator-shutdown-breaker-open-breaker-open_generator_x11_1_breaker_x11_x12_bus_x11_breaker_x11_x12_obs999
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x11_x12) (pending_obs999) (generator-status-is-shutting-down_generator_x11_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (observed_obs999) (not (breaker-state-is-closed_breaker_x11_x12)) (not (pending_obs999))))
 (:action generator-shutdown-turn-off_generator_x11_1_obs1002
  :parameters ()
  :precondition (and (generator-status-is-shutting-down_generator_x11_1) (pending_obs1002) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (observed_obs1002) (not (pending_obs1002))))
 (:action generator-shutdown-turn-off_generator_x11_1_obs1012
  :parameters ()
  :precondition (and (generator-status-is-shutting-down_generator_x11_1) (pending_obs1012) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (observed_obs1012) (not (pending_obs1012))))
 (:action generator-shutdown-complete_generator_x11_1
  :parameters ()
  :precondition (and (generator-status-is-shutting-down_generator_x11_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (generator-status-is-off_generator_x11_1) (not (generator-status-is-shutting-down_generator_x11_1))))
 (:action generator-begin-startup_generator_x11_1_n0_n1
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x11_1) (fault-count-2_count-as-fault_generator_x11_1_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (fault-count-2_count-as-fault_generator_x11_1_n1) (generator-status-is-starting-up_generator_x11_1) (not (generator-status-is-on_generator_x11_1)) (not (fault-count-2_count-as-fault_generator_x11_1_n0))))
 (:action generator-begin-startup_generator_x11_1_n1_n2
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x11_1) (fault-count-2_count-as-fault_generator_x11_1_n1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (generator-status-is-starting-up_generator_x11_1) (not (generator-status-is-on_generator_x11_1)) (not (fault-count-2_count-as-fault_generator_x11_1_n1)) (not (dominates-2_hyp7_count-as-fault_generator_x11_1)) (not (dominates-2_hyp6_count-as-fault_generator_x11_1)) (not (dominates-2_hyp5_count-as-fault_generator_x11_1)) (not (dominates-2_hyp4_count-as-fault_generator_x11_1)) (not (dominates-2_hyp3_count-as-fault_generator_x11_1)) (not (dominates-2_hyp2_count-as-fault_generator_x11_1)) (not (dominates-2_hyp1_count-as-fault_generator_x11_1))))
 (:action generator-startup-complete_generator_x11_1
  :parameters ()
  :precondition (and (generator-status-is-starting-up_generator_x11_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (generator-status-is-on_generator_x11_1) (not (generator-status-is-starting-up_generator_x11_1))))
 (:action generator-runback-alarm_generator_x11_1_obs1011_n1_n2
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x11_1_n1) (pending_obs1011) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (observed_obs1011) (not (fault-count-2_count-as-fault_generator_x11_1_n1)) (not (dominates-2_hyp7_count-as-fault_generator_x11_1)) (not (dominates-2_hyp6_count-as-fault_generator_x11_1)) (not (dominates-2_hyp5_count-as-fault_generator_x11_1)) (not (dominates-2_hyp4_count-as-fault_generator_x11_1)) (not (dominates-2_hyp3_count-as-fault_generator_x11_1)) (not (dominates-2_hyp2_count-as-fault_generator_x11_1)) (not (dominates-2_hyp1_count-as-fault_generator_x11_1)) (not (pending_obs1011))))
 (:action advance-to-obs_obs999
  :parameters ()
  :precondition (and (observed_obs998) (future_obs999) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (pending_obs999) (not (future_obs999))))
 (:action advance-to-obs_obs1000
  :parameters ()
  :precondition (and (observed_obs999) (future_obs1000) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (pending_obs1000) (not (future_obs1000))))
 (:action advance-to-obs_obs1001
  :parameters ()
  :precondition (and (observed_obs999) (future_obs1001) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (pending_obs1001) (not (future_obs1001))))
 (:action advance-to-obs_obs1002
  :parameters ()
  :precondition (and (observed_obs1000) (observed_obs1001) (future_obs1002) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (pending_obs1002) (not (future_obs1002))))
 (:action advance-to-obs_obs1003
  :parameters ()
  :precondition (and (observed_obs1000) (observed_obs1001) (future_obs1003) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (pending_obs1003) (not (future_obs1003))))
 (:action advance-to-obs_obs1004
  :parameters ()
  :precondition (and (observed_obs1000) (observed_obs1001) (future_obs1004) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (pending_obs1004) (not (future_obs1004))))
 (:action advance-to-obs_obs1005
  :parameters ()
  :precondition (and (observed_obs1000) (observed_obs1001) (future_obs1005) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (pending_obs1005) (not (future_obs1005))))
 (:action advance-to-obs_obs1006
  :parameters ()
  :precondition (and (observed_obs1000) (observed_obs1001) (future_obs1006) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (pending_obs1006) (not (future_obs1006))))
 (:action advance-to-obs_obs1007
  :parameters ()
  :precondition (and (observed_obs1004) (observed_obs1006) (observed_obs1003) (not_line-iso-trip-in-progress_line_x7_x8_obs1000) (not_line-iso-trip-in-progress_line_x7_x8_obs1001) (observed_obs1005) (observed_obs1002) (future_obs1007) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (pending_obs1007) (not (future_obs1007))))
 (:action advance-to-obs_obs1008
  :parameters ()
  :precondition (and (observed_obs1004) (observed_obs1006) (observed_obs1003) (not_line-iso-trip-in-progress_line_x7_x8_obs1000) (not_line-iso-trip-in-progress_line_x7_x8_obs1001) (observed_obs1005) (observed_obs1002) (future_obs1008) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (pending_obs1008) (not (future_obs1008))))
 (:action advance-to-obs_obs1009
  :parameters ()
  :precondition (and (observed_obs1004) (observed_obs1006) (observed_obs1003) (not_line-iso-trip-in-progress_line_x7_x8_obs1000) (not_line-iso-trip-in-progress_line_x7_x8_obs1001) (observed_obs1005) (observed_obs1002) (future_obs1009) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (pending_obs1009) (not (future_obs1009))))
 (:action advance-to-obs_obs1010
  :parameters ()
  :precondition (and (observed_obs1004) (observed_obs1006) (observed_obs1003) (not_line-iso-trip-in-progress_line_x7_x8_obs1000) (not_line-iso-trip-in-progress_line_x7_x8_obs1001) (observed_obs1005) (observed_obs1002) (future_obs1010) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (pending_obs1010) (not (future_obs1010))))
 (:action advance-to-obs_obs1011
  :parameters ()
  :precondition (and (observed_obs1004) (observed_obs1006) (observed_obs1003) (not_line-iso-trip-in-progress_line_x7_x8_obs1000) (not_line-iso-trip-in-progress_line_x7_x8_obs1001) (observed_obs1005) (observed_obs1002) (future_obs1011) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (pending_obs1011) (not (future_obs1011))))
 (:action advance-to-obs_obs1012
  :parameters ()
  :precondition (and (observed_obs1004) (observed_obs1006) (observed_obs1003) (not_line-iso-trip-in-progress_line_x7_x8_obs1000) (not_line-iso-trip-in-progress_line_x7_x8_obs1001) (observed_obs1005) (observed_obs1002) (future_obs1012) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (pending_obs1012) (not (future_obs1012))))
 (:action advance-to-obs_obs1013
  :parameters ()
  :precondition (and (observed_obs1007) (observed_obs1008) (observed_obs1010) (observed_obs1009) (not_line-iso-trip-in-progress_line_x15_x16_obs1006) (not_line-iso-trip-in-progress_line_x29_x30_obs1004) (observed_obs1012) (observed_obs1011) (future_obs1013) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (pending_obs1013) (not (future_obs1013))))
 (:action advance-to-obs_obs1014
  :parameters ()
  :precondition (and (observed_obs1007) (observed_obs1008) (observed_obs1010) (observed_obs1009) (not_line-iso-trip-in-progress_line_x15_x16_obs1006) (not_line-iso-trip-in-progress_line_x29_x30_obs1004) (observed_obs1012) (observed_obs1011) (future_obs1014) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (pending_obs1014) (not (future_obs1014))))
 (:action advance-to-obs_obs1015
  :parameters ()
  :precondition (and (observed_obs1007) (observed_obs1008) (observed_obs1010) (observed_obs1009) (not_line-iso-trip-in-progress_line_x15_x16_obs1006) (not_line-iso-trip-in-progress_line_x29_x30_obs1004) (observed_obs1012) (observed_obs1011) (future_obs1015) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (pending_obs1015) (not (future_obs1015))))
 (:action advance-to-obs_obs1016
  :parameters ()
  :precondition (and (observed_obs1007) (observed_obs1008) (observed_obs1010) (observed_obs1009) (not_line-iso-trip-in-progress_line_x15_x16_obs1006) (not_line-iso-trip-in-progress_line_x29_x30_obs1004) (observed_obs1012) (observed_obs1011) (future_obs1016) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (pending_obs1016) (not (future_obs1016))))
 (:action advance-to-obs_obs1017
  :parameters ()
  :precondition (and (observed_obs1007) (observed_obs1008) (observed_obs1010) (observed_obs1009) (not_line-iso-trip-in-progress_line_x15_x16_obs1006) (not_line-iso-trip-in-progress_line_x29_x30_obs1004) (observed_obs1012) (observed_obs1011) (future_obs1017) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (pending_obs1017) (not (future_obs1017))))
 (:action set_goal_1_constraint0
  :parameters ()
  :precondition (and (observed_obs998) (observed_obs1004) (observed_obs1000) (dominates-2_hyp7_count-as-fault_breaker_x9_x10) (observed_obs999) (observed_obs1006) (observed_obs1017) (observed_obs1007) (observed_obs1001) (observed_obs1008) (observed_obs1010) (observed_obs1003) (observed_obs1015) (observed_obs1009) (observed_obs1005) (observed_obs1016) (observed_obs1014) (observed_obs1013) (observed_obs1002) (observed_obs1012) (observed_obs1011) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (achieved_constraint0) (not (not_at_end_constraint0))))
 (:action set_goal_2_constraint0
  :parameters ()
  :precondition (and (observed_obs998) (observed_obs1004) (observed_obs1000) (observed_obs999) (observed_obs1006) (dominates-2_hyp7_count-as-fault_breaker_x17_x18) (observed_obs1017) (observed_obs1007) (observed_obs1001) (observed_obs1008) (observed_obs1010) (observed_obs1003) (observed_obs1015) (observed_obs1009) (observed_obs1005) (observed_obs1016) (observed_obs1014) (observed_obs1013) (observed_obs1002) (observed_obs1012) (observed_obs1011) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (achieved_constraint0) (not (not_at_end_constraint0))))
 (:action set_goal_5_constraint0
  :parameters ()
  :precondition (and (observed_obs998) (observed_obs1004) (observed_obs1000) (observed_obs999) (observed_obs1006) (observed_obs1017) (observed_obs1007) (observed_obs1001) (dominates-2_hyp7_count-as-fault_breaker_x23_x24) (observed_obs1008) (observed_obs1010) (observed_obs1003) (observed_obs1015) (observed_obs1009) (observed_obs1005) (observed_obs1016) (observed_obs1014) (observed_obs1013) (observed_obs1002) (observed_obs1012) (observed_obs1011) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (achieved_constraint0) (not (not_at_end_constraint0))))
 (:action set_goal_11_constraint0
  :parameters ()
  :precondition (and (observed_obs998) (observed_obs1004) (observed_obs1000) (observed_obs999) (observed_obs1006) (observed_obs1017) (observed_obs1007) (observed_obs1001) (observed_obs1008) (observed_obs1010) (observed_obs1003) (observed_obs1015) (observed_obs1009) (dominates-2_hyp7_count-as-fault_line_x29_x30) (observed_obs1005) (observed_obs1016) (observed_obs1014) (observed_obs1013) (observed_obs1002) (observed_obs1012) (observed_obs1011) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (achieved_constraint0) (not (not_at_end_constraint0))))
 (:action set_goal_1_constraint1
  :parameters ()
  :precondition (and (observed_obs998) (observed_obs1004) (dominates-2_hyp6_count-as-fault_breaker_x5_x6) (observed_obs1000) (observed_obs999) (observed_obs1006) (observed_obs1017) (observed_obs1007) (observed_obs1001) (observed_obs1008) (observed_obs1010) (observed_obs1003) (observed_obs1015) (observed_obs1009) (observed_obs1005) (observed_obs1016) (observed_obs1014) (observed_obs1013) (observed_obs1002) (observed_obs1012) (observed_obs1011) (achieved_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (achieved_constraint1) (not (not_at_end_constraint1))))
 (:action set_goal_2_constraint1
  :parameters ()
  :precondition (and (observed_obs998) (observed_obs1004) (observed_obs1000) (dominates-2_hyp6_count-as-fault_breaker_x9_x10) (observed_obs999) (observed_obs1006) (observed_obs1017) (observed_obs1007) (observed_obs1001) (observed_obs1008) (observed_obs1010) (observed_obs1003) (observed_obs1015) (observed_obs1009) (observed_obs1005) (observed_obs1016) (observed_obs1014) (observed_obs1013) (observed_obs1002) (observed_obs1012) (observed_obs1011) (achieved_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (achieved_constraint1) (not (not_at_end_constraint1))))
 (:action set_goal_3_constraint1
  :parameters ()
  :precondition (and (observed_obs998) (observed_obs1004) (observed_obs1000) (observed_obs999) (observed_obs1006) (dominates-2_hyp6_count-as-fault_breaker_x17_x18) (observed_obs1017) (observed_obs1007) (observed_obs1001) (observed_obs1008) (observed_obs1010) (observed_obs1003) (observed_obs1015) (observed_obs1009) (observed_obs1005) (observed_obs1016) (observed_obs1014) (observed_obs1013) (observed_obs1002) (observed_obs1012) (observed_obs1011) (achieved_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (achieved_constraint1) (not (not_at_end_constraint1))))
 (:action set_goal_6_constraint1
  :parameters ()
  :precondition (and (observed_obs998) (observed_obs1004) (observed_obs1000) (observed_obs999) (observed_obs1006) (observed_obs1017) (observed_obs1007) (observed_obs1001) (dominates-2_hyp6_count-as-fault_breaker_x23_x24) (observed_obs1008) (observed_obs1010) (observed_obs1003) (observed_obs1015) (observed_obs1009) (observed_obs1005) (observed_obs1016) (observed_obs1014) (observed_obs1013) (observed_obs1002) (observed_obs1012) (observed_obs1011) (achieved_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (achieved_constraint1) (not (not_at_end_constraint1))))
 (:action set_goal_1_constraint2
  :parameters ()
  :precondition (and (observed_obs998) (observed_obs1004) (observed_obs1000) (dominates-2_hyp5_count-as-fault_breaker_x9_x10) (observed_obs999) (observed_obs1006) (observed_obs1017) (observed_obs1007) (observed_obs1001) (observed_obs1008) (observed_obs1010) (observed_obs1003) (observed_obs1015) (observed_obs1009) (observed_obs1005) (observed_obs1016) (observed_obs1014) (observed_obs1013) (observed_obs1002) (observed_obs1012) (observed_obs1011) (achieved_constraint0) (achieved_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (achieved_constraint2) (not (not_at_end_constraint2))))
 (:action set_goal_4_constraint2
  :parameters ()
  :precondition (and (observed_obs998) (observed_obs1004) (observed_obs1000) (observed_obs999) (observed_obs1006) (observed_obs1017) (observed_obs1007) (observed_obs1001) (dominates-2_hyp5_count-as-fault_breaker_x23_x24) (observed_obs1008) (observed_obs1010) (observed_obs1003) (observed_obs1015) (observed_obs1009) (observed_obs1005) (observed_obs1016) (observed_obs1014) (observed_obs1013) (observed_obs1002) (observed_obs1012) (observed_obs1011) (achieved_constraint0) (achieved_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (achieved_constraint2) (not (not_at_end_constraint2))))
 (:action set_goal_10_constraint2
  :parameters ()
  :precondition (and (observed_obs998) (observed_obs1004) (observed_obs1000) (observed_obs999) (observed_obs1006) (observed_obs1017) (observed_obs1007) (observed_obs1001) (observed_obs1008) (observed_obs1010) (observed_obs1003) (observed_obs1015) (observed_obs1009) (dominates-2_hyp5_count-as-fault_line_x15_x16) (observed_obs1005) (observed_obs1016) (observed_obs1014) (observed_obs1013) (observed_obs1002) (observed_obs1012) (observed_obs1011) (achieved_constraint0) (achieved_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (achieved_constraint2) (not (not_at_end_constraint2))))
 (:action set_goal_11_constraint2
  :parameters ()
  :precondition (and (observed_obs998) (observed_obs1004) (observed_obs1000) (observed_obs999) (observed_obs1006) (observed_obs1017) (observed_obs1007) (observed_obs1001) (observed_obs1008) (observed_obs1010) (observed_obs1003) (observed_obs1015) (observed_obs1009) (dominates-2_hyp5_count-as-fault_line_x29_x30) (observed_obs1005) (observed_obs1016) (observed_obs1014) (observed_obs1013) (observed_obs1002) (observed_obs1012) (observed_obs1011) (achieved_constraint0) (achieved_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (achieved_constraint2) (not (not_at_end_constraint2))))
 (:action set_goal_1_constraint3
  :parameters ()
  :precondition (and (observed_obs998) (observed_obs1004) (dominates-2_hyp4_count-as-fault_breaker_x5_x6) (observed_obs1000) (observed_obs999) (observed_obs1006) (observed_obs1017) (observed_obs1007) (observed_obs1001) (observed_obs1008) (observed_obs1010) (observed_obs1003) (observed_obs1015) (observed_obs1009) (observed_obs1005) (observed_obs1016) (observed_obs1014) (observed_obs1013) (observed_obs1002) (observed_obs1012) (observed_obs1011) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (achieved_constraint3) (not (not_at_end_constraint3))))
 (:action set_goal_2_constraint3
  :parameters ()
  :precondition (and (observed_obs998) (observed_obs1004) (observed_obs1000) (dominates-2_hyp4_count-as-fault_breaker_x9_x10) (observed_obs999) (observed_obs1006) (observed_obs1017) (observed_obs1007) (observed_obs1001) (observed_obs1008) (observed_obs1010) (observed_obs1003) (observed_obs1015) (observed_obs1009) (observed_obs1005) (observed_obs1016) (observed_obs1014) (observed_obs1013) (observed_obs1002) (observed_obs1012) (observed_obs1011) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (achieved_constraint3) (not (not_at_end_constraint3))))
 (:action set_goal_5_constraint3
  :parameters ()
  :precondition (and (observed_obs998) (observed_obs1004) (observed_obs1000) (observed_obs999) (observed_obs1006) (observed_obs1017) (observed_obs1007) (observed_obs1001) (dominates-2_hyp4_count-as-fault_breaker_x23_x24) (observed_obs1008) (observed_obs1010) (observed_obs1003) (observed_obs1015) (observed_obs1009) (observed_obs1005) (observed_obs1016) (observed_obs1014) (observed_obs1013) (observed_obs1002) (observed_obs1012) (observed_obs1011) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (achieved_constraint3) (not (not_at_end_constraint3))))
 (:action set_goal_11_constraint3
  :parameters ()
  :precondition (and (observed_obs998) (observed_obs1004) (observed_obs1000) (observed_obs999) (observed_obs1006) (observed_obs1017) (observed_obs1007) (observed_obs1001) (observed_obs1008) (observed_obs1010) (observed_obs1003) (observed_obs1015) (observed_obs1009) (dominates-2_hyp4_count-as-fault_line_x15_x16) (observed_obs1005) (observed_obs1016) (observed_obs1014) (observed_obs1013) (observed_obs1002) (observed_obs1012) (observed_obs1011) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (achieved_constraint3) (not (not_at_end_constraint3))))
 (:action set_goal_1_constraint4
  :parameters ()
  :precondition (and (observed_obs998) (observed_obs1004) (dominates-2_hyp3_count-as-fault_breaker_x5_x6) (observed_obs1000) (observed_obs999) (observed_obs1006) (observed_obs1017) (observed_obs1007) (observed_obs1001) (observed_obs1008) (observed_obs1010) (observed_obs1003) (observed_obs1015) (observed_obs1009) (observed_obs1005) (observed_obs1016) (observed_obs1014) (observed_obs1013) (observed_obs1002) (observed_obs1012) (observed_obs1011) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (achieved_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (achieved_constraint4) (not (not_at_end_constraint4))))
 (:action set_goal_2_constraint4
  :parameters ()
  :precondition (and (observed_obs998) (observed_obs1004) (observed_obs1000) (observed_obs999) (observed_obs1006) (dominates-2_hyp3_count-as-fault_breaker_x17_x18) (observed_obs1017) (observed_obs1007) (observed_obs1001) (observed_obs1008) (observed_obs1010) (observed_obs1003) (observed_obs1015) (observed_obs1009) (observed_obs1005) (observed_obs1016) (observed_obs1014) (observed_obs1013) (observed_obs1002) (observed_obs1012) (observed_obs1011) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (achieved_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (achieved_constraint4) (not (not_at_end_constraint4))))
 (:action set_goal_10_constraint4
  :parameters ()
  :precondition (and (observed_obs998) (observed_obs1004) (observed_obs1000) (observed_obs999) (observed_obs1006) (observed_obs1017) (observed_obs1007) (observed_obs1001) (observed_obs1008) (observed_obs1010) (observed_obs1003) (observed_obs1015) (observed_obs1009) (dominates-2_hyp3_count-as-fault_line_x7_x8) (observed_obs1005) (observed_obs1016) (observed_obs1014) (observed_obs1013) (observed_obs1002) (observed_obs1012) (observed_obs1011) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (achieved_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (achieved_constraint4) (not (not_at_end_constraint4))))
 (:action set_goal_1_constraint5
  :parameters ()
  :precondition (and (observed_obs998) (observed_obs1004) (dominates-2_hyp2_count-as-fault_breaker_x5_x6) (observed_obs1000) (observed_obs999) (observed_obs1006) (observed_obs1017) (observed_obs1007) (observed_obs1001) (observed_obs1008) (observed_obs1010) (observed_obs1003) (observed_obs1015) (observed_obs1009) (observed_obs1005) (observed_obs1016) (observed_obs1014) (observed_obs1013) (observed_obs1002) (observed_obs1012) (observed_obs1011) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (achieved_constraint3) (achieved_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (achieved_constraint5) (not (not_at_end_constraint5))))
 (:action set_goal_9_constraint5
  :parameters ()
  :precondition (and (observed_obs998) (observed_obs1004) (observed_obs1000) (observed_obs999) (observed_obs1006) (observed_obs1017) (observed_obs1007) (observed_obs1001) (observed_obs1008) (observed_obs1010) (observed_obs1003) (observed_obs1015) (observed_obs1009) (dominates-2_hyp2_count-as-fault_line_x7_x8) (observed_obs1005) (observed_obs1016) (observed_obs1014) (observed_obs1013) (observed_obs1002) (observed_obs1012) (observed_obs1011) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (achieved_constraint3) (achieved_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (achieved_constraint5) (not (not_at_end_constraint5))))
 (:action set_goal_10_constraint5
  :parameters ()
  :precondition (and (observed_obs998) (observed_obs1004) (observed_obs1000) (observed_obs999) (observed_obs1006) (observed_obs1017) (observed_obs1007) (observed_obs1001) (observed_obs1008) (observed_obs1010) (observed_obs1003) (observed_obs1015) (observed_obs1009) (dominates-2_hyp2_count-as-fault_line_x15_x16) (observed_obs1005) (observed_obs1016) (observed_obs1014) (observed_obs1013) (observed_obs1002) (observed_obs1012) (observed_obs1011) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (achieved_constraint3) (achieved_constraint4) (not_at_end_constraint5) (not_at_end_constraint6))
  :effect (and (achieved_constraint5) (not (not_at_end_constraint5))))
 (:action set_goal_8_constraint6
  :parameters ()
  :precondition (and (observed_obs998) (observed_obs1004) (observed_obs1000) (observed_obs999) (observed_obs1006) (observed_obs1017) (observed_obs1007) (observed_obs1001) (observed_obs1008) (observed_obs1010) (observed_obs1003) (observed_obs1015) (observed_obs1009) (dominates-2_hyp1_count-as-fault_line_x7_x8) (observed_obs1005) (observed_obs1016) (observed_obs1014) (observed_obs1013) (observed_obs1002) (observed_obs1012) (observed_obs1011) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (achieved_constraint3) (achieved_constraint4) (achieved_constraint5) (not_at_end_constraint6))
  :effect (and (achieved_constraint6) (not (not_at_end_constraint6))))
 (:action set_goal_9_constraint6
  :parameters ()
  :precondition (and (observed_obs998) (observed_obs1004) (observed_obs1000) (observed_obs999) (observed_obs1006) (observed_obs1017) (observed_obs1007) (observed_obs1001) (observed_obs1008) (observed_obs1010) (observed_obs1003) (observed_obs1015) (observed_obs1009) (dominates-2_hyp1_count-as-fault_line_x15_x16) (observed_obs1005) (observed_obs1016) (observed_obs1014) (observed_obs1013) (observed_obs1002) (observed_obs1012) (observed_obs1011) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (achieved_constraint3) (achieved_constraint4) (achieved_constraint5) (not_at_end_constraint6))
  :effect (and (achieved_constraint6) (not (not_at_end_constraint6))))
 (:action set_goal_10_constraint6
  :parameters ()
  :precondition (and (observed_obs998) (observed_obs1004) (observed_obs1000) (observed_obs999) (observed_obs1006) (observed_obs1017) (observed_obs1007) (observed_obs1001) (observed_obs1008) (observed_obs1010) (observed_obs1003) (observed_obs1015) (observed_obs1009) (dominates-2_hyp1_count-as-fault_line_x29_x30) (observed_obs1005) (observed_obs1016) (observed_obs1014) (observed_obs1013) (observed_obs1002) (observed_obs1012) (observed_obs1011) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (achieved_constraint3) (achieved_constraint4) (achieved_constraint5) (not_at_end_constraint6))
  :effect (and (achieved_constraint6) (not (not_at_end_constraint6))))
)
