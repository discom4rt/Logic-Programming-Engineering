write_n([X|Xs]) :- write(X),write_n(Xs).
write_n([]).

sum([],0).
sum([H|T],Sum) :- sum(T, Memo),
                    Sum is H + Memo.
subset([],_).
subset([H|T],List) :- member(H,List),
                      subset(T,List).

%% 4.1 get all sublists of elements that add up to sum
%% nope: sum_sublist(List,Sum,Sublist):- subset(Sublist,List),sum(Sublist,Sum).
sum_sublist([],0,[]).
sum_sublist([Head|Tail],Sum,[Head|STail]) :- Sum1 is Sum - Head,
                                             sum_sublist(Tail,Sum1,STail).
sum_sublist([_|Tail],Sum,STail) :- sum_sublist(Tail,Sum,STail).

%% 4.2 prime
%% has_factor(10,)
%% F + 2 * k is the next candidate
%% 3, 5, 7, 9
%% has_factor(N,3) :- mod(N,3)=0.
has_factor(N,F) :- 0 =:= N mod F -> 
                   write_n([F, ' is a factor of ', N,'.']),
                   nl;
                   F1 is F + 2,
                   F1 * F1 =< N,
                   has_factor(N,F1).

prime(2).
prime(3).
prime(N) :- N > 3,
            (0 =:= N mod 2 -> 
              write_n([N,' has a factor 2']),fail;
              \+ has_factor(N,3)).

%% 4.3 Convert a decimal number into a string of roman numerals
roman(N, R) :- numeral(N,[1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1],
[ 'M', 'CM', 'D', 'CD', 'C', 'XC', 'L', 'XL', 'X', 'IX',' V', 'IV', 'I'],R).

numeral(0,_,_,'').
numeral(N,[N1|NL2],[_|RL2],R) :- N > 0,
                                 N < N1,
                                 numeral(N,NL2,RL2,R).
numeral(N,[N1|NT],[R1|RT],R) :- N >= N1,
                               N2 is N - N1,
                              numeral(N2,[N1|NT],[R1|RT],R2),
                              atom_concat(R1,R2,R).
