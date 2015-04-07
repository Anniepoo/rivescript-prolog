:- module(brain, [load_brain_directory/1,
		 retract_brain/0]).
/** <module> Maintainence of the Rivescript brain
 *
 */

:- use_module(library(dcg/basics)).

retract_brain.

%%	load_brain_directory(+Path:text) is det
%
load_brain_directory(Path)   :-
	retract_brain,
	expand_file_search_path(Path, Dir),
	directory_files(Dir, Files),
	member(File, Files),
	\+ member(File, ['.', '..']),
	file_name_extension(_, "rive", File),
	absolute_file_name(File, AbsPath, [
				     relative_to(Dir),
				     access(read) ]),
	debug(rivescript(load), 'Loading file ~w', [AbsPath]),

	phrase_from_file(tokenizer(Tokens), AbsPath),
	phrase(rivescript_grammar, Tokens),
	fail.
load_brain_directory(_).

