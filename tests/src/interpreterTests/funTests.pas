var a, b: integer;

function foo(): integer;
begin
  foo := a;
end;

function foo2(b: integer): integer;
begin
  foo2 := 5;
end;

function foo3(): integer;
var t: integer;
begin
  t := a * b;
  foo3 := t - 11;
end;

function foo4(b, c: integer): integer;
begin
  foo4 := b * a;
end;

begin
  a := 5;
  b := foo();
  a := foo2(7);
  b := foo4(foo3(), 9);
end.