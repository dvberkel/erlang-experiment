-module(router).

-compile(export_all).


route(Pids) ->
    receive
	{register, Pid} ->
	    route([Pid | Pids]);
	{send, Msg} ->
	    sendAll(Pids,Msg),
	    route(Pids)
    end.

sendAll([], _) ->
    ok;
sendAll([Pid | Pids], Msg) ->
    Pid ! Msg,
    sendAll(Pids, Msg).
