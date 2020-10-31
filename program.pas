var a, b: integer;
    r: real;
    s: string;
    f, f2 : boolean;

function foo(a: real): integer;
var r: real;
begin
end;

function foo2(b: real; y: integer): integer;
begin
end;

function foo3(): integer;
var rr: real;
begin
end;

function foo4(): integer;
begin
end;

procedure bar(a: real);
var r: real;
begin
end;

procedure bar2(b: real; y: integer);
begin
end;

procedure bar3;
var rr: real;
begin
end;

procedure bar4;
begin
end;

begin
  if False then
    a := 5
  else
    r := 5.6;
  readln(a);
  f := True;
  f2 := False;
  f := f2;
  b := 7;
  a := b;
  write(a + b);
end.