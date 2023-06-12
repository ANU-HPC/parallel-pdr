#include "main.h"

int main(int argc, char **argv) {
  // Parse in command line arguments, and problem specific attributes
  Global::problem = Problem(argc, argv);

  Dagster_Layers dl;
  return 0;
}
