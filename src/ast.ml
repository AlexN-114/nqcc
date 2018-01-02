(* Data types representing an abstract syntax tree *)
type const = 
    | Int of int
    | Char of char
    | String of string
type type_def = 
    | IntType
    | CharType
type binop = 
    | Add 
    | Sub 
    | Mult 
    | Div
    | Mod
    | Lt 
    | Gt 
    | Le 
    | Ge
    | Neq
    | Eq
    | And
    | Or
    | BitAnd
    | BitOr
    | Xor
    | ShiftL
    | ShiftR
type assign_op =
    | Equals (* = *)
type unop = Negate | Pos | Complement | Not
type id = ID of string
type exp = 
    | Const of const
    | Var of id
    | UnOp of unop * exp
    | BinOp of binop * exp * exp
    | Assign of assign_op * id * exp
    | FunCall of id * exp list
type statement =
    | DeclareVar of type_def * id * exp option (* optional initial value *)
    | If of exp * statement list * statement list option (* condition, if body, optional else body *)
    | Exp of exp
    | ReturnVal of exp (* should we add a return_exp instead? *)
type fun_param = Param of type_def * id
type fun_body = Body of statement list
type fun_decl = FunDecl of type_def * id * fun_param list * fun_body
type prog = Prog of fun_decl list