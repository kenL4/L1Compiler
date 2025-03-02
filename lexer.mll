{
open Parser
exception EoF
}

let ident_regexp = ['a'-'z''A'-'Z']+
let int_regexp = ['0'-'9']+

rule token = parse 
  ident_regexp as s {ID_tok s}
| int_regexp as i {INT_tok (int_of_string i)}
| '+' {PLUS_tok}
| ">=" {GEQ_tok}
| "if" {IF_tok}
| "then" {THEN_tok}
| "else" {ELSE_tok}
| "skip" {SKIP_tok}
| "while" {WHILE_tok}
| "do" {DO_tok}
| ":=" {ASSIGN_tok}
| "!" {DEREF_tok}
| ";" {BREAK_tok}
| [' ' '\n'] { WHITESPACE_tok }
| eof {raise EoF} (* special case *)
