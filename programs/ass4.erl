-module(ass4).
-export([start/1, center/1, first/0, second/0,third/0,fourth/0]).
 
center(0) ->
first ! finished ,
second ! finished,
third!finished,
fourth!finished,
    io:format("~p (center) finished~n", [self()]);
 
center(N) ->
   first ! {center, self()},
   second ! {center,self()},
   third ! {center,self()},
   fourth ! {center,self()},
    receive
        {first,F_PID} ->
            io:format("~p (Center) received ~p (first)~n", [self(),F_PID]);
       {second,S_PID} ->
            io:format("~p (Center) received ~p (second) ~n",[self(),S_PID]);
      {third,T_PID} ->
 	io:format("~p (Center) received ~p (third) ~n",[self(),T_PID]);
     {fourth,FO_PID} ->
	io:format("~p (Center) received ~p (fourth) ~n",[self(),FO_PID])
    end,
    center(N - 1).
 
first() ->
    receive
        finished ->
            io:format("~p (first) finished~n", [self()]);
        {center, Center_PID} ->
            io:format("~p (first) received ~p (center)~n", [self(),Center_PID]),
            Center_PID ! {first,self()},
            first()
    end.
 
second() ->
    receive
        finished ->
            io:format("~p (second) finished~n", [self()]);
        {center, Center_PID} ->
            io:format("~p (second) received ~p (center)~n", [self(),Center_PID]),
            Center_PID ! {second,self()},
            second()
    end.

third() ->
    receive
        finished ->
            io:format("~p (third) finished~n", [self()]);
        {center, Center_PID} ->
            io:format("~p (third) received ~p (center)~n", [self(),Center_PID]),
            Center_PID ! {third,self()},
            third()
    end.

fourth() ->
    receive
        finished ->
            io:format("~p (fourth) finished~n", [self()]);
        {center, Center_PID} ->
            io:format("~p (fourth) received ~p (center)~n", [self(),Center_PID]),
            Center_PID ! {fourth,self()},
            fourth()
    end.


start(A) ->
   register(first, spawn(ass4, first, [])),
   register(second, spawn(ass4, second, [])),
   register(third, spawn(ass4, third, [])),
   register(fourth, spawn(ass4, fourth, [])),
    CID = spawn(ass4, center, [A]),
	io:format("~p (Center) Started~n",[CID]).