#include<stdio.h>
#include<stdlib.h> 
#include"convert.h"
#include<iostream>

using namespace std;

int main(int argc, char* argv[]) {
    // Generate the problem file using Madagascar
    convert_main(argc-1, argv, argv[argc-1]);
    return 0;
}
