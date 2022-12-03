-module(part2).
-export([part2/0]).

find_duplicate(L, R, S) ->
    H = string:slice(S, 0, 1),
    T = string:slice(S, 1),
    case {string:find(L, H), string:find(R, H)} of
        {nomatch, _} -> find_duplicate(L, R, T);
        {_, nomatch} -> find_duplicate(L, R, T);
        _ -> H
    end;
find_duplicate(_, _, []) ->
    false.

find_duplicate(L, S) ->
    H = string:slice(S, 0, 1),
    T = string:slice(S, 1),
    case string:find(L, H) of
        nomatch -> find_duplicate(L, T);
        _ -> H
    end;
find_duplicate(_, []) ->
    false.

take([H|T]) ->
    {H, T};
take([]) ->
    [].

part2() ->
    Content = file:read_file("input.txt"),
    {_, BlankInput} = Content,
    Input = string:strip(binary_to_list(BlankInput), both, $\n),

    Bags = string:tokens(Input, "\n"),
    
    io:format("~p~n", [Bags]),

    Total = bag_processor(Bags, 0).

bag_processor([H|T], Total) ->
    Elf1 = H,
    {Elf2, T2} = take(T),
    {Elf3, T3} = take(T2),
    OriDuped = lists:nth(1, find_duplicate(Elf1, Elf2, Elf3)),
    
    if OriDuped =< 96 ->
           Duped = OriDuped - 38;
       OriDuped >= 97 ->
           Duped = OriDuped - 96
    end,
    io:format("~p ~p ~p~p~p~n", [Duped, [OriDuped], Elf1,Elf2,Elf3]),
    bag_processor(T3, Total + Duped);
bag_processor([], Total) ->
        Total.
