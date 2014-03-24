module la.
  type append  list A -> list A -> list A -> o.

  append nil K K.
  append (X::XS) YS (X::ZS) :- append XS YS ZS.
  #end.
module la.