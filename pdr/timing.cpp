#include "timing.h"
#include <iomanip>
#include <sstream>

void Timing::dagster_start(int subproblem) {
  assert (dagster_start_time == 0);
  dagster_subproblem = subproblem;
  dagster_start_time = clock();
};

void Timing::dagster_stop(bool result) {
  clock_t dagster_stop_time = clock();
  assert (dagster_start_time != 0);
  while (dagster_times.size() <= dagster_subproblem) {
    dagster_times.push_back(vector<clock_t>{0,0});
    dagster_counts.push_back(vector<int>{0,0});
  }
  dagster_times[dagster_subproblem][result] += dagster_stop_time - dagster_start_time; // indexing with bool?
  dagster_counts[dagster_subproblem][result] += 1;
  dagster_start_time = 0;
};

void Timing::lingeling_start(int subproblem) {
  assert (lingeling_start_time == 0);
  lingeling_subproblem = subproblem;
  lingeling_start_time = clock();
};

void Timing::lingeling_stop(bool result) {
  clock_t lingeling_stop_time = clock();
  assert (lingeling_start_time != 0);
  while (lingeling_times.size() <= lingeling_subproblem) {
    lingeling_times.push_back(vector<clock_t>{0,0});
    lingeling_counts.push_back(vector<int>{0,0});
  }
  lingeling_times[lingeling_subproblem][result] += lingeling_stop_time - lingeling_start_time; // indexing with bool?
  lingeling_counts[lingeling_subproblem][result] += 1;
  lingeling_start_time = 0;
};

void Timing::print() {
  // TODO not efficient

  double sum_sat_time = 0;
  double sum_unsat_time = 0;
  double sum_total_time = 0;
  int sum_sat_count = 0;
  int sum_unsat_count = 0;
  int sum_total_count = 0;

  /*
  cout << endl;
  cout << "============================================= Dagster Timing ==============================================" << endl;
  cout << "Subproblem\tSAT Time\tUNSAT Time\tTotal Time\tSAT Count\tUNSAT Count\tTotal count" << endl;
  for (int subproblem=0; subproblem<dagster_counts.size(); subproblem++) {
    // Values for reporting
    const float sat_time = float_time(dagster_times[subproblem][true]);
    const float unsat_time = float_time(dagster_times[subproblem][false]);
    const float total_time = float_time(dagster_times[subproblem][true] + dagster_times[subproblem][false]);
    const int sat_count = dagster_counts[subproblem][true];
    const int unsat_count = dagster_counts[subproblem][false];
    const int total_count = dagster_counts[subproblem][true] + dagster_counts[subproblem][false];

    // For summing
    sum_sat_count += sat_count;
    sum_unsat_count += unsat_count;
    sum_total_count += total_count;
    sum_sat_time += sat_time;
    sum_unsat_time += unsat_time;
    sum_total_time += total_time;

    // Round the floats
    const string string_sat_time = string_float(sat_time);
    const string string_unsat_time = string_float(unsat_time);
    const string string_total_time = string_float(total_time);

    cout << subproblem << "\t\t" << string_sat_time << "\t\t" << string_unsat_time << "\t\t" << string_total_time << "\t\t" << sat_count << "\t\t" << unsat_count << "\t\t" << total_count << endl;
  }
  // Round the floats
  string string_sum_sat_time = string_float(sum_sat_time);
  string string_sum_unsat_time = string_float(sum_unsat_time);
  string string_sum_total_time = string_float(sum_total_time);

  cout << "-----------------------------------------------------------------------------------------------------------" << endl;
  cout << "TOTAL" << "\t\t" << string_sum_sat_time << "\t\t" << string_sum_unsat_time << "\t\t" << string_sum_total_time << "\t\t" << sum_sat_count << "\t\t" << sum_unsat_count << "\t\t" << sum_total_count << endl;

  cout << "===========================================================================================================" << endl;
  cout << endl;

  // Reset for Lingeling
  sum_sat_time = 0;
  sum_unsat_time = 0;
  sum_total_time = 0;
  sum_sat_count = 0;
  sum_unsat_count = 0;
  sum_total_count = 0;
  */
  string string_sum_sat_time;
  string string_sum_unsat_time;
  string string_sum_total_time;


  cout << "============================================= Lingeling Timing ============================================" << endl;
  cout << "Subproblem\tSAT Time\tUNSAT Time\tTotal Time\tSAT Count\tUNSAT Count\tTotal count" << endl;
  for (int subproblem=0; subproblem<lingeling_counts.size(); subproblem++) {
    // Values for reporting
    const float sat_time = float_time(lingeling_times[subproblem][true]);
    const float unsat_time = float_time(lingeling_times[subproblem][false]);
    const float total_time = float_time(lingeling_times[subproblem][true] + lingeling_times[subproblem][false]);
    const int sat_count = lingeling_counts[subproblem][true];
    const int unsat_count = lingeling_counts[subproblem][false];
    const int total_count = lingeling_counts[subproblem][true] + lingeling_counts[subproblem][false];

    // For summing
    sum_sat_count += sat_count;
    sum_unsat_count += unsat_count;
    sum_total_count += total_count;
    sum_sat_time += sat_time;
    sum_unsat_time += unsat_time;
    sum_total_time += total_time;

    // Round the floats
    const string string_sat_time = string_float(sat_time);
    const string string_unsat_time = string_float(unsat_time);
    const string string_total_time = string_float(total_time);

    cout << subproblem << "\t\t" << string_sat_time << "\t\t" << string_unsat_time << "\t\t" << string_total_time << "\t\t" << sat_count << "\t\t" << unsat_count << "\t\t" << total_count << endl;
  }
  // Round the floats
  string_sum_sat_time = string_float(sum_sat_time);
  string_sum_unsat_time = string_float(sum_unsat_time);
  string_sum_total_time = string_float(sum_total_time);

  cout << "-----------------------------------------------------------------------------------------------------------" << endl;
  cout << "TOTAL" << "\t\t" << string_sum_sat_time << "\t\t" << string_sum_unsat_time << "\t\t" << string_sum_total_time << "\t\t" << sum_sat_count << "\t\t" << sum_unsat_count << "\t\t" << sum_total_count << endl;

  cout << "===========================================================================================================" << endl;
  cout << endl;
}

string Timing::string_float(float number) {
  stringstream stream;
  stream << fixed << setprecision(2) << number;
  return stream.str();
}

float Timing::float_time(clock_t time) {
  return ((float)time)/CLOCKS_PER_SEC;
}



/*
--------------------------------+-----------------------------------------------+-----------------------------------------------+-----------------------------------------------+
SAT call component              | SAT Time      UNSAT Time      Total Time      | SAT Count     UNSAT Count     Total Count     | SAT Average   UNSAT Average   Overall Average |
                                |                                               |                                               | Time          Time            Time            |
--------------------------------+-----------------------------------------------+-----------------------------------------------+-----------------------------------------------+
I /\ G (line4)                  | 0.0           0.0             0.0             | 3             4               7               | 0.07*10e-3    0.02*10e-3      0.04*10e-3      |
get successor (line11)          | 0.05          0.06            0.12            | 113           180             293             | 0.45*10e-3    0.36*10e-3      0.39*10e-3      |
compute reason (line15)         | 0.05          0.07            0.12            | 426           223             649             | 0.11*10e-3    0.32*10e-3      0.18*10e-3      |
clause push (line26)            | 0.12          0.0             0.12            | 28            1               29              | 4.16*10e-3    0.05*10e-3      4.02*10e-3      |
--------------------------------+-----------------------------------------------+-----------------------------------------------+-----------------------------------------------+
TOTAL/AVERAGE                   | 0.21          0.14            0.35            | 570           408             978             | 0.0*10e-3     0.0*10e-3       0.0*10e-3       |
--------------------------------+-----------------------------------------------+-----------------------------------------------+-----------------------------------------------+
*/



//void print_stats() {
//cout << "Lingeling Time: " << ((float)timing.lingeling_solve_time)/CLOCKS_PER_SEC << endl;
//}

