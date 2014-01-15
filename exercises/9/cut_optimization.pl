%% 9.1
%% 4.1 get all sublists of elements that add up to sum
%% nope: sum_sublist(List,Sum,Sublist):- subset(Sublist,List),sum(Sublist,Sum).
sum_sublist([],0,[]):-!.
sum_sublist([Head|Tail],Sum,[Head|STail]) :- Sum1 is Sum - Head,
                                             sum_sublist(Tail,Sum1,STail).
sum_sublist([_|Tail],Sum,STail) :- sum_sublist(Tail,Sum,STail).

%% 9.2 
%% Introducing the =.. operator!
%% Goes from term to list.  So taking a function call
%% and converting it into a list which is composed of the funcitons
%% name followed by the names of the arguments to the function.
%% It's called the Univ-operator
expand(Term,Arg,NewTerm):-
  Term =.. List,
  append(List,[Arg],ListNew),
  NewTerm=..ListNew.

%% Yields true if each variable in a term has been instantiated
inst(Term):-
  atomic(Term),!.
inst(Term):-
  \+ var(Term),
  Term=..L,
  test(L).

test([]).
test([H|T]):-
  inst(H),
  test(T).

%% ...

%% also, atom, atomic, var, variable, and number
%% atomic means variable or number

%% 9.3
%% repeat: allows you do run a program infinitely in a loop
%% fail: says go to the next backtracking point.