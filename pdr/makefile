# This makefile was taken from dagster mark.burgess@anu.edu.au 
#
#
# for ipasir, swap lingeling.o for minisat.o and ipasir for lgl
default:
	$(MAKE) -j 16 pdr

UNAME                           = $(shell uname -a)
ANU_PLATFORM_NAME               = dolphin
CRAY_PLATFORM_NAME              = nakuru

ifeq (${ANU_PLATFORM_NAME}, $(findstring ${ANU_PLATFORM_NAME}, ${UNAME}))
        #Variables for ANU dev system (dolphin?)
        MPICXX                  = mpic++ -L/home/milthorpe/cudd/lib/ -I/home/marshall/
        CXXFLAGS                += -O3 -std=c++17 -DVERSION=1.0.0 -DEMAIL=marshall.clifton@anu.edu.au
        LDFLAGS                 = -lglog -lstdc++fs -lcudd -lz
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
        MPICXX                  = mpic++ -Wall -Wno-sign-compare -Wno-unused-variable
        CXXFLAGS                += -O3 -std=c++17 -DVERSION=1.0.0 -DEMAIL=marshall.clifton@anu.edu.au
        #CXXFLAGS                += -ggdb -O0 -std=c++17 -DVERSION=1.0.0 -DEMAIL=marshall.clifton@anu.edu.au
        LDFLAGS                 = -lglog -lstdc++fs -lcudd -lz
#       LDFLAGS                 += -L/usr/local/lib/openmpi -lmpiP -lm -lbfd -liberty -lunwind -L.. -ldummy_mpi1
endif


#OBJS 				= Cnf.o CnfManager.o SatSolver.o Dag.o message.o TableSolutions.o BDDSolutions.o alter_main.o Master.o Worker.o MPICommsInterface.o utilities.o arguments.o CnfHolder.o MasterOrganiser.o
OBJS 				= ../summer1819/dagster/message.o \
						../summer1819/dagster/Dag.o \
						../summer1819/dagster/Cnf.o \
						../summer1819/dagster/pdr/LingelingWorker.o \
						../summer1819/dagster/MPICommsInterface.o \
						../summer1819/dagster/utilities.o \
						../summer1819/dagster/arguments.o \
						../summer1819/dagster/CnfHolder.o \
						../summer1819/dagster/pdr/LingelingMaster.o \
						main_pdr.o \
						lingeling.o \
						set_trie.o \
						timing.o \
						parser.o \

#OBJS 				= ../summer1819/dagster/Cnf.o \
						../summer1819/dagster/CnfManager.o \
						../summer1819/dagster/SatSolver.o \
						../summer1819/dagster/Dag.o \
						../summer1819/dagster/message.o \
						../summer1819/dagster/TableSolutions.o \
						../summer1819/dagster/BDDSolutions.o \
						../summer1819/dagster/Worker.o \
						../summer1819/dagster/pdr/LingelingWorker.o \
						../summer1819/dagster/MPICommsInterface.o \
						../summer1819/dagster/utilities.o \
						../summer1819/dagster/arguments.o \
						../summer1819/dagster/CnfHolder.o \
						../summer1819/dagster/MasterOrganiser.o \
						../summer1819/dagster/Master.o \
						../summer1819/dagster/pdr/LingelingMaster.o \
						main_pdr.o \
						minisat.o \
						set_trie.o \
						timing.o \
						parser.o \



.PHONY: gnovelty

INCLUDES += -I../lingeling \
            -I../summer1819/dagster \
            -I../summer1819/dagster/pdr \
			-I../rapidjson/include \
			-I.

LDFLAGS += -L../lingeling \
		   -llgl \

CXXFLAGS += `cat ../SET_NDEBUG`

pdr: $(OBJS) ../summer1819/dagster/gnovelty/*.cc ../summer1819/dagster/gnovelty/*.hh ../summer1819/dagster/strengthener/*.cc ../summer1819/dagster/strengthener/*.h
	$(MAKE) -j 16 -C ../summer1819/dagster
	$(MAKE) -j 16 -C ../summer1819/dagster/pdr
	#$(MPICXX) $(CXXFLAGS) $(INCLUDES) $(OBJS) ../summer1819/dagster/gnovelty/*.o ../summer1819/dagster/strengthener/*.o* ../summer1819/dagster/minisat/*/*.o* -L. -lipasir $(LDFLAGS) -o pdrDagster
	$(MPICXX) $(CXXFLAGS) $(INCLUDES) $(OBJS) -L. -llgl $(LDFLAGS) -o pdrDagster

%.o: %.cpp %.h
	$(MPICXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@ 

clean:
	-rm pdrDagster *.o
	-rm ./dag_out.txt -f
