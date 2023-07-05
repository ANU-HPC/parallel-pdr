default:
	$(MAKE) all -j16
all: solver lingeling_then_pdr mad val fd h2-fd-preprocessor
fd: FORCE
	{ cd pddl-parser-fd/downward && python build.py release; }
lingeling_then_pdr:
	$(MAKE) lingeling -j16
	$(MAKE) solver -j16
test:
	./tests/test.sh
clean:
	$(MAKE) -C madagascar clean
	$(MAKE) -C extract clean
	$(MAKE) -C solver clean
	$(MAKE) -C lingeling clean
	./VAL/scripts/linux/clean.sh all release
mad: FORCE
	$(MAKE) -C madagascar -j 16; true
	$(MAKE) -C madagascar -j 16
	$(MAKE) -C extract -j 16
solver: FORCE
	$(MAKE) -C solver -j 16
val: FORCE 
	./VAL/scripts/linux/build_linux64.sh all release -j 16
lingeling: FORCE
	cd lingeling && ./configure.sh && cd ..
	$(MAKE) -C lingeling -j 16
h2-fd-preprocessor: FORCE
	cd h2-fd-preprocessor && mkdir -p builds/release32 && cd builds/release32 && cmake ../../ && make -j 4
FORCE:
