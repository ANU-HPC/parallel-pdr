(define (domain appn-pls)
 (:requirements :strips :equality)
 (:predicates (breaker-state-is-unknown_breaker_x5_x6) (breaker-state-is-open_breaker_x5_x6) (breaker-state-is-unknown_breaker_x11_x12) (breaker-state-is-open_breaker_x11_x12) (breaker-state-is-unknown_breaker_x17_x18) (breaker-state-is-open_breaker_x17_x18) (breaker-state-is-unknown_breaker_x19_x20) (breaker-state-is-open_breaker_x19_x20) (breaker-state-is-unknown_breaker_x22_x23) (breaker-state-is-open_breaker_x22_x23) (breaker-state-is-unknown_breaker_x26_x27) (breaker-state-is-open_breaker_x26_x27) (breaker-state-is-unknown_breaker_x28_x29) (breaker-state-is-open_breaker_x28_x29) (breaker-state-is-closed_breaker_x5_x6) (breaker-state-is-closed_breaker_x11_x12) (breaker-state-is-closed_breaker_x17_x18) (breaker-state-is-closed_breaker_x19_x20) (breaker-state-is-closed_breaker_x22_x23) (breaker-state-is-closed_breaker_x26_x27) (breaker-state-is-closed_breaker_x28_x29) (breaker-ar-status-is-unknown_breaker_x11_x12) (breaker-ar-status-is-auto_breaker_x11_x12) (breaker-ar-status-is-unknown_breaker_x17_x18) (breaker-ar-status-is-auto_breaker_x17_x18) (breaker-ar-status-is-unknown_breaker_x19_x20) (breaker-ar-status-is-auto_breaker_x19_x20) (breaker-ar-status-is-non-auto_breaker_x11_x12) (breaker-ar-status-is-non-auto_breaker_x17_x18) (breaker-ar-status-is-non-auto_breaker_x19_x20) (pending_obs1410) (fault-count-2_count-as-fault_breaker_x11_x12_n0) (observed_obs1410) (fault-count-2_count-as-fault_breaker_x11_x12_n1) (line-iso-state-may-have-changed_line_x13_x14_obs1410) (dominates-2_hyp4_count-as-fault_breaker_x11_x12) (dominates-2_hyp3_count-as-fault_breaker_x11_x12) (dominates-2_hyp2_count-as-fault_breaker_x11_x12) (dominates-2_hyp1_count-as-fault_breaker_x11_x12) (pending_obs1407) (fault-count-2_count-as-fault_breaker_x17_x18_n0) (observed_obs1407) (fault-count-2_count-as-fault_breaker_x17_x18_n1) (line-iso-state-may-have-changed_line_x15_x16_obs1407) (dominates-2_hyp2_count-as-fault_breaker_x17_x18) (dominates-2_hyp1_count-as-fault_breaker_x17_x18) (pending_obs1412) (fault-count-2_count-as-fault_breaker_x19_x20_n0) (observed_obs1412) (fault-count-2_count-as-fault_breaker_x19_x20_n1) (line-iso-state-may-have-changed_line_x13_x14_obs1412) (dominates-2_hyp3_count-as-fault_breaker_x19_x20) (dominates-2_hyp2_count-as-fault_breaker_x19_x20) (breaker-auto-reclose-wait_breaker_x19_x20_obs1412) (pending_obs1415) (fault-count-2_count-as-fault_breaker_x5_x6_n0) (observed_obs1415) (fault-count-2_count-as-fault_breaker_x5_x6_n1) (line-iso-state-may-have-changed_line_x15_x16_obs1415) (dominates-2_hyp4_count-as-fault_breaker_x5_x6) (dominates-2_hyp3_count-as-fault_breaker_x5_x6) (dominates-2_hyp2_count-as-fault_breaker_x5_x6) (dominates-2_hyp1_count-as-fault_breaker_x5_x6) (pending_obs1416) (observed_obs1416) (line-iso-state-may-have-changed_line_x13_x14_obs1416) (breaker-auto-reopen-wait_breaker_x19_x20_obs1416) (pending_obs1405) (observed_obs1405) (pending_obs1414) (observed_obs1414) (pending_obs1406) (breaker-commanded-open_breaker_x11_x12_obs1406) (observed_obs1406) (pending_obs1398) (breaker-commanded-open_breaker_x19_x20_obs1398) (observed_obs1398) (pending_obs1417) (observed_obs1417) (pending_obs1401) (breaker-commanded-ar-non-auto_breaker_x7_x8_obs1401) (observed_obs1401) (pending_obs1402) (breaker-commanded-ar-non-auto_breaker_x9_x10_obs1402) (observed_obs1402) (pending_obs1411) (breaker-commanded-ar-non-auto_breaker_x11_x12_obs1411) (observed_obs1411) (pending_obs1408) (observed_obs1408) (pending_obs1403) (observed_obs1403) (pending_obs1404) (observed_obs1404) (pending_obs1400) (observed_obs1400) (fault-count-2_count-as-fault_breaker_x3_x4_n0) (fault-count-2_count-as-fault_breaker_x3_x4_n1) (dominates-2_hyp4_count-as-fault_breaker_x3_x4) (dominates-2_hyp3_count-as-fault_breaker_x3_x4) (dominates-2_hyp2_count-as-fault_breaker_x3_x4) (dominates-2_hyp1_count-as-fault_breaker_x3_x4) (fault-count-2_count-as-fault_breaker_x7_x8_n0) (fault-count-2_count-as-fault_breaker_x7_x8_n1) (fault-count-2_count-as-fault_breaker_x9_x10_n0) (fault-count-2_count-as-fault_breaker_x9_x10_n1) (pending_obs1413) (fault-count-2_count-as-fault_bus_x21_n0) (observed_obs1413) (fault-count-2_count-as-fault_bus_x21_n1) (dominates-2_hyp4_count-as-fault_bus_x21) (dominates-2_hyp3_count-as-fault_bus_x21) (dominates-2_hyp2_count-as-fault_bus_x21) (dominates-2_hyp1_count-as-fault_bus_x21) (fault-count-2_count-as-fault_line_x13_x14_n0) (not_line-isolated_line_x13_x14) (line-iso-trip-in-progress_line_x13_x14_obs1410) (not_line-iso-trip-in-progress_line_x13_x14_obs1410) (fault-count-2_count-as-fault_line_x13_x14_n1) (dominates-2_hyp3_count-as-fault_line_x13_x14) (dominates-2_hyp2_count-as-fault_line_x13_x14) (dominates-2_hyp4_count-as-fault_line_x13_x14) (dominates-2_hyp1_count-as-fault_line_x13_x14) (line-iso-trip-in-progress_line_x13_x14_obs1412) (not_line-iso-trip-in-progress_line_x13_x14_obs1412) (fault-count-2_count-as-fault_line_x15_x16_n0) (not_line-isolated_line_x15_x16) (line-iso-trip-in-progress_line_x15_x16_obs1407) (not_line-iso-trip-in-progress_line_x15_x16_obs1407) (fault-count-2_count-as-fault_line_x15_x16_n1) (dominates-2_hyp4_count-as-fault_line_x15_x16) (dominates-2_hyp3_count-as-fault_line_x15_x16) (line-isolated_line_x13_x14) (line-iso-state-changed_line_x13_x14_obs1410) (line-iso-state-changed_line_x13_x14_obs1412) (line-iso-state-changed_line_x13_x14_obs1416) (line-isolated_line_x15_x16) (line-iso-state-changed_line_x15_x16_obs1407) (line-iso-state-changed_line_x15_x16_obs1415) (pending_obs1399) (observed_obs1399) (pending_obs1409) (observed_obs1409) (future_obs1400) (future_obs1401) (future_obs1402) (future_obs1403) (future_obs1404) (future_obs1405) (future_obs1406) (future_obs1407) (future_obs1408) (future_obs1409) (future_obs1410) (future_obs1411) (future_obs1412) (future_obs1413) (future_obs1414) (future_obs1415) (future_obs1416) (future_obs1417) (not_at_end_constraint0) (achieved_constraint0) (not_at_end_constraint1) (achieved_constraint1) (not_at_end_constraint2) (achieved_constraint2) (not_at_end_constraint3) (achieved_constraint3) (static-true))
 (:action breaker-init-state-was-open_breaker_x5_x6
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x5_x6) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-state-is-open_breaker_x5_x6) (not (breaker-state-is-unknown_breaker_x5_x6))))
 (:action breaker-init-state-was-open_breaker_x11_x12
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x11_x12) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-state-is-open_breaker_x11_x12) (not (breaker-state-is-unknown_breaker_x11_x12))))
 (:action breaker-init-state-was-open_breaker_x17_x18
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x17_x18) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-state-is-open_breaker_x17_x18) (not (breaker-state-is-unknown_breaker_x17_x18))))
 (:action breaker-init-state-was-open_breaker_x19_x20
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x19_x20) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-state-is-open_breaker_x19_x20) (not (breaker-state-is-unknown_breaker_x19_x20))))
 (:action breaker-init-state-was-open_breaker_x22_x23
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x22_x23) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-state-is-open_breaker_x22_x23) (not (breaker-state-is-unknown_breaker_x22_x23))))
 (:action breaker-init-state-was-open_breaker_x26_x27
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x26_x27) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-state-is-open_breaker_x26_x27) (not (breaker-state-is-unknown_breaker_x26_x27))))
 (:action breaker-init-state-was-open_breaker_x28_x29
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x28_x29) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-state-is-open_breaker_x28_x29) (not (breaker-state-is-unknown_breaker_x28_x29))))
 (:action breaker-init-state-was-closed_breaker_x5_x6
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x5_x6) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-state-is-closed_breaker_x5_x6) (not (breaker-state-is-unknown_breaker_x5_x6))))
 (:action breaker-init-state-was-closed_breaker_x11_x12
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x11_x12) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-state-is-closed_breaker_x11_x12) (not (breaker-state-is-unknown_breaker_x11_x12))))
 (:action breaker-init-state-was-closed_breaker_x17_x18
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x17_x18) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-state-is-closed_breaker_x17_x18) (not (breaker-state-is-unknown_breaker_x17_x18))))
 (:action breaker-init-state-was-closed_breaker_x19_x20
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x19_x20) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-state-is-closed_breaker_x19_x20) (not (breaker-state-is-unknown_breaker_x19_x20))))
 (:action breaker-init-state-was-closed_breaker_x22_x23
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x22_x23) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-state-is-closed_breaker_x22_x23) (not (breaker-state-is-unknown_breaker_x22_x23))))
 (:action breaker-init-state-was-closed_breaker_x26_x27
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x26_x27) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-state-is-closed_breaker_x26_x27) (not (breaker-state-is-unknown_breaker_x26_x27))))
 (:action breaker-init-state-was-closed_breaker_x28_x29
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x28_x29) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-state-is-closed_breaker_x28_x29) (not (breaker-state-is-unknown_breaker_x28_x29))))
 (:action breaker-init-ar-status-was-auto_breaker_x11_x12
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x11_x12) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-ar-status-is-auto_breaker_x11_x12) (not (breaker-ar-status-is-unknown_breaker_x11_x12))))
 (:action breaker-init-ar-status-was-auto_breaker_x17_x18
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x17_x18) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-ar-status-is-auto_breaker_x17_x18) (not (breaker-ar-status-is-unknown_breaker_x17_x18))))
 (:action breaker-init-ar-status-was-auto_breaker_x19_x20
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x19_x20) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-ar-status-is-auto_breaker_x19_x20) (not (breaker-ar-status-is-unknown_breaker_x19_x20))))
 (:action breaker-init-ar-status-was-non-auto_breaker_x11_x12
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x11_x12) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-ar-status-is-non-auto_breaker_x11_x12) (not (breaker-ar-status-is-unknown_breaker_x11_x12))))
 (:action breaker-init-ar-status-was-non-auto_breaker_x17_x18
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x17_x18) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-ar-status-is-non-auto_breaker_x17_x18) (not (breaker-ar-status-is-unknown_breaker_x17_x18))))
 (:action breaker-init-ar-status-was-non-auto_breaker_x19_x20
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x19_x20) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-ar-status-is-non-auto_breaker_x19_x20) (not (breaker-ar-status-is-unknown_breaker_x19_x20))))
 (:action breaker-open-unexplained_breaker_x11_x12_obs1410_n1_n2
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x11_x12) (pending_obs1410) (fault-count-2_count-as-fault_breaker_x11_x12_n1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-state-is-open_breaker_x11_x12) (observed_obs1410) (line-iso-state-may-have-changed_line_x13_x14_obs1410) (not (breaker-state-is-closed_breaker_x11_x12)) (not (pending_obs1410)) (not (fault-count-2_count-as-fault_breaker_x11_x12_n1))))
 (:action breaker-open-unexplained_breaker_x17_x18_obs1407_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x17_x18) (pending_obs1407) (fault-count-2_count-as-fault_breaker_x17_x18_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-state-is-open_breaker_x17_x18) (observed_obs1407) (fault-count-2_count-as-fault_breaker_x17_x18_n1) (line-iso-state-may-have-changed_line_x15_x16_obs1407) (not (breaker-state-is-closed_breaker_x17_x18)) (not (pending_obs1407)) (not (fault-count-2_count-as-fault_breaker_x17_x18_n0)) (not (dominates-2_hyp2_count-as-fault_breaker_x17_x18)) (not (dominates-2_hyp1_count-as-fault_breaker_x17_x18))))
 (:action breaker-open-unexplained_breaker_x19_x20_obs1412_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x19_x20) (pending_obs1412) (fault-count-2_count-as-fault_breaker_x19_x20_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-state-is-open_breaker_x19_x20) (observed_obs1412) (fault-count-2_count-as-fault_breaker_x19_x20_n1) (line-iso-state-may-have-changed_line_x13_x14_obs1412) (not (breaker-state-is-closed_breaker_x19_x20)) (not (pending_obs1412)) (not (fault-count-2_count-as-fault_breaker_x19_x20_n0)) (not (dominates-2_hyp3_count-as-fault_breaker_x19_x20)) (not (dominates-2_hyp2_count-as-fault_breaker_x19_x20))))
 (:action breaker-trip-unexplained_breaker_x11_x12_obs1410_n1_n2
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x11_x12) (breaker-ar-status-is-auto_breaker_x11_x12) (pending_obs1410) (fault-count-2_count-as-fault_breaker_x11_x12_n1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-state-is-open_breaker_x11_x12) (observed_obs1410) (line-iso-state-may-have-changed_line_x13_x14_obs1410) (not (breaker-state-is-closed_breaker_x11_x12)) (not (pending_obs1410)) (not (fault-count-2_count-as-fault_breaker_x11_x12_n1))))
 (:action breaker-trip-unexplained_breaker_x17_x18_obs1407_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x17_x18) (breaker-ar-status-is-auto_breaker_x17_x18) (pending_obs1407) (fault-count-2_count-as-fault_breaker_x17_x18_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-state-is-open_breaker_x17_x18) (observed_obs1407) (fault-count-2_count-as-fault_breaker_x17_x18_n1) (line-iso-state-may-have-changed_line_x15_x16_obs1407) (not (breaker-state-is-closed_breaker_x17_x18)) (not (pending_obs1407)) (not (fault-count-2_count-as-fault_breaker_x17_x18_n0)) (not (dominates-2_hyp2_count-as-fault_breaker_x17_x18)) (not (dominates-2_hyp1_count-as-fault_breaker_x17_x18))))
 (:action breaker-trip-unexplained_breaker_x19_x20_obs1412_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x19_x20) (breaker-ar-status-is-auto_breaker_x19_x20) (pending_obs1412) (fault-count-2_count-as-fault_breaker_x19_x20_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-state-is-open_breaker_x19_x20) (observed_obs1412) (fault-count-2_count-as-fault_breaker_x19_x20_n1) (line-iso-state-may-have-changed_line_x13_x14_obs1412) (breaker-auto-reclose-wait_breaker_x19_x20_obs1412) (not (breaker-state-is-closed_breaker_x19_x20)) (not (pending_obs1412)) (not (fault-count-2_count-as-fault_breaker_x19_x20_n0)) (not (dominates-2_hyp3_count-as-fault_breaker_x19_x20)) (not (dominates-2_hyp2_count-as-fault_breaker_x19_x20))))
 (:action breaker-close-unexplained_breaker_x5_x6_obs1415_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x5_x6) (pending_obs1415) (fault-count-2_count-as-fault_breaker_x5_x6_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-state-is-closed_breaker_x5_x6) (observed_obs1415) (fault-count-2_count-as-fault_breaker_x5_x6_n1) (line-iso-state-may-have-changed_line_x15_x16_obs1415) (not (breaker-state-is-open_breaker_x5_x6)) (not (pending_obs1415)) (not (fault-count-2_count-as-fault_breaker_x5_x6_n0)) (not (dominates-2_hyp4_count-as-fault_breaker_x5_x6)) (not (dominates-2_hyp3_count-as-fault_breaker_x5_x6)) (not (dominates-2_hyp2_count-as-fault_breaker_x5_x6)) (not (dominates-2_hyp1_count-as-fault_breaker_x5_x6))))
 (:action breaker-close-unexplained_breaker_x19_x20_obs1416_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x19_x20) (fault-count-2_count-as-fault_breaker_x19_x20_n0) (pending_obs1416) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-state-is-closed_breaker_x19_x20) (fault-count-2_count-as-fault_breaker_x19_x20_n1) (observed_obs1416) (line-iso-state-may-have-changed_line_x13_x14_obs1416) (not (breaker-state-is-open_breaker_x19_x20)) (not (fault-count-2_count-as-fault_breaker_x19_x20_n0)) (not (dominates-2_hyp3_count-as-fault_breaker_x19_x20)) (not (dominates-2_hyp2_count-as-fault_breaker_x19_x20)) (not (pending_obs1416))))
 (:action breaker-close-unexplained_breaker_x19_x20_obs1416_n1_n2
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x19_x20) (fault-count-2_count-as-fault_breaker_x19_x20_n1) (pending_obs1416) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-state-is-closed_breaker_x19_x20) (observed_obs1416) (line-iso-state-may-have-changed_line_x13_x14_obs1416) (not (breaker-state-is-open_breaker_x19_x20)) (not (fault-count-2_count-as-fault_breaker_x19_x20_n1)) (not (pending_obs1416))))
 (:action breaker-reclose_breaker_x19_x20_obs1416_obs1412
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x19_x20) (breaker-auto-reclose-wait_breaker_x19_x20_obs1412) (pending_obs1416) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-state-is-closed_breaker_x19_x20) (observed_obs1416) (line-iso-state-may-have-changed_line_x13_x14_obs1416) (breaker-auto-reopen-wait_breaker_x19_x20_obs1416) (not (breaker-state-is-open_breaker_x19_x20)) (not (pending_obs1416))))
 (:action breaker-command-open_breaker_x7_x8_obs1405
  :parameters ()
  :precondition (and (pending_obs1405) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (observed_obs1405) (not (pending_obs1405))))
 (:action breaker-command-open_breaker_x9_x10_obs1414
  :parameters ()
  :precondition (and (pending_obs1414) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (observed_obs1414) (not (pending_obs1414))))
 (:action breaker-command-open_breaker_x11_x12_obs1406
  :parameters ()
  :precondition (and (pending_obs1406) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-commanded-open_breaker_x11_x12_obs1406) (observed_obs1406) (not (pending_obs1406))))
 (:action breaker-command-open_breaker_x19_x20_obs1398
  :parameters ()
  :precondition (and (pending_obs1398) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-commanded-open_breaker_x19_x20_obs1398) (observed_obs1398) (not (pending_obs1398))))
 (:action breaker-open-on-command_breaker_x11_x12_obs1410_obs1406
  :parameters ()
  :precondition (and (pending_obs1410) (breaker-commanded-open_breaker_x11_x12_obs1406) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-state-is-open_breaker_x11_x12) (observed_obs1410) (line-iso-state-may-have-changed_line_x13_x14_obs1410) (not (breaker-state-is-unknown_breaker_x11_x12)) (not (breaker-state-is-closed_breaker_x11_x12)) (not (pending_obs1410))))
 (:action breaker-open-on-command_breaker_x19_x20_obs1412_obs1398
  :parameters ()
  :precondition (and (pending_obs1412) (breaker-commanded-open_breaker_x19_x20_obs1398) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-state-is-open_breaker_x19_x20) (observed_obs1412) (line-iso-state-may-have-changed_line_x13_x14_obs1412) (not (breaker-state-is-unknown_breaker_x19_x20)) (not (breaker-state-is-closed_breaker_x19_x20)) (not (pending_obs1412))))
 (:action breaker-command-ar-non-auto-1_breaker_x1_x2_obs1417
  :parameters ()
  :precondition (and (pending_obs1417) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (observed_obs1417) (not (pending_obs1417))))
 (:action breaker-command-ar-non-auto-1_breaker_x7_x8_obs1401
  :parameters ()
  :precondition (and (pending_obs1401) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-commanded-ar-non-auto_breaker_x7_x8_obs1401) (observed_obs1401) (not (pending_obs1401))))
 (:action breaker-command-ar-non-auto-1_breaker_x9_x10_obs1402
  :parameters ()
  :precondition (and (pending_obs1402) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-commanded-ar-non-auto_breaker_x9_x10_obs1402) (observed_obs1402) (not (pending_obs1402))))
 (:action breaker-command-ar-non-auto-1_breaker_x11_x12_obs1411
  :parameters ()
  :precondition (and (pending_obs1411) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-commanded-ar-non-auto_breaker_x11_x12_obs1411) (observed_obs1411) (not (pending_obs1411))))
 (:action breaker-ar-status-non-auto-1_breaker_x7_x8_obs1403_obs1401
  :parameters ()
  :precondition (and (breaker-commanded-ar-non-auto_breaker_x7_x8_obs1401) (pending_obs1403) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (observed_obs1403) (not (pending_obs1403))))
 (:action breaker-ar-status-non-auto-1_breaker_x9_x10_obs1404_obs1402
  :parameters ()
  :precondition (and (breaker-commanded-ar-non-auto_breaker_x9_x10_obs1402) (pending_obs1404) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (observed_obs1404) (not (pending_obs1404))))
 (:action breaker-ar-status-non-auto-unexplained-1_breaker_x3_x4_obs1408_n0_n1
  :parameters ()
  :precondition (and (pending_obs1408) (fault-count-2_count-as-fault_breaker_x3_x4_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (observed_obs1408) (fault-count-2_count-as-fault_breaker_x3_x4_n1) (not (pending_obs1408)) (not (fault-count-2_count-as-fault_breaker_x3_x4_n0)) (not (dominates-2_hyp4_count-as-fault_breaker_x3_x4)) (not (dominates-2_hyp3_count-as-fault_breaker_x3_x4)) (not (dominates-2_hyp2_count-as-fault_breaker_x3_x4)) (not (dominates-2_hyp1_count-as-fault_breaker_x3_x4))))
 (:action breaker-ar-status-non-auto-unexplained-1_breaker_x7_x8_obs1403_n0_n1
  :parameters ()
  :precondition (and (pending_obs1403) (fault-count-2_count-as-fault_breaker_x7_x8_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (observed_obs1403) (fault-count-2_count-as-fault_breaker_x7_x8_n1) (not (pending_obs1403)) (not (fault-count-2_count-as-fault_breaker_x7_x8_n0))))
 (:action breaker-ar-status-non-auto-unexplained-1_breaker_x9_x10_obs1404_n0_n1
  :parameters ()
  :precondition (and (pending_obs1404) (fault-count-2_count-as-fault_breaker_x9_x10_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (observed_obs1404) (fault-count-2_count-as-fault_breaker_x9_x10_n1) (not (pending_obs1404)) (not (fault-count-2_count-as-fault_breaker_x9_x10_n0))))
 (:action breaker-ar-status-non-auto-unexplained-1_breaker_x11_x12_obs1400_n0_n1
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_breaker_x11_x12_n0) (pending_obs1400) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-ar-status-is-non-auto_breaker_x11_x12) (fault-count-2_count-as-fault_breaker_x11_x12_n1) (observed_obs1400) (not (breaker-ar-status-is-auto_breaker_x11_x12)) (not (fault-count-2_count-as-fault_breaker_x11_x12_n0)) (not (dominates-2_hyp4_count-as-fault_breaker_x11_x12)) (not (dominates-2_hyp3_count-as-fault_breaker_x11_x12)) (not (dominates-2_hyp2_count-as-fault_breaker_x11_x12)) (not (dominates-2_hyp1_count-as-fault_breaker_x11_x12)) (not (pending_obs1400))))
 (:action bus-voltage-goes-normal-unexplained_bus_x21_obs1413_n0_n1
  :parameters ()
  :precondition (and (pending_obs1413) (fault-count-2_count-as-fault_bus_x21_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (observed_obs1413) (fault-count-2_count-as-fault_bus_x21_n1) (not (pending_obs1413)) (not (fault-count-2_count-as-fault_bus_x21_n0)) (not (dominates-2_hyp4_count-as-fault_bus_x21)) (not (dominates-2_hyp3_count-as-fault_bus_x21)) (not (dominates-2_hyp2_count-as-fault_bus_x21)) (not (dominates-2_hyp1_count-as-fault_bus_x21))))
 (:action line-iso-trip-first-breaker-simple-trip-1_line_x13_x14_breaker_x11_x12_breaker_x11_x12_obs1410_n1_n2
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x11_x12) (breaker-ar-status-is-auto_breaker_x11_x12) (pending_obs1410) (not_line-isolated_line_x13_x14) (fault-count-2_count-as-fault_line_x13_x14_n1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-state-is-open_breaker_x11_x12) (observed_obs1410) (line-iso-trip-in-progress_line_x13_x14_obs1410) (not (breaker-state-is-closed_breaker_x11_x12)) (not (pending_obs1410)) (not (not_line-iso-trip-in-progress_line_x13_x14_obs1410)) (not (fault-count-2_count-as-fault_line_x13_x14_n1)) (not (dominates-2_hyp4_count-as-fault_line_x13_x14)) (not (dominates-2_hyp1_count-as-fault_line_x13_x14))))
 (:action line-iso-trip-first-breaker-simple-trip-1_line_x13_x14_breaker_x19_x20_breaker_x19_x20_obs1412_n1_n2
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x19_x20) (breaker-ar-status-is-auto_breaker_x19_x20) (pending_obs1412) (not_line-isolated_line_x13_x14) (fault-count-2_count-as-fault_line_x13_x14_n1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-state-is-open_breaker_x19_x20) (observed_obs1412) (breaker-auto-reclose-wait_breaker_x19_x20_obs1412) (line-iso-trip-in-progress_line_x13_x14_obs1412) (not (breaker-state-is-closed_breaker_x19_x20)) (not (pending_obs1412)) (not (fault-count-2_count-as-fault_line_x13_x14_n1)) (not (dominates-2_hyp4_count-as-fault_line_x13_x14)) (not (dominates-2_hyp1_count-as-fault_line_x13_x14)) (not (not_line-iso-trip-in-progress_line_x13_x14_obs1412))))
 (:action line-iso-trip-first-breaker-simple-trip-1_line_x15_x16_breaker_x17_x18_breaker_x17_x18_obs1407_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x17_x18) (breaker-ar-status-is-auto_breaker_x17_x18) (pending_obs1407) (fault-count-2_count-as-fault_line_x15_x16_n0) (not_line-isolated_line_x15_x16) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-state-is-open_breaker_x17_x18) (observed_obs1407) (line-iso-trip-in-progress_line_x15_x16_obs1407) (fault-count-2_count-as-fault_line_x15_x16_n1) (not (breaker-state-is-closed_breaker_x17_x18)) (not (pending_obs1407)) (not (fault-count-2_count-as-fault_line_x15_x16_n0)) (not (not_line-iso-trip-in-progress_line_x15_x16_obs1407)) (not (dominates-2_hyp4_count-as-fault_line_x15_x16)) (not (dominates-2_hyp3_count-as-fault_line_x15_x16))))
 (:action line-iso-trip-first-breaker-simple-trip-2_line_x13_x14_breaker_x11_x12_breaker_x11_x12_obs1410_n1_n2
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x11_x12) (breaker-ar-status-is-non-auto_breaker_x11_x12) (pending_obs1410) (not_line-isolated_line_x13_x14) (fault-count-2_count-as-fault_line_x13_x14_n1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-state-is-open_breaker_x11_x12) (observed_obs1410) (line-iso-trip-in-progress_line_x13_x14_obs1410) (not (breaker-state-is-closed_breaker_x11_x12)) (not (pending_obs1410)) (not (not_line-iso-trip-in-progress_line_x13_x14_obs1410)) (not (fault-count-2_count-as-fault_line_x13_x14_n1)) (not (dominates-2_hyp4_count-as-fault_line_x13_x14)) (not (dominates-2_hyp1_count-as-fault_line_x13_x14))))
 (:action line-iso-trip-first-breaker-simple-trip-2_line_x13_x14_breaker_x19_x20_breaker_x19_x20_obs1412_n1_n2
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x19_x20) (breaker-ar-status-is-non-auto_breaker_x19_x20) (pending_obs1412) (not_line-isolated_line_x13_x14) (fault-count-2_count-as-fault_line_x13_x14_n1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-state-is-open_breaker_x19_x20) (observed_obs1412) (line-iso-trip-in-progress_line_x13_x14_obs1412) (not (breaker-state-is-closed_breaker_x19_x20)) (not (pending_obs1412)) (not (fault-count-2_count-as-fault_line_x13_x14_n1)) (not (dominates-2_hyp4_count-as-fault_line_x13_x14)) (not (dominates-2_hyp1_count-as-fault_line_x13_x14)) (not (not_line-iso-trip-in-progress_line_x13_x14_obs1412))))
 (:action line-iso-trip-first-breaker-simple-trip-2_line_x15_x16_breaker_x17_x18_breaker_x17_x18_obs1407_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x17_x18) (breaker-ar-status-is-non-auto_breaker_x17_x18) (pending_obs1407) (fault-count-2_count-as-fault_line_x15_x16_n0) (not_line-isolated_line_x15_x16) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (breaker-state-is-open_breaker_x17_x18) (observed_obs1407) (line-iso-trip-in-progress_line_x15_x16_obs1407) (fault-count-2_count-as-fault_line_x15_x16_n1) (not (breaker-state-is-closed_breaker_x17_x18)) (not (pending_obs1407)) (not (fault-count-2_count-as-fault_line_x15_x16_n0)) (not (not_line-iso-trip-in-progress_line_x15_x16_obs1407)) (not (dominates-2_hyp4_count-as-fault_line_x15_x16)) (not (dominates-2_hyp3_count-as-fault_line_x15_x16))))
 (:action line-finish-iso-trip-3_line_x13_x14_breaker_x22_x23_breaker_x11_x12_breaker_x19_x20_obs1410
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x11_x12) (breaker-state-is-open_breaker_x19_x20) (breaker-state-is-open_breaker_x22_x23) (line-iso-trip-in-progress_line_x13_x14_obs1410) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (not_line-iso-trip-in-progress_line_x13_x14_obs1410) (line-isolated_line_x13_x14) (line-iso-state-changed_line_x13_x14_obs1410) (not (not_line-isolated_line_x13_x14)) (not (line-iso-trip-in-progress_line_x13_x14_obs1410))))
 (:action line-finish-iso-trip-3_line_x13_x14_breaker_x22_x23_breaker_x11_x12_breaker_x19_x20_obs1412
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x11_x12) (breaker-state-is-open_breaker_x19_x20) (breaker-state-is-open_breaker_x22_x23) (line-iso-trip-in-progress_line_x13_x14_obs1412) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (not_line-iso-trip-in-progress_line_x13_x14_obs1412) (line-isolated_line_x13_x14) (line-iso-state-changed_line_x13_x14_obs1412) (not (not_line-isolated_line_x13_x14)) (not (line-iso-trip-in-progress_line_x13_x14_obs1412))))
 (:action line-finish-iso-trip-4_line_x15_x16_breaker_x17_x18_breaker_x26_x27_breaker_x28_x29_breaker_x5_x6_obs1407
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x5_x6) (breaker-state-is-open_breaker_x17_x18) (breaker-state-is-open_breaker_x26_x27) (breaker-state-is-open_breaker_x28_x29) (line-iso-trip-in-progress_line_x15_x16_obs1407) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (not_line-iso-trip-in-progress_line_x15_x16_obs1407) (line-isolated_line_x15_x16) (line-iso-state-changed_line_x15_x16_obs1407) (not (not_line-isolated_line_x15_x16)) (not (line-iso-trip-in-progress_line_x15_x16_obs1407))))
 (:action line-set-state-isolated-3_line_x13_x14_breaker_x22_x23_breaker_x11_x12_breaker_x19_x20_obs1410
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x11_x12) (breaker-state-is-open_breaker_x19_x20) (breaker-state-is-open_breaker_x22_x23) (line-iso-state-may-have-changed_line_x13_x14_obs1410) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (line-isolated_line_x13_x14) (line-iso-state-changed_line_x13_x14_obs1410) (not (not_line-isolated_line_x13_x14))))
 (:action line-set-state-isolated-3_line_x13_x14_breaker_x22_x23_breaker_x11_x12_breaker_x19_x20_obs1412
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x11_x12) (breaker-state-is-open_breaker_x19_x20) (breaker-state-is-open_breaker_x22_x23) (line-iso-state-may-have-changed_line_x13_x14_obs1412) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (line-isolated_line_x13_x14) (line-iso-state-changed_line_x13_x14_obs1412) (not (not_line-isolated_line_x13_x14))))
 (:action line-set-state-isolated-4_line_x15_x16_breaker_x17_x18_breaker_x26_x27_breaker_x28_x29_breaker_x5_x6_obs1407
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x5_x6) (breaker-state-is-open_breaker_x17_x18) (breaker-state-is-open_breaker_x26_x27) (breaker-state-is-open_breaker_x28_x29) (line-iso-state-may-have-changed_line_x15_x16_obs1407) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (line-isolated_line_x15_x16) (line-iso-state-changed_line_x15_x16_obs1407) (not (not_line-isolated_line_x15_x16))))
 (:action line-re-energise-isolated-3c_line_x13_x14_breaker_x22_x23_breaker_x11_x12_breaker_x19_x20_obs1410
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x19_x20) (line-iso-state-may-have-changed_line_x13_x14_obs1410) (line-isolated_line_x13_x14) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (not_line-isolated_line_x13_x14) (line-iso-state-changed_line_x13_x14_obs1410) (not (line-isolated_line_x13_x14))))
 (:action line-re-energise-isolated-3c_line_x13_x14_breaker_x22_x23_breaker_x11_x12_breaker_x19_x20_obs1412
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x19_x20) (line-iso-state-may-have-changed_line_x13_x14_obs1412) (line-isolated_line_x13_x14) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (not_line-isolated_line_x13_x14) (line-iso-state-changed_line_x13_x14_obs1412) (not (line-isolated_line_x13_x14))))
 (:action line-re-energise-isolated-3c_line_x13_x14_breaker_x22_x23_breaker_x11_x12_breaker_x19_x20_obs1416
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x19_x20) (line-iso-state-may-have-changed_line_x13_x14_obs1416) (line-isolated_line_x13_x14) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (not_line-isolated_line_x13_x14) (line-iso-state-changed_line_x13_x14_obs1416) (not (line-isolated_line_x13_x14))))
 (:action line-re-energise-isolated-4d_line_x15_x16_breaker_x17_x18_breaker_x26_x27_breaker_x28_x29_breaker_x5_x6_obs1407
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x5_x6) (line-iso-state-may-have-changed_line_x15_x16_obs1407) (line-isolated_line_x15_x16) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (not_line-isolated_line_x15_x16) (line-iso-state-changed_line_x15_x16_obs1407) (not (line-isolated_line_x15_x16))))
 (:action line-re-energise-isolated-4d_line_x15_x16_breaker_x17_x18_breaker_x26_x27_breaker_x28_x29_breaker_x5_x6_obs1415
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x5_x6) (line-iso-state-may-have-changed_line_x15_x16_obs1415) (line-isolated_line_x15_x16) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (not_line-isolated_line_x15_x16) (line-iso-state-changed_line_x15_x16_obs1415) (not (line-isolated_line_x15_x16))))
 (:action line-init-state-isolated-3_line_x13_x14_breaker_x22_x23_breaker_x11_x12_breaker_x19_x20
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x11_x12) (breaker-state-is-open_breaker_x19_x20) (breaker-state-is-open_breaker_x22_x23) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (line-isolated_line_x13_x14) (not (not_line-isolated_line_x13_x14))))
 (:action line-init-state-isolated-4_line_x15_x16_breaker_x17_x18_breaker_x26_x27_breaker_x28_x29_breaker_x5_x6
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x5_x6) (breaker-state-is-open_breaker_x17_x18) (breaker-state-is-open_breaker_x26_x27) (breaker-state-is-open_breaker_x28_x29) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (line-isolated_line_x15_x16) (not (not_line-isolated_line_x15_x16))))
 (:action line-voltage-goes-to-zero-unexplained-1_line_x13_x14_obs1399_n0_n1
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_line_x13_x14_n0) (pending_obs1399) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (fault-count-2_count-as-fault_line_x13_x14_n1) (observed_obs1399) (not (fault-count-2_count-as-fault_line_x13_x14_n0)) (not (dominates-2_hyp3_count-as-fault_line_x13_x14)) (not (dominates-2_hyp2_count-as-fault_line_x13_x14)) (not (pending_obs1399))))
 (:action line-voltage-goes-to-zero-unexplained-1_line_x15_x16_obs1409_n0_n1
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_line_x15_x16_n0) (pending_obs1409) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (fault-count-2_count-as-fault_line_x15_x16_n1) (observed_obs1409) (not (fault-count-2_count-as-fault_line_x15_x16_n0)) (not (dominates-2_hyp4_count-as-fault_line_x15_x16)) (not (dominates-2_hyp3_count-as-fault_line_x15_x16)) (not (pending_obs1409))))
 (:action line-voltage-goes-to-zero-unexplained-1_line_x15_x16_obs1409_n1_n2
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_line_x15_x16_n1) (pending_obs1409) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (observed_obs1409) (not (fault-count-2_count-as-fault_line_x15_x16_n1)) (not (pending_obs1409))))
 (:action line-voltage-goes-to-zero-when-isolated-1_line_x15_x16_obs1409_obs1407
  :parameters ()
  :precondition (and (line-isolated_line_x15_x16) (line-iso-state-changed_line_x15_x16_obs1407) (pending_obs1409) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (observed_obs1409) (not (pending_obs1409))))
 (:action advance-to-obs_obs1400
  :parameters ()
  :precondition (and (observed_obs1398) (observed_obs1399) (future_obs1400) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (pending_obs1400) (not (future_obs1400))))
 (:action advance-to-obs_obs1401
  :parameters ()
  :precondition (and (observed_obs1400) (future_obs1401) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (pending_obs1401) (not (future_obs1401))))
 (:action advance-to-obs_obs1402
  :parameters ()
  :precondition (and (observed_obs1400) (future_obs1402) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (pending_obs1402) (not (future_obs1402))))
 (:action advance-to-obs_obs1403
  :parameters ()
  :precondition (and (observed_obs1401) (observed_obs1402) (future_obs1403) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (pending_obs1403) (not (future_obs1403))))
 (:action advance-to-obs_obs1404
  :parameters ()
  :precondition (and (observed_obs1403) (future_obs1404) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (pending_obs1404) (not (future_obs1404))))
 (:action advance-to-obs_obs1405
  :parameters ()
  :precondition (and (observed_obs1404) (future_obs1405) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (pending_obs1405) (not (future_obs1405))))
 (:action advance-to-obs_obs1406
  :parameters ()
  :precondition (and (observed_obs1405) (future_obs1406) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (pending_obs1406) (not (future_obs1406))))
 (:action advance-to-obs_obs1407
  :parameters ()
  :precondition (and (observed_obs1406) (future_obs1407) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (pending_obs1407) (not (future_obs1407))))
 (:action advance-to-obs_obs1408
  :parameters ()
  :precondition (and (observed_obs1407) (future_obs1408) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (pending_obs1408) (not (future_obs1408))))
 (:action advance-to-obs_obs1409
  :parameters ()
  :precondition (and (observed_obs1408) (not_line-iso-trip-in-progress_line_x15_x16_obs1407) (future_obs1409) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (pending_obs1409) (not (future_obs1409))))
 (:action advance-to-obs_obs1410
  :parameters ()
  :precondition (and (observed_obs1409) (future_obs1410) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (pending_obs1410) (not (future_obs1410))))
 (:action advance-to-obs_obs1411
  :parameters ()
  :precondition (and (observed_obs1410) (not_line-iso-trip-in-progress_line_x13_x14_obs1410) (future_obs1411) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (pending_obs1411) (not (future_obs1411))))
 (:action advance-to-obs_obs1412
  :parameters ()
  :precondition (and (observed_obs1410) (not_line-iso-trip-in-progress_line_x13_x14_obs1410) (future_obs1412) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (pending_obs1412) (not (future_obs1412))))
 (:action advance-to-obs_obs1413
  :parameters ()
  :precondition (and (observed_obs1410) (not_line-iso-trip-in-progress_line_x13_x14_obs1410) (future_obs1413) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (pending_obs1413) (not (future_obs1413))))
 (:action advance-to-obs_obs1414
  :parameters ()
  :precondition (and (observed_obs1412) (observed_obs1411) (observed_obs1413) (not_line-iso-trip-in-progress_line_x13_x14_obs1412) (future_obs1414) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (pending_obs1414) (not (future_obs1414))))
 (:action advance-to-obs_obs1415
  :parameters ()
  :precondition (and (observed_obs1414) (future_obs1415) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (pending_obs1415) (not (line-iso-state-may-have-changed_line_x15_x16_obs1407)) (not (line-iso-state-changed_line_x15_x16_obs1407)) (not (future_obs1415))))
 (:action advance-to-obs_obs1416
  :parameters ()
  :precondition (and (observed_obs1415) (future_obs1416) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (pending_obs1416) (not (line-iso-state-may-have-changed_line_x13_x14_obs1410)) (not (line-iso-state-changed_line_x13_x14_obs1410)) (not (future_obs1416))))
 (:action advance-to-obs_obs1417
  :parameters ()
  :precondition (and (observed_obs1416) (future_obs1417) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (pending_obs1417) (not (line-iso-state-may-have-changed_line_x13_x14_obs1412)) (not (breaker-auto-reopen-wait_breaker_x19_x20_obs1416)) (not (line-iso-state-changed_line_x13_x14_obs1412)) (not (future_obs1417))))
 (:action set_goal_4_constraint0
  :parameters ()
  :precondition (and (observed_obs1410) (observed_obs1407) (observed_obs1412) (observed_obs1415) (observed_obs1416) (observed_obs1405) (observed_obs1414) (observed_obs1406) (observed_obs1398) (observed_obs1417) (observed_obs1401) (observed_obs1402) (observed_obs1411) (observed_obs1408) (observed_obs1403) (observed_obs1404) (observed_obs1400) (observed_obs1413) (dominates-2_hyp4_count-as-fault_line_x13_x14) (observed_obs1399) (observed_obs1409) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (achieved_constraint0) (not (not_at_end_constraint0))))
 (:action set_goal_5_constraint0
  :parameters ()
  :precondition (and (observed_obs1410) (observed_obs1407) (observed_obs1412) (observed_obs1415) (observed_obs1416) (observed_obs1405) (observed_obs1414) (observed_obs1406) (observed_obs1398) (observed_obs1417) (observed_obs1401) (observed_obs1402) (observed_obs1411) (observed_obs1408) (observed_obs1403) (observed_obs1404) (observed_obs1400) (observed_obs1413) (dominates-2_hyp4_count-as-fault_line_x15_x16) (observed_obs1399) (observed_obs1409) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (achieved_constraint0) (not (not_at_end_constraint0))))
 (:action set_goal_1_constraint1
  :parameters ()
  :precondition (and (observed_obs1410) (observed_obs1407) (observed_obs1412) (dominates-2_hyp3_count-as-fault_breaker_x19_x20) (observed_obs1415) (observed_obs1416) (observed_obs1405) (observed_obs1414) (observed_obs1406) (observed_obs1398) (observed_obs1417) (observed_obs1401) (observed_obs1402) (observed_obs1411) (observed_obs1408) (observed_obs1403) (observed_obs1404) (observed_obs1400) (observed_obs1413) (observed_obs1399) (observed_obs1409) (achieved_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (achieved_constraint1) (not (not_at_end_constraint1))))
 (:action set_goal_6_constraint1
  :parameters ()
  :precondition (and (observed_obs1410) (observed_obs1407) (observed_obs1412) (observed_obs1415) (observed_obs1416) (observed_obs1405) (observed_obs1414) (observed_obs1406) (observed_obs1398) (observed_obs1417) (observed_obs1401) (observed_obs1402) (observed_obs1411) (observed_obs1408) (observed_obs1403) (observed_obs1404) (observed_obs1400) (observed_obs1413) (dominates-2_hyp3_count-as-fault_line_x15_x16) (observed_obs1399) (observed_obs1409) (achieved_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (achieved_constraint1) (not (not_at_end_constraint1))))
 (:action set_goal_1_constraint2
  :parameters ()
  :precondition (and (observed_obs1410) (observed_obs1407) (dominates-2_hyp2_count-as-fault_breaker_x17_x18) (observed_obs1412) (observed_obs1415) (observed_obs1416) (observed_obs1405) (observed_obs1414) (observed_obs1406) (observed_obs1398) (observed_obs1417) (observed_obs1401) (observed_obs1402) (observed_obs1411) (observed_obs1408) (observed_obs1403) (observed_obs1404) (observed_obs1400) (observed_obs1413) (observed_obs1399) (observed_obs1409) (achieved_constraint0) (achieved_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (achieved_constraint2) (not (not_at_end_constraint2))))
 (:action set_goal_2_constraint2
  :parameters ()
  :precondition (and (observed_obs1410) (observed_obs1407) (observed_obs1412) (dominates-2_hyp2_count-as-fault_breaker_x19_x20) (observed_obs1415) (observed_obs1416) (observed_obs1405) (observed_obs1414) (observed_obs1406) (observed_obs1398) (observed_obs1417) (observed_obs1401) (observed_obs1402) (observed_obs1411) (observed_obs1408) (observed_obs1403) (observed_obs1404) (observed_obs1400) (observed_obs1413) (observed_obs1399) (observed_obs1409) (achieved_constraint0) (achieved_constraint1) (not_at_end_constraint2) (not_at_end_constraint3))
  :effect (and (achieved_constraint2) (not (not_at_end_constraint2))))
 (:action set_goal_1_constraint3
  :parameters ()
  :precondition (and (observed_obs1410) (observed_obs1407) (dominates-2_hyp1_count-as-fault_breaker_x17_x18) (observed_obs1412) (observed_obs1415) (observed_obs1416) (observed_obs1405) (observed_obs1414) (observed_obs1406) (observed_obs1398) (observed_obs1417) (observed_obs1401) (observed_obs1402) (observed_obs1411) (observed_obs1408) (observed_obs1403) (observed_obs1404) (observed_obs1400) (observed_obs1413) (observed_obs1399) (observed_obs1409) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (not_at_end_constraint3))
  :effect (and (achieved_constraint3) (not (not_at_end_constraint3))))
 (:action set_goal_5_constraint3
  :parameters ()
  :precondition (and (observed_obs1410) (observed_obs1407) (observed_obs1412) (observed_obs1415) (observed_obs1416) (observed_obs1405) (observed_obs1414) (observed_obs1406) (observed_obs1398) (observed_obs1417) (observed_obs1401) (observed_obs1402) (observed_obs1411) (observed_obs1408) (observed_obs1403) (observed_obs1404) (observed_obs1400) (observed_obs1413) (dominates-2_hyp1_count-as-fault_line_x13_x14) (observed_obs1399) (observed_obs1409) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (not_at_end_constraint3))
  :effect (and (achieved_constraint3) (not (not_at_end_constraint3))))
)
