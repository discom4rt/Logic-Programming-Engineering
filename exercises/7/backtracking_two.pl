%% 7.1 Maze
door(a,b).

door(b,c).
door(b,d).

door(c,b).
door(c,e).
door(c,f).

door(d,b).
door(d,e).

door(e,c).
door(e,d).
door(e,f).

door(f,c).
door(f,e).

go(_,Y,OldWay,[Y|OldWay]).

go(X,Y,OldWay,Way):-
          door(X,Z), %% Backtracking for a new way
          \+ member(Z, OldWay),
          go(Z,Y,[X|OldWay],Way).

maze(X,Y,Way):-
          go(X,Y,[],Way).

%% Future: make this ^ output the list in reverse (aka the right way)

%% 7.2 Playing Cards
neighbors(C1,C2,C3,C4,Cl,Cr):-
          C1=Cl,C2=Cr;
          C2=Cl,C3=Cr;
          C3=Cl,C4=Cr.

cards(C1,C2,C3,C4):-
          neighbors(C1,C2,C3,C4,[_,knight],[heart,_]),
          neighbors(C1,C2,C3,C4,[spade,_],[_,queen]),
          neighbors(C1,C2,C3,C4,[_,king],[diamond,_]),
          neighbors(C1,C2,C3,C4,[club,_],[_,ace]),
          \+ neighbors(C1,C2,C3,C4,[club,_],[heart,_]),
          \+ neighbors(C1,C2,C3,C4,[heart,_],[club,_]).

%% 7.3 Coins
turncoin(h,t).
turncoin(t,h).

%% 5 cases of where to change coins
%% 1st 2nd, 2nd 3rd, etc
move(From,To)
coins(From,Goal,Way)
