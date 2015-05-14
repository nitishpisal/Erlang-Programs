-module(assign1).
-export([square/1, circle/1, triangle/2, rectangle/2]).
square(A) ->
A * A.
circle(B) ->
3.14 * B * B.
triangle(C, D) ->
0.5 * C * D.
rectangle(E, F) ->
2 * E + 2 * F.
