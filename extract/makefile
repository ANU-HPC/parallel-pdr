CC = g++ -Wall -pedantic -O3 # -g -ggdb -enable-libstdcxx-debug # NDEBUG
HEADERS = extract.h ../madagascar/convert.h
OBJS = extract.o ../madagascar/convert_library.a

extract: $(OBJS) 
	$(CC) $(OBJS) -o extract

$(OBJS): $(HEADERS) makefile

.cpp.o: 
	$(CC) -c $< 

clean:
	@rm -f extract
	@rm -f *.o
