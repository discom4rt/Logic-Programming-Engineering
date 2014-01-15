%%  3.1 Delete the first N elements of a list
delfirstn(List,0,List).
delfirstn([_|T], N, DL) :-  N1 is N - 1,
                              delfirstn(T, N1, DL).

%% 3.2 Get the average of a list of numeric elements
sum([],0).
sum([H|T],Sum) :- sum(T, Memo),
                    Sum is H + Memo.

average(List,Av) :- sum(List,Sum),
                    length(List,Length),
                    Av is Sum/Length.

%% 3.2+ Calculate the sum AND the number of elements in a list
sum_length([],0,0).
sum_length([H|T],Sum,Length) :- sum_length(T,Memo,Lemo),
                                Sum is H + Memo,
                                Length is Lemo + 1.

average2(List,Av):- sum_length(List,Sum,Length),
                    Av is Sum/Length.

%% if A then B else C
%% (A -> B ; C)
%% ~* implication *~
%% 3.3 Get the maximum member of a list
maxmember([X],X).
maxmember([H|T],Max) :- maxmember(T, M),
                        (H>M -> Max is H ; Max is M).


%% 3.4 Euclids greatest common divisor
gcd(N1,0,N1):- N1>0,!. %% Explore the cut operator
gcd(N1,N2,D):- N2>0,
               R is N1 mod N2,
               gcd(N2,R,D).


%% Least common multiple
lcm(N1,N2,M):- N1>0,
               N2>0,
               gcd(N1,N2,D),
               M is (N1 // D) * N2.
