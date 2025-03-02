open Parser 
let _ =
  let in_file = open_in "myprog.l1" in
  try
    let lexbuf = Lexing.from_channel in_file in
    while true do
      let result = Lexer.token lexbuf in
        print_string (string_of_tok result); flush stdout
    done
  with Lexer.EoF -> close_in in_file; print_endline ""; exit 0