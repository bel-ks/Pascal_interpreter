var a, b, c, d: integer;
    e, f, g, h: real;

begin
  a := 2;
  b := 4;
  c := 7;
  d := 11;
  
  e := 3.67;
  f := 19.4;
  g := 4.6;
  h := 6.8;
  
  a := a + c;
  f := e + b;
  
  f := g - e;
  c := c - a;
  
  a := a or d;
  
  d := b xor a;
  
  g := c * e;
  h := h - a * f;
  
  a := a div b;
  d := b mod a;
  
  b := c and b;
  
  a := not a;
  d := -d;
  g := -(-g);
  a := ++a;
  f := +g;
end.