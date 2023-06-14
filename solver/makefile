default:
	$(MAKE) -j 16 solver

MPICXX   = mpic++ -Wall -Wno-sign-compare #-Wno-unused-variable
CXXFLAGS += -DNDEBUG -O3 -std=c++17 -DVERSION=1.0.0 -DEMAIL=marshall.clifton@anu.edu.au
#CXXFLAGS += -g -O0 -std=c++17 -DVERSION=1.0.0 -DEMAIL=marshall.clifton@anu.edu.au
LDFLAGS  = -lglog -lstdc++fs

OBJS = main.o \
	   Problem.o \
	   Utils.o \
	   Compressed_State.o \
	   Obligation.o \
	   Global.o \
	   MPI_Interface.o \
	   MPI_Communicatable.o \
	   Compressed_State_Or_Actions.o \
	   Compressed_State.o \
	   Compressed_Actions.o

					
HEADERS	= main.h \
		  Problem.h \
		  Utils.h \
		  Compressed_State.h \
		  Obligation.h \
		  Global.h \
		  MPI_Interface.h \
		  MPI_Communicatable.h \
		  Compressed_State_Or_Actions.h \
		  Compressed_State.h \
		  Compressed_Actions.h

INCLUDES += -I../lingeling \
            -I./parallel \
			-I../rapidjson/include \
			-I.

LDFLAGS += -L../lingeling \
		   -llgl \

solver: $(OBJS) 
	$(MPICXX) $(CXXFLAGS) $(INCLUDES) $(OBJS) -L. -llgl $(LDFLAGS) -o parallel-pdr

%.o: %.cpp %.h $(HEADERS) makefile
	$(MPICXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@ 

clean:
	-rm parallel-pdr *.o ./parallel/*.o
