# 2023 (C) Jussi Rintanen, jrintanen.jr@gmail.com

EXECUTABLE = pfronten

INSTRUMENT = -g -ggdb -pg -DDEBUG

# The following options are specific to GCC. Disable when necessary (e.g. in OS X).
GCCOPTIMIZE= $(ARCH) -O3 -fprefetch-loop-arrays -funroll-loops -ftree-loop-im -ftracer -maccumulate-outgoing-args -momit-leaf-frame-pointer #-falign-functions=64

CFLAGS = $(GCCOPTIMIZE) -w -Wall

PARSERGENERATOR=bison
PARSERC = parser.tab.c
PARSERH = parser.tab.h
PARSER=parser
#PARSERGENERATOR=yacc
#PARSERC = y.tab.c
#PARSERH = y.tab.h
#PARSER=y

CC = gcc

LINKFLAGS = $(ARCH) -static

OBJ = $(PARSER).tab.o main.o asyntax.o lex.yy.o tables.o operators.o invariants.o intsets.o cleanup.o ground.o oneofs.o
HDR = asyntax.h cleanup.h intsets.h invariants.h main.h oneofs.h operators.h tables.h

all: pfronten


pfronten: lex.yy.c Makefile $(PARSERC) $(OBJ) $(HDR)
	$(CC) $(LINKFLAGS) $(LINKFEATURES) $(INSTRUMENT) $(OBJ) -o $(EXECUTABLE)

%.o: %.c Makefile $(HDR)
	$(CC) $(CFLAGS) $(AMD64FLAGS) -c $<

$(PARSERC): parser.y
	$(PARSERGENERATOR) -d parser.y

$(PARSERH): parser.y
	$(PARSERGENERATOR) -d parser.y

lex.yy.c: lexer.lex $(PARSERH) $(PARSERH)
	flex lexer.lex

clean:
	rm -f $(OBJ) $(PARSERC) $(PARSERH)

tar:
	tar cvf PFRONTEN.TAR Makefile README asyntax.h cleanup.h intsets.h invariants.h main.h oneofs.h operators.h tables.h asyntax.c ground.c invariants.c main.c operators.c tables.c cleanup.c intsets.c oneofs.c parser.y lexer.lex
