open Cmdliner

let fact =
  ( Term.(const Math.fact
          $ Arg.(required & pos 0 (some int) None & Arg.info [] ~docv:"N"))
  , Term.info "fact"
      ~doc:"Compute and print the factorial of a number"
      ~man:[ `S "DESCRIPTION"
           ; `P {|$(b,math fact N) computes and print the factorial of $(b,N)|}
           ; `Blocks help_secs
           ]
  )

let gcd =
  ( Term.(const Math.fact
          $ Arg.(required & pos 0 (some int) None & Arg.info [] ~docv:"N"))
  , Term.info "gcd"
      ~doc:"Compute and print the greatest common divisor of two numbers"
      ~man:[ `S "DESCRIPTION"
           ; `P {|$(b,math gcd N) computes and print the factorial of $(b,N)|}
           ; `Blocks help_secs
           ]
  )

let all = [fact; gcd]

let default =
  let doc = "Math utilities" in
  ( Term.(ret (const (fun _ -> `Help (`Pager, None)) $ common))
  , Term.info "math" ~doc
      ~man:
        [ `S "DESCRIPTION"
        ; `P {|The $(b,math) command line tools provide math functions
               in shell scripts.
             |}
        ]
  )

let _ = Term.eval_choice default all ~catch:true
