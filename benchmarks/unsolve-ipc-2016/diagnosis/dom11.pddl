(define (domain appn-pls)
 (:requirements :strips :equality)
 (:predicates (breaker-state-is-unknown_breaker_x1_x2) (breaker-state-is-unknown_breaker_x3_x4) (breaker-state-is-unknown_breaker_x5_x6) (breaker-state-is-unknown_breaker_x7_x8) (breaker-state-is-unknown_breaker_x9_x10) (breaker-state-is-open_breaker_x9_x10) (breaker-state-is-unknown_breaker_x11_x12) (breaker-state-is-unknown_breaker_x13_x14) (breaker-state-is-open_breaker_x13_x14) (breaker-state-is-unknown_breaker_x15_x16) (breaker-state-is-unknown_breaker_x24_x25) (breaker-state-is-open_breaker_x24_x25) (breaker-state-is-unknown_breaker_x26_x27) (breaker-state-is-open_breaker_x26_x27) (breaker-state-is-unknown_breaker_x28_x29) (breaker-state-is-open_breaker_x28_x29) (breaker-state-is-closed_breaker_x1_x2) (breaker-state-is-closed_breaker_x3_x4) (breaker-state-is-closed_breaker_x5_x6) (breaker-state-is-closed_breaker_x7_x8) (breaker-state-is-closed_breaker_x9_x10) (breaker-state-is-closed_breaker_x11_x12) (breaker-state-is-closed_breaker_x15_x16) (breaker-state-is-closed_breaker_x24_x25) (breaker-state-is-closed_breaker_x26_x27) (breaker-state-is-closed_breaker_x28_x29) (breaker-ar-status-is-unknown_breaker_x1_x2) (breaker-ar-status-is-auto_breaker_x1_x2) (breaker-ar-status-is-unknown_breaker_x3_x4) (breaker-ar-status-is-auto_breaker_x3_x4) (breaker-ar-status-is-unknown_breaker_x5_x6) (breaker-ar-status-is-auto_breaker_x5_x6) (breaker-ar-status-is-unknown_breaker_x7_x8) (breaker-ar-status-is-auto_breaker_x7_x8) (breaker-ar-status-is-unknown_breaker_x9_x10) (breaker-ar-status-is-auto_breaker_x9_x10) (breaker-ar-status-is-unknown_breaker_x11_x12) (breaker-ar-status-is-auto_breaker_x11_x12) (breaker-ar-status-is-unknown_breaker_x15_x16) (breaker-ar-status-is-auto_breaker_x15_x16) (breaker-ar-status-is-non-auto_breaker_x9_x10) (pending_obs1022) (fault-count-2_count-as-fault_breaker_x1_x2_n0) (observed_obs1022) (fault-count-2_count-as-fault_breaker_x1_x2_n1) (pending_obs1033) (fault-count-2_count-as-fault_breaker_x3_x4_n0) (observed_obs1033) (fault-count-2_count-as-fault_breaker_x3_x4_n1) (pending_obs1025) (fault-count-2_count-as-fault_breaker_x5_x6_n0) (observed_obs1025) (fault-count-2_count-as-fault_breaker_x5_x6_n1) (dominates-2_hyp2_count-as-fault_breaker_x5_x6) (dominates-2_hyp1_count-as-fault_breaker_x5_x6) (pending_obs1029) (fault-count-2_count-as-fault_breaker_x7_x8_n0) (observed_obs1029) (fault-count-2_count-as-fault_breaker_x7_x8_n1) (dominates-2_hyp2_count-as-fault_breaker_x7_x8) (dominates-2_hyp1_count-as-fault_breaker_x7_x8) (pending_obs1023) (fault-count-2_count-as-fault_breaker_x9_x10_n0) (observed_obs1023) (fault-count-2_count-as-fault_breaker_x9_x10_n1) (line-iso-state-may-have-changed_line_x22_x23_obs1023) (dominates-2_hyp2_count-as-fault_breaker_x9_x10) (pending_obs1031) (fault-count-2_count-as-fault_breaker_x11_x12_n0) (observed_obs1031) (fault-count-2_count-as-fault_breaker_x11_x12_n1) (dominates-2_hyp2_count-as-fault_breaker_x11_x12) (dominates-2_hyp1_count-as-fault_breaker_x11_x12) (pending_obs1037) (fault-count-2_count-as-fault_breaker_x15_x16_n0) (observed_obs1037) (fault-count-2_count-as-fault_breaker_x15_x16_n1) (dominates-2_hyp2_count-as-fault_breaker_x15_x16) (dominates-2_hyp1_count-as-fault_breaker_x15_x16) (pending_obs1032) (fault-count-2_count-as-fault_breaker_x13_x14_n0) (observed_obs1032) (fault-count-2_count-as-fault_breaker_x13_x14_n1) (dominates-2_hyp2_count-as-fault_breaker_x13_x14) (dominates-2_hyp1_count-as-fault_breaker_x13_x14) (pending_obs1020) (fault-count-2_count-as-fault_bus_x18_n0) (observed_obs1020) (fault-count-2_count-as-fault_bus_x18_n1) (dominates-2_hyp2_count-as-fault_bus_x18) (dominates-2_hyp1_count-as-fault_bus_x18) (pending_obs1030) (fault-count-2_count-as-fault_bus_x17_n0) (observed_obs1030) (fault-count-2_count-as-fault_bus_x17_n1) (dominates-2_hyp2_count-as-fault_bus_x17) (dominates-2_hyp1_count-as-fault_bus_x17) (pending_obs1036) (fault-count-2_count-as-fault_bus_x2_n0) (observed_obs1036) (fault-count-2_count-as-fault_bus_x2_n1) (generator-status-is-off_generator_x17_1) (bus-isolated_bus_x2) (generator-status-is-off_generator_x2_1) (bus-iso-state-changed_bus_x2_obs1022) (fault-count-2_count-as-fault_line_x22_x23_n0) (not_line-isolated_line_x22_x23) (line-iso-trip-in-progress_line_x22_x23_obs1023) (not_line-iso-trip-in-progress_line_x22_x23_obs1023) (fault-count-2_count-as-fault_line_x22_x23_n1) (dominates-2_hyp1_count-as-fault_line_x22_x23) (line-isolated_line_x22_x23) (generator-status-is-unknown_generator_x19_1) (generator-status-is-on_generator_x19_1) (generator-status-is-unknown_generator_x17_1) (generator-status-is-on_generator_x17_1) (generator-status-is-unknown_generator_x20_1) (generator-status-is-on_generator_x20_1) (generator-status-is-unknown_generator_x2_1) (generator-status-is-on_generator_x2_1) (generator-status-is-unknown_generator_x4_1) (generator-status-is-on_generator_x4_1) (generator-status-is-unknown_generator_x21_1) (generator-status-is-on_generator_x21_1) (generator-status-is-off_generator_x19_1) (generator-status-is-off_generator_x20_1) (generator-status-is-off_generator_x4_1) (generator-status-is-off_generator_x21_1) (fault-count-2_count-as-fault_generator_x19_1_n0) (generator-status-is-shutting-down_generator_x19_1) (fault-count-2_count-as-fault_generator_x19_1_n1) (dominates-2_hyp2_count-as-fault_generator_x19_1) (dominates-2_hyp1_count-as-fault_generator_x19_1) (fault-count-2_count-as-fault_generator_x17_1_n0) (generator-status-is-shutting-down_generator_x17_1) (fault-count-2_count-as-fault_generator_x17_1_n1) (dominates-2_hyp2_count-as-fault_generator_x17_1) (dominates-2_hyp1_count-as-fault_generator_x17_1) (fault-count-2_count-as-fault_generator_x20_1_n0) (generator-status-is-shutting-down_generator_x20_1) (fault-count-2_count-as-fault_generator_x20_1_n1) (fault-count-2_count-as-fault_generator_x2_1_n0) (generator-status-is-shutting-down_generator_x2_1) (fault-count-2_count-as-fault_generator_x2_1_n1) (dominates-2_hyp2_count-as-fault_generator_x2_1) (dominates-2_hyp1_count-as-fault_generator_x2_1) (fault-count-2_count-as-fault_generator_x4_1_n0) (generator-status-is-shutting-down_generator_x4_1) (fault-count-2_count-as-fault_generator_x4_1_n1) (dominates-2_hyp2_count-as-fault_generator_x4_1) (dominates-2_hyp1_count-as-fault_generator_x4_1) (fault-count-2_count-as-fault_generator_x21_1_n0) (generator-status-is-shutting-down_generator_x21_1) (fault-count-2_count-as-fault_generator_x21_1_n1) (dominates-2_hyp2_count-as-fault_generator_x21_1) (dominates-2_hyp1_count-as-fault_generator_x21_1) (pending_obs1028) (observed_obs1028) (pending_obs1018) (observed_obs1018) (pending_obs1035) (observed_obs1035) (pending_obs1034) (observed_obs1034) (generator-status-is-starting-up_generator_x19_1) (generator-status-is-starting-up_generator_x17_1) (generator-status-is-starting-up_generator_x20_1) (generator-status-is-starting-up_generator_x2_1) (generator-status-is-starting-up_generator_x4_1) (generator-status-is-starting-up_generator_x21_1) (pending_obs1024) (observed_obs1024) (pending_obs1027) (observed_obs1027) (pending_obs1021) (observed_obs1021) (pending_obs1019) (observed_obs1019) (pending_obs1026) (observed_obs1026) (future_obs1019) (future_obs1020) (future_obs1021) (future_obs1022) (future_obs1023) (future_obs1024) (future_obs1025) (future_obs1026) (future_obs1027) (future_obs1028) (future_obs1029) (future_obs1030) (future_obs1031) (future_obs1032) (future_obs1033) (future_obs1034) (future_obs1035) (future_obs1036) (future_obs1037) (not_at_end_constraint0) (achieved_constraint0) (not_at_end_constraint1) (achieved_constraint1) (static-true))
 (:action breaker-init-state-was-open_breaker_x9_x10
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x9_x10) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-state-is-open_breaker_x9_x10) (not (breaker-state-is-unknown_breaker_x9_x10))))
 (:action breaker-init-state-was-open_breaker_x13_x14
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x13_x14) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-state-is-open_breaker_x13_x14) (not (breaker-state-is-unknown_breaker_x13_x14))))
 (:action breaker-init-state-was-open_breaker_x24_x25
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x24_x25) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-state-is-open_breaker_x24_x25) (not (breaker-state-is-unknown_breaker_x24_x25))))
 (:action breaker-init-state-was-open_breaker_x26_x27
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x26_x27) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-state-is-open_breaker_x26_x27) (not (breaker-state-is-unknown_breaker_x26_x27))))
 (:action breaker-init-state-was-open_breaker_x28_x29
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x28_x29) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-state-is-open_breaker_x28_x29) (not (breaker-state-is-unknown_breaker_x28_x29))))
 (:action breaker-init-state-was-closed_breaker_x1_x2
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x1_x2) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-state-is-closed_breaker_x1_x2) (not (breaker-state-is-unknown_breaker_x1_x2))))
 (:action breaker-init-state-was-closed_breaker_x3_x4
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x3_x4) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-state-is-closed_breaker_x3_x4) (not (breaker-state-is-unknown_breaker_x3_x4))))
 (:action breaker-init-state-was-closed_breaker_x5_x6
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x5_x6) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-state-is-closed_breaker_x5_x6) (not (breaker-state-is-unknown_breaker_x5_x6))))
 (:action breaker-init-state-was-closed_breaker_x7_x8
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x7_x8) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-state-is-closed_breaker_x7_x8) (not (breaker-state-is-unknown_breaker_x7_x8))))
 (:action breaker-init-state-was-closed_breaker_x9_x10
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x9_x10) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-state-is-closed_breaker_x9_x10) (not (breaker-state-is-unknown_breaker_x9_x10))))
 (:action breaker-init-state-was-closed_breaker_x11_x12
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x11_x12) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-state-is-closed_breaker_x11_x12) (not (breaker-state-is-unknown_breaker_x11_x12))))
 (:action breaker-init-state-was-closed_breaker_x15_x16
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x15_x16) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-state-is-closed_breaker_x15_x16) (not (breaker-state-is-unknown_breaker_x15_x16))))
 (:action breaker-init-state-was-closed_breaker_x24_x25
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x24_x25) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-state-is-closed_breaker_x24_x25) (not (breaker-state-is-unknown_breaker_x24_x25))))
 (:action breaker-init-state-was-closed_breaker_x26_x27
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x26_x27) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-state-is-closed_breaker_x26_x27) (not (breaker-state-is-unknown_breaker_x26_x27))))
 (:action breaker-init-state-was-closed_breaker_x28_x29
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x28_x29) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-state-is-closed_breaker_x28_x29) (not (breaker-state-is-unknown_breaker_x28_x29))))
 (:action breaker-init-ar-status-was-auto_breaker_x1_x2
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x1_x2) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-ar-status-is-auto_breaker_x1_x2) (not (breaker-ar-status-is-unknown_breaker_x1_x2))))
 (:action breaker-init-ar-status-was-auto_breaker_x3_x4
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x3_x4) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-ar-status-is-auto_breaker_x3_x4) (not (breaker-ar-status-is-unknown_breaker_x3_x4))))
 (:action breaker-init-ar-status-was-auto_breaker_x5_x6
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x5_x6) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-ar-status-is-auto_breaker_x5_x6) (not (breaker-ar-status-is-unknown_breaker_x5_x6))))
 (:action breaker-init-ar-status-was-auto_breaker_x7_x8
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x7_x8) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-ar-status-is-auto_breaker_x7_x8) (not (breaker-ar-status-is-unknown_breaker_x7_x8))))
 (:action breaker-init-ar-status-was-auto_breaker_x9_x10
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x9_x10) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-ar-status-is-auto_breaker_x9_x10) (not (breaker-ar-status-is-unknown_breaker_x9_x10))))
 (:action breaker-init-ar-status-was-auto_breaker_x11_x12
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x11_x12) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-ar-status-is-auto_breaker_x11_x12) (not (breaker-ar-status-is-unknown_breaker_x11_x12))))
 (:action breaker-init-ar-status-was-auto_breaker_x15_x16
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x15_x16) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-ar-status-is-auto_breaker_x15_x16) (not (breaker-ar-status-is-unknown_breaker_x15_x16))))
 (:action breaker-init-ar-status-was-non-auto_breaker_x9_x10
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x9_x10) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-ar-status-is-non-auto_breaker_x9_x10) (not (breaker-ar-status-is-unknown_breaker_x9_x10))))
 (:action breaker-open-unexplained_breaker_x1_x2_obs1022_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x1_x2) (pending_obs1022) (fault-count-2_count-as-fault_breaker_x1_x2_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs1022) (fault-count-2_count-as-fault_breaker_x1_x2_n1) (not (breaker-state-is-closed_breaker_x1_x2)) (not (pending_obs1022)) (not (fault-count-2_count-as-fault_breaker_x1_x2_n0))))
 (:action breaker-open-unexplained_breaker_x3_x4_obs1033_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x3_x4) (pending_obs1033) (fault-count-2_count-as-fault_breaker_x3_x4_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs1033) (fault-count-2_count-as-fault_breaker_x3_x4_n1) (not (breaker-state-is-closed_breaker_x3_x4)) (not (pending_obs1033)) (not (fault-count-2_count-as-fault_breaker_x3_x4_n0))))
 (:action breaker-open-unexplained_breaker_x5_x6_obs1025_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x5_x6) (pending_obs1025) (fault-count-2_count-as-fault_breaker_x5_x6_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs1025) (fault-count-2_count-as-fault_breaker_x5_x6_n1) (not (breaker-state-is-closed_breaker_x5_x6)) (not (pending_obs1025)) (not (fault-count-2_count-as-fault_breaker_x5_x6_n0)) (not (dominates-2_hyp2_count-as-fault_breaker_x5_x6)) (not (dominates-2_hyp1_count-as-fault_breaker_x5_x6))))
 (:action breaker-open-unexplained_breaker_x7_x8_obs1029_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x7_x8) (pending_obs1029) (fault-count-2_count-as-fault_breaker_x7_x8_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs1029) (fault-count-2_count-as-fault_breaker_x7_x8_n1) (not (breaker-state-is-closed_breaker_x7_x8)) (not (pending_obs1029)) (not (fault-count-2_count-as-fault_breaker_x7_x8_n0)) (not (dominates-2_hyp2_count-as-fault_breaker_x7_x8)) (not (dominates-2_hyp1_count-as-fault_breaker_x7_x8))))
 (:action breaker-open-unexplained_breaker_x9_x10_obs1023_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x9_x10) (pending_obs1023) (fault-count-2_count-as-fault_breaker_x9_x10_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-state-is-open_breaker_x9_x10) (observed_obs1023) (fault-count-2_count-as-fault_breaker_x9_x10_n1) (line-iso-state-may-have-changed_line_x22_x23_obs1023) (not (breaker-state-is-closed_breaker_x9_x10)) (not (pending_obs1023)) (not (fault-count-2_count-as-fault_breaker_x9_x10_n0)) (not (dominates-2_hyp2_count-as-fault_breaker_x9_x10))))
 (:action breaker-open-unexplained_breaker_x11_x12_obs1031_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x11_x12) (pending_obs1031) (fault-count-2_count-as-fault_breaker_x11_x12_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs1031) (fault-count-2_count-as-fault_breaker_x11_x12_n1) (not (breaker-state-is-closed_breaker_x11_x12)) (not (pending_obs1031)) (not (fault-count-2_count-as-fault_breaker_x11_x12_n0)) (not (dominates-2_hyp2_count-as-fault_breaker_x11_x12)) (not (dominates-2_hyp1_count-as-fault_breaker_x11_x12))))
 (:action breaker-open-unexplained_breaker_x15_x16_obs1037_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x15_x16) (pending_obs1037) (fault-count-2_count-as-fault_breaker_x15_x16_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs1037) (fault-count-2_count-as-fault_breaker_x15_x16_n1) (not (breaker-state-is-closed_breaker_x15_x16)) (not (pending_obs1037)) (not (fault-count-2_count-as-fault_breaker_x15_x16_n0)) (not (dominates-2_hyp2_count-as-fault_breaker_x15_x16)) (not (dominates-2_hyp1_count-as-fault_breaker_x15_x16))))
 (:action breaker-trip-unexplained_breaker_x1_x2_obs1022_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x1_x2) (breaker-ar-status-is-auto_breaker_x1_x2) (pending_obs1022) (fault-count-2_count-as-fault_breaker_x1_x2_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs1022) (fault-count-2_count-as-fault_breaker_x1_x2_n1) (not (breaker-state-is-closed_breaker_x1_x2)) (not (pending_obs1022)) (not (fault-count-2_count-as-fault_breaker_x1_x2_n0))))
 (:action breaker-trip-unexplained_breaker_x3_x4_obs1033_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x3_x4) (breaker-ar-status-is-auto_breaker_x3_x4) (pending_obs1033) (fault-count-2_count-as-fault_breaker_x3_x4_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs1033) (fault-count-2_count-as-fault_breaker_x3_x4_n1) (not (breaker-state-is-closed_breaker_x3_x4)) (not (pending_obs1033)) (not (fault-count-2_count-as-fault_breaker_x3_x4_n0))))
 (:action breaker-trip-unexplained_breaker_x5_x6_obs1025_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x5_x6) (breaker-ar-status-is-auto_breaker_x5_x6) (pending_obs1025) (fault-count-2_count-as-fault_breaker_x5_x6_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs1025) (fault-count-2_count-as-fault_breaker_x5_x6_n1) (not (breaker-state-is-closed_breaker_x5_x6)) (not (pending_obs1025)) (not (fault-count-2_count-as-fault_breaker_x5_x6_n0)) (not (dominates-2_hyp2_count-as-fault_breaker_x5_x6)) (not (dominates-2_hyp1_count-as-fault_breaker_x5_x6))))
 (:action breaker-trip-unexplained_breaker_x7_x8_obs1029_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x7_x8) (breaker-ar-status-is-auto_breaker_x7_x8) (pending_obs1029) (fault-count-2_count-as-fault_breaker_x7_x8_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs1029) (fault-count-2_count-as-fault_breaker_x7_x8_n1) (not (breaker-state-is-closed_breaker_x7_x8)) (not (pending_obs1029)) (not (fault-count-2_count-as-fault_breaker_x7_x8_n0)) (not (dominates-2_hyp2_count-as-fault_breaker_x7_x8)) (not (dominates-2_hyp1_count-as-fault_breaker_x7_x8))))
 (:action breaker-trip-unexplained_breaker_x9_x10_obs1023_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x9_x10) (breaker-ar-status-is-auto_breaker_x9_x10) (pending_obs1023) (fault-count-2_count-as-fault_breaker_x9_x10_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-state-is-open_breaker_x9_x10) (observed_obs1023) (fault-count-2_count-as-fault_breaker_x9_x10_n1) (line-iso-state-may-have-changed_line_x22_x23_obs1023) (not (breaker-state-is-closed_breaker_x9_x10)) (not (pending_obs1023)) (not (fault-count-2_count-as-fault_breaker_x9_x10_n0)) (not (dominates-2_hyp2_count-as-fault_breaker_x9_x10))))
 (:action breaker-trip-unexplained_breaker_x11_x12_obs1031_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x11_x12) (breaker-ar-status-is-auto_breaker_x11_x12) (pending_obs1031) (fault-count-2_count-as-fault_breaker_x11_x12_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs1031) (fault-count-2_count-as-fault_breaker_x11_x12_n1) (not (breaker-state-is-closed_breaker_x11_x12)) (not (pending_obs1031)) (not (fault-count-2_count-as-fault_breaker_x11_x12_n0)) (not (dominates-2_hyp2_count-as-fault_breaker_x11_x12)) (not (dominates-2_hyp1_count-as-fault_breaker_x11_x12))))
 (:action breaker-trip-unexplained_breaker_x15_x16_obs1037_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x15_x16) (breaker-ar-status-is-auto_breaker_x15_x16) (pending_obs1037) (fault-count-2_count-as-fault_breaker_x15_x16_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs1037) (fault-count-2_count-as-fault_breaker_x15_x16_n1) (not (breaker-state-is-closed_breaker_x15_x16)) (not (pending_obs1037)) (not (fault-count-2_count-as-fault_breaker_x15_x16_n0)) (not (dominates-2_hyp2_count-as-fault_breaker_x15_x16)) (not (dominates-2_hyp1_count-as-fault_breaker_x15_x16))))
 (:action breaker-close-unexplained_breaker_x13_x14_obs1032_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x13_x14) (pending_obs1032) (fault-count-2_count-as-fault_breaker_x13_x14_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs1032) (fault-count-2_count-as-fault_breaker_x13_x14_n1) (not (breaker-state-is-open_breaker_x13_x14)) (not (pending_obs1032)) (not (fault-count-2_count-as-fault_breaker_x13_x14_n0)) (not (dominates-2_hyp2_count-as-fault_breaker_x13_x14)) (not (dominates-2_hyp1_count-as-fault_breaker_x13_x14))))
 (:action bus-voltage-goes-high-unexplained_bus_x18_high_obs1020_n0_n1
  :parameters ()
  :precondition (and (pending_obs1020) (fault-count-2_count-as-fault_bus_x18_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs1020) (fault-count-2_count-as-fault_bus_x18_n1) (not (pending_obs1020)) (not (fault-count-2_count-as-fault_bus_x18_n0)) (not (dominates-2_hyp2_count-as-fault_bus_x18)) (not (dominates-2_hyp1_count-as-fault_bus_x18))))
 (:action bus-mw-goes-to-zero-unexplained_bus_x17_obs1030_n0_n1
  :parameters ()
  :precondition (and (pending_obs1030) (fault-count-2_count-as-fault_bus_x17_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs1030) (fault-count-2_count-as-fault_bus_x17_n1) (not (pending_obs1030)) (not (fault-count-2_count-as-fault_bus_x17_n0)) (not (dominates-2_hyp2_count-as-fault_bus_x17)) (not (dominates-2_hyp1_count-as-fault_bus_x17))))
 (:action bus-mw-goes-to-zero-unexplained_bus_x2_obs1036_n0_n1
  :parameters ()
  :precondition (and (pending_obs1036) (fault-count-2_count-as-fault_bus_x2_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs1036) (fault-count-2_count-as-fault_bus_x2_n1) (not (pending_obs1036)) (not (fault-count-2_count-as-fault_bus_x2_n0))))
 (:action bus-mw-goes-to-zero-when-isolated_bus_x2_obs1036_obs1022
  :parameters ()
  :precondition (and (pending_obs1036) (bus-isolated_bus_x2) (generator-status-is-off_generator_x2_1) (bus-iso-state-changed_bus_x2_obs1022) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs1036) (not (pending_obs1036))))
 (:action line-iso-trip-first-breaker-simple-trip-1_line_x22_x23_breaker_x9_x10_breaker_x9_x10_obs1023_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x9_x10) (breaker-ar-status-is-auto_breaker_x9_x10) (pending_obs1023) (fault-count-2_count-as-fault_line_x22_x23_n0) (not_line-isolated_line_x22_x23) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-state-is-open_breaker_x9_x10) (observed_obs1023) (line-iso-trip-in-progress_line_x22_x23_obs1023) (fault-count-2_count-as-fault_line_x22_x23_n1) (not (breaker-state-is-closed_breaker_x9_x10)) (not (pending_obs1023)) (not (fault-count-2_count-as-fault_line_x22_x23_n0)) (not (not_line-iso-trip-in-progress_line_x22_x23_obs1023)) (not (dominates-2_hyp1_count-as-fault_line_x22_x23))))
 (:action line-iso-trip-first-breaker-simple-trip-2_line_x22_x23_breaker_x9_x10_breaker_x9_x10_obs1023_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x9_x10) (breaker-ar-status-is-non-auto_breaker_x9_x10) (pending_obs1023) (fault-count-2_count-as-fault_line_x22_x23_n0) (not_line-isolated_line_x22_x23) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-state-is-open_breaker_x9_x10) (observed_obs1023) (line-iso-trip-in-progress_line_x22_x23_obs1023) (fault-count-2_count-as-fault_line_x22_x23_n1) (not (breaker-state-is-closed_breaker_x9_x10)) (not (pending_obs1023)) (not (fault-count-2_count-as-fault_line_x22_x23_n0)) (not (not_line-iso-trip-in-progress_line_x22_x23_obs1023)) (not (dominates-2_hyp1_count-as-fault_line_x22_x23))))
 (:action line-finish-iso-trip-4_line_x22_x23_breaker_x24_x25_breaker_x26_x27_breaker_x28_x29_breaker_x9_x10_obs1023
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x9_x10) (breaker-state-is-open_breaker_x24_x25) (breaker-state-is-open_breaker_x26_x27) (breaker-state-is-open_breaker_x28_x29) (line-iso-trip-in-progress_line_x22_x23_obs1023) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (not_line-iso-trip-in-progress_line_x22_x23_obs1023) (line-isolated_line_x22_x23) (not (not_line-isolated_line_x22_x23)) (not (line-iso-trip-in-progress_line_x22_x23_obs1023))))
 (:action line-set-state-isolated-4_line_x22_x23_breaker_x24_x25_breaker_x26_x27_breaker_x28_x29_breaker_x9_x10_obs1023
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x9_x10) (breaker-state-is-open_breaker_x24_x25) (breaker-state-is-open_breaker_x26_x27) (breaker-state-is-open_breaker_x28_x29) (line-iso-state-may-have-changed_line_x22_x23_obs1023) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (line-isolated_line_x22_x23) (not (not_line-isolated_line_x22_x23))))
 (:action line-init-state-isolated-4_line_x22_x23_breaker_x24_x25_breaker_x26_x27_breaker_x28_x29_breaker_x9_x10
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x9_x10) (breaker-state-is-open_breaker_x24_x25) (breaker-state-is-open_breaker_x26_x27) (breaker-state-is-open_breaker_x28_x29) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (line-isolated_line_x22_x23) (not (not_line-isolated_line_x22_x23))))
 (:action generator-init-status-was-on_generator_x19_1
  :parameters ()
  :precondition (and (generator-status-is-unknown_generator_x19_1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (generator-status-is-on_generator_x19_1) (not (generator-status-is-unknown_generator_x19_1))))
 (:action generator-init-status-was-on_generator_x17_1
  :parameters ()
  :precondition (and (generator-status-is-unknown_generator_x17_1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (generator-status-is-on_generator_x17_1) (not (generator-status-is-unknown_generator_x17_1))))
 (:action generator-init-status-was-on_generator_x20_1
  :parameters ()
  :precondition (and (generator-status-is-unknown_generator_x20_1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (generator-status-is-on_generator_x20_1) (not (generator-status-is-unknown_generator_x20_1))))
 (:action generator-init-status-was-on_generator_x2_1
  :parameters ()
  :precondition (and (generator-status-is-unknown_generator_x2_1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (generator-status-is-on_generator_x2_1) (not (generator-status-is-unknown_generator_x2_1))))
 (:action generator-init-status-was-on_generator_x4_1
  :parameters ()
  :precondition (and (generator-status-is-unknown_generator_x4_1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (generator-status-is-on_generator_x4_1) (not (generator-status-is-unknown_generator_x4_1))))
 (:action generator-init-status-was-on_generator_x21_1
  :parameters ()
  :precondition (and (generator-status-is-unknown_generator_x21_1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (generator-status-is-on_generator_x21_1) (not (generator-status-is-unknown_generator_x21_1))))
 (:action generator-init-status-was-off_generator_x19_1
  :parameters ()
  :precondition (and (generator-status-is-unknown_generator_x19_1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (generator-status-is-off_generator_x19_1) (not (generator-status-is-unknown_generator_x19_1))))
 (:action generator-init-status-was-off_generator_x17_1
  :parameters ()
  :precondition (and (generator-status-is-unknown_generator_x17_1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (generator-status-is-off_generator_x17_1) (not (generator-status-is-unknown_generator_x17_1))))
 (:action generator-init-status-was-off_generator_x20_1
  :parameters ()
  :precondition (and (generator-status-is-unknown_generator_x20_1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (generator-status-is-off_generator_x20_1) (not (generator-status-is-unknown_generator_x20_1))))
 (:action generator-init-status-was-off_generator_x2_1
  :parameters ()
  :precondition (and (generator-status-is-unknown_generator_x2_1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (generator-status-is-off_generator_x2_1) (not (generator-status-is-unknown_generator_x2_1))))
 (:action generator-init-status-was-off_generator_x4_1
  :parameters ()
  :precondition (and (generator-status-is-unknown_generator_x4_1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (generator-status-is-off_generator_x4_1) (not (generator-status-is-unknown_generator_x4_1))))
 (:action generator-init-status-was-off_generator_x21_1
  :parameters ()
  :precondition (and (generator-status-is-unknown_generator_x21_1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (generator-status-is-off_generator_x21_1) (not (generator-status-is-unknown_generator_x21_1))))
 (:action generator-begin-shutdown_generator_x19_1_n0_n1
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x19_1) (fault-count-2_count-as-fault_generator_x19_1_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (generator-status-is-shutting-down_generator_x19_1) (fault-count-2_count-as-fault_generator_x19_1_n1) (not (generator-status-is-on_generator_x19_1)) (not (fault-count-2_count-as-fault_generator_x19_1_n0)) (not (dominates-2_hyp2_count-as-fault_generator_x19_1)) (not (dominates-2_hyp1_count-as-fault_generator_x19_1))))
 (:action generator-begin-shutdown_generator_x19_1_n1_n2
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x19_1) (fault-count-2_count-as-fault_generator_x19_1_n1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (generator-status-is-shutting-down_generator_x19_1) (not (generator-status-is-on_generator_x19_1)) (not (fault-count-2_count-as-fault_generator_x19_1_n1))))
 (:action generator-begin-shutdown_generator_x17_1_n0_n1
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x17_1) (fault-count-2_count-as-fault_generator_x17_1_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (generator-status-is-shutting-down_generator_x17_1) (fault-count-2_count-as-fault_generator_x17_1_n1) (not (generator-status-is-on_generator_x17_1)) (not (fault-count-2_count-as-fault_generator_x17_1_n0))))
 (:action generator-begin-shutdown_generator_x17_1_n1_n2
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x17_1) (fault-count-2_count-as-fault_generator_x17_1_n1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (generator-status-is-shutting-down_generator_x17_1) (not (generator-status-is-on_generator_x17_1)) (not (fault-count-2_count-as-fault_generator_x17_1_n1)) (not (dominates-2_hyp2_count-as-fault_generator_x17_1)) (not (dominates-2_hyp1_count-as-fault_generator_x17_1))))
 (:action generator-begin-shutdown_generator_x20_1_n0_n1
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x20_1) (fault-count-2_count-as-fault_generator_x20_1_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (generator-status-is-shutting-down_generator_x20_1) (fault-count-2_count-as-fault_generator_x20_1_n1) (not (generator-status-is-on_generator_x20_1)) (not (fault-count-2_count-as-fault_generator_x20_1_n0))))
 (:action generator-begin-shutdown_generator_x20_1_n1_n2
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x20_1) (fault-count-2_count-as-fault_generator_x20_1_n1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (generator-status-is-shutting-down_generator_x20_1) (not (generator-status-is-on_generator_x20_1)) (not (fault-count-2_count-as-fault_generator_x20_1_n1))))
 (:action generator-begin-shutdown_generator_x2_1_n0_n1
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x2_1) (fault-count-2_count-as-fault_generator_x2_1_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (generator-status-is-shutting-down_generator_x2_1) (fault-count-2_count-as-fault_generator_x2_1_n1) (not (generator-status-is-on_generator_x2_1)) (not (fault-count-2_count-as-fault_generator_x2_1_n0)) (not (dominates-2_hyp2_count-as-fault_generator_x2_1)) (not (dominates-2_hyp1_count-as-fault_generator_x2_1))))
 (:action generator-begin-shutdown_generator_x2_1_n1_n2
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x2_1) (fault-count-2_count-as-fault_generator_x2_1_n1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (generator-status-is-shutting-down_generator_x2_1) (not (generator-status-is-on_generator_x2_1)) (not (fault-count-2_count-as-fault_generator_x2_1_n1))))
 (:action generator-begin-shutdown_generator_x4_1_n0_n1
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x4_1) (fault-count-2_count-as-fault_generator_x4_1_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (generator-status-is-shutting-down_generator_x4_1) (fault-count-2_count-as-fault_generator_x4_1_n1) (not (generator-status-is-on_generator_x4_1)) (not (fault-count-2_count-as-fault_generator_x4_1_n0))))
 (:action generator-begin-shutdown_generator_x4_1_n1_n2
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x4_1) (fault-count-2_count-as-fault_generator_x4_1_n1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (generator-status-is-shutting-down_generator_x4_1) (not (generator-status-is-on_generator_x4_1)) (not (fault-count-2_count-as-fault_generator_x4_1_n1)) (not (dominates-2_hyp2_count-as-fault_generator_x4_1)) (not (dominates-2_hyp1_count-as-fault_generator_x4_1))))
 (:action generator-begin-shutdown_generator_x21_1_n0_n1
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x21_1) (fault-count-2_count-as-fault_generator_x21_1_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (generator-status-is-shutting-down_generator_x21_1) (fault-count-2_count-as-fault_generator_x21_1_n1) (not (generator-status-is-on_generator_x21_1)) (not (fault-count-2_count-as-fault_generator_x21_1_n0))))
 (:action generator-begin-shutdown_generator_x21_1_n1_n2
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x21_1) (fault-count-2_count-as-fault_generator_x21_1_n1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (generator-status-is-shutting-down_generator_x21_1) (not (generator-status-is-on_generator_x21_1)) (not (fault-count-2_count-as-fault_generator_x21_1_n1)) (not (dominates-2_hyp2_count-as-fault_generator_x21_1)) (not (dominates-2_hyp1_count-as-fault_generator_x21_1))))
 (:action generator-shutdown-breaker-open-breaker-open_generator_x2_1_breaker_x1_x2_bus_x2_breaker_x1_x2_obs1022
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x1_x2) (pending_obs1022) (generator-status-is-shutting-down_generator_x2_1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs1022) (bus-isolated_bus_x2) (bus-iso-state-changed_bus_x2_obs1022) (not (breaker-state-is-closed_breaker_x1_x2)) (not (pending_obs1022))))
 (:action generator-shutdown-breaker-open-breaker-open_generator_x4_1_breaker_x3_x4_bus_x4_breaker_x3_x4_obs1033
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x3_x4) (pending_obs1033) (generator-status-is-shutting-down_generator_x4_1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs1033) (not (breaker-state-is-closed_breaker_x3_x4)) (not (pending_obs1033))))
 (:action generator-shutdown-turn-off_generator_x17_1_obs1028
  :parameters ()
  :precondition (and (generator-status-is-shutting-down_generator_x17_1) (pending_obs1028) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs1028) (not (pending_obs1028))))
 (:action generator-shutdown-turn-off_generator_x2_1_obs1018
  :parameters ()
  :precondition (and (generator-status-is-shutting-down_generator_x2_1) (pending_obs1018) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs1018) (not (pending_obs1018))))
 (:action generator-shutdown-turn-off_generator_x4_1_obs1035
  :parameters ()
  :precondition (and (generator-status-is-shutting-down_generator_x4_1) (pending_obs1035) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs1035) (not (pending_obs1035))))
 (:action generator-shutdown-turn-off_generator_x21_1_obs1034
  :parameters ()
  :precondition (and (generator-status-is-shutting-down_generator_x21_1) (pending_obs1034) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs1034) (not (pending_obs1034))))
 (:action generator-shutdown-complete_generator_x19_1
  :parameters ()
  :precondition (and (generator-status-is-shutting-down_generator_x19_1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (generator-status-is-off_generator_x19_1) (not (generator-status-is-shutting-down_generator_x19_1))))
 (:action generator-shutdown-complete_generator_x17_1
  :parameters ()
  :precondition (and (generator-status-is-shutting-down_generator_x17_1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (generator-status-is-off_generator_x17_1) (not (generator-status-is-shutting-down_generator_x17_1))))
 (:action generator-shutdown-complete_generator_x20_1
  :parameters ()
  :precondition (and (generator-status-is-shutting-down_generator_x20_1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (generator-status-is-off_generator_x20_1) (not (generator-status-is-shutting-down_generator_x20_1))))
 (:action generator-shutdown-complete_generator_x2_1
  :parameters ()
  :precondition (and (generator-status-is-shutting-down_generator_x2_1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (generator-status-is-off_generator_x2_1) (not (generator-status-is-shutting-down_generator_x2_1))))
 (:action generator-shutdown-complete_generator_x4_1
  :parameters ()
  :precondition (and (generator-status-is-shutting-down_generator_x4_1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (generator-status-is-off_generator_x4_1) (not (generator-status-is-shutting-down_generator_x4_1))))
 (:action generator-shutdown-complete_generator_x21_1
  :parameters ()
  :precondition (and (generator-status-is-shutting-down_generator_x21_1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (generator-status-is-off_generator_x21_1) (not (generator-status-is-shutting-down_generator_x21_1))))
 (:action generator-begin-startup_generator_x19_1_n0_n1
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x19_1) (fault-count-2_count-as-fault_generator_x19_1_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fault-count-2_count-as-fault_generator_x19_1_n1) (generator-status-is-starting-up_generator_x19_1) (not (generator-status-is-on_generator_x19_1)) (not (fault-count-2_count-as-fault_generator_x19_1_n0)) (not (dominates-2_hyp2_count-as-fault_generator_x19_1)) (not (dominates-2_hyp1_count-as-fault_generator_x19_1))))
 (:action generator-begin-startup_generator_x19_1_n1_n2
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x19_1) (fault-count-2_count-as-fault_generator_x19_1_n1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (generator-status-is-starting-up_generator_x19_1) (not (generator-status-is-on_generator_x19_1)) (not (fault-count-2_count-as-fault_generator_x19_1_n1))))
 (:action generator-begin-startup_generator_x17_1_n0_n1
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x17_1) (fault-count-2_count-as-fault_generator_x17_1_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fault-count-2_count-as-fault_generator_x17_1_n1) (generator-status-is-starting-up_generator_x17_1) (not (generator-status-is-on_generator_x17_1)) (not (fault-count-2_count-as-fault_generator_x17_1_n0))))
 (:action generator-begin-startup_generator_x17_1_n1_n2
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x17_1) (fault-count-2_count-as-fault_generator_x17_1_n1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (generator-status-is-starting-up_generator_x17_1) (not (generator-status-is-on_generator_x17_1)) (not (fault-count-2_count-as-fault_generator_x17_1_n1)) (not (dominates-2_hyp2_count-as-fault_generator_x17_1)) (not (dominates-2_hyp1_count-as-fault_generator_x17_1))))
 (:action generator-begin-startup_generator_x20_1_n0_n1
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x20_1) (fault-count-2_count-as-fault_generator_x20_1_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fault-count-2_count-as-fault_generator_x20_1_n1) (generator-status-is-starting-up_generator_x20_1) (not (generator-status-is-on_generator_x20_1)) (not (fault-count-2_count-as-fault_generator_x20_1_n0))))
 (:action generator-begin-startup_generator_x20_1_n1_n2
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x20_1) (fault-count-2_count-as-fault_generator_x20_1_n1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (generator-status-is-starting-up_generator_x20_1) (not (generator-status-is-on_generator_x20_1)) (not (fault-count-2_count-as-fault_generator_x20_1_n1))))
 (:action generator-begin-startup_generator_x2_1_n0_n1
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x2_1) (fault-count-2_count-as-fault_generator_x2_1_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fault-count-2_count-as-fault_generator_x2_1_n1) (generator-status-is-starting-up_generator_x2_1) (not (generator-status-is-on_generator_x2_1)) (not (fault-count-2_count-as-fault_generator_x2_1_n0)) (not (dominates-2_hyp2_count-as-fault_generator_x2_1)) (not (dominates-2_hyp1_count-as-fault_generator_x2_1))))
 (:action generator-begin-startup_generator_x2_1_n1_n2
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x2_1) (fault-count-2_count-as-fault_generator_x2_1_n1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (generator-status-is-starting-up_generator_x2_1) (not (generator-status-is-on_generator_x2_1)) (not (fault-count-2_count-as-fault_generator_x2_1_n1))))
 (:action generator-begin-startup_generator_x4_1_n0_n1
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x4_1) (fault-count-2_count-as-fault_generator_x4_1_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fault-count-2_count-as-fault_generator_x4_1_n1) (generator-status-is-starting-up_generator_x4_1) (not (generator-status-is-on_generator_x4_1)) (not (fault-count-2_count-as-fault_generator_x4_1_n0))))
 (:action generator-begin-startup_generator_x4_1_n1_n2
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x4_1) (fault-count-2_count-as-fault_generator_x4_1_n1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (generator-status-is-starting-up_generator_x4_1) (not (generator-status-is-on_generator_x4_1)) (not (fault-count-2_count-as-fault_generator_x4_1_n1)) (not (dominates-2_hyp2_count-as-fault_generator_x4_1)) (not (dominates-2_hyp1_count-as-fault_generator_x4_1))))
 (:action generator-begin-startup_generator_x21_1_n0_n1
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x21_1) (fault-count-2_count-as-fault_generator_x21_1_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fault-count-2_count-as-fault_generator_x21_1_n1) (generator-status-is-starting-up_generator_x21_1) (not (generator-status-is-on_generator_x21_1)) (not (fault-count-2_count-as-fault_generator_x21_1_n0))))
 (:action generator-begin-startup_generator_x21_1_n1_n2
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x21_1) (fault-count-2_count-as-fault_generator_x21_1_n1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (generator-status-is-starting-up_generator_x21_1) (not (generator-status-is-on_generator_x21_1)) (not (fault-count-2_count-as-fault_generator_x21_1_n1)) (not (dominates-2_hyp2_count-as-fault_generator_x21_1)) (not (dominates-2_hyp1_count-as-fault_generator_x21_1))))
 (:action generator-startup-complete_generator_x19_1
  :parameters ()
  :precondition (and (generator-status-is-starting-up_generator_x19_1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (generator-status-is-on_generator_x19_1) (not (generator-status-is-starting-up_generator_x19_1))))
 (:action generator-startup-complete_generator_x17_1
  :parameters ()
  :precondition (and (generator-status-is-starting-up_generator_x17_1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (generator-status-is-on_generator_x17_1) (not (generator-status-is-starting-up_generator_x17_1))))
 (:action generator-startup-complete_generator_x20_1
  :parameters ()
  :precondition (and (generator-status-is-starting-up_generator_x20_1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (generator-status-is-on_generator_x20_1) (not (generator-status-is-starting-up_generator_x20_1))))
 (:action generator-startup-complete_generator_x2_1
  :parameters ()
  :precondition (and (generator-status-is-starting-up_generator_x2_1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (generator-status-is-on_generator_x2_1) (not (generator-status-is-starting-up_generator_x2_1))))
 (:action generator-startup-complete_generator_x4_1
  :parameters ()
  :precondition (and (generator-status-is-starting-up_generator_x4_1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (generator-status-is-on_generator_x4_1) (not (generator-status-is-starting-up_generator_x4_1))))
 (:action generator-startup-complete_generator_x21_1
  :parameters ()
  :precondition (and (generator-status-is-starting-up_generator_x21_1) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (generator-status-is-on_generator_x21_1) (not (generator-status-is-starting-up_generator_x21_1))))
 (:action generator-runback-alarm_generator_x19_1_obs1024_n0_n1
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x19_1_n0) (pending_obs1024) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fault-count-2_count-as-fault_generator_x19_1_n1) (observed_obs1024) (not (fault-count-2_count-as-fault_generator_x19_1_n0)) (not (dominates-2_hyp2_count-as-fault_generator_x19_1)) (not (dominates-2_hyp1_count-as-fault_generator_x19_1)) (not (pending_obs1024))))
 (:action generator-runback-alarm_generator_x19_1_obs1024_n1_n2
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x19_1_n1) (pending_obs1024) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs1024) (not (fault-count-2_count-as-fault_generator_x19_1_n1)) (not (pending_obs1024))))
 (:action generator-runback-alarm_generator_x17_1_obs1027_n0_n1
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x17_1_n0) (pending_obs1027) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fault-count-2_count-as-fault_generator_x17_1_n1) (observed_obs1027) (not (fault-count-2_count-as-fault_generator_x17_1_n0)) (not (pending_obs1027))))
 (:action generator-runback-alarm_generator_x17_1_obs1027_n1_n2
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x17_1_n1) (pending_obs1027) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs1027) (not (fault-count-2_count-as-fault_generator_x17_1_n1)) (not (dominates-2_hyp2_count-as-fault_generator_x17_1)) (not (dominates-2_hyp1_count-as-fault_generator_x17_1)) (not (pending_obs1027))))
 (:action generator-runback-alarm_generator_x4_1_obs1021_n0_n1
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x4_1_n0) (pending_obs1021) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fault-count-2_count-as-fault_generator_x4_1_n1) (observed_obs1021) (not (fault-count-2_count-as-fault_generator_x4_1_n0)) (not (pending_obs1021))))
 (:action generator-runback-alarm_generator_x4_1_obs1021_n1_n2
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x4_1_n1) (pending_obs1021) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs1021) (not (fault-count-2_count-as-fault_generator_x4_1_n1)) (not (dominates-2_hyp2_count-as-fault_generator_x4_1)) (not (dominates-2_hyp1_count-as-fault_generator_x4_1)) (not (pending_obs1021))))
 (:action generator-runback-alarm_generator_x21_1_obs1019_n0_n1
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x21_1_n0) (pending_obs1019) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fault-count-2_count-as-fault_generator_x21_1_n1) (observed_obs1019) (not (fault-count-2_count-as-fault_generator_x21_1_n0)) (not (pending_obs1019))))
 (:action generator-runback-alarm_generator_x21_1_obs1019_n1_n2
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x21_1_n1) (pending_obs1019) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs1019) (not (fault-count-2_count-as-fault_generator_x21_1_n1)) (not (dominates-2_hyp2_count-as-fault_generator_x21_1)) (not (dominates-2_hyp1_count-as-fault_generator_x21_1)) (not (pending_obs1019))))
 (:action generator-runback-alarm-reset_generator_x20_1_obs1026_n0_n1
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x20_1_n0) (pending_obs1026) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (fault-count-2_count-as-fault_generator_x20_1_n1) (observed_obs1026) (not (fault-count-2_count-as-fault_generator_x20_1_n0)) (not (pending_obs1026))))
 (:action generator-runback-alarm-reset_generator_x20_1_obs1026_n1_n2
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x20_1_n1) (pending_obs1026) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs1026) (not (fault-count-2_count-as-fault_generator_x20_1_n1)) (not (pending_obs1026))))
 (:action generator-runback-reset-when-off_generator_x20_1_obs1026
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x20_1) (pending_obs1026) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs1026) (not (pending_obs1026))))
 (:action advance-to-obs_obs1019
  :parameters ()
  :precondition (and (observed_obs1018) (future_obs1019) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs1019) (not (future_obs1019))))
 (:action advance-to-obs_obs1020
  :parameters ()
  :precondition (and (observed_obs1018) (future_obs1020) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs1020) (not (future_obs1020))))
 (:action advance-to-obs_obs1021
  :parameters ()
  :precondition (and (observed_obs1020) (observed_obs1019) (future_obs1021) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs1021) (not (future_obs1021))))
 (:action advance-to-obs_obs1022
  :parameters ()
  :precondition (and (observed_obs1020) (observed_obs1019) (future_obs1022) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs1022) (not (future_obs1022))))
 (:action advance-to-obs_obs1023
  :parameters ()
  :precondition (and (observed_obs1020) (observed_obs1019) (future_obs1023) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs1023) (not (future_obs1023))))
 (:action advance-to-obs_obs1024
  :parameters ()
  :precondition (and (observed_obs1020) (observed_obs1019) (future_obs1024) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs1024) (not (future_obs1024))))
 (:action advance-to-obs_obs1025
  :parameters ()
  :precondition (and (observed_obs1022) (observed_obs1023) (observed_obs1024) (observed_obs1021) (future_obs1025) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs1025) (not (future_obs1025))))
 (:action advance-to-obs_obs1026
  :parameters ()
  :precondition (and (observed_obs1025) (not_line-iso-trip-in-progress_line_x22_x23_obs1023) (future_obs1026) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs1026) (not (future_obs1026))))
 (:action advance-to-obs_obs1027
  :parameters ()
  :precondition (and (observed_obs1025) (not_line-iso-trip-in-progress_line_x22_x23_obs1023) (future_obs1027) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs1027) (not (future_obs1027))))
 (:action advance-to-obs_obs1028
  :parameters ()
  :precondition (and (observed_obs1027) (observed_obs1026) (future_obs1028) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs1028) (not (future_obs1028))))
 (:action advance-to-obs_obs1029
  :parameters ()
  :precondition (and (observed_obs1027) (observed_obs1026) (future_obs1029) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs1029) (not (future_obs1029))))
 (:action advance-to-obs_obs1030
  :parameters ()
  :precondition (and (observed_obs1027) (observed_obs1026) (future_obs1030) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs1030) (not (future_obs1030))))
 (:action advance-to-obs_obs1031
  :parameters ()
  :precondition (and (observed_obs1029) (observed_obs1030) (observed_obs1028) (future_obs1031) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs1031) (not (future_obs1031))))
 (:action advance-to-obs_obs1032
  :parameters ()
  :precondition (and (observed_obs1031) (future_obs1032) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs1032) (not (future_obs1032))))
 (:action advance-to-obs_obs1033
  :parameters ()
  :precondition (and (observed_obs1031) (future_obs1033) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs1033) (not (future_obs1033))))
 (:action advance-to-obs_obs1034
  :parameters ()
  :precondition (and (observed_obs1033) (observed_obs1032) (future_obs1034) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs1034) (not (future_obs1034))))
 (:action advance-to-obs_obs1035
  :parameters ()
  :precondition (and (observed_obs1033) (observed_obs1032) (future_obs1035) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs1035) (not (future_obs1035))))
 (:action advance-to-obs_obs1036
  :parameters ()
  :precondition (and (observed_obs1033) (observed_obs1032) (future_obs1036) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs1036) (not (future_obs1036))))
 (:action advance-to-obs_obs1037
  :parameters ()
  :precondition (and (observed_obs1036) (observed_obs1035) (observed_obs1034) (future_obs1037) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs1037) (not (future_obs1037))))
 (:action set_goal_2_constraint0
  :parameters ()
  :precondition (and (observed_obs1022) (observed_obs1033) (observed_obs1025) (observed_obs1029) (observed_obs1023) (dominates-2_hyp2_count-as-fault_breaker_x9_x10) (observed_obs1031) (observed_obs1037) (observed_obs1032) (observed_obs1020) (observed_obs1030) (observed_obs1036) (observed_obs1028) (observed_obs1018) (observed_obs1035) (observed_obs1034) (observed_obs1024) (observed_obs1027) (observed_obs1021) (observed_obs1019) (observed_obs1026) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (achieved_constraint0) (not (not_at_end_constraint0))))
 (:action set_goal_9_constraint0
  :parameters ()
  :precondition (and (observed_obs1022) (observed_obs1033) (observed_obs1025) (observed_obs1029) (observed_obs1023) (observed_obs1031) (observed_obs1037) (observed_obs1032) (observed_obs1020) (observed_obs1030) (observed_obs1036) (dominates-2_hyp2_count-as-fault_generator_x17_1) (observed_obs1028) (observed_obs1018) (observed_obs1035) (observed_obs1034) (observed_obs1024) (observed_obs1027) (observed_obs1021) (observed_obs1019) (observed_obs1026) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (achieved_constraint0) (not (not_at_end_constraint0))))
 (:action set_goal_11_constraint0
  :parameters ()
  :precondition (and (observed_obs1022) (observed_obs1033) (observed_obs1025) (observed_obs1029) (observed_obs1023) (observed_obs1031) (observed_obs1037) (observed_obs1032) (observed_obs1020) (observed_obs1030) (observed_obs1036) (dominates-2_hyp2_count-as-fault_generator_x4_1) (observed_obs1028) (observed_obs1018) (observed_obs1035) (observed_obs1034) (observed_obs1024) (observed_obs1027) (observed_obs1021) (observed_obs1019) (observed_obs1026) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (achieved_constraint0) (not (not_at_end_constraint0))))
 (:action set_goal_12_constraint0
  :parameters ()
  :precondition (and (observed_obs1022) (observed_obs1033) (observed_obs1025) (observed_obs1029) (observed_obs1023) (observed_obs1031) (observed_obs1037) (observed_obs1032) (observed_obs1020) (observed_obs1030) (observed_obs1036) (dominates-2_hyp2_count-as-fault_generator_x21_1) (observed_obs1028) (observed_obs1018) (observed_obs1035) (observed_obs1034) (observed_obs1024) (observed_obs1027) (observed_obs1021) (observed_obs1019) (observed_obs1026) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (achieved_constraint0) (not (not_at_end_constraint0))))
 (:action set_goal_7_constraint1
  :parameters ()
  :precondition (and (observed_obs1022) (observed_obs1033) (observed_obs1025) (observed_obs1029) (observed_obs1023) (observed_obs1031) (observed_obs1037) (observed_obs1032) (observed_obs1020) (observed_obs1030) (observed_obs1036) (dominates-2_hyp1_count-as-fault_line_x22_x23) (observed_obs1028) (observed_obs1018) (observed_obs1035) (observed_obs1034) (observed_obs1024) (observed_obs1027) (observed_obs1021) (observed_obs1019) (observed_obs1026) (achieved_constraint0) (not_at_end_constraint1))
  :effect (and (achieved_constraint1) (not (not_at_end_constraint1))))
 (:action set_goal_9_constraint1
  :parameters ()
  :precondition (and (observed_obs1022) (observed_obs1033) (observed_obs1025) (observed_obs1029) (observed_obs1023) (observed_obs1031) (observed_obs1037) (observed_obs1032) (observed_obs1020) (observed_obs1030) (observed_obs1036) (dominates-2_hyp1_count-as-fault_generator_x17_1) (observed_obs1028) (observed_obs1018) (observed_obs1035) (observed_obs1034) (observed_obs1024) (observed_obs1027) (observed_obs1021) (observed_obs1019) (observed_obs1026) (achieved_constraint0) (not_at_end_constraint1))
  :effect (and (achieved_constraint1) (not (not_at_end_constraint1))))
 (:action set_goal_11_constraint1
  :parameters ()
  :precondition (and (observed_obs1022) (observed_obs1033) (observed_obs1025) (observed_obs1029) (observed_obs1023) (observed_obs1031) (observed_obs1037) (observed_obs1032) (observed_obs1020) (observed_obs1030) (observed_obs1036) (dominates-2_hyp1_count-as-fault_generator_x4_1) (observed_obs1028) (observed_obs1018) (observed_obs1035) (observed_obs1034) (observed_obs1024) (observed_obs1027) (observed_obs1021) (observed_obs1019) (observed_obs1026) (achieved_constraint0) (not_at_end_constraint1))
  :effect (and (achieved_constraint1) (not (not_at_end_constraint1))))
 (:action set_goal_12_constraint1
  :parameters ()
  :precondition (and (observed_obs1022) (observed_obs1033) (observed_obs1025) (observed_obs1029) (observed_obs1023) (observed_obs1031) (observed_obs1037) (observed_obs1032) (observed_obs1020) (observed_obs1030) (observed_obs1036) (dominates-2_hyp1_count-as-fault_generator_x21_1) (observed_obs1028) (observed_obs1018) (observed_obs1035) (observed_obs1034) (observed_obs1024) (observed_obs1027) (observed_obs1021) (observed_obs1019) (observed_obs1026) (achieved_constraint0) (not_at_end_constraint1))
  :effect (and (achieved_constraint1) (not (not_at_end_constraint1))))
)
