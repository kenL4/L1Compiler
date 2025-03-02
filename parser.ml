type token = 
    | BOOL_tok of bool (* true | false *)
    | INT_tok of int   (* [0-9]+ *)
    | PLUS_tok         (* + *)
    | GEQ_tok          (* >= *)
    | IF_tok           (* if *)
    | THEN_tok         (* then *)
    | ELSE_tok         (* else *)
    | SKIP_tok         (* skip *)
    | WHILE_tok        (* while *)
    | DO_tok           (* do *)
    | ASSIGN_tok       (* ::= *)
    | DEREF_tok        (* ! *)
    | BREAK_tok        (* Refers to ; for splitting statements*)
    | ID_tok of string(* (a-zA-Z)+ *)
    | WHITESPACE_tok

let rec string_of_tok = function
| BOOL_tok b    -> (if b then "true"
                         else "false")
| INT_tok x     -> (string_of_int x)
| PLUS_tok      -> ("+")
| GEQ_tok       -> (">=")
| IF_tok        -> ("_if")
| THEN_tok      -> ("_then")
| ELSE_tok      -> ("_else")
| SKIP_tok      -> ("_skip")
| WHILE_tok     -> ("_while")
| DO_tok        -> ("_do")
| ASSIGN_tok    -> ("::=")
| DEREF_tok     -> ("!")
| BREAK_tok     -> (";")
| ID_tok s      -> (s)
| WHITESPACE_tok-> (" ")

and print_stream = function
| [] -> print_endline ""
| x::xs -> print_string (string_of_tok x); print_stream xs