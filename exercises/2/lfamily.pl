  male([ali, carl, ed, frank, hugo, kurt, rene, tino, vico]).

  female([berta, dora, guna, ina, jane, laura, mia, olga, wera, susan, uta]).

  father(ali, [guna, hugo]).        father(carl, [ina, jane]).
  father(ed, [kurt]).               father(frank, [mia, olga]).
  father(hugo, [wera, rene, vico]). father(kurt, [tino, uta]).

  mother(berta, [guna, hugo]).      mother(dora, [ina, jane]).
  mother(guna, [mia, olga]).        mother(ina, [wera, rene, vico]).
  mother(jane, [susan]).            mother(laura, [tino, uta]).

  %% F and M are the parents of the the children in CL
  lparents([F, M], CL) :- father(F, CL), mother(M, CL).

  %% B is the brother of C
  lbrother(B, C) :- lparents([FB, MB], CL),member(B, CL),member(C, CL),\+ B=C,male(B).

  %% G is the grandpa of C
  lgrandpa(G, C) :- father(G, PL),
                    member(F, PL),
                    (father(F, CL); mother(F, CL)),
                    member(C, CL).
  
  %% Exercise 2.2
  %% Delete the last item from a list
  dellastelem([_], []).
  dellastelem(List, DList) :- last(List, Last),
                              select(Last, List, DList).
  %% Other solution
  %% dellastelem(L,DL) :- append(DL,[_],L).

  %% Compute the scalar product of two vectors
  scalar([X],[Y],S) :- S is X*Y.
  scalar([H1 | V1], [H2 | V2], S) :- scalar(V1, V2, P),
                                     S is H1 * H2 + P.

  %% delete duplicate items from a list
  delduplelems(List, DList) :- dedupe(List, [], DList).


  dedupe([],List,List).
  dedupe([Head | List], New, Result) :- \+ member(Head, New),
                                        append(New,[Head],Other),
                                        dedupe(List,Other,Result).

  %% We also need to define the case where the head element is a member
  %% of the new list, in which case we ignore it.
  dedupe([Head | List], New, Result) :- member(Head,New),
                                        dedupe(List,New,Result).

  %% IMPORTANT
  %% Can't have a variable on two sides of an assignment 
