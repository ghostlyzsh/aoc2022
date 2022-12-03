-module(part1).
-export([part1/0]).

find_duplicate(L, S) ->
    H = string:slice(S, 0, 1),
    T = string:slice(S, 1),
    case string:find(L, H) of
        nomatch -> find_duplicate(L, T);
        _ -> H
    end;
find_duplicate([], _) ->
    false.

part1() ->
    Content = file:read_file("input.txt"),
    {_, BlankInput} = Content,
    Input = string:strip(binary_to_list(BlankInput), both, $\n),

    Bags = string:tokens(Input, "\n"),
    
    io:format("~p~n", [Bags]),

    Total = bag_processor(Bags, 0).

bag_processor([H|T], Total) ->
    Half_length = string:length(H)/2,
    Part1 = string:slice(H, 0, round(Half_length)),
    Part2 = string:slice(H, round(Half_length)),
    OriDuped = lists:nth(1, find_duplicate(Part1, Part2)),
    if OriDuped =< 90 ->
           Duped = OriDuped - 38;
       OriDuped >= 97 ->
           Duped = OriDuped - 96
    end,
    io:format("~p~p~p~n", [Duped, Part1,Part2]),
    bag_processor(T, Total + Duped);
bag_processor([], Total) ->
        Total.
