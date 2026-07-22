(define (domain appn-pls)
 (:requirements :strips :equality)
 (:predicates (breaker-state-is-unknown_breaker_x5_x6) (breaker-state-is-open_breaker_x5_x6) (breaker-state-is-unknown_breaker_x9_x10) (breaker-state-is-open_breaker_x9_x10) (breaker-state-is-unknown_breaker_x11_x12) (breaker-state-is-open_breaker_x11_x12) (breaker-state-is-unknown_breaker_x13_x14) (breaker-state-is-unknown_breaker_x15_x16) (breaker-state-is-open_breaker_x15_x16) (breaker-state-is-unknown_breaker_x17_x18) (breaker-state-is-open_breaker_x17_x18) (breaker-state-is-unknown_breaker_x19_x20) (breaker-state-is-open_breaker_x19_x20) (breaker-state-is-unknown_breaker_x23_x24) (breaker-state-is-open_breaker_x23_x24) (breaker-state-is-closed_breaker_x5_x6) (breaker-state-is-closed_breaker_x9_x10) (breaker-state-is-closed_breaker_x11_x12) (breaker-state-is-closed_breaker_x13_x14) (breaker-state-is-closed_breaker_x15_x16) (breaker-state-is-closed_breaker_x17_x18) (breaker-state-is-closed_breaker_x19_x20) (breaker-state-is-closed_breaker_x23_x24) (breaker-ar-status-is-unknown_breaker_x5_x6) (breaker-ar-status-is-auto_breaker_x5_x6) (breaker-ar-status-is-unknown_breaker_x13_x14) (breaker-ar-status-is-auto_breaker_x13_x14) (breaker-ar-status-is-unknown_breaker_x15_x16) (breaker-ar-status-is-auto_breaker_x15_x16) (breaker-ar-status-is-unknown_breaker_x17_x18) (breaker-ar-status-is-auto_breaker_x17_x18) (breaker-ar-status-is-unknown_breaker_x19_x20) (breaker-ar-status-is-auto_breaker_x19_x20) (breaker-ar-status-is-non-auto_breaker_x5_x6) (breaker-ar-status-is-non-auto_breaker_x15_x16) (breaker-ar-status-is-non-auto_breaker_x17_x18) (pending_obs564) (fault-count-2_count-as-fault_breaker_x5_x6_n0) (observed_obs564) (line-iso-state-may-have-changed_line_x3_x4_obs564) (dominates-2_hyp2_count-as-fault_breaker_x5_x6) (dominates-2_hyp1_count-as-fault_breaker_x5_x6) (pending_obs561) (fault-count-2_count-as-fault_breaker_x13_x14_n0) (observed_obs561) (dominates-2_hyp2_count-as-fault_breaker_x13_x14) (dominates-2_hyp1_count-as-fault_breaker_x13_x14) (pending_obs555) (fault-count-2_count-as-fault_breaker_x15_x16_n0) (observed_obs555) (line-iso-state-may-have-changed_line_x1_x2_obs555) (dominates-2_hyp1_count-as-fault_breaker_x15_x16) (pending_obs563) (fault-count-2_count-as-fault_breaker_x17_x18_n0) (observed_obs563) (line-iso-state-may-have-changed_line_x3_x4_obs563) (dominates-2_hyp2_count-as-fault_breaker_x17_x18) (dominates-2_hyp1_count-as-fault_breaker_x17_x18) (pending_obs554) (fault-count-2_count-as-fault_breaker_x19_x20_n0) (observed_obs554) (dominates-2_hyp2_count-as-fault_breaker_x19_x20) (dominates-2_hyp1_count-as-fault_breaker_x19_x20) (breaker-auto-reclose-wait_breaker_x19_x20_obs554) (pending_obs558) (fault-count-2_count-as-fault_breaker_x9_x10_n0) (observed_obs558) (line-iso-state-may-have-changed_line_x1_x2_obs558) (dominates-2_hyp2_count-as-fault_breaker_x9_x10) (dominates-2_hyp1_count-as-fault_breaker_x9_x10) (pending_obs557) (observed_obs557) (breaker-auto-reopen-wait_breaker_x19_x20_obs557) (pending_obs562) (breaker-commanded-open_breaker_x5_x6_obs562) (observed_obs562) (pending_obs560) (breaker-commanded-open_breaker_x17_x18_obs560) (observed_obs560) (pending_obs550) (breaker-commanded-open_breaker_x19_x20_obs550) (observed_obs550) (pending_obs548) (breaker-commanded-ar-non-auto_breaker_x19_x20_obs548) (observed_obs548) (pending_obs552) (observed_obs552) (pending_obs559) (observed_obs559) (pending_obs551) (observed_obs551) (pending_obs549) (observed_obs549) (fault-count-2_count-as-fault_breaker_x11_x12_n0) (dominates-2_hyp2_count-as-fault_breaker_x11_x12) (dominates-2_hyp1_count-as-fault_breaker_x11_x12) (pending_obs566) (fault-count-2_count-as-fault_bus_x22_n0) (observed_obs566) (dominates-2_hyp2_count-as-fault_bus_x22) (dominates-2_hyp1_count-as-fault_bus_x22) (pending_obs565) (fault-count-2_count-as-fault_bus_x21_n0) (observed_obs565) (dominates-2_hyp2_count-as-fault_bus_x21) (dominates-2_hyp1_count-as-fault_bus_x21) (fault-count-2_count-as-fault_line_x1_x2_n0) (not_line-isolated_line_x1_x2) (line-iso-trip-in-progress_line_x1_x2_obs555) (not_line-iso-trip-in-progress_line_x1_x2_obs555) (dominates-2_hyp2_count-as-fault_line_x1_x2) (fault-count-2_count-as-fault_line_x3_x4_n0) (not_line-isolated_line_x3_x4) (dominates-2_hyp2_count-as-fault_line_x3_x4) (dominates-2_hyp1_count-as-fault_line_x3_x4) (line-isolated_line_x1_x2) (line-iso-state-changed_line_x1_x2_obs555) (line-iso-state-changed_line_x1_x2_obs558) (line-isolated_line_x3_x4) (line-iso-state-changed_line_x3_x4_obs563) (line-iso-state-changed_line_x3_x4_obs564) (pending_obs556) (observed_obs556) (pending_obs553) (observed_obs553) (pending_obs567) (fault-count-2_count-as-fault_line_x7_x8_n0) (observed_obs567) (dominates-2_hyp2_count-as-fault_line_x7_x8) (dominates-2_hyp1_count-as-fault_line_x7_x8) (future_obs549) (future_obs550) (future_obs551) (future_obs552) (future_obs553) (future_obs554) (future_obs555) (future_obs556) (future_obs557) (future_obs558) (future_obs559) (future_obs560) (future_obs561) (future_obs562) (future_obs563) (future_obs564) (future_obs565) (future_obs566) (future_obs567) (not_at_end_constraint0) (achieved_constraint0) (not_at_end_constraint1) (achieved_constraint1) (static-true))
 (:action breaker-init-state-was-open_breaker_x5_x6
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x5_x6) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-state-is-open_breaker_x5_x6) (not (breaker-state-is-unknown_breaker_x5_x6))))
 (:action breaker-init-state-was-open_breaker_x9_x10
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x9_x10) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-state-is-open_breaker_x9_x10) (not (breaker-state-is-unknown_breaker_x9_x10))))
 (:action breaker-init-state-was-open_breaker_x11_x12
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x11_x12) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-state-is-open_breaker_x11_x12) (not (breaker-state-is-unknown_breaker_x11_x12))))
 (:action breaker-init-state-was-open_breaker_x15_x16
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x15_x16) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-state-is-open_breaker_x15_x16) (not (breaker-state-is-unknown_breaker_x15_x16))))
 (:action breaker-init-state-was-open_breaker_x17_x18
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x17_x18) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-state-is-open_breaker_x17_x18) (not (breaker-state-is-unknown_breaker_x17_x18))))
 (:action breaker-init-state-was-open_breaker_x19_x20
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x19_x20) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-state-is-open_breaker_x19_x20) (not (breaker-state-is-unknown_breaker_x19_x20))))
 (:action breaker-init-state-was-open_breaker_x23_x24
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x23_x24) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-state-is-open_breaker_x23_x24) (not (breaker-state-is-unknown_breaker_x23_x24))))
 (:action breaker-init-state-was-closed_breaker_x5_x6
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x5_x6) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-state-is-closed_breaker_x5_x6) (not (breaker-state-is-unknown_breaker_x5_x6))))
 (:action breaker-init-state-was-closed_breaker_x9_x10
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x9_x10) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-state-is-closed_breaker_x9_x10) (not (breaker-state-is-unknown_breaker_x9_x10))))
 (:action breaker-init-state-was-closed_breaker_x11_x12
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x11_x12) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-state-is-closed_breaker_x11_x12) (not (breaker-state-is-unknown_breaker_x11_x12))))
 (:action breaker-init-state-was-closed_breaker_x13_x14
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x13_x14) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-state-is-closed_breaker_x13_x14) (not (breaker-state-is-unknown_breaker_x13_x14))))
 (:action breaker-init-state-was-closed_breaker_x15_x16
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x15_x16) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-state-is-closed_breaker_x15_x16) (not (breaker-state-is-unknown_breaker_x15_x16))))
 (:action breaker-init-state-was-closed_breaker_x17_x18
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x17_x18) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-state-is-closed_breaker_x17_x18) (not (breaker-state-is-unknown_breaker_x17_x18))))
 (:action breaker-init-state-was-closed_breaker_x19_x20
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x19_x20) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-state-is-closed_breaker_x19_x20) (not (breaker-state-is-unknown_breaker_x19_x20))))
 (:action breaker-init-state-was-closed_breaker_x23_x24
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x23_x24) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-state-is-closed_breaker_x23_x24) (not (breaker-state-is-unknown_breaker_x23_x24))))
 (:action breaker-init-ar-status-was-auto_breaker_x5_x6
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x5_x6) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-ar-status-is-auto_breaker_x5_x6) (not (breaker-ar-status-is-unknown_breaker_x5_x6))))
 (:action breaker-init-ar-status-was-auto_breaker_x13_x14
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x13_x14) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-ar-status-is-auto_breaker_x13_x14) (not (breaker-ar-status-is-unknown_breaker_x13_x14))))
 (:action breaker-init-ar-status-was-auto_breaker_x15_x16
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x15_x16) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-ar-status-is-auto_breaker_x15_x16) (not (breaker-ar-status-is-unknown_breaker_x15_x16))))
 (:action breaker-init-ar-status-was-auto_breaker_x17_x18
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x17_x18) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-ar-status-is-auto_breaker_x17_x18) (not (breaker-ar-status-is-unknown_breaker_x17_x18))))
 (:action breaker-init-ar-status-was-auto_breaker_x19_x20
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x19_x20) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-ar-status-is-auto_breaker_x19_x20) (not (breaker-ar-status-is-unknown_breaker_x19_x20))))
 (:action breaker-init-ar-status-was-non-auto_breaker_x5_x6
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x5_x6) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-ar-status-is-non-auto_breaker_x5_x6) (not (breaker-ar-status-is-unknown_breaker_x5_x6))))
 (:action breaker-init-ar-status-was-non-auto_breaker_x15_x16
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x15_x16) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-ar-status-is-non-auto_breaker_x15_x16) (not (breaker-ar-status-is-unknown_breaker_x15_x16))))
 (:action breaker-init-ar-status-was-non-auto_breaker_x17_x18
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x17_x18) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-ar-status-is-non-auto_breaker_x17_x18) (not (breaker-ar-status-is-unknown_breaker_x17_x18))))
 (:action breaker-open-unexplained_breaker_x13_x14_obs561_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x13_x14) (pending_obs561) (fault-count-2_count-as-fault_breaker_x13_x14_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs561) (not (breaker-state-is-closed_breaker_x13_x14)) (not (pending_obs561)) (not (fault-count-2_count-as-fault_breaker_x13_x14_n0)) (not (dominates-2_hyp2_count-as-fault_breaker_x13_x14)) (not (dominates-2_hyp1_count-as-fault_breaker_x13_x14))))
 (:action breaker-open-unexplained_breaker_x15_x16_obs555_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x15_x16) (pending_obs555) (fault-count-2_count-as-fault_breaker_x15_x16_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-state-is-open_breaker_x15_x16) (observed_obs555) (line-iso-state-may-have-changed_line_x1_x2_obs555) (not (breaker-state-is-closed_breaker_x15_x16)) (not (pending_obs555)) (not (fault-count-2_count-as-fault_breaker_x15_x16_n0)) (not (dominates-2_hyp1_count-as-fault_breaker_x15_x16))))
 (:action breaker-open-unexplained_breaker_x19_x20_obs554_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x19_x20) (pending_obs554) (fault-count-2_count-as-fault_breaker_x19_x20_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-state-is-open_breaker_x19_x20) (observed_obs554) (not (breaker-state-is-closed_breaker_x19_x20)) (not (pending_obs554)) (not (fault-count-2_count-as-fault_breaker_x19_x20_n0)) (not (dominates-2_hyp2_count-as-fault_breaker_x19_x20)) (not (dominates-2_hyp1_count-as-fault_breaker_x19_x20))))
 (:action breaker-trip-unexplained_breaker_x13_x14_obs561_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x13_x14) (breaker-ar-status-is-auto_breaker_x13_x14) (pending_obs561) (fault-count-2_count-as-fault_breaker_x13_x14_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs561) (not (breaker-state-is-closed_breaker_x13_x14)) (not (pending_obs561)) (not (fault-count-2_count-as-fault_breaker_x13_x14_n0)) (not (dominates-2_hyp2_count-as-fault_breaker_x13_x14)) (not (dominates-2_hyp1_count-as-fault_breaker_x13_x14))))
 (:action breaker-trip-unexplained_breaker_x15_x16_obs555_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x15_x16) (breaker-ar-status-is-auto_breaker_x15_x16) (pending_obs555) (fault-count-2_count-as-fault_breaker_x15_x16_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-state-is-open_breaker_x15_x16) (observed_obs555) (line-iso-state-may-have-changed_line_x1_x2_obs555) (not (breaker-state-is-closed_breaker_x15_x16)) (not (pending_obs555)) (not (fault-count-2_count-as-fault_breaker_x15_x16_n0)) (not (dominates-2_hyp1_count-as-fault_breaker_x15_x16))))
 (:action breaker-trip-unexplained_breaker_x19_x20_obs554_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x19_x20) (breaker-ar-status-is-auto_breaker_x19_x20) (pending_obs554) (fault-count-2_count-as-fault_breaker_x19_x20_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-state-is-open_breaker_x19_x20) (observed_obs554) (breaker-auto-reclose-wait_breaker_x19_x20_obs554) (not (breaker-state-is-closed_breaker_x19_x20)) (not (pending_obs554)) (not (fault-count-2_count-as-fault_breaker_x19_x20_n0)) (not (dominates-2_hyp2_count-as-fault_breaker_x19_x20)) (not (dominates-2_hyp1_count-as-fault_breaker_x19_x20))))
 (:action breaker-close-unexplained_breaker_x9_x10_obs558_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x9_x10) (pending_obs558) (fault-count-2_count-as-fault_breaker_x9_x10_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-state-is-closed_breaker_x9_x10) (observed_obs558) (line-iso-state-may-have-changed_line_x1_x2_obs558) (not (breaker-state-is-open_breaker_x9_x10)) (not (pending_obs558)) (not (fault-count-2_count-as-fault_breaker_x9_x10_n0)) (not (dominates-2_hyp2_count-as-fault_breaker_x9_x10)) (not (dominates-2_hyp1_count-as-fault_breaker_x9_x10))))
 (:action breaker-close-unexplained_breaker_x19_x20_obs557_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x19_x20) (fault-count-2_count-as-fault_breaker_x19_x20_n0) (pending_obs557) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-state-is-closed_breaker_x19_x20) (observed_obs557) (not (breaker-state-is-open_breaker_x19_x20)) (not (fault-count-2_count-as-fault_breaker_x19_x20_n0)) (not (dominates-2_hyp2_count-as-fault_breaker_x19_x20)) (not (dominates-2_hyp1_count-as-fault_breaker_x19_x20)) (not (pending_obs557))))
 (:action breaker-reclose_breaker_x19_x20_obs557_obs554
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x19_x20) (breaker-auto-reclose-wait_breaker_x19_x20_obs554) (pending_obs557) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-state-is-closed_breaker_x19_x20) (observed_obs557) (breaker-auto-reopen-wait_breaker_x19_x20_obs557) (not (breaker-state-is-open_breaker_x19_x20)) (not (pending_obs557))))
 (:action breaker-command-open_breaker_x5_x6_obs562
  :parameters ()
  :precondition (and (pending_obs562) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-commanded-open_breaker_x5_x6_obs562) (observed_obs562) (not (pending_obs562))))
 (:action breaker-command-open_breaker_x17_x18_obs560
  :parameters ()
  :precondition (and (pending_obs560) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-commanded-open_breaker_x17_x18_obs560) (observed_obs560) (not (pending_obs560))))
 (:action breaker-command-open_breaker_x19_x20_obs550
  :parameters ()
  :precondition (and (pending_obs550) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-commanded-open_breaker_x19_x20_obs550) (observed_obs550) (not (pending_obs550))))
 (:action breaker-open-on-command_breaker_x5_x6_obs564_obs562
  :parameters ()
  :precondition (and (pending_obs564) (breaker-commanded-open_breaker_x5_x6_obs562) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-state-is-open_breaker_x5_x6) (observed_obs564) (line-iso-state-may-have-changed_line_x3_x4_obs564) (not (breaker-state-is-unknown_breaker_x5_x6)) (not (breaker-state-is-closed_breaker_x5_x6)) (not (pending_obs564))))
 (:action breaker-open-on-command_breaker_x17_x18_obs563_obs560
  :parameters ()
  :precondition (and (pending_obs563) (breaker-commanded-open_breaker_x17_x18_obs560) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-state-is-open_breaker_x17_x18) (observed_obs563) (line-iso-state-may-have-changed_line_x3_x4_obs563) (not (breaker-state-is-unknown_breaker_x17_x18)) (not (breaker-state-is-closed_breaker_x17_x18)) (not (pending_obs563))))
 (:action breaker-open-on-command_breaker_x19_x20_obs554_obs550
  :parameters ()
  :precondition (and (pending_obs554) (breaker-commanded-open_breaker_x19_x20_obs550) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-state-is-open_breaker_x19_x20) (observed_obs554) (not (breaker-state-is-unknown_breaker_x19_x20)) (not (breaker-state-is-closed_breaker_x19_x20)) (not (pending_obs554))))
 (:action breaker-command-ar-non-auto-1_breaker_x19_x20_obs548
  :parameters ()
  :precondition (and (pending_obs548) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-commanded-ar-non-auto_breaker_x19_x20_obs548) (observed_obs548) (not (pending_obs548))))
 (:action breaker-ar-status-non-auto-1_breaker_x19_x20_obs549_obs548
  :parameters ()
  :precondition (and (breaker-commanded-ar-non-auto_breaker_x19_x20_obs548) (pending_obs549) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs549) (not (breaker-ar-status-is-auto_breaker_x19_x20)) (not (pending_obs549))))
 (:action breaker-ar-status-non-auto-unexplained-1_breaker_x5_x6_obs552_n0_n1
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_breaker_x5_x6_n0) (pending_obs552) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-ar-status-is-non-auto_breaker_x5_x6) (observed_obs552) (not (breaker-ar-status-is-auto_breaker_x5_x6)) (not (fault-count-2_count-as-fault_breaker_x5_x6_n0)) (not (dominates-2_hyp2_count-as-fault_breaker_x5_x6)) (not (dominates-2_hyp1_count-as-fault_breaker_x5_x6)) (not (pending_obs552))))
 (:action breaker-ar-status-non-auto-unexplained-1_breaker_x11_x12_obs559_n0_n1
  :parameters ()
  :precondition (and (pending_obs559) (fault-count-2_count-as-fault_breaker_x11_x12_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs559) (not (pending_obs559)) (not (fault-count-2_count-as-fault_breaker_x11_x12_n0)) (not (dominates-2_hyp2_count-as-fault_breaker_x11_x12)) (not (dominates-2_hyp1_count-as-fault_breaker_x11_x12))))
 (:action breaker-ar-status-non-auto-unexplained-1_breaker_x17_x18_obs551_n0_n1
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_breaker_x17_x18_n0) (pending_obs551) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-ar-status-is-non-auto_breaker_x17_x18) (observed_obs551) (not (breaker-ar-status-is-auto_breaker_x17_x18)) (not (fault-count-2_count-as-fault_breaker_x17_x18_n0)) (not (dominates-2_hyp2_count-as-fault_breaker_x17_x18)) (not (dominates-2_hyp1_count-as-fault_breaker_x17_x18)) (not (pending_obs551))))
 (:action breaker-ar-status-non-auto-unexplained-1_breaker_x19_x20_obs549_n0_n1
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_breaker_x19_x20_n0) (pending_obs549) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs549) (not (breaker-ar-status-is-auto_breaker_x19_x20)) (not (fault-count-2_count-as-fault_breaker_x19_x20_n0)) (not (dominates-2_hyp2_count-as-fault_breaker_x19_x20)) (not (dominates-2_hyp1_count-as-fault_breaker_x19_x20)) (not (pending_obs549))))
 (:action bus-voltage-goes-low-unexplained_bus_x22_low_obs566_n0_n1
  :parameters ()
  :precondition (and (pending_obs566) (fault-count-2_count-as-fault_bus_x22_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs566) (not (pending_obs566)) (not (fault-count-2_count-as-fault_bus_x22_n0)) (not (dominates-2_hyp2_count-as-fault_bus_x22)) (not (dominates-2_hyp1_count-as-fault_bus_x22))))
 (:action bus-voltage-goes-normal-unexplained_bus_x21_obs565_n0_n1
  :parameters ()
  :precondition (and (pending_obs565) (fault-count-2_count-as-fault_bus_x21_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs565) (not (pending_obs565)) (not (fault-count-2_count-as-fault_bus_x21_n0)) (not (dominates-2_hyp2_count-as-fault_bus_x21)) (not (dominates-2_hyp1_count-as-fault_bus_x21))))
 (:action line-iso-trip-first-breaker-simple-trip-1_line_x1_x2_breaker_x15_x16_breaker_x15_x16_obs555_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x15_x16) (breaker-ar-status-is-auto_breaker_x15_x16) (pending_obs555) (fault-count-2_count-as-fault_line_x1_x2_n0) (not_line-isolated_line_x1_x2) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-state-is-open_breaker_x15_x16) (observed_obs555) (line-iso-trip-in-progress_line_x1_x2_obs555) (not (breaker-state-is-closed_breaker_x15_x16)) (not (pending_obs555)) (not (fault-count-2_count-as-fault_line_x1_x2_n0)) (not (not_line-iso-trip-in-progress_line_x1_x2_obs555)) (not (dominates-2_hyp2_count-as-fault_line_x1_x2))))
 (:action line-iso-trip-first-breaker-simple-trip-2_line_x1_x2_breaker_x15_x16_breaker_x15_x16_obs555_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x15_x16) (breaker-ar-status-is-non-auto_breaker_x15_x16) (pending_obs555) (fault-count-2_count-as-fault_line_x1_x2_n0) (not_line-isolated_line_x1_x2) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (breaker-state-is-open_breaker_x15_x16) (observed_obs555) (line-iso-trip-in-progress_line_x1_x2_obs555) (not (breaker-state-is-closed_breaker_x15_x16)) (not (pending_obs555)) (not (fault-count-2_count-as-fault_line_x1_x2_n0)) (not (not_line-iso-trip-in-progress_line_x1_x2_obs555)) (not (dominates-2_hyp2_count-as-fault_line_x1_x2))))
 (:action line-finish-iso-trip-3_line_x1_x2_breaker_x23_x24_breaker_x15_x16_breaker_x9_x10_obs555
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x9_x10) (breaker-state-is-open_breaker_x15_x16) (breaker-state-is-open_breaker_x23_x24) (line-iso-trip-in-progress_line_x1_x2_obs555) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (not_line-iso-trip-in-progress_line_x1_x2_obs555) (line-isolated_line_x1_x2) (line-iso-state-changed_line_x1_x2_obs555) (not (not_line-isolated_line_x1_x2)) (not (line-iso-trip-in-progress_line_x1_x2_obs555))))
 (:action line-set-state-isolated-3_line_x1_x2_breaker_x23_x24_breaker_x15_x16_breaker_x9_x10_obs555
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x9_x10) (breaker-state-is-open_breaker_x15_x16) (breaker-state-is-open_breaker_x23_x24) (line-iso-state-may-have-changed_line_x1_x2_obs555) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (line-isolated_line_x1_x2) (line-iso-state-changed_line_x1_x2_obs555) (not (not_line-isolated_line_x1_x2))))
 (:action line-set-state-isolated-3_line_x3_x4_breaker_x5_x6_breaker_x17_x18_breaker_x11_x12_obs563
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x5_x6) (breaker-state-is-open_breaker_x11_x12) (breaker-state-is-open_breaker_x17_x18) (line-iso-state-may-have-changed_line_x3_x4_obs563) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (line-isolated_line_x3_x4) (line-iso-state-changed_line_x3_x4_obs563) (not (not_line-isolated_line_x3_x4))))
 (:action line-set-state-isolated-3_line_x3_x4_breaker_x5_x6_breaker_x17_x18_breaker_x11_x12_obs564
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x5_x6) (breaker-state-is-open_breaker_x11_x12) (breaker-state-is-open_breaker_x17_x18) (line-iso-state-may-have-changed_line_x3_x4_obs564) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (line-isolated_line_x3_x4) (line-iso-state-changed_line_x3_x4_obs564) (not (not_line-isolated_line_x3_x4))))
 (:action line-re-energise-isolated-3c_line_x1_x2_breaker_x23_x24_breaker_x15_x16_breaker_x9_x10_obs555
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x9_x10) (line-iso-state-may-have-changed_line_x1_x2_obs555) (line-isolated_line_x1_x2) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (not_line-isolated_line_x1_x2) (line-iso-state-changed_line_x1_x2_obs555) (not (line-isolated_line_x1_x2))))
 (:action line-re-energise-isolated-3c_line_x1_x2_breaker_x23_x24_breaker_x15_x16_breaker_x9_x10_obs558
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x9_x10) (line-iso-state-may-have-changed_line_x1_x2_obs558) (line-isolated_line_x1_x2) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (not_line-isolated_line_x1_x2) (line-iso-state-changed_line_x1_x2_obs558) (not (line-isolated_line_x1_x2))))
 (:action line-init-state-isolated-3_line_x1_x2_breaker_x23_x24_breaker_x15_x16_breaker_x9_x10
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x9_x10) (breaker-state-is-open_breaker_x15_x16) (breaker-state-is-open_breaker_x23_x24) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (line-isolated_line_x1_x2) (not (not_line-isolated_line_x1_x2))))
 (:action line-init-state-isolated-3_line_x3_x4_breaker_x5_x6_breaker_x17_x18_breaker_x11_x12
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x5_x6) (breaker-state-is-open_breaker_x11_x12) (breaker-state-is-open_breaker_x17_x18) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (line-isolated_line_x3_x4) (not (not_line-isolated_line_x3_x4))))
 (:action line-voltage-goes-to-zero-unexplained-1_line_x1_x2_obs556_n0_n1
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_line_x1_x2_n0) (pending_obs556) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs556) (not (fault-count-2_count-as-fault_line_x1_x2_n0)) (not (dominates-2_hyp2_count-as-fault_line_x1_x2)) (not (pending_obs556))))
 (:action line-voltage-goes-to-zero-unexplained-1_line_x3_x4_obs553_n0_n1
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_line_x3_x4_n0) (pending_obs553) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs553) (not (fault-count-2_count-as-fault_line_x3_x4_n0)) (not (dominates-2_hyp2_count-as-fault_line_x3_x4)) (not (dominates-2_hyp1_count-as-fault_line_x3_x4)) (not (pending_obs553))))
 (:action line-voltage-goes-to-zero-when-isolated-1_line_x1_x2_obs556_obs555
  :parameters ()
  :precondition (and (line-isolated_line_x1_x2) (line-iso-state-changed_line_x1_x2_obs555) (pending_obs556) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs556) (not (pending_obs556))))
 (:action line-mw-goes-normal-unexplained-1_line_x7_x8_obs567_n0_n1
  :parameters ()
  :precondition (and (pending_obs567) (fault-count-2_count-as-fault_line_x7_x8_n0) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (observed_obs567) (not (pending_obs567)) (not (fault-count-2_count-as-fault_line_x7_x8_n0)) (not (dominates-2_hyp2_count-as-fault_line_x7_x8)) (not (dominates-2_hyp1_count-as-fault_line_x7_x8))))
 (:action advance-to-obs_obs549
  :parameters ()
  :precondition (and (observed_obs548) (future_obs549) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs549) (not (future_obs549))))
 (:action advance-to-obs_obs550
  :parameters ()
  :precondition (and (observed_obs549) (future_obs550) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs550) (not (future_obs550))))
 (:action advance-to-obs_obs551
  :parameters ()
  :precondition (and (observed_obs550) (future_obs551) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs551) (not (future_obs551))))
 (:action advance-to-obs_obs552
  :parameters ()
  :precondition (and (observed_obs551) (future_obs552) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs552) (not (future_obs552))))
 (:action advance-to-obs_obs553
  :parameters ()
  :precondition (and (observed_obs552) (future_obs553) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs553) (not (future_obs553))))
 (:action advance-to-obs_obs554
  :parameters ()
  :precondition (and (observed_obs553) (future_obs554) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs554) (not (future_obs554))))
 (:action advance-to-obs_obs555
  :parameters ()
  :precondition (and (observed_obs554) (future_obs555) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs555) (not (future_obs555))))
 (:action advance-to-obs_obs556
  :parameters ()
  :precondition (and (observed_obs555) (not_line-iso-trip-in-progress_line_x1_x2_obs555) (future_obs556) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs556) (not (future_obs556))))
 (:action advance-to-obs_obs557
  :parameters ()
  :precondition (and (observed_obs556) (future_obs557) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs557) (not (future_obs557))))
 (:action advance-to-obs_obs558
  :parameters ()
  :precondition (and (observed_obs557) (future_obs558) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs558) (not (future_obs558))))
 (:action advance-to-obs_obs559
  :parameters ()
  :precondition (and (observed_obs557) (future_obs559) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs559) (not (future_obs559))))
 (:action advance-to-obs_obs560
  :parameters ()
  :precondition (and (observed_obs558) (observed_obs559) (future_obs560) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs560) (not (line-iso-state-may-have-changed_line_x1_x2_obs555)) (not (breaker-auto-reopen-wait_breaker_x19_x20_obs557)) (not (line-iso-state-changed_line_x1_x2_obs555)) (not (future_obs560))))
 (:action advance-to-obs_obs561
  :parameters ()
  :precondition (and (observed_obs560) (future_obs561) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs561) (not (future_obs561))))
 (:action advance-to-obs_obs562
  :parameters ()
  :precondition (and (observed_obs561) (future_obs562) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs562) (not (line-iso-state-may-have-changed_line_x1_x2_obs558)) (not (line-iso-state-changed_line_x1_x2_obs558)) (not (future_obs562))))
 (:action advance-to-obs_obs563
  :parameters ()
  :precondition (and (observed_obs562) (future_obs563) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs563) (not (future_obs563))))
 (:action advance-to-obs_obs564
  :parameters ()
  :precondition (and (observed_obs562) (future_obs564) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs564) (not (future_obs564))))
 (:action advance-to-obs_obs565
  :parameters ()
  :precondition (and (observed_obs564) (observed_obs563) (future_obs565) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs565) (not (future_obs565))))
 (:action advance-to-obs_obs566
  :parameters ()
  :precondition (and (observed_obs565) (future_obs566) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs566) (not (future_obs566))))
 (:action advance-to-obs_obs567
  :parameters ()
  :precondition (and (observed_obs565) (future_obs567) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (pending_obs567) (not (future_obs567))))
 (:action set_goal_8_constraint0
  :parameters ()
  :precondition (and (observed_obs564) (observed_obs561) (observed_obs555) (observed_obs563) (observed_obs554) (observed_obs558) (observed_obs557) (observed_obs562) (observed_obs560) (observed_obs550) (observed_obs548) (observed_obs552) (observed_obs559) (observed_obs551) (observed_obs549) (observed_obs566) (observed_obs565) (dominates-2_hyp2_count-as-fault_line_x1_x2) (observed_obs556) (observed_obs553) (observed_obs567) (not_at_end_constraint0) (not_at_end_constraint1))
  :effect (and (achieved_constraint0) (not (not_at_end_constraint0))))
 (:action set_goal_2_constraint1
  :parameters ()
  :precondition (and (observed_obs564) (observed_obs561) (observed_obs555) (dominates-2_hyp1_count-as-fault_breaker_x15_x16) (observed_obs563) (observed_obs554) (observed_obs558) (observed_obs557) (observed_obs562) (observed_obs560) (observed_obs550) (observed_obs548) (observed_obs552) (observed_obs559) (observed_obs551) (observed_obs549) (observed_obs566) (observed_obs565) (observed_obs556) (observed_obs553) (observed_obs567) (achieved_constraint0) (not_at_end_constraint1))
  :effect (and (achieved_constraint1) (not (not_at_end_constraint1))))
)
