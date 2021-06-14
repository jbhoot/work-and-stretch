type duration_type = 
    | SIT
    | WALK

let execute_duration duration_type time =
    let msg = match duration_type with
        | SIT -> "Sit"
        | WALK -> "Walk"
    in
    let () = print_endline msg in
    let () = Unix.sleep time in
    let _ = Sys.command "mpv ./pristine.mp3" in
    ()

let rec track dt = 
    match dt with
    | SIT -> 
        let () = execute_duration dt 480 in
        track WALK
    | WALK ->
        let () = execute_duration dt 90 in
        track SIT