hello :- write('Hello! What is your name?'), nl,
        read(Name), write('Have a nice day '),
        write(Name), write('. ;-)').


%% 1.1 determine if a list is a set
isset([]) :- !.
isset([H|T]) :- isset(T),\+ member(H,T).
isinputset :- write('Write a list'), nl, 
              read(List),isset(List).

%% 1.2 count the number of vowels in a list
isvowel(X):- member(X,[a,e,i,o,u]).
nr_vowel([],0).
nr_vowel([H|T],X):- nr_vowel(T,Y),
                    (isvowel(H) -> X is Y+1; X is Y).

%% 1.3 substitue one element for another in a list
%% I don't get this...
subst(New,Old,[],[]).
subst(New,Old,[Old|Tail],[New|RTail]):- subst(New,Old,Tail,RTail).
subst(New,Old,[Head|Tail],[Head|Rtail]):- subst(New,Old,Tail,RTail),\+ Head=Old.

%% 1.4 Return all permutations of a list
%% Adds an element to any place in a list
add(X,L,[X|L]).
add(X,[L|H],[L|R]):- add(X,H,R).

%% and then permute 
permute([],[]).
permute([L|H],R):- permute(H,R1),add(L,R1,R).
permutations(L,R):- findall(P,permute(L,P),R). 