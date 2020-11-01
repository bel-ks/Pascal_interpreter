var a, b: integer;
    r: real;
    s: string;
    f, f2 : boolean;

function foo(b: integer;): integer;
begin
  b := b - 1;
  foo := b + 5;
end;

begin
  readln(a);
  b := 10;
  if (a < 5) then
    b := 10
  else
    b := 3;
  write("a: ");
  writeln(a);
  write("b: ");
  writeln(b);
end.