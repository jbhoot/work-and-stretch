type activity = 
    | Work of int
    | Stretch of int

let make_activity_status_generator activity =
    let activity_name, duration = match activity with
    | Work duration -> ("Work", duration)
    | Stretch duration -> ("Stretch", duration)
    in 
    Printf.sprintf "\r%s for %02dm%02ds. Time left: %02dm%02ds " activity_name (duration / 60) (duration mod 60)

let rec run_activity activity generate_activity_status =
    match activity with
    | Work 0
    | Stretch 0 -> 
        print_string (generate_activity_status 0 0);
        print_endline "";
        let _ = Sys.command "mpv ./pristine.mp3" in
        ()
    | Work duration ->
        print_string (generate_activity_status (duration / 60) (duration mod 60));
        flush stdout;
        Unix.sleep 1;
        run_activity (Work (duration - 1)) generate_activity_status
    | Stretch duration -> 
        print_string (generate_activity_status (duration / 60) (duration mod 60));
        flush stdout;
        Unix.sleep 1;
        run_activity (Stretch (duration - 1)) generate_activity_status

let rec run_activities current_activity next_activity =
    run_activity current_activity (make_activity_status_generator current_activity);
    run_activities next_activity current_activity;
    ()

let stretch_duration = ref 120
let work_duration = ref 600
let arg_spec = [
    ("-work", Arg.Set_int work_duration, Printf.sprintf "Work duration in seconds. Default is %d seconds (= %d minutes)." !work_duration (!work_duration / 60));
    ("-stretch", Arg.Set_int stretch_duration, Printf.sprintf "Break duration in seconds. Default is %d seconds (= %d minutes)." !stretch_duration (!stretch_duration / 60));
]
let anon_inputs = ref []
let anon_args input = 
    anon_inputs := input :: !anon_inputs

let () = 
    Arg.parse arg_spec anon_args "Stretch and work at regular intervals";
    run_activities (Work !work_duration) (Stretch !stretch_duration)
