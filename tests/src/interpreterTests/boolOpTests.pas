var f_LT, f_GT, f_LTE, f_GTE: boolean;
var f_Eq, f_NEq: boolean;
var f_Or, f_Xor, f_And, f_Not: boolean;
var a, b: integer;
    r, t: real;
    c, d: string;

begin
  a := 3;
  b := 6;
  r := 7.9;
  t := 2.4;
  c := "abc";
  d := "abacaba";
  f_LT := True < False;
  f_GT := b > a;
  f_LTE := c <= d;
  f_GTE := a >= t;
  f_Eq := False = (r < b);
  f_NEq := (b <= a) <> True;
  f_Or := True or (r > a);
  f_Xor := (c > d) xor False;
  f_And := (t > a) and (r <= b);
  f_Not := not True;
end.