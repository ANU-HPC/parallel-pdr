all: FORCE
	$(MAKE) lingeling -j16
	$(MAKE) mad -j16
	$(MAKE) pdr -j16
	$(MAKE) val -j16
test:
	./tests/test.sh
pdrclean:
	$(MAKE) -C summer1819/dagster clean
	$(MAKE) -C summer1819/dagster/pdr clean
	$(MAKE) -C pdr clean
clean:
	$(MAKE) -C madagascar clean
	$(MAKE) -C extract clean
	$(MAKE) -C summer1819/dagster clean
	$(MAKE) -C summer1819/dagster/pdr clean
	$(MAKE) -C pdr clean
	$(MAKE) -C lingeling clean
	./VAL/scripts/linux/clean.sh all release
mad: FORCE
	$(MAKE) -C madagascar -j 16; true 
	$(MAKE) -C madagascar -j 16 # repeat to handle asyntax.c compilation error
	$(MAKE) -C extract -j 16
pdr: FORCE
	$(MAKE) -C summer1819/dagster -j 16
	$(MAKE) -C summer1819/dagster/pdr -j 16
	$(MAKE) -C pdr -j 16
val: FORCE 
	./VAL/scripts/linux/build_linux64.sh all release -j 16
lingeling: FORCE
	cd lingeling && ./configure.sh && cd ..
	$(MAKE) -C lingeling -j 16

FORCE:
