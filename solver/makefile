default:
	$(MAKE) -j 16 solver

MPICXX   = mpic++ -Wall -Wno-sign-compare #-Wno-unused-variable

# full efficiency
CXXFLAGS += -DNDEBUG -O3 -std=c++17 -DVERSION=1.0.0 -DEMAIL=ava.clifton.ac@gmail.com

# full debugging
#CXXFLAGS += -rdynamic -pg -ggdb -O0 -std=c++17 -DVERSION=1.0.0 -DEMAIL=ava.clifton.ac@gmail.com

# efficient with profiling
#CXXFLAGS += -rdynamic -pg -ggdb -O3 -DNDEBUG -std=c++17 -DVERSION=1.0.0 -DEMAIL=ava.clifton.ac@gmail.com
 
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
	   State_ID_Manager.o \
	   SCC_Generator.o \
	   Goal_Reachability_Manager.o \
	   State_Action_Graph.o \
	   State_Action_To_Stateaction.o \
	   Int_Bitmap.o \
	   Int_Iterable_Bitmap.o \
	   Heuristics.o \
	   Single_Layer_Of_Queue.o \
	   Queue_Reference.o \
	   Queue_Entry.o \
	   Queue_Entry_Container.o \
	   Default_Queue.o \
	   Open_States_Tracking_Queue.o \
	   Depth_First_Queue.o \
	   Wrapper_Queue.o
					
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
		  State_ID_Manager.h \
		  SCC_Generator.h \
		  Goal_Reachability_Manager.h \
		  State_Action_Graph.h \
		  State_Action_To_Stateaction.h \
		  Int_Bitmap.h \
		  Int_Iterable_Bitmap.h \
		  Heuristics.h \
		  Single_Layer_Of_Queue.h \
		  Queue_Reference.h \
		  Queue_Entry.h \
		  Queue_Entry_Container.h \
		  Default_Queue.h \
		  Open_States_Tracking_Queue.h \
		  Depth_First_Queue.h \
		  Wrapper_Queue.h

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
