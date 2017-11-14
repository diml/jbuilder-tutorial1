open Printf

let () =
  let nums = Array.make 101 true in
  nums.(0) <- false;
  nums.(1) <- false;
  for i = 2 to 100 do
    let n = ref (i * 2) in
    while !n <= 100 do
      nums.(!n) <- false;
      n := !n + i
    done
  done;
  let primes =
    Array.to_list nums
    |> List.mapi (fun i x -> i, x)
    |> List.filter (fun (i, x) -> x)
    |> List.map fst
  in
  printf "let primes100 =\n";
  let sep = ref '[' in
  List.iter
    (fun n ->
       printf "  %c %d\n" !sep n;
       sep := ';')
    primes;
  printf "  ]\n"
