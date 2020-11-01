begin
  readln(a); b := 10;
  a := foo(4);
  if a = 10 then a := 100
  else begin b := 100; b := b + a; end;
  write("a: "); writeln(a);
  write("b: ");
  writeln(b); end.