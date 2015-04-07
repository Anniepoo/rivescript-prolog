:- module(devtests, [rivescript_repl/0]).
/** <module> Development tests for rivescript
 *
 */

user:file_search_path(rivescript, '../prolog/rivescript/').
user:file_search_path(brain, '../brain/').

:- use_module(rivescript(rivescript)).

rivescript_repl :-
	load_brain_directory(brain('.')),
	repl_loop.

repl_loop :-
	prompt1('r:'),
	read_query(Line),
	rivescript(Line),
	(   Line = stop
	;   repl_loop).

read_query(Line) :-
	read_line_to_codes(current_input, Codes),
	string_codes(Line, Codes).
