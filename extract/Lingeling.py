from ctypes import cdll
import ctypes
import math
lib = cdll.LoadLibrary('./liblgl.so')

lib.lglinit.restype = ctypes.c_void_p

lib.lglrelease.argtypes = [ctypes.c_void_p]

lib.lgladd.argtypes = [ctypes.c_void_p, ctypes.c_int]

lib.lglfreeze.argtypes = [ctypes.c_void_p, ctypes.c_int]

lib.lglclone.argtypes = [ctypes.c_void_p]

lib.lglsat.argtypes = [ctypes.c_void_p]

lib.lglderef.argtypes = [ctypes.c_void_p, ctypes.c_int]

lib.lglfailed.argtypes = [ctypes.c_void_p, ctypes.c_int]

lib.lglmaxvar.argtypes = [ctypes.c_void_p]

lib.lglassume.argtypes = [ctypes.c_void_p, ctypes.c_int]

lib.lglcassume.argtypes = [ctypes.c_void_p, ctypes.c_int]


class Lingeling:
    def __init__(self, bootstrap_with=[], solver=None):
        if solver == None: self.obj = lib.lglinit()
        else: self.obj = solver
        if solver != None and bootstrap_with: assert 0
        for clause in bootstrap_with:
            self.add_clause(clause)

    def solve(self, assumptions, clauseAssumption = None):
        self.assumptions = list(assumptions)
        for lit in assumptions: 
            lib.lglassume(self.obj, lit)
            lib.lglfreeze(self.obj, lit)
        if clauseAssumption != None:
            for lit in clauseAssumption: lib.lglcassume(self.obj, lit)
            lib.lglcassume(self.obj, 0)
        
        #print("start solver lib call")
        raw = lib.lglsat(self.obj)
        #print("end solver lib call:", raw < 15)

        if raw == 10: self.lastRun = True
        elif raw == 20: self.lastRun = False
        else: assert 0
        return self.lastRun

    def add_clause(self, clause):
        for lit in clause:
            lib.lgladd(self.obj, lit)
            lib.lglfreeze(self.obj, lit)
        lib.lgladd(self.obj, 0)

    def get_core(self):
        # NOT ACTUALLY A CORE, IF THE UNDERLYING CNF IS UNSAT THIS IS MEANINGLESS
        assert not self.lastRun
        core = []
        for lit in self.assumptions:
            if lib.lglfailed(self.obj, lit):
                core.append(lit)
        if len(core) == 0:
            print("assumptions: ", self.assumptions)
            assert len(core) != 0
        return core

    def set_assume_clause(self, clause):
        assert 0 # needs to be looked into
        for lit in clause:
            lib.lglcassume(self.obj, lit)
        lib.lglcassume(self.obj, 0)

    def copy(self):
        assert 0 # needs to be looked into
        return Lingeling(lib.lglclone(self.obj))

    def delete(self):
        lib.lglrelease(self.obj)

    def get_model(self):
        assignment = []
        for i in range(1, lib.lglmaxvar(self.obj) + 1):
            assignment.append(lib.lglderef(self.obj, i) * i)
        return assignment
