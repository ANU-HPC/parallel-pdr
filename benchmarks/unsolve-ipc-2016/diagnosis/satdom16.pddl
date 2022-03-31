(define (domain appn-pls)
 (:requirements :strips :equality)
 (:predicates (breaker-state-is-unknown_breaker_x3_x4) (breaker-state-is-open_breaker_x3_x4) (breaker-state-is-unknown_breaker_x5_x6) (breaker-state-is-open_breaker_x5_x6) (breaker-state-is-unknown_breaker_x7_x8) (breaker-state-is-unknown_breaker_x9_x10) (breaker-state-is-open_breaker_x9_x10) (breaker-state-is-unknown_breaker_x11_x12) (breaker-state-is-open_breaker_x11_x12) (breaker-state-is-unknown_breaker_x13_x14) (breaker-state-is-unknown_breaker_x15_x16) (breaker-state-is-open_breaker_x15_x16) (breaker-state-is-unknown_breaker_x19_x20) (breaker-state-is-unknown_breaker_x25_x26) (breaker-state-is-open_breaker_x25_x26) (breaker-state-is-unknown_breaker_x33_x34) (breaker-state-is-open_breaker_x33_x34) (breaker-state-is-unknown_breaker_x35_x36) (breaker-state-is-open_breaker_x35_x36) (breaker-state-is-closed_breaker_x3_x4) (breaker-state-is-closed_breaker_x7_x8) (breaker-state-is-closed_breaker_x9_x10) (breaker-state-is-closed_breaker_x11_x12) (breaker-state-is-closed_breaker_x13_x14) (breaker-state-is-closed_breaker_x19_x20) (breaker-state-is-closed_breaker_x25_x26) (breaker-state-is-closed_breaker_x33_x34) (breaker-state-is-closed_breaker_x35_x36) (breaker-ar-status-is-unknown_breaker_x7_x8) (breaker-ar-status-is-auto_breaker_x7_x8) (breaker-ar-status-is-unknown_breaker_x9_x10) (breaker-ar-status-is-auto_breaker_x9_x10) (breaker-ar-status-is-unknown_breaker_x11_x12) (breaker-ar-status-is-auto_breaker_x11_x12) (breaker-ar-status-is-unknown_breaker_x13_x14) (breaker-ar-status-is-auto_breaker_x13_x14) (breaker-ar-status-is-unknown_breaker_x19_x20) (breaker-ar-status-is-auto_breaker_x19_x20) (breaker-ar-status-is-unknown_breaker_x25_x26) (breaker-ar-status-is-auto_breaker_x25_x26) (breaker-ar-status-is-non-auto_breaker_x9_x10) (breaker-ar-status-is-non-auto_breaker_x11_x12) (breaker-ar-status-is-non-auto_breaker_x25_x26) (pending_obs646) (fault-count-2_count-as-fault_breaker_x7_x8_n0) (observed_obs646) (dominates-2_hyp3_count-as-fault_breaker_x7_x8) (dominates-2_hyp2_count-as-fault_breaker_x7_x8) (dominates-2_hyp1_count-as-fault_breaker_x7_x8) (pending_obs640) (fault-count-2_count-as-fault_breaker_x9_x10_n0) (observed_obs640) (line-iso-state-may-have-changed_line_x31_x32_obs640) (dominates-2_hyp3_count-as-fault_breaker_x9_x10) (dominates-2_hyp2_count-as-fault_breaker_x9_x10) (pending_obs641) (fault-count-2_count-as-fault_breaker_x11_x12_n0) (observed_obs641) (line-iso-state-may-have-changed_line_x27_x28_obs641) (dominates-2_hyp2_count-as-fault_breaker_x11_x12) (dominates-2_hyp1_count-as-fault_breaker_x11_x12) (pending_obs645) (fault-count-2_count-as-fault_breaker_x13_x14_n0) (observed_obs645) (dominates-2_hyp3_count-as-fault_breaker_x13_x14) (dominates-2_hyp2_count-as-fault_breaker_x13_x14) (dominates-2_hyp1_count-as-fault_breaker_x13_x14) (pending_obs654) (fault-count-2_count-as-fault_breaker_x19_x20_n0) (observed_obs654) (dominates-2_hyp3_count-as-fault_breaker_x19_x20) (dominates-2_hyp2_count-as-fault_breaker_x19_x20) (dominates-2_hyp1_count-as-fault_breaker_x19_x20) (pending_obs636) (fault-count-2_count-as-fault_breaker_x25_x26_n0) (observed_obs636) (line-iso-state-may-have-changed_line_x23_x24_obs636) (pending_obs649) (fault-count-2_count-as-fault_breaker_x5_x6_n0) (observed_obs649) (dominates-2_hyp3_count-as-fault_breaker_x5_x6) (dominates-2_hyp2_count-as-fault_breaker_x5_x6) (dominates-2_hyp1_count-as-fault_breaker_x5_x6) (pending_obs648) (fault-count-2_count-as-fault_breaker_x15_x16_n0) (observed_obs648) (pending_obs635) (breaker-commanded-open_breaker_x25_x26_obs635) (observed_obs635) (pending_obs647) (breaker-commanded-closed_breaker_x15_x16_obs647) (observed_obs647) (pending_obs638) (breaker-commanded-ar-non-auto_breaker_x3_x4_obs638) (observed_obs638) (pending_obs639) (observed_obs639) (fault-count-2_count-as-fault_breaker_x3_x4_n0) (pending_obs650) (observed_obs650) (pending_obs651) (observed_obs651) (pending_obs643) (fault-count-2_count-as-fault_bus_x29_n0) (observed_obs643) (dominates-2_hyp3_count-as-fault_bus_x29) (dominates-2_hyp2_count-as-fault_bus_x29) (dominates-2_hyp1_count-as-fault_bus_x29) (pending_obs652) (fault-count-2_count-as-fault_bus_x30_n0) (observed_obs652) (dominates-2_hyp3_count-as-fault_bus_x30) (dominates-2_hyp2_count-as-fault_bus_x30) (dominates-2_hyp1_count-as-fault_bus_x30) (pending_obs653) (fault-count-2_count-as-fault_bus_x21_n0) (observed_obs653) (dominates-2_hyp3_count-as-fault_bus_x21) (dominates-2_hyp2_count-as-fault_bus_x21) (dominates-2_hyp1_count-as-fault_bus_x21) (fault-count-2_count-as-fault_line_x23_x24_n0) (not_line-isolated_line_x23_x24) (line-iso-trip-in-progress_line_x23_x24_obs636) (not_line-iso-trip-in-progress_line_x23_x24_obs636) (fault-count-2_count-as-fault_line_x27_x28_n0) (not_line-isolated_line_x27_x28) (line-iso-trip-in-progress_line_x27_x28_obs641) (not_line-iso-trip-in-progress_line_x27_x28_obs641) (dominates-2_hyp3_count-as-fault_line_x27_x28) (fault-count-2_count-as-fault_line_x31_x32_n0) (not_line-isolated_line_x31_x32) (line-iso-trip-in-progress_line_x31_x32_obs640) (not_line-iso-trip-in-progress_line_x31_x32_obs640) (dominates-2_hyp1_count-as-fault_line_x31_x32) (line-isolated_line_x23_x24) (line-iso-state-changed_line_x23_x24_obs636) (line-isolated_line_x27_x28) (line-iso-state-changed_line_x27_x28_obs641) (line-isolated_line_x31_x32) (pending_obs644) (fault-count-2_count-as-fault_line_x1_x2_n0) (observed_obs644) (dominates-2_hyp3_count-as-fault_line_x1_x2) (dominates-2_hyp2_count-as-fault_line_x1_x2) (dominates-2_hyp1_count-as-fault_line_x1_x2) (pending_obs637) (observed_obs637) (pending_obs642) (observed_obs642) (future_obs636) (future_obs637) (future_obs638) (future_obs639) (future_obs640) (future_obs641) (future_obs642) (future_obs643) (future_obs644) (future_obs645) (future_obs646) (future_obs647) (future_obs648) (future_obs649) (future_obs650) (future_obs651) (future_obs652) (future_obs653) (future_obs654) (not_at_end_constraint0) (achieved_constraint0) (not_at_end_constraint1) (achieved_constraint1) (not_at_end_constraint2) (achieved_constraint2) (static-true))
 (:action breaker-init-state-was-open_breaker_x3_x4
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x3_x4) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x3_x4) (not (breaker-state-is-unknown_breaker_x3_x4))))
 (:action breaker-init-state-was-open_breaker_x5_x6
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x5_x6) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x5_x6) (not (breaker-state-is-unknown_breaker_x5_x6))))
 (:action breaker-init-state-was-open_breaker_x9_x10
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x9_x10) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x9_x10) (not (breaker-state-is-unknown_breaker_x9_x10))))
 (:action breaker-init-state-was-open_breaker_x11_x12
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x11_x12) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x11_x12) (not (breaker-state-is-unknown_breaker_x11_x12))))
 (:action breaker-init-state-was-open_breaker_x15_x16
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x15_x16) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x15_x16) (not (breaker-state-is-unknown_breaker_x15_x16))))
 (:action breaker-init-state-was-open_breaker_x25_x26
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x25_x26) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x25_x26) (not (breaker-state-is-unknown_breaker_x25_x26))))
 (:action breaker-init-state-was-open_breaker_x33_x34
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x33_x34) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x33_x34) (not (breaker-state-is-unknown_breaker_x33_x34))))
 (:action breaker-init-state-was-open_breaker_x35_x36
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x35_x36) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x35_x36) (not (breaker-state-is-unknown_breaker_x35_x36))))
 (:action breaker-init-state-was-closed_breaker_x3_x4
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x3_x4) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-closed_breaker_x3_x4) (not (breaker-state-is-unknown_breaker_x3_x4))))
 (:action breaker-init-state-was-closed_breaker_x7_x8
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x7_x8) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-closed_breaker_x7_x8) (not (breaker-state-is-unknown_breaker_x7_x8))))
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
 (:action breaker-init-state-was-closed_breaker_x19_x20
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x19_x20) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-closed_breaker_x19_x20) (not (breaker-state-is-unknown_breaker_x19_x20))))
 (:action breaker-init-state-was-closed_breaker_x25_x26
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x25_x26) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-closed_breaker_x25_x26) (not (breaker-state-is-unknown_breaker_x25_x26))))
 (:action breaker-init-state-was-closed_breaker_x33_x34
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x33_x34) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-closed_breaker_x33_x34) (not (breaker-state-is-unknown_breaker_x33_x34))))
 (:action breaker-init-state-was-closed_breaker_x35_x36
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x35_x36) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-closed_breaker_x35_x36) (not (breaker-state-is-unknown_breaker_x35_x36))))
 (:action breaker-init-ar-status-was-auto_breaker_x7_x8
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x7_x8) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-ar-status-is-auto_breaker_x7_x8) (not (breaker-ar-status-is-unknown_breaker_x7_x8))))
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
 (:action breaker-init-ar-status-was-auto_breaker_x19_x20
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x19_x20) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-ar-status-is-auto_breaker_x19_x20) (not (breaker-ar-status-is-unknown_breaker_x19_x20))))
 (:action breaker-init-ar-status-was-auto_breaker_x25_x26
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x25_x26) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-ar-status-is-auto_breaker_x25_x26) (not (breaker-ar-status-is-unknown_breaker_x25_x26))))
 (:action breaker-init-ar-status-was-non-auto_breaker_x9_x10
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x9_x10) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-ar-status-is-non-auto_breaker_x9_x10) (not (breaker-ar-status-is-unknown_breaker_x9_x10))))
 (:action breaker-init-ar-status-was-non-auto_breaker_x11_x12
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x11_x12) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-ar-status-is-non-auto_breaker_x11_x12) (not (breaker-ar-status-is-unknown_breaker_x11_x12))))
 (:action breaker-init-ar-status-was-non-auto_breaker_x25_x26
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x25_x26) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-ar-status-is-non-auto_breaker_x25_x26) (not (breaker-ar-status-is-unknown_breaker_x25_x26))))
 (:action breaker-open-unexplained_breaker_x7_x8_obs646_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x7_x8) (pending_obs646) (fault-count-2_count-as-fault_breaker_x7_x8_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs646) (not (breaker-state-is-closed_breaker_x7_x8)) (not (pending_obs646)) (not (fault-count-2_count-as-fault_breaker_x7_x8_n0)) (not (dominates-2_hyp3_count-as-fault_breaker_x7_x8)) (not (dominates-2_hyp2_count-as-fault_breaker_x7_x8)) (not (dominates-2_hyp1_count-as-fault_breaker_x7_x8))))
 (:action breaker-open-unexplained_breaker_x9_x10_obs640_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x9_x10) (pending_obs640) (fault-count-2_count-as-fault_breaker_x9_x10_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x9_x10) (observed_obs640) (line-iso-state-may-have-changed_line_x31_x32_obs640) (not (breaker-state-is-closed_breaker_x9_x10)) (not (pending_obs640)) (not (fault-count-2_count-as-fault_breaker_x9_x10_n0)) (not (dominates-2_hyp3_count-as-fault_breaker_x9_x10)) (not (dominates-2_hyp2_count-as-fault_breaker_x9_x10))))
 (:action breaker-open-unexplained_breaker_x11_x12_obs641_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x11_x12) (pending_obs641) (fault-count-2_count-as-fault_breaker_x11_x12_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x11_x12) (observed_obs641) (line-iso-state-may-have-changed_line_x27_x28_obs641) (not (breaker-state-is-closed_breaker_x11_x12)) (not (pending_obs641)) (not (fault-count-2_count-as-fault_breaker_x11_x12_n0)) (not (dominates-2_hyp2_count-as-fault_breaker_x11_x12)) (not (dominates-2_hyp1_count-as-fault_breaker_x11_x12))))
 (:action breaker-open-unexplained_breaker_x13_x14_obs645_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x13_x14) (pending_obs645) (fault-count-2_count-as-fault_breaker_x13_x14_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs645) (not (breaker-state-is-closed_breaker_x13_x14)) (not (pending_obs645)) (not (fault-count-2_count-as-fault_breaker_x13_x14_n0)) (not (dominates-2_hyp3_count-as-fault_breaker_x13_x14)) (not (dominates-2_hyp2_count-as-fault_breaker_x13_x14)) (not (dominates-2_hyp1_count-as-fault_breaker_x13_x14))))
 (:action breaker-open-unexplained_breaker_x19_x20_obs654_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x19_x20) (pending_obs654) (fault-count-2_count-as-fault_breaker_x19_x20_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs654) (not (breaker-state-is-closed_breaker_x19_x20)) (not (pending_obs654)) (not (fault-count-2_count-as-fault_breaker_x19_x20_n0)) (not (dominates-2_hyp3_count-as-fault_breaker_x19_x20)) (not (dominates-2_hyp2_count-as-fault_breaker_x19_x20)) (not (dominates-2_hyp1_count-as-fault_breaker_x19_x20))))
 (:action breaker-open-unexplained_breaker_x25_x26_obs636_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x25_x26) (pending_obs636) (fault-count-2_count-as-fault_breaker_x25_x26_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x25_x26) (observed_obs636) (line-iso-state-may-have-changed_line_x23_x24_obs636) (not (breaker-state-is-closed_breaker_x25_x26)) (not (pending_obs636)) (not (fault-count-2_count-as-fault_breaker_x25_x26_n0))))
 (:action breaker-trip-unexplained_breaker_x7_x8_obs646_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x7_x8) (breaker-ar-status-is-auto_breaker_x7_x8) (pending_obs646) (fault-count-2_count-as-fault_breaker_x7_x8_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs646) (not (breaker-state-is-closed_breaker_x7_x8)) (not (pending_obs646)) (not (fault-count-2_count-as-fault_breaker_x7_x8_n0)) (not (dominates-2_hyp3_count-as-fault_breaker_x7_x8)) (not (dominates-2_hyp2_count-as-fault_breaker_x7_x8)) (not (dominates-2_hyp1_count-as-fault_breaker_x7_x8))))
 (:action breaker-trip-unexplained_breaker_x9_x10_obs640_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x9_x10) (breaker-ar-status-is-auto_breaker_x9_x10) (pending_obs640) (fault-count-2_count-as-fault_breaker_x9_x10_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x9_x10) (observed_obs640) (line-iso-state-may-have-changed_line_x31_x32_obs640) (not (breaker-state-is-closed_breaker_x9_x10)) (not (pending_obs640)) (not (fault-count-2_count-as-fault_breaker_x9_x10_n0)) (not (dominates-2_hyp3_count-as-fault_breaker_x9_x10)) (not (dominates-2_hyp2_count-as-fault_breaker_x9_x10))))
 (:action breaker-trip-unexplained_breaker_x11_x12_obs641_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x11_x12) (breaker-ar-status-is-auto_breaker_x11_x12) (pending_obs641) (fault-count-2_count-as-fault_breaker_x11_x12_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x11_x12) (observed_obs641) (line-iso-state-may-have-changed_line_x27_x28_obs641) (not (breaker-state-is-closed_breaker_x11_x12)) (not (pending_obs641)) (not (fault-count-2_count-as-fault_breaker_x11_x12_n0)) (not (dominates-2_hyp2_count-as-fault_breaker_x11_x12)) (not (dominates-2_hyp1_count-as-fault_breaker_x11_x12))))
 (:action breaker-trip-unexplained_breaker_x13_x14_obs645_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x13_x14) (breaker-ar-status-is-auto_breaker_x13_x14) (pending_obs645) (fault-count-2_count-as-fault_breaker_x13_x14_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs645) (not (breaker-state-is-closed_breaker_x13_x14)) (not (pending_obs645)) (not (fault-count-2_count-as-fault_breaker_x13_x14_n0)) (not (dominates-2_hyp3_count-as-fault_breaker_x13_x14)) (not (dominates-2_hyp2_count-as-fault_breaker_x13_x14)) (not (dominates-2_hyp1_count-as-fault_breaker_x13_x14))))
 (:action breaker-trip-unexplained_breaker_x19_x20_obs654_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x19_x20) (breaker-ar-status-is-auto_breaker_x19_x20) (pending_obs654) (fault-count-2_count-as-fault_breaker_x19_x20_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs654) (not (breaker-state-is-closed_breaker_x19_x20)) (not (pending_obs654)) (not (fault-count-2_count-as-fault_breaker_x19_x20_n0)) (not (dominates-2_hyp3_count-as-fault_breaker_x19_x20)) (not (dominates-2_hyp2_count-as-fault_breaker_x19_x20)) (not (dominates-2_hyp1_count-as-fault_breaker_x19_x20))))
 (:action breaker-trip-unexplained_breaker_x25_x26_obs636_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x25_x26) (breaker-ar-status-is-auto_breaker_x25_x26) (pending_obs636) (fault-count-2_count-as-fault_breaker_x25_x26_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x25_x26) (observed_obs636) (line-iso-state-may-have-changed_line_x23_x24_obs636) (not (breaker-state-is-closed_breaker_x25_x26)) (not (pending_obs636)) (not (fault-count-2_count-as-fault_breaker_x25_x26_n0))))
 (:action breaker-close-unexplained_breaker_x5_x6_obs649_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x5_x6) (pending_obs649) (fault-count-2_count-as-fault_breaker_x5_x6_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs649) (not (breaker-state-is-open_breaker_x5_x6)) (not (pending_obs649)) (not (fault-count-2_count-as-fault_breaker_x5_x6_n0)) (not (dominates-2_hyp3_count-as-fault_breaker_x5_x6)) (not (dominates-2_hyp2_count-as-fault_breaker_x5_x6)) (not (dominates-2_hyp1_count-as-fault_breaker_x5_x6))))
 (:action breaker-close-unexplained_breaker_x15_x16_obs648_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x15_x16) (pending_obs648) (fault-count-2_count-as-fault_breaker_x15_x16_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs648) (not (breaker-state-is-open_breaker_x15_x16)) (not (pending_obs648)) (not (fault-count-2_count-as-fault_breaker_x15_x16_n0))))
 (:action breaker-command-open_breaker_x25_x26_obs635
  :parameters ()
  :precondition (and (pending_obs635) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-commanded-open_breaker_x25_x26_obs635) (observed_obs635) (not (pending_obs635))))
 (:action breaker-open-on-command_breaker_x25_x26_obs636_obs635
  :parameters ()
  :precondition (and (pending_obs636) (breaker-commanded-open_breaker_x25_x26_obs635) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x25_x26) (observed_obs636) (line-iso-state-may-have-changed_line_x23_x24_obs636) (not (breaker-state-is-unknown_breaker_x25_x26)) (not (breaker-state-is-closed_breaker_x25_x26)) (not (pending_obs636))))
 (:action breaker-command-close_breaker_x15_x16_obs647
  :parameters ()
  :precondition (and (pending_obs647) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-commanded-closed_breaker_x15_x16_obs647) (observed_obs647) (not (pending_obs647))))
 (:action breaker-close-on-command_breaker_x15_x16_obs648_obs647
  :parameters ()
  :precondition (and (pending_obs648) (breaker-commanded-closed_breaker_x15_x16_obs647) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs648) (not (breaker-state-is-unknown_breaker_x15_x16)) (not (breaker-state-is-open_breaker_x15_x16)) (not (pending_obs648))))
 (:action breaker-command-ar-non-auto-1_breaker_x3_x4_obs638
  :parameters ()
  :precondition (and (pending_obs638) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-commanded-ar-non-auto_breaker_x3_x4_obs638) (observed_obs638) (not (pending_obs638))))
 (:action breaker-ar-status-non-auto-1_breaker_x3_x4_obs639_obs638
  :parameters ()
  :precondition (and (breaker-commanded-ar-non-auto_breaker_x3_x4_obs638) (pending_obs639) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs639) (not (pending_obs639))))
 (:action breaker-ar-status-non-auto-unexplained-1_breaker_x3_x4_obs639_n0_n1
  :parameters ()
  :precondition (and (pending_obs639) (fault-count-2_count-as-fault_breaker_x3_x4_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs639) (not (pending_obs639)) (not (fault-count-2_count-as-fault_breaker_x3_x4_n0))))
 (:action disconnector-command-close_disconnector_x17_x18_obs650
  :parameters ()
  :precondition (and (pending_obs650) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs650) (not (pending_obs650))))
 (:action disconnector-command-close_disconnector_x21_x22_obs651
  :parameters ()
  :precondition (and (pending_obs651) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs651) (not (pending_obs651))))
 (:action bus-voltage-goes-low-unexplained_bus_x29_low_obs643_n0_n1
  :parameters ()
  :precondition (and (pending_obs643) (fault-count-2_count-as-fault_bus_x29_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs643) (not (pending_obs643)) (not (fault-count-2_count-as-fault_bus_x29_n0)) (not (dominates-2_hyp3_count-as-fault_bus_x29)) (not (dominates-2_hyp2_count-as-fault_bus_x29)) (not (dominates-2_hyp1_count-as-fault_bus_x29))))
 (:action bus-voltage-goes-low-unexplained_bus_x30_low_obs652_n0_n1
  :parameters ()
  :precondition (and (pending_obs652) (fault-count-2_count-as-fault_bus_x30_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs652) (not (pending_obs652)) (not (fault-count-2_count-as-fault_bus_x30_n0)) (not (dominates-2_hyp3_count-as-fault_bus_x30)) (not (dominates-2_hyp2_count-as-fault_bus_x30)) (not (dominates-2_hyp1_count-as-fault_bus_x30))))
 (:action bus-voltage-goes-low-unexplained_bus_x21_low_obs653_n0_n1
  :parameters ()
  :precondition (and (pending_obs653) (fault-count-2_count-as-fault_bus_x21_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs653) (not (pending_obs653)) (not (fault-count-2_count-as-fault_bus_x21_n0)) (not (dominates-2_hyp3_count-as-fault_bus_x21)) (not (dominates-2_hyp2_count-as-fault_bus_x21)) (not (dominates-2_hyp1_count-as-fault_bus_x21))))
 (:action line-iso-trip-first-breaker-simple-trip-1_line_x23_x24_breaker_x25_x26_breaker_x25_x26_obs636_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x25_x26) (breaker-ar-status-is-auto_breaker_x25_x26) (pending_obs636) (fault-count-2_count-as-fault_line_x23_x24_n0) (not_line-isolated_line_x23_x24) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x25_x26) (observed_obs636) (line-iso-trip-in-progress_line_x23_x24_obs636) (not (breaker-state-is-closed_breaker_x25_x26)) (not (pending_obs636)) (not (fault-count-2_count-as-fault_line_x23_x24_n0)) (not (not_line-iso-trip-in-progress_line_x23_x24_obs636))))
 (:action line-iso-trip-first-breaker-simple-trip-1_line_x27_x28_breaker_x11_x12_breaker_x11_x12_obs641_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x11_x12) (breaker-ar-status-is-auto_breaker_x11_x12) (pending_obs641) (fault-count-2_count-as-fault_line_x27_x28_n0) (not_line-isolated_line_x27_x28) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x11_x12) (observed_obs641) (line-iso-trip-in-progress_line_x27_x28_obs641) (not (breaker-state-is-closed_breaker_x11_x12)) (not (pending_obs641)) (not (fault-count-2_count-as-fault_line_x27_x28_n0)) (not (not_line-iso-trip-in-progress_line_x27_x28_obs641)) (not (dominates-2_hyp3_count-as-fault_line_x27_x28))))
 (:action line-iso-trip-first-breaker-simple-trip-1_line_x31_x32_breaker_x9_x10_breaker_x9_x10_obs640_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x9_x10) (breaker-ar-status-is-auto_breaker_x9_x10) (pending_obs640) (fault-count-2_count-as-fault_line_x31_x32_n0) (not_line-isolated_line_x31_x32) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x9_x10) (observed_obs640) (line-iso-trip-in-progress_line_x31_x32_obs640) (not (breaker-state-is-closed_breaker_x9_x10)) (not (pending_obs640)) (not (fault-count-2_count-as-fault_line_x31_x32_n0)) (not (not_line-iso-trip-in-progress_line_x31_x32_obs640)) (not (dominates-2_hyp1_count-as-fault_line_x31_x32))))
 (:action line-iso-trip-first-breaker-simple-trip-2_line_x23_x24_breaker_x25_x26_breaker_x25_x26_obs636_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x25_x26) (breaker-ar-status-is-non-auto_breaker_x25_x26) (pending_obs636) (fault-count-2_count-as-fault_line_x23_x24_n0) (not_line-isolated_line_x23_x24) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x25_x26) (observed_obs636) (line-iso-trip-in-progress_line_x23_x24_obs636) (not (breaker-state-is-closed_breaker_x25_x26)) (not (pending_obs636)) (not (fault-count-2_count-as-fault_line_x23_x24_n0)) (not (not_line-iso-trip-in-progress_line_x23_x24_obs636))))
 (:action line-iso-trip-first-breaker-simple-trip-2_line_x27_x28_breaker_x11_x12_breaker_x11_x12_obs641_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x11_x12) (breaker-ar-status-is-non-auto_breaker_x11_x12) (pending_obs641) (fault-count-2_count-as-fault_line_x27_x28_n0) (not_line-isolated_line_x27_x28) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x11_x12) (observed_obs641) (line-iso-trip-in-progress_line_x27_x28_obs641) (not (breaker-state-is-closed_breaker_x11_x12)) (not (pending_obs641)) (not (fault-count-2_count-as-fault_line_x27_x28_n0)) (not (not_line-iso-trip-in-progress_line_x27_x28_obs641)) (not (dominates-2_hyp3_count-as-fault_line_x27_x28))))
 (:action line-iso-trip-first-breaker-simple-trip-2_line_x31_x32_breaker_x9_x10_breaker_x9_x10_obs640_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x9_x10) (breaker-ar-status-is-non-auto_breaker_x9_x10) (pending_obs640) (fault-count-2_count-as-fault_line_x31_x32_n0) (not_line-isolated_line_x31_x32) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (breaker-state-is-open_breaker_x9_x10) (observed_obs640) (line-iso-trip-in-progress_line_x31_x32_obs640) (not (breaker-state-is-closed_breaker_x9_x10)) (not (pending_obs640)) (not (fault-count-2_count-as-fault_line_x31_x32_n0)) (not (not_line-iso-trip-in-progress_line_x31_x32_obs640)) (not (dominates-2_hyp1_count-as-fault_line_x31_x32))))
 (:action line-finish-iso-trip-2_line_x23_x24_breaker_x25_x26_breaker_x3_x4_obs636
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x3_x4) (breaker-state-is-open_breaker_x25_x26) (line-iso-trip-in-progress_line_x23_x24_obs636) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (not_line-iso-trip-in-progress_line_x23_x24_obs636) (line-isolated_line_x23_x24) (line-iso-state-changed_line_x23_x24_obs636) (not (not_line-isolated_line_x23_x24)) (not (line-iso-trip-in-progress_line_x23_x24_obs636))))
 (:action line-finish-iso-trip-2_line_x27_x28_breaker_x35_x36_breaker_x11_x12_obs641
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x11_x12) (breaker-state-is-open_breaker_x35_x36) (line-iso-trip-in-progress_line_x27_x28_obs641) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (not_line-iso-trip-in-progress_line_x27_x28_obs641) (line-isolated_line_x27_x28) (line-iso-state-changed_line_x27_x28_obs641) (not (not_line-isolated_line_x27_x28)) (not (line-iso-trip-in-progress_line_x27_x28_obs641))))
 (:action line-finish-iso-trip-2_line_x31_x32_breaker_x33_x34_breaker_x9_x10_obs640
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x9_x10) (breaker-state-is-open_breaker_x33_x34) (line-iso-trip-in-progress_line_x31_x32_obs640) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (not_line-iso-trip-in-progress_line_x31_x32_obs640) (line-isolated_line_x31_x32) (not (not_line-isolated_line_x31_x32)) (not (line-iso-trip-in-progress_line_x31_x32_obs640))))
 (:action line-set-state-isolated-2_line_x23_x24_breaker_x25_x26_breaker_x3_x4_obs636
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x3_x4) (breaker-state-is-open_breaker_x25_x26) (line-iso-state-may-have-changed_line_x23_x24_obs636) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (line-isolated_line_x23_x24) (line-iso-state-changed_line_x23_x24_obs636) (not (not_line-isolated_line_x23_x24))))
 (:action line-set-state-isolated-2_line_x27_x28_breaker_x35_x36_breaker_x11_x12_obs641
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x11_x12) (breaker-state-is-open_breaker_x35_x36) (line-iso-state-may-have-changed_line_x27_x28_obs641) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (line-isolated_line_x27_x28) (line-iso-state-changed_line_x27_x28_obs641) (not (not_line-isolated_line_x27_x28))))
 (:action line-set-state-isolated-2_line_x31_x32_breaker_x33_x34_breaker_x9_x10_obs640
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x9_x10) (breaker-state-is-open_breaker_x33_x34) (line-iso-state-may-have-changed_line_x31_x32_obs640) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (line-isolated_line_x31_x32) (not (not_line-isolated_line_x31_x32))))
 (:action line-init-state-isolated-2_line_x23_x24_breaker_x25_x26_breaker_x3_x4
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x3_x4) (breaker-state-is-open_breaker_x25_x26) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (line-isolated_line_x23_x24) (not (not_line-isolated_line_x23_x24))))
 (:action line-init-state-isolated-2_line_x27_x28_breaker_x35_x36_breaker_x11_x12
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x11_x12) (breaker-state-is-open_breaker_x35_x36) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (line-isolated_line_x27_x28) (not (not_line-isolated_line_x27_x28))))
 (:action line-init-state-isolated-2_line_x31_x32_breaker_x33_x34_breaker_x9_x10
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x9_x10) (breaker-state-is-open_breaker_x33_x34) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (line-isolated_line_x31_x32) (not (not_line-isolated_line_x31_x32))))
 (:action line-voltage-goes-to-zero-unexplained-1_line_x1_x2_obs644_n0_n1
  :parameters ()
  :precondition (and (pending_obs644) (fault-count-2_count-as-fault_line_x1_x2_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs644) (not (pending_obs644)) (not (fault-count-2_count-as-fault_line_x1_x2_n0)) (not (dominates-2_hyp3_count-as-fault_line_x1_x2)) (not (dominates-2_hyp2_count-as-fault_line_x1_x2)) (not (dominates-2_hyp1_count-as-fault_line_x1_x2))))
 (:action line-voltage-goes-to-zero-unexplained-1_line_x23_x24_obs637_n0_n1
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_line_x23_x24_n0) (pending_obs637) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs637) (not (fault-count-2_count-as-fault_line_x23_x24_n0)) (not (pending_obs637))))
 (:action line-voltage-goes-to-zero-unexplained-1_line_x27_x28_obs642_n0_n1
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_line_x27_x28_n0) (pending_obs642) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs642) (not (fault-count-2_count-as-fault_line_x27_x28_n0)) (not (dominates-2_hyp3_count-as-fault_line_x27_x28)) (not (pending_obs642))))
 (:action line-voltage-goes-to-zero-when-isolated-1_line_x23_x24_obs637_obs636
  :parameters ()
  :precondition (and (line-isolated_line_x23_x24) (line-iso-state-changed_line_x23_x24_obs636) (pending_obs637) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs637) (not (pending_obs637))))
 (:action line-voltage-goes-to-zero-when-isolated-1_line_x27_x28_obs642_obs641
  :parameters ()
  :precondition (and (line-isolated_line_x27_x28) (line-iso-state-changed_line_x27_x28_obs641) (pending_obs642) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (observed_obs642) (not (pending_obs642))))
 (:action advance-to-obs_obs636
  :parameters ()
  :precondition (and (observed_obs635) (future_obs636) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs636) (not (future_obs636))))
 (:action advance-to-obs_obs637
  :parameters ()
  :precondition (and (observed_obs636) (future_obs637) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs637) (not (future_obs637))))
 (:action advance-to-obs_obs638
  :parameters ()
  :precondition (and (not_line-iso-trip-in-progress_line_x23_x24_obs636) (observed_obs637) (future_obs638) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs638) (not (future_obs638))))
 (:action advance-to-obs_obs639
  :parameters ()
  :precondition (and (observed_obs638) (future_obs639) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs639) (not (line-iso-state-may-have-changed_line_x23_x24_obs636)) (not (line-iso-state-changed_line_x23_x24_obs636)) (not (future_obs639))))
 (:action advance-to-obs_obs640
  :parameters ()
  :precondition (and (observed_obs639) (future_obs640) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs640) (not (future_obs640))))
 (:action advance-to-obs_obs641
  :parameters ()
  :precondition (and (observed_obs640) (future_obs641) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs641) (not (future_obs641))))
 (:action advance-to-obs_obs642
  :parameters ()
  :precondition (and (observed_obs641) (not_line-iso-trip-in-progress_line_x27_x28_obs641) (not_line-iso-trip-in-progress_line_x31_x32_obs640) (future_obs642) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs642) (not (future_obs642))))
 (:action advance-to-obs_obs643
  :parameters ()
  :precondition (and (observed_obs642) (future_obs643) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs643) (not (future_obs643))))
 (:action advance-to-obs_obs644
  :parameters ()
  :precondition (and (observed_obs642) (future_obs644) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs644) (not (future_obs644))))
 (:action advance-to-obs_obs645
  :parameters ()
  :precondition (and (observed_obs643) (observed_obs644) (future_obs645) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs645) (not (future_obs645))))
 (:action advance-to-obs_obs646
  :parameters ()
  :precondition (and (observed_obs645) (future_obs646) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs646) (not (line-iso-state-may-have-changed_line_x31_x32_obs640)) (not (line-iso-state-may-have-changed_line_x27_x28_obs641)) (not (breaker-commanded-ar-non-auto_breaker_x3_x4_obs638)) (not (line-iso-state-changed_line_x27_x28_obs641)) (not (future_obs646))))
 (:action advance-to-obs_obs647
  :parameters ()
  :precondition (and (observed_obs646) (future_obs647) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs647) (not (future_obs647))))
 (:action advance-to-obs_obs648
  :parameters ()
  :precondition (and (observed_obs647) (future_obs648) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs648) (not (future_obs648))))
 (:action advance-to-obs_obs649
  :parameters ()
  :precondition (and (observed_obs648) (future_obs649) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs649) (not (future_obs649))))
 (:action advance-to-obs_obs650
  :parameters ()
  :precondition (and (observed_obs649) (future_obs650) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs650) (not (future_obs650))))
 (:action advance-to-obs_obs651
  :parameters ()
  :precondition (and (observed_obs650) (future_obs651) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs651) (not (future_obs651))))
 (:action advance-to-obs_obs652
  :parameters ()
  :precondition (and (observed_obs651) (future_obs652) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs652) (not (breaker-commanded-closed_breaker_x15_x16_obs647)) (not (future_obs652))))
 (:action advance-to-obs_obs653
  :parameters ()
  :precondition (and (observed_obs651) (future_obs653) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs653) (not (future_obs653))))
 (:action advance-to-obs_obs654
  :parameters ()
  :precondition (and (observed_obs652) (observed_obs653) (future_obs654) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (pending_obs654) (not (future_obs654))))
 (:action set_goal_1_constraint0
  :parameters ()
  :precondition (and (observed_obs646) (observed_obs640) (dominates-2_hyp3_count-as-fault_breaker_x9_x10) (observed_obs641) (observed_obs645) (observed_obs654) (observed_obs636) (observed_obs649) (observed_obs648) (observed_obs635) (observed_obs647) (observed_obs638) (observed_obs639) (observed_obs650) (observed_obs651) (observed_obs643) (observed_obs652) (observed_obs653) (observed_obs644) (observed_obs637) (observed_obs642) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (achieved_constraint0) (not (not_at_end_constraint0))))
 (:action set_goal_8_constraint0
  :parameters ()
  :precondition (and (observed_obs646) (observed_obs640) (observed_obs641) (observed_obs645) (observed_obs654) (observed_obs636) (observed_obs649) (observed_obs648) (observed_obs635) (observed_obs647) (observed_obs638) (observed_obs639) (observed_obs650) (observed_obs651) (observed_obs643) (observed_obs652) (observed_obs653) (dominates-2_hyp3_count-as-fault_line_x27_x28) (observed_obs644) (observed_obs637) (observed_obs642) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (achieved_constraint0) (not (not_at_end_constraint0))))
 (:action set_goal_1_constraint1
  :parameters ()
  :precondition (and (observed_obs646) (observed_obs640) (dominates-2_hyp2_count-as-fault_breaker_x9_x10) (observed_obs641) (observed_obs645) (observed_obs654) (observed_obs636) (observed_obs649) (observed_obs648) (observed_obs635) (observed_obs647) (observed_obs638) (observed_obs639) (observed_obs650) (observed_obs651) (observed_obs643) (observed_obs652) (observed_obs653) (observed_obs644) (observed_obs637) (observed_obs642) (achieved_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (achieved_constraint1) (not (not_at_end_constraint1))))
 (:action set_goal_2_constraint1
  :parameters ()
  :precondition (and (observed_obs646) (observed_obs640) (observed_obs641) (dominates-2_hyp2_count-as-fault_breaker_x11_x12) (observed_obs645) (observed_obs654) (observed_obs636) (observed_obs649) (observed_obs648) (observed_obs635) (observed_obs647) (observed_obs638) (observed_obs639) (observed_obs650) (observed_obs651) (observed_obs643) (observed_obs652) (observed_obs653) (observed_obs644) (observed_obs637) (observed_obs642) (achieved_constraint0) (not_at_end_constraint1) (not_at_end_constraint2))
  :effect (and (achieved_constraint1) (not (not_at_end_constraint1))))
 (:action set_goal_1_constraint2
  :parameters ()
  :precondition (and (observed_obs646) (observed_obs640) (observed_obs641) (dominates-2_hyp1_count-as-fault_breaker_x11_x12) (observed_obs645) (observed_obs654) (observed_obs636) (observed_obs649) (observed_obs648) (observed_obs635) (observed_obs647) (observed_obs638) (observed_obs639) (observed_obs650) (observed_obs651) (observed_obs643) (observed_obs652) (observed_obs653) (observed_obs644) (observed_obs637) (observed_obs642) (achieved_constraint0) (achieved_constraint1) (not_at_end_constraint2))
  :effect (and (achieved_constraint2) (not (not_at_end_constraint2))))
 (:action set_goal_8_constraint2
  :parameters ()
  :precondition (and (observed_obs646) (observed_obs640) (observed_obs641) (observed_obs645) (observed_obs654) (observed_obs636) (observed_obs649) (observed_obs648) (observed_obs635) (observed_obs647) (observed_obs638) (observed_obs639) (observed_obs650) (observed_obs651) (observed_obs643) (observed_obs652) (observed_obs653) (dominates-2_hyp1_count-as-fault_line_x31_x32) (observed_obs644) (observed_obs637) (observed_obs642) (achieved_constraint0) (achieved_constraint1) (not_at_end_constraint2))
  :effect (and (achieved_constraint2) (not (not_at_end_constraint2))))
)
