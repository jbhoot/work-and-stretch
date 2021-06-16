type activity = 
    | Work of int
    | Stretch of int

let run time =
    let () = Unix.sleep (time * 60) in
    let _ = Sys.command "mpv ./pristine.mp3" in
    ()    

let rec run_activity current_activity next_activity =
    let msg, duration = match current_activity with
        | Work duration -> (Printf.sprintf "Work for %d minutes" duration, duration)
        | Stretch duration -> (Printf.sprintf "Stretch for %d minutes" duration, duration)
    in
    print_endline msg;
    run duration;
    run_activity next_activity current_activity

let stretch_duration = ref 2
let work_duration = ref 10
let arg_spec = [
    ("--work", Arg.Set_int work_duration, Printf.sprintf "Work duration in minutes. Default is %d minutes." !work_duration);
    ("--stretch", Arg.Set_int stretch_duration, Printf.sprintf "Break duration in minutes. Default is %d minutes." !stretch_duration);
]
let anon_inputs = ref []
let anon_args input = 
    anon_inputs := input :: !anon_inputs

let () = 
    Arg.parse arg_spec anon_args "Stretch and work at regular intervals";
    run_activity (Work !work_duration) (Stretch !stretch_duration)