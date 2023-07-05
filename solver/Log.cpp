#include "Log.h"

bool Log::_mpi_finalized = false;

int Log::MPI_RANK() {
  int rank;
  MPI_Comm_rank(MPI_COMM_WORLD, &rank);
  return rank;
}

string Log::RANK_TEXT() {
  if (_mpi_finalized) return "RANK(?) :: ";

  int flag;
  MPI_Initialized(&flag);
  if (flag==1)
    return "RANK(" + to_string(MPI_RANK()) + ") :: ";
  else
    return "";
}

string Log::COLOUR_START(string filename) {
  int hash = std::hash<std::string>{}(filename);

  int red = 30+abs(hash%150);
  int green = 30+abs((hash/1000)%150);
	int blue = 30+abs((hash/1000000)%150);

  string r = std::to_string(red);
  string g = std::to_string(green);
  string b = std::to_string(blue);

  if (r.length() == 2) r = "0" + r;
  if (g.length() == 2) g = "0" + g;
  if (b.length() == 2) b = "0" + b;

	return "\033[48;2;" + r + ";" + g + ";" + b + ";25m";
}

string Log::COLOUR_END() {
  return "\033[0m";
}

void Log::inform_mpi_finalized() {
  _mpi_finalized = true;
}
