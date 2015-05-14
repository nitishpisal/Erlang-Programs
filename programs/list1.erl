-module(list1).
-export([my_list / 2]).
my_list(Mylist1,N) ->
Len = length(Mylist1),
Mid = (Len + 1) div 2,
io:format("Length: ~w and Mid: ~w~n", [Len,Mid]),
if
  Mid == N ->
  io:format("Equals ~w~n",[N]);
  Mid /= N ->
  io:format("Not Equals ~w~n",[N])
end,
my_list([Head|Rest],N) ->
my_list([])
%%length1 = length(List1);
%%mid([Head|Rest],length1) ->
%%mid([Rest],length1-1);
%%mid([Head|Rest],0) ->
%%io:format(" sad", [head]).
