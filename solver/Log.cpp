#include "Log.h"

bool Log::_mpi_finalized = false;

bool Log::_colours_active = false;

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
  if (!_colours_active) return "";

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
  if (!_colours_active) return "";
  return "\033[0m";
}

string Log::TIME_TEXT() {
  float time = ((float)clock())/((float)CLOCKS_PER_SEC);
  std::stringstream stream;
  stream << std::fixed << std::setprecision(2) << time;
  return stream.str();
}

void Log::inform_mpi_finalized() {
  _mpi_finalized = true;
}

void Log::inform_colours_active(bool active) {
  _colours_active = active;
}
