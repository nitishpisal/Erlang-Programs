-module(searching_algorithm).
-export([start/2]).
 
start(List, Value) ->
    binary_search(List, Value, 1, length(List)).
 
 
binary_search(List, Value, Low, High) ->
    if Low > High ->
        io:format("Number ~p not found~n", [Value]),
        not_found;
       true ->
        Mid = (Low + High) div 2,
        MidNum = lists:nth(Mid, List),
        if MidNum > Value ->
            binary_search(List, Value, Low, Mid-1);
           MidNum < Value ->
            binary_search(List, Value, Mid+1, High);
           true ->
            io:format("Number ~p found at index ~p~n", [Value, Mid])
            
        end
    end.