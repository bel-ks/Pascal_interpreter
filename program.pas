var a, b: integer;
    r: real;
    s: string;
    f, f2 : boolean;

function foo(b: integer): integer;
begin
  b := b - 1;
  foo := b + 5;
end;

begin
  readln(a);
  b := 10;
  a := foo(4);
  if a = 10 then
    a := 100
  else
    b := 100;
  write("a: ");
  writeln(a);
  write("b: ");
  writeln(b);
end.