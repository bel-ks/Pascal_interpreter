var a, b: integer;

begin
  a := 3;
  b := 5;
  while a < b do
    a := a + 1;
  a := a * b;
  while a >= b do
  begin
    b := b * 2;
    a := a - 1;
  end;
end.