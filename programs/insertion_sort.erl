-module(insertion_sort).

-export([start/1]).
start([]) -> [];

start(List) ->
  [Head|Trail] = List,
  start(Head, Trail, []).

start(Value, [Head|Trail], []) ->
  start(Head, Trail, [Value]);

start(Value, [], Sorted) ->
  inserting(Value, Sorted);

start(Value, [Head|Trail], Sorted) ->
  start(Head, Trail, inserting(Value, Sorted)).

inserting(Value, []) -> [Value];

inserting(Value, [Head|Trail]) ->
  if
    Value =< Head -> [Value,Head|Trail];
 true -> [Head | inserting(Value, Trail)]
 end.