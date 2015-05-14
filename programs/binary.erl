-module(binary).
-export([mymethod/2]).
-import(lists, [nth/2]).
-include_lib("eunit/include/eunit.hrl").

mymethod(List, Key) ->
    mymethod(List, Key, 1, length(List)).

mymethod(List, Key, First, Last) ->
    if
        Last < First -> -1;
        true ->
            Mid = (First + Last) div 2,
            Item = nth(Mid, List),
            if
                Key < Item ->
                    mymethod(List, Key, First, Mid-1);
                Key > Item ->
                    mymethod(List, Key, Mid+1, Last);
                true ->
                    Mid
            end
    end.
