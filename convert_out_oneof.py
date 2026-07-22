import sys
import itertools

def find_matching_closing_bracket(string, open_bracket_loc):
    assert string[open_bracket_loc] == "("
    depth = 0
    i = open_bracket_loc
    while True:
        if string[i] == "(":
            depth += 1
        if string[i] == ")":
            depth -= 1
        if depth == 0:
            return i
        i+=1

def break_into_bracketed(string):
    # takes: "(AA)(and (11)(22))(BB)" into [(
    #print("break_into_bracketed:", string)
    if string == "":
        return []

    assert string[0] == "("
    assert string[-1] == ")"

    stop = find_matching_closing_bracket(string, 0)
    
    component = string[1:stop]
    rest = string[stop+1:]

    assert component[0] != "("

    return [tokenize(component)] + break_into_bracketed(rest)

def tokenize(string):
    # takes: "and (AA)(and (11)(22))(BB)" => [("and", [("AA", []), ("and", ["11","22"]), ("BB", [])]
    #print("tokenize:", string)
    if "(" not in string:
        return (string, [])

    first_open = string.find("(")
    header = string[:first_open]

    assert header[0] != "("

    return (header, break_into_bracketed(string[first_open:]))

def combine_conjuncts(combo):
    args = []
    for x in combo:
        assert x[0] == "and"
        args.extend(x[1])

    return ("and", args)

def token_to_string(token):
    ret_val = "(" + token[0]
    for child_token in token[1]:
        ret_val += token_to_string(child_token)
    return ret_val + ")"

def normalize_effect(string):
    assert string[0] == "("
    assert string[-1] == ")"

    num_oneofs = string.count("oneof")

    if num_oneofs == 0:
        return string
    if (num_oneofs == 1) and (string[:6] == "(oneof"):
        return string
    if string[:4] != "(and":
        print(string[:4])
        print("Error, not a conjunctive effect")
        exit(1)

    root_token = tokenize(string[1:-1])
    assert root_token[0] == "and"

    non_oneof_parts_of_conjunct = [token for token in root_token[1] if token[0] != "oneof"]
    set_of_oneof_sets = [token[1] for token in root_token[1] if token[0] == "oneof"]

    # make sure each part of the oneofs is a conjunct
    for i in range(len(set_of_oneof_sets)):
        oneof_set = set_of_oneof_sets[i]
        for j in range(len(oneof_set)):
            one = oneof_set[j]

            # we want these to be conjuncts, if they are not, make them so
            if one[0] != "and":
                one = ("and", [one])

            oneof_set[j] = one
        set_of_oneof_sets[i] = oneof_set

    constructed_oneof_terms = []
    for combo in itertools.product(*set_of_oneof_sets):
        oneof_term_parts = list(combo)
        oneof_term_parts.append(("and", non_oneof_parts_of_conjunct))
        constructed_oneof_terms.append(combine_conjuncts(oneof_term_parts))

    return token_to_string(("oneof", constructed_oneof_terms))

def parse(string):
    # go through the string splitting it into effects, and everything else
    effect_tag_loc = string.find(":effect")
    if effect_tag_loc == -1:
        # no more, return as is
        return [string]
    else:
        open_bracket_loc = string.find("(", effect_tag_loc, len(string))
        close_bracket_loc = find_matching_closing_bracket(string, open_bracket_loc)

        before = string[:open_bracket_loc]
        effect = string[open_bracket_loc:close_bracket_loc+1]
        after = string[close_bracket_loc+1:]

        return [before, effect] + parse(after)

def pretty_print(string):
    indent = 0
    for c in string:
        if c == "(":
            indent += 2
            print(c, end='')
        elif c == ")":
            indent -= 2
            print(c)
            print(" "*indent, end="")
        else:
            print(c, end="")

#main
with open(sys.argv[1]) as f:
    normalized_string = ""
    for line in f.readlines():
        normalized_string += line.rstrip()

    # get rid of some spaces
    while True:
        before_size = len(normalized_string)


        replacements = [
                ("  "," "),
                ("\t"," "),
                ("( ", "("),
                (") ", ")"),
                (" )", ")"),
                (" (", "("),
                ]

        for old, new in replacements:
            x = normalized_string.split(old)
            normalized_string = new.join(x)

        if len(normalized_string) == before_size:
            break

    document = parse(normalized_string)

    output_unformatted_string = document[0]
    for i in range(1,len(document)):
        part = document[i]
        if ":effect" in document[i-1]:
            output_unformatted_string += normalize_effect(part)
        else:
            output_unformatted_string += part

    pretty_print(output_unformatted_string)
