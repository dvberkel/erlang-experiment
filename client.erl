-module(client).

-compile(export_all).

receive_message() ->
    receive
	Msg ->
	    io:format("~p: ~p~n", [self(), Msg]),
	    receive_message()
    end.
