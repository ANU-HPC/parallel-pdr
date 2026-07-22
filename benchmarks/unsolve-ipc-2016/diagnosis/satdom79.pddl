(define (domain appn-pls)
 (:requirements :strips :equality)
 (:predicates (breaker-state-is-unknown_breaker_x1_x2) (breaker-state-is-unknown_breaker_x3_x4) (breaker-state-is-unknown_breaker_x7_x8) (breaker-state-is-open_breaker_x7_x8) (breaker-state-is-unknown_breaker_x9_x10) (breaker-state-is-unknown_breaker_x11_x12) (breaker-state-is-unknown_breaker_x13_x14) (breaker-state-is-unknown_breaker_x15_x16) (breaker-state-is-unknown_breaker_x17_x18) (breaker-state-is-unknown_breaker_x19_x20) (breaker-state-is-unknown_breaker_x21_x22) (breaker-state-is-unknown_breaker_x23_x24) (breaker-state-is-unknown_breaker_x25_x26) (breaker-state-is-open_breaker_x25_x26) (breaker-state-is-unknown_breaker_x27_x28) (breaker-state-is-unknown_breaker_x31_x32) (breaker-state-is-unknown_breaker_x33_x34) (breaker-state-is-unknown_breaker_x35_x36) (breaker-state-is-unknown_breaker_x37_x35) (breaker-state-is-closed_breaker_x1_x2) (breaker-state-is-closed_breaker_x3_x4) (breaker-state-is-closed_breaker_x7_x8) (breaker-state-is-closed_breaker_x9_x10) (breaker-state-is-closed_breaker_x11_x12) (breaker-state-is-closed_breaker_x13_x14) (breaker-state-is-closed_breaker_x15_x16) (breaker-state-is-closed_breaker_x17_x18) (breaker-state-is-closed_breaker_x19_x20) (breaker-state-is-closed_breaker_x21_x22) (breaker-state-is-closed_breaker_x23_x24) (breaker-state-is-closed_breaker_x25_x26) (breaker-state-is-closed_breaker_x27_x28) (breaker-state-is-closed_breaker_x31_x32) (breaker-state-is-closed_breaker_x33_x34) (breaker-state-is-closed_breaker_x35_x36) (breaker-state-is-closed_breaker_x37_x35) (breaker-ar-status-is-unknown_breaker_x1_x2) (breaker-ar-status-is-auto_breaker_x1_x2) (breaker-ar-status-is-unknown_breaker_x3_x4) (breaker-ar-status-is-auto_breaker_x3_x4) (breaker-ar-status-is-unknown_breaker_x7_x8) (breaker-ar-status-is-auto_breaker_x7_x8) (breaker-ar-status-is-unknown_breaker_x9_x10) (breaker-ar-status-is-auto_breaker_x9_x10) (breaker-ar-status-is-unknown_breaker_x11_x12) (breaker-ar-status-is-auto_breaker_x11_x12) (breaker-ar-status-is-unknown_breaker_x13_x14) (breaker-ar-status-is-auto_breaker_x13_x14) (breaker-ar-status-is-unknown_breaker_x15_x16) (breaker-ar-status-is-auto_breaker_x15_x16) (breaker-ar-status-is-unknown_breaker_x17_x18) (breaker-ar-status-is-auto_breaker_x17_x18) (breaker-ar-status-is-unknown_breaker_x19_x20) (breaker-ar-status-is-auto_breaker_x19_x20) (breaker-ar-status-is-unknown_breaker_x21_x22) (breaker-ar-status-is-auto_breaker_x21_x22) (breaker-ar-status-is-unknown_breaker_x23_x24) (breaker-ar-status-is-auto_breaker_x23_x24) (breaker-ar-status-is-unknown_breaker_x25_x26) (breaker-ar-status-is-auto_breaker_x25_x26) (breaker-ar-status-is-unknown_breaker_x27_x28) (breaker-ar-status-is-auto_breaker_x27_x28) (breaker-ar-status-is-unknown_breaker_x31_x32) (breaker-ar-status-is-auto_breaker_x31_x32) (breaker-ar-status-is-unknown_breaker_x33_x34) (breaker-ar-status-is-auto_breaker_x33_x34) (breaker-ar-status-is-unknown_breaker_x35_x36) (breaker-ar-status-is-auto_breaker_x35_x36) (breaker-ar-status-is-unknown_breaker_x37_x35) (breaker-ar-status-is-auto_breaker_x37_x35) (pending_obs8873) (fault-count-2_count-as-fault_breaker_x1_x2_n0) (observed_obs8873) (fault-count-2_count-as-fault_breaker_x1_x2_n1) (dominates-2_hyp5_count-as-fault_breaker_x1_x2) (dominates-2_hyp2_count-as-fault_breaker_x1_x2) (pending_obs8885) (fault-count-2_count-as-fault_breaker_x3_x4_n0) (observed_obs8885) (fault-count-2_count-as-fault_breaker_x3_x4_n1) (dominates-2_hyp1_count-as-fault_breaker_x3_x4) (pending_obs8879) (fault-count-2_count-as-fault_breaker_x7_x8_n0) (observed_obs8879) (fault-count-2_count-as-fault_breaker_x7_x8_n1) (dominates-2_hyp5_count-as-fault_breaker_x7_x8) (dominates-2_hyp4_count-as-fault_breaker_x7_x8) (dominates-2_hyp3_count-as-fault_breaker_x7_x8) (dominates-2_hyp2_count-as-fault_breaker_x7_x8) (dominates-2_hyp1_count-as-fault_breaker_x7_x8) (fault-count-2_count-as-fault_breaker_x7_x8_n2) (pending_obs8894) (fault-count-2_count-as-fault_breaker_x9_x10_n0) (observed_obs8894) (fault-count-2_count-as-fault_breaker_x9_x10_n1) (dominates-2_hyp5_count-as-fault_breaker_x9_x10) (dominates-2_hyp4_count-as-fault_breaker_x9_x10) (dominates-2_hyp3_count-as-fault_breaker_x9_x10) (dominates-2_hyp2_count-as-fault_breaker_x9_x10) (dominates-2_hyp1_count-as-fault_breaker_x9_x10) (pending_obs8905) (fault-count-2_count-as-fault_breaker_x11_x12_n0) (observed_obs8905) (fault-count-2_count-as-fault_breaker_x11_x12_n1) (dominates-2_hyp5_count-as-fault_breaker_x11_x12) (dominates-2_hyp4_count-as-fault_breaker_x11_x12) (dominates-2_hyp3_count-as-fault_breaker_x11_x12) (dominates-2_hyp2_count-as-fault_breaker_x11_x12) (dominates-2_hyp1_count-as-fault_breaker_x11_x12) (pending_obs8895) (fault-count-2_count-as-fault_breaker_x13_x14_n0) (observed_obs8895) (fault-count-2_count-as-fault_breaker_x13_x14_n1) (dominates-2_hyp5_count-as-fault_breaker_x13_x14) (dominates-2_hyp4_count-as-fault_breaker_x13_x14) (dominates-2_hyp3_count-as-fault_breaker_x13_x14) (dominates-2_hyp2_count-as-fault_breaker_x13_x14) (dominates-2_hyp1_count-as-fault_breaker_x13_x14) (pending_obs8877) (fault-count-2_count-as-fault_breaker_x15_x16_n0) (observed_obs8877) (fault-count-2_count-as-fault_breaker_x15_x16_n1) (dominates-2_hyp5_count-as-fault_breaker_x15_x16) (dominates-2_hyp4_count-as-fault_breaker_x15_x16) (dominates-2_hyp3_count-as-fault_breaker_x15_x16) (dominates-2_hyp2_count-as-fault_breaker_x15_x16) (dominates-2_hyp1_count-as-fault_breaker_x15_x16) (pending_obs8890) (fault-count-2_count-as-fault_breaker_x17_x18_n0) (observed_obs8890) (fault-count-2_count-as-fault_breaker_x17_x18_n1) (dominates-2_hyp5_count-as-fault_breaker_x17_x18) (dominates-2_hyp4_count-as-fault_breaker_x17_x18) (dominates-2_hyp3_count-as-fault_breaker_x17_x18) (dominates-2_hyp2_count-as-fault_breaker_x17_x18) (dominates-2_hyp1_count-as-fault_breaker_x17_x18) (pending_obs8871) (fault-count-2_count-as-fault_breaker_x19_x20_n0) (observed_obs8871) (fault-count-2_count-as-fault_breaker_x19_x20_n1) (dominates-2_hyp5_count-as-fault_breaker_x19_x20) (dominates-2_hyp4_count-as-fault_breaker_x19_x20) (dominates-2_hyp3_count-as-fault_breaker_x19_x20) (dominates-2_hyp2_count-as-fault_breaker_x19_x20) (dominates-2_hyp1_count-as-fault_breaker_x19_x20) (pending_obs8915) (fault-count-2_count-as-fault_breaker_x21_x22_n0) (observed_obs8915) (fault-count-2_count-as-fault_breaker_x21_x22_n1) (dominates-2_hyp5_count-as-fault_breaker_x21_x22) (dominates-2_hyp4_count-as-fault_breaker_x21_x22) (dominates-2_hyp3_count-as-fault_breaker_x21_x22) (dominates-2_hyp2_count-as-fault_breaker_x21_x22) (dominates-2_hyp1_count-as-fault_breaker_x21_x22) (pending_obs8892) (fault-count-2_count-as-fault_breaker_x23_x24_n0) (observed_obs8892) (fault-count-2_count-as-fault_breaker_x23_x24_n1) (dominates-2_hyp5_count-as-fault_breaker_x23_x24) (dominates-2_hyp4_count-as-fault_breaker_x23_x24) (dominates-2_hyp3_count-as-fault_breaker_x23_x24) (dominates-2_hyp2_count-as-fault_breaker_x23_x24) (dominates-2_hyp1_count-as-fault_breaker_x23_x24) (pending_obs8875) (fault-count-2_count-as-fault_breaker_x25_x26_n0) (observed_obs8875) (fault-count-2_count-as-fault_breaker_x25_x26_n1) (dominates-2_hyp5_count-as-fault_breaker_x25_x26) (dominates-2_hyp4_count-as-fault_breaker_x25_x26) (dominates-2_hyp3_count-as-fault_breaker_x25_x26) (dominates-2_hyp2_count-as-fault_breaker_x25_x26) (dominates-2_hyp1_count-as-fault_breaker_x25_x26) (fault-count-2_count-as-fault_breaker_x25_x26_n2) (pending_obs8867) (fault-count-2_count-as-fault_breaker_x27_x28_n0) (observed_obs8867) (fault-count-2_count-as-fault_breaker_x27_x28_n1) (dominates-2_hyp5_count-as-fault_breaker_x27_x28) (dominates-2_hyp4_count-as-fault_breaker_x27_x28) (dominates-2_hyp3_count-as-fault_breaker_x27_x28) (dominates-2_hyp2_count-as-fault_breaker_x27_x28) (dominates-2_hyp1_count-as-fault_breaker_x27_x28) (pending_obs8908) (fault-count-2_count-as-fault_breaker_x31_x32_n0) (observed_obs8908) (fault-count-2_count-as-fault_breaker_x31_x32_n1) (dominates-2_hyp5_count-as-fault_breaker_x31_x32) (dominates-2_hyp4_count-as-fault_breaker_x31_x32) (dominates-2_hyp3_count-as-fault_breaker_x31_x32) (dominates-2_hyp2_count-as-fault_breaker_x31_x32) (dominates-2_hyp1_count-as-fault_breaker_x31_x32) (pending_obs8880) (fault-count-2_count-as-fault_breaker_x33_x34_n0) (observed_obs8880) (fault-count-2_count-as-fault_breaker_x33_x34_n1) (dominates-2_hyp5_count-as-fault_breaker_x33_x34) (dominates-2_hyp4_count-as-fault_breaker_x33_x34) (dominates-2_hyp3_count-as-fault_breaker_x33_x34) (dominates-2_hyp2_count-as-fault_breaker_x33_x34) (dominates-2_hyp1_count-as-fault_breaker_x33_x34) (pending_obs8904) (fault-count-2_count-as-fault_breaker_x35_x36_n0) (observed_obs8904) (fault-count-2_count-as-fault_breaker_x35_x36_n1) (dominates-2_hyp5_count-as-fault_breaker_x35_x36) (dominates-2_hyp4_count-as-fault_breaker_x35_x36) (dominates-2_hyp3_count-as-fault_breaker_x35_x36) (dominates-2_hyp2_count-as-fault_breaker_x35_x36) (dominates-2_hyp1_count-as-fault_breaker_x35_x36) (pending_obs8899) (fault-count-2_count-as-fault_breaker_x37_x35_n0) (observed_obs8899) (fault-count-2_count-as-fault_breaker_x37_x35_n1) (dominates-2_hyp5_count-as-fault_breaker_x37_x35) (dominates-2_hyp4_count-as-fault_breaker_x37_x35) (dominates-2_hyp3_count-as-fault_breaker_x37_x35) (dominates-2_hyp2_count-as-fault_breaker_x37_x35) (dominates-2_hyp1_count-as-fault_breaker_x37_x35) (breaker-auto-reclose-wait_breaker_x7_x8_obs8879) (breaker-auto-reclose-wait_breaker_x25_x26_obs8875) (pending_obs8862) (observed_obs8862) (pending_obs8863) (observed_obs8863) (pending_obs8861) (breaker-commanded-closed_breaker_x7_x8_obs8861) (observed_obs8861) (pending_obs8860) (breaker-commanded-closed_breaker_x25_x26_obs8860) (observed_obs8860) (pending_obs8888) (observed_obs8888) (pending_obs8909) (observed_obs8909) (pending_obs8864) (fault-count-2_count-as-fault_bus_x42_n0) (observed_obs8864) (fault-count-2_count-as-fault_bus_x42_n1) (fault-count-2_count-as-fault_bus_x42_n2) (dominates-2_hyp5_count-as-fault_bus_x42) (dominates-2_hyp4_count-as-fault_bus_x42) (dominates-2_hyp3_count-as-fault_bus_x42) (dominates-2_hyp2_count-as-fault_bus_x42) (dominates-2_hyp1_count-as-fault_bus_x42) (pending_obs8883) (fault-count-2_count-as-fault_bus_x43_n0) (observed_obs8883) (fault-count-2_count-as-fault_bus_x43_n1) (dominates-2_hyp5_count-as-fault_bus_x43) (dominates-2_hyp4_count-as-fault_bus_x43) (dominates-2_hyp3_count-as-fault_bus_x43) (dominates-2_hyp2_count-as-fault_bus_x43) (dominates-2_hyp1_count-as-fault_bus_x43) (pending_obs8912) (fault-count-2_count-as-fault_bus_x44_n0) (observed_obs8912) (fault-count-2_count-as-fault_bus_x44_n1) (dominates-2_hyp5_count-as-fault_bus_x44) (dominates-2_hyp4_count-as-fault_bus_x44) (dominates-2_hyp3_count-as-fault_bus_x44) (dominates-2_hyp2_count-as-fault_bus_x44) (dominates-2_hyp1_count-as-fault_bus_x44) (pending_obs8876) (fault-count-2_count-as-fault_bus_x13_n0) (observed_obs8876) (fault-count-2_count-as-fault_bus_x13_n1) (dominates-2_hyp5_count-as-fault_bus_x13) (dominates-2_hyp4_count-as-fault_bus_x13) (dominates-2_hyp3_count-as-fault_bus_x13) (dominates-2_hyp2_count-as-fault_bus_x13) (dominates-2_hyp1_count-as-fault_bus_x13) (pending_obs8913) (fault-count-2_count-as-fault_bus_x32_n0) (observed_obs8913) (fault-count-2_count-as-fault_bus_x32_n1) (fault-count-2_count-as-fault_bus_x32_n2) (dominates-2_hyp5_count-as-fault_bus_x32) (dominates-2_hyp4_count-as-fault_bus_x32) (dominates-2_hyp3_count-as-fault_bus_x32) (dominates-2_hyp2_count-as-fault_bus_x32) (dominates-2_hyp1_count-as-fault_bus_x32) (pending_obs8914) (fault-count-2_count-as-fault_bus_x48_n0) (observed_obs8914) (fault-count-2_count-as-fault_bus_x48_n1) (dominates-2_hyp5_count-as-fault_bus_x48) (dominates-2_hyp4_count-as-fault_bus_x48) (dominates-2_hyp3_count-as-fault_bus_x48) (dominates-2_hyp2_count-as-fault_bus_x48) (dominates-2_hyp1_count-as-fault_bus_x48) (pending_obs8893) (fault-count-2_count-as-fault_bus_x40_n0) (observed_obs8893) (fault-count-2_count-as-fault_bus_x40_n1) (dominates-2_hyp5_count-as-fault_bus_x40) (dominates-2_hyp4_count-as-fault_bus_x40) (dominates-2_hyp3_count-as-fault_bus_x40) (dominates-2_hyp2_count-as-fault_bus_x40) (dominates-2_hyp1_count-as-fault_bus_x40) (pending_obs8897) (fault-count-2_count-as-fault_bus_x41_n0) (observed_obs8897) (fault-count-2_count-as-fault_bus_x41_n1) (dominates-2_hyp5_count-as-fault_bus_x41) (dominates-2_hyp4_count-as-fault_bus_x41) (dominates-2_hyp3_count-as-fault_bus_x41) (dominates-2_hyp2_count-as-fault_bus_x41) (dominates-2_hyp1_count-as-fault_bus_x41) (pending_obs8884) (observed_obs8884) (pending_obs8917) (fault-count-2_count-as-fault_bus_x45_n0) (observed_obs8917) (fault-count-2_count-as-fault_bus_x45_n1) (dominates-2_hyp5_count-as-fault_bus_x45) (dominates-2_hyp4_count-as-fault_bus_x45) (dominates-2_hyp3_count-as-fault_bus_x45) (dominates-2_hyp2_count-as-fault_bus_x45) (dominates-2_hyp1_count-as-fault_bus_x45) (pending_obs8898) (fault-count-2_count-as-fault_bus_x14_n0) (observed_obs8898) (fault-count-2_count-as-fault_bus_x14_n1) (dominates-2_hyp5_count-as-fault_bus_x14) (dominates-2_hyp4_count-as-fault_bus_x14) (dominates-2_hyp3_count-as-fault_bus_x14) (dominates-2_hyp2_count-as-fault_bus_x14) (dominates-2_hyp1_count-as-fault_bus_x14) (pending_obs8902) (fault-count-2_count-as-fault_bus_x46_n0) (observed_obs8902) (fault-count-2_count-as-fault_bus_x46_n1) (dominates-2_hyp5_count-as-fault_bus_x46) (dominates-2_hyp4_count-as-fault_bus_x46) (dominates-2_hyp3_count-as-fault_bus_x46) (dominates-2_hyp2_count-as-fault_bus_x46) (dominates-2_hyp1_count-as-fault_bus_x46) (pending_obs8916) (fault-count-2_count-as-fault_bus_x26_n0) (observed_obs8916) (fault-count-2_count-as-fault_bus_x26_n1) (dominates-2_hyp5_count-as-fault_bus_x26) (dominates-2_hyp4_count-as-fault_bus_x26) (dominates-2_hyp3_count-as-fault_bus_x26) (dominates-2_hyp2_count-as-fault_bus_x26) (dominates-2_hyp1_count-as-fault_bus_x26) (pending_obs8878) (fault-count-2_count-as-fault_bus_x25_n0) (observed_obs8878) (fault-count-2_count-as-fault_bus_x25_n1) (dominates-2_hyp5_count-as-fault_bus_x25) (dominates-2_hyp4_count-as-fault_bus_x25) (dominates-2_hyp3_count-as-fault_bus_x25) (dominates-2_hyp2_count-as-fault_bus_x25) (dominates-2_hyp1_count-as-fault_bus_x25) (pending_obs8896) (fault-count-2_count-as-fault_bus_x47_n0) (observed_obs8896) (fault-count-2_count-as-fault_bus_x47_n1) (dominates-2_hyp5_count-as-fault_bus_x47) (dominates-2_hyp4_count-as-fault_bus_x47) (dominates-2_hyp3_count-as-fault_bus_x47) (dominates-2_hyp2_count-as-fault_bus_x47) (dominates-2_hyp1_count-as-fault_bus_x47) (pending_obs8918) (observed_obs8918) (pending_obs8866) (fault-count-2_count-as-fault_bus_x31_n0) (observed_obs8866) (fault-count-2_count-as-fault_bus_x31_n1) (dominates-2_hyp5_count-as-fault_bus_x31) (dominates-2_hyp4_count-as-fault_bus_x31) (dominates-2_hyp3_count-as-fault_bus_x31) (dominates-2_hyp2_count-as-fault_bus_x31) (dominates-2_hyp1_count-as-fault_bus_x31) (pending_obs8907) (fault-count-2_count-as-fault_bus_x36_n0) (observed_obs8907) (fault-count-2_count-as-fault_bus_x36_n1) (dominates-2_hyp5_count-as-fault_bus_x36) (dominates-2_hyp4_count-as-fault_bus_x36) (dominates-2_hyp3_count-as-fault_bus_x36) (dominates-2_hyp2_count-as-fault_bus_x36) (dominates-2_hyp1_count-as-fault_bus_x36) (pending_obs8872) (fault-count-2_count-as-fault_bus_x2_n0) (observed_obs8872) (fault-count-2_count-as-fault_bus_x2_n1) (pending_obs8887) (fault-count-2_count-as-fault_bus_x4_n0) (observed_obs8887) (fault-count-2_count-as-fault_bus_x4_n1) (dominates-2_hyp3_count-as-fault_bus_x4) (dominates-2_hyp2_count-as-fault_bus_x4) (pending_obs8882) (fault-count-2_count-as-fault_bus_x49_n0) (observed_obs8882) (fault-count-2_count-as-fault_bus_x49_n1) (dominates-2_hyp5_count-as-fault_bus_x49) (dominates-2_hyp4_count-as-fault_bus_x49) (dominates-2_hyp3_count-as-fault_bus_x49) (dominates-2_hyp2_count-as-fault_bus_x49) (dominates-2_hyp1_count-as-fault_bus_x49) (bus-isolated_bus_x2) (generator-status-is-off_generator_x2_1) (bus-iso-state-changed_bus_x2_obs8873) (bus-isolated_bus_x4) (generator-status-is-off_generator_x4_1) (bus-iso-state-changed_bus_x4_obs8885) (generator-status-is-off_generator_x49_1) (pending_obs8900) (fault-count-2_count-as-fault_line_x29_x30_n0) (observed_obs8900) (fault-count-2_count-as-fault_line_x29_x30_n1) (dominates-2_hyp5_count-as-fault_line_x29_x30) (dominates-2_hyp4_count-as-fault_line_x29_x30) (dominates-2_hyp3_count-as-fault_line_x29_x30) (dominates-2_hyp2_count-as-fault_line_x29_x30) (dominates-2_hyp1_count-as-fault_line_x29_x30) (generator-status-is-unknown_generator_x2_1) (generator-status-is-on_generator_x2_1) (generator-status-is-unknown_generator_x4_1) (generator-status-is-on_generator_x4_1) (generator-status-is-unknown_generator_x49_1) (generator-status-is-on_generator_x49_1) (fault-count-2_count-as-fault_generator_x2_1_n0) (generator-status-is-shutting-down_generator_x2_1) (fault-count-2_count-as-fault_generator_x2_1_n1) (fault-count-2_count-as-fault_generator_x2_1_n2) (fault-count-2_count-as-fault_generator_x2_1_n3) (fault-count-2_count-as-fault_generator_x2_1_n4) (dominates-2_hyp5_count-as-fault_generator_x2_1) (dominates-2_hyp2_count-as-fault_generator_x2_1) (dominates-2_hyp4_count-as-fault_generator_x2_1) (dominates-2_hyp3_count-as-fault_generator_x2_1) (dominates-2_hyp1_count-as-fault_generator_x2_1) (fault-count-2_count-as-fault_generator_x4_1_n0) (generator-status-is-shutting-down_generator_x4_1) (fault-count-2_count-as-fault_generator_x4_1_n1) (fault-count-2_count-as-fault_generator_x4_1_n2) (fault-count-2_count-as-fault_generator_x4_1_n3) (dominates-2_hyp3_count-as-fault_generator_x4_1) (dominates-2_hyp2_count-as-fault_generator_x4_1) (dominates-2_hyp1_count-as-fault_generator_x4_1) (fault-count-2_count-as-fault_generator_x4_1_n4) (dominates-2_hyp5_count-as-fault_generator_x4_1) (dominates-2_hyp4_count-as-fault_generator_x4_1) (fault-count-2_count-as-fault_generator_x49_1_n0) (generator-status-is-shutting-down_generator_x49_1) (fault-count-2_count-as-fault_generator_x49_1_n1) (fault-count-2_count-as-fault_generator_x49_1_n2) (fault-count-2_count-as-fault_generator_x49_1_n3) (dominates-2_hyp5_count-as-fault_generator_x49_1) (dominates-2_hyp4_count-as-fault_generator_x49_1) (dominates-2_hyp3_count-as-fault_generator_x49_1) (dominates-2_hyp2_count-as-fault_generator_x49_1) (dominates-2_hyp1_count-as-fault_generator_x49_1) (fault-count-2_count-as-fault_generator_x49_1_n4) (pending_obs8886) (observed_obs8886) (pending_obs8919) (observed_obs8919) (pending_obs8903) (observed_obs8903) (pending_obs8869) (observed_obs8869) (pending_obs8901) (observed_obs8901) (pending_obs8911) (observed_obs8911) (generator-status-is-starting-up_generator_x2_1) (generator-status-is-starting-up_generator_x4_1) (generator-status-is-starting-up_generator_x49_1) (pending_obs8865) (observed_obs8865) (pending_obs8889) (observed_obs8889) (pending_obs8868) (observed_obs8868) (pending_obs8906) (observed_obs8906) (pending_obs8870) (observed_obs8870) (pending_obs8891) (observed_obs8891) (pending_obs8881) (observed_obs8881) (pending_obs8910) (observed_obs8910) (pending_obs8874) (observed_obs8874) (future_obs8861) (future_obs8862) (future_obs8863) (future_obs8864) (future_obs8865) (future_obs8866) (future_obs8867) (future_obs8868) (future_obs8869) (future_obs8870) (future_obs8871) (future_obs8872) (future_obs8873) (future_obs8874) (future_obs8875) (future_obs8876) (future_obs8877) (future_obs8878) (future_obs8879) (future_obs8880) (future_obs8881) (future_obs8882) (future_obs8883) (future_obs8884) (future_obs8885) (future_obs8886) (future_obs8887) (future_obs8888) (future_obs8889) (future_obs8890) (future_obs8891) (future_obs8892) (future_obs8893) (future_obs8894) (future_obs8895) (future_obs8896) (future_obs8897) (future_obs8898) (future_obs8899) (future_obs8900) (future_obs8901) (future_obs8902) (future_obs8903) (future_obs8904) (future_obs8905) (future_obs8906) (future_obs8907) (future_obs8908) (future_obs8909) (future_obs8910) (future_obs8911) (future_obs8912) (future_obs8913) (future_obs8914) (future_obs8915) (future_obs8916) (future_obs8917) (future_obs8918) (future_obs8919) (not_at_end_constraint0) (achieved_constraint0) (not_at_end_constraint1) (achieved_constraint1) (not_at_end_constraint2) (achieved_constraint2) (not_at_end_constraint3) (achieved_constraint3) (not_at_end_constraint4) (achieved_constraint4) (static-true))
 (:action breaker-init-state-was-open_breaker_x7_x8
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x7_x8) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (breaker-state-is-open_breaker_x7_x8) (not (breaker-state-is-unknown_breaker_x7_x8))))
 (:action breaker-init-state-was-open_breaker_x25_x26
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x25_x26) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (breaker-state-is-open_breaker_x25_x26) (not (breaker-state-is-unknown_breaker_x25_x26))))
 (:action breaker-init-state-was-closed_breaker_x1_x2
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x1_x2) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (breaker-state-is-closed_breaker_x1_x2) (not (breaker-state-is-unknown_breaker_x1_x2))))
 (:action breaker-init-state-was-closed_breaker_x3_x4
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x3_x4) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (breaker-state-is-closed_breaker_x3_x4) (not (breaker-state-is-unknown_breaker_x3_x4))))
 (:action breaker-init-state-was-closed_breaker_x7_x8
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x7_x8) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (breaker-state-is-closed_breaker_x7_x8) (not (breaker-state-is-unknown_breaker_x7_x8))))
 (:action breaker-init-state-was-closed_breaker_x9_x10
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x9_x10) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (breaker-state-is-closed_breaker_x9_x10) (not (breaker-state-is-unknown_breaker_x9_x10))))
 (:action breaker-init-state-was-closed_breaker_x11_x12
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x11_x12) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (breaker-state-is-closed_breaker_x11_x12) (not (breaker-state-is-unknown_breaker_x11_x12))))
 (:action breaker-init-state-was-closed_breaker_x13_x14
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x13_x14) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (breaker-state-is-closed_breaker_x13_x14) (not (breaker-state-is-unknown_breaker_x13_x14))))
 (:action breaker-init-state-was-closed_breaker_x15_x16
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x15_x16) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (breaker-state-is-closed_breaker_x15_x16) (not (breaker-state-is-unknown_breaker_x15_x16))))
 (:action breaker-init-state-was-closed_breaker_x17_x18
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x17_x18) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (breaker-state-is-closed_breaker_x17_x18) (not (breaker-state-is-unknown_breaker_x17_x18))))
 (:action breaker-init-state-was-closed_breaker_x19_x20
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x19_x20) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (breaker-state-is-closed_breaker_x19_x20) (not (breaker-state-is-unknown_breaker_x19_x20))))
 (:action breaker-init-state-was-closed_breaker_x21_x22
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x21_x22) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (breaker-state-is-closed_breaker_x21_x22) (not (breaker-state-is-unknown_breaker_x21_x22))))
 (:action breaker-init-state-was-closed_breaker_x23_x24
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x23_x24) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (breaker-state-is-closed_breaker_x23_x24) (not (breaker-state-is-unknown_breaker_x23_x24))))
 (:action breaker-init-state-was-closed_breaker_x25_x26
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x25_x26) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (breaker-state-is-closed_breaker_x25_x26) (not (breaker-state-is-unknown_breaker_x25_x26))))
 (:action breaker-init-state-was-closed_breaker_x27_x28
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x27_x28) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (breaker-state-is-closed_breaker_x27_x28) (not (breaker-state-is-unknown_breaker_x27_x28))))
 (:action breaker-init-state-was-closed_breaker_x31_x32
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x31_x32) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (breaker-state-is-closed_breaker_x31_x32) (not (breaker-state-is-unknown_breaker_x31_x32))))
 (:action breaker-init-state-was-closed_breaker_x33_x34
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x33_x34) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (breaker-state-is-closed_breaker_x33_x34) (not (breaker-state-is-unknown_breaker_x33_x34))))
 (:action breaker-init-state-was-closed_breaker_x35_x36
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x35_x36) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (breaker-state-is-closed_breaker_x35_x36) (not (breaker-state-is-unknown_breaker_x35_x36))))
 (:action breaker-init-state-was-closed_breaker_x37_x35
  :parameters ()
  :precondition (and (breaker-state-is-unknown_breaker_x37_x35) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (breaker-state-is-closed_breaker_x37_x35) (not (breaker-state-is-unknown_breaker_x37_x35))))
 (:action breaker-init-ar-status-was-auto_breaker_x1_x2
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x1_x2) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (breaker-ar-status-is-auto_breaker_x1_x2) (not (breaker-ar-status-is-unknown_breaker_x1_x2))))
 (:action breaker-init-ar-status-was-auto_breaker_x3_x4
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x3_x4) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (breaker-ar-status-is-auto_breaker_x3_x4) (not (breaker-ar-status-is-unknown_breaker_x3_x4))))
 (:action breaker-init-ar-status-was-auto_breaker_x7_x8
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x7_x8) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (breaker-ar-status-is-auto_breaker_x7_x8) (not (breaker-ar-status-is-unknown_breaker_x7_x8))))
 (:action breaker-init-ar-status-was-auto_breaker_x9_x10
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x9_x10) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (breaker-ar-status-is-auto_breaker_x9_x10) (not (breaker-ar-status-is-unknown_breaker_x9_x10))))
 (:action breaker-init-ar-status-was-auto_breaker_x11_x12
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x11_x12) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (breaker-ar-status-is-auto_breaker_x11_x12) (not (breaker-ar-status-is-unknown_breaker_x11_x12))))
 (:action breaker-init-ar-status-was-auto_breaker_x13_x14
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x13_x14) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (breaker-ar-status-is-auto_breaker_x13_x14) (not (breaker-ar-status-is-unknown_breaker_x13_x14))))
 (:action breaker-init-ar-status-was-auto_breaker_x15_x16
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x15_x16) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (breaker-ar-status-is-auto_breaker_x15_x16) (not (breaker-ar-status-is-unknown_breaker_x15_x16))))
 (:action breaker-init-ar-status-was-auto_breaker_x17_x18
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x17_x18) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (breaker-ar-status-is-auto_breaker_x17_x18) (not (breaker-ar-status-is-unknown_breaker_x17_x18))))
 (:action breaker-init-ar-status-was-auto_breaker_x19_x20
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x19_x20) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (breaker-ar-status-is-auto_breaker_x19_x20) (not (breaker-ar-status-is-unknown_breaker_x19_x20))))
 (:action breaker-init-ar-status-was-auto_breaker_x21_x22
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x21_x22) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (breaker-ar-status-is-auto_breaker_x21_x22) (not (breaker-ar-status-is-unknown_breaker_x21_x22))))
 (:action breaker-init-ar-status-was-auto_breaker_x23_x24
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x23_x24) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (breaker-ar-status-is-auto_breaker_x23_x24) (not (breaker-ar-status-is-unknown_breaker_x23_x24))))
 (:action breaker-init-ar-status-was-auto_breaker_x25_x26
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x25_x26) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (breaker-ar-status-is-auto_breaker_x25_x26) (not (breaker-ar-status-is-unknown_breaker_x25_x26))))
 (:action breaker-init-ar-status-was-auto_breaker_x27_x28
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x27_x28) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (breaker-ar-status-is-auto_breaker_x27_x28) (not (breaker-ar-status-is-unknown_breaker_x27_x28))))
 (:action breaker-init-ar-status-was-auto_breaker_x31_x32
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x31_x32) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (breaker-ar-status-is-auto_breaker_x31_x32) (not (breaker-ar-status-is-unknown_breaker_x31_x32))))
 (:action breaker-init-ar-status-was-auto_breaker_x33_x34
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x33_x34) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (breaker-ar-status-is-auto_breaker_x33_x34) (not (breaker-ar-status-is-unknown_breaker_x33_x34))))
 (:action breaker-init-ar-status-was-auto_breaker_x35_x36
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x35_x36) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (breaker-ar-status-is-auto_breaker_x35_x36) (not (breaker-ar-status-is-unknown_breaker_x35_x36))))
 (:action breaker-init-ar-status-was-auto_breaker_x37_x35
  :parameters ()
  :precondition (and (breaker-ar-status-is-unknown_breaker_x37_x35) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (breaker-ar-status-is-auto_breaker_x37_x35) (not (breaker-ar-status-is-unknown_breaker_x37_x35))))
 (:action breaker-open-unexplained_breaker_x1_x2_obs8873_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x1_x2) (pending_obs8873) (fault-count-2_count-as-fault_breaker_x1_x2_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8873) (fault-count-2_count-as-fault_breaker_x1_x2_n1) (not (breaker-state-is-closed_breaker_x1_x2)) (not (pending_obs8873)) (not (fault-count-2_count-as-fault_breaker_x1_x2_n0)) (not (dominates-2_hyp5_count-as-fault_breaker_x1_x2)) (not (dominates-2_hyp2_count-as-fault_breaker_x1_x2))))
 (:action breaker-open-unexplained_breaker_x3_x4_obs8885_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x3_x4) (pending_obs8885) (fault-count-2_count-as-fault_breaker_x3_x4_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8885) (fault-count-2_count-as-fault_breaker_x3_x4_n1) (not (breaker-state-is-closed_breaker_x3_x4)) (not (pending_obs8885)) (not (fault-count-2_count-as-fault_breaker_x3_x4_n0)) (not (dominates-2_hyp1_count-as-fault_breaker_x3_x4))))
 (:action breaker-open-unexplained_breaker_x7_x8_obs8879_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x7_x8) (pending_obs8879) (fault-count-2_count-as-fault_breaker_x7_x8_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (breaker-state-is-open_breaker_x7_x8) (observed_obs8879) (fault-count-2_count-as-fault_breaker_x7_x8_n1) (not (breaker-state-is-closed_breaker_x7_x8)) (not (pending_obs8879)) (not (fault-count-2_count-as-fault_breaker_x7_x8_n0)) (not (dominates-2_hyp5_count-as-fault_breaker_x7_x8)) (not (dominates-2_hyp4_count-as-fault_breaker_x7_x8)) (not (dominates-2_hyp3_count-as-fault_breaker_x7_x8)) (not (dominates-2_hyp2_count-as-fault_breaker_x7_x8)) (not (dominates-2_hyp1_count-as-fault_breaker_x7_x8))))
 (:action breaker-open-unexplained_breaker_x7_x8_obs8879_n1_n2
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x7_x8) (pending_obs8879) (fault-count-2_count-as-fault_breaker_x7_x8_n1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (breaker-state-is-open_breaker_x7_x8) (observed_obs8879) (fault-count-2_count-as-fault_breaker_x7_x8_n2) (not (breaker-state-is-closed_breaker_x7_x8)) (not (pending_obs8879)) (not (fault-count-2_count-as-fault_breaker_x7_x8_n1))))
 (:action breaker-open-unexplained_breaker_x9_x10_obs8894_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x9_x10) (pending_obs8894) (fault-count-2_count-as-fault_breaker_x9_x10_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8894) (fault-count-2_count-as-fault_breaker_x9_x10_n1) (not (breaker-state-is-closed_breaker_x9_x10)) (not (pending_obs8894)) (not (fault-count-2_count-as-fault_breaker_x9_x10_n0)) (not (dominates-2_hyp5_count-as-fault_breaker_x9_x10)) (not (dominates-2_hyp4_count-as-fault_breaker_x9_x10)) (not (dominates-2_hyp3_count-as-fault_breaker_x9_x10)) (not (dominates-2_hyp2_count-as-fault_breaker_x9_x10)) (not (dominates-2_hyp1_count-as-fault_breaker_x9_x10))))
 (:action breaker-open-unexplained_breaker_x11_x12_obs8905_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x11_x12) (pending_obs8905) (fault-count-2_count-as-fault_breaker_x11_x12_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8905) (fault-count-2_count-as-fault_breaker_x11_x12_n1) (not (breaker-state-is-closed_breaker_x11_x12)) (not (pending_obs8905)) (not (fault-count-2_count-as-fault_breaker_x11_x12_n0)) (not (dominates-2_hyp5_count-as-fault_breaker_x11_x12)) (not (dominates-2_hyp4_count-as-fault_breaker_x11_x12)) (not (dominates-2_hyp3_count-as-fault_breaker_x11_x12)) (not (dominates-2_hyp2_count-as-fault_breaker_x11_x12)) (not (dominates-2_hyp1_count-as-fault_breaker_x11_x12))))
 (:action breaker-open-unexplained_breaker_x13_x14_obs8895_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x13_x14) (pending_obs8895) (fault-count-2_count-as-fault_breaker_x13_x14_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8895) (fault-count-2_count-as-fault_breaker_x13_x14_n1) (not (breaker-state-is-closed_breaker_x13_x14)) (not (pending_obs8895)) (not (fault-count-2_count-as-fault_breaker_x13_x14_n0)) (not (dominates-2_hyp5_count-as-fault_breaker_x13_x14)) (not (dominates-2_hyp4_count-as-fault_breaker_x13_x14)) (not (dominates-2_hyp3_count-as-fault_breaker_x13_x14)) (not (dominates-2_hyp2_count-as-fault_breaker_x13_x14)) (not (dominates-2_hyp1_count-as-fault_breaker_x13_x14))))
 (:action breaker-open-unexplained_breaker_x15_x16_obs8877_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x15_x16) (pending_obs8877) (fault-count-2_count-as-fault_breaker_x15_x16_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8877) (fault-count-2_count-as-fault_breaker_x15_x16_n1) (not (breaker-state-is-closed_breaker_x15_x16)) (not (pending_obs8877)) (not (fault-count-2_count-as-fault_breaker_x15_x16_n0)) (not (dominates-2_hyp5_count-as-fault_breaker_x15_x16)) (not (dominates-2_hyp4_count-as-fault_breaker_x15_x16)) (not (dominates-2_hyp3_count-as-fault_breaker_x15_x16)) (not (dominates-2_hyp2_count-as-fault_breaker_x15_x16)) (not (dominates-2_hyp1_count-as-fault_breaker_x15_x16))))
 (:action breaker-open-unexplained_breaker_x17_x18_obs8890_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x17_x18) (pending_obs8890) (fault-count-2_count-as-fault_breaker_x17_x18_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8890) (fault-count-2_count-as-fault_breaker_x17_x18_n1) (not (breaker-state-is-closed_breaker_x17_x18)) (not (pending_obs8890)) (not (fault-count-2_count-as-fault_breaker_x17_x18_n0)) (not (dominates-2_hyp5_count-as-fault_breaker_x17_x18)) (not (dominates-2_hyp4_count-as-fault_breaker_x17_x18)) (not (dominates-2_hyp3_count-as-fault_breaker_x17_x18)) (not (dominates-2_hyp2_count-as-fault_breaker_x17_x18)) (not (dominates-2_hyp1_count-as-fault_breaker_x17_x18))))
 (:action breaker-open-unexplained_breaker_x19_x20_obs8871_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x19_x20) (pending_obs8871) (fault-count-2_count-as-fault_breaker_x19_x20_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8871) (fault-count-2_count-as-fault_breaker_x19_x20_n1) (not (breaker-state-is-closed_breaker_x19_x20)) (not (pending_obs8871)) (not (fault-count-2_count-as-fault_breaker_x19_x20_n0)) (not (dominates-2_hyp5_count-as-fault_breaker_x19_x20)) (not (dominates-2_hyp4_count-as-fault_breaker_x19_x20)) (not (dominates-2_hyp3_count-as-fault_breaker_x19_x20)) (not (dominates-2_hyp2_count-as-fault_breaker_x19_x20)) (not (dominates-2_hyp1_count-as-fault_breaker_x19_x20))))
 (:action breaker-open-unexplained_breaker_x21_x22_obs8915_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x21_x22) (pending_obs8915) (fault-count-2_count-as-fault_breaker_x21_x22_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8915) (fault-count-2_count-as-fault_breaker_x21_x22_n1) (not (breaker-state-is-closed_breaker_x21_x22)) (not (pending_obs8915)) (not (fault-count-2_count-as-fault_breaker_x21_x22_n0)) (not (dominates-2_hyp5_count-as-fault_breaker_x21_x22)) (not (dominates-2_hyp4_count-as-fault_breaker_x21_x22)) (not (dominates-2_hyp3_count-as-fault_breaker_x21_x22)) (not (dominates-2_hyp2_count-as-fault_breaker_x21_x22)) (not (dominates-2_hyp1_count-as-fault_breaker_x21_x22))))
 (:action breaker-open-unexplained_breaker_x23_x24_obs8892_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x23_x24) (pending_obs8892) (fault-count-2_count-as-fault_breaker_x23_x24_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8892) (fault-count-2_count-as-fault_breaker_x23_x24_n1) (not (breaker-state-is-closed_breaker_x23_x24)) (not (pending_obs8892)) (not (fault-count-2_count-as-fault_breaker_x23_x24_n0)) (not (dominates-2_hyp5_count-as-fault_breaker_x23_x24)) (not (dominates-2_hyp4_count-as-fault_breaker_x23_x24)) (not (dominates-2_hyp3_count-as-fault_breaker_x23_x24)) (not (dominates-2_hyp2_count-as-fault_breaker_x23_x24)) (not (dominates-2_hyp1_count-as-fault_breaker_x23_x24))))
 (:action breaker-open-unexplained_breaker_x25_x26_obs8875_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x25_x26) (pending_obs8875) (fault-count-2_count-as-fault_breaker_x25_x26_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (breaker-state-is-open_breaker_x25_x26) (observed_obs8875) (fault-count-2_count-as-fault_breaker_x25_x26_n1) (not (breaker-state-is-closed_breaker_x25_x26)) (not (pending_obs8875)) (not (fault-count-2_count-as-fault_breaker_x25_x26_n0)) (not (dominates-2_hyp5_count-as-fault_breaker_x25_x26)) (not (dominates-2_hyp4_count-as-fault_breaker_x25_x26)) (not (dominates-2_hyp3_count-as-fault_breaker_x25_x26)) (not (dominates-2_hyp2_count-as-fault_breaker_x25_x26)) (not (dominates-2_hyp1_count-as-fault_breaker_x25_x26))))
 (:action breaker-open-unexplained_breaker_x25_x26_obs8875_n1_n2
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x25_x26) (pending_obs8875) (fault-count-2_count-as-fault_breaker_x25_x26_n1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (breaker-state-is-open_breaker_x25_x26) (observed_obs8875) (fault-count-2_count-as-fault_breaker_x25_x26_n2) (not (breaker-state-is-closed_breaker_x25_x26)) (not (pending_obs8875)) (not (fault-count-2_count-as-fault_breaker_x25_x26_n1))))
 (:action breaker-open-unexplained_breaker_x27_x28_obs8867_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x27_x28) (pending_obs8867) (fault-count-2_count-as-fault_breaker_x27_x28_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8867) (fault-count-2_count-as-fault_breaker_x27_x28_n1) (not (breaker-state-is-closed_breaker_x27_x28)) (not (pending_obs8867)) (not (fault-count-2_count-as-fault_breaker_x27_x28_n0)) (not (dominates-2_hyp5_count-as-fault_breaker_x27_x28)) (not (dominates-2_hyp4_count-as-fault_breaker_x27_x28)) (not (dominates-2_hyp3_count-as-fault_breaker_x27_x28)) (not (dominates-2_hyp2_count-as-fault_breaker_x27_x28)) (not (dominates-2_hyp1_count-as-fault_breaker_x27_x28))))
 (:action breaker-open-unexplained_breaker_x31_x32_obs8908_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x31_x32) (pending_obs8908) (fault-count-2_count-as-fault_breaker_x31_x32_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8908) (fault-count-2_count-as-fault_breaker_x31_x32_n1) (not (breaker-state-is-closed_breaker_x31_x32)) (not (pending_obs8908)) (not (fault-count-2_count-as-fault_breaker_x31_x32_n0)) (not (dominates-2_hyp5_count-as-fault_breaker_x31_x32)) (not (dominates-2_hyp4_count-as-fault_breaker_x31_x32)) (not (dominates-2_hyp3_count-as-fault_breaker_x31_x32)) (not (dominates-2_hyp2_count-as-fault_breaker_x31_x32)) (not (dominates-2_hyp1_count-as-fault_breaker_x31_x32))))
 (:action breaker-open-unexplained_breaker_x33_x34_obs8880_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x33_x34) (pending_obs8880) (fault-count-2_count-as-fault_breaker_x33_x34_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8880) (fault-count-2_count-as-fault_breaker_x33_x34_n1) (not (breaker-state-is-closed_breaker_x33_x34)) (not (pending_obs8880)) (not (fault-count-2_count-as-fault_breaker_x33_x34_n0)) (not (dominates-2_hyp5_count-as-fault_breaker_x33_x34)) (not (dominates-2_hyp4_count-as-fault_breaker_x33_x34)) (not (dominates-2_hyp3_count-as-fault_breaker_x33_x34)) (not (dominates-2_hyp2_count-as-fault_breaker_x33_x34)) (not (dominates-2_hyp1_count-as-fault_breaker_x33_x34))))
 (:action breaker-open-unexplained_breaker_x35_x36_obs8904_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x35_x36) (pending_obs8904) (fault-count-2_count-as-fault_breaker_x35_x36_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8904) (fault-count-2_count-as-fault_breaker_x35_x36_n1) (not (breaker-state-is-closed_breaker_x35_x36)) (not (pending_obs8904)) (not (fault-count-2_count-as-fault_breaker_x35_x36_n0)) (not (dominates-2_hyp5_count-as-fault_breaker_x35_x36)) (not (dominates-2_hyp4_count-as-fault_breaker_x35_x36)) (not (dominates-2_hyp3_count-as-fault_breaker_x35_x36)) (not (dominates-2_hyp2_count-as-fault_breaker_x35_x36)) (not (dominates-2_hyp1_count-as-fault_breaker_x35_x36))))
 (:action breaker-open-unexplained_breaker_x37_x35_obs8899_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x37_x35) (pending_obs8899) (fault-count-2_count-as-fault_breaker_x37_x35_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8899) (fault-count-2_count-as-fault_breaker_x37_x35_n1) (not (breaker-state-is-closed_breaker_x37_x35)) (not (pending_obs8899)) (not (fault-count-2_count-as-fault_breaker_x37_x35_n0)) (not (dominates-2_hyp5_count-as-fault_breaker_x37_x35)) (not (dominates-2_hyp4_count-as-fault_breaker_x37_x35)) (not (dominates-2_hyp3_count-as-fault_breaker_x37_x35)) (not (dominates-2_hyp2_count-as-fault_breaker_x37_x35)) (not (dominates-2_hyp1_count-as-fault_breaker_x37_x35))))
 (:action breaker-trip-unexplained_breaker_x1_x2_obs8873_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x1_x2) (breaker-ar-status-is-auto_breaker_x1_x2) (pending_obs8873) (fault-count-2_count-as-fault_breaker_x1_x2_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8873) (fault-count-2_count-as-fault_breaker_x1_x2_n1) (not (breaker-state-is-closed_breaker_x1_x2)) (not (pending_obs8873)) (not (fault-count-2_count-as-fault_breaker_x1_x2_n0)) (not (dominates-2_hyp5_count-as-fault_breaker_x1_x2)) (not (dominates-2_hyp2_count-as-fault_breaker_x1_x2))))
 (:action breaker-trip-unexplained_breaker_x3_x4_obs8885_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x3_x4) (breaker-ar-status-is-auto_breaker_x3_x4) (pending_obs8885) (fault-count-2_count-as-fault_breaker_x3_x4_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8885) (fault-count-2_count-as-fault_breaker_x3_x4_n1) (not (breaker-state-is-closed_breaker_x3_x4)) (not (pending_obs8885)) (not (fault-count-2_count-as-fault_breaker_x3_x4_n0)) (not (dominates-2_hyp1_count-as-fault_breaker_x3_x4))))
 (:action breaker-trip-unexplained_breaker_x7_x8_obs8879_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x7_x8) (breaker-ar-status-is-auto_breaker_x7_x8) (pending_obs8879) (fault-count-2_count-as-fault_breaker_x7_x8_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (breaker-state-is-open_breaker_x7_x8) (observed_obs8879) (fault-count-2_count-as-fault_breaker_x7_x8_n1) (breaker-auto-reclose-wait_breaker_x7_x8_obs8879) (not (breaker-state-is-closed_breaker_x7_x8)) (not (pending_obs8879)) (not (fault-count-2_count-as-fault_breaker_x7_x8_n0)) (not (dominates-2_hyp5_count-as-fault_breaker_x7_x8)) (not (dominates-2_hyp4_count-as-fault_breaker_x7_x8)) (not (dominates-2_hyp3_count-as-fault_breaker_x7_x8)) (not (dominates-2_hyp2_count-as-fault_breaker_x7_x8)) (not (dominates-2_hyp1_count-as-fault_breaker_x7_x8))))
 (:action breaker-trip-unexplained_breaker_x7_x8_obs8879_n1_n2
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x7_x8) (breaker-ar-status-is-auto_breaker_x7_x8) (pending_obs8879) (fault-count-2_count-as-fault_breaker_x7_x8_n1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (breaker-state-is-open_breaker_x7_x8) (observed_obs8879) (fault-count-2_count-as-fault_breaker_x7_x8_n2) (breaker-auto-reclose-wait_breaker_x7_x8_obs8879) (not (breaker-state-is-closed_breaker_x7_x8)) (not (pending_obs8879)) (not (fault-count-2_count-as-fault_breaker_x7_x8_n1))))
 (:action breaker-trip-unexplained_breaker_x9_x10_obs8894_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x9_x10) (breaker-ar-status-is-auto_breaker_x9_x10) (pending_obs8894) (fault-count-2_count-as-fault_breaker_x9_x10_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8894) (fault-count-2_count-as-fault_breaker_x9_x10_n1) (not (breaker-state-is-closed_breaker_x9_x10)) (not (pending_obs8894)) (not (fault-count-2_count-as-fault_breaker_x9_x10_n0)) (not (dominates-2_hyp5_count-as-fault_breaker_x9_x10)) (not (dominates-2_hyp4_count-as-fault_breaker_x9_x10)) (not (dominates-2_hyp3_count-as-fault_breaker_x9_x10)) (not (dominates-2_hyp2_count-as-fault_breaker_x9_x10)) (not (dominates-2_hyp1_count-as-fault_breaker_x9_x10))))
 (:action breaker-trip-unexplained_breaker_x11_x12_obs8905_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x11_x12) (breaker-ar-status-is-auto_breaker_x11_x12) (pending_obs8905) (fault-count-2_count-as-fault_breaker_x11_x12_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8905) (fault-count-2_count-as-fault_breaker_x11_x12_n1) (not (breaker-state-is-closed_breaker_x11_x12)) (not (pending_obs8905)) (not (fault-count-2_count-as-fault_breaker_x11_x12_n0)) (not (dominates-2_hyp5_count-as-fault_breaker_x11_x12)) (not (dominates-2_hyp4_count-as-fault_breaker_x11_x12)) (not (dominates-2_hyp3_count-as-fault_breaker_x11_x12)) (not (dominates-2_hyp2_count-as-fault_breaker_x11_x12)) (not (dominates-2_hyp1_count-as-fault_breaker_x11_x12))))
 (:action breaker-trip-unexplained_breaker_x13_x14_obs8895_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x13_x14) (breaker-ar-status-is-auto_breaker_x13_x14) (pending_obs8895) (fault-count-2_count-as-fault_breaker_x13_x14_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8895) (fault-count-2_count-as-fault_breaker_x13_x14_n1) (not (breaker-state-is-closed_breaker_x13_x14)) (not (pending_obs8895)) (not (fault-count-2_count-as-fault_breaker_x13_x14_n0)) (not (dominates-2_hyp5_count-as-fault_breaker_x13_x14)) (not (dominates-2_hyp4_count-as-fault_breaker_x13_x14)) (not (dominates-2_hyp3_count-as-fault_breaker_x13_x14)) (not (dominates-2_hyp2_count-as-fault_breaker_x13_x14)) (not (dominates-2_hyp1_count-as-fault_breaker_x13_x14))))
 (:action breaker-trip-unexplained_breaker_x15_x16_obs8877_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x15_x16) (breaker-ar-status-is-auto_breaker_x15_x16) (pending_obs8877) (fault-count-2_count-as-fault_breaker_x15_x16_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8877) (fault-count-2_count-as-fault_breaker_x15_x16_n1) (not (breaker-state-is-closed_breaker_x15_x16)) (not (pending_obs8877)) (not (fault-count-2_count-as-fault_breaker_x15_x16_n0)) (not (dominates-2_hyp5_count-as-fault_breaker_x15_x16)) (not (dominates-2_hyp4_count-as-fault_breaker_x15_x16)) (not (dominates-2_hyp3_count-as-fault_breaker_x15_x16)) (not (dominates-2_hyp2_count-as-fault_breaker_x15_x16)) (not (dominates-2_hyp1_count-as-fault_breaker_x15_x16))))
 (:action breaker-trip-unexplained_breaker_x17_x18_obs8890_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x17_x18) (breaker-ar-status-is-auto_breaker_x17_x18) (pending_obs8890) (fault-count-2_count-as-fault_breaker_x17_x18_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8890) (fault-count-2_count-as-fault_breaker_x17_x18_n1) (not (breaker-state-is-closed_breaker_x17_x18)) (not (pending_obs8890)) (not (fault-count-2_count-as-fault_breaker_x17_x18_n0)) (not (dominates-2_hyp5_count-as-fault_breaker_x17_x18)) (not (dominates-2_hyp4_count-as-fault_breaker_x17_x18)) (not (dominates-2_hyp3_count-as-fault_breaker_x17_x18)) (not (dominates-2_hyp2_count-as-fault_breaker_x17_x18)) (not (dominates-2_hyp1_count-as-fault_breaker_x17_x18))))
 (:action breaker-trip-unexplained_breaker_x19_x20_obs8871_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x19_x20) (breaker-ar-status-is-auto_breaker_x19_x20) (pending_obs8871) (fault-count-2_count-as-fault_breaker_x19_x20_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8871) (fault-count-2_count-as-fault_breaker_x19_x20_n1) (not (breaker-state-is-closed_breaker_x19_x20)) (not (pending_obs8871)) (not (fault-count-2_count-as-fault_breaker_x19_x20_n0)) (not (dominates-2_hyp5_count-as-fault_breaker_x19_x20)) (not (dominates-2_hyp4_count-as-fault_breaker_x19_x20)) (not (dominates-2_hyp3_count-as-fault_breaker_x19_x20)) (not (dominates-2_hyp2_count-as-fault_breaker_x19_x20)) (not (dominates-2_hyp1_count-as-fault_breaker_x19_x20))))
 (:action breaker-trip-unexplained_breaker_x21_x22_obs8915_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x21_x22) (breaker-ar-status-is-auto_breaker_x21_x22) (pending_obs8915) (fault-count-2_count-as-fault_breaker_x21_x22_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8915) (fault-count-2_count-as-fault_breaker_x21_x22_n1) (not (breaker-state-is-closed_breaker_x21_x22)) (not (pending_obs8915)) (not (fault-count-2_count-as-fault_breaker_x21_x22_n0)) (not (dominates-2_hyp5_count-as-fault_breaker_x21_x22)) (not (dominates-2_hyp4_count-as-fault_breaker_x21_x22)) (not (dominates-2_hyp3_count-as-fault_breaker_x21_x22)) (not (dominates-2_hyp2_count-as-fault_breaker_x21_x22)) (not (dominates-2_hyp1_count-as-fault_breaker_x21_x22))))
 (:action breaker-trip-unexplained_breaker_x23_x24_obs8892_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x23_x24) (breaker-ar-status-is-auto_breaker_x23_x24) (pending_obs8892) (fault-count-2_count-as-fault_breaker_x23_x24_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8892) (fault-count-2_count-as-fault_breaker_x23_x24_n1) (not (breaker-state-is-closed_breaker_x23_x24)) (not (pending_obs8892)) (not (fault-count-2_count-as-fault_breaker_x23_x24_n0)) (not (dominates-2_hyp5_count-as-fault_breaker_x23_x24)) (not (dominates-2_hyp4_count-as-fault_breaker_x23_x24)) (not (dominates-2_hyp3_count-as-fault_breaker_x23_x24)) (not (dominates-2_hyp2_count-as-fault_breaker_x23_x24)) (not (dominates-2_hyp1_count-as-fault_breaker_x23_x24))))
 (:action breaker-trip-unexplained_breaker_x25_x26_obs8875_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x25_x26) (breaker-ar-status-is-auto_breaker_x25_x26) (pending_obs8875) (fault-count-2_count-as-fault_breaker_x25_x26_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (breaker-state-is-open_breaker_x25_x26) (observed_obs8875) (fault-count-2_count-as-fault_breaker_x25_x26_n1) (breaker-auto-reclose-wait_breaker_x25_x26_obs8875) (not (breaker-state-is-closed_breaker_x25_x26)) (not (pending_obs8875)) (not (fault-count-2_count-as-fault_breaker_x25_x26_n0)) (not (dominates-2_hyp5_count-as-fault_breaker_x25_x26)) (not (dominates-2_hyp4_count-as-fault_breaker_x25_x26)) (not (dominates-2_hyp3_count-as-fault_breaker_x25_x26)) (not (dominates-2_hyp2_count-as-fault_breaker_x25_x26)) (not (dominates-2_hyp1_count-as-fault_breaker_x25_x26))))
 (:action breaker-trip-unexplained_breaker_x25_x26_obs8875_n1_n2
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x25_x26) (breaker-ar-status-is-auto_breaker_x25_x26) (pending_obs8875) (fault-count-2_count-as-fault_breaker_x25_x26_n1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (breaker-state-is-open_breaker_x25_x26) (observed_obs8875) (fault-count-2_count-as-fault_breaker_x25_x26_n2) (breaker-auto-reclose-wait_breaker_x25_x26_obs8875) (not (breaker-state-is-closed_breaker_x25_x26)) (not (pending_obs8875)) (not (fault-count-2_count-as-fault_breaker_x25_x26_n1))))
 (:action breaker-trip-unexplained_breaker_x27_x28_obs8867_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x27_x28) (breaker-ar-status-is-auto_breaker_x27_x28) (pending_obs8867) (fault-count-2_count-as-fault_breaker_x27_x28_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8867) (fault-count-2_count-as-fault_breaker_x27_x28_n1) (not (breaker-state-is-closed_breaker_x27_x28)) (not (pending_obs8867)) (not (fault-count-2_count-as-fault_breaker_x27_x28_n0)) (not (dominates-2_hyp5_count-as-fault_breaker_x27_x28)) (not (dominates-2_hyp4_count-as-fault_breaker_x27_x28)) (not (dominates-2_hyp3_count-as-fault_breaker_x27_x28)) (not (dominates-2_hyp2_count-as-fault_breaker_x27_x28)) (not (dominates-2_hyp1_count-as-fault_breaker_x27_x28))))
 (:action breaker-trip-unexplained_breaker_x31_x32_obs8908_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x31_x32) (breaker-ar-status-is-auto_breaker_x31_x32) (pending_obs8908) (fault-count-2_count-as-fault_breaker_x31_x32_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8908) (fault-count-2_count-as-fault_breaker_x31_x32_n1) (not (breaker-state-is-closed_breaker_x31_x32)) (not (pending_obs8908)) (not (fault-count-2_count-as-fault_breaker_x31_x32_n0)) (not (dominates-2_hyp5_count-as-fault_breaker_x31_x32)) (not (dominates-2_hyp4_count-as-fault_breaker_x31_x32)) (not (dominates-2_hyp3_count-as-fault_breaker_x31_x32)) (not (dominates-2_hyp2_count-as-fault_breaker_x31_x32)) (not (dominates-2_hyp1_count-as-fault_breaker_x31_x32))))
 (:action breaker-trip-unexplained_breaker_x33_x34_obs8880_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x33_x34) (breaker-ar-status-is-auto_breaker_x33_x34) (pending_obs8880) (fault-count-2_count-as-fault_breaker_x33_x34_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8880) (fault-count-2_count-as-fault_breaker_x33_x34_n1) (not (breaker-state-is-closed_breaker_x33_x34)) (not (pending_obs8880)) (not (fault-count-2_count-as-fault_breaker_x33_x34_n0)) (not (dominates-2_hyp5_count-as-fault_breaker_x33_x34)) (not (dominates-2_hyp4_count-as-fault_breaker_x33_x34)) (not (dominates-2_hyp3_count-as-fault_breaker_x33_x34)) (not (dominates-2_hyp2_count-as-fault_breaker_x33_x34)) (not (dominates-2_hyp1_count-as-fault_breaker_x33_x34))))
 (:action breaker-trip-unexplained_breaker_x35_x36_obs8904_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x35_x36) (breaker-ar-status-is-auto_breaker_x35_x36) (pending_obs8904) (fault-count-2_count-as-fault_breaker_x35_x36_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8904) (fault-count-2_count-as-fault_breaker_x35_x36_n1) (not (breaker-state-is-closed_breaker_x35_x36)) (not (pending_obs8904)) (not (fault-count-2_count-as-fault_breaker_x35_x36_n0)) (not (dominates-2_hyp5_count-as-fault_breaker_x35_x36)) (not (dominates-2_hyp4_count-as-fault_breaker_x35_x36)) (not (dominates-2_hyp3_count-as-fault_breaker_x35_x36)) (not (dominates-2_hyp2_count-as-fault_breaker_x35_x36)) (not (dominates-2_hyp1_count-as-fault_breaker_x35_x36))))
 (:action breaker-trip-unexplained_breaker_x37_x35_obs8899_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x37_x35) (breaker-ar-status-is-auto_breaker_x37_x35) (pending_obs8899) (fault-count-2_count-as-fault_breaker_x37_x35_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8899) (fault-count-2_count-as-fault_breaker_x37_x35_n1) (not (breaker-state-is-closed_breaker_x37_x35)) (not (pending_obs8899)) (not (fault-count-2_count-as-fault_breaker_x37_x35_n0)) (not (dominates-2_hyp5_count-as-fault_breaker_x37_x35)) (not (dominates-2_hyp4_count-as-fault_breaker_x37_x35)) (not (dominates-2_hyp3_count-as-fault_breaker_x37_x35)) (not (dominates-2_hyp2_count-as-fault_breaker_x37_x35)) (not (dominates-2_hyp1_count-as-fault_breaker_x37_x35))))
 (:action breaker-close-unexplained_breaker_x7_x8_obs8862_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x7_x8) (fault-count-2_count-as-fault_breaker_x7_x8_n0) (pending_obs8862) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (breaker-state-is-closed_breaker_x7_x8) (fault-count-2_count-as-fault_breaker_x7_x8_n1) (observed_obs8862) (not (breaker-state-is-open_breaker_x7_x8)) (not (fault-count-2_count-as-fault_breaker_x7_x8_n0)) (not (dominates-2_hyp5_count-as-fault_breaker_x7_x8)) (not (dominates-2_hyp4_count-as-fault_breaker_x7_x8)) (not (dominates-2_hyp3_count-as-fault_breaker_x7_x8)) (not (dominates-2_hyp2_count-as-fault_breaker_x7_x8)) (not (dominates-2_hyp1_count-as-fault_breaker_x7_x8)) (not (pending_obs8862))))
 (:action breaker-close-unexplained_breaker_x25_x26_obs8863_n0_n1
  :parameters ()
  :precondition (and (breaker-state-is-open_breaker_x25_x26) (fault-count-2_count-as-fault_breaker_x25_x26_n0) (pending_obs8863) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (breaker-state-is-closed_breaker_x25_x26) (fault-count-2_count-as-fault_breaker_x25_x26_n1) (observed_obs8863) (not (breaker-state-is-open_breaker_x25_x26)) (not (fault-count-2_count-as-fault_breaker_x25_x26_n0)) (not (dominates-2_hyp5_count-as-fault_breaker_x25_x26)) (not (dominates-2_hyp4_count-as-fault_breaker_x25_x26)) (not (dominates-2_hyp3_count-as-fault_breaker_x25_x26)) (not (dominates-2_hyp2_count-as-fault_breaker_x25_x26)) (not (dominates-2_hyp1_count-as-fault_breaker_x25_x26)) (not (pending_obs8863))))
 (:action breaker-command-close_breaker_x7_x8_obs8861
  :parameters ()
  :precondition (and (pending_obs8861) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (breaker-commanded-closed_breaker_x7_x8_obs8861) (observed_obs8861) (not (pending_obs8861))))
 (:action breaker-command-close_breaker_x25_x26_obs8860
  :parameters ()
  :precondition (and (pending_obs8860) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (breaker-commanded-closed_breaker_x25_x26_obs8860) (observed_obs8860) (not (pending_obs8860))))
 (:action breaker-command-close_breaker_x38_x39_obs8888
  :parameters ()
  :precondition (and (pending_obs8888) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8888) (not (pending_obs8888))))
 (:action breaker-close-on-command_breaker_x7_x8_obs8862_obs8861
  :parameters ()
  :precondition (and (pending_obs8862) (breaker-commanded-closed_breaker_x7_x8_obs8861) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (breaker-state-is-closed_breaker_x7_x8) (observed_obs8862) (not (breaker-state-is-unknown_breaker_x7_x8)) (not (breaker-state-is-open_breaker_x7_x8)) (not (pending_obs8862))))
 (:action breaker-close-on-command_breaker_x25_x26_obs8863_obs8860
  :parameters ()
  :precondition (and (pending_obs8863) (breaker-commanded-closed_breaker_x25_x26_obs8860) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (breaker-state-is-closed_breaker_x25_x26) (observed_obs8863) (not (breaker-state-is-unknown_breaker_x25_x26)) (not (breaker-state-is-open_breaker_x25_x26)) (not (pending_obs8863))))
 (:action disconnector-command-close_disconnector_x5_x6_obs8909
  :parameters ()
  :precondition (and (pending_obs8909) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8909) (not (pending_obs8909))))
 (:action bus-voltage-goes-low-unexplained_bus_x42_low_obs8864_n0_n1
  :parameters ()
  :precondition (and (pending_obs8864) (fault-count-2_count-as-fault_bus_x42_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8864) (fault-count-2_count-as-fault_bus_x42_n1) (not (pending_obs8864)) (not (fault-count-2_count-as-fault_bus_x42_n0))))
 (:action bus-voltage-goes-low-unexplained_bus_x43_low_obs8883_n0_n1
  :parameters ()
  :precondition (and (pending_obs8883) (fault-count-2_count-as-fault_bus_x43_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8883) (fault-count-2_count-as-fault_bus_x43_n1) (not (pending_obs8883)) (not (fault-count-2_count-as-fault_bus_x43_n0)) (not (dominates-2_hyp5_count-as-fault_bus_x43)) (not (dominates-2_hyp4_count-as-fault_bus_x43)) (not (dominates-2_hyp3_count-as-fault_bus_x43)) (not (dominates-2_hyp2_count-as-fault_bus_x43)) (not (dominates-2_hyp1_count-as-fault_bus_x43))))
 (:action bus-voltage-goes-low-unexplained_bus_x44_low_obs8912_n0_n1
  :parameters ()
  :precondition (and (pending_obs8912) (fault-count-2_count-as-fault_bus_x44_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8912) (fault-count-2_count-as-fault_bus_x44_n1) (not (pending_obs8912)) (not (fault-count-2_count-as-fault_bus_x44_n0)) (not (dominates-2_hyp5_count-as-fault_bus_x44)) (not (dominates-2_hyp4_count-as-fault_bus_x44)) (not (dominates-2_hyp3_count-as-fault_bus_x44)) (not (dominates-2_hyp2_count-as-fault_bus_x44)) (not (dominates-2_hyp1_count-as-fault_bus_x44))))
 (:action bus-voltage-goes-low-unexplained_bus_x13_low_obs8876_n0_n1
  :parameters ()
  :precondition (and (pending_obs8876) (fault-count-2_count-as-fault_bus_x13_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8876) (fault-count-2_count-as-fault_bus_x13_n1) (not (pending_obs8876)) (not (fault-count-2_count-as-fault_bus_x13_n0)) (not (dominates-2_hyp5_count-as-fault_bus_x13)) (not (dominates-2_hyp4_count-as-fault_bus_x13)) (not (dominates-2_hyp3_count-as-fault_bus_x13)) (not (dominates-2_hyp2_count-as-fault_bus_x13)) (not (dominates-2_hyp1_count-as-fault_bus_x13))))
 (:action bus-voltage-goes-high-unexplained_bus_x32_high_obs8913_n0_n1
  :parameters ()
  :precondition (and (pending_obs8913) (fault-count-2_count-as-fault_bus_x32_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8913) (fault-count-2_count-as-fault_bus_x32_n1) (not (pending_obs8913)) (not (fault-count-2_count-as-fault_bus_x32_n0))))
 (:action bus-voltage-goes-high-unexplained_bus_x48_high_obs8914_n0_n1
  :parameters ()
  :precondition (and (pending_obs8914) (fault-count-2_count-as-fault_bus_x48_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8914) (fault-count-2_count-as-fault_bus_x48_n1) (not (pending_obs8914)) (not (fault-count-2_count-as-fault_bus_x48_n0)) (not (dominates-2_hyp5_count-as-fault_bus_x48)) (not (dominates-2_hyp4_count-as-fault_bus_x48)) (not (dominates-2_hyp3_count-as-fault_bus_x48)) (not (dominates-2_hyp2_count-as-fault_bus_x48)) (not (dominates-2_hyp1_count-as-fault_bus_x48))))
 (:action bus-voltage-goes-normal-unexplained_bus_x40_obs8893_n0_n1
  :parameters ()
  :precondition (and (pending_obs8893) (fault-count-2_count-as-fault_bus_x40_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8893) (fault-count-2_count-as-fault_bus_x40_n1) (not (pending_obs8893)) (not (fault-count-2_count-as-fault_bus_x40_n0)) (not (dominates-2_hyp5_count-as-fault_bus_x40)) (not (dominates-2_hyp4_count-as-fault_bus_x40)) (not (dominates-2_hyp3_count-as-fault_bus_x40)) (not (dominates-2_hyp2_count-as-fault_bus_x40)) (not (dominates-2_hyp1_count-as-fault_bus_x40))))
 (:action bus-voltage-goes-normal-unexplained_bus_x41_obs8897_n0_n1
  :parameters ()
  :precondition (and (pending_obs8897) (fault-count-2_count-as-fault_bus_x41_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8897) (fault-count-2_count-as-fault_bus_x41_n1) (not (pending_obs8897)) (not (fault-count-2_count-as-fault_bus_x41_n0)) (not (dominates-2_hyp5_count-as-fault_bus_x41)) (not (dominates-2_hyp4_count-as-fault_bus_x41)) (not (dominates-2_hyp3_count-as-fault_bus_x41)) (not (dominates-2_hyp2_count-as-fault_bus_x41)) (not (dominates-2_hyp1_count-as-fault_bus_x41))))
 (:action bus-voltage-goes-normal-unexplained_bus_x42_obs8884_n1_n2
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_bus_x42_n1) (pending_obs8884) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (fault-count-2_count-as-fault_bus_x42_n2) (observed_obs8884) (not (fault-count-2_count-as-fault_bus_x42_n1)) (not (dominates-2_hyp5_count-as-fault_bus_x42)) (not (dominates-2_hyp4_count-as-fault_bus_x42)) (not (dominates-2_hyp3_count-as-fault_bus_x42)) (not (dominates-2_hyp2_count-as-fault_bus_x42)) (not (dominates-2_hyp1_count-as-fault_bus_x42)) (not (pending_obs8884))))
 (:action bus-voltage-goes-normal-unexplained_bus_x45_obs8917_n0_n1
  :parameters ()
  :precondition (and (pending_obs8917) (fault-count-2_count-as-fault_bus_x45_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8917) (fault-count-2_count-as-fault_bus_x45_n1) (not (pending_obs8917)) (not (fault-count-2_count-as-fault_bus_x45_n0)) (not (dominates-2_hyp5_count-as-fault_bus_x45)) (not (dominates-2_hyp4_count-as-fault_bus_x45)) (not (dominates-2_hyp3_count-as-fault_bus_x45)) (not (dominates-2_hyp2_count-as-fault_bus_x45)) (not (dominates-2_hyp1_count-as-fault_bus_x45))))
 (:action bus-voltage-goes-normal-unexplained_bus_x14_obs8898_n0_n1
  :parameters ()
  :precondition (and (pending_obs8898) (fault-count-2_count-as-fault_bus_x14_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8898) (fault-count-2_count-as-fault_bus_x14_n1) (not (pending_obs8898)) (not (fault-count-2_count-as-fault_bus_x14_n0)) (not (dominates-2_hyp5_count-as-fault_bus_x14)) (not (dominates-2_hyp4_count-as-fault_bus_x14)) (not (dominates-2_hyp3_count-as-fault_bus_x14)) (not (dominates-2_hyp2_count-as-fault_bus_x14)) (not (dominates-2_hyp1_count-as-fault_bus_x14))))
 (:action bus-voltage-goes-normal-unexplained_bus_x46_obs8902_n0_n1
  :parameters ()
  :precondition (and (pending_obs8902) (fault-count-2_count-as-fault_bus_x46_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8902) (fault-count-2_count-as-fault_bus_x46_n1) (not (pending_obs8902)) (not (fault-count-2_count-as-fault_bus_x46_n0)) (not (dominates-2_hyp5_count-as-fault_bus_x46)) (not (dominates-2_hyp4_count-as-fault_bus_x46)) (not (dominates-2_hyp3_count-as-fault_bus_x46)) (not (dominates-2_hyp2_count-as-fault_bus_x46)) (not (dominates-2_hyp1_count-as-fault_bus_x46))))
 (:action bus-voltage-goes-normal-unexplained_bus_x26_obs8916_n0_n1
  :parameters ()
  :precondition (and (pending_obs8916) (fault-count-2_count-as-fault_bus_x26_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8916) (fault-count-2_count-as-fault_bus_x26_n1) (not (pending_obs8916)) (not (fault-count-2_count-as-fault_bus_x26_n0)) (not (dominates-2_hyp5_count-as-fault_bus_x26)) (not (dominates-2_hyp4_count-as-fault_bus_x26)) (not (dominates-2_hyp3_count-as-fault_bus_x26)) (not (dominates-2_hyp2_count-as-fault_bus_x26)) (not (dominates-2_hyp1_count-as-fault_bus_x26))))
 (:action bus-voltage-goes-normal-unexplained_bus_x25_obs8878_n0_n1
  :parameters ()
  :precondition (and (pending_obs8878) (fault-count-2_count-as-fault_bus_x25_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8878) (fault-count-2_count-as-fault_bus_x25_n1) (not (pending_obs8878)) (not (fault-count-2_count-as-fault_bus_x25_n0)) (not (dominates-2_hyp5_count-as-fault_bus_x25)) (not (dominates-2_hyp4_count-as-fault_bus_x25)) (not (dominates-2_hyp3_count-as-fault_bus_x25)) (not (dominates-2_hyp2_count-as-fault_bus_x25)) (not (dominates-2_hyp1_count-as-fault_bus_x25))))
 (:action bus-voltage-goes-normal-unexplained_bus_x47_obs8896_n0_n1
  :parameters ()
  :precondition (and (pending_obs8896) (fault-count-2_count-as-fault_bus_x47_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8896) (fault-count-2_count-as-fault_bus_x47_n1) (not (pending_obs8896)) (not (fault-count-2_count-as-fault_bus_x47_n0)) (not (dominates-2_hyp5_count-as-fault_bus_x47)) (not (dominates-2_hyp4_count-as-fault_bus_x47)) (not (dominates-2_hyp3_count-as-fault_bus_x47)) (not (dominates-2_hyp2_count-as-fault_bus_x47)) (not (dominates-2_hyp1_count-as-fault_bus_x47))))
 (:action bus-voltage-goes-normal-unexplained_bus_x32_obs8918_n1_n2
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_bus_x32_n1) (pending_obs8918) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (fault-count-2_count-as-fault_bus_x32_n2) (observed_obs8918) (not (fault-count-2_count-as-fault_bus_x32_n1)) (not (dominates-2_hyp5_count-as-fault_bus_x32)) (not (dominates-2_hyp4_count-as-fault_bus_x32)) (not (dominates-2_hyp3_count-as-fault_bus_x32)) (not (dominates-2_hyp2_count-as-fault_bus_x32)) (not (dominates-2_hyp1_count-as-fault_bus_x32)) (not (pending_obs8918))))
 (:action bus-voltage-goes-normal-unexplained_bus_x31_obs8866_n0_n1
  :parameters ()
  :precondition (and (pending_obs8866) (fault-count-2_count-as-fault_bus_x31_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8866) (fault-count-2_count-as-fault_bus_x31_n1) (not (pending_obs8866)) (not (fault-count-2_count-as-fault_bus_x31_n0)) (not (dominates-2_hyp5_count-as-fault_bus_x31)) (not (dominates-2_hyp4_count-as-fault_bus_x31)) (not (dominates-2_hyp3_count-as-fault_bus_x31)) (not (dominates-2_hyp2_count-as-fault_bus_x31)) (not (dominates-2_hyp1_count-as-fault_bus_x31))))
 (:action bus-voltage-goes-normal-unexplained_bus_x36_obs8907_n0_n1
  :parameters ()
  :precondition (and (pending_obs8907) (fault-count-2_count-as-fault_bus_x36_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8907) (fault-count-2_count-as-fault_bus_x36_n1) (not (pending_obs8907)) (not (fault-count-2_count-as-fault_bus_x36_n0)) (not (dominates-2_hyp5_count-as-fault_bus_x36)) (not (dominates-2_hyp4_count-as-fault_bus_x36)) (not (dominates-2_hyp3_count-as-fault_bus_x36)) (not (dominates-2_hyp2_count-as-fault_bus_x36)) (not (dominates-2_hyp1_count-as-fault_bus_x36))))
 (:action bus-mw-goes-to-zero-unexplained_bus_x2_obs8872_n0_n1
  :parameters ()
  :precondition (and (pending_obs8872) (fault-count-2_count-as-fault_bus_x2_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8872) (fault-count-2_count-as-fault_bus_x2_n1) (not (pending_obs8872)) (not (fault-count-2_count-as-fault_bus_x2_n0))))
 (:action bus-mw-goes-to-zero-unexplained_bus_x4_obs8887_n0_n1
  :parameters ()
  :precondition (and (pending_obs8887) (fault-count-2_count-as-fault_bus_x4_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8887) (fault-count-2_count-as-fault_bus_x4_n1) (not (pending_obs8887)) (not (fault-count-2_count-as-fault_bus_x4_n0)) (not (dominates-2_hyp3_count-as-fault_bus_x4)) (not (dominates-2_hyp2_count-as-fault_bus_x4))))
 (:action bus-mw-goes-to-zero-unexplained_bus_x49_obs8882_n0_n1
  :parameters ()
  :precondition (and (pending_obs8882) (fault-count-2_count-as-fault_bus_x49_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8882) (fault-count-2_count-as-fault_bus_x49_n1) (not (pending_obs8882)) (not (fault-count-2_count-as-fault_bus_x49_n0)) (not (dominates-2_hyp5_count-as-fault_bus_x49)) (not (dominates-2_hyp4_count-as-fault_bus_x49)) (not (dominates-2_hyp3_count-as-fault_bus_x49)) (not (dominates-2_hyp2_count-as-fault_bus_x49)) (not (dominates-2_hyp1_count-as-fault_bus_x49))))
 (:action bus-mw-goes-to-zero-when-isolated_bus_x2_obs8872_obs8873
  :parameters ()
  :precondition (and (pending_obs8872) (bus-isolated_bus_x2) (generator-status-is-off_generator_x2_1) (bus-iso-state-changed_bus_x2_obs8873) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8872) (not (pending_obs8872))))
 (:action bus-mw-goes-to-zero-when-isolated_bus_x4_obs8887_obs8885
  :parameters ()
  :precondition (and (pending_obs8887) (bus-isolated_bus_x4) (generator-status-is-off_generator_x4_1) (bus-iso-state-changed_bus_x4_obs8885) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8887) (not (pending_obs8887))))
 (:action line-voltage-goes-to-zero-unexplained-1_line_x29_x30_obs8900_n0_n1
  :parameters ()
  :precondition (and (pending_obs8900) (fault-count-2_count-as-fault_line_x29_x30_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8900) (fault-count-2_count-as-fault_line_x29_x30_n1) (not (pending_obs8900)) (not (fault-count-2_count-as-fault_line_x29_x30_n0)) (not (dominates-2_hyp5_count-as-fault_line_x29_x30)) (not (dominates-2_hyp4_count-as-fault_line_x29_x30)) (not (dominates-2_hyp3_count-as-fault_line_x29_x30)) (not (dominates-2_hyp2_count-as-fault_line_x29_x30)) (not (dominates-2_hyp1_count-as-fault_line_x29_x30))))
 (:action generator-init-status-was-on_generator_x2_1
  :parameters ()
  :precondition (and (generator-status-is-unknown_generator_x2_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (generator-status-is-on_generator_x2_1) (not (generator-status-is-unknown_generator_x2_1))))
 (:action generator-init-status-was-on_generator_x4_1
  :parameters ()
  :precondition (and (generator-status-is-unknown_generator_x4_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (generator-status-is-on_generator_x4_1) (not (generator-status-is-unknown_generator_x4_1))))
 (:action generator-init-status-was-on_generator_x49_1
  :parameters ()
  :precondition (and (generator-status-is-unknown_generator_x49_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (generator-status-is-on_generator_x49_1) (not (generator-status-is-unknown_generator_x49_1))))
 (:action generator-init-status-was-off_generator_x2_1
  :parameters ()
  :precondition (and (generator-status-is-unknown_generator_x2_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (generator-status-is-off_generator_x2_1) (not (generator-status-is-unknown_generator_x2_1))))
 (:action generator-init-status-was-off_generator_x4_1
  :parameters ()
  :precondition (and (generator-status-is-unknown_generator_x4_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (generator-status-is-off_generator_x4_1) (not (generator-status-is-unknown_generator_x4_1))))
 (:action generator-init-status-was-off_generator_x49_1
  :parameters ()
  :precondition (and (generator-status-is-unknown_generator_x49_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (generator-status-is-off_generator_x49_1) (not (generator-status-is-unknown_generator_x49_1))))
 (:action generator-begin-shutdown_generator_x2_1_n0_n1
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x2_1) (fault-count-2_count-as-fault_generator_x2_1_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (generator-status-is-shutting-down_generator_x2_1) (fault-count-2_count-as-fault_generator_x2_1_n1) (not (generator-status-is-on_generator_x2_1)) (not (fault-count-2_count-as-fault_generator_x2_1_n0))))
 (:action generator-begin-shutdown_generator_x2_1_n1_n2
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x2_1) (fault-count-2_count-as-fault_generator_x2_1_n1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (generator-status-is-shutting-down_generator_x2_1) (fault-count-2_count-as-fault_generator_x2_1_n2) (not (generator-status-is-on_generator_x2_1)) (not (fault-count-2_count-as-fault_generator_x2_1_n1))))
 (:action generator-begin-shutdown_generator_x2_1_n2_n3
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x2_1) (fault-count-2_count-as-fault_generator_x2_1_n2) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (generator-status-is-shutting-down_generator_x2_1) (fault-count-2_count-as-fault_generator_x2_1_n3) (not (generator-status-is-on_generator_x2_1)) (not (fault-count-2_count-as-fault_generator_x2_1_n2))))
 (:action generator-begin-shutdown_generator_x2_1_n3_n4
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x2_1) (fault-count-2_count-as-fault_generator_x2_1_n3) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (generator-status-is-shutting-down_generator_x2_1) (fault-count-2_count-as-fault_generator_x2_1_n4) (not (generator-status-is-on_generator_x2_1)) (not (fault-count-2_count-as-fault_generator_x2_1_n3)) (not (dominates-2_hyp5_count-as-fault_generator_x2_1)) (not (dominates-2_hyp2_count-as-fault_generator_x2_1))))
 (:action generator-begin-shutdown_generator_x2_1_n4_n5
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x2_1) (fault-count-2_count-as-fault_generator_x2_1_n4) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (generator-status-is-shutting-down_generator_x2_1) (not (generator-status-is-on_generator_x2_1)) (not (fault-count-2_count-as-fault_generator_x2_1_n4)) (not (dominates-2_hyp4_count-as-fault_generator_x2_1)) (not (dominates-2_hyp3_count-as-fault_generator_x2_1)) (not (dominates-2_hyp1_count-as-fault_generator_x2_1))))
 (:action generator-begin-shutdown_generator_x4_1_n0_n1
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x4_1) (fault-count-2_count-as-fault_generator_x4_1_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (generator-status-is-shutting-down_generator_x4_1) (fault-count-2_count-as-fault_generator_x4_1_n1) (not (generator-status-is-on_generator_x4_1)) (not (fault-count-2_count-as-fault_generator_x4_1_n0))))
 (:action generator-begin-shutdown_generator_x4_1_n1_n2
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x4_1) (fault-count-2_count-as-fault_generator_x4_1_n1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (generator-status-is-shutting-down_generator_x4_1) (fault-count-2_count-as-fault_generator_x4_1_n2) (not (generator-status-is-on_generator_x4_1)) (not (fault-count-2_count-as-fault_generator_x4_1_n1))))
 (:action generator-begin-shutdown_generator_x4_1_n2_n3
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x4_1) (fault-count-2_count-as-fault_generator_x4_1_n2) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (generator-status-is-shutting-down_generator_x4_1) (fault-count-2_count-as-fault_generator_x4_1_n3) (not (generator-status-is-on_generator_x4_1)) (not (fault-count-2_count-as-fault_generator_x4_1_n2)) (not (dominates-2_hyp3_count-as-fault_generator_x4_1)) (not (dominates-2_hyp2_count-as-fault_generator_x4_1)) (not (dominates-2_hyp1_count-as-fault_generator_x4_1))))
 (:action generator-begin-shutdown_generator_x4_1_n3_n4
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x4_1) (fault-count-2_count-as-fault_generator_x4_1_n3) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (generator-status-is-shutting-down_generator_x4_1) (fault-count-2_count-as-fault_generator_x4_1_n4) (not (generator-status-is-on_generator_x4_1)) (not (fault-count-2_count-as-fault_generator_x4_1_n3))))
 (:action generator-begin-shutdown_generator_x4_1_n4_n5
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x4_1) (fault-count-2_count-as-fault_generator_x4_1_n4) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (generator-status-is-shutting-down_generator_x4_1) (not (generator-status-is-on_generator_x4_1)) (not (fault-count-2_count-as-fault_generator_x4_1_n4)) (not (dominates-2_hyp5_count-as-fault_generator_x4_1)) (not (dominates-2_hyp4_count-as-fault_generator_x4_1))))
 (:action generator-begin-shutdown_generator_x49_1_n0_n1
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x49_1) (fault-count-2_count-as-fault_generator_x49_1_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (generator-status-is-shutting-down_generator_x49_1) (fault-count-2_count-as-fault_generator_x49_1_n1) (not (generator-status-is-on_generator_x49_1)) (not (fault-count-2_count-as-fault_generator_x49_1_n0))))
 (:action generator-begin-shutdown_generator_x49_1_n1_n2
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x49_1) (fault-count-2_count-as-fault_generator_x49_1_n1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (generator-status-is-shutting-down_generator_x49_1) (fault-count-2_count-as-fault_generator_x49_1_n2) (not (generator-status-is-on_generator_x49_1)) (not (fault-count-2_count-as-fault_generator_x49_1_n1))))
 (:action generator-begin-shutdown_generator_x49_1_n2_n3
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x49_1) (fault-count-2_count-as-fault_generator_x49_1_n2) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (generator-status-is-shutting-down_generator_x49_1) (fault-count-2_count-as-fault_generator_x49_1_n3) (not (generator-status-is-on_generator_x49_1)) (not (fault-count-2_count-as-fault_generator_x49_1_n2)) (not (dominates-2_hyp5_count-as-fault_generator_x49_1)) (not (dominates-2_hyp4_count-as-fault_generator_x49_1)) (not (dominates-2_hyp3_count-as-fault_generator_x49_1)) (not (dominates-2_hyp2_count-as-fault_generator_x49_1)) (not (dominates-2_hyp1_count-as-fault_generator_x49_1))))
 (:action generator-begin-shutdown_generator_x49_1_n3_n4
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x49_1) (fault-count-2_count-as-fault_generator_x49_1_n3) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (generator-status-is-shutting-down_generator_x49_1) (fault-count-2_count-as-fault_generator_x49_1_n4) (not (generator-status-is-on_generator_x49_1)) (not (fault-count-2_count-as-fault_generator_x49_1_n3))))
 (:action generator-begin-shutdown_generator_x49_1_n4_n5
  :parameters ()
  :precondition (and (generator-status-is-on_generator_x49_1) (fault-count-2_count-as-fault_generator_x49_1_n4) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (generator-status-is-shutting-down_generator_x49_1) (not (generator-status-is-on_generator_x49_1)) (not (fault-count-2_count-as-fault_generator_x49_1_n4))))
 (:action generator-shutdown-breaker-open-breaker-open_generator_x2_1_breaker_x1_x2_bus_x2_breaker_x1_x2_obs8873
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x1_x2) (pending_obs8873) (generator-status-is-shutting-down_generator_x2_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8873) (bus-isolated_bus_x2) (bus-iso-state-changed_bus_x2_obs8873) (not (breaker-state-is-closed_breaker_x1_x2)) (not (pending_obs8873))))
 (:action generator-shutdown-breaker-open-breaker-open_generator_x4_1_breaker_x3_x4_bus_x4_breaker_x3_x4_obs8885
  :parameters ()
  :precondition (and (breaker-state-is-closed_breaker_x3_x4) (pending_obs8885) (generator-status-is-shutting-down_generator_x4_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8885) (bus-isolated_bus_x4) (bus-iso-state-changed_bus_x4_obs8885) (not (breaker-state-is-closed_breaker_x3_x4)) (not (pending_obs8885))))
 (:action generator-shutdown-turn-off_generator_x2_1_obs8886
  :parameters ()
  :precondition (and (generator-status-is-shutting-down_generator_x2_1) (pending_obs8886) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8886) (not (pending_obs8886))))
 (:action generator-shutdown-turn-off_generator_x2_1_obs8919
  :parameters ()
  :precondition (and (generator-status-is-shutting-down_generator_x2_1) (pending_obs8919) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8919) (not (pending_obs8919))))
 (:action generator-shutdown-turn-off_generator_x4_1_obs8903
  :parameters ()
  :precondition (and (generator-status-is-shutting-down_generator_x4_1) (pending_obs8903) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8903) (not (pending_obs8903))))
 (:action generator-shutdown-turn-off_generator_x49_1_obs8869
  :parameters ()
  :precondition (and (generator-status-is-shutting-down_generator_x49_1) (pending_obs8869) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8869) (not (pending_obs8869))))
 (:action generator-shutdown-turn-off_generator_x49_1_obs8901
  :parameters ()
  :precondition (and (generator-status-is-shutting-down_generator_x49_1) (pending_obs8901) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8901) (not (pending_obs8901))))
 (:action generator-shutdown-turn-off_generator_x49_1_obs8911
  :parameters ()
  :precondition (and (generator-status-is-shutting-down_generator_x49_1) (pending_obs8911) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8911) (not (pending_obs8911))))
 (:action generator-shutdown-complete_generator_x2_1
  :parameters ()
  :precondition (and (generator-status-is-shutting-down_generator_x2_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (generator-status-is-off_generator_x2_1) (not (generator-status-is-shutting-down_generator_x2_1))))
 (:action generator-shutdown-complete_generator_x4_1
  :parameters ()
  :precondition (and (generator-status-is-shutting-down_generator_x4_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (generator-status-is-off_generator_x4_1) (not (generator-status-is-shutting-down_generator_x4_1))))
 (:action generator-shutdown-complete_generator_x49_1
  :parameters ()
  :precondition (and (generator-status-is-shutting-down_generator_x49_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (generator-status-is-off_generator_x49_1) (not (generator-status-is-shutting-down_generator_x49_1))))
 (:action generator-begin-startup_generator_x2_1_n0_n1
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x2_1) (fault-count-2_count-as-fault_generator_x2_1_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (fault-count-2_count-as-fault_generator_x2_1_n1) (generator-status-is-starting-up_generator_x2_1) (not (generator-status-is-on_generator_x2_1)) (not (fault-count-2_count-as-fault_generator_x2_1_n0))))
 (:action generator-begin-startup_generator_x2_1_n1_n2
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x2_1) (fault-count-2_count-as-fault_generator_x2_1_n1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (fault-count-2_count-as-fault_generator_x2_1_n2) (generator-status-is-starting-up_generator_x2_1) (not (generator-status-is-on_generator_x2_1)) (not (fault-count-2_count-as-fault_generator_x2_1_n1))))
 (:action generator-begin-startup_generator_x2_1_n2_n3
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x2_1) (fault-count-2_count-as-fault_generator_x2_1_n2) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (fault-count-2_count-as-fault_generator_x2_1_n3) (generator-status-is-starting-up_generator_x2_1) (not (generator-status-is-on_generator_x2_1)) (not (fault-count-2_count-as-fault_generator_x2_1_n2))))
 (:action generator-begin-startup_generator_x2_1_n3_n4
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x2_1) (fault-count-2_count-as-fault_generator_x2_1_n3) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (fault-count-2_count-as-fault_generator_x2_1_n4) (generator-status-is-starting-up_generator_x2_1) (not (generator-status-is-on_generator_x2_1)) (not (fault-count-2_count-as-fault_generator_x2_1_n3)) (not (dominates-2_hyp5_count-as-fault_generator_x2_1)) (not (dominates-2_hyp2_count-as-fault_generator_x2_1))))
 (:action generator-begin-startup_generator_x2_1_n4_n5
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x2_1) (fault-count-2_count-as-fault_generator_x2_1_n4) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (generator-status-is-starting-up_generator_x2_1) (not (generator-status-is-on_generator_x2_1)) (not (fault-count-2_count-as-fault_generator_x2_1_n4)) (not (dominates-2_hyp4_count-as-fault_generator_x2_1)) (not (dominates-2_hyp3_count-as-fault_generator_x2_1)) (not (dominates-2_hyp1_count-as-fault_generator_x2_1))))
 (:action generator-begin-startup_generator_x4_1_n0_n1
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x4_1) (fault-count-2_count-as-fault_generator_x4_1_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (fault-count-2_count-as-fault_generator_x4_1_n1) (generator-status-is-starting-up_generator_x4_1) (not (generator-status-is-on_generator_x4_1)) (not (fault-count-2_count-as-fault_generator_x4_1_n0))))
 (:action generator-begin-startup_generator_x4_1_n1_n2
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x4_1) (fault-count-2_count-as-fault_generator_x4_1_n1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (fault-count-2_count-as-fault_generator_x4_1_n2) (generator-status-is-starting-up_generator_x4_1) (not (generator-status-is-on_generator_x4_1)) (not (fault-count-2_count-as-fault_generator_x4_1_n1))))
 (:action generator-begin-startup_generator_x4_1_n2_n3
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x4_1) (fault-count-2_count-as-fault_generator_x4_1_n2) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (fault-count-2_count-as-fault_generator_x4_1_n3) (generator-status-is-starting-up_generator_x4_1) (not (generator-status-is-on_generator_x4_1)) (not (fault-count-2_count-as-fault_generator_x4_1_n2)) (not (dominates-2_hyp3_count-as-fault_generator_x4_1)) (not (dominates-2_hyp2_count-as-fault_generator_x4_1)) (not (dominates-2_hyp1_count-as-fault_generator_x4_1))))
 (:action generator-begin-startup_generator_x4_1_n3_n4
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x4_1) (fault-count-2_count-as-fault_generator_x4_1_n3) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (fault-count-2_count-as-fault_generator_x4_1_n4) (generator-status-is-starting-up_generator_x4_1) (not (generator-status-is-on_generator_x4_1)) (not (fault-count-2_count-as-fault_generator_x4_1_n3))))
 (:action generator-begin-startup_generator_x4_1_n4_n5
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x4_1) (fault-count-2_count-as-fault_generator_x4_1_n4) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (generator-status-is-starting-up_generator_x4_1) (not (generator-status-is-on_generator_x4_1)) (not (fault-count-2_count-as-fault_generator_x4_1_n4)) (not (dominates-2_hyp5_count-as-fault_generator_x4_1)) (not (dominates-2_hyp4_count-as-fault_generator_x4_1))))
 (:action generator-begin-startup_generator_x49_1_n0_n1
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x49_1) (fault-count-2_count-as-fault_generator_x49_1_n0) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (fault-count-2_count-as-fault_generator_x49_1_n1) (generator-status-is-starting-up_generator_x49_1) (not (generator-status-is-on_generator_x49_1)) (not (fault-count-2_count-as-fault_generator_x49_1_n0))))
 (:action generator-begin-startup_generator_x49_1_n1_n2
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x49_1) (fault-count-2_count-as-fault_generator_x49_1_n1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (fault-count-2_count-as-fault_generator_x49_1_n2) (generator-status-is-starting-up_generator_x49_1) (not (generator-status-is-on_generator_x49_1)) (not (fault-count-2_count-as-fault_generator_x49_1_n1))))
 (:action generator-begin-startup_generator_x49_1_n2_n3
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x49_1) (fault-count-2_count-as-fault_generator_x49_1_n2) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (fault-count-2_count-as-fault_generator_x49_1_n3) (generator-status-is-starting-up_generator_x49_1) (not (generator-status-is-on_generator_x49_1)) (not (fault-count-2_count-as-fault_generator_x49_1_n2)) (not (dominates-2_hyp5_count-as-fault_generator_x49_1)) (not (dominates-2_hyp4_count-as-fault_generator_x49_1)) (not (dominates-2_hyp3_count-as-fault_generator_x49_1)) (not (dominates-2_hyp2_count-as-fault_generator_x49_1)) (not (dominates-2_hyp1_count-as-fault_generator_x49_1))))
 (:action generator-begin-startup_generator_x49_1_n3_n4
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x49_1) (fault-count-2_count-as-fault_generator_x49_1_n3) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (fault-count-2_count-as-fault_generator_x49_1_n4) (generator-status-is-starting-up_generator_x49_1) (not (generator-status-is-on_generator_x49_1)) (not (fault-count-2_count-as-fault_generator_x49_1_n3))))
 (:action generator-begin-startup_generator_x49_1_n4_n5
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x49_1) (fault-count-2_count-as-fault_generator_x49_1_n4) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (generator-status-is-starting-up_generator_x49_1) (not (generator-status-is-on_generator_x49_1)) (not (fault-count-2_count-as-fault_generator_x49_1_n4))))
 (:action generator-startup-complete_generator_x2_1
  :parameters ()
  :precondition (and (generator-status-is-starting-up_generator_x2_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (generator-status-is-on_generator_x2_1) (not (generator-status-is-starting-up_generator_x2_1))))
 (:action generator-startup-complete_generator_x4_1
  :parameters ()
  :precondition (and (generator-status-is-starting-up_generator_x4_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (generator-status-is-on_generator_x4_1) (not (generator-status-is-starting-up_generator_x4_1))))
 (:action generator-startup-complete_generator_x49_1
  :parameters ()
  :precondition (and (generator-status-is-starting-up_generator_x49_1) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (generator-status-is-on_generator_x49_1) (not (generator-status-is-starting-up_generator_x49_1))))
 (:action generator-runback-alarm_generator_x2_1_obs8865_n0_n1
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x2_1_n0) (pending_obs8865) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (fault-count-2_count-as-fault_generator_x2_1_n1) (observed_obs8865) (not (fault-count-2_count-as-fault_generator_x2_1_n0)) (not (pending_obs8865))))
 (:action generator-runback-alarm_generator_x2_1_obs8865_n1_n2
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x2_1_n1) (pending_obs8865) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (fault-count-2_count-as-fault_generator_x2_1_n2) (observed_obs8865) (not (fault-count-2_count-as-fault_generator_x2_1_n1)) (not (pending_obs8865))))
 (:action generator-runback-alarm_generator_x2_1_obs8865_n2_n3
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x2_1_n2) (pending_obs8865) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (fault-count-2_count-as-fault_generator_x2_1_n3) (observed_obs8865) (not (fault-count-2_count-as-fault_generator_x2_1_n2)) (not (pending_obs8865))))
 (:action generator-runback-alarm_generator_x2_1_obs8865_n3_n4
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x2_1_n3) (pending_obs8865) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (fault-count-2_count-as-fault_generator_x2_1_n4) (observed_obs8865) (not (fault-count-2_count-as-fault_generator_x2_1_n3)) (not (dominates-2_hyp5_count-as-fault_generator_x2_1)) (not (dominates-2_hyp2_count-as-fault_generator_x2_1)) (not (pending_obs8865))))
 (:action generator-runback-alarm_generator_x2_1_obs8865_n4_n5
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x2_1_n4) (pending_obs8865) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8865) (not (fault-count-2_count-as-fault_generator_x2_1_n4)) (not (dominates-2_hyp4_count-as-fault_generator_x2_1)) (not (dominates-2_hyp3_count-as-fault_generator_x2_1)) (not (dominates-2_hyp1_count-as-fault_generator_x2_1)) (not (pending_obs8865))))
 (:action generator-runback-alarm_generator_x2_1_obs8889_n1_n2
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x2_1_n1) (pending_obs8889) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (fault-count-2_count-as-fault_generator_x2_1_n2) (observed_obs8889) (not (fault-count-2_count-as-fault_generator_x2_1_n1)) (not (pending_obs8889))))
 (:action generator-runback-alarm_generator_x2_1_obs8889_n2_n3
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x2_1_n2) (pending_obs8889) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (fault-count-2_count-as-fault_generator_x2_1_n3) (observed_obs8889) (not (fault-count-2_count-as-fault_generator_x2_1_n2)) (not (pending_obs8889))))
 (:action generator-runback-alarm_generator_x2_1_obs8889_n3_n4
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x2_1_n3) (pending_obs8889) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (fault-count-2_count-as-fault_generator_x2_1_n4) (observed_obs8889) (not (fault-count-2_count-as-fault_generator_x2_1_n3)) (not (dominates-2_hyp5_count-as-fault_generator_x2_1)) (not (dominates-2_hyp2_count-as-fault_generator_x2_1)) (not (pending_obs8889))))
 (:action generator-runback-alarm_generator_x2_1_obs8889_n4_n5
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x2_1_n4) (pending_obs8889) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8889) (not (fault-count-2_count-as-fault_generator_x2_1_n4)) (not (dominates-2_hyp4_count-as-fault_generator_x2_1)) (not (dominates-2_hyp3_count-as-fault_generator_x2_1)) (not (dominates-2_hyp1_count-as-fault_generator_x2_1)) (not (pending_obs8889))))
 (:action generator-runback-alarm_generator_x4_1_obs8868_n0_n1
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x4_1_n0) (pending_obs8868) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (fault-count-2_count-as-fault_generator_x4_1_n1) (observed_obs8868) (not (fault-count-2_count-as-fault_generator_x4_1_n0)) (not (pending_obs8868))))
 (:action generator-runback-alarm_generator_x4_1_obs8868_n1_n2
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x4_1_n1) (pending_obs8868) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (fault-count-2_count-as-fault_generator_x4_1_n2) (observed_obs8868) (not (fault-count-2_count-as-fault_generator_x4_1_n1)) (not (pending_obs8868))))
 (:action generator-runback-alarm_generator_x4_1_obs8868_n2_n3
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x4_1_n2) (pending_obs8868) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (fault-count-2_count-as-fault_generator_x4_1_n3) (observed_obs8868) (not (fault-count-2_count-as-fault_generator_x4_1_n2)) (not (dominates-2_hyp3_count-as-fault_generator_x4_1)) (not (dominates-2_hyp2_count-as-fault_generator_x4_1)) (not (dominates-2_hyp1_count-as-fault_generator_x4_1)) (not (pending_obs8868))))
 (:action generator-runback-alarm_generator_x4_1_obs8868_n3_n4
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x4_1_n3) (pending_obs8868) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (fault-count-2_count-as-fault_generator_x4_1_n4) (observed_obs8868) (not (fault-count-2_count-as-fault_generator_x4_1_n3)) (not (pending_obs8868))))
 (:action generator-runback-alarm_generator_x4_1_obs8868_n4_n5
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x4_1_n4) (pending_obs8868) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8868) (not (fault-count-2_count-as-fault_generator_x4_1_n4)) (not (dominates-2_hyp5_count-as-fault_generator_x4_1)) (not (dominates-2_hyp4_count-as-fault_generator_x4_1)) (not (pending_obs8868))))
 (:action generator-runback-alarm_generator_x49_1_obs8906_n1_n2
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x49_1_n1) (pending_obs8906) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (fault-count-2_count-as-fault_generator_x49_1_n2) (observed_obs8906) (not (fault-count-2_count-as-fault_generator_x49_1_n1)) (not (pending_obs8906))))
 (:action generator-runback-alarm_generator_x49_1_obs8906_n2_n3
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x49_1_n2) (pending_obs8906) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (fault-count-2_count-as-fault_generator_x49_1_n3) (observed_obs8906) (not (fault-count-2_count-as-fault_generator_x49_1_n2)) (not (dominates-2_hyp5_count-as-fault_generator_x49_1)) (not (dominates-2_hyp4_count-as-fault_generator_x49_1)) (not (dominates-2_hyp3_count-as-fault_generator_x49_1)) (not (dominates-2_hyp2_count-as-fault_generator_x49_1)) (not (dominates-2_hyp1_count-as-fault_generator_x49_1)) (not (pending_obs8906))))
 (:action generator-runback-alarm_generator_x49_1_obs8906_n3_n4
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x49_1_n3) (pending_obs8906) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (fault-count-2_count-as-fault_generator_x49_1_n4) (observed_obs8906) (not (fault-count-2_count-as-fault_generator_x49_1_n3)) (not (pending_obs8906))))
 (:action generator-runback-alarm_generator_x49_1_obs8906_n4_n5
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x49_1_n4) (pending_obs8906) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8906) (not (fault-count-2_count-as-fault_generator_x49_1_n4)) (not (pending_obs8906))))
 (:action generator-runback-alarm-reset_generator_x2_1_obs8870_n0_n1
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x2_1_n0) (pending_obs8870) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (fault-count-2_count-as-fault_generator_x2_1_n1) (observed_obs8870) (not (fault-count-2_count-as-fault_generator_x2_1_n0)) (not (pending_obs8870))))
 (:action generator-runback-alarm-reset_generator_x2_1_obs8870_n1_n2
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x2_1_n1) (pending_obs8870) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (fault-count-2_count-as-fault_generator_x2_1_n2) (observed_obs8870) (not (fault-count-2_count-as-fault_generator_x2_1_n1)) (not (pending_obs8870))))
 (:action generator-runback-alarm-reset_generator_x2_1_obs8870_n2_n3
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x2_1_n2) (pending_obs8870) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (fault-count-2_count-as-fault_generator_x2_1_n3) (observed_obs8870) (not (fault-count-2_count-as-fault_generator_x2_1_n2)) (not (pending_obs8870))))
 (:action generator-runback-alarm-reset_generator_x2_1_obs8870_n3_n4
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x2_1_n3) (pending_obs8870) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (fault-count-2_count-as-fault_generator_x2_1_n4) (observed_obs8870) (not (fault-count-2_count-as-fault_generator_x2_1_n3)) (not (dominates-2_hyp5_count-as-fault_generator_x2_1)) (not (dominates-2_hyp2_count-as-fault_generator_x2_1)) (not (pending_obs8870))))
 (:action generator-runback-alarm-reset_generator_x2_1_obs8870_n4_n5
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x2_1_n4) (pending_obs8870) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8870) (not (fault-count-2_count-as-fault_generator_x2_1_n4)) (not (dominates-2_hyp4_count-as-fault_generator_x2_1)) (not (dominates-2_hyp3_count-as-fault_generator_x2_1)) (not (dominates-2_hyp1_count-as-fault_generator_x2_1)) (not (pending_obs8870))))
 (:action generator-runback-alarm-reset_generator_x2_1_obs8891_n1_n2
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x2_1_n1) (pending_obs8891) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (fault-count-2_count-as-fault_generator_x2_1_n2) (observed_obs8891) (not (fault-count-2_count-as-fault_generator_x2_1_n1)) (not (pending_obs8891))))
 (:action generator-runback-alarm-reset_generator_x2_1_obs8891_n2_n3
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x2_1_n2) (pending_obs8891) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (fault-count-2_count-as-fault_generator_x2_1_n3) (observed_obs8891) (not (fault-count-2_count-as-fault_generator_x2_1_n2)) (not (pending_obs8891))))
 (:action generator-runback-alarm-reset_generator_x2_1_obs8891_n3_n4
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x2_1_n3) (pending_obs8891) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (fault-count-2_count-as-fault_generator_x2_1_n4) (observed_obs8891) (not (fault-count-2_count-as-fault_generator_x2_1_n3)) (not (dominates-2_hyp5_count-as-fault_generator_x2_1)) (not (dominates-2_hyp2_count-as-fault_generator_x2_1)) (not (pending_obs8891))))
 (:action generator-runback-alarm-reset_generator_x2_1_obs8891_n4_n5
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x2_1_n4) (pending_obs8891) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8891) (not (fault-count-2_count-as-fault_generator_x2_1_n4)) (not (dominates-2_hyp4_count-as-fault_generator_x2_1)) (not (dominates-2_hyp3_count-as-fault_generator_x2_1)) (not (dominates-2_hyp1_count-as-fault_generator_x2_1)) (not (pending_obs8891))))
 (:action generator-runback-alarm-reset_generator_x4_1_obs8881_n1_n2
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x4_1_n1) (pending_obs8881) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (fault-count-2_count-as-fault_generator_x4_1_n2) (observed_obs8881) (not (fault-count-2_count-as-fault_generator_x4_1_n1)) (not (pending_obs8881))))
 (:action generator-runback-alarm-reset_generator_x4_1_obs8881_n2_n3
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x4_1_n2) (pending_obs8881) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (fault-count-2_count-as-fault_generator_x4_1_n3) (observed_obs8881) (not (fault-count-2_count-as-fault_generator_x4_1_n2)) (not (dominates-2_hyp3_count-as-fault_generator_x4_1)) (not (dominates-2_hyp2_count-as-fault_generator_x4_1)) (not (dominates-2_hyp1_count-as-fault_generator_x4_1)) (not (pending_obs8881))))
 (:action generator-runback-alarm-reset_generator_x4_1_obs8881_n3_n4
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x4_1_n3) (pending_obs8881) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (fault-count-2_count-as-fault_generator_x4_1_n4) (observed_obs8881) (not (fault-count-2_count-as-fault_generator_x4_1_n3)) (not (pending_obs8881))))
 (:action generator-runback-alarm-reset_generator_x4_1_obs8881_n4_n5
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x4_1_n4) (pending_obs8881) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8881) (not (fault-count-2_count-as-fault_generator_x4_1_n4)) (not (dominates-2_hyp5_count-as-fault_generator_x4_1)) (not (dominates-2_hyp4_count-as-fault_generator_x4_1)) (not (pending_obs8881))))
 (:action generator-runback-alarm-reset_generator_x4_1_obs8910_n1_n2
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x4_1_n1) (pending_obs8910) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (fault-count-2_count-as-fault_generator_x4_1_n2) (observed_obs8910) (not (fault-count-2_count-as-fault_generator_x4_1_n1)) (not (pending_obs8910))))
 (:action generator-runback-alarm-reset_generator_x4_1_obs8910_n2_n3
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x4_1_n2) (pending_obs8910) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (fault-count-2_count-as-fault_generator_x4_1_n3) (observed_obs8910) (not (fault-count-2_count-as-fault_generator_x4_1_n2)) (not (dominates-2_hyp3_count-as-fault_generator_x4_1)) (not (dominates-2_hyp2_count-as-fault_generator_x4_1)) (not (dominates-2_hyp1_count-as-fault_generator_x4_1)) (not (pending_obs8910))))
 (:action generator-runback-alarm-reset_generator_x4_1_obs8910_n3_n4
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x4_1_n3) (pending_obs8910) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (fault-count-2_count-as-fault_generator_x4_1_n4) (observed_obs8910) (not (fault-count-2_count-as-fault_generator_x4_1_n3)) (not (pending_obs8910))))
 (:action generator-runback-alarm-reset_generator_x4_1_obs8910_n4_n5
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x4_1_n4) (pending_obs8910) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8910) (not (fault-count-2_count-as-fault_generator_x4_1_n4)) (not (dominates-2_hyp5_count-as-fault_generator_x4_1)) (not (dominates-2_hyp4_count-as-fault_generator_x4_1)) (not (pending_obs8910))))
 (:action generator-runback-alarm-reset_generator_x49_1_obs8874_n0_n1
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x49_1_n0) (pending_obs8874) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (fault-count-2_count-as-fault_generator_x49_1_n1) (observed_obs8874) (not (fault-count-2_count-as-fault_generator_x49_1_n0)) (not (pending_obs8874))))
 (:action generator-runback-alarm-reset_generator_x49_1_obs8874_n1_n2
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x49_1_n1) (pending_obs8874) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (fault-count-2_count-as-fault_generator_x49_1_n2) (observed_obs8874) (not (fault-count-2_count-as-fault_generator_x49_1_n1)) (not (pending_obs8874))))
 (:action generator-runback-alarm-reset_generator_x49_1_obs8874_n2_n3
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x49_1_n2) (pending_obs8874) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (fault-count-2_count-as-fault_generator_x49_1_n3) (observed_obs8874) (not (fault-count-2_count-as-fault_generator_x49_1_n2)) (not (dominates-2_hyp5_count-as-fault_generator_x49_1)) (not (dominates-2_hyp4_count-as-fault_generator_x49_1)) (not (dominates-2_hyp3_count-as-fault_generator_x49_1)) (not (dominates-2_hyp2_count-as-fault_generator_x49_1)) (not (dominates-2_hyp1_count-as-fault_generator_x49_1)) (not (pending_obs8874))))
 (:action generator-runback-alarm-reset_generator_x49_1_obs8874_n3_n4
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x49_1_n3) (pending_obs8874) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (fault-count-2_count-as-fault_generator_x49_1_n4) (observed_obs8874) (not (fault-count-2_count-as-fault_generator_x49_1_n3)) (not (pending_obs8874))))
 (:action generator-runback-alarm-reset_generator_x49_1_obs8874_n4_n5
  :parameters ()
  :precondition (and (fault-count-2_count-as-fault_generator_x49_1_n4) (pending_obs8874) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8874) (not (fault-count-2_count-as-fault_generator_x49_1_n4)) (not (pending_obs8874))))
 (:action generator-runback-reset-when-off_generator_x2_1_obs8870
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x2_1) (pending_obs8870) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8870) (not (pending_obs8870))))
 (:action generator-runback-reset-when-off_generator_x2_1_obs8891
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x2_1) (pending_obs8891) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8891) (not (pending_obs8891))))
 (:action generator-runback-reset-when-off_generator_x4_1_obs8881
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x4_1) (pending_obs8881) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8881) (not (pending_obs8881))))
 (:action generator-runback-reset-when-off_generator_x4_1_obs8910
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x4_1) (pending_obs8910) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8910) (not (pending_obs8910))))
 (:action generator-runback-reset-when-off_generator_x49_1_obs8874
  :parameters ()
  :precondition (and (generator-status-is-off_generator_x49_1) (pending_obs8874) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (observed_obs8874) (not (pending_obs8874))))
 (:action advance-to-obs_obs8861
  :parameters ()
  :precondition (and (observed_obs8860) (future_obs8861) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8861) (not (future_obs8861))))
 (:action advance-to-obs_obs8862
  :parameters ()
  :precondition (and (observed_obs8861) (future_obs8862) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8862) (not (future_obs8862))))
 (:action advance-to-obs_obs8863
  :parameters ()
  :precondition (and (observed_obs8862) (future_obs8863) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8863) (not (future_obs8863))))
 (:action advance-to-obs_obs8864
  :parameters ()
  :precondition (and (observed_obs8863) (future_obs8864) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8864) (not (future_obs8864))))
 (:action advance-to-obs_obs8865
  :parameters ()
  :precondition (and (observed_obs8863) (future_obs8865) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8865) (not (future_obs8865))))
 (:action advance-to-obs_obs8866
  :parameters ()
  :precondition (and (observed_obs8863) (future_obs8866) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8866) (not (future_obs8866))))
 (:action advance-to-obs_obs8867
  :parameters ()
  :precondition (and (observed_obs8863) (future_obs8867) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8867) (not (future_obs8867))))
 (:action advance-to-obs_obs8868
  :parameters ()
  :precondition (and (observed_obs8863) (future_obs8868) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8868) (not (future_obs8868))))
 (:action advance-to-obs_obs8869
  :parameters ()
  :precondition (and (observed_obs8863) (future_obs8869) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8869) (not (future_obs8869))))
 (:action advance-to-obs_obs8870
  :parameters ()
  :precondition (and (observed_obs8863) (future_obs8870) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8870) (not (future_obs8870))))
 (:action advance-to-obs_obs8871
  :parameters ()
  :precondition (and (observed_obs8863) (future_obs8871) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8871) (not (future_obs8871))))
 (:action advance-to-obs_obs8872
  :parameters ()
  :precondition (and (observed_obs8863) (future_obs8872) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8872) (not (future_obs8872))))
 (:action advance-to-obs_obs8873
  :parameters ()
  :precondition (and (observed_obs8863) (future_obs8873) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8873) (not (future_obs8873))))
 (:action advance-to-obs_obs8874
  :parameters ()
  :precondition (and (observed_obs8863) (future_obs8874) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8874) (not (future_obs8874))))
 (:action advance-to-obs_obs8875
  :parameters ()
  :precondition (and (observed_obs8873) (observed_obs8871) (observed_obs8867) (observed_obs8864) (observed_obs8866) (observed_obs8872) (observed_obs8869) (observed_obs8865) (observed_obs8868) (observed_obs8870) (observed_obs8874) (future_obs8875) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8875) (not (future_obs8875))))
 (:action advance-to-obs_obs8876
  :parameters ()
  :precondition (and (observed_obs8873) (observed_obs8871) (observed_obs8867) (observed_obs8864) (observed_obs8866) (observed_obs8872) (observed_obs8869) (observed_obs8865) (observed_obs8868) (observed_obs8870) (observed_obs8874) (future_obs8876) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8876) (not (future_obs8876))))
 (:action advance-to-obs_obs8877
  :parameters ()
  :precondition (and (observed_obs8873) (observed_obs8871) (observed_obs8867) (observed_obs8864) (observed_obs8866) (observed_obs8872) (observed_obs8869) (observed_obs8865) (observed_obs8868) (observed_obs8870) (observed_obs8874) (future_obs8877) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8877) (not (future_obs8877))))
 (:action advance-to-obs_obs8878
  :parameters ()
  :precondition (and (observed_obs8873) (observed_obs8871) (observed_obs8867) (observed_obs8864) (observed_obs8866) (observed_obs8872) (observed_obs8869) (observed_obs8865) (observed_obs8868) (observed_obs8870) (observed_obs8874) (future_obs8878) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8878) (not (future_obs8878))))
 (:action advance-to-obs_obs8879
  :parameters ()
  :precondition (and (observed_obs8873) (observed_obs8871) (observed_obs8867) (observed_obs8864) (observed_obs8866) (observed_obs8872) (observed_obs8869) (observed_obs8865) (observed_obs8868) (observed_obs8870) (observed_obs8874) (future_obs8879) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8879) (not (future_obs8879))))
 (:action advance-to-obs_obs8880
  :parameters ()
  :precondition (and (observed_obs8873) (observed_obs8871) (observed_obs8867) (observed_obs8864) (observed_obs8866) (observed_obs8872) (observed_obs8869) (observed_obs8865) (observed_obs8868) (observed_obs8870) (observed_obs8874) (future_obs8880) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8880) (not (future_obs8880))))
 (:action advance-to-obs_obs8881
  :parameters ()
  :precondition (and (observed_obs8873) (observed_obs8871) (observed_obs8867) (observed_obs8864) (observed_obs8866) (observed_obs8872) (observed_obs8869) (observed_obs8865) (observed_obs8868) (observed_obs8870) (observed_obs8874) (future_obs8881) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8881) (not (future_obs8881))))
 (:action advance-to-obs_obs8882
  :parameters ()
  :precondition (and (observed_obs8879) (observed_obs8877) (observed_obs8875) (observed_obs8880) (observed_obs8876) (observed_obs8878) (observed_obs8881) (future_obs8882) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8882) (not (future_obs8882))))
 (:action advance-to-obs_obs8883
  :parameters ()
  :precondition (and (observed_obs8879) (observed_obs8877) (observed_obs8875) (observed_obs8880) (observed_obs8876) (observed_obs8878) (observed_obs8881) (future_obs8883) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8883) (not (future_obs8883))))
 (:action advance-to-obs_obs8884
  :parameters ()
  :precondition (and (observed_obs8879) (observed_obs8877) (observed_obs8875) (observed_obs8880) (observed_obs8876) (observed_obs8878) (observed_obs8881) (future_obs8884) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8884) (not (future_obs8884))))
 (:action advance-to-obs_obs8885
  :parameters ()
  :precondition (and (observed_obs8879) (observed_obs8877) (observed_obs8875) (observed_obs8880) (observed_obs8876) (observed_obs8878) (observed_obs8881) (future_obs8885) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8885) (not (future_obs8885))))
 (:action advance-to-obs_obs8886
  :parameters ()
  :precondition (and (observed_obs8879) (observed_obs8877) (observed_obs8875) (observed_obs8880) (observed_obs8876) (observed_obs8878) (observed_obs8881) (future_obs8886) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8886) (not (future_obs8886))))
 (:action advance-to-obs_obs8887
  :parameters ()
  :precondition (and (observed_obs8879) (observed_obs8877) (observed_obs8875) (observed_obs8880) (observed_obs8876) (observed_obs8878) (observed_obs8881) (future_obs8887) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8887) (not (future_obs8887))))
 (:action advance-to-obs_obs8888
  :parameters ()
  :precondition (and (observed_obs8879) (observed_obs8877) (observed_obs8875) (observed_obs8880) (observed_obs8876) (observed_obs8878) (observed_obs8881) (future_obs8888) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8888) (not (future_obs8888))))
 (:action advance-to-obs_obs8889
  :parameters ()
  :precondition (and (observed_obs8879) (observed_obs8877) (observed_obs8875) (observed_obs8880) (observed_obs8876) (observed_obs8878) (observed_obs8881) (future_obs8889) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8889) (not (future_obs8889))))
 (:action advance-to-obs_obs8890
  :parameters ()
  :precondition (and (observed_obs8879) (observed_obs8877) (observed_obs8875) (observed_obs8880) (observed_obs8876) (observed_obs8878) (observed_obs8881) (future_obs8890) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8890) (not (future_obs8890))))
 (:action advance-to-obs_obs8891
  :parameters ()
  :precondition (and (observed_obs8879) (observed_obs8877) (observed_obs8875) (observed_obs8880) (observed_obs8876) (observed_obs8878) (observed_obs8881) (future_obs8891) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8891) (not (future_obs8891))))
 (:action advance-to-obs_obs8892
  :parameters ()
  :precondition (and (observed_obs8879) (observed_obs8877) (observed_obs8875) (observed_obs8880) (observed_obs8876) (observed_obs8878) (observed_obs8881) (future_obs8892) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8892) (not (future_obs8892))))
 (:action advance-to-obs_obs8893
  :parameters ()
  :precondition (and (observed_obs8885) (observed_obs8890) (observed_obs8892) (observed_obs8888) (observed_obs8883) (observed_obs8884) (observed_obs8887) (observed_obs8882) (observed_obs8886) (observed_obs8889) (observed_obs8891) (future_obs8893) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8893) (not (future_obs8893))))
 (:action advance-to-obs_obs8894
  :parameters ()
  :precondition (and (observed_obs8885) (observed_obs8890) (observed_obs8892) (observed_obs8888) (observed_obs8883) (observed_obs8884) (observed_obs8887) (observed_obs8882) (observed_obs8886) (observed_obs8889) (observed_obs8891) (future_obs8894) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8894) (not (future_obs8894))))
 (:action advance-to-obs_obs8895
  :parameters ()
  :precondition (and (observed_obs8885) (observed_obs8890) (observed_obs8892) (observed_obs8888) (observed_obs8883) (observed_obs8884) (observed_obs8887) (observed_obs8882) (observed_obs8886) (observed_obs8889) (observed_obs8891) (future_obs8895) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8895) (not (future_obs8895))))
 (:action advance-to-obs_obs8896
  :parameters ()
  :precondition (and (observed_obs8885) (observed_obs8890) (observed_obs8892) (observed_obs8888) (observed_obs8883) (observed_obs8884) (observed_obs8887) (observed_obs8882) (observed_obs8886) (observed_obs8889) (observed_obs8891) (future_obs8896) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8896) (not (future_obs8896))))
 (:action advance-to-obs_obs8897
  :parameters ()
  :precondition (and (observed_obs8885) (observed_obs8890) (observed_obs8892) (observed_obs8888) (observed_obs8883) (observed_obs8884) (observed_obs8887) (observed_obs8882) (observed_obs8886) (observed_obs8889) (observed_obs8891) (future_obs8897) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8897) (not (future_obs8897))))
 (:action advance-to-obs_obs8898
  :parameters ()
  :precondition (and (observed_obs8885) (observed_obs8890) (observed_obs8892) (observed_obs8888) (observed_obs8883) (observed_obs8884) (observed_obs8887) (observed_obs8882) (observed_obs8886) (observed_obs8889) (observed_obs8891) (future_obs8898) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8898) (not (future_obs8898))))
 (:action advance-to-obs_obs8899
  :parameters ()
  :precondition (and (observed_obs8885) (observed_obs8890) (observed_obs8892) (observed_obs8888) (observed_obs8883) (observed_obs8884) (observed_obs8887) (observed_obs8882) (observed_obs8886) (observed_obs8889) (observed_obs8891) (future_obs8899) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8899) (not (future_obs8899))))
 (:action advance-to-obs_obs8900
  :parameters ()
  :precondition (and (observed_obs8885) (observed_obs8890) (observed_obs8892) (observed_obs8888) (observed_obs8883) (observed_obs8884) (observed_obs8887) (observed_obs8882) (observed_obs8886) (observed_obs8889) (observed_obs8891) (future_obs8900) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8900) (not (future_obs8900))))
 (:action advance-to-obs_obs8901
  :parameters ()
  :precondition (and (observed_obs8885) (observed_obs8890) (observed_obs8892) (observed_obs8888) (observed_obs8883) (observed_obs8884) (observed_obs8887) (observed_obs8882) (observed_obs8886) (observed_obs8889) (observed_obs8891) (future_obs8901) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8901) (not (future_obs8901))))
 (:action advance-to-obs_obs8902
  :parameters ()
  :precondition (and (observed_obs8894) (observed_obs8895) (observed_obs8899) (observed_obs8893) (observed_obs8897) (observed_obs8898) (observed_obs8896) (observed_obs8900) (observed_obs8901) (future_obs8902) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8902) (not (future_obs8902))))
 (:action advance-to-obs_obs8903
  :parameters ()
  :precondition (and (observed_obs8894) (observed_obs8895) (observed_obs8899) (observed_obs8893) (observed_obs8897) (observed_obs8898) (observed_obs8896) (observed_obs8900) (observed_obs8901) (future_obs8903) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8903) (not (future_obs8903))))
 (:action advance-to-obs_obs8904
  :parameters ()
  :precondition (and (observed_obs8894) (observed_obs8895) (observed_obs8899) (observed_obs8893) (observed_obs8897) (observed_obs8898) (observed_obs8896) (observed_obs8900) (observed_obs8901) (future_obs8904) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8904) (not (future_obs8904))))
 (:action advance-to-obs_obs8905
  :parameters ()
  :precondition (and (observed_obs8894) (observed_obs8895) (observed_obs8899) (observed_obs8893) (observed_obs8897) (observed_obs8898) (observed_obs8896) (observed_obs8900) (observed_obs8901) (future_obs8905) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8905) (not (future_obs8905))))
 (:action advance-to-obs_obs8906
  :parameters ()
  :precondition (and (observed_obs8894) (observed_obs8895) (observed_obs8899) (observed_obs8893) (observed_obs8897) (observed_obs8898) (observed_obs8896) (observed_obs8900) (observed_obs8901) (future_obs8906) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8906) (not (future_obs8906))))
 (:action advance-to-obs_obs8907
  :parameters ()
  :precondition (and (observed_obs8894) (observed_obs8895) (observed_obs8899) (observed_obs8893) (observed_obs8897) (observed_obs8898) (observed_obs8896) (observed_obs8900) (observed_obs8901) (future_obs8907) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8907) (not (future_obs8907))))
 (:action advance-to-obs_obs8908
  :parameters ()
  :precondition (and (observed_obs8894) (observed_obs8895) (observed_obs8899) (observed_obs8893) (observed_obs8897) (observed_obs8898) (observed_obs8896) (observed_obs8900) (observed_obs8901) (future_obs8908) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8908) (not (future_obs8908))))
 (:action advance-to-obs_obs8909
  :parameters ()
  :precondition (and (observed_obs8894) (observed_obs8895) (observed_obs8899) (observed_obs8893) (observed_obs8897) (observed_obs8898) (observed_obs8896) (observed_obs8900) (observed_obs8901) (future_obs8909) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8909) (not (future_obs8909))))
 (:action advance-to-obs_obs8910
  :parameters ()
  :precondition (and (observed_obs8894) (observed_obs8895) (observed_obs8899) (observed_obs8893) (observed_obs8897) (observed_obs8898) (observed_obs8896) (observed_obs8900) (observed_obs8901) (future_obs8910) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8910) (not (future_obs8910))))
 (:action advance-to-obs_obs8911
  :parameters ()
  :precondition (and (observed_obs8894) (observed_obs8895) (observed_obs8899) (observed_obs8893) (observed_obs8897) (observed_obs8898) (observed_obs8896) (observed_obs8900) (observed_obs8901) (future_obs8911) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8911) (not (future_obs8911))))
 (:action advance-to-obs_obs8912
  :parameters ()
  :precondition (and (observed_obs8894) (observed_obs8895) (observed_obs8899) (observed_obs8893) (observed_obs8897) (observed_obs8898) (observed_obs8896) (observed_obs8900) (observed_obs8901) (future_obs8912) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8912) (not (future_obs8912))))
 (:action advance-to-obs_obs8913
  :parameters ()
  :precondition (and (observed_obs8894) (observed_obs8895) (observed_obs8899) (observed_obs8893) (observed_obs8897) (observed_obs8898) (observed_obs8896) (observed_obs8900) (observed_obs8901) (future_obs8913) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8913) (not (future_obs8913))))
 (:action advance-to-obs_obs8914
  :parameters ()
  :precondition (and (observed_obs8894) (observed_obs8895) (observed_obs8899) (observed_obs8893) (observed_obs8897) (observed_obs8898) (observed_obs8896) (observed_obs8900) (observed_obs8901) (future_obs8914) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8914) (not (future_obs8914))))
 (:action advance-to-obs_obs8915
  :parameters ()
  :precondition (and (observed_obs8894) (observed_obs8895) (observed_obs8899) (observed_obs8893) (observed_obs8897) (observed_obs8898) (observed_obs8896) (observed_obs8900) (observed_obs8901) (future_obs8915) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8915) (not (future_obs8915))))
 (:action advance-to-obs_obs8916
  :parameters ()
  :precondition (and (observed_obs8905) (observed_obs8915) (observed_obs8908) (observed_obs8904) (observed_obs8909) (observed_obs8912) (observed_obs8913) (observed_obs8914) (observed_obs8902) (observed_obs8907) (observed_obs8903) (observed_obs8911) (observed_obs8906) (observed_obs8910) (future_obs8916) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8916) (not (future_obs8916))))
 (:action advance-to-obs_obs8917
  :parameters ()
  :precondition (and (observed_obs8905) (observed_obs8915) (observed_obs8908) (observed_obs8904) (observed_obs8909) (observed_obs8912) (observed_obs8913) (observed_obs8914) (observed_obs8902) (observed_obs8907) (observed_obs8903) (observed_obs8911) (observed_obs8906) (observed_obs8910) (future_obs8917) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8917) (not (future_obs8917))))
 (:action advance-to-obs_obs8918
  :parameters ()
  :precondition (and (observed_obs8905) (observed_obs8915) (observed_obs8908) (observed_obs8904) (observed_obs8909) (observed_obs8912) (observed_obs8913) (observed_obs8914) (observed_obs8902) (observed_obs8907) (observed_obs8903) (observed_obs8911) (observed_obs8906) (observed_obs8910) (future_obs8918) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8918) (not (future_obs8918))))
 (:action advance-to-obs_obs8919
  :parameters ()
  :precondition (and (observed_obs8905) (observed_obs8915) (observed_obs8908) (observed_obs8904) (observed_obs8909) (observed_obs8912) (observed_obs8913) (observed_obs8914) (observed_obs8902) (observed_obs8907) (observed_obs8903) (observed_obs8911) (observed_obs8906) (observed_obs8910) (future_obs8919) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (pending_obs8919) (not (future_obs8919))))
 (:action set_goal_0_constraint0
  :parameters ()
  :precondition (and (observed_obs8873) (dominates-2_hyp5_count-as-fault_breaker_x1_x2) (observed_obs8885) (observed_obs8879) (observed_obs8894) (observed_obs8905) (observed_obs8895) (observed_obs8877) (observed_obs8890) (observed_obs8871) (observed_obs8915) (observed_obs8892) (observed_obs8875) (observed_obs8867) (observed_obs8908) (observed_obs8880) (observed_obs8904) (observed_obs8899) (observed_obs8862) (observed_obs8863) (observed_obs8861) (observed_obs8860) (observed_obs8888) (observed_obs8909) (observed_obs8864) (observed_obs8883) (observed_obs8912) (observed_obs8876) (observed_obs8913) (observed_obs8914) (observed_obs8893) (observed_obs8897) (observed_obs8884) (observed_obs8917) (observed_obs8898) (observed_obs8902) (observed_obs8916) (observed_obs8878) (observed_obs8896) (observed_obs8918) (observed_obs8866) (observed_obs8907) (observed_obs8872) (observed_obs8887) (observed_obs8882) (observed_obs8900) (observed_obs8886) (observed_obs8919) (observed_obs8903) (observed_obs8869) (observed_obs8901) (observed_obs8911) (observed_obs8865) (observed_obs8889) (observed_obs8868) (observed_obs8906) (observed_obs8870) (observed_obs8891) (observed_obs8881) (observed_obs8910) (observed_obs8874) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (achieved_constraint0) (not (not_at_end_constraint0))))
 (:action set_goal_34_constraint0
  :parameters ()
  :precondition (and (observed_obs8873) (observed_obs8885) (observed_obs8879) (observed_obs8894) (observed_obs8905) (observed_obs8895) (observed_obs8877) (observed_obs8890) (observed_obs8871) (observed_obs8915) (observed_obs8892) (observed_obs8875) (observed_obs8867) (observed_obs8908) (observed_obs8880) (observed_obs8904) (observed_obs8899) (observed_obs8862) (observed_obs8863) (observed_obs8861) (observed_obs8860) (observed_obs8888) (observed_obs8909) (observed_obs8864) (observed_obs8883) (observed_obs8912) (observed_obs8876) (observed_obs8913) (observed_obs8914) (observed_obs8893) (observed_obs8897) (observed_obs8884) (observed_obs8917) (observed_obs8898) (observed_obs8902) (observed_obs8916) (observed_obs8878) (observed_obs8896) (observed_obs8918) (observed_obs8866) (observed_obs8907) (observed_obs8872) (observed_obs8887) (observed_obs8882) (observed_obs8900) (dominates-2_hyp5_count-as-fault_generator_x2_1) (observed_obs8886) (observed_obs8919) (observed_obs8903) (observed_obs8869) (observed_obs8901) (observed_obs8911) (observed_obs8865) (observed_obs8889) (observed_obs8868) (observed_obs8906) (observed_obs8870) (observed_obs8891) (observed_obs8881) (observed_obs8910) (observed_obs8874) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (achieved_constraint0) (not (not_at_end_constraint0))))
 (:action set_goal_35_constraint0
  :parameters ()
  :precondition (and (observed_obs8873) (observed_obs8885) (observed_obs8879) (observed_obs8894) (observed_obs8905) (observed_obs8895) (observed_obs8877) (observed_obs8890) (observed_obs8871) (observed_obs8915) (observed_obs8892) (observed_obs8875) (observed_obs8867) (observed_obs8908) (observed_obs8880) (observed_obs8904) (observed_obs8899) (observed_obs8862) (observed_obs8863) (observed_obs8861) (observed_obs8860) (observed_obs8888) (observed_obs8909) (observed_obs8864) (observed_obs8883) (observed_obs8912) (observed_obs8876) (observed_obs8913) (observed_obs8914) (observed_obs8893) (observed_obs8897) (observed_obs8884) (observed_obs8917) (observed_obs8898) (observed_obs8902) (observed_obs8916) (observed_obs8878) (observed_obs8896) (observed_obs8918) (observed_obs8866) (observed_obs8907) (observed_obs8872) (observed_obs8887) (observed_obs8882) (observed_obs8900) (dominates-2_hyp5_count-as-fault_generator_x4_1) (observed_obs8886) (observed_obs8919) (observed_obs8903) (observed_obs8869) (observed_obs8901) (observed_obs8911) (observed_obs8865) (observed_obs8889) (observed_obs8868) (observed_obs8906) (observed_obs8870) (observed_obs8891) (observed_obs8881) (observed_obs8910) (observed_obs8874) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (achieved_constraint0) (not (not_at_end_constraint0))))
 (:action set_goal_36_constraint0
  :parameters ()
  :precondition (and (observed_obs8873) (observed_obs8885) (observed_obs8879) (observed_obs8894) (observed_obs8905) (observed_obs8895) (observed_obs8877) (observed_obs8890) (observed_obs8871) (observed_obs8915) (observed_obs8892) (observed_obs8875) (observed_obs8867) (observed_obs8908) (observed_obs8880) (observed_obs8904) (observed_obs8899) (observed_obs8862) (observed_obs8863) (observed_obs8861) (observed_obs8860) (observed_obs8888) (observed_obs8909) (observed_obs8864) (observed_obs8883) (observed_obs8912) (observed_obs8876) (observed_obs8913) (observed_obs8914) (observed_obs8893) (observed_obs8897) (observed_obs8884) (observed_obs8917) (observed_obs8898) (observed_obs8902) (observed_obs8916) (observed_obs8878) (observed_obs8896) (observed_obs8918) (observed_obs8866) (observed_obs8907) (observed_obs8872) (observed_obs8887) (observed_obs8882) (observed_obs8900) (dominates-2_hyp5_count-as-fault_generator_x49_1) (observed_obs8886) (observed_obs8919) (observed_obs8903) (observed_obs8869) (observed_obs8901) (observed_obs8911) (observed_obs8865) (observed_obs8889) (observed_obs8868) (observed_obs8906) (observed_obs8870) (observed_obs8891) (observed_obs8881) (observed_obs8910) (observed_obs8874) (not_at_end_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (achieved_constraint0) (not (not_at_end_constraint0))))
 (:action set_goal_33_constraint1
  :parameters ()
  :precondition (and (observed_obs8873) (observed_obs8885) (observed_obs8879) (observed_obs8894) (observed_obs8905) (observed_obs8895) (observed_obs8877) (observed_obs8890) (observed_obs8871) (observed_obs8915) (observed_obs8892) (observed_obs8875) (observed_obs8867) (observed_obs8908) (observed_obs8880) (observed_obs8904) (observed_obs8899) (observed_obs8862) (observed_obs8863) (observed_obs8861) (observed_obs8860) (observed_obs8888) (observed_obs8909) (observed_obs8864) (observed_obs8883) (observed_obs8912) (observed_obs8876) (observed_obs8913) (observed_obs8914) (observed_obs8893) (observed_obs8897) (observed_obs8884) (observed_obs8917) (observed_obs8898) (observed_obs8902) (observed_obs8916) (observed_obs8878) (observed_obs8896) (observed_obs8918) (observed_obs8866) (observed_obs8907) (observed_obs8872) (observed_obs8887) (observed_obs8882) (observed_obs8900) (dominates-2_hyp4_count-as-fault_generator_x2_1) (observed_obs8886) (observed_obs8919) (observed_obs8903) (observed_obs8869) (observed_obs8901) (observed_obs8911) (observed_obs8865) (observed_obs8889) (observed_obs8868) (observed_obs8906) (observed_obs8870) (observed_obs8891) (observed_obs8881) (observed_obs8910) (observed_obs8874) (achieved_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (achieved_constraint1) (not (not_at_end_constraint1))))
 (:action set_goal_34_constraint1
  :parameters ()
  :precondition (and (observed_obs8873) (observed_obs8885) (observed_obs8879) (observed_obs8894) (observed_obs8905) (observed_obs8895) (observed_obs8877) (observed_obs8890) (observed_obs8871) (observed_obs8915) (observed_obs8892) (observed_obs8875) (observed_obs8867) (observed_obs8908) (observed_obs8880) (observed_obs8904) (observed_obs8899) (observed_obs8862) (observed_obs8863) (observed_obs8861) (observed_obs8860) (observed_obs8888) (observed_obs8909) (observed_obs8864) (observed_obs8883) (observed_obs8912) (observed_obs8876) (observed_obs8913) (observed_obs8914) (observed_obs8893) (observed_obs8897) (observed_obs8884) (observed_obs8917) (observed_obs8898) (observed_obs8902) (observed_obs8916) (observed_obs8878) (observed_obs8896) (observed_obs8918) (observed_obs8866) (observed_obs8907) (observed_obs8872) (observed_obs8887) (observed_obs8882) (observed_obs8900) (dominates-2_hyp4_count-as-fault_generator_x4_1) (observed_obs8886) (observed_obs8919) (observed_obs8903) (observed_obs8869) (observed_obs8901) (observed_obs8911) (observed_obs8865) (observed_obs8889) (observed_obs8868) (observed_obs8906) (observed_obs8870) (observed_obs8891) (observed_obs8881) (observed_obs8910) (observed_obs8874) (achieved_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (achieved_constraint1) (not (not_at_end_constraint1))))
 (:action set_goal_35_constraint1
  :parameters ()
  :precondition (and (observed_obs8873) (observed_obs8885) (observed_obs8879) (observed_obs8894) (observed_obs8905) (observed_obs8895) (observed_obs8877) (observed_obs8890) (observed_obs8871) (observed_obs8915) (observed_obs8892) (observed_obs8875) (observed_obs8867) (observed_obs8908) (observed_obs8880) (observed_obs8904) (observed_obs8899) (observed_obs8862) (observed_obs8863) (observed_obs8861) (observed_obs8860) (observed_obs8888) (observed_obs8909) (observed_obs8864) (observed_obs8883) (observed_obs8912) (observed_obs8876) (observed_obs8913) (observed_obs8914) (observed_obs8893) (observed_obs8897) (observed_obs8884) (observed_obs8917) (observed_obs8898) (observed_obs8902) (observed_obs8916) (observed_obs8878) (observed_obs8896) (observed_obs8918) (observed_obs8866) (observed_obs8907) (observed_obs8872) (observed_obs8887) (observed_obs8882) (observed_obs8900) (dominates-2_hyp4_count-as-fault_generator_x49_1) (observed_obs8886) (observed_obs8919) (observed_obs8903) (observed_obs8869) (observed_obs8901) (observed_obs8911) (observed_obs8865) (observed_obs8889) (observed_obs8868) (observed_obs8906) (observed_obs8870) (observed_obs8891) (observed_obs8881) (observed_obs8910) (observed_obs8874) (achieved_constraint0) (not_at_end_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (achieved_constraint1) (not (not_at_end_constraint1))))
 (:action set_goal_31_constraint2
  :parameters ()
  :precondition (and (observed_obs8873) (observed_obs8885) (observed_obs8879) (observed_obs8894) (observed_obs8905) (observed_obs8895) (observed_obs8877) (observed_obs8890) (observed_obs8871) (observed_obs8915) (observed_obs8892) (observed_obs8875) (observed_obs8867) (observed_obs8908) (observed_obs8880) (observed_obs8904) (observed_obs8899) (observed_obs8862) (observed_obs8863) (observed_obs8861) (observed_obs8860) (observed_obs8888) (observed_obs8909) (observed_obs8864) (observed_obs8883) (observed_obs8912) (observed_obs8876) (observed_obs8913) (observed_obs8914) (observed_obs8893) (observed_obs8897) (observed_obs8884) (observed_obs8917) (observed_obs8898) (observed_obs8902) (observed_obs8916) (observed_obs8878) (observed_obs8896) (observed_obs8918) (observed_obs8866) (observed_obs8907) (observed_obs8872) (observed_obs8887) (dominates-2_hyp3_count-as-fault_bus_x4) (observed_obs8882) (observed_obs8900) (observed_obs8886) (observed_obs8919) (observed_obs8903) (observed_obs8869) (observed_obs8901) (observed_obs8911) (observed_obs8865) (observed_obs8889) (observed_obs8868) (observed_obs8906) (observed_obs8870) (observed_obs8891) (observed_obs8881) (observed_obs8910) (observed_obs8874) (achieved_constraint0) (achieved_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (achieved_constraint2) (not (not_at_end_constraint2))))
 (:action set_goal_34_constraint2
  :parameters ()
  :precondition (and (observed_obs8873) (observed_obs8885) (observed_obs8879) (observed_obs8894) (observed_obs8905) (observed_obs8895) (observed_obs8877) (observed_obs8890) (observed_obs8871) (observed_obs8915) (observed_obs8892) (observed_obs8875) (observed_obs8867) (observed_obs8908) (observed_obs8880) (observed_obs8904) (observed_obs8899) (observed_obs8862) (observed_obs8863) (observed_obs8861) (observed_obs8860) (observed_obs8888) (observed_obs8909) (observed_obs8864) (observed_obs8883) (observed_obs8912) (observed_obs8876) (observed_obs8913) (observed_obs8914) (observed_obs8893) (observed_obs8897) (observed_obs8884) (observed_obs8917) (observed_obs8898) (observed_obs8902) (observed_obs8916) (observed_obs8878) (observed_obs8896) (observed_obs8918) (observed_obs8866) (observed_obs8907) (observed_obs8872) (observed_obs8887) (observed_obs8882) (observed_obs8900) (dominates-2_hyp3_count-as-fault_generator_x2_1) (observed_obs8886) (observed_obs8919) (observed_obs8903) (observed_obs8869) (observed_obs8901) (observed_obs8911) (observed_obs8865) (observed_obs8889) (observed_obs8868) (observed_obs8906) (observed_obs8870) (observed_obs8891) (observed_obs8881) (observed_obs8910) (observed_obs8874) (achieved_constraint0) (achieved_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (achieved_constraint2) (not (not_at_end_constraint2))))
 (:action set_goal_35_constraint2
  :parameters ()
  :precondition (and (observed_obs8873) (observed_obs8885) (observed_obs8879) (observed_obs8894) (observed_obs8905) (observed_obs8895) (observed_obs8877) (observed_obs8890) (observed_obs8871) (observed_obs8915) (observed_obs8892) (observed_obs8875) (observed_obs8867) (observed_obs8908) (observed_obs8880) (observed_obs8904) (observed_obs8899) (observed_obs8862) (observed_obs8863) (observed_obs8861) (observed_obs8860) (observed_obs8888) (observed_obs8909) (observed_obs8864) (observed_obs8883) (observed_obs8912) (observed_obs8876) (observed_obs8913) (observed_obs8914) (observed_obs8893) (observed_obs8897) (observed_obs8884) (observed_obs8917) (observed_obs8898) (observed_obs8902) (observed_obs8916) (observed_obs8878) (observed_obs8896) (observed_obs8918) (observed_obs8866) (observed_obs8907) (observed_obs8872) (observed_obs8887) (observed_obs8882) (observed_obs8900) (dominates-2_hyp3_count-as-fault_generator_x4_1) (observed_obs8886) (observed_obs8919) (observed_obs8903) (observed_obs8869) (observed_obs8901) (observed_obs8911) (observed_obs8865) (observed_obs8889) (observed_obs8868) (observed_obs8906) (observed_obs8870) (observed_obs8891) (observed_obs8881) (observed_obs8910) (observed_obs8874) (achieved_constraint0) (achieved_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (achieved_constraint2) (not (not_at_end_constraint2))))
 (:action set_goal_36_constraint2
  :parameters ()
  :precondition (and (observed_obs8873) (observed_obs8885) (observed_obs8879) (observed_obs8894) (observed_obs8905) (observed_obs8895) (observed_obs8877) (observed_obs8890) (observed_obs8871) (observed_obs8915) (observed_obs8892) (observed_obs8875) (observed_obs8867) (observed_obs8908) (observed_obs8880) (observed_obs8904) (observed_obs8899) (observed_obs8862) (observed_obs8863) (observed_obs8861) (observed_obs8860) (observed_obs8888) (observed_obs8909) (observed_obs8864) (observed_obs8883) (observed_obs8912) (observed_obs8876) (observed_obs8913) (observed_obs8914) (observed_obs8893) (observed_obs8897) (observed_obs8884) (observed_obs8917) (observed_obs8898) (observed_obs8902) (observed_obs8916) (observed_obs8878) (observed_obs8896) (observed_obs8918) (observed_obs8866) (observed_obs8907) (observed_obs8872) (observed_obs8887) (observed_obs8882) (observed_obs8900) (dominates-2_hyp3_count-as-fault_generator_x49_1) (observed_obs8886) (observed_obs8919) (observed_obs8903) (observed_obs8869) (observed_obs8901) (observed_obs8911) (observed_obs8865) (observed_obs8889) (observed_obs8868) (observed_obs8906) (observed_obs8870) (observed_obs8891) (observed_obs8881) (observed_obs8910) (observed_obs8874) (achieved_constraint0) (achieved_constraint1) (not_at_end_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (achieved_constraint2) (not (not_at_end_constraint2))))
 (:action set_goal_0_constraint3
  :parameters ()
  :precondition (and (observed_obs8873) (dominates-2_hyp2_count-as-fault_breaker_x1_x2) (observed_obs8885) (observed_obs8879) (observed_obs8894) (observed_obs8905) (observed_obs8895) (observed_obs8877) (observed_obs8890) (observed_obs8871) (observed_obs8915) (observed_obs8892) (observed_obs8875) (observed_obs8867) (observed_obs8908) (observed_obs8880) (observed_obs8904) (observed_obs8899) (observed_obs8862) (observed_obs8863) (observed_obs8861) (observed_obs8860) (observed_obs8888) (observed_obs8909) (observed_obs8864) (observed_obs8883) (observed_obs8912) (observed_obs8876) (observed_obs8913) (observed_obs8914) (observed_obs8893) (observed_obs8897) (observed_obs8884) (observed_obs8917) (observed_obs8898) (observed_obs8902) (observed_obs8916) (observed_obs8878) (observed_obs8896) (observed_obs8918) (observed_obs8866) (observed_obs8907) (observed_obs8872) (observed_obs8887) (observed_obs8882) (observed_obs8900) (observed_obs8886) (observed_obs8919) (observed_obs8903) (observed_obs8869) (observed_obs8901) (observed_obs8911) (observed_obs8865) (observed_obs8889) (observed_obs8868) (observed_obs8906) (observed_obs8870) (observed_obs8891) (observed_obs8881) (observed_obs8910) (observed_obs8874) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (achieved_constraint3) (not (not_at_end_constraint3))))
 (:action set_goal_32_constraint3
  :parameters ()
  :precondition (and (observed_obs8873) (observed_obs8885) (observed_obs8879) (observed_obs8894) (observed_obs8905) (observed_obs8895) (observed_obs8877) (observed_obs8890) (observed_obs8871) (observed_obs8915) (observed_obs8892) (observed_obs8875) (observed_obs8867) (observed_obs8908) (observed_obs8880) (observed_obs8904) (observed_obs8899) (observed_obs8862) (observed_obs8863) (observed_obs8861) (observed_obs8860) (observed_obs8888) (observed_obs8909) (observed_obs8864) (observed_obs8883) (observed_obs8912) (observed_obs8876) (observed_obs8913) (observed_obs8914) (observed_obs8893) (observed_obs8897) (observed_obs8884) (observed_obs8917) (observed_obs8898) (observed_obs8902) (observed_obs8916) (observed_obs8878) (observed_obs8896) (observed_obs8918) (observed_obs8866) (observed_obs8907) (observed_obs8872) (observed_obs8887) (dominates-2_hyp2_count-as-fault_bus_x4) (observed_obs8882) (observed_obs8900) (observed_obs8886) (observed_obs8919) (observed_obs8903) (observed_obs8869) (observed_obs8901) (observed_obs8911) (observed_obs8865) (observed_obs8889) (observed_obs8868) (observed_obs8906) (observed_obs8870) (observed_obs8891) (observed_obs8881) (observed_obs8910) (observed_obs8874) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (achieved_constraint3) (not (not_at_end_constraint3))))
 (:action set_goal_35_constraint3
  :parameters ()
  :precondition (and (observed_obs8873) (observed_obs8885) (observed_obs8879) (observed_obs8894) (observed_obs8905) (observed_obs8895) (observed_obs8877) (observed_obs8890) (observed_obs8871) (observed_obs8915) (observed_obs8892) (observed_obs8875) (observed_obs8867) (observed_obs8908) (observed_obs8880) (observed_obs8904) (observed_obs8899) (observed_obs8862) (observed_obs8863) (observed_obs8861) (observed_obs8860) (observed_obs8888) (observed_obs8909) (observed_obs8864) (observed_obs8883) (observed_obs8912) (observed_obs8876) (observed_obs8913) (observed_obs8914) (observed_obs8893) (observed_obs8897) (observed_obs8884) (observed_obs8917) (observed_obs8898) (observed_obs8902) (observed_obs8916) (observed_obs8878) (observed_obs8896) (observed_obs8918) (observed_obs8866) (observed_obs8907) (observed_obs8872) (observed_obs8887) (observed_obs8882) (observed_obs8900) (dominates-2_hyp2_count-as-fault_generator_x2_1) (observed_obs8886) (observed_obs8919) (observed_obs8903) (observed_obs8869) (observed_obs8901) (observed_obs8911) (observed_obs8865) (observed_obs8889) (observed_obs8868) (observed_obs8906) (observed_obs8870) (observed_obs8891) (observed_obs8881) (observed_obs8910) (observed_obs8874) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (achieved_constraint3) (not (not_at_end_constraint3))))
 (:action set_goal_36_constraint3
  :parameters ()
  :precondition (and (observed_obs8873) (observed_obs8885) (observed_obs8879) (observed_obs8894) (observed_obs8905) (observed_obs8895) (observed_obs8877) (observed_obs8890) (observed_obs8871) (observed_obs8915) (observed_obs8892) (observed_obs8875) (observed_obs8867) (observed_obs8908) (observed_obs8880) (observed_obs8904) (observed_obs8899) (observed_obs8862) (observed_obs8863) (observed_obs8861) (observed_obs8860) (observed_obs8888) (observed_obs8909) (observed_obs8864) (observed_obs8883) (observed_obs8912) (observed_obs8876) (observed_obs8913) (observed_obs8914) (observed_obs8893) (observed_obs8897) (observed_obs8884) (observed_obs8917) (observed_obs8898) (observed_obs8902) (observed_obs8916) (observed_obs8878) (observed_obs8896) (observed_obs8918) (observed_obs8866) (observed_obs8907) (observed_obs8872) (observed_obs8887) (observed_obs8882) (observed_obs8900) (dominates-2_hyp2_count-as-fault_generator_x4_1) (observed_obs8886) (observed_obs8919) (observed_obs8903) (observed_obs8869) (observed_obs8901) (observed_obs8911) (observed_obs8865) (observed_obs8889) (observed_obs8868) (observed_obs8906) (observed_obs8870) (observed_obs8891) (observed_obs8881) (observed_obs8910) (observed_obs8874) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (achieved_constraint3) (not (not_at_end_constraint3))))
 (:action set_goal_37_constraint3
  :parameters ()
  :precondition (and (observed_obs8873) (observed_obs8885) (observed_obs8879) (observed_obs8894) (observed_obs8905) (observed_obs8895) (observed_obs8877) (observed_obs8890) (observed_obs8871) (observed_obs8915) (observed_obs8892) (observed_obs8875) (observed_obs8867) (observed_obs8908) (observed_obs8880) (observed_obs8904) (observed_obs8899) (observed_obs8862) (observed_obs8863) (observed_obs8861) (observed_obs8860) (observed_obs8888) (observed_obs8909) (observed_obs8864) (observed_obs8883) (observed_obs8912) (observed_obs8876) (observed_obs8913) (observed_obs8914) (observed_obs8893) (observed_obs8897) (observed_obs8884) (observed_obs8917) (observed_obs8898) (observed_obs8902) (observed_obs8916) (observed_obs8878) (observed_obs8896) (observed_obs8918) (observed_obs8866) (observed_obs8907) (observed_obs8872) (observed_obs8887) (observed_obs8882) (observed_obs8900) (dominates-2_hyp2_count-as-fault_generator_x49_1) (observed_obs8886) (observed_obs8919) (observed_obs8903) (observed_obs8869) (observed_obs8901) (observed_obs8911) (observed_obs8865) (observed_obs8889) (observed_obs8868) (observed_obs8906) (observed_obs8870) (observed_obs8891) (observed_obs8881) (observed_obs8910) (observed_obs8874) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (not_at_end_constraint3) (not_at_end_constraint4))
  :effect (and (achieved_constraint3) (not (not_at_end_constraint3))))
 (:action set_goal_0_constraint4
  :parameters ()
  :precondition (and (observed_obs8873) (observed_obs8885) (dominates-2_hyp1_count-as-fault_breaker_x3_x4) (observed_obs8879) (observed_obs8894) (observed_obs8905) (observed_obs8895) (observed_obs8877) (observed_obs8890) (observed_obs8871) (observed_obs8915) (observed_obs8892) (observed_obs8875) (observed_obs8867) (observed_obs8908) (observed_obs8880) (observed_obs8904) (observed_obs8899) (observed_obs8862) (observed_obs8863) (observed_obs8861) (observed_obs8860) (observed_obs8888) (observed_obs8909) (observed_obs8864) (observed_obs8883) (observed_obs8912) (observed_obs8876) (observed_obs8913) (observed_obs8914) (observed_obs8893) (observed_obs8897) (observed_obs8884) (observed_obs8917) (observed_obs8898) (observed_obs8902) (observed_obs8916) (observed_obs8878) (observed_obs8896) (observed_obs8918) (observed_obs8866) (observed_obs8907) (observed_obs8872) (observed_obs8887) (observed_obs8882) (observed_obs8900) (observed_obs8886) (observed_obs8919) (observed_obs8903) (observed_obs8869) (observed_obs8901) (observed_obs8911) (observed_obs8865) (observed_obs8889) (observed_obs8868) (observed_obs8906) (observed_obs8870) (observed_obs8891) (observed_obs8881) (observed_obs8910) (observed_obs8874) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (achieved_constraint3) (not_at_end_constraint4))
  :effect (and (achieved_constraint4) (not (not_at_end_constraint4))))
 (:action set_goal_34_constraint4
  :parameters ()
  :precondition (and (observed_obs8873) (observed_obs8885) (observed_obs8879) (observed_obs8894) (observed_obs8905) (observed_obs8895) (observed_obs8877) (observed_obs8890) (observed_obs8871) (observed_obs8915) (observed_obs8892) (observed_obs8875) (observed_obs8867) (observed_obs8908) (observed_obs8880) (observed_obs8904) (observed_obs8899) (observed_obs8862) (observed_obs8863) (observed_obs8861) (observed_obs8860) (observed_obs8888) (observed_obs8909) (observed_obs8864) (observed_obs8883) (observed_obs8912) (observed_obs8876) (observed_obs8913) (observed_obs8914) (observed_obs8893) (observed_obs8897) (observed_obs8884) (observed_obs8917) (observed_obs8898) (observed_obs8902) (observed_obs8916) (observed_obs8878) (observed_obs8896) (observed_obs8918) (observed_obs8866) (observed_obs8907) (observed_obs8872) (observed_obs8887) (observed_obs8882) (observed_obs8900) (dominates-2_hyp1_count-as-fault_generator_x2_1) (observed_obs8886) (observed_obs8919) (observed_obs8903) (observed_obs8869) (observed_obs8901) (observed_obs8911) (observed_obs8865) (observed_obs8889) (observed_obs8868) (observed_obs8906) (observed_obs8870) (observed_obs8891) (observed_obs8881) (observed_obs8910) (observed_obs8874) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (achieved_constraint3) (not_at_end_constraint4))
  :effect (and (achieved_constraint4) (not (not_at_end_constraint4))))
 (:action set_goal_35_constraint4
  :parameters ()
  :precondition (and (observed_obs8873) (observed_obs8885) (observed_obs8879) (observed_obs8894) (observed_obs8905) (observed_obs8895) (observed_obs8877) (observed_obs8890) (observed_obs8871) (observed_obs8915) (observed_obs8892) (observed_obs8875) (observed_obs8867) (observed_obs8908) (observed_obs8880) (observed_obs8904) (observed_obs8899) (observed_obs8862) (observed_obs8863) (observed_obs8861) (observed_obs8860) (observed_obs8888) (observed_obs8909) (observed_obs8864) (observed_obs8883) (observed_obs8912) (observed_obs8876) (observed_obs8913) (observed_obs8914) (observed_obs8893) (observed_obs8897) (observed_obs8884) (observed_obs8917) (observed_obs8898) (observed_obs8902) (observed_obs8916) (observed_obs8878) (observed_obs8896) (observed_obs8918) (observed_obs8866) (observed_obs8907) (observed_obs8872) (observed_obs8887) (observed_obs8882) (observed_obs8900) (dominates-2_hyp1_count-as-fault_generator_x4_1) (observed_obs8886) (observed_obs8919) (observed_obs8903) (observed_obs8869) (observed_obs8901) (observed_obs8911) (observed_obs8865) (observed_obs8889) (observed_obs8868) (observed_obs8906) (observed_obs8870) (observed_obs8891) (observed_obs8881) (observed_obs8910) (observed_obs8874) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (achieved_constraint3) (not_at_end_constraint4))
  :effect (and (achieved_constraint4) (not (not_at_end_constraint4))))
 (:action set_goal_36_constraint4
  :parameters ()
  :precondition (and (observed_obs8873) (observed_obs8885) (observed_obs8879) (observed_obs8894) (observed_obs8905) (observed_obs8895) (observed_obs8877) (observed_obs8890) (observed_obs8871) (observed_obs8915) (observed_obs8892) (observed_obs8875) (observed_obs8867) (observed_obs8908) (observed_obs8880) (observed_obs8904) (observed_obs8899) (observed_obs8862) (observed_obs8863) (observed_obs8861) (observed_obs8860) (observed_obs8888) (observed_obs8909) (observed_obs8864) (observed_obs8883) (observed_obs8912) (observed_obs8876) (observed_obs8913) (observed_obs8914) (observed_obs8893) (observed_obs8897) (observed_obs8884) (observed_obs8917) (observed_obs8898) (observed_obs8902) (observed_obs8916) (observed_obs8878) (observed_obs8896) (observed_obs8918) (observed_obs8866) (observed_obs8907) (observed_obs8872) (observed_obs8887) (observed_obs8882) (observed_obs8900) (dominates-2_hyp1_count-as-fault_generator_x49_1) (observed_obs8886) (observed_obs8919) (observed_obs8903) (observed_obs8869) (observed_obs8901) (observed_obs8911) (observed_obs8865) (observed_obs8889) (observed_obs8868) (observed_obs8906) (observed_obs8870) (observed_obs8891) (observed_obs8881) (observed_obs8910) (observed_obs8874) (achieved_constraint0) (achieved_constraint1) (achieved_constraint2) (achieved_constraint3) (not_at_end_constraint4))
  :effect (and (achieved_constraint4) (not (not_at_end_constraint4))))
)
