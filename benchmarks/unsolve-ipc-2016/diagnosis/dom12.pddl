(define (domain appn-pls)
 (:requirements :strips :equality)
 (:predicates (breaker-state-is-unknown_breaker_x3_x4) (breaker-state-is-open_breaker_x3_x4) (breaker-state-is-unknown_breaker_x5_x6) (breaker-state-is-open_breaker_x5_x6) (breaker-state-is-unknown_breaker_x7_x8) (breaker-state-is-unknown_breaker_x11_x12) (breaker-state-is-open_breaker_x11_x12) (breaker-state-is-unknown_breaker_x13_x14) (breaker-state-is-unknown_breaker_x15_x16) (breaker-state-is-unknown_breaker_x19_x20) (breaker-state-is-unknown_breaker_x29_x30) (breaker-state-is-open_breaker_x29_x30) (breaker-state-is-unknown_breaker_x31_x32) (breaker-state-is-open_breaker_x31_x32) (breaker-state-is-closed_breaker_x5_x6) (breaker-state-is-closed_breaker_x7_x8) (breaker-state-is-closed_breaker_x13_x14) (breaker-state-is-closed_breaker_x15_x16) (breaker-state-is-closed_breaker_x19_x20) (breaker-state-is-closed_breaker_x29_x30) (breaker-state-is-closed_breaker_x31_x32) (breaker-ar-status-is-unknown_breaker_x5_x6) (breaker-ar-status-is-auto_breaker_x5_x6) (breaker-ar-status-is-unknown_breaker_x7_x8) (breaker-ar-status-is-auto_breaker_x7_x8) (breaker-ar-status-is-unknown_breaker_x13_x14) (breaker-ar-status-is-auto_breaker_x13_x14) (breaker-ar-status-is-unknown_breaker_x15_x16) (breaker-ar-status-is-auto_breaker_x15_x16) (breaker-ar-status-is-unknown_breaker_x19_x20) (breaker-ar-status-is-auto_breaker_x19_x20) (breaker-ar-status-is-non-auto_breaker_x5_x6) (pending_obs359) (fault-count-2_count-as-fault_breaker_x5_x6_n0) (observed_obs359) (line-iso-state-may-have-changed_line_x27_x28_obs359) (dominates-2_hyp4_count-as-fault_breaker_x5_x6) (dominates-2_hyp2_count-as-fault_breaker_x5_x6) (pending_obs360) (fault-count-2_count-as-fault_breaker_x7_x8_n0) (observed_obs360) (dominates-2_hyp4_count-as-fault_breaker_x7_x8) (dominates-2_hyp3_count-as-fault_breaker_x7_x8) (dominates-2_hyp2_count-as-fault_breaker_x7_x8) (dominates-2_hyp1_count-as-fault_breaker_x7_x8) (pending_obs362) (fault-count-2_count-as-fault_breaker_x13_x14_n0) (observed_obs362) (pending_obs358) (fault-count-2_count-as-fault_breaker_x15_x16_n0) (observed_obs358) (dominates-2_hyp4_count-as-fault_breaker_x15_x16) (dominates-2_hyp3_count-as-fault_breaker_x15_x16) (pending_obs355) (fault-count-2_count-as-fault_breaker_x19_x20_n0) (observed_obs355) (dominates-2_hyp4_count-as-fault_breaker_x19_x20) (dominates-2_hyp3_count-as-fault_breaker_x19_x20) (dominates-2_hyp2_count-as-fault_breaker_x19_x20) (dominates-2_hyp1_count-as-fault_breaker_x19_x20) (pending_obs352) (fault-count-2_count-as-fault_breaker_x3_x4_n0) (observed_obs352) (pending_obs365) (fault-count-2_count-as-fault_breaker_x11_x12_n0) (observed_obs365) (dominates-2_hyp4_count-as-fault_breaker_x11_x12) (dominates-2_hyp3_count-as-fault_breaker_x11_x12) (dominates-2_hyp2_count-as-fault_breaker_x11_x12) (dominates-2_hyp1_count-as-fault_breaker_x11_x12) (pending_obs351) (breaker-commanded-closed_breaker_x3_x4_obs351) (observed_obs351) (pending_obs353) (fault-count-2_count-as-fault_bus_x21_n0) (observed_obs353) (dominates-2_hyp4_count-as-fault_bus_x21) (dominates-2_hyp3_count-as-fault_bus_x21) (dominates-2_hyp2_count-as-fault_bus_x21) (dominates-2_hyp1_count-as-fault_bus_x21) (pending_obs361) (fault-count-2_count-as-fault_bus_x22_n0) (observed_obs361) (dominates-2_hyp4_count-as-fault_bus_x22) (dominates-2_hyp3_count-as-fault_bus_x22) (dominates-2_hyp2_count-as-fault_bus_x22) (dominates-2_hyp1_count-as-fault_bus_x22) (pending_obs363) (fault-count-2_count-as-fault_bus_x24_n0) (observed_obs363) (dominates-2_hyp4_count-as-fault_bus_x24) (dominates-2_hyp3_count-as-fault_bus_x24) (dominates-2_hyp2_count-as-fault_bus_x24) (dominates-2_hyp1_count-as-fault_bus_x24) (pending_obs364) (fault-count-2_count-as-fault_bus_x25_n0) (observed_obs364) (dominates-2_hyp4_count-as-fault_bus_x25) (dominates-2_hyp3_count-as-fault_bus_x25) (dominates-2_hyp2_count-as-fault_bus_x25) (dominates-2_hyp1_count-as-fault_bus_x25) (pending_obs367) (fault-count-2_count-as-fault_bus_x23_n0) (observed_obs367) (dominates-2_hyp4_count-as-fault_bus_x23) (dominates-2_hyp3_count-as-fault_bus_x23) (dominates-2_hyp2_count-as-fault_bus_x23) (dominates-2_hyp1_count-as-fault_bus_x23) (pending_obs357) (fault-count-2_count-as-fault_bus_x15_n0) (observed_obs357) (bus-isolated_bus_x15) (generator-status-is-off_generator_x15_1) (bus-iso-state-changed_bus_x15_obs358) (fault-count-2_count-as-fault_line_x27_x28_n0) (not_line-isolated_line_x27_x28) (line-iso-trip-in-progress_line_x27_x28_obs359) (not_line-iso-trip-in-progress_line_x27_x28_obs359) (dominates-2_hyp3_count-as-fault_line_x27_x28) (dominates-2_hyp1_count-as-fault_line_x27_x28) (line-isolated_line_x27_x28) (pending_obs370) (fault-count-2_count-as-fault_line_x1_x2_n0) (observed_obs370) (dominates-2_hyp4_count-as-fault_line_x1_x2) (dominates-2_hyp3_count-as-fault_line_x1_x2) (dominates-2_hyp2_count-as-fault_line_x1_x2) (dominates-2_hyp1_count-as-fault_line_x1_x2) (pending_obs354) (fault-count-2_count-as-fault_line_x17_x18_n0) (observed_obs354) (dominates-2_hyp4_count-as-fault_line_x17_x18) (dominates-2_hyp3_count-as-fault_line_x17_x18) (dominates-2_hyp2_count-as-fault_line_x17_x18) (dominates-2_hyp1_count-as-fault_line_x17_x18) (pending_obs366) (fault-count-2_count-as-fault_line_x9_x10_n0) (observed_obs366) (dominates-2_hyp4_count-as-fault_line_x9_x10) (dominates-2_hyp3_count-as-fault_line_x9_x10) (dominates-2_hyp2_count-as-fault_line_x9_x10) (dominates-2_hyp1_count-as-fault_line_x9_x10) (generator-status-is-unknown_generator_x13_1) (generator-status-is-on_generator_x13_1) (generator-status-is-unknown_generator_x15_1) (generator-status-is-on_generator_x15_1) (generator-status-is-unknown_generator_x26_1) (generator-status-is-on_generator_x26_1) (generator-status-is-off_generator_x13_1) (generator-status-is-off_generator_x26_1) (fault-count-2_count-as-fault_generator_x13_1_n0) (generator-status-is-shutting-down_generator_x13_1) (dominates-2_hyp4_count-as-fault_generator_x13_1) (dominates-2_hyp3_count-as-fault_generator_x13_1) (dominates-2_hyp2_count-as-fault_generator_x13_1) (dominates-2_hyp1_count-as-fault_generator_x13_1) (fault-count-2_count-as-fault_generator_x15_1_n0) (generator-status-is-shutting-down_generator_x15_1) (dominates-2_hyp2_count-as-fault_generator_x15_1) (dominates-2_hyp1_count-as-fault_generator_x15_1) (fault-count-2_count-as-fault_generator_x26_1_n0) (generator-status-is-shutting-down_generator_x26_1) (pending_obs356) (observed_obs356) (generator-status-is-starting-up_generator_x13_1) (generator-status-is-starting-up_generator_x15_1) (generator-status-is-starting-up_generator_x26_1) (pending_obs368) (observed_obs368) (pending_obs369) (observed_obs369) (future_obs352) (future_obs353) (future_obs354) (future_obs355) (future_obs356) (future_obs357) (future_obs358) (future_obs359) (future_obs360) (future_obs361) (future_obs362) (future_obs363) (future_obs364) (future_obs365) (future_obs366) (future_obs367) (future_obs368) (future_obs369) (future_obs370) (not_at_end_constraint0) (achieved_constraint0) (not_at_end_constraint1) (achieved_constraint1) (not_at_end_constraint2) (achieved_constraint2) (not_at_end_constraint3) (achieved_constraint3) (static-true))
 (:action breaker-init-state-was-open_breaker_x3_x4
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x3_x4) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-state-is-open_breaker_x3_x4) (not (breaker-state-is-unknown_breaker_x3_x4))))
 (:action breaker-init-state-was-open_breaker_x5_x6
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x5_x6) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-state-is-open_breaker_x5_x6) (not (breaker-state-is-unknown_breaker_x5_x6))))
 (:action breaker-init-state-was-open_breaker_x11_x12
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x11_x12) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-state-is-open_breaker_x11_x12) (not (breaker-state-is-unknown_breaker_x11_x12))))
 (:action breaker-init-state-was-open_breaker_x29_x30
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x29_x30) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-state-is-open_breaker_x29_x30) (not (breaker-state-is-unknown_breaker_x29_x30))))
 (:action breaker-init-state-was-open_breaker_x31_x32
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x31_x32) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-state-is-open_breaker_x31_x32) (not (breaker-state-is-unknown_breaker_x31_x32))))
 (:action breaker-init-state-was-closed_breaker_x5_x6
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x5_x6) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-state-is-closed_breaker_x5_x6) (not (breaker-state-is-unknown_breaker_x5_x6))))
 (:action breaker-init-state-was-closed_breaker_x7_x8
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x7_x8) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-state-is-closed_breaker_x7_x8) (not (breaker-state-is-unknown_breaker_x7_x8))))
 (:action breaker-init-state-was-closed_breaker_x13_x14
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x13_x14) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-state-is-closed_breaker_x13_x14) (not (breaker-state-is-unknown_breaker_x13_x14))))
 (:action breaker-init-state-was-closed_breaker_x15_x16
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x15_x16) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-state-is-closed_breaker_x15_x16) (not (breaker-state-is-unknown_breaker_x15_x16))))
 (:action breaker-init-state-was-closed_breaker_x19_x20
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x19_x20) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-state-is-closed_breaker_x19_x20) (not (breaker-state-is-unknown_breaker_x19_x20))))
 (:action breaker-init-state-was-closed_breaker_x29_x30
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x29_x30) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-state-is-closed_breaker_x29_x30) (not (breaker-state-is-unknown_breaker_x29_x30))))
 (:action breaker-init-state-was-closed_breaker_x31_x32
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x31_x32) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-state-is-closed_breaker_x31_x32) (not (breaker-state-is-unknown_breaker_x31_x32))))
 (:action breaker-init-ar-status-was-auto_breaker_x5_x6
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x5_x6) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-ar-status-is-auto_breaker_x5_x6) (not (breaker-ar-status-is-unknown_breaker_x5_x6))))
 (:action breaker-init-ar-status-was-auto_breaker_x7_x8
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x7_x8) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-ar-status-is-auto_breaker_x7_x8) (not (breaker-ar-status-is-unknown_breaker_x7_x8))))
 (:action breaker-init-ar-status-was-auto_breaker_x13_x14
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x13_x14) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-ar-status-is-auto_breaker_x13_x14) (not (breaker-ar-status-is-unknown_breaker_x13_x14))))
 (:action breaker-init-ar-status-was-auto_breaker_x15_x16
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x15_x16) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-ar-status-is-auto_breaker_x15_x16) (not (breaker-ar-status-is-unknown_breaker_x15_x16))))
 (:action breaker-init-ar-status-was-auto_breaker_x19_x20
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x19_x20) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-ar-status-is-auto_breaker_x19_x20) (not (breaker-ar-status-is-unknown_breaker_x19_x20))))
 (:action breaker-init-ar-status-was-non-auto_breaker_x5_x6
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x5_x6) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-ar-status-is-non-auto_breaker_x5_x6) (not (breaker-ar-status-is-unknown_breaker_x5_x6))))
 (:action breaker-open-unexplained_breaker_x5_x6_obs359_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x5_x6) (pending_obs359) (fault-count-2_count-as-fault_breaker_x5_x6_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-state-is-open_breaker_x5_x6) (observed_obs359) (line-iso-state-may-have-changed_line_x27_x28_obs359) (not (breaker-state-is-closed_breaker_x5_x6)) (not (pending_obs359)) (not (fault-count-2_count-as-fault_breaker_x5_x6_n0)) (not (dominates-2_hyp4_count-as-fault_breaker_x5_x6)) (not (dominates-2_hyp2_count-as-fault_breaker_x5_x6))))
 (:action breaker-open-unexplained_breaker_x7_x8_obs360_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x7_x8) (pending_obs360) (fault-count-2_count-as-fault_breaker_x7_x8_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (observed_obs360) (not (breaker-state-is-closed_breaker_x7_x8)) (not (pending_obs360)) (not (fault-count-2_count-as-fault_breaker_x7_x8_n0)) (not (dominates-2_hyp4_count-as-fault_breaker_x7_x8)) (not (dominates-2_hyp3_count-as-fault_breaker_x7_x8)) (not (dominates-2_hyp2_count-as-fault_breaker_x7_x8)) (not (dominates-2_hyp1_count-as-fault_breaker_x7_x8))))
 (:action breaker-open-unexplained_breaker_x13_x14_obs362_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x13_x14) (pending_obs362) (fault-count-2_count-as-fault_breaker_x13_x14_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (observed_obs362) (not (breaker-state-is-closed_breaker_x13_x14)) (not (pending_obs362)) (not (fault-count-2_count-as-fault_breaker_x13_x14_n0))))
 (:action breaker-open-unexplained_breaker_x15_x16_obs358_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x15_x16) (pending_obs358) (fault-count-2_count-as-fault_breaker_x15_x16_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (observed_obs358) (not (breaker-state-is-closed_breaker_x15_x16)) (not (pending_obs358)) (not (fault-count-2_count-as-fault_breaker_x15_x16_n0)) (not (dominates-2_hyp4_count-as-fault_breaker_x15_x16)) (not (dominates-2_hyp3_count-as-fault_breaker_x15_x16))))
 (:action breaker-open-unexplained_breaker_x19_x20_obs355_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x19_x20) (pending_obs355) (fault-count-2_count-as-fault_breaker_x19_x20_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (observed_obs355) (not (breaker-state-is-closed_breaker_x19_x20)) (not (pending_obs355)) (not (fault-count-2_count-as-fault_breaker_x19_x20_n0)) (not (dominates-2_hyp4_count-as-fault_breaker_x19_x20)) (not (dominates-2_hyp3_count-as-fault_breaker_x19_x20)) (not (dominates-2_hyp2_count-as-fault_breaker_x19_x20)) (not (dominates-2_hyp1_count-as-fault_breaker_x19_x20))))
 (:action breaker-trip-unexplained_breaker_x5_x6_obs359_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x5_x6) (breaker-ar-status-is-auto_breaker_x5_x6) (pending_obs359) (fault-count-2_count-as-fault_breaker_x5_x6_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-state-is-open_breaker_x5_x6) (observed_obs359) (line-iso-state-may-have-changed_line_x27_x28_obs359) (not (breaker-state-is-closed_breaker_x5_x6)) (not (pending_obs359)) (not (fault-count-2_count-as-fault_breaker_x5_x6_n0)) (not (dominates-2_hyp4_count-as-fault_breaker_x5_x6)) (not (dominates-2_hyp2_count-as-fault_breaker_x5_x6))))
 (:action breaker-trip-unexplained_breaker_x7_x8_obs360_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x7_x8) (breaker-ar-status-is-auto_breaker_x7_x8) (pending_obs360) (fault-count-2_count-as-fault_breaker_x7_x8_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (observed_obs360) (not (breaker-state-is-closed_breaker_x7_x8)) (not (pending_obs360)) (not (fault-count-2_count-as-fault_breaker_x7_x8_n0)) (not (dominates-2_hyp4_count-as-fault_breaker_x7_x8)) (not (dominates-2_hyp3_count-as-fault_breaker_x7_x8)) (not (dominates-2_hyp2_count-as-fault_breaker_x7_x8)) (not (dominates-2_hyp1_count-as-fault_breaker_x7_x8))))
 (:action breaker-trip-unexplained_breaker_x13_x14_obs362_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x13_x14) (breaker-ar-status-is-auto_breaker_x13_x14) (pending_obs362) (fault-count-2_count-as-fault_breaker_x13_x14_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (observed_obs362) (not (breaker-state-is-closed_breaker_x13_x14)) (not (pending_obs362)) (not (fault-count-2_count-as-fault_breaker_x13_x14_n0))))
 (:action breaker-trip-unexplained_breaker_x15_x16_obs358_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x15_x16) (breaker-ar-status-is-auto_breaker_x15_x16) (pending_obs358) (fault-count-2_count-as-fault_breaker_x15_x16_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (observed_obs358) (not (breaker-state-is-closed_breaker_x15_x16)) (not (pending_obs358)) (not (fault-count-2_count-as-fault_breaker_x15_x16_n0)) (not (dominates-2_hyp4_count-as-fault_breaker_x15_x16)) (not (dominates-2_hyp3_count-as-fault_breaker_x15_x16))))
 (:action breaker-trip-unexplained_breaker_x19_x20_obs355_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x19_x20) (breaker-ar-status-is-auto_breaker_x19_x20) (pending_obs355) (fault-count-2_count-as-fault_breaker_x19_x20_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (observed_obs355) (not (breaker-state-is-closed_breaker_x19_x20)) (not (pending_obs355)) (not (fault-count-2_count-as-fault_breaker_x19_x20_n0)) (not (dominates-2_hyp4_count-as-fault_breaker_x19_x20)) (not (dominates-2_hyp3_count-as-fault_breaker_x19_x20)) (not (dominates-2_hyp2_count-as-fault_breaker_x19_x20)) (not (dominates-2_hyp1_count-as-fault_breaker_x19_x20))))
 (:action breaker-close-unexplained_breaker_x3_x4_obs352_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x3_x4) (pending_obs352) (fault-count-2_count-as-fault_breaker_x3_x4_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (observed_obs352) (not (breaker-state-is-open_breaker_x3_x4)) (not (pending_obs352)) (not (fault-count-2_count-as-fault_breaker_x3_x4_n0))))
 (:action breaker-close-unexplained_breaker_x11_x12_obs365_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x11_x12) (pending_obs365) (fault-count-2_count-as-fault_breaker_x11_x12_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (observed_obs365) (not (breaker-state-is-open_breaker_x11_x12)) (not (pending_obs365)) (not (fault-count-2_count-as-fault_breaker_x11_x12_n0)) (not (dominates-2_hyp4_count-as-fault_breaker_x11_x12)) (not (dominates-2_hyp3_count-as-fault_breaker_x11_x12)) (not (dominates-2_hyp2_count-as-fault_breaker_x11_x12)) (not (dominates-2_hyp1_count-as-fault_breaker_x11_x12))))
 (:action breaker-command-close_breaker_x3_x4_obs351
  :parameters ()
  :precondition (and (pending_obs351) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-commanded-closed_breaker_x3_x4_obs351) (observed_obs351) (not (pending_obs351))))
 (:action breaker-close-on-command_breaker_x3_x4_obs352_obs351
  :parameters ()
  :precondition (and (pending_obs352) (breaker-commanded-closed_breaker_x3_x4_obs351) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (observed_obs352) (not (breaker-state-is-unknown_breaker_x3_x4)) (not (breaker-state-is-open_breaker_x3_x4)) (not (pending_obs352))))
 (:action bus-voltage-goes-low-unexplained_bus_x21_low_obs353_n0_n1
  :parameters ()
  :precondition (and (pending_obs353) (fault-count-2_count-as-fault_bus_x21_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (observed_obs353) (not (pending_obs353)) (not (fault-count-2_count-as-fault_bus_x21_n0)) (not (dominates-2_hyp4_count-as-fault_bus_x21)) (not (dominates-2_hyp3_count-as-fault_bus_x21)) (not (dominates-2_hyp2_count-as-fault_bus_x21)) (not (dominates-2_hyp1_count-as-fault_bus_x21))))
 (:action bus-voltage-goes-high-unexplained_bus_x22_high_obs361_n0_n1
  :parameters ()
  :precondition (and (pending_obs361) (fault-count-2_count-as-fault_bus_x22_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (observed_obs361) (not (pending_obs361)) (not (fault-count-2_count-as-fault_bus_x22_n0)) (not (dominates-2_hyp4_count-as-fault_bus_x22)) (not (dominates-2_hyp3_count-as-fault_bus_x22)) (not (dominates-2_hyp2_count-as-fault_bus_x22)) (not (dominates-2_hyp1_count-as-fault_bus_x22))))
 (:action bus-voltage-goes-normal-unexplained_bus_x24_obs363_n0_n1
  :parameters ()
  :precondition (and (pending_obs363) (fault-count-2_count-as-fault_bus_x24_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (observed_obs363) (not (pending_obs363)) (not (fault-count-2_count-as-fault_bus_x24_n0)) (not (dominates-2_hyp4_count-as-fault_bus_x24)) (not (dominates-2_hyp3_count-as-fault_bus_x24)) (not (dominates-2_hyp2_count-as-fault_bus_x24)) (not (dominates-2_hyp1_count-as-fault_bus_x24))))
 (:action bus-voltage-goes-normal-unexplained_bus_x25_obs364_n0_n1
  :parameters ()
  :precondition (and (pending_obs364) (fault-count-2_count-as-fault_bus_x25_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (observed_obs364) (not (pending_obs364)) (not (fault-count-2_count-as-fault_bus_x25_n0)) (not (dominates-2_hyp4_count-as-fault_bus_x25)) (not (dominates-2_hyp3_count-as-fault_bus_x25)) (not (dominates-2_hyp2_count-as-fault_bus_x25)) (not (dominates-2_hyp1_count-as-fault_bus_x25))))
 (:action bus-mw-goes-normal-unexplained_bus_x23_obs367_n0_n1
  :parameters ()
  :precondition (and (pending_obs367) (fault-count-2_count-as-fault_bus_x23_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (observed_obs367) (not (pending_obs367)) (not (fault-count-2_count-as-fault_bus_x23_n0)) (not (dominates-2_hyp4_count-as-fault_bus_x23)) (not (dominates-2_hyp3_count-as-fault_bus_x23)) (not (dominates-2_hyp2_count-as-fault_bus_x23)) (not (dominates-2_hyp1_count-as-fault_bus_x23))))
 (:action bus-mw-goes-to-zero-unexplained_bus_x15_obs357_n0_n1
  :parameters ()
  :precondition (and (pending_obs357) (fault-count-2_count-as-fault_bus_x15_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (observed_obs357) (not (pending_obs357)) (not (fault-count-2_count-as-fault_bus_x15_n0))))
 (:action bus-mw-goes-to-zero-when-isolated_bus_x15_obs357_obs358
  :parameters ()
  :precondition (and (pending_obs357) (bus-isolated_bus_x15) (generator-status-is-off_generator_x15_1) (bus-iso-state-changed_bus_x15_obs358) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (observed_obs357) (not (pending_obs357))))
 (:action line-iso-trip-first-breaker-simple-trip-1_line_x27_x28_breaker_x5_x6_breaker_x5_x6_obs359_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x5_x6) (breaker-ar-status-is-auto_breaker_x5_x6) (pending_obs359) (fault-count-2_count-as-fault_line_x27_x28_n0) (not_line-isolated_line_x27_x28) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-state-is-open_breaker_x5_x6) (observed_obs359) (line-iso-trip-in-progress_line_x27_x28_obs359) (not (breaker-state-is-closed_breaker_x5_x6)) (not (pending_obs359)) (not (fault-count-2_count-as-fault_line_x27_x28_n0)) (not (not_line-iso-trip-in-progress_line_x27_x28_obs359)) (not (dominates-2_hyp3_count-as-fault_line_x27_x28)) (not (dominates-2_hyp1_count-as-fault_line_x27_x28))))
 (:action line-iso-trip-first-breaker-simple-trip-2_line_x27_x28_breaker_x5_x6_breaker_x5_x6_obs359_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x5_x6) (breaker-ar-status-is-non-auto_breaker_x5_x6) (pending_obs359) (fault-count-2_count-as-fault_line_x27_x28_n0) (not_line-isolated_line_x27_x28) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-state-is-open_breaker_x5_x6) (observed_obs359) (line-iso-trip-in-progress_line_x27_x28_obs359) (not (breaker-state-is-closed_breaker_x5_x6)) (not (pending_obs359)) (not (fault-count-2_count-as-fault_line_x27_x28_n0)) (not (not_line-iso-trip-in-progress_line_x27_x28_obs359)) (not (dominates-2_hyp3_count-as-fault_line_x27_x28)) (not (dominates-2_hyp1_count-as-fault_line_x27_x28))))
 (:action line-finish-iso-trip-3_line_x27_x28_breaker_x5_x6_breaker_x29_x30_breaker_x31_x32_obs359
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x5_x6) (breaker-state-is-open_breaker_x29_x30) (breaker-state-is-open_breaker_x31_x32) (line-iso-trip-in-progress_line_x27_x28_obs359) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (not_line-iso-trip-in-progress_line_x27_x28_obs359) (line-isolated_line_x27_x28) (not (not_line-isolated_line_x27_x28)) (not (line-iso-trip-in-progress_line_x27_x28_obs359))))
 (:action line-set-state-isolated-3_line_x27_x28_breaker_x5_x6_breaker_x29_x30_breaker_x31_x32_obs359
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x5_x6) (breaker-state-is-open_breaker_x29_x30) (breaker-state-is-open_breaker_x31_x32) (line-iso-state-may-have-changed_line_x27_x28_obs359) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (line-isolated_line_x27_x28) (not (not_line-isolated_line_x27_x28))))
 (:action line-init-state-isolated-3_line_x27_x28_breaker_x5_x6_breaker_x29_x30_breaker_x31_x32
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x5_x6) (breaker-state-is-open_breaker_x29_x30) (breaker-state-is-open_breaker_x31_x32) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (line-isolated_line_x27_x28) (not (not_line-isolated_line_x27_x28))))
 (:action line-voltage-goes-to-zero-unexplained-1_line_x1_x2_obs370_n0_n1
  :parameters ()
  :precondition (and (pending_obs370) (fault-count-2_count-as-fault_line_x1_x2_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (observed_obs370) (not (pending_obs370)) (not (fault-count-2_count-as-fault_line_x1_x2_n0)) (not (dominates-2_hyp4_count-as-fault_line_x1_x2)) (not (dominates-2_hyp3_count-as-fault_line_x1_x2)) (not (dominates-2_hyp2_count-as-fault_line_x1_x2)) (not (dominates-2_hyp1_count-as-fault_line_x1_x2))))
 (:action line-voltage-goes-to-zero-unexplained-1_line_x17_x18_obs354_n0_n1
  :parameters ()
  :precondition (and (pending_obs354) (fault-count-2_count-as-fault_line_x17_x18_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (observed_obs354) (not (pending_obs354)) (not (fault-count-2_count-as-fault_line_x17_x18_n0)) (not (dominates-2_hyp4_count-as-fault_line_x17_x18)) (not (dominates-2_hyp3_count-as-fault_line_x17_x18)) (not (dominates-2_hyp2_count-as-fault_line_x17_x18)) (not (dominates-2_hyp1_count-as-fault_line_x17_x18))))
 (:action line-mw-goes-normal-unexplained-1_line_x9_x10_obs366_n0_n1
  :parameters ()
  :precondition (and (pending_obs366) (fault-count-2_count-as-fault_line_x9_x10_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (observed_obs366) (not (pending_obs366)) (not (fault-count-2_count-as-fault_line_x9_x10_n0)) (not (dominates-2_hyp4_count-as-fault_line_x9_x10)) (not (dominates-2_hyp3_count-as-fault_line_x9_x10)) (not (dominates-2_hyp2_count-as-fault_line_x9_x10)) (not (dominates-2_hyp1_count-as-fault_line_x9_x10))))
 (:action generator-init-status-was-on_generator_x13_1
  :parameters ()
  :precondition (and (generator-status-is-unknown_generator_x13_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (generator-status-is-on_generator_x13_1) (not (generator-status-is-unknown_generator_x13_1))))
 (:action generator-init-status-was-on_generator_x15_1
  :parameters ()
  :precondition (and (generator-status-is-unknown_generator_x15_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (generator-status-is-on_generator_x15_1) (not (generator-status-is-unknown_generator_x15_1))))
 (:action generator-init-status-was-on_generator_x26_1
  :parameters ()
  :precondition (and (generator-status-is-unknown_generator_x26_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (generator-status-is-on_generator_x26_1) (not (generator-status-is-unknown_generator_x26_1))))
 (:action generator-init-status-was-off_generator_x13_1
  :parameters ()
  :precondition (and (generator-status-is-unknown_generator_x13_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (generator-status-is-off_generator_x13_1) (not (generator-status-is-unknown_generator_x13_1))))
 (:action generator-init-status-was-off_generator_x15_1
  :parameters ()
  :precondition (and (generator-status-is-unknown_generator_x15_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (generator-status-is-off_generator_x15_1) (not (generator-status-is-unknown_generator_x15_1))))
 (:action generator-init-status-was-off_generator_x26_1
  :parameters ()
  :precondition (and (generator-status-is-unknown_generator_x26_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (generator-status-is-off_generator_x26_1) (not (generator-status-is-unknown_generator_x26_1))))
 (:action generator-begin-shutdown_generator_x13_1_n0_n1
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x13_1) (fault-count-2_count-as-fault_generator_x13_1_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (generator-status-is-shutting-down_generator_x13_1) (not (generator-status-is-on_generator_x13_1)) (not (fault-count-2_count-as-fault_generator_x13_1_n0)) (not (dominates-2_hyp4_count-as-fault_generator_x13_1)) (not (dominates-2_hyp3_count-as-fault_generator_x13_1)) (not (dominates-2_hyp2_count-as-fault_generator_x13_1)) (not (dominates-2_hyp1_count-as-fault_generator_x13_1))))
 (:action generator-begin-shutdown_generator_x15_1_n0_n1
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x15_1) (fault-count-2_count-as-fault_generator_x15_1_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (generator-status-is-shutting-down_generator_x15_1) (not (generator-status-is-on_generator_x15_1)) (not (fault-count-2_count-as-fault_generator_x15_1_n0)) (not (dominates-2_hyp2_count-as-fault_generator_x15_1)) (not (dominates-2_hyp1_count-as-fault_generator_x15_1))))
 (:action generator-begin-shutdown_generator_x26_1_n0_n1
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x26_1) (fault-count-2_count-as-fault_generator_x26_1_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (generator-status-is-shutting-down_generator_x26_1) (not (generator-status-is-on_generator_x26_1)) (not (fault-count-2_count-as-fault_generator_x26_1_n0))))
 (:action generator-shutdown-breaker-open-breaker-open_generator_x13_1_breaker_x13_x14_bus_x13_breaker_x13_x14_obs362
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x13_x14) (pending_obs362) (generator-status-is-shutting-down_generator_x13_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (observed_obs362) (not (breaker-state-is-closed_breaker_x13_x14)) (not (pending_obs362))))
 (:action generator-shutdown-breaker-open-breaker-open_generator_x15_1_breaker_x15_x16_bus_x15_breaker_x15_x16_obs358
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x15_x16) (pending_obs358) (generator-status-is-shutting-down_generator_x15_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (observed_obs358) (bus-isolated_bus_x15) (bus-iso-state-changed_bus_x15_obs358) (not (breaker-state-is-closed_breaker_x15_x16)) (not (pending_obs358))))
 (:action generator-shutdown-turn-off_generator_x13_1_obs356
  :parameters ()
  :precondition (and (generator-status-is-shutting-down_generator_x13_1) (pending_obs356) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (observed_obs356) (not (pending_obs356))))
 (:action generator-shutdown-complete_generator_x13_1
  :parameters ()
  :precondition (and (generator-status-is-shutting-down_generator_x13_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (generator-status-is-off_generator_x13_1) (not (generator-status-is-shutting-down_generator_x13_1))))
 (:action generator-shutdown-complete_generator_x15_1
  :parameters ()
  :precondition (and (generator-status-is-shutting-down_generator_x15_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (generator-status-is-off_generator_x15_1) (not (generator-status-is-shutting-down_generator_x15_1))))
 (:action generator-shutdown-complete_generator_x26_1
  :parameters ()
  :precondition (and (generator-status-is-shutting-down_generator_x26_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (generator-status-is-off_generator_x26_1) (not (generator-status-is-shutting-down_generator_x26_1))))
 (:action generator-begin-startup_generator_x13_1_n0_n1
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x13_1) (fault-count-2_count-as-fault_generator_x13_1_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (generator-status-is-starting-up_generator_x13_1) (not (generator-status-is-on_generator_x13_1)) (not (fault-count-2_count-as-fault_generator_x13_1_n0)) (not (dominates-2_hyp4_count-as-fault_generator_x13_1)) (not (dominates-2_hyp3_count-as-fault_generator_x13_1)) (not (dominates-2_hyp2_count-as-fault_generator_x13_1)) (not (dominates-2_hyp1_count-as-fault_generator_x13_1))))
 (:action generator-begin-startup_generator_x15_1_n0_n1
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x15_1) (fault-count-2_count-as-fault_generator_x15_1_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (generator-status-is-starting-up_generator_x15_1) (not (generator-status-is-on_generator_x15_1)) (not (fault-count-2_count-as-fault_generator_x15_1_n0)) (not (dominates-2_hyp2_count-as-fault_generator_x15_1)) (not (dominates-2_hyp1_count-as-fault_generator_x15_1))))
 (:action generator-begin-startup_generator_x26_1_n0_n1
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x26_1) (fault-count-2_count-as-fault_generator_x26_1_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (generator-status-is-starting-up_generator_x26_1) (not (generator-status-is-on_generator_x26_1)) (not (fault-count-2_count-as-fault_generator_x26_1_n0))))
 (:action generator-startup-complete_generator_x13_1
  :parameters ()
  :precondition (and (generator-status-is-starting-up_generator_x13_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (generator-status-is-on_generator_x13_1) (not (generator-status-is-starting-up_generator_x13_1))))
 (:action generator-startup-complete_generator_x15_1
  :parameters ()
  :precondition (and (generator-status-is-starting-up_generator_x15_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (generator-status-is-on_generator_x15_1) (not (generator-status-is-starting-up_generator_x15_1))))
 (:action generator-startup-complete_generator_x26_1
  :parameters ()
  :precondition (and (generator-status-is-starting-up_generator_x26_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (generator-status-is-on_generator_x26_1) (not (generator-status-is-starting-up_generator_x26_1))))
 (:action generator-runback-alarm-reset_generator_x15_1_obs368_n0_n1
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x15_1_n0) (pending_obs368) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (observed_obs368) (not (fault-count-2_count-as-fault_generator_x15_1_n0)) (not (dominates-2_hyp2_count-as-fault_generator_x15_1)) (not (dominates-2_hyp1_count-as-fault_generator_x15_1)) (not (pending_obs368))))
 (:action generator-runback-alarm-reset_generator_x26_1_obs369_n0_n1
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x26_1_n0) (pending_obs369) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (observed_obs369) (not (fault-count-2_count-as-fault_generator_x26_1_n0)) (not (pending_obs369))))
 (:action generator-runback-reset-when-off_generator_x15_1_obs368
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x15_1) (pending_obs368) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (observed_obs368) (not (pending_obs368))))
 (:action generator-runback-reset-when-off_generator_x26_1_obs369
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x26_1) (pending_obs369) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (observed_obs369) (not (pending_obs369))))
 (:action advance-to-obs_obs352
  :parameters ()
  :precondition (and (observed_obs351) (future_obs352) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (pending_obs352) (not (future_obs352))))
 (:action advance-to-obs_obs353
  :parameters ()
  :precondition (and (observed_obs352) (future_obs353) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (pending_obs353) (not (future_obs353))))
 (:action advance-to-obs_obs354
  :parameters ()
  :precondition (and (observed_obs352) (future_obs354) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (pending_obs354) (not (future_obs354))))
 (:action advance-to-obs_obs355
  :parameters ()
  :precondition (and (observed_obs353) (observed_obs354) (future_obs355) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (pending_obs355) (not (future_obs355))))
 (:action advance-to-obs_obs356
  :parameters ()
  :precondition (and (observed_obs353) (observed_obs354) (future_obs356) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (pending_obs356) (not (future_obs356))))
 (:action advance-to-obs_obs357
  :parameters ()
  :precondition (and (observed_obs355) (observed_obs356) (future_obs357) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (pending_obs357) (not (future_obs357))))
 (:action advance-to-obs_obs358
  :parameters ()
  :precondition (and (observed_obs355) (observed_obs356) (future_obs358) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (pending_obs358) (not (future_obs358))))
 (:action advance-to-obs_obs359
  :parameters ()
  :precondition (and (observed_obs355) (observed_obs356) (future_obs359) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (pending_obs359) (not (future_obs359))))
 (:action advance-to-obs_obs360
  :parameters ()
  :precondition (and (observed_obs359) (observed_obs358) (observed_obs357) (not_line-iso-trip-in-progress_line_x27_x28_obs359) (future_obs360) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (pending_obs360) (not (future_obs360))))
 (:action advance-to-obs_obs361
  :parameters ()
  :precondition (and (observed_obs360) (future_obs361) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (pending_obs361) (not (future_obs361))))
 (:action advance-to-obs_obs362
  :parameters ()
  :precondition (and (observed_obs361) (future_obs362) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (pending_obs362) (not (future_obs362))))
 (:action advance-to-obs_obs363
  :parameters ()
  :precondition (and (observed_obs362) (future_obs363) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (pending_obs363) (not (future_obs363))))
 (:action advance-to-obs_obs364
  :parameters ()
  :precondition (and (observed_obs363) (future_obs364) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (pending_obs364) (not (future_obs364))))
 (:action advance-to-obs_obs365
  :parameters ()
  :precondition (and (observed_obs364) (future_obs365) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (pending_obs365) (not (line-iso-state-may-have-changed_line_x27_x28_obs359)) (not (future_obs365))))
 (:action advance-to-obs_obs366
  :parameters ()
  :precondition (and (observed_obs365) (future_obs366) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (pending_obs366) (not (future_obs366))))
 (:action advance-to-obs_obs367
  :parameters ()
  :precondition (and (observed_obs365) (future_obs367) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (pending_obs367) (not (future_obs367))))
 (:action advance-to-obs_obs368
  :parameters ()
  :precondition (and (observed_obs367) (observed_obs366) (future_obs368) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (pending_obs368) (not (future_obs368))))
 (:action advance-to-obs_obs369
  :parameters ()
  :precondition (and (observed_obs368) (future_obs369) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (pending_obs369) (not (future_obs369))))
 (:action advance-to-obs_obs370
  :parameters ()
  :precondition (and (observed_obs369) (future_obs370) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (pending_obs370) (not (future_obs370))))
 (:action set_goal_0_constraint0
  :parameters ()
  :precondition (and (observed_obs359) (dominates-2_hyp4_count-as-fault_breaker_x5_x6) (observed_obs360) (observed_obs362) (observed_obs358) (observed_obs355) (observed_obs352) (observed_obs365) (observed_obs351) (observed_obs353) (observed_obs361) (observed_obs363) (observed_obs364) (observed_obs367) (observed_obs357) (observed_obs370) (observed_obs354) (observed_obs366) (observed_obs356) (observed_obs368) (observed_obs369) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (achieved_constraint0) (not (not_at_end_constraint0))))
 (:action set_goal_2_constraint0
  :parameters ()
  :precondition (and (observed_obs359) (observed_obs360) (observed_obs362) (observed_obs358) (dominates-2_hyp4_count-as-fault_breaker_x15_x16) (observed_obs355) (observed_obs352) (observed_obs365) (observed_obs351) (observed_obs353) (observed_obs361) (observed_obs363) (observed_obs364) (observed_obs367) (observed_obs357) (observed_obs370) (observed_obs354) (observed_obs366) (observed_obs356) (observed_obs368) (observed_obs369) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (achieved_constraint0) (not (not_at_end_constraint0))))
 (:action set_goal_1_constraint1
  :parameters ()
  :precondition (and (observed_obs359) (observed_obs360) (observed_obs362) (observed_obs358) (dominates-2_hyp3_count-as-fault_breaker_x15_x16) (observed_obs355) (observed_obs352) (observed_obs365) (observed_obs351) (observed_obs353) (observed_obs361) (observed_obs363) (observed_obs364) (observed_obs367) (observed_obs357) (observed_obs370) (observed_obs354) (observed_obs366) (observed_obs356) (observed_obs368) (observed_obs369) (achieved_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (achieved_constraint1) (not (not_at_end_constraint1))))
 (:action set_goal_9_constraint1
  :parameters ()
  :precondition (and (observed_obs359) (observed_obs360) (observed_obs362) (observed_obs358) (observed_obs355) (observed_obs352) (observed_obs365) (observed_obs351) (observed_obs353) (observed_obs361) (observed_obs363) (observed_obs364) (observed_obs367) (observed_obs357) (dominates-2_hyp3_count-as-fault_line_x27_x28) (observed_obs370) (observed_obs354) (observed_obs366) (observed_obs356) (observed_obs368) (observed_obs369) (achieved_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (achieved_constraint1) (not (not_at_end_constraint1))))
 (:action set_goal_0_constraint2
  :parameters ()
  :precondition (and (observed_obs359) (dominates-2_hyp2_count-as-fault_breaker_x5_x6) (observed_obs360) (observed_obs362) (observed_obs358) (observed_obs355) (observed_obs352) (observed_obs365) (observed_obs351) (observed_obs353) (observed_obs361) (observed_obs363) (observed_obs364) (observed_obs367) (observed_obs357) (observed_obs370) (observed_obs354) (observed_obs366) (observed_obs356) (observed_obs368) (observed_obs369) (achieved_constraint0) (achieved_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (achieved_constraint2) (not (not_at_end_constraint2))))
 (:action set_goal_13_constraint2
  :parameters ()
  :precondition (and (observed_obs359) (observed_obs360) (observed_obs362) (observed_obs358) (observed_obs355) (observed_obs352) (observed_obs365) (observed_obs351) (observed_obs353) (observed_obs361) (observed_obs363) (observed_obs364) (observed_obs367) (observed_obs357) (observed_obs370) (observed_obs354) (observed_obs366) (dominates-2_hyp2_count-as-fault_generator_x15_1) (observed_obs356) (observed_obs368) (observed_obs369) (achieved_constraint0) (achieved_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (achieved_constraint2) (not (not_at_end_constraint2))))
 (:action set_goal_8_constraint3
  :parameters ()
  :precondition (and (observed_obs359) (observed_obs360) (observed_obs362) (observed_obs358) (observed_obs355) (observed_obs352) (observed_obs365) (observed_obs351) (observed_obs353) (observed_obs361) (observed_obs363) (observed_obs364) (observed_obs367) (observed_obs357) (dominates-2_hyp1_count-as-fault_line_x27_x28) (observed_obs370) (observed_obs354) (observed_obs366) (observed_obs356) (observed_obs368) (observed_obs369) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (not_at_end_constraint3))
  :effect (and (achieved_constraint3) (not (not_at_end_constraint3))))
 (:action set_goal_13_constraint3
  :parameters ()
  :precondition (and (observed_obs359) (observed_obs360) (observed_obs362) (observed_obs358) (observed_obs355) (observed_obs352) (observed_obs365) (observed_obs351) (observed_obs353) (observed_obs361) (observed_obs363) (observed_obs364) (observed_obs367) (observed_obs357) (observed_obs370) (observed_obs354) (observed_obs366) (dominates-2_hyp1_count-as-fault_generator_x15_1) (observed_obs356) (observed_obs368) (observed_obs369) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (not_at_end_constraint3))
  :effect (and (achieved_constraint3) (not (not_at_end_constraint3))))
)
