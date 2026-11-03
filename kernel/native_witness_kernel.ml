type t = unit#

type t_opt =
  | Native of t [@immediate_all_void_constructor]
  | Not_native
[@@warning "-incompatible-with-upstream"]

let am_on_native #() =
  match Sys.backend_type, Sys.word_size with
  | Native, 64 -> Native #()
  | _ -> Not_native
;;

type nothing = |

external raise : ('a : value_or_null). exn -> nothing @@ stateless = "%reraise"

let am_on_native_exn #() =
  match am_on_native #() with
  | Native t -> t
  | Not_native ->
    (match
       raise
         (Failure
            "[Native_witness_kernel.am_on_native_exn]: not running on 64-bit native \
             backend")
     with
     | _ -> .)
;;
