:- module(rivescript, [
		       rivescript/1]).
/** <module>  Public API's for rivescript
 *
 */

:- use_module(rivescript(brain)).
:- reexport(brain).

rivescript(Line) :-
	format('rivescript responds to ~w~n', [Line]). % DEBUG


