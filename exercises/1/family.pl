male(ali).      male(carl).    male(ed).      male(frank).   male(hugo).
male(kurt).     male(rene).    male(vico).    male(tino).

female(berta).  female(dora).  female(guna).  female(ina).   female(jane).
female(laura).  female(mia).   female(olga).  female(wera).  female(susan).
female(uta).

father(ali,guna).   father(ali,hugo).   father(carl,ina).   father(carl,jane).
father(ed,kurt).    father(frank,mia).  father(frank,olga). father(hugo,wera).
father(hugo,rene).  father(hugo,vico).  father(kurt,tino).  father(kurt,uta).    

mother(berta,guna). mother(berta,hugo). mother(dora,ina).   mother(dora,jane).
mother(guna,mia).   mother(guna,olga).  mother(ina,wera).   mother(ina,rene).
mother(ina,vico).   mother(jane,susan). mother(laura,tino). mother(laura,uta). 

person(F):-(mother(F,C1), mother(F, C2));
           (father(F,C1),father(F,C2)),
           male(C1),female(C2).

% if X is a parent of Y
parent(X,Y):-(mother(X,Y); father(X,Y)).

% if X is the father of Z and Y is the mother of Z
parents(X,Y,Z):-(father(X,Z),mother(Y,Z);father(Y,Z),mother(X,Z)).

% if X is a brother of Y
brother(X,Y):-(father(F,X),father(F,Y);mother(M,X),mother(M,Y)),male(X),\+X=Y.

% if X is the grandpa of Y
grandpa(X,Y):-father(X,H),(father(H,Y); mother(H,Y)).

% if X is the aunt of Y: X is a sister of one of Y큦 parents
aunt(X,Y):-mother(M,Y),(mother(GM,M),mother(GM,X);father(GF,M),father(GF,X)),female(X),\+X=M.

% if X is a cousin of Y: X is one of Y큦 parent큦 sibling큦 children
cousin(X,Y):-female(X).

