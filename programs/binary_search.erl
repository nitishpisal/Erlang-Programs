-module(binary_search).
-export([mymethod/2]).


mymethod(List, Key) ->
    mymethod(List, Key, 1, length(List)).

mymethod(List, Key, First, Last) ->

    if
    Last < First -> 
io:format("Number ~p not found in the List ~n",[Key]);
    true ->
    Mid = (First + Last) div 2,
    Item = lists:nth(Mid, List),

    if
    Key < Item ->
    mymethod(List, Key, First, Mid-1);

    Key > Item ->
    mymethod(List, Key, Mid+1, Last);

    true ->
 io:format("Number ~p is at position ~p~n", [Key, Mid])
    end
    end.
