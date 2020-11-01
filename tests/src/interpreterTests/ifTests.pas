var a, b: integer;

begin
  if True then
  	a := 5;
  if False then
  begin
  	a := 7;
  	b := a;
  end;
  b := 13;
  if (a > b) then
  	b := a
  else
  	b := 1;
  if "abc" < "def" then
  begin
  	a := a * b;
  	b := b - 3;
  end
  else
  	b := 100;
  if 17 * 3 > 0 then
  	a := 101
  else
  begin
  	a := 19;
  	b := a * a;
  end;
  if True and False then
  begin
  	a := 42;
  	b := a div 2;
  end
  else
  begin
  	b := 6;
  	a := b mod 2;
  end;
end.