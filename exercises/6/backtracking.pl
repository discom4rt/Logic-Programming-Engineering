%% Deletes an element E from list L and returns the reduced list
del1elem(E,[E|L],L).
del1elem(E,[H|L],[H|RL]):-
          E \== H, 
          del1elem(E,L,RL).

%% Converts an element E into digit D using conversion tables EL, 
%% DL is 
convert(E,[E|_],[D|_],D).
convert(E,[EL1|EL],[_|DL],D):-
          E \== EL1,
          convert(E,EL,DL,D).

gendigits([],_,_,_,_,_,_,[]).
gendigits([H|L],DL,UL,UD,NDL,NUL,NUD,[NewDigit|Digits]):-
          \+ member(H,UL),
          member(NewDigit,DL),
          del1elem(NewDigit,DL,DLN),
          gendigits(L,DLN,[H|UL],[NewDigit|UD],NDL,NUL,NUD,Digits).
          %% still need to add letter to UL here...maybe

gendigits([H|L],DL,UL,UD,NDL,NUL,NUD,[Digit|Digits]):-
          member(H,UL),
          convert(H,UL,UD,Digit),
          gendigits(L,DL,UL,UD,NDL,NUL,NUD,Digits).




%% gendigits(L,DL,UL,UD,NDL,NUL,NUD,D):-


%% example cryptadd([a, b, c], [b, c, c], [c, a, a], D1, D2, D3).
%% cryptadd(S1,S2,R,D1,D2,D3):-