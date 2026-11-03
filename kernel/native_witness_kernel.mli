@@ stateless

(* $MDX part-begin=native_witness_intf *)

type t : void mod everything

type t_opt : immediate = private
  | Native of t [@immediate_all_void_constructor]
  | Not_native
[@@warning "-incompatible-with-upstream"]

val am_on_native : unit# -> t_opt [@@zero_alloc]
val am_on_native_exn : unit# -> t [@@zero_alloc]

(* $MDX part-end *)
