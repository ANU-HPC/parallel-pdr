(define (domain appn-pls)
 (:requirements :strips :equality)
 (:predicates (breaker-state-is-unknown_breaker_x1_x2) (breaker-state-is-open_breaker_x1_x2) (breaker-state-is-unknown_breaker_x3_x4) (breaker-state-is-open_breaker_x3_x4) (breaker-state-is-unknown_breaker_x7_x8) (breaker-state-is-unknown_breaker_x9_x10) (breaker-state-is-unknown_breaker_x11_x12) (breaker-state-is-unknown_breaker_x13_x14) (breaker-state-is-unknown_breaker_x15_x16) (breaker-state-is-unknown_breaker_x21_x22) (breaker-state-is-open_breaker_x21_x22) (breaker-state-is-unknown_breaker_x23_x24) (breaker-state-is-open_breaker_x23_x24) (breaker-state-is-unknown_breaker_x25_x26) (breaker-state-is-open_breaker_x25_x26) (breaker-state-is-closed_breaker_x1_x2) (breaker-state-is-closed_breaker_x3_x4) (breaker-state-is-closed_breaker_x7_x8) (breaker-state-is-closed_breaker_x9_x10) (breaker-state-is-closed_breaker_x11_x12) (breaker-state-is-closed_breaker_x13_x14) (breaker-state-is-closed_breaker_x15_x16) (breaker-state-is-closed_breaker_x21_x22) (breaker-state-is-closed_breaker_x23_x24) (breaker-state-is-closed_breaker_x25_x26) (breaker-ar-status-is-unknown_breaker_x1_x2) (breaker-ar-status-is-auto_breaker_x1_x2) (breaker-ar-status-is-unknown_breaker_x3_x4) (breaker-ar-status-is-auto_breaker_x3_x4) (breaker-ar-status-is-unknown_breaker_x7_x8) (breaker-ar-status-is-auto_breaker_x7_x8) (breaker-ar-status-is-unknown_breaker_x9_x10) (breaker-ar-status-is-auto_breaker_x9_x10) (breaker-ar-status-is-unknown_breaker_x11_x12) (breaker-ar-status-is-auto_breaker_x11_x12) (breaker-ar-status-is-unknown_breaker_x13_x14) (breaker-ar-status-is-auto_breaker_x13_x14) (breaker-ar-status-is-unknown_breaker_x15_x16) (breaker-ar-status-is-auto_breaker_x15_x16) (breaker-ar-status-is-non-auto_breaker_x1_x2) (pending_obs2563) (fault-count-2_count-as-fault_breaker_x1_x2_n0) (observed_obs2563) (fault-count-2_count-as-fault_breaker_x1_x2_n1) (line-iso-state-may-have-changed_line_x19_x20_obs2563) (dominates-2_hyp10_count-as-fault_breaker_x1_x2) (dominates-2_hyp9_count-as-fault_breaker_x1_x2) (dominates-2_hyp6_count-as-fault_breaker_x1_x2) (dominates-2_hyp5_count-as-fault_breaker_x1_x2) (dominates-2_hyp4_count-as-fault_breaker_x1_x2) (dominates-2_hyp1_count-as-fault_breaker_x1_x2) (fault-count-2_count-as-fault_breaker_x1_x2_n2) (dominates-2_hyp11_count-as-fault_breaker_x1_x2) (dominates-2_hyp8_count-as-fault_breaker_x1_x2) (dominates-2_hyp7_count-as-fault_breaker_x1_x2) (dominates-2_hyp3_count-as-fault_breaker_x1_x2) (dominates-2_hyp2_count-as-fault_breaker_x1_x2) (pending_obs2546) (fault-count-2_count-as-fault_breaker_x3_x4_n0) (observed_obs2546) (fault-count-2_count-as-fault_breaker_x3_x4_n1) (dominates-2_hyp11_count-as-fault_breaker_x3_x4) (dominates-2_hyp10_count-as-fault_breaker_x3_x4) (dominates-2_hyp9_count-as-fault_breaker_x3_x4) (dominates-2_hyp8_count-as-fault_breaker_x3_x4) (dominates-2_hyp7_count-as-fault_breaker_x3_x4) (dominates-2_hyp6_count-as-fault_breaker_x3_x4) (dominates-2_hyp5_count-as-fault_breaker_x3_x4) (dominates-2_hyp4_count-as-fault_breaker_x3_x4) (dominates-2_hyp3_count-as-fault_breaker_x3_x4) (dominates-2_hyp2_count-as-fault_breaker_x3_x4) (dominates-2_hyp1_count-as-fault_breaker_x3_x4) (fault-count-2_count-as-fault_breaker_x3_x4_n2) (pending_obs2550) (fault-count-2_count-as-fault_breaker_x7_x8_n0) (observed_obs2550) (fault-count-2_count-as-fault_breaker_x7_x8_n1) (pending_obs2554) (fault-count-2_count-as-fault_breaker_x9_x10_n0) (observed_obs2554) (fault-count-2_count-as-fault_breaker_x9_x10_n1) (pending_obs2544) (fault-count-2_count-as-fault_breaker_x11_x12_n0) (observed_obs2544) (fault-count-2_count-as-fault_breaker_x11_x12_n1) (dominates-2_hyp9_count-as-fault_breaker_x11_x12) (dominates-2_hyp8_count-as-fault_breaker_x11_x12) (dominates-2_hyp5_count-as-fault_breaker_x11_x12) (pending_obs2561) (fault-count-2_count-as-fault_breaker_x13_x14_n0) (observed_obs2561) (fault-count-2_count-as-fault_breaker_x13_x14_n1) (pending_obs2556) (fault-count-2_count-as-fault_breaker_x15_x16_n0) (observed_obs2556) (fault-count-2_count-as-fault_breaker_x15_x16_n1) (dominates-2_hyp11_count-as-fault_breaker_x15_x16) (dominates-2_hyp10_count-as-fault_breaker_x15_x16) (dominates-2_hyp9_count-as-fault_breaker_x15_x16) (dominates-2_hyp4_count-as-fault_breaker_x15_x16) (dominates-2_hyp3_count-as-fault_breaker_x15_x16) (breaker-auto-reclose-wait_breaker_x1_x2_obs2563) (breaker-auto-reclose-wait_breaker_x3_x4_obs2546) (pending_obs2559) (observed_obs2559) (line-iso-state-may-have-changed_line_x19_x20_obs2559) (pending_obs2547) (observed_obs2547) (breaker-auto-reopen-wait_breaker_x3_x4_obs2547) (pending_obs2549) (fault-count-2_count-as-fault_bus_x3_n0) (observed_obs2549) (fault-count-2_count-as-fault_bus_x3_n1) (dominates-2_hyp11_count-as-fault_bus_x3) (dominates-2_hyp10_count-as-fault_bus_x3) (dominates-2_hyp9_count-as-fault_bus_x3) (dominates-2_hyp8_count-as-fault_bus_x3) (dominates-2_hyp7_count-as-fault_bus_x3) (dominates-2_hyp6_count-as-fault_bus_x3) (dominates-2_hyp5_count-as-fault_bus_x3) (dominates-2_hyp4_count-as-fault_bus_x3) (dominates-2_hyp3_count-as-fault_bus_x3) (dominates-2_hyp2_count-as-fault_bus_x3) (dominates-2_hyp1_count-as-fault_bus_x3) (pending_obs2551) (fault-count-2_count-as-fault_bus_x17_n0) (observed_obs2551) (fault-count-2_count-as-fault_bus_x17_n1) (dominates-2_hyp11_count-as-fault_bus_x17) (dominates-2_hyp10_count-as-fault_bus_x17) (dominates-2_hyp9_count-as-fault_bus_x17) (dominates-2_hyp8_count-as-fault_bus_x17) (dominates-2_hyp7_count-as-fault_bus_x17) (dominates-2_hyp6_count-as-fault_bus_x17) (dominates-2_hyp5_count-as-fault_bus_x17) (dominates-2_hyp4_count-as-fault_bus_x17) (dominates-2_hyp3_count-as-fault_bus_x17) (dominates-2_hyp2_count-as-fault_bus_x17) (dominates-2_hyp1_count-as-fault_bus_x17) (pending_obs2545) (fault-count-2_count-as-fault_bus_x12_n0) (observed_obs2545) (fault-count-2_count-as-fault_bus_x12_n1) (dominates-2_hyp4_count-as-fault_bus_x12) (dominates-2_hyp3_count-as-fault_bus_x12) (dominates-2_hyp2_count-as-fault_bus_x12) (dominates-2_hyp1_count-as-fault_bus_x12) (bus-isolated_bus_x12) (bus-iso-state-changed_bus_x12_obs2544) (generator-status-is-off_generator_x12_1) (fault-count-2_count-as-fault_line_x19_x20_n0) (not_line-isolated_line_x19_x20) (line-iso-trip-in-progress_line_x19_x20_obs2563) (fault-count-2_count-as-fault_line_x19_x20_n1) (dominates-2_hyp10_count-as-fault_line_x19_x20) (dominates-2_hyp9_count-as-fault_line_x19_x20) (dominates-2_hyp6_count-as-fault_line_x19_x20) (dominates-2_hyp5_count-as-fault_line_x19_x20) (dominates-2_hyp4_count-as-fault_line_x19_x20) (dominates-2_hyp1_count-as-fault_line_x19_x20) (line-isolated_line_x19_x20) (pending_obs2558) (fault-count-2_count-as-fault_line_x5_x6_n0) (observed_obs2558) (fault-count-2_count-as-fault_line_x5_x6_n1) (dominates-2_hyp11_count-as-fault_line_x5_x6) (dominates-2_hyp10_count-as-fault_line_x5_x6) (dominates-2_hyp9_count-as-fault_line_x5_x6) (dominates-2_hyp8_count-as-fault_line_x5_x6) (dominates-2_hyp7_count-as-fault_line_x5_x6) (dominates-2_hyp6_count-as-fault_line_x5_x6) (dominates-2_hyp5_count-as-fault_line_x5_x6) (dominates-2_hyp4_count-as-fault_line_x5_x6) (dominates-2_hyp3_count-as-fault_line_x5_x6) (dominates-2_hyp2_count-as-fault_line_x5_x6) (dominates-2_hyp1_count-as-fault_line_x5_x6) (generator-status-is-unknown_generator_x8_1) (generator-status-is-on_generator_x8_1) (generator-status-is-unknown_generator_x10_1) (generator-status-is-on_generator_x10_1) (generator-status-is-unknown_generator_x12_1) (generator-status-is-on_generator_x12_1) (generator-status-is-unknown_generator_x18_1) (generator-status-is-on_generator_x18_1) (generator-status-is-unknown_generator_x14_1) (generator-status-is-on_generator_x14_1) (generator-status-is-unknown_generator_x16_1) (generator-status-is-on_generator_x16_1) (generator-status-is-off_generator_x8_1) (generator-status-is-off_generator_x10_1) (generator-status-is-off_generator_x18_1) (generator-status-is-off_generator_x14_1) (generator-status-is-off_generator_x16_1) (fault-count-2_count-as-fault_generator_x8_1_n0) (generator-status-is-shutting-down_generator_x8_1) (fault-count-2_count-as-fault_generator_x8_1_n1) (fault-count-2_count-as-fault_generator_x8_1_n2) (dominates-2_hyp11_count-as-fault_generator_x8_1) (dominates-2_hyp10_count-as-fault_generator_x8_1) (dominates-2_hyp9_count-as-fault_generator_x8_1) (dominates-2_hyp8_count-as-fault_generator_x8_1) (dominates-2_hyp7_count-as-fault_generator_x8_1) (dominates-2_hyp6_count-as-fault_generator_x8_1) (dominates-2_hyp5_count-as-fault_generator_x8_1) (dominates-2_hyp4_count-as-fault_generator_x8_1) (dominates-2_hyp3_count-as-fault_generator_x8_1) (dominates-2_hyp2_count-as-fault_generator_x8_1) (dominates-2_hyp1_count-as-fault_generator_x8_1) (fault-count-2_count-as-fault_generator_x10_1_n0) (generator-status-is-shutting-down_generator_x10_1) (fault-count-2_count-as-fault_generator_x10_1_n1) (dominates-2_hyp11_count-as-fault_generator_x10_1) (dominates-2_hyp10_count-as-fault_generator_x10_1) (dominates-2_hyp9_count-as-fault_generator_x10_1) (dominates-2_hyp8_count-as-fault_generator_x10_1) (dominates-2_hyp7_count-as-fault_generator_x10_1) (dominates-2_hyp6_count-as-fault_generator_x10_1) (dominates-2_hyp5_count-as-fault_generator_x10_1) (dominates-2_hyp4_count-as-fault_generator_x10_1) (dominates-2_hyp3_count-as-fault_generator_x10_1) (dominates-2_hyp2_count-as-fault_generator_x10_1) (dominates-2_hyp1_count-as-fault_generator_x10_1) (fault-count-2_count-as-fault_generator_x10_1_n2) (fault-count-2_count-as-fault_generator_x12_1_n0) (generator-status-is-shutting-down_generator_x12_1) (fault-count-2_count-as-fault_generator_x12_1_n1) (dominates-2_hyp4_count-as-fault_generator_x12_1) (dominates-2_hyp3_count-as-fault_generator_x12_1) (dominates-2_hyp2_count-as-fault_generator_x12_1) (dominates-2_hyp1_count-as-fault_generator_x12_1) (fault-count-2_count-as-fault_generator_x12_1_n2) (dominates-2_hyp9_count-as-fault_generator_x12_1) (dominates-2_hyp8_count-as-fault_generator_x12_1) (dominates-2_hyp5_count-as-fault_generator_x12_1) (dominates-2_hyp11_count-as-fault_generator_x12_1) (dominates-2_hyp10_count-as-fault_generator_x12_1) (dominates-2_hyp7_count-as-fault_generator_x12_1) (dominates-2_hyp6_count-as-fault_generator_x12_1) (fault-count-2_count-as-fault_generator_x18_1_n0) (generator-status-is-shutting-down_generator_x18_1) (fault-count-2_count-as-fault_generator_x18_1_n1) (dominates-2_hyp11_count-as-fault_generator_x18_1) (dominates-2_hyp10_count-as-fault_generator_x18_1) (dominates-2_hyp9_count-as-fault_generator_x18_1) (dominates-2_hyp8_count-as-fault_generator_x18_1) (dominates-2_hyp7_count-as-fault_generator_x18_1) (dominates-2_hyp6_count-as-fault_generator_x18_1) (dominates-2_hyp5_count-as-fault_generator_x18_1) (dominates-2_hyp4_count-as-fault_generator_x18_1) (dominates-2_hyp3_count-as-fault_generator_x18_1) (dominates-2_hyp2_count-as-fault_generator_x18_1) (dominates-2_hyp1_count-as-fault_generator_x18_1) (fault-count-2_count-as-fault_generator_x18_1_n2) (fault-count-2_count-as-fault_generator_x14_1_n0) (generator-status-is-shutting-down_generator_x14_1) (fault-count-2_count-as-fault_generator_x14_1_n1) (dominates-2_hyp11_count-as-fault_generator_x14_1) (dominates-2_hyp10_count-as-fault_generator_x14_1) (dominates-2_hyp9_count-as-fault_generator_x14_1) (dominates-2_hyp8_count-as-fault_generator_x14_1) (dominates-2_hyp7_count-as-fault_generator_x14_1) (dominates-2_hyp6_count-as-fault_generator_x14_1) (dominates-2_hyp5_count-as-fault_generator_x14_1) (dominates-2_hyp4_count-as-fault_generator_x14_1) (dominates-2_hyp3_count-as-fault_generator_x14_1) (dominates-2_hyp2_count-as-fault_generator_x14_1) (dominates-2_hyp1_count-as-fault_generator_x14_1) (fault-count-2_count-as-fault_generator_x14_1_n2) (fault-count-2_count-as-fault_generator_x16_1_n0) (generator-status-is-shutting-down_generator_x16_1) (fault-count-2_count-as-fault_generator_x16_1_n1) (dominates-2_hyp8_count-as-fault_generator_x16_1) (dominates-2_hyp7_count-as-fault_generator_x16_1) (dominates-2_hyp6_count-as-fault_generator_x16_1) (dominates-2_hyp5_count-as-fault_generator_x16_1) (dominates-2_hyp2_count-as-fault_generator_x16_1) (dominates-2_hyp1_count-as-fault_generator_x16_1) (fault-count-2_count-as-fault_generator_x16_1_n2) (pending_obs2562) (observed_obs2562) (pending_obs2557) (observed_obs2557) (pending_obs2552) (observed_obs2552) (pending_obs2553) (observed_obs2553) (generator-status-is-starting-up_generator_x8_1) (generator-status-is-starting-up_generator_x10_1) (generator-status-is-starting-up_generator_x12_1) (generator-status-is-starting-up_generator_x18_1) (generator-status-is-starting-up_generator_x14_1) (generator-status-is-starting-up_generator_x16_1) (pending_obs2555) (observed_obs2555) (pending_obs2548) (observed_obs2548) (pending_obs2560) (observed_obs2560) (future_obs2545) (future_obs2546) (future_obs2547) (future_obs2548) (future_obs2549) (future_obs2550) (future_obs2551) (future_obs2552) (future_obs2553) (future_obs2554) (future_obs2555) (future_obs2556) (future_obs2557) (future_obs2558) (future_obs2559) (future_obs2560) (future_obs2561) (future_obs2562) (future_obs2563) (not_at_end_constraint0) (achieved_constraint0) (not_at_end_constraint1) (achieved_constraint1) (not_at_end_constraint2) (achieved_constraint2) (not_at_end_constraint3) (achieved_constraint3) (not_at_end_constraint4) (achieved_constraint4) (not_at_end_constraint5) (achieved_constraint5) (not_at_end_constraint6) (achieved_constraint6) (not_at_end_constraint7) (achieved_constraint7) (not_at_end_constraint8) (achieved_constraint8) (not_at_end_constraint9) (achieved_constraint9) (not_at_end_constraint10) (achieved_constraint10) (static-true))
 (:action breaker-init-state-was-open_breaker_x1_x2
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x1_x2) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (breaker-state-is-open_breaker_x1_x2) (not (breaker-state-is-unknown_breaker_x1_x2))))
 (:action breaker-init-state-was-open_breaker_x3_x4
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x3_x4) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (breaker-state-is-open_breaker_x3_x4) (not (breaker-state-is-unknown_breaker_x3_x4))))
 (:action breaker-init-state-was-open_breaker_x21_x22
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x21_x22) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (breaker-state-is-open_breaker_x21_x22) (not (breaker-state-is-unknown_breaker_x21_x22))))
 (:action breaker-init-state-was-open_breaker_x23_x24
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x23_x24) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (breaker-state-is-open_breaker_x23_x24) (not (breaker-state-is-unknown_breaker_x23_x24))))
 (:action breaker-init-state-was-open_breaker_x25_x26
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x25_x26) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (breaker-state-is-open_breaker_x25_x26) (not (breaker-state-is-unknown_breaker_x25_x26))))
 (:action breaker-init-state-was-closed_breaker_x1_x2
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x1_x2) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (breaker-state-is-closed_breaker_x1_x2) (not (breaker-state-is-unknown_breaker_x1_x2))))
 (:action breaker-init-state-was-closed_breaker_x3_x4
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x3_x4) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (breaker-state-is-closed_breaker_x3_x4) (not (breaker-state-is-unknown_breaker_x3_x4))))
 (:action breaker-init-state-was-closed_breaker_x7_x8
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x7_x8) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (breaker-state-is-closed_breaker_x7_x8) (not (breaker-state-is-unknown_breaker_x7_x8))))
 (:action breaker-init-state-was-closed_breaker_x9_x10
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x9_x10) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (breaker-state-is-closed_breaker_x9_x10) (not (breaker-state-is-unknown_breaker_x9_x10))))
 (:action breaker-init-state-was-closed_breaker_x11_x12
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x11_x12) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (breaker-state-is-closed_breaker_x11_x12) (not (breaker-state-is-unknown_breaker_x11_x12))))
 (:action breaker-init-state-was-closed_breaker_x13_x14
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x13_x14) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (breaker-state-is-closed_breaker_x13_x14) (not (breaker-state-is-unknown_breaker_x13_x14))))
 (:action breaker-init-state-was-closed_breaker_x15_x16
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x15_x16) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (breaker-state-is-closed_breaker_x15_x16) (not (breaker-state-is-unknown_breaker_x15_x16))))
 (:action breaker-init-state-was-closed_breaker_x21_x22
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x21_x22) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (breaker-state-is-closed_breaker_x21_x22) (not (breaker-state-is-unknown_breaker_x21_x22))))
 (:action breaker-init-state-was-closed_breaker_x23_x24
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x23_x24) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (breaker-state-is-closed_breaker_x23_x24) (not (breaker-state-is-unknown_breaker_x23_x24))))
 (:action breaker-init-state-was-closed_breaker_x25_x26
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x25_x26) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (breaker-state-is-closed_breaker_x25_x26) (not (breaker-state-is-unknown_breaker_x25_x26))))
 (:action breaker-init-ar-status-was-auto_breaker_x1_x2
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x1_x2) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (breaker-ar-status-is-auto_breaker_x1_x2) (not (breaker-ar-status-is-unknown_breaker_x1_x2))))
 (:action breaker-init-ar-status-was-auto_breaker_x3_x4
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x3_x4) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (breaker-ar-status-is-auto_breaker_x3_x4) (not (breaker-ar-status-is-unknown_breaker_x3_x4))))
 (:action breaker-init-ar-status-was-auto_breaker_x7_x8
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x7_x8) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (breaker-ar-status-is-auto_breaker_x7_x8) (not (breaker-ar-status-is-unknown_breaker_x7_x8))))
 (:action breaker-init-ar-status-was-auto_breaker_x9_x10
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x9_x10) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (breaker-ar-status-is-auto_breaker_x9_x10) (not (breaker-ar-status-is-unknown_breaker_x9_x10))))
 (:action breaker-init-ar-status-was-auto_breaker_x11_x12
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x11_x12) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (breaker-ar-status-is-auto_breaker_x11_x12) (not (breaker-ar-status-is-unknown_breaker_x11_x12))))
 (:action breaker-init-ar-status-was-auto_breaker_x13_x14
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x13_x14) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (breaker-ar-status-is-auto_breaker_x13_x14) (not (breaker-ar-status-is-unknown_breaker_x13_x14))))
 (:action breaker-init-ar-status-was-auto_breaker_x15_x16
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x15_x16) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (breaker-ar-status-is-auto_breaker_x15_x16) (not (breaker-ar-status-is-unknown_breaker_x15_x16))))
 (:action breaker-init-ar-status-was-non-auto_breaker_x1_x2
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x1_x2) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (breaker-ar-status-is-non-auto_breaker_x1_x2) (not (breaker-ar-status-is-unknown_breaker_x1_x2))))
 (:action breaker-open-unexplained_breaker_x1_x2_obs2563_n1_n2
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x1_x2) (pending_obs2563) (fault-count-2_count-as-fault_breaker_x1_x2_n1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (breaker-state-is-open_breaker_x1_x2) (observed_obs2563) (line-iso-state-may-have-changed_line_x19_x20_obs2563) (fault-count-2_count-as-fault_breaker_x1_x2_n2) (not (breaker-state-is-closed_breaker_x1_x2)) (not (pending_obs2563)) (not (fault-count-2_count-as-fault_breaker_x1_x2_n1)) (not (dominates-2_hyp11_count-as-fault_breaker_x1_x2)) (not (dominates-2_hyp8_count-as-fault_breaker_x1_x2)) (not (dominates-2_hyp7_count-as-fault_breaker_x1_x2)) (not (dominates-2_hyp3_count-as-fault_breaker_x1_x2)) (not (dominates-2_hyp2_count-as-fault_breaker_x1_x2))))
 (:action breaker-open-unexplained_breaker_x3_x4_obs2546_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x3_x4) (pending_obs2546) (fault-count-2_count-as-fault_breaker_x3_x4_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (breaker-state-is-open_breaker_x3_x4) (observed_obs2546) (fault-count-2_count-as-fault_breaker_x3_x4_n1) (not (breaker-state-is-closed_breaker_x3_x4)) (not (pending_obs2546)) (not (fault-count-2_count-as-fault_breaker_x3_x4_n0)) (not (dominates-2_hyp11_count-as-fault_breaker_x3_x4)) (not (dominates-2_hyp10_count-as-fault_breaker_x3_x4)) (not (dominates-2_hyp9_count-as-fault_breaker_x3_x4)) (not (dominates-2_hyp8_count-as-fault_breaker_x3_x4)) (not (dominates-2_hyp7_count-as-fault_breaker_x3_x4)) (not (dominates-2_hyp6_count-as-fault_breaker_x3_x4)) (not (dominates-2_hyp5_count-as-fault_breaker_x3_x4)) (not (dominates-2_hyp4_count-as-fault_breaker_x3_x4)) (not (dominates-2_hyp3_count-as-fault_breaker_x3_x4)) (not (dominates-2_hyp2_count-as-fault_breaker_x3_x4)) (not (dominates-2_hyp1_count-as-fault_breaker_x3_x4))))
 (:action breaker-open-unexplained_breaker_x7_x8_obs2550_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x7_x8) (pending_obs2550) (fault-count-2_count-as-fault_breaker_x7_x8_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (observed_obs2550) (fault-count-2_count-as-fault_breaker_x7_x8_n1) (not (breaker-state-is-closed_breaker_x7_x8)) (not (pending_obs2550)) (not (fault-count-2_count-as-fault_breaker_x7_x8_n0))))
 (:action breaker-open-unexplained_breaker_x9_x10_obs2554_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x9_x10) (pending_obs2554) (fault-count-2_count-as-fault_breaker_x9_x10_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (observed_obs2554) (fault-count-2_count-as-fault_breaker_x9_x10_n1) (not (breaker-state-is-closed_breaker_x9_x10)) (not (pending_obs2554)) (not (fault-count-2_count-as-fault_breaker_x9_x10_n0))))
 (:action breaker-open-unexplained_breaker_x11_x12_obs2544_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x11_x12) (pending_obs2544) (fault-count-2_count-as-fault_breaker_x11_x12_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (observed_obs2544) (fault-count-2_count-as-fault_breaker_x11_x12_n1) (not (breaker-state-is-closed_breaker_x11_x12)) (not (pending_obs2544)) (not (fault-count-2_count-as-fault_breaker_x11_x12_n0)) (not (dominates-2_hyp9_count-as-fault_breaker_x11_x12)) (not (dominates-2_hyp8_count-as-fault_breaker_x11_x12)) (not (dominates-2_hyp5_count-as-fault_breaker_x11_x12))))
 (:action breaker-open-unexplained_breaker_x13_x14_obs2561_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x13_x14) (pending_obs2561) (fault-count-2_count-as-fault_breaker_x13_x14_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (observed_obs2561) (fault-count-2_count-as-fault_breaker_x13_x14_n1) (not (breaker-state-is-closed_breaker_x13_x14)) (not (pending_obs2561)) (not (fault-count-2_count-as-fault_breaker_x13_x14_n0))))
 (:action breaker-open-unexplained_breaker_x15_x16_obs2556_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x15_x16) (pending_obs2556) (fault-count-2_count-as-fault_breaker_x15_x16_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (observed_obs2556) (fault-count-2_count-as-fault_breaker_x15_x16_n1) (not (breaker-state-is-closed_breaker_x15_x16)) (not (pending_obs2556)) (not (fault-count-2_count-as-fault_breaker_x15_x16_n0)) (not (dominates-2_hyp11_count-as-fault_breaker_x15_x16)) (not (dominates-2_hyp10_count-as-fault_breaker_x15_x16)) (not (dominates-2_hyp9_count-as-fault_breaker_x15_x16)) (not (dominates-2_hyp4_count-as-fault_breaker_x15_x16)) (not (dominates-2_hyp3_count-as-fault_breaker_x15_x16))))
 (:action breaker-trip-unexplained_breaker_x1_x2_obs2563_n1_n2
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x1_x2) (breaker-ar-status-is-auto_breaker_x1_x2) (pending_obs2563) (fault-count-2_count-as-fault_breaker_x1_x2_n1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (breaker-state-is-open_breaker_x1_x2) (observed_obs2563) (line-iso-state-may-have-changed_line_x19_x20_obs2563) (fault-count-2_count-as-fault_breaker_x1_x2_n2) (breaker-auto-reclose-wait_breaker_x1_x2_obs2563) (not (breaker-state-is-closed_breaker_x1_x2)) (not (pending_obs2563)) (not (fault-count-2_count-as-fault_breaker_x1_x2_n1)) (not (dominates-2_hyp11_count-as-fault_breaker_x1_x2)) (not (dominates-2_hyp8_count-as-fault_breaker_x1_x2)) (not (dominates-2_hyp7_count-as-fault_breaker_x1_x2)) (not (dominates-2_hyp3_count-as-fault_breaker_x1_x2)) (not (dominates-2_hyp2_count-as-fault_breaker_x1_x2))))
 (:action breaker-trip-unexplained_breaker_x3_x4_obs2546_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x3_x4) (breaker-ar-status-is-auto_breaker_x3_x4) (pending_obs2546) (fault-count-2_count-as-fault_breaker_x3_x4_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (breaker-state-is-open_breaker_x3_x4) (observed_obs2546) (fault-count-2_count-as-fault_breaker_x3_x4_n1) (breaker-auto-reclose-wait_breaker_x3_x4_obs2546) (not (breaker-state-is-closed_breaker_x3_x4)) (not (pending_obs2546)) (not (fault-count-2_count-as-fault_breaker_x3_x4_n0)) (not (dominates-2_hyp11_count-as-fault_breaker_x3_x4)) (not (dominates-2_hyp10_count-as-fault_breaker_x3_x4)) (not (dominates-2_hyp9_count-as-fault_breaker_x3_x4)) (not (dominates-2_hyp8_count-as-fault_breaker_x3_x4)) (not (dominates-2_hyp7_count-as-fault_breaker_x3_x4)) (not (dominates-2_hyp6_count-as-fault_breaker_x3_x4)) (not (dominates-2_hyp5_count-as-fault_breaker_x3_x4)) (not (dominates-2_hyp4_count-as-fault_breaker_x3_x4)) (not (dominates-2_hyp3_count-as-fault_breaker_x3_x4)) (not (dominates-2_hyp2_count-as-fault_breaker_x3_x4)) (not (dominates-2_hyp1_count-as-fault_breaker_x3_x4))))
 (:action breaker-trip-unexplained_breaker_x7_x8_obs2550_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x7_x8) (breaker-ar-status-is-auto_breaker_x7_x8) (pending_obs2550) (fault-count-2_count-as-fault_breaker_x7_x8_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (observed_obs2550) (fault-count-2_count-as-fault_breaker_x7_x8_n1) (not (breaker-state-is-closed_breaker_x7_x8)) (not (pending_obs2550)) (not (fault-count-2_count-as-fault_breaker_x7_x8_n0))))
 (:action breaker-trip-unexplained_breaker_x9_x10_obs2554_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x9_x10) (breaker-ar-status-is-auto_breaker_x9_x10) (pending_obs2554) (fault-count-2_count-as-fault_breaker_x9_x10_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (observed_obs2554) (fault-count-2_count-as-fault_breaker_x9_x10_n1) (not (breaker-state-is-closed_breaker_x9_x10)) (not (pending_obs2554)) (not (fault-count-2_count-as-fault_breaker_x9_x10_n0))))
 (:action breaker-trip-unexplained_breaker_x11_x12_obs2544_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x11_x12) (breaker-ar-status-is-auto_breaker_x11_x12) (pending_obs2544) (fault-count-2_count-as-fault_breaker_x11_x12_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (observed_obs2544) (fault-count-2_count-as-fault_breaker_x11_x12_n1) (not (breaker-state-is-closed_breaker_x11_x12)) (not (pending_obs2544)) (not (fault-count-2_count-as-fault_breaker_x11_x12_n0)) (not (dominates-2_hyp9_count-as-fault_breaker_x11_x12)) (not (dominates-2_hyp8_count-as-fault_breaker_x11_x12)) (not (dominates-2_hyp5_count-as-fault_breaker_x11_x12))))
 (:action breaker-trip-unexplained_breaker_x13_x14_obs2561_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x13_x14) (breaker-ar-status-is-auto_breaker_x13_x14) (pending_obs2561) (fault-count-2_count-as-fault_breaker_x13_x14_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (observed_obs2561) (fault-count-2_count-as-fault_breaker_x13_x14_n1) (not (breaker-state-is-closed_breaker_x13_x14)) (not (pending_obs2561)) (not (fault-count-2_count-as-fault_breaker_x13_x14_n0))))
 (:action breaker-trip-unexplained_breaker_x15_x16_obs2556_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x15_x16) (breaker-ar-status-is-auto_breaker_x15_x16) (pending_obs2556) (fault-count-2_count-as-fault_breaker_x15_x16_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (observed_obs2556) (fault-count-2_count-as-fault_breaker_x15_x16_n1) (not (breaker-state-is-closed_breaker_x15_x16)) (not (pending_obs2556)) (not (fault-count-2_count-as-fault_breaker_x15_x16_n0)) (not (dominates-2_hyp11_count-as-fault_breaker_x15_x16)) (not (dominates-2_hyp10_count-as-fault_breaker_x15_x16)) (not (dominates-2_hyp9_count-as-fault_breaker_x15_x16)) (not (dominates-2_hyp4_count-as-fault_breaker_x15_x16)) (not (dominates-2_hyp3_count-as-fault_breaker_x15_x16))))
 (:action breaker-close-unexplained_breaker_x1_x2_obs2559_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x1_x2) (fault-count-2_count-as-fault_breaker_x1_x2_n0) (pending_obs2559) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (breaker-state-is-closed_breaker_x1_x2) (fault-count-2_count-as-fault_breaker_x1_x2_n1) (observed_obs2559) (line-iso-state-may-have-changed_line_x19_x20_obs2559) (not (breaker-state-is-open_breaker_x1_x2)) (not (fault-count-2_count-as-fault_breaker_x1_x2_n0)) (not (dominates-2_hyp10_count-as-fault_breaker_x1_x2)) (not (dominates-2_hyp9_count-as-fault_breaker_x1_x2)) (not (dominates-2_hyp6_count-as-fault_breaker_x1_x2)) (not (dominates-2_hyp5_count-as-fault_breaker_x1_x2)) (not (dominates-2_hyp4_count-as-fault_breaker_x1_x2)) (not (dominates-2_hyp1_count-as-fault_breaker_x1_x2)) (not (pending_obs2559))))
 (:action breaker-close-unexplained_breaker_x3_x4_obs2547_n1_n2
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x3_x4) (fault-count-2_count-as-fault_breaker_x3_x4_n1) (pending_obs2547) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (breaker-state-is-closed_breaker_x3_x4) (fault-count-2_count-as-fault_breaker_x3_x4_n2) (observed_obs2547) (not (breaker-state-is-open_breaker_x3_x4)) (not (fault-count-2_count-as-fault_breaker_x3_x4_n1)) (not (pending_obs2547))))
 (:action breaker-reclose_breaker_x3_x4_obs2547_obs2546
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x3_x4) (breaker-auto-reclose-wait_breaker_x3_x4_obs2546) (pending_obs2547) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (breaker-state-is-closed_breaker_x3_x4) (observed_obs2547) (breaker-auto-reopen-wait_breaker_x3_x4_obs2547) (not (breaker-state-is-open_breaker_x3_x4)) (not (pending_obs2547))))
 (:action bus-voltage-goes-high-unexplained_bus_x3_high_obs2549_n0_n1
  :parameters ()
  :precondition (and (pending_obs2549) (fault-count-2_count-as-fault_bus_x3_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (observed_obs2549) (fault-count-2_count-as-fault_bus_x3_n1) (not (pending_obs2549)) (not (fault-count-2_count-as-fault_bus_x3_n0)) (not (dominates-2_hyp11_count-as-fault_bus_x3)) (not (dominates-2_hyp10_count-as-fault_bus_x3)) (not (dominates-2_hyp9_count-as-fault_bus_x3)) (not (dominates-2_hyp8_count-as-fault_bus_x3)) (not (dominates-2_hyp7_count-as-fault_bus_x3)) (not (dominates-2_hyp6_count-as-fault_bus_x3)) (not (dominates-2_hyp5_count-as-fault_bus_x3)) (not (dominates-2_hyp4_count-as-fault_bus_x3)) (not (dominates-2_hyp3_count-as-fault_bus_x3)) (not (dominates-2_hyp2_count-as-fault_bus_x3)) (not (dominates-2_hyp1_count-as-fault_bus_x3))))
 (:action bus-voltage-goes-normal-unexplained_bus_x17_obs2551_n0_n1
  :parameters ()
  :precondition (and (pending_obs2551) (fault-count-2_count-as-fault_bus_x17_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (observed_obs2551) (fault-count-2_count-as-fault_bus_x17_n1) (not (pending_obs2551)) (not (fault-count-2_count-as-fault_bus_x17_n0)) (not (dominates-2_hyp11_count-as-fault_bus_x17)) (not (dominates-2_hyp10_count-as-fault_bus_x17)) (not (dominates-2_hyp9_count-as-fault_bus_x17)) (not (dominates-2_hyp8_count-as-fault_bus_x17)) (not (dominates-2_hyp7_count-as-fault_bus_x17)) (not (dominates-2_hyp6_count-as-fault_bus_x17)) (not (dominates-2_hyp5_count-as-fault_bus_x17)) (not (dominates-2_hyp4_count-as-fault_bus_x17)) (not (dominates-2_hyp3_count-as-fault_bus_x17)) (not (dominates-2_hyp2_count-as-fault_bus_x17)) (not (dominates-2_hyp1_count-as-fault_bus_x17))))
 (:action bus-mw-goes-to-zero-unexplained_bus_x12_obs2545_n0_n1
  :parameters ()
  :precondition (and (pending_obs2545) (fault-count-2_count-as-fault_bus_x12_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (observed_obs2545) (fault-count-2_count-as-fault_bus_x12_n1) (not (pending_obs2545)) (not (fault-count-2_count-as-fault_bus_x12_n0)) (not (dominates-2_hyp4_count-as-fault_bus_x12)) (not (dominates-2_hyp3_count-as-fault_bus_x12)) (not (dominates-2_hyp2_count-as-fault_bus_x12)) (not (dominates-2_hyp1_count-as-fault_bus_x12))))
 (:action bus-mw-goes-to-zero-when-isolated_bus_x12_obs2545_obs2544
  :parameters ()
  :precondition (and (pending_obs2545) (bus-isolated_bus_x12) (bus-iso-state-changed_bus_x12_obs2544) (generator-status-is-off_generator_x12_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (observed_obs2545) (not (pending_obs2545))))
 (:action line-iso-trip-first-breaker-simple-trip-1_line_x19_x20_breaker_x1_x2_breaker_x1_x2_obs2563_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x1_x2) (breaker-ar-status-is-auto_breaker_x1_x2) (pending_obs2563) (fault-count-2_count-as-fault_line_x19_x20_n0) (not_line-isolated_line_x19_x20) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (breaker-state-is-open_breaker_x1_x2) (observed_obs2563) (breaker-auto-reclose-wait_breaker_x1_x2_obs2563) (line-iso-trip-in-progress_line_x19_x20_obs2563) (fault-count-2_count-as-fault_line_x19_x20_n1) (not (breaker-state-is-closed_breaker_x1_x2)) (not (pending_obs2563)) (not (fault-count-2_count-as-fault_line_x19_x20_n0)) (not (dominates-2_hyp10_count-as-fault_line_x19_x20)) (not (dominates-2_hyp9_count-as-fault_line_x19_x20)) (not (dominates-2_hyp6_count-as-fault_line_x19_x20)) (not (dominates-2_hyp5_count-as-fault_line_x19_x20)) (not (dominates-2_hyp4_count-as-fault_line_x19_x20)) (not (dominates-2_hyp1_count-as-fault_line_x19_x20))))
 (:action line-iso-trip-first-breaker-simple-trip-2_line_x19_x20_breaker_x1_x2_breaker_x1_x2_obs2563_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x1_x2) (breaker-ar-status-is-non-auto_breaker_x1_x2) (pending_obs2563) (fault-count-2_count-as-fault_line_x19_x20_n0) (not_line-isolated_line_x19_x20) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (breaker-state-is-open_breaker_x1_x2) (observed_obs2563) (line-iso-trip-in-progress_line_x19_x20_obs2563) (fault-count-2_count-as-fault_line_x19_x20_n1) (not (breaker-state-is-closed_breaker_x1_x2)) (not (pending_obs2563)) (not (fault-count-2_count-as-fault_line_x19_x20_n0)) (not (dominates-2_hyp10_count-as-fault_line_x19_x20)) (not (dominates-2_hyp9_count-as-fault_line_x19_x20)) (not (dominates-2_hyp6_count-as-fault_line_x19_x20)) (not (dominates-2_hyp5_count-as-fault_line_x19_x20)) (not (dominates-2_hyp4_count-as-fault_line_x19_x20)) (not (dominates-2_hyp1_count-as-fault_line_x19_x20))))
 (:action line-finish-iso-trip-4_line_x19_x20_breaker_x21_x22_breaker_x23_x24_breaker_x25_x26_breaker_x1_x2_obs2563
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x1_x2) (breaker-state-is-open_breaker_x21_x22) (breaker-state-is-open_breaker_x23_x24) (breaker-state-is-open_breaker_x25_x26) (line-iso-trip-in-progress_line_x19_x20_obs2563) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (line-isolated_line_x19_x20) (not (not_line-isolated_line_x19_x20)) (not (line-iso-trip-in-progress_line_x19_x20_obs2563))))
 (:action line-set-state-isolated-4_line_x19_x20_breaker_x21_x22_breaker_x23_x24_breaker_x25_x26_breaker_x1_x2_obs2559
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x1_x2) (breaker-state-is-open_breaker_x21_x22) (breaker-state-is-open_breaker_x23_x24) (breaker-state-is-open_breaker_x25_x26) (line-iso-state-may-have-changed_line_x19_x20_obs2559) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (line-isolated_line_x19_x20) (not (not_line-isolated_line_x19_x20))))
 (:action line-set-state-isolated-4_line_x19_x20_breaker_x21_x22_breaker_x23_x24_breaker_x25_x26_breaker_x1_x2_obs2563
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x1_x2) (breaker-state-is-open_breaker_x21_x22) (breaker-state-is-open_breaker_x23_x24) (breaker-state-is-open_breaker_x25_x26) (line-iso-state-may-have-changed_line_x19_x20_obs2563) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (line-isolated_line_x19_x20) (not (not_line-isolated_line_x19_x20))))
 (:action line-re-energise-isolated-4d_line_x19_x20_breaker_x21_x22_breaker_x23_x24_breaker_x25_x26_breaker_x1_x2_obs2559
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x1_x2) (line-iso-state-may-have-changed_line_x19_x20_obs2559) (line-isolated_line_x19_x20) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (not_line-isolated_line_x19_x20) (not (line-isolated_line_x19_x20))))
 (:action line-init-state-isolated-4_line_x19_x20_breaker_x21_x22_breaker_x23_x24_breaker_x25_x26_breaker_x1_x2
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x1_x2) (breaker-state-is-open_breaker_x21_x22) (breaker-state-is-open_breaker_x23_x24) (breaker-state-is-open_breaker_x25_x26) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (line-isolated_line_x19_x20) (not (not_line-isolated_line_x19_x20))))
 (:action line-mw-goes-normal-unexplained-1_line_x5_x6_obs2558_n0_n1
  :parameters ()
  :precondition (and (pending_obs2558) (fault-count-2_count-as-fault_line_x5_x6_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (observed_obs2558) (fault-count-2_count-as-fault_line_x5_x6_n1) (not (pending_obs2558)) (not (fault-count-2_count-as-fault_line_x5_x6_n0)) (not (dominates-2_hyp11_count-as-fault_line_x5_x6)) (not (dominates-2_hyp10_count-as-fault_line_x5_x6)) (not (dominates-2_hyp9_count-as-fault_line_x5_x6)) (not (dominates-2_hyp8_count-as-fault_line_x5_x6)) (not (dominates-2_hyp7_count-as-fault_line_x5_x6)) (not (dominates-2_hyp6_count-as-fault_line_x5_x6)) (not (dominates-2_hyp5_count-as-fault_line_x5_x6)) (not (dominates-2_hyp4_count-as-fault_line_x5_x6)) (not (dominates-2_hyp3_count-as-fault_line_x5_x6)) (not (dominates-2_hyp2_count-as-fault_line_x5_x6)) (not (dominates-2_hyp1_count-as-fault_line_x5_x6))))
 (:action generator-init-status-was-on_generator_x8_1
  :parameters ()
  :precondition (and (generator-status-is-unknown_generator_x8_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (generator-status-is-on_generator_x8_1) (not (generator-status-is-unknown_generator_x8_1))))
 (:action generator-init-status-was-on_generator_x10_1
  :parameters ()
  :precondition (and (generator-status-is-unknown_generator_x10_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (generator-status-is-on_generator_x10_1) (not (generator-status-is-unknown_generator_x10_1))))
 (:action generator-init-status-was-on_generator_x12_1
  :parameters ()
  :precondition (and (generator-status-is-unknown_generator_x12_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (generator-status-is-on_generator_x12_1) (not (generator-status-is-unknown_generator_x12_1))))
 (:action generator-init-status-was-on_generator_x18_1
  :parameters ()
  :precondition (and (generator-status-is-unknown_generator_x18_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (generator-status-is-on_generator_x18_1) (not (generator-status-is-unknown_generator_x18_1))))
 (:action generator-init-status-was-on_generator_x14_1
  :parameters ()
  :precondition (and (generator-status-is-unknown_generator_x14_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (generator-status-is-on_generator_x14_1) (not (generator-status-is-unknown_generator_x14_1))))
 (:action generator-init-status-was-on_generator_x16_1
  :parameters ()
  :precondition (and (generator-status-is-unknown_generator_x16_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (generator-status-is-on_generator_x16_1) (not (generator-status-is-unknown_generator_x16_1))))
 (:action generator-init-status-was-off_generator_x8_1
  :parameters ()
  :precondition (and (generator-status-is-unknown_generator_x8_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (generator-status-is-off_generator_x8_1) (not (generator-status-is-unknown_generator_x8_1))))
 (:action generator-init-status-was-off_generator_x10_1
  :parameters ()
  :precondition (and (generator-status-is-unknown_generator_x10_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (generator-status-is-off_generator_x10_1) (not (generator-status-is-unknown_generator_x10_1))))
 (:action generator-init-status-was-off_generator_x12_1
  :parameters ()
  :precondition (and (generator-status-is-unknown_generator_x12_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (generator-status-is-off_generator_x12_1) (not (generator-status-is-unknown_generator_x12_1))))
 (:action generator-init-status-was-off_generator_x18_1
  :parameters ()
  :precondition (and (generator-status-is-unknown_generator_x18_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (generator-status-is-off_generator_x18_1) (not (generator-status-is-unknown_generator_x18_1))))
 (:action generator-init-status-was-off_generator_x14_1
  :parameters ()
  :precondition (and (generator-status-is-unknown_generator_x14_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (generator-status-is-off_generator_x14_1) (not (generator-status-is-unknown_generator_x14_1))))
 (:action generator-init-status-was-off_generator_x16_1
  :parameters ()
  :precondition (and (generator-status-is-unknown_generator_x16_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (generator-status-is-off_generator_x16_1) (not (generator-status-is-unknown_generator_x16_1))))
 (:action generator-begin-shutdown_generator_x8_1_n0_n1
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x8_1) (fault-count-2_count-as-fault_generator_x8_1_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (generator-status-is-shutting-down_generator_x8_1) (fault-count-2_count-as-fault_generator_x8_1_n1) (not (generator-status-is-on_generator_x8_1)) (not (fault-count-2_count-as-fault_generator_x8_1_n0))))
 (:action generator-begin-shutdown_generator_x8_1_n1_n2
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x8_1) (fault-count-2_count-as-fault_generator_x8_1_n1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (generator-status-is-shutting-down_generator_x8_1) (fault-count-2_count-as-fault_generator_x8_1_n2) (not (generator-status-is-on_generator_x8_1)) (not (fault-count-2_count-as-fault_generator_x8_1_n1)) (not (dominates-2_hyp11_count-as-fault_generator_x8_1)) (not (dominates-2_hyp10_count-as-fault_generator_x8_1)) (not (dominates-2_hyp9_count-as-fault_generator_x8_1)) (not (dominates-2_hyp8_count-as-fault_generator_x8_1)) (not (dominates-2_hyp7_count-as-fault_generator_x8_1)) (not (dominates-2_hyp6_count-as-fault_generator_x8_1)) (not (dominates-2_hyp5_count-as-fault_generator_x8_1)) (not (dominates-2_hyp4_count-as-fault_generator_x8_1)) (not (dominates-2_hyp3_count-as-fault_generator_x8_1)) (not (dominates-2_hyp2_count-as-fault_generator_x8_1)) (not (dominates-2_hyp1_count-as-fault_generator_x8_1))))
 (:action generator-begin-shutdown_generator_x8_1_n2_n3
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x8_1) (fault-count-2_count-as-fault_generator_x8_1_n2) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (generator-status-is-shutting-down_generator_x8_1) (not (generator-status-is-on_generator_x8_1)) (not (fault-count-2_count-as-fault_generator_x8_1_n2))))
 (:action generator-begin-shutdown_generator_x10_1_n0_n1
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x10_1) (fault-count-2_count-as-fault_generator_x10_1_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (generator-status-is-shutting-down_generator_x10_1) (fault-count-2_count-as-fault_generator_x10_1_n1) (not (generator-status-is-on_generator_x10_1)) (not (fault-count-2_count-as-fault_generator_x10_1_n0)) (not (dominates-2_hyp11_count-as-fault_generator_x10_1)) (not (dominates-2_hyp10_count-as-fault_generator_x10_1)) (not (dominates-2_hyp9_count-as-fault_generator_x10_1)) (not (dominates-2_hyp8_count-as-fault_generator_x10_1)) (not (dominates-2_hyp7_count-as-fault_generator_x10_1)) (not (dominates-2_hyp6_count-as-fault_generator_x10_1)) (not (dominates-2_hyp5_count-as-fault_generator_x10_1)) (not (dominates-2_hyp4_count-as-fault_generator_x10_1)) (not (dominates-2_hyp3_count-as-fault_generator_x10_1)) (not (dominates-2_hyp2_count-as-fault_generator_x10_1)) (not (dominates-2_hyp1_count-as-fault_generator_x10_1))))
 (:action generator-begin-shutdown_generator_x10_1_n1_n2
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x10_1) (fault-count-2_count-as-fault_generator_x10_1_n1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (generator-status-is-shutting-down_generator_x10_1) (fault-count-2_count-as-fault_generator_x10_1_n2) (not (generator-status-is-on_generator_x10_1)) (not (fault-count-2_count-as-fault_generator_x10_1_n1))))
 (:action generator-begin-shutdown_generator_x10_1_n2_n3
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x10_1) (fault-count-2_count-as-fault_generator_x10_1_n2) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (generator-status-is-shutting-down_generator_x10_1) (not (generator-status-is-on_generator_x10_1)) (not (fault-count-2_count-as-fault_generator_x10_1_n2))))
 (:action generator-begin-shutdown_generator_x12_1_n0_n1
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x12_1) (fault-count-2_count-as-fault_generator_x12_1_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (generator-status-is-shutting-down_generator_x12_1) (fault-count-2_count-as-fault_generator_x12_1_n1) (not (generator-status-is-on_generator_x12_1)) (not (fault-count-2_count-as-fault_generator_x12_1_n0)) (not (dominates-2_hyp4_count-as-fault_generator_x12_1)) (not (dominates-2_hyp3_count-as-fault_generator_x12_1)) (not (dominates-2_hyp2_count-as-fault_generator_x12_1)) (not (dominates-2_hyp1_count-as-fault_generator_x12_1))))
 (:action generator-begin-shutdown_generator_x12_1_n1_n2
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x12_1) (fault-count-2_count-as-fault_generator_x12_1_n1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (generator-status-is-shutting-down_generator_x12_1) (fault-count-2_count-as-fault_generator_x12_1_n2) (not (generator-status-is-on_generator_x12_1)) (not (fault-count-2_count-as-fault_generator_x12_1_n1)) (not (dominates-2_hyp9_count-as-fault_generator_x12_1)) (not (dominates-2_hyp8_count-as-fault_generator_x12_1)) (not (dominates-2_hyp5_count-as-fault_generator_x12_1))))
 (:action generator-begin-shutdown_generator_x12_1_n2_n3
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x12_1) (fault-count-2_count-as-fault_generator_x12_1_n2) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (generator-status-is-shutting-down_generator_x12_1) (not (generator-status-is-on_generator_x12_1)) (not (fault-count-2_count-as-fault_generator_x12_1_n2)) (not (dominates-2_hyp11_count-as-fault_generator_x12_1)) (not (dominates-2_hyp10_count-as-fault_generator_x12_1)) (not (dominates-2_hyp7_count-as-fault_generator_x12_1)) (not (dominates-2_hyp6_count-as-fault_generator_x12_1))))
 (:action generator-begin-shutdown_generator_x18_1_n0_n1
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x18_1) (fault-count-2_count-as-fault_generator_x18_1_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (generator-status-is-shutting-down_generator_x18_1) (fault-count-2_count-as-fault_generator_x18_1_n1) (not (generator-status-is-on_generator_x18_1)) (not (fault-count-2_count-as-fault_generator_x18_1_n0)) (not (dominates-2_hyp11_count-as-fault_generator_x18_1)) (not (dominates-2_hyp10_count-as-fault_generator_x18_1)) (not (dominates-2_hyp9_count-as-fault_generator_x18_1)) (not (dominates-2_hyp8_count-as-fault_generator_x18_1)) (not (dominates-2_hyp7_count-as-fault_generator_x18_1)) (not (dominates-2_hyp6_count-as-fault_generator_x18_1)) (not (dominates-2_hyp5_count-as-fault_generator_x18_1)) (not (dominates-2_hyp4_count-as-fault_generator_x18_1)) (not (dominates-2_hyp3_count-as-fault_generator_x18_1)) (not (dominates-2_hyp2_count-as-fault_generator_x18_1)) (not (dominates-2_hyp1_count-as-fault_generator_x18_1))))
 (:action generator-begin-shutdown_generator_x18_1_n1_n2
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x18_1) (fault-count-2_count-as-fault_generator_x18_1_n1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (generator-status-is-shutting-down_generator_x18_1) (fault-count-2_count-as-fault_generator_x18_1_n2) (not (generator-status-is-on_generator_x18_1)) (not (fault-count-2_count-as-fault_generator_x18_1_n1))))
 (:action generator-begin-shutdown_generator_x18_1_n2_n3
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x18_1) (fault-count-2_count-as-fault_generator_x18_1_n2) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (generator-status-is-shutting-down_generator_x18_1) (not (generator-status-is-on_generator_x18_1)) (not (fault-count-2_count-as-fault_generator_x18_1_n2))))
 (:action generator-begin-shutdown_generator_x14_1_n0_n1
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x14_1) (fault-count-2_count-as-fault_generator_x14_1_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (generator-status-is-shutting-down_generator_x14_1) (fault-count-2_count-as-fault_generator_x14_1_n1) (not (generator-status-is-on_generator_x14_1)) (not (fault-count-2_count-as-fault_generator_x14_1_n0)) (not (dominates-2_hyp11_count-as-fault_generator_x14_1)) (not (dominates-2_hyp10_count-as-fault_generator_x14_1)) (not (dominates-2_hyp9_count-as-fault_generator_x14_1)) (not (dominates-2_hyp8_count-as-fault_generator_x14_1)) (not (dominates-2_hyp7_count-as-fault_generator_x14_1)) (not (dominates-2_hyp6_count-as-fault_generator_x14_1)) (not (dominates-2_hyp5_count-as-fault_generator_x14_1)) (not (dominates-2_hyp4_count-as-fault_generator_x14_1)) (not (dominates-2_hyp3_count-as-fault_generator_x14_1)) (not (dominates-2_hyp2_count-as-fault_generator_x14_1)) (not (dominates-2_hyp1_count-as-fault_generator_x14_1))))
 (:action generator-begin-shutdown_generator_x14_1_n1_n2
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x14_1) (fault-count-2_count-as-fault_generator_x14_1_n1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (generator-status-is-shutting-down_generator_x14_1) (fault-count-2_count-as-fault_generator_x14_1_n2) (not (generator-status-is-on_generator_x14_1)) (not (fault-count-2_count-as-fault_generator_x14_1_n1))))
 (:action generator-begin-shutdown_generator_x14_1_n2_n3
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x14_1) (fault-count-2_count-as-fault_generator_x14_1_n2) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (generator-status-is-shutting-down_generator_x14_1) (not (generator-status-is-on_generator_x14_1)) (not (fault-count-2_count-as-fault_generator_x14_1_n2))))
 (:action generator-begin-shutdown_generator_x16_1_n0_n1
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x16_1) (fault-count-2_count-as-fault_generator_x16_1_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (generator-status-is-shutting-down_generator_x16_1) (fault-count-2_count-as-fault_generator_x16_1_n1) (not (generator-status-is-on_generator_x16_1)) (not (fault-count-2_count-as-fault_generator_x16_1_n0)) (not (dominates-2_hyp8_count-as-fault_generator_x16_1)) (not (dominates-2_hyp7_count-as-fault_generator_x16_1)) (not (dominates-2_hyp6_count-as-fault_generator_x16_1)) (not (dominates-2_hyp5_count-as-fault_generator_x16_1)) (not (dominates-2_hyp2_count-as-fault_generator_x16_1)) (not (dominates-2_hyp1_count-as-fault_generator_x16_1))))
 (:action generator-begin-shutdown_generator_x16_1_n1_n2
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x16_1) (fault-count-2_count-as-fault_generator_x16_1_n1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (generator-status-is-shutting-down_generator_x16_1) (fault-count-2_count-as-fault_generator_x16_1_n2) (not (generator-status-is-on_generator_x16_1)) (not (fault-count-2_count-as-fault_generator_x16_1_n1))))
 (:action generator-begin-shutdown_generator_x16_1_n2_n3
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x16_1) (fault-count-2_count-as-fault_generator_x16_1_n2) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (generator-status-is-shutting-down_generator_x16_1) (not (generator-status-is-on_generator_x16_1)) (not (fault-count-2_count-as-fault_generator_x16_1_n2))))
 (:action generator-shutdown-breaker-open-breaker-open_generator_x8_1_breaker_x7_x8_bus_x8_breaker_x7_x8_obs2550
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x7_x8) (pending_obs2550) (generator-status-is-shutting-down_generator_x8_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (observed_obs2550) (not (breaker-state-is-closed_breaker_x7_x8)) (not (pending_obs2550))))
 (:action generator-shutdown-breaker-open-breaker-open_generator_x10_1_breaker_x9_x10_bus_x10_breaker_x9_x10_obs2554
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x9_x10) (pending_obs2554) (generator-status-is-shutting-down_generator_x10_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (observed_obs2554) (not (breaker-state-is-closed_breaker_x9_x10)) (not (pending_obs2554))))
 (:action generator-shutdown-breaker-open-breaker-open_generator_x12_1_breaker_x11_x12_bus_x12_breaker_x11_x12_obs2544
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x11_x12) (pending_obs2544) (generator-status-is-shutting-down_generator_x12_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (observed_obs2544) (bus-isolated_bus_x12) (bus-iso-state-changed_bus_x12_obs2544) (not (breaker-state-is-closed_breaker_x11_x12)) (not (pending_obs2544))))
 (:action generator-shutdown-breaker-open-breaker-open_generator_x14_1_breaker_x13_x14_bus_x14_breaker_x13_x14_obs2561
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x13_x14) (pending_obs2561) (generator-status-is-shutting-down_generator_x14_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (observed_obs2561) (not (breaker-state-is-closed_breaker_x13_x14)) (not (pending_obs2561))))
 (:action generator-shutdown-breaker-open-breaker-open_generator_x16_1_breaker_x15_x16_bus_x16_breaker_x15_x16_obs2556
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x15_x16) (pending_obs2556) (generator-status-is-shutting-down_generator_x16_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (observed_obs2556) (not (breaker-state-is-closed_breaker_x15_x16)) (not (pending_obs2556))))
 (:action generator-shutdown-turn-off_generator_x8_1_obs2562
  :parameters ()
  :precondition (and (generator-status-is-shutting-down_generator_x8_1) (pending_obs2562) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (observed_obs2562) (not (pending_obs2562))))
 (:action generator-shutdown-turn-off_generator_x10_1_obs2557
  :parameters ()
  :precondition (and (generator-status-is-shutting-down_generator_x10_1) (pending_obs2557) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (observed_obs2557) (not (pending_obs2557))))
 (:action generator-shutdown-turn-off_generator_x12_1_obs2552
  :parameters ()
  :precondition (and (generator-status-is-shutting-down_generator_x12_1) (pending_obs2552) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (observed_obs2552) (not (pending_obs2552))))
 (:action generator-shutdown-turn-off_generator_x14_1_obs2553
  :parameters ()
  :precondition (and (generator-status-is-shutting-down_generator_x14_1) (pending_obs2553) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (observed_obs2553) (not (pending_obs2553))))
 (:action generator-shutdown-complete_generator_x8_1
  :parameters ()
  :precondition (and (generator-status-is-shutting-down_generator_x8_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (generator-status-is-off_generator_x8_1) (not (generator-status-is-shutting-down_generator_x8_1))))
 (:action generator-shutdown-complete_generator_x10_1
  :parameters ()
  :precondition (and (generator-status-is-shutting-down_generator_x10_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (generator-status-is-off_generator_x10_1) (not (generator-status-is-shutting-down_generator_x10_1))))
 (:action generator-shutdown-complete_generator_x12_1
  :parameters ()
  :precondition (and (generator-status-is-shutting-down_generator_x12_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (generator-status-is-off_generator_x12_1) (not (generator-status-is-shutting-down_generator_x12_1))))
 (:action generator-shutdown-complete_generator_x18_1
  :parameters ()
  :precondition (and (generator-status-is-shutting-down_generator_x18_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (generator-status-is-off_generator_x18_1) (not (generator-status-is-shutting-down_generator_x18_1))))
 (:action generator-shutdown-complete_generator_x14_1
  :parameters ()
  :precondition (and (generator-status-is-shutting-down_generator_x14_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (generator-status-is-off_generator_x14_1) (not (generator-status-is-shutting-down_generator_x14_1))))
 (:action generator-shutdown-complete_generator_x16_1
  :parameters ()
  :precondition (and (generator-status-is-shutting-down_generator_x16_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (generator-status-is-off_generator_x16_1) (not (generator-status-is-shutting-down_generator_x16_1))))
 (:action generator-begin-startup_generator_x8_1_n0_n1
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x8_1) (fault-count-2_count-as-fault_generator_x8_1_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (fault-count-2_count-as-fault_generator_x8_1_n1) (generator-status-is-starting-up_generator_x8_1) (not (generator-status-is-on_generator_x8_1)) (not (fault-count-2_count-as-fault_generator_x8_1_n0))))
 (:action generator-begin-startup_generator_x8_1_n1_n2
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x8_1) (fault-count-2_count-as-fault_generator_x8_1_n1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (fault-count-2_count-as-fault_generator_x8_1_n2) (generator-status-is-starting-up_generator_x8_1) (not (generator-status-is-on_generator_x8_1)) (not (fault-count-2_count-as-fault_generator_x8_1_n1)) (not (dominates-2_hyp11_count-as-fault_generator_x8_1)) (not (dominates-2_hyp10_count-as-fault_generator_x8_1)) (not (dominates-2_hyp9_count-as-fault_generator_x8_1)) (not (dominates-2_hyp8_count-as-fault_generator_x8_1)) (not (dominates-2_hyp7_count-as-fault_generator_x8_1)) (not (dominates-2_hyp6_count-as-fault_generator_x8_1)) (not (dominates-2_hyp5_count-as-fault_generator_x8_1)) (not (dominates-2_hyp4_count-as-fault_generator_x8_1)) (not (dominates-2_hyp3_count-as-fault_generator_x8_1)) (not (dominates-2_hyp2_count-as-fault_generator_x8_1)) (not (dominates-2_hyp1_count-as-fault_generator_x8_1))))
 (:action generator-begin-startup_generator_x8_1_n2_n3
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x8_1) (fault-count-2_count-as-fault_generator_x8_1_n2) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (generator-status-is-starting-up_generator_x8_1) (not (generator-status-is-on_generator_x8_1)) (not (fault-count-2_count-as-fault_generator_x8_1_n2))))
 (:action generator-begin-startup_generator_x10_1_n0_n1
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x10_1) (fault-count-2_count-as-fault_generator_x10_1_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (fault-count-2_count-as-fault_generator_x10_1_n1) (generator-status-is-starting-up_generator_x10_1) (not (generator-status-is-on_generator_x10_1)) (not (fault-count-2_count-as-fault_generator_x10_1_n0)) (not (dominates-2_hyp11_count-as-fault_generator_x10_1)) (not (dominates-2_hyp10_count-as-fault_generator_x10_1)) (not (dominates-2_hyp9_count-as-fault_generator_x10_1)) (not (dominates-2_hyp8_count-as-fault_generator_x10_1)) (not (dominates-2_hyp7_count-as-fault_generator_x10_1)) (not (dominates-2_hyp6_count-as-fault_generator_x10_1)) (not (dominates-2_hyp5_count-as-fault_generator_x10_1)) (not (dominates-2_hyp4_count-as-fault_generator_x10_1)) (not (dominates-2_hyp3_count-as-fault_generator_x10_1)) (not (dominates-2_hyp2_count-as-fault_generator_x10_1)) (not (dominates-2_hyp1_count-as-fault_generator_x10_1))))
 (:action generator-begin-startup_generator_x10_1_n1_n2
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x10_1) (fault-count-2_count-as-fault_generator_x10_1_n1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (fault-count-2_count-as-fault_generator_x10_1_n2) (generator-status-is-starting-up_generator_x10_1) (not (generator-status-is-on_generator_x10_1)) (not (fault-count-2_count-as-fault_generator_x10_1_n1))))
 (:action generator-begin-startup_generator_x10_1_n2_n3
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x10_1) (fault-count-2_count-as-fault_generator_x10_1_n2) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (generator-status-is-starting-up_generator_x10_1) (not (generator-status-is-on_generator_x10_1)) (not (fault-count-2_count-as-fault_generator_x10_1_n2))))
 (:action generator-begin-startup_generator_x12_1_n0_n1
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x12_1) (fault-count-2_count-as-fault_generator_x12_1_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (fault-count-2_count-as-fault_generator_x12_1_n1) (generator-status-is-starting-up_generator_x12_1) (not (generator-status-is-on_generator_x12_1)) (not (fault-count-2_count-as-fault_generator_x12_1_n0)) (not (dominates-2_hyp4_count-as-fault_generator_x12_1)) (not (dominates-2_hyp3_count-as-fault_generator_x12_1)) (not (dominates-2_hyp2_count-as-fault_generator_x12_1)) (not (dominates-2_hyp1_count-as-fault_generator_x12_1))))
 (:action generator-begin-startup_generator_x12_1_n1_n2
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x12_1) (fault-count-2_count-as-fault_generator_x12_1_n1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (fault-count-2_count-as-fault_generator_x12_1_n2) (generator-status-is-starting-up_generator_x12_1) (not (generator-status-is-on_generator_x12_1)) (not (fault-count-2_count-as-fault_generator_x12_1_n1)) (not (dominates-2_hyp9_count-as-fault_generator_x12_1)) (not (dominates-2_hyp8_count-as-fault_generator_x12_1)) (not (dominates-2_hyp5_count-as-fault_generator_x12_1))))
 (:action generator-begin-startup_generator_x12_1_n2_n3
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x12_1) (fault-count-2_count-as-fault_generator_x12_1_n2) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (generator-status-is-starting-up_generator_x12_1) (not (generator-status-is-on_generator_x12_1)) (not (fault-count-2_count-as-fault_generator_x12_1_n2)) (not (dominates-2_hyp11_count-as-fault_generator_x12_1)) (not (dominates-2_hyp10_count-as-fault_generator_x12_1)) (not (dominates-2_hyp7_count-as-fault_generator_x12_1)) (not (dominates-2_hyp6_count-as-fault_generator_x12_1))))
 (:action generator-begin-startup_generator_x18_1_n0_n1
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x18_1) (fault-count-2_count-as-fault_generator_x18_1_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (fault-count-2_count-as-fault_generator_x18_1_n1) (generator-status-is-starting-up_generator_x18_1) (not (generator-status-is-on_generator_x18_1)) (not (fault-count-2_count-as-fault_generator_x18_1_n0)) (not (dominates-2_hyp11_count-as-fault_generator_x18_1)) (not (dominates-2_hyp10_count-as-fault_generator_x18_1)) (not (dominates-2_hyp9_count-as-fault_generator_x18_1)) (not (dominates-2_hyp8_count-as-fault_generator_x18_1)) (not (dominates-2_hyp7_count-as-fault_generator_x18_1)) (not (dominates-2_hyp6_count-as-fault_generator_x18_1)) (not (dominates-2_hyp5_count-as-fault_generator_x18_1)) (not (dominates-2_hyp4_count-as-fault_generator_x18_1)) (not (dominates-2_hyp3_count-as-fault_generator_x18_1)) (not (dominates-2_hyp2_count-as-fault_generator_x18_1)) (not (dominates-2_hyp1_count-as-fault_generator_x18_1))))
 (:action generator-begin-startup_generator_x18_1_n1_n2
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x18_1) (fault-count-2_count-as-fault_generator_x18_1_n1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (fault-count-2_count-as-fault_generator_x18_1_n2) (generator-status-is-starting-up_generator_x18_1) (not (generator-status-is-on_generator_x18_1)) (not (fault-count-2_count-as-fault_generator_x18_1_n1))))
 (:action generator-begin-startup_generator_x18_1_n2_n3
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x18_1) (fault-count-2_count-as-fault_generator_x18_1_n2) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (generator-status-is-starting-up_generator_x18_1) (not (generator-status-is-on_generator_x18_1)) (not (fault-count-2_count-as-fault_generator_x18_1_n2))))
 (:action generator-begin-startup_generator_x14_1_n0_n1
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x14_1) (fault-count-2_count-as-fault_generator_x14_1_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (fault-count-2_count-as-fault_generator_x14_1_n1) (generator-status-is-starting-up_generator_x14_1) (not (generator-status-is-on_generator_x14_1)) (not (fault-count-2_count-as-fault_generator_x14_1_n0)) (not (dominates-2_hyp11_count-as-fault_generator_x14_1)) (not (dominates-2_hyp10_count-as-fault_generator_x14_1)) (not (dominates-2_hyp9_count-as-fault_generator_x14_1)) (not (dominates-2_hyp8_count-as-fault_generator_x14_1)) (not (dominates-2_hyp7_count-as-fault_generator_x14_1)) (not (dominates-2_hyp6_count-as-fault_generator_x14_1)) (not (dominates-2_hyp5_count-as-fault_generator_x14_1)) (not (dominates-2_hyp4_count-as-fault_generator_x14_1)) (not (dominates-2_hyp3_count-as-fault_generator_x14_1)) (not (dominates-2_hyp2_count-as-fault_generator_x14_1)) (not (dominates-2_hyp1_count-as-fault_generator_x14_1))))
 (:action generator-begin-startup_generator_x14_1_n1_n2
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x14_1) (fault-count-2_count-as-fault_generator_x14_1_n1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (fault-count-2_count-as-fault_generator_x14_1_n2) (generator-status-is-starting-up_generator_x14_1) (not (generator-status-is-on_generator_x14_1)) (not (fault-count-2_count-as-fault_generator_x14_1_n1))))
 (:action generator-begin-startup_generator_x14_1_n2_n3
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x14_1) (fault-count-2_count-as-fault_generator_x14_1_n2) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (generator-status-is-starting-up_generator_x14_1) (not (generator-status-is-on_generator_x14_1)) (not (fault-count-2_count-as-fault_generator_x14_1_n2))))
 (:action generator-begin-startup_generator_x16_1_n0_n1
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x16_1) (fault-count-2_count-as-fault_generator_x16_1_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (fault-count-2_count-as-fault_generator_x16_1_n1) (generator-status-is-starting-up_generator_x16_1) (not (generator-status-is-on_generator_x16_1)) (not (fault-count-2_count-as-fault_generator_x16_1_n0)) (not (dominates-2_hyp8_count-as-fault_generator_x16_1)) (not (dominates-2_hyp7_count-as-fault_generator_x16_1)) (not (dominates-2_hyp6_count-as-fault_generator_x16_1)) (not (dominates-2_hyp5_count-as-fault_generator_x16_1)) (not (dominates-2_hyp2_count-as-fault_generator_x16_1)) (not (dominates-2_hyp1_count-as-fault_generator_x16_1))))
 (:action generator-begin-startup_generator_x16_1_n1_n2
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x16_1) (fault-count-2_count-as-fault_generator_x16_1_n1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (fault-count-2_count-as-fault_generator_x16_1_n2) (generator-status-is-starting-up_generator_x16_1) (not (generator-status-is-on_generator_x16_1)) (not (fault-count-2_count-as-fault_generator_x16_1_n1))))
 (:action generator-begin-startup_generator_x16_1_n2_n3
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x16_1) (fault-count-2_count-as-fault_generator_x16_1_n2) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (generator-status-is-starting-up_generator_x16_1) (not (generator-status-is-on_generator_x16_1)) (not (fault-count-2_count-as-fault_generator_x16_1_n2))))
 (:action generator-startup-complete_generator_x8_1
  :parameters ()
  :precondition (and (generator-status-is-starting-up_generator_x8_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (generator-status-is-on_generator_x8_1) (not (generator-status-is-starting-up_generator_x8_1))))
 (:action generator-startup-complete_generator_x10_1
  :parameters ()
  :precondition (and (generator-status-is-starting-up_generator_x10_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (generator-status-is-on_generator_x10_1) (not (generator-status-is-starting-up_generator_x10_1))))
 (:action generator-startup-complete_generator_x12_1
  :parameters ()
  :precondition (and (generator-status-is-starting-up_generator_x12_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (generator-status-is-on_generator_x12_1) (not (generator-status-is-starting-up_generator_x12_1))))
 (:action generator-startup-complete_generator_x18_1
  :parameters ()
  :precondition (and (generator-status-is-starting-up_generator_x18_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (generator-status-is-on_generator_x18_1) (not (generator-status-is-starting-up_generator_x18_1))))
 (:action generator-startup-complete_generator_x14_1
  :parameters ()
  :precondition (and (generator-status-is-starting-up_generator_x14_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (generator-status-is-on_generator_x14_1) (not (generator-status-is-starting-up_generator_x14_1))))
 (:action generator-startup-complete_generator_x16_1
  :parameters ()
  :precondition (and (generator-status-is-starting-up_generator_x16_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (generator-status-is-on_generator_x16_1) (not (generator-status-is-starting-up_generator_x16_1))))
 (:action generator-runback-alarm_generator_x8_1_obs2555_n0_n1
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x8_1_n0) (pending_obs2555) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (fault-count-2_count-as-fault_generator_x8_1_n1) (observed_obs2555) (not (fault-count-2_count-as-fault_generator_x8_1_n0)) (not (pending_obs2555))))
 (:action generator-runback-alarm_generator_x8_1_obs2555_n1_n2
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x8_1_n1) (pending_obs2555) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (fault-count-2_count-as-fault_generator_x8_1_n2) (observed_obs2555) (not (fault-count-2_count-as-fault_generator_x8_1_n1)) (not (dominates-2_hyp11_count-as-fault_generator_x8_1)) (not (dominates-2_hyp10_count-as-fault_generator_x8_1)) (not (dominates-2_hyp9_count-as-fault_generator_x8_1)) (not (dominates-2_hyp8_count-as-fault_generator_x8_1)) (not (dominates-2_hyp7_count-as-fault_generator_x8_1)) (not (dominates-2_hyp6_count-as-fault_generator_x8_1)) (not (dominates-2_hyp5_count-as-fault_generator_x8_1)) (not (dominates-2_hyp4_count-as-fault_generator_x8_1)) (not (dominates-2_hyp3_count-as-fault_generator_x8_1)) (not (dominates-2_hyp2_count-as-fault_generator_x8_1)) (not (dominates-2_hyp1_count-as-fault_generator_x8_1)) (not (pending_obs2555))))
 (:action generator-runback-alarm_generator_x8_1_obs2555_n2_n3
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x8_1_n2) (pending_obs2555) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (observed_obs2555) (not (fault-count-2_count-as-fault_generator_x8_1_n2)) (not (pending_obs2555))))
 (:action generator-runback-alarm_generator_x18_1_obs2548_n0_n1
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x18_1_n0) (pending_obs2548) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (fault-count-2_count-as-fault_generator_x18_1_n1) (observed_obs2548) (not (fault-count-2_count-as-fault_generator_x18_1_n0)) (not (dominates-2_hyp11_count-as-fault_generator_x18_1)) (not (dominates-2_hyp10_count-as-fault_generator_x18_1)) (not (dominates-2_hyp9_count-as-fault_generator_x18_1)) (not (dominates-2_hyp8_count-as-fault_generator_x18_1)) (not (dominates-2_hyp7_count-as-fault_generator_x18_1)) (not (dominates-2_hyp6_count-as-fault_generator_x18_1)) (not (dominates-2_hyp5_count-as-fault_generator_x18_1)) (not (dominates-2_hyp4_count-as-fault_generator_x18_1)) (not (dominates-2_hyp3_count-as-fault_generator_x18_1)) (not (dominates-2_hyp2_count-as-fault_generator_x18_1)) (not (dominates-2_hyp1_count-as-fault_generator_x18_1)) (not (pending_obs2548))))
 (:action generator-runback-alarm_generator_x18_1_obs2548_n1_n2
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x18_1_n1) (pending_obs2548) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (fault-count-2_count-as-fault_generator_x18_1_n2) (observed_obs2548) (not (fault-count-2_count-as-fault_generator_x18_1_n1)) (not (pending_obs2548))))
 (:action generator-runback-alarm_generator_x18_1_obs2548_n2_n3
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x18_1_n2) (pending_obs2548) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (observed_obs2548) (not (fault-count-2_count-as-fault_generator_x18_1_n2)) (not (pending_obs2548))))
 (:action generator-runback-alarm-reset_generator_x12_1_obs2560_n1_n2
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x12_1_n1) (pending_obs2560) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (fault-count-2_count-as-fault_generator_x12_1_n2) (observed_obs2560) (not (fault-count-2_count-as-fault_generator_x12_1_n1)) (not (dominates-2_hyp9_count-as-fault_generator_x12_1)) (not (dominates-2_hyp8_count-as-fault_generator_x12_1)) (not (dominates-2_hyp5_count-as-fault_generator_x12_1)) (not (pending_obs2560))))
 (:action generator-runback-alarm-reset_generator_x12_1_obs2560_n2_n3
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x12_1_n2) (pending_obs2560) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (observed_obs2560) (not (fault-count-2_count-as-fault_generator_x12_1_n2)) (not (dominates-2_hyp11_count-as-fault_generator_x12_1)) (not (dominates-2_hyp10_count-as-fault_generator_x12_1)) (not (dominates-2_hyp7_count-as-fault_generator_x12_1)) (not (dominates-2_hyp6_count-as-fault_generator_x12_1)) (not (pending_obs2560))))
 (:action generator-runback-reset-when-off_generator_x12_1_obs2560
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x12_1) (pending_obs2560) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (observed_obs2560) (not (pending_obs2560))))
 (:action advance-to-obs_obs2545
  :parameters ()
  :precondition (and (observed_obs2544) (future_obs2545) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (pending_obs2545) (not (future_obs2545))))
 (:action advance-to-obs_obs2546
  :parameters ()
  :precondition (and (observed_obs2545) (future_obs2546) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (pending_obs2546) (not (future_obs2546))))
 (:action advance-to-obs_obs2547
  :parameters ()
  :precondition (and (observed_obs2546) (future_obs2547) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (pending_obs2547) (not (future_obs2547))))
 (:action advance-to-obs_obs2548
  :parameters ()
  :precondition (and (observed_obs2546) (future_obs2548) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (pending_obs2548) (not (future_obs2548))))
 (:action advance-to-obs_obs2549
  :parameters ()
  :precondition (and (observed_obs2546) (future_obs2549) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (pending_obs2549) (not (future_obs2549))))
 (:action advance-to-obs_obs2550
  :parameters ()
  :precondition (and (observed_obs2547) (observed_obs2549) (observed_obs2548) (future_obs2550) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (pending_obs2550) (not (breaker-auto-reopen-wait_breaker_x3_x4_obs2547)) (not (future_obs2550))))
 (:action advance-to-obs_obs2551
  :parameters ()
  :precondition (and (observed_obs2550) (future_obs2551) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (pending_obs2551) (not (future_obs2551))))
 (:action advance-to-obs_obs2552
  :parameters ()
  :precondition (and (observed_obs2551) (future_obs2552) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (pending_obs2552) (not (future_obs2552))))
 (:action advance-to-obs_obs2553
  :parameters ()
  :precondition (and (observed_obs2552) (future_obs2553) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (pending_obs2553) (not (future_obs2553))))
 (:action advance-to-obs_obs2554
  :parameters ()
  :precondition (and (observed_obs2552) (future_obs2554) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (pending_obs2554) (not (future_obs2554))))
 (:action advance-to-obs_obs2555
  :parameters ()
  :precondition (and (observed_obs2554) (observed_obs2553) (future_obs2555) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (pending_obs2555) (not (future_obs2555))))
 (:action advance-to-obs_obs2556
  :parameters ()
  :precondition (and (observed_obs2555) (future_obs2556) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (pending_obs2556) (not (future_obs2556))))
 (:action advance-to-obs_obs2557
  :parameters ()
  :precondition (and (observed_obs2555) (future_obs2557) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (pending_obs2557) (not (future_obs2557))))
 (:action advance-to-obs_obs2558
  :parameters ()
  :precondition (and (observed_obs2556) (observed_obs2557) (future_obs2558) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (pending_obs2558) (not (future_obs2558))))
 (:action advance-to-obs_obs2559
  :parameters ()
  :precondition (and (observed_obs2558) (future_obs2559) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (pending_obs2559) (not (future_obs2559))))
 (:action advance-to-obs_obs2560
  :parameters ()
  :precondition (and (observed_obs2559) (future_obs2560) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (pending_obs2560) (not (future_obs2560))))
 (:action advance-to-obs_obs2561
  :parameters ()
  :precondition (and (observed_obs2559) (future_obs2561) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (pending_obs2561) (not (future_obs2561))))
 (:action advance-to-obs_obs2562
  :parameters ()
  :precondition (and (observed_obs2561) (observed_obs2560) (future_obs2562) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (pending_obs2562) (not (future_obs2562))))
 (:action advance-to-obs_obs2563
  :parameters ()
  :precondition (and (observed_obs2562) (future_obs2563) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (pending_obs2563) (not (future_obs2563))))
 (:action set_goal_0_constraint0
  :parameters ()
  :precondition (and (observed_obs2563) (dominates-2_hyp11_count-as-fault_breaker_x1_x2) (observed_obs2546) (observed_obs2550) (observed_obs2554) (observed_obs2544) (observed_obs2561) (observed_obs2556) (observed_obs2559) (observed_obs2547) (observed_obs2549) (observed_obs2551) (observed_obs2545) (observed_obs2558) (observed_obs2562) (observed_obs2557) (observed_obs2552) (observed_obs2553) (observed_obs2555) (observed_obs2548) (observed_obs2560) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (achieved_constraint0) (not (not_at_end_constraint0))))
 (:action set_goal_2_constraint0
  :parameters ()
  :precondition (and (observed_obs2563) (observed_obs2546) (observed_obs2550) (observed_obs2554) (observed_obs2544) (observed_obs2561) (observed_obs2556) (dominates-2_hyp11_count-as-fault_breaker_x15_x16) (observed_obs2559) (observed_obs2547) (observed_obs2549) (observed_obs2551) (observed_obs2545) (observed_obs2558) (observed_obs2562) (observed_obs2557) (observed_obs2552) (observed_obs2553) (observed_obs2555) (observed_obs2548) (observed_obs2560) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (achieved_constraint0) (not (not_at_end_constraint0))))
 (:action set_goal_6_constraint0
  :parameters ()
  :precondition (and (observed_obs2563) (observed_obs2546) (observed_obs2550) (observed_obs2554) (observed_obs2544) (observed_obs2561) (observed_obs2556) (observed_obs2559) (observed_obs2547) (observed_obs2549) (observed_obs2551) (observed_obs2545) (observed_obs2558) (dominates-2_hyp11_count-as-fault_generator_x8_1) (observed_obs2562) (observed_obs2557) (observed_obs2552) (observed_obs2553) (observed_obs2555) (observed_obs2548) (observed_obs2560) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (achieved_constraint0) (not (not_at_end_constraint0))))
 (:action set_goal_8_constraint0
  :parameters ()
  :precondition (and (observed_obs2563) (observed_obs2546) (observed_obs2550) (observed_obs2554) (observed_obs2544) (observed_obs2561) (observed_obs2556) (observed_obs2559) (observed_obs2547) (observed_obs2549) (observed_obs2551) (observed_obs2545) (observed_obs2558) (dominates-2_hyp11_count-as-fault_generator_x12_1) (observed_obs2562) (observed_obs2557) (observed_obs2552) (observed_obs2553) (observed_obs2555) (observed_obs2548) (observed_obs2560) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (achieved_constraint0) (not (not_at_end_constraint0))))
 (:action set_goal_2_constraint1
  :parameters ()
  :precondition (and (observed_obs2563) (observed_obs2546) (observed_obs2550) (observed_obs2554) (observed_obs2544) (observed_obs2561) (observed_obs2556) (dominates-2_hyp10_count-as-fault_breaker_x15_x16) (observed_obs2559) (observed_obs2547) (observed_obs2549) (observed_obs2551) (observed_obs2545) (observed_obs2558) (observed_obs2562) (observed_obs2557) (observed_obs2552) (observed_obs2553) (observed_obs2555) (observed_obs2548) (observed_obs2560) (achieved_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (achieved_constraint1) (not (not_at_end_constraint1))))
 (:action set_goal_5_constraint1
  :parameters ()
  :precondition (and (observed_obs2563) (observed_obs2546) (observed_obs2550) (observed_obs2554) (observed_obs2544) (observed_obs2561) (observed_obs2556) (observed_obs2559) (observed_obs2547) (observed_obs2549) (observed_obs2551) (observed_obs2545) (dominates-2_hyp10_count-as-fault_line_x19_x20) (observed_obs2558) (observed_obs2562) (observed_obs2557) (observed_obs2552) (observed_obs2553) (observed_obs2555) (observed_obs2548) (observed_obs2560) (achieved_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (achieved_constraint1) (not (not_at_end_constraint1))))
 (:action set_goal_7_constraint1
  :parameters ()
  :precondition (and (observed_obs2563) (observed_obs2546) (observed_obs2550) (observed_obs2554) (observed_obs2544) (observed_obs2561) (observed_obs2556) (observed_obs2559) (observed_obs2547) (observed_obs2549) (observed_obs2551) (observed_obs2545) (observed_obs2558) (dominates-2_hyp10_count-as-fault_generator_x8_1) (observed_obs2562) (observed_obs2557) (observed_obs2552) (observed_obs2553) (observed_obs2555) (observed_obs2548) (observed_obs2560) (achieved_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (achieved_constraint1) (not (not_at_end_constraint1))))
 (:action set_goal_9_constraint1
  :parameters ()
  :precondition (and (observed_obs2563) (observed_obs2546) (observed_obs2550) (observed_obs2554) (observed_obs2544) (observed_obs2561) (observed_obs2556) (observed_obs2559) (observed_obs2547) (observed_obs2549) (observed_obs2551) (observed_obs2545) (observed_obs2558) (dominates-2_hyp10_count-as-fault_generator_x12_1) (observed_obs2562) (observed_obs2557) (observed_obs2552) (observed_obs2553) (observed_obs2555) (observed_obs2548) (observed_obs2560) (achieved_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (achieved_constraint1) (not (not_at_end_constraint1))))
 (:action set_goal_2_constraint2
  :parameters ()
  :precondition (and (observed_obs2563) (observed_obs2546) (observed_obs2550) (observed_obs2554) (observed_obs2544) (dominates-2_hyp9_count-as-fault_breaker_x11_x12) (observed_obs2561) (observed_obs2556) (observed_obs2559) (observed_obs2547) (observed_obs2549) (observed_obs2551) (observed_obs2545) (observed_obs2558) (observed_obs2562) (observed_obs2557) (observed_obs2552) (observed_obs2553) (observed_obs2555) (observed_obs2548) (observed_obs2560) (achieved_constraint0) (achieved_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (achieved_constraint2) (not (not_at_end_constraint2))))
 (:action set_goal_3_constraint2
  :parameters ()
  :precondition (and (observed_obs2563) (observed_obs2546) (observed_obs2550) (observed_obs2554) (observed_obs2544) (observed_obs2561) (observed_obs2556) (dominates-2_hyp9_count-as-fault_breaker_x15_x16) (observed_obs2559) (observed_obs2547) (observed_obs2549) (observed_obs2551) (observed_obs2545) (observed_obs2558) (observed_obs2562) (observed_obs2557) (observed_obs2552) (observed_obs2553) (observed_obs2555) (observed_obs2548) (observed_obs2560) (achieved_constraint0) (achieved_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (achieved_constraint2) (not (not_at_end_constraint2))))
 (:action set_goal_6_constraint2
  :parameters ()
  :precondition (and (observed_obs2563) (observed_obs2546) (observed_obs2550) (observed_obs2554) (observed_obs2544) (observed_obs2561) (observed_obs2556) (observed_obs2559) (observed_obs2547) (observed_obs2549) (observed_obs2551) (observed_obs2545) (dominates-2_hyp9_count-as-fault_line_x19_x20) (observed_obs2558) (observed_obs2562) (observed_obs2557) (observed_obs2552) (observed_obs2553) (observed_obs2555) (observed_obs2548) (observed_obs2560) (achieved_constraint0) (achieved_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (achieved_constraint2) (not (not_at_end_constraint2))))
 (:action set_goal_8_constraint2
  :parameters ()
  :precondition (and (observed_obs2563) (observed_obs2546) (observed_obs2550) (observed_obs2554) (observed_obs2544) (observed_obs2561) (observed_obs2556) (observed_obs2559) (observed_obs2547) (observed_obs2549) (observed_obs2551) (observed_obs2545) (observed_obs2558) (dominates-2_hyp9_count-as-fault_generator_x8_1) (observed_obs2562) (observed_obs2557) (observed_obs2552) (observed_obs2553) (observed_obs2555) (observed_obs2548) (observed_obs2560) (achieved_constraint0) (achieved_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (achieved_constraint2) (not (not_at_end_constraint2))))
 (:action set_goal_10_constraint2
  :parameters ()
  :precondition (and (observed_obs2563) (observed_obs2546) (observed_obs2550) (observed_obs2554) (observed_obs2544) (observed_obs2561) (observed_obs2556) (observed_obs2559) (observed_obs2547) (observed_obs2549) (observed_obs2551) (observed_obs2545) (observed_obs2558) (dominates-2_hyp9_count-as-fault_generator_x12_1) (observed_obs2562) (observed_obs2557) (observed_obs2552) (observed_obs2553) (observed_obs2555) (observed_obs2548) (observed_obs2560) (achieved_constraint0) (achieved_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (achieved_constraint2) (not (not_at_end_constraint2))))
 (:action set_goal_0_constraint3
  :parameters ()
  :precondition (and (observed_obs2563) (dominates-2_hyp8_count-as-fault_breaker_x1_x2) (observed_obs2546) (observed_obs2550) (observed_obs2554) (observed_obs2544) (observed_obs2561) (observed_obs2556) (observed_obs2559) (observed_obs2547) (observed_obs2549) (observed_obs2551) (observed_obs2545) (observed_obs2558) (observed_obs2562) (observed_obs2557) (observed_obs2552) (observed_obs2553) (observed_obs2555) (observed_obs2548) (observed_obs2560) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (achieved_constraint3) (not (not_at_end_constraint3))))
 (:action set_goal_2_constraint3
  :parameters ()
  :precondition (and (observed_obs2563) (observed_obs2546) (observed_obs2550) (observed_obs2554) (observed_obs2544) (dominates-2_hyp8_count-as-fault_breaker_x11_x12) (observed_obs2561) (observed_obs2556) (observed_obs2559) (observed_obs2547) (observed_obs2549) (observed_obs2551) (observed_obs2545) (observed_obs2558) (observed_obs2562) (observed_obs2557) (observed_obs2552) (observed_obs2553) (observed_obs2555) (observed_obs2548) (observed_obs2560) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (achieved_constraint3) (not (not_at_end_constraint3))))
 (:action set_goal_6_constraint3
  :parameters ()
  :precondition (and (observed_obs2563) (observed_obs2546) (observed_obs2550) (observed_obs2554) (observed_obs2544) (observed_obs2561) (observed_obs2556) (observed_obs2559) (observed_obs2547) (observed_obs2549) (observed_obs2551) (observed_obs2545) (observed_obs2558) (dominates-2_hyp8_count-as-fault_generator_x8_1) (observed_obs2562) (observed_obs2557) (observed_obs2552) (observed_obs2553) (observed_obs2555) (observed_obs2548) (observed_obs2560) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (achieved_constraint3) (not (not_at_end_constraint3))))
 (:action set_goal_8_constraint3
  :parameters ()
  :precondition (and (observed_obs2563) (observed_obs2546) (observed_obs2550) (observed_obs2554) (observed_obs2544) (observed_obs2561) (observed_obs2556) (observed_obs2559) (observed_obs2547) (observed_obs2549) (observed_obs2551) (observed_obs2545) (observed_obs2558) (dominates-2_hyp8_count-as-fault_generator_x12_1) (observed_obs2562) (observed_obs2557) (observed_obs2552) (observed_obs2553) (observed_obs2555) (observed_obs2548) (observed_obs2560) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (achieved_constraint3) (not (not_at_end_constraint3))))
 (:action set_goal_11_constraint3
  :parameters ()
  :precondition (and (observed_obs2563) (observed_obs2546) (observed_obs2550) (observed_obs2554) (observed_obs2544) (observed_obs2561) (observed_obs2556) (observed_obs2559) (observed_obs2547) (observed_obs2549) (observed_obs2551) (observed_obs2545) (observed_obs2558) (dominates-2_hyp8_count-as-fault_generator_x16_1) (observed_obs2562) (observed_obs2557) (observed_obs2552) (observed_obs2553) (observed_obs2555) (observed_obs2548) (observed_obs2560) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (not_at_end_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (achieved_constraint3) (not (not_at_end_constraint3))))
 (:action set_goal_0_constraint4
  :parameters ()
  :precondition (and (observed_obs2563) (dominates-2_hyp7_count-as-fault_breaker_x1_x2) (observed_obs2546) (observed_obs2550) (observed_obs2554) (observed_obs2544) (observed_obs2561) (observed_obs2556) (observed_obs2559) (observed_obs2547) (observed_obs2549) (observed_obs2551) (observed_obs2545) (observed_obs2558) (observed_obs2562) (observed_obs2557) (observed_obs2552) (observed_obs2553) (observed_obs2555) (observed_obs2548) (observed_obs2560) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (achieved_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (achieved_constraint4) (not (not_at_end_constraint4))))
 (:action set_goal_5_constraint4
  :parameters ()
  :precondition (and (observed_obs2563) (observed_obs2546) (observed_obs2550) (observed_obs2554) (observed_obs2544) (observed_obs2561) (observed_obs2556) (observed_obs2559) (observed_obs2547) (observed_obs2549) (observed_obs2551) (observed_obs2545) (observed_obs2558) (dominates-2_hyp7_count-as-fault_generator_x8_1) (observed_obs2562) (observed_obs2557) (observed_obs2552) (observed_obs2553) (observed_obs2555) (observed_obs2548) (observed_obs2560) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (achieved_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (achieved_constraint4) (not (not_at_end_constraint4))))
 (:action set_goal_7_constraint4
  :parameters ()
  :precondition (and (observed_obs2563) (observed_obs2546) (observed_obs2550) (observed_obs2554) (observed_obs2544) (observed_obs2561) (observed_obs2556) (observed_obs2559) (observed_obs2547) (observed_obs2549) (observed_obs2551) (observed_obs2545) (observed_obs2558) (dominates-2_hyp7_count-as-fault_generator_x12_1) (observed_obs2562) (observed_obs2557) (observed_obs2552) (observed_obs2553) (observed_obs2555) (observed_obs2548) (observed_obs2560) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (achieved_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (achieved_constraint4) (not (not_at_end_constraint4))))
 (:action set_goal_10_constraint4
  :parameters ()
  :precondition (and (observed_obs2563) (observed_obs2546) (observed_obs2550) (observed_obs2554) (observed_obs2544) (observed_obs2561) (observed_obs2556) (observed_obs2559) (observed_obs2547) (observed_obs2549) (observed_obs2551) (observed_obs2545) (observed_obs2558) (dominates-2_hyp7_count-as-fault_generator_x16_1) (observed_obs2562) (observed_obs2557) (observed_obs2552) (observed_obs2553) (observed_obs2555) (observed_obs2548) (observed_obs2560) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (achieved_constraint3) (not_at_end_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (achieved_constraint4) (not (not_at_end_constraint4))))
 (:action set_goal_4_constraint5
  :parameters ()
  :precondition (and (observed_obs2563) (observed_obs2546) (observed_obs2550) (observed_obs2554) (observed_obs2544) (observed_obs2561) (observed_obs2556) (observed_obs2559) (observed_obs2547) (observed_obs2549) (observed_obs2551) (observed_obs2545) (dominates-2_hyp6_count-as-fault_line_x19_x20) (observed_obs2558) (observed_obs2562) (observed_obs2557) (observed_obs2552) (observed_obs2553) (observed_obs2555) (observed_obs2548) (observed_obs2560) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (achieved_constraint3) (achieved_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (achieved_constraint5) (not (not_at_end_constraint5))))
 (:action set_goal_6_constraint5
  :parameters ()
  :precondition (and (observed_obs2563) (observed_obs2546) (observed_obs2550) (observed_obs2554) (observed_obs2544) (observed_obs2561) (observed_obs2556) (observed_obs2559) (observed_obs2547) (observed_obs2549) (observed_obs2551) (observed_obs2545) (observed_obs2558) (dominates-2_hyp6_count-as-fault_generator_x8_1) (observed_obs2562) (observed_obs2557) (observed_obs2552) (observed_obs2553) (observed_obs2555) (observed_obs2548) (observed_obs2560) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (achieved_constraint3) (achieved_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (achieved_constraint5) (not (not_at_end_constraint5))))
 (:action set_goal_8_constraint5
  :parameters ()
  :precondition (and (observed_obs2563) (observed_obs2546) (observed_obs2550) (observed_obs2554) (observed_obs2544) (observed_obs2561) (observed_obs2556) (observed_obs2559) (observed_obs2547) (observed_obs2549) (observed_obs2551) (observed_obs2545) (observed_obs2558) (dominates-2_hyp6_count-as-fault_generator_x12_1) (observed_obs2562) (observed_obs2557) (observed_obs2552) (observed_obs2553) (observed_obs2555) (observed_obs2548) (observed_obs2560) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (achieved_constraint3) (achieved_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (achieved_constraint5) (not (not_at_end_constraint5))))
 (:action set_goal_11_constraint5
  :parameters ()
  :precondition (and (observed_obs2563) (observed_obs2546) (observed_obs2550) (observed_obs2554) (observed_obs2544) (observed_obs2561) (observed_obs2556) (observed_obs2559) (observed_obs2547) (observed_obs2549) (observed_obs2551) (observed_obs2545) (observed_obs2558) (dominates-2_hyp6_count-as-fault_generator_x16_1) (observed_obs2562) (observed_obs2557) (observed_obs2552) (observed_obs2553) (observed_obs2555) (observed_obs2548) (observed_obs2560) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (achieved_constraint3) (achieved_constraint4) (not_at_end_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (achieved_constraint5) (not (not_at_end_constraint5))))
 (:action set_goal_2_constraint6
  :parameters ()
  :precondition (and (observed_obs2563) (observed_obs2546) (observed_obs2550) (observed_obs2554) (observed_obs2544) (dominates-2_hyp5_count-as-fault_breaker_x11_x12) (observed_obs2561) (observed_obs2556) (observed_obs2559) (observed_obs2547) (observed_obs2549) (observed_obs2551) (observed_obs2545) (observed_obs2558) (observed_obs2562) (observed_obs2557) (observed_obs2552) (observed_obs2553) (observed_obs2555) (observed_obs2548) (observed_obs2560) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (achieved_constraint3) (achieved_constraint4) (achieved_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (achieved_constraint6) (not (not_at_end_constraint6))))
 (:action set_goal_5_constraint6
  :parameters ()
  :precondition (and (observed_obs2563) (observed_obs2546) (observed_obs2550) (observed_obs2554) (observed_obs2544) (observed_obs2561) (observed_obs2556) (observed_obs2559) (observed_obs2547) (observed_obs2549) (observed_obs2551) (observed_obs2545) (dominates-2_hyp5_count-as-fault_line_x19_x20) (observed_obs2558) (observed_obs2562) (observed_obs2557) (observed_obs2552) (observed_obs2553) (observed_obs2555) (observed_obs2548) (observed_obs2560) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (achieved_constraint3) (achieved_constraint4) (achieved_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (achieved_constraint6) (not (not_at_end_constraint6))))
 (:action set_goal_7_constraint6
  :parameters ()
  :precondition (and (observed_obs2563) (observed_obs2546) (observed_obs2550) (observed_obs2554) (observed_obs2544) (observed_obs2561) (observed_obs2556) (observed_obs2559) (observed_obs2547) (observed_obs2549) (observed_obs2551) (observed_obs2545) (observed_obs2558) (dominates-2_hyp5_count-as-fault_generator_x8_1) (observed_obs2562) (observed_obs2557) (observed_obs2552) (observed_obs2553) (observed_obs2555) (observed_obs2548) (observed_obs2560) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (achieved_constraint3) (achieved_constraint4) (achieved_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (achieved_constraint6) (not (not_at_end_constraint6))))
 (:action set_goal_9_constraint6
  :parameters ()
  :precondition (and (observed_obs2563) (observed_obs2546) (observed_obs2550) (observed_obs2554) (observed_obs2544) (observed_obs2561) (observed_obs2556) (observed_obs2559) (observed_obs2547) (observed_obs2549) (observed_obs2551) (observed_obs2545) (observed_obs2558) (dominates-2_hyp5_count-as-fault_generator_x12_1) (observed_obs2562) (observed_obs2557) (observed_obs2552) (observed_obs2553) (observed_obs2555) (observed_obs2548) (observed_obs2560) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (achieved_constraint3) (achieved_constraint4) (achieved_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (achieved_constraint6) (not (not_at_end_constraint6))))
 (:action set_goal_12_constraint6
  :parameters ()
  :precondition (and (observed_obs2563) (observed_obs2546) (observed_obs2550) (observed_obs2554) (observed_obs2544) (observed_obs2561) (observed_obs2556) (observed_obs2559) (observed_obs2547) (observed_obs2549) (observed_obs2551) (observed_obs2545) (observed_obs2558) (dominates-2_hyp5_count-as-fault_generator_x16_1) (observed_obs2562) (observed_obs2557) (observed_obs2552) (observed_obs2553) (observed_obs2555) (observed_obs2548) (observed_obs2560) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (achieved_constraint3) (achieved_constraint4) (achieved_constraint5) (not_at_end_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (achieved_constraint6) (not (not_at_end_constraint6))))
 (:action set_goal_2_constraint7
  :parameters ()
  :precondition (and (observed_obs2563) (observed_obs2546) (observed_obs2550) (observed_obs2554) (observed_obs2544) (observed_obs2561) (observed_obs2556) (dominates-2_hyp4_count-as-fault_breaker_x15_x16) (observed_obs2559) (observed_obs2547) (observed_obs2549) (observed_obs2551) (observed_obs2545) (observed_obs2558) (observed_obs2562) (observed_obs2557) (observed_obs2552) (observed_obs2553) (observed_obs2555) (observed_obs2548) (observed_obs2560) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (achieved_constraint3) (achieved_constraint4) (achieved_constraint5) (achieved_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (achieved_constraint7) (not (not_at_end_constraint7))))
 (:action set_goal_5_constraint7
  :parameters ()
  :precondition (and (observed_obs2563) (observed_obs2546) (observed_obs2550) (observed_obs2554) (observed_obs2544) (observed_obs2561) (observed_obs2556) (observed_obs2559) (observed_obs2547) (observed_obs2549) (observed_obs2551) (observed_obs2545) (dominates-2_hyp4_count-as-fault_bus_x12) (observed_obs2558) (observed_obs2562) (observed_obs2557) (observed_obs2552) (observed_obs2553) (observed_obs2555) (observed_obs2548) (observed_obs2560) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (achieved_constraint3) (achieved_constraint4) (achieved_constraint5) (achieved_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (achieved_constraint7) (not (not_at_end_constraint7))))
 (:action set_goal_6_constraint7
  :parameters ()
  :precondition (and (observed_obs2563) (observed_obs2546) (observed_obs2550) (observed_obs2554) (observed_obs2544) (observed_obs2561) (observed_obs2556) (observed_obs2559) (observed_obs2547) (observed_obs2549) (observed_obs2551) (observed_obs2545) (dominates-2_hyp4_count-as-fault_line_x19_x20) (observed_obs2558) (observed_obs2562) (observed_obs2557) (observed_obs2552) (observed_obs2553) (observed_obs2555) (observed_obs2548) (observed_obs2560) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (achieved_constraint3) (achieved_constraint4) (achieved_constraint5) (achieved_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (achieved_constraint7) (not (not_at_end_constraint7))))
 (:action set_goal_8_constraint7
  :parameters ()
  :precondition (and (observed_obs2563) (observed_obs2546) (observed_obs2550) (observed_obs2554) (observed_obs2544) (observed_obs2561) (observed_obs2556) (observed_obs2559) (observed_obs2547) (observed_obs2549) (observed_obs2551) (observed_obs2545) (observed_obs2558) (dominates-2_hyp4_count-as-fault_generator_x8_1) (observed_obs2562) (observed_obs2557) (observed_obs2552) (observed_obs2553) (observed_obs2555) (observed_obs2548) (observed_obs2560) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (achieved_constraint3) (achieved_constraint4) (achieved_constraint5) (achieved_constraint6) (not_at_end_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (achieved_constraint7) (not (not_at_end_constraint7))))
 (:action set_goal_0_constraint8
  :parameters ()
  :precondition (and (observed_obs2563) (dominates-2_hyp3_count-as-fault_breaker_x1_x2) (observed_obs2546) (observed_obs2550) (observed_obs2554) (observed_obs2544) (observed_obs2561) (observed_obs2556) (observed_obs2559) (observed_obs2547) (observed_obs2549) (observed_obs2551) (observed_obs2545) (observed_obs2558) (observed_obs2562) (observed_obs2557) (observed_obs2552) (observed_obs2553) (observed_obs2555) (observed_obs2548) (observed_obs2560) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (achieved_constraint3) (achieved_constraint4) (achieved_constraint5) (achieved_constraint6) (achieved_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (achieved_constraint8) (not (not_at_end_constraint8))))
 (:action set_goal_2_constraint8
  :parameters ()
  :precondition (and (observed_obs2563) (observed_obs2546) (observed_obs2550) (observed_obs2554) (observed_obs2544) (observed_obs2561) (observed_obs2556) (dominates-2_hyp3_count-as-fault_breaker_x15_x16) (observed_obs2559) (observed_obs2547) (observed_obs2549) (observed_obs2551) (observed_obs2545) (observed_obs2558) (observed_obs2562) (observed_obs2557) (observed_obs2552) (observed_obs2553) (observed_obs2555) (observed_obs2548) (observed_obs2560) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (achieved_constraint3) (achieved_constraint4) (achieved_constraint5) (achieved_constraint6) (achieved_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (achieved_constraint8) (not (not_at_end_constraint8))))
 (:action set_goal_5_constraint8
  :parameters ()
  :precondition (and (observed_obs2563) (observed_obs2546) (observed_obs2550) (observed_obs2554) (observed_obs2544) (observed_obs2561) (observed_obs2556) (observed_obs2559) (observed_obs2547) (observed_obs2549) (observed_obs2551) (observed_obs2545) (dominates-2_hyp3_count-as-fault_bus_x12) (observed_obs2558) (observed_obs2562) (observed_obs2557) (observed_obs2552) (observed_obs2553) (observed_obs2555) (observed_obs2548) (observed_obs2560) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (achieved_constraint3) (achieved_constraint4) (achieved_constraint5) (achieved_constraint6) (achieved_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (achieved_constraint8) (not (not_at_end_constraint8))))
 (:action set_goal_7_constraint8
  :parameters ()
  :precondition (and (observed_obs2563) (observed_obs2546) (observed_obs2550) (observed_obs2554) (observed_obs2544) (observed_obs2561) (observed_obs2556) (observed_obs2559) (observed_obs2547) (observed_obs2549) (observed_obs2551) (observed_obs2545) (observed_obs2558) (dominates-2_hyp3_count-as-fault_generator_x8_1) (observed_obs2562) (observed_obs2557) (observed_obs2552) (observed_obs2553) (observed_obs2555) (observed_obs2548) (observed_obs2560) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (achieved_constraint3) (achieved_constraint4) (achieved_constraint5) (achieved_constraint6) (achieved_constraint7) (not_at_end_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (achieved_constraint8) (not (not_at_end_constraint8))))
 (:action set_goal_0_constraint9
  :parameters ()
  :precondition (and (observed_obs2563) (dominates-2_hyp2_count-as-fault_breaker_x1_x2) (observed_obs2546) (observed_obs2550) (observed_obs2554) (observed_obs2544) (observed_obs2561) (observed_obs2556) (observed_obs2559) (observed_obs2547) (observed_obs2549) (observed_obs2551) (observed_obs2545) (observed_obs2558) (observed_obs2562) (observed_obs2557) (observed_obs2552) (observed_obs2553) (observed_obs2555) (observed_obs2548) (observed_obs2560) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (achieved_constraint3) (achieved_constraint4) (achieved_constraint5) (achieved_constraint6) (achieved_constraint7) (achieved_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (achieved_constraint9) (not (not_at_end_constraint9))))
 (:action set_goal_4_constraint9
  :parameters ()
  :precondition (and (observed_obs2563) (observed_obs2546) (observed_obs2550) (observed_obs2554) (observed_obs2544) (observed_obs2561) (observed_obs2556) (observed_obs2559) (observed_obs2547) (observed_obs2549) (observed_obs2551) (observed_obs2545) (dominates-2_hyp2_count-as-fault_bus_x12) (observed_obs2558) (observed_obs2562) (observed_obs2557) (observed_obs2552) (observed_obs2553) (observed_obs2555) (observed_obs2548) (observed_obs2560) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (achieved_constraint3) (achieved_constraint4) (achieved_constraint5) (achieved_constraint6) (achieved_constraint7) (achieved_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (achieved_constraint9) (not (not_at_end_constraint9))))
 (:action set_goal_6_constraint9
  :parameters ()
  :precondition (and (observed_obs2563) (observed_obs2546) (observed_obs2550) (observed_obs2554) (observed_obs2544) (observed_obs2561) (observed_obs2556) (observed_obs2559) (observed_obs2547) (observed_obs2549) (observed_obs2551) (observed_obs2545) (observed_obs2558) (dominates-2_hyp2_count-as-fault_generator_x8_1) (observed_obs2562) (observed_obs2557) (observed_obs2552) (observed_obs2553) (observed_obs2555) (observed_obs2548) (observed_obs2560) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (achieved_constraint3) (achieved_constraint4) (achieved_constraint5) (achieved_constraint6) (achieved_constraint7) (achieved_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (achieved_constraint9) (not (not_at_end_constraint9))))
 (:action set_goal_11_constraint9
  :parameters ()
  :precondition (and (observed_obs2563) (observed_obs2546) (observed_obs2550) (observed_obs2554) (observed_obs2544) (observed_obs2561) (observed_obs2556) (observed_obs2559) (observed_obs2547) (observed_obs2549) (observed_obs2551) (observed_obs2545) (observed_obs2558) (dominates-2_hyp2_count-as-fault_generator_x16_1) (observed_obs2562) (observed_obs2557) (observed_obs2552) (observed_obs2553) (observed_obs2555) (observed_obs2548) (observed_obs2560) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (achieved_constraint3) (achieved_constraint4) (achieved_constraint5) (achieved_constraint6) (achieved_constraint7) (achieved_constraint8) (not_at_end_constraint9) (not_at_end_constraint10))
  :effect (and (achieved_constraint9) (not (not_at_end_constraint9))))
 (:action set_goal_4_constraint10
  :parameters ()
  :precondition (and (observed_obs2563) (observed_obs2546) (observed_obs2550) (observed_obs2554) (observed_obs2544) (observed_obs2561) (observed_obs2556) (observed_obs2559) (observed_obs2547) (observed_obs2549) (observed_obs2551) (observed_obs2545) (dominates-2_hyp1_count-as-fault_bus_x12) (observed_obs2558) (observed_obs2562) (observed_obs2557) (observed_obs2552) (observed_obs2553) (observed_obs2555) (observed_obs2548) (observed_obs2560) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (achieved_constraint3) (achieved_constraint4) (achieved_constraint5) (achieved_constraint6) (achieved_constraint7) (achieved_constraint8) (achieved_constraint9) (not_at_end_constraint10))
  :effect (and (achieved_constraint10) (not (not_at_end_constraint10))))
 (:action set_goal_5_constraint10
  :parameters ()
  :precondition (and (observed_obs2563) (observed_obs2546) (observed_obs2550) (observed_obs2554) (observed_obs2544) (observed_obs2561) (observed_obs2556) (observed_obs2559) (observed_obs2547) (observed_obs2549) (observed_obs2551) (observed_obs2545) (dominates-2_hyp1_count-as-fault_line_x19_x20) (observed_obs2558) (observed_obs2562) (observed_obs2557) (observed_obs2552) (observed_obs2553) (observed_obs2555) (observed_obs2548) (observed_obs2560) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (achieved_constraint3) (achieved_constraint4) (achieved_constraint5) (achieved_constraint6) (achieved_constraint7) (achieved_constraint8) (achieved_constraint9) (not_at_end_constraint10))
  :effect (and (achieved_constraint10) (not (not_at_end_constraint10))))
 (:action set_goal_7_constraint10
  :parameters ()
  :precondition (and (observed_obs2563) (observed_obs2546) (observed_obs2550) (observed_obs2554) (observed_obs2544) (observed_obs2561) (observed_obs2556) (observed_obs2559) (observed_obs2547) (observed_obs2549) (observed_obs2551) (observed_obs2545) (observed_obs2558) (dominates-2_hyp1_count-as-fault_generator_x8_1) (observed_obs2562) (observed_obs2557) (observed_obs2552) (observed_obs2553) (observed_obs2555) (observed_obs2548) (observed_obs2560) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (achieved_constraint3) (achieved_constraint4) (achieved_constraint5) (achieved_constraint6) (achieved_constraint7) (achieved_constraint8) (achieved_constraint9) (not_at_end_constraint10))
  :effect (and (achieved_constraint10) (not (not_at_end_constraint10))))
 (:action set_goal_12_constraint10
  :parameters ()
  :precondition (and (observed_obs2563) (observed_obs2546) (observed_obs2550) (observed_obs2554) (observed_obs2544) (observed_obs2561) (observed_obs2556) (observed_obs2559) (observed_obs2547) (observed_obs2549) (observed_obs2551) (observed_obs2545) (observed_obs2558) (dominates-2_hyp1_count-as-fault_generator_x16_1) (observed_obs2562) (observed_obs2557) (observed_obs2552) (observed_obs2553) (observed_obs2555) (observed_obs2548) (observed_obs2560) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (achieved_constraint3) (achieved_constraint4) (achieved_constraint5) (achieved_constraint6) (achieved_constraint7) (achieved_constraint8) (achieved_constraint9) (not_at_end_constraint10))
  :effect (and (achieved_constraint10) (not (not_at_end_constraint10))))
)
