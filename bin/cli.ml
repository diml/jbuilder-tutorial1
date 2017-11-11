open Cmdliner

let fact =
  ( Term.(const (fun n -> Printf.printf "%d\n" (Math.fact n))
          $ Arg.(required & pos 0 (some int) None & Arg.info [] ~docv:"N"))
  , Term.info "fact"
      ~doc:"Compute and print the factorial of a number"
      ~man:[ `S "DESCRIPTION"
           ; `P {|$(b,math fact N) computes and print the factorial of $(b,N)|}
           ]
  )

let gcd =
  ( Term.(const (fun a b -> Printf.printf "%d\n" (Math.gcd a b))
          $ Arg.(required & pos 0 (some int) None & Arg.info [] ~docv:"A")
          $ Arg.(required & pos 1 (some int) None & Arg.info [] ~docv:"B"))
  , Term.info "gcd"
      ~doc:"Compute and print the greatest common divisor of two numbers"
      ~man:[ `S "DESCRIPTION"
           ; `P {|$(b,math gcd N) computes and print the factorial of $(b,N)|}
           ]
  )

let all = [fact; gcd]

let default =
  let doc = "Math utilities" in
  ( Term.(ret (const (`Help (`Pager, None))))
  , Term.info "math" ~doc
      ~man:
        [ `S "DESCRIPTION"
        ; `P {|The $(b,math) command line tools provide math functions
               in shell scripts.
             |}
        ]
  )

let _ = Term.eval_choice default all ~catch:true
