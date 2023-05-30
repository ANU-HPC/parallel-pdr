default:
	$(MAKE) -j 16 solver

MPICXX   = mpic++ -Wall -Wno-sign-compare #-Wno-unused-variable
CXXFLAGS += -O3 -std=c++17 -DVERSION=1.0.0 -DEMAIL=marshall.clifton@anu.edu.au
LDFLAGS  = -lglog -lstdc++fs

OBJS = main.o \
	   Problem.o
					
HEADERS	= main.h \
		  Problem.h

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
