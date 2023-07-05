diabled:
	echo everything moved and upgraded in directory solver 

































# This makefile was taken from dagster mark.burgess@anu.edu.au 
# for ipasir, swap lingeling.o for minisat.o and ipasir for lgl

default:
	$(MAKE) -j 16 pdr

UNAME                           = $(shell uname -a)
ANU_PLATFORM_NAME               = dolphin
CRAY_PLATFORM_NAME              = nakuru

ifeq (${ANU_PLATFORM_NAME}, $(findstring ${ANU_PLATFORM_NAME}, ${UNAME}))
        #Variables for ANU dev system (dolphin?)
        MPICXX                  = mpic++ -I/home/marshall/
        CXXFLAGS                += -O3 -std=c++17 -DVERSION=1.0.0 -DEMAIL=marshall.clifton@anu.edu.au
        LDFLAGS                 = -lglog -lstdc++fs
else ifeq (${CRAY_PLATFORM_NAME}, $(findstring ${CRAY_PLATFORM_NAME}, ${UNAME}))
        #Variables for Nakuru Cray system
        MPICXX                  = CC
        CXXFLAGS                += -O2 -std=c++17 -DVERSION=1.0.0 -DNO_PROVENANCE 
        INCLUDES                = -I/sw/UNCLASSIFIED/glog-master/include -I/sw/UNCLASSIFIED/cudd-release/include \
                                  -I/sw/UNCLASSIFIED/zlib-1.2.11/include
        LDFLAGS                 = -L/sw/UNCLASSIFIED/glog-master/lib -L/sw/UNCLASSIFIED/cudd-release/lib \
                                  -L/sw/UNCLASSIFIED/zlib-1.2.11/lib -lglog -lstdc++fs -lcudd -lz
	#For some reason main.cpp is attempted to be compiled with CXX and no includes rather than the
	#MPICXX line below, can't quite work out where make is coming up with this change
	CXX			= CC ERROR $(INCLUDES) 
else
        #Default variables
        MPICXX                  = mpic++ -Wall -Wno-sign-compare #-Wno-unused-variable
        CXXFLAGS                += -O3 -std=c++17 -DVERSION=1.0.0 -DEMAIL=marshall.clifton@anu.edu.au
        #CXXFLAGS                += -ggdb -O0 -std=c++17 -DVERSION=1.0.0 -DEMAIL=marshall.clifton@anu.edu.au
        LDFLAGS                 = -lglog -lstdc++fs
#       LDFLAGS                 += -L/usr/local/lib/openmpi -lmpiP -lm -lbfd -liberty -lunwind -L.. -ldummy_mpi1
endif

OBJS = ./parallel/message.o \
	   ./parallel/Cnf.o \
	   ./parallel/LingelingWorker.o \
	   ./parallel/MPICommsInterface.o \
	   ./parallel/utilities.o \
	   ./parallel/arguments.o \
	   ./parallel/LingelingMaster.o \
	   ./parallel/interactive_functions.o \
	   main_pdr.o \
	   lingeling.o \
	   set_trie.o \
	   queue.o \
	   property_directed_reachability.o \
	   timing.o \
	   parser.o \
	   state_actions.o \
	   layers.o \
	   queue_container.o \
					
HEADERS	= main_pdr.h \
		  lingeling.h \
		  set_trie.h \
		  queue.h \
		  property_directed_reachability.h \
		  timing.h \
		  parser.h \
		  options.h \
		  state_actions.h \
		  layers.h \
		  queue_container.h \

INCLUDES += -I../lingeling \
            -I./parallel \
			-I../rapidjson/include \
			-I.

LDFLAGS += -L../lingeling \
		   -llgl \

CXXFLAGS += `cat ../SET_NDEBUG`

pdr: $(OBJS) 
	$(MPICXX) $(CXXFLAGS) $(INCLUDES) $(OBJS) -L. -llgl $(LDFLAGS) -o pdrDagster

%.o: %.cpp %.h $(HEADERS) ../SET_NDEBUG
	$(MPICXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@ 

clean:
	-rm pdrDagster *.o ./parallel/*.o
