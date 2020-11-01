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
  b := 10;
  a := foo(a);
  write("a: ");
  writeln(a);
  write("b: ");
  writeln(b);
end.