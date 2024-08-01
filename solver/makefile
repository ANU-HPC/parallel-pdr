default:
	$(MAKE) -j 16 solver

MPICXX   = mpic++ -Wall -Wno-sign-compare #-Wno-unused-variable

# full efficiency
#CXXFLAGS += -DNDEBUG -O3 -std=c++17 -DVERSION=1.0.0 -DEMAIL=ava.clifton.ac@gmail.com

# full debugging
#CXXFLAGS += -rdynamic -pg -ggdb -O0 -std=c++17 -DVERSION=1.0.0 -DEMAIL=ava.clifton.ac@gmail.com

# efficient with profiling
CXXFLAGS += -rdynamic -pg -ggdb -O3 -DNDEBUG -std=c++17 -DVERSION=1.0.0 -DEMAIL=ava.clifton.ac@gmail.com
 
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
	   Stopwatch.o \
	   nondeterminism/State_ID_Manager.o \
	   nondeterminism/SCC_Generator.o \
	   nondeterminism/Goal_Reachability_Manager.o \
	   nondeterminism/State_Action_Graph.o \
	   nondeterminism/State_Action_To_Stateaction.o \
	   data_structures/Int_Bitmap.o \
	   data_structures/Int_Iterable_Bitmap.o \
	   queue/Heuristics.o \
	   queue/Single_Layer_Of_Queue.o \
	   queue/Queue_Reference.o \
	   queue/Queue_Entry.o \
	   queue/Queue_Entry_Container.o \
	   queue/Default_Queue.o \
	   queue/Open_States_Tracking_Queue.o \
	   queue/Depth_First_Queue.o \
	   queue/Wrapper_Queue.o
					
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
		  Stopwatch.h \
		  nondeterminism/State_ID_Manager.h \
		  nondeterminism/SCC_Generator.h \
		  nondeterminism/Goal_Reachability_Manager.h \
		  nondeterminism/State_Action_Graph.h \
		  nondeterminism/State_Action_To_Stateaction.h \
		  data_structures/Int_Bitmap.h \
		  data_structures/Int_Iterable_Bitmap.h \
		  queue/Heuristics.h \
		  queue/Single_Layer_Of_Queue.h \
		  queue/Queue_Reference.h \
		  queue/Queue_Entry.h \
		  queue/Queue_Entry_Container.h \
		  queue/Default_Queue.h \
		  queue/Open_States_Tracking_Queue.h \
		  queue/Depth_First_Queue.h \
		  queue/Wrapper_Queue.h

INCLUDES += -I../lingeling \
            -I./parallel \
            -I./queue \
			-I../rapidjson/include \
			-I. \
			#-I/usr/lib/x86_64-linux-gnu \

LDFLAGS += -L../lingeling \
		   -L./queue \
		   -llgl \
		   # -L/usr/lib/x86_64-linux-gnu \
		   #-lprofiler \

solver: $(OBJS) 
	$(MPICXX) $(CXXFLAGS) $(INCLUDES) $(OBJS) -L. -llgl $(LDFLAGS) -o parallel-pdr

%.o: %.cpp %.h $(HEADERS) makefile
	$(MPICXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@ 

clean:
	-rm parallel-pdr *.o ./parallel/*.o ./queue/*.o ./nondeterminism/*.o
