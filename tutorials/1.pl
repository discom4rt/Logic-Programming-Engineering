direct(frankfurt,san_francisco).
direct(frankfurt,chicago).
direct(san_francisco,honolulu).
direct(honolulu,maui).

connection(X, Y) :- direct(X, Y).
connection(X, Y) :- direct(X, Z), connection(Z, Y).

add(X,0,X). /* x + 0 = x */
add(X,s(Y),s(Z)) :- add(X,Y,Z). /* x + y = z → x + s(y) = s(z) */

%% multiplication
mul(X,0,0).
mul(s(0),X,X).
mul(X,s(Y),Z) :- mul(X,Y,P),add(P,X,Z).

%% factorial
fact(0,s(0)).
fact(s(0),s(0)).
fact(s(X),Y) :- fact(X,Z),mul(s(X),Z,Y).

factor(0,1).
factor(N,F) :- N>0,
               N1 is N-1,
               factor(N1,F1),
               F is N*F1.

%% last element of a list
last([X|[]],X).
last([_|R],X) :- last(R,X).

%% remove the last element of the list
unshift([_|[]], []).
%% when we remove the last element
%% we get a new list with the head the same
%% but a different rest
unshift([E|L1],[E|L2]) :- unshift(L1,L2).

%% palindrome
palindrome([]).
palindrome([K|[]]).
palindrome([K | R]) :- last(R,K),unshift(R,M),palindrome(M).

