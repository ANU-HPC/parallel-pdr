default:
	$(MAKE) -j 16 solver

MPICXX   = mpic++ -Wall -Wno-sign-compare #-Wno-unused-variable
CXXFLAGS += -DNDEBUG -O3 -std=c++17 -DVERSION=1.0.0 -DEMAIL=ava.clifton.ac@gmail.com
#CXXFLAGS += -rdynamic -ggdb -O0 -std=c++17 -DVERSION=1.0.0 -DEMAIL=ava.clifton.ac@gmail.com
LDFLAGS  = -lstdc++fs

OBJS = main.o \
	   Problem.o \
	   Utils.o \
	   Obligation.o \
	   Global.o \
	   MPI_Interface.o \
	   Compressed_State.o \
	   Compressed_Actions.o \
	   Success.o \
	   Contextless_Reason.o \
	   Reason_From_Orchestrator.o \
	   Reason_From_Worker.o \
	   MPI_Worker.o \
	   Obligation_Processor.o \
	   Lingeling.o \
	   Distributed_Worker_Interface.o \
	   Serial_Worker_Interface.o \
	   Worker_Interface.o \
	   Log.o \
	   Shape.o \
	   Rect.o \
	   Layers.o \
	   Plan_Builder.o \
	   Strategies.o \
	   Stats.o \
	   nondeterminism/ND_Manager.o \
	   nondeterminism/Goal_States_Graph.o \
	   queue/Heuristics.o \
	   queue/Single_Layer_Of_Queue.o \
	   queue/Queue_Reference.o \
	   queue/Queue_Entry.o \
	   queue/Queue_Entry_Container.o \
	   queue/Default_Queue.o
					
HEADERS	= main.h \
		  Problem.h \
		  Utils.h \
		  Obligation.h \
		  Global.h \
		  MPI_Interface.h \
		  Compressed_State.h \
		  Compressed_Actions.h \
		  Success.h \
		  Contextless_Reason.o \
		  Reason_From_Orchestrator.o \
		  Reason_From_Worker.o \
		  MPI_Worker.h \
		  Obligation_Processor.h \
		  Lingeling.h \
		  Distributed_Worker_Interface.h \
		  Serial_Worker_Interface.h \
		  Worker_Interface.h \
		  Log.h \
		  Shape.h \
		  Rect.h \
		  Layers.h \
		  Plan_Builder.h \
		  Strategies.h \
		  Stats.h \
		  nondeterminism/ND_Manager.h \
		  nondeterminism/Goal_States_Graph.h \
		  queue/Heuristics.h \
		  queue/Single_Layer_Of_Queue.h \
		  queue/Queue_Reference.h \
		  queue/Queue_Entry.h \
		  queue/Queue_Entry_Container.h \
		  queue/Default_Queue.h

INCLUDES += -I../lingeling \
            -I./parallel \
            -I./queue \
			-I../rapidjson/include \
			-I.

LDFLAGS += -L../lingeling \
		   -L./queue \
		   -llgl \

solver: $(OBJS) 
	$(MPICXX) $(CXXFLAGS) $(INCLUDES) $(OBJS) -L. -llgl $(LDFLAGS) -o parallel-pdr

%.o: %.cpp %.h $(HEADERS) makefile
	$(MPICXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@ 

clean:
	-rm parallel-pdr *.o ./parallel/*.o ./queue/*.o
