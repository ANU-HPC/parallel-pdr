# This file is a modified version of https://gist.github.com/roberthoenig/30f08b64b6ba6186a2cdee19502040b4

import sys

from typing import Any, List

# Parse input string into a list of all parentheses and atoms (int or str),
# exclude whitespaces.
def is_name(string):
    for c in string:
        if not (c.isalnum() or c in ["-", "_", ":"]):
            return False
    return True


def normalize_str(string: str) -> List[str]:
    str_norm = []
    last_c = None
    for c in string:
        if is_name(c):#.isalnum():
            if is_name(last_c):#.isalnum():
                str_norm[-1] += c
            else:
                str_norm.append(c)
        elif not c.isspace():
            str_norm.append(c)
        last_c = c
    return str_norm

# Generate abstract syntax tree from normalized input.
def get_ast(input_norm: List[str]) -> List[Any]:
    ast = []
    # Go through each element in the input:
    # - if it is an open parenthesis, find matching parenthesis and make recursive
    #   call for content in-between. Add the result as an element to the current list.
    # - if it is an atom, just add it to the current list.
    i = 0
    while i < len(input_norm):
        symbol = input_norm[i]
        if symbol == '(':
            list_content = []
            match_ctr = 1 # If 0, parenthesis has been matched.
            while match_ctr != 0:
                i += 1
                if i >= len(input_norm):
                    raise ValueError("Invalid input: Unmatched open parenthesis.")
                symbol = input_norm[i]
                if symbol == '(':
                    match_ctr += 1
                elif symbol == ')':
                    match_ctr -= 1
                if match_ctr != 0:
                    list_content.append(symbol)             
            ast.append(get_ast(list_content))
        elif symbol == ')':
                raise ValueError("Invalid input: Unmatched close parenthesis.")
        else:
            try:
                ast.append(int(symbol))
            except ValueError:
                ast.append(symbol)
        i += 1
    return ast

def is_all_string_components(l):
    for i in l:
        if type(i) != type("string"):
            return False
    return True

def print_ast(ast):
    print("","(", end='')
    for component in ast:
        if type(component) == type("string"):
            if component=="?":
                print("",component,end='')
            else:
                print("",component)
        else:
            print_ast(component)
    print("",")", end='')

parameters_cases = [":parameters", ":PARAMETERS"]
precondition_cases = [":precondition", ":PRECONDITION"]
effect_cases = [":effect", ":EFFECT"]

def fix(ast):
    assert len(ast) == 1
    new_ast = []
    for component in ast[0]:
        if component[0] in [":action", ":ACTION"]:
            #print(component)
            parts_ordered = [component[0]] + [component[1]] + [":parameters"] + [[]] + [":precondition"] + [[]] + [":effect"] + [[]]

            for i in range(len(component)):
                x = component[i]
                if type(x) == type("string") and x.lower() == ":parameters":
                    parts_ordered[3] = component[i+1]
                if type(x) == type("string") and x.lower() == ":precondition":
                    parts_ordered[5] = component[i+1]
                if type(x) == type("string") and x.lower() == ":effect":
                    parts_ordered[7] = component[i+1]

            #print(parts_ordered)
            component = parts_ordered

        new_ast.append(component)
    print_ast(new_ast)

def main():
    with open(sys.argv[1]) as f:
        input_str = " ".join([line.rstrip() for line in f.readlines()])
        input_norm = normalize_str(input_str)
        #print(input_norm)
        ast = get_ast(input_norm)
        fix(ast)

if __name__ == '__main__':
    main()
