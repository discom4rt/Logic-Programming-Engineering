%Game: Guess a Word
%W. Nauber, 11.1.2001

guess_word :-
     nl,
     nl,
     init_database,
     repeat,  % repeats menu and prompts for input of command
     write('G u e s s  a  W o r d'), nl,
     write('---------------------'), nl,
     nl,
     write('  l - list database'), nl,
     write('  r - read database'), nl,
     write('  a - add a new word'), nl,
     write('  s - save database'), nl,
     write('  w - guess a word'), nl,
     write('  e - end the game'), nl,
     nl,
     write('Command: '),
     get_single_char(CommandCode),
     put(CommandCode), nl,
     nl,
     name(Command,[CommandCode]),
     menu(Command),
     Command = e,
     !.

menu(Command) :-
     Command = l,
     bagof(X,w(X),List),
     print(List),
     nl, nl,
     !.

menu(Command) :-
     Command = r,
     write('Filename (e.g `animals.pl`): '),
     read(Name),
     readfile(Name),
     menu(l),
     !.

menu(Command) :-
     Command = a,
     write('New word (e.g dog): '),
     read(Word),
     assert(w(Word)),
     menu(l),
     !.

menu(Command) :-
     Command = s,
     write('Filename (e.g ''animals.pl''): '),
     read(Name),
     write('Writing database to '),
     write(Name),
     write('...'),
     nl,
     tell(Name),
     listing(w/1),
     told,
     write('Ready'),
     nl, nl,
     !.

menu(Command) :-
     Command = w,
     !.

menu(Command) :-
     Command = e,
     write('Thank You for playing this game!'), nl,
     !.

menu(_) :-
     write('- not correct'), nl,
     nl.

init_database :-
     abolish(w,1),
     dynamic(w/1),
     readfile('words.pl').

readfile(Name) :- 
     exists_file(Name),
     consult(Name);
     assert(w(cat)),
     assert(w(mouse)).

%% print out a list
print([]).

print([X]) :-
     !,
     write(X).

print([X|T]) :- 
     write(X),
     write(', '),
     print(T).

