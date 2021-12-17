//==============================================================================
// Product name: DiffExpress
// Copyright 2000-2001 AidAim Software.
// Description:
//  DiffExpress provides an easy way to use symbolic differentiation
//  of mathematical expressions in your applications.
//  Supports 5 operators, parenthesis, 18 mathematical functions and
//  user-defined variables.
// Version: 1.4
// Date: 11/24/2000
//==============================================================================
unit DiffExpress;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, math;

const 
  MaxIndex = 5000;

type


  TTree = record
    num: integer;
    con: string;
    l, r: integer;
  end;

  PTree = integer;

  TDiffExpress = class(TComponent)
  private
    t: array[1..MaxIndex] of TTree;
    index: integer;
    FFormula: string;

    DVar: string;
    Err: boolean;
    Bc: integer;
    PrevLex, Curlex: integer;
    Pos: integer;
    Tree, Tree2: integer;
    function gettree(s: string): integer;
    procedure deltree;
    function getformula(_t: integer): string;
    function getformula2(_t: integer): string;
    function simplify(_t: integer): integer;
    procedure Error(s: string);
  public
    constructor Create(o: TComponent); override;
    destructor Destroy; override;
    function diff(v: string): string;
  published
    property Formula: string read FFormula write FFormula;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Samples', [TDiffExpress]);
end;

//*********************************************************************
procedure TDiffExpress.Error(s: string);
begin
  Err := True;
  raise Exception.Create(s);
end;
//*********************************************************************
constructor TDiffExpress.Create(o: TComponent);
begin
  inherited;
  index := 0;
  Tree := 0;
  Tree2 := 0;
  Dvar := 't';
  Formula := '0';
end;
//*********************************************************************
destructor TDiffExpress.Destroy;
begin
  DelTree;
  //DelTree(Tree2);
  inherited;
end;

//***************************************************************

function TDiffExpress.GetTree(s: string): integer;
  //Get number from string
  function getnumber(s: string): string;
  begin
    Result := '';
    try
      //Beginning
      while (pos <= length(s)) and (s[pos] in ['0'..'9']) do
      begin
        Result := Result + s[pos];
        inc(pos);
      end;
      if pos > length(s) then exit;
      if s[pos] = '.' then
      begin
        //Fraction part
        Result := Result + '.';
        inc(pos);
        if (pos > length(s)) or not (s[pos] in ['0'..'9']) then Error('Wrong number.');
        while (pos <= length(s)) and
          (s[pos] in ['0'..'9']) do
        begin
          Result := Result + s[pos];
          inc(pos);
        end;
      end;
      if pos > length(s) then exit;
      //Power
      if (s[pos] <> 'e') and (s[pos] <> 'E') then exit;
      Result := Result + s[pos];
      inc(pos);
      if pos > length(s) then Error('Wrong number.');
      if s[pos] in ['-', '+'] then
      begin
        Result := Result + s[pos];
        inc(pos);
      end;
      if (pos > length(s)) or not (s[pos] in ['0'..'9']) then Error('Wrong number.');
      while (pos <= length(s)) and
        (s[pos] in ['0'..'9']) do
      begin
        Result := Result + s[pos];
        inc(pos);
      end;
    except
    end;
  end;
  //Read lexem from string
  procedure getlex(s: string; var num: integer; var con: string);
  begin
    con := '';
    //Skip spaces
    while (pos <= length(s)) and (s[pos] = ' ') do inc(pos);
    if pos > length(s) then 
    begin 
      num := 0;  
      exit; 
    end;

    case s[pos] of
      '(': num := 1;
      ')': num := 2;
      '+': num := 3;
      '-': 
      begin
        num := 4;
        if (pos < length(s)) and (s[pos + 1] in ['1'..'9', '0']) and (curlex in [0,1]) then
        begin
          inc(pos);
          con := '-' + getnumber(s);
          dec(pos);
          num := 7;
        end;
      end;
      '*': num := 5;
      '/': num := 6;
      '^': num := 31;
      'a'..'z', 'A'..'Z', '_':
      begin
        while (pos <= length(s)) and
          (s[pos] in ['a'..'z', 'A'..'Z', '_', '1'..'9', '0']) do
        begin
          con := con + s[pos];
          inc(pos);
        end;
        dec(pos);
        num := 8;
        if LowerCase(con) = 'cos' then num := 10;
        if LowerCase(con) = 'sin' then num := 11;
        if LowerCase(con) = 'tan' then num := 12;
        if LowerCase(con) = '???' then num := 13; //'ctg'
        if LowerCase(con) = '???' then num := 14; //'abs'
        if (LowerCase(con) = '???') or (LowerCase(con) = '????') then num := 15; //'sgn' , 'sign'
        if LowerCase(con) = 'sqrt' then num := 16;
        if LowerCase(con) = 'ln' then num := 17;
        if LowerCase(con) = 'exp' then num := 18;
        if LowerCase(con) = 'asin' then num := 19;
        if LowerCase(con) = 'acos' then num := 20;
        if LowerCase(con) = 'atan' then num := 21;
        if LowerCase(con) = '??????' then num := 22; //'arcctg'
        if LowerCase(con) = 'sinh' then num := 23;
        if LowerCase(con) = 'cosh' then num := 24;
        if LowerCase(con) = 'tanh' then num := 25;
        if LowerCase(con) = '???' then num := 26; //'cth'
        if (LowerCase(con) = '?????????') or (LowerCase(con) = '?') then num := 27; //'heaviside' , 'h'
      end;
      '1'..'9', '0':
      begin
        con := getnumber(s);
        dec(pos);
        num := 7;
      end;
    end;
    inc(pos);
    PrevLex := CurLex;
    CurLex := num;
  end;

  //****************************************************************
var 
  neg: boolean;
  l, r, res: integer;
  n, op: integer;
  c: string;
  //****************************************************************
  function newnode: integer;
  begin
    Index := Index +1;
    if Index > MaxIndex then
    begin
      index := 0;
      Error('Too long formula');
    end;
    Result := Index;
    t[index].l := 0;
    t[index].r := 0;
  end;

  function getsingleop: integer;
  var 
    op, bracket: integer;
    opc: string;
    l, r, res: integer;
  begin
    //l:=0;
    try
      if n = 1 then 
      begin 
        inc(bc);
        l := gettree(s); 
      end
      else
      begin
        // First operand
        if not (n in [7,8,10..30]) then Error('');
        op := n;
        opc := c;
        if n in [7,8] then
        begin
          // Number or variable
          l := newnode; 
          t[l].num := op; 
          t[l].con := opc;
        end
        else
        begin
          //Function
          getlex(s, n, c);
          if n <> 1 then Error('');
          inc(bc);
          l := newnode;
          t[l].l := gettree(s); 
          t[l].num := op; 
          t[l].con := opc;
        end;
      end;
      //Operation symbol
      getlex(s, n, c);
      //Power symbol
      while n = 31 do
        begin
          getlex(s, n, c);
        bracket := 0;
        if n = 1 then  
        begin   
          bracket := 1;   
          getlex(s, n, c);   
        end;
        if n <> 7 then Error('');
        r := newnode; 
        t[r].num := n; 
        t[r].con := c;
        res := newnode; 
        t[res].l := l; 
        t[res].r := r; 
        t[res].num := 31; 
        l := res;
        if bracket = 1 then
        begin
          getlex(s, n, c);
          if n <> 2 then Error('');
        end;
        getlex(s, n, c);
      end;
      Result := l;
    except
      //DelTree(l);
      Result := 0;
    end;
  end;
  //****************************************************************
  function getop: integer;
  var 
    op: integer;
    l, r, res: integer;
  begin
    neg := False;
    getlex(s, n, c);
    // Unary - or +
    if prevlex in [0,1] then
    begin
      if n = 4 then  
      begin  
        neg := True; 
        getlex(s, n, c);  
      end;
      if n = 3 then getlex(s, n, c);
    end;
    l := getsingleop;
    // 2nd operand **************
    while n in [5,6] do
    begin
      op := n;
      getlex(s, n, c);
      r := getsingleop;
      res := newnode; 
      t[res].l := l; 
      t[res].r := r; 
      t[res].num := op;
      l := res;
    end;
    // Unary minus
    if neg then
    begin
      res := newnode; 
      t[res].l := l; 
      t[res].r := 0; 
      t[res].num := 9;
      l := res;
    end;
    Result := l;
  end;

  //****************************************************************
begin
  //l:=0;
  try
    l := getop;
    while True do
    begin
      if n in [0,2] then
      begin
        if n = 2 then dec(bc);
        Result := l; 
        exit;
      end;
      if not (n in [3,4]) then Error('');
      op := n;
      r := getop;
      res := newnode; 
      t[res].l := l; 
      t[res].r := r; 
      t[res].num := op;
      l := res;
    end;
    Result := l;
  except
    //DelTree(l);
    Result := 0;
  end;
end;


//Deletion tree

procedure TDiffExpress.deltree;
begin
  Index := 0;
end;

//****************************************************************

// Tree simplification

function TDiffExpress.simplify(_t: integer): integer;
var 
  p1, p2: integer;
begin
  Result := 0;
  if _t = 0 then exit;
  case t[_t].num of
    3:
    begin
      t[_t].l := simplify(t[_t].l); 
      t[_t].r := simplify(t[_t].r);
      p1 := t[_t].l; 
      p2 := t[_t].r;
      if (t[p1].num = 7) and (t[p2].num = 7) then
      begin
        t[_t].num := 7; 
        t[_t].con := floattostr(strtofloat(t[p1].con) + strtofloat(t[p2].con));
        { t[_t].l:=deltree(t[_t].l); t[_t].r:=deltree(t[_t].r); }Result := _t; 
        exit;
      end;
      if (t[p1].num = 7) and (strtofloat(t[p1].con) = 0) then
      begin  {t[_t].l:=deltree(t[_t].l); }Result := t[_t].r;  
        exit;  
      end;
      if (t[p2].num = 7) and (strtofloat(t[p2].con) = 0) then
      begin { t[_t].r:=deltree(t[_t].r); }Result := t[_t].l;  
        exit;  
      end;
      Result := _t;
    end;
    4:
    begin
      t[_t].l := simplify(t[_t].l); 
      t[_t].r := simplify(t[_t].r);
      p1 := t[_t].l; 
      p2 := t[_t].r;
      if (t[p1].num = 7) and (t[p2].num = 7) then
      begin
        t[_t].num := 7; 
        t[_t].con := floattostr(strtofloat(t[p1].con) - strtofloat(t[p2].con));
        { t[_t].l:=deltree(t[_t].l); t[_t].r:=deltree(t[_t].r);} Result := _t; 
        exit;
      end;
      if (t[p1].num = 7) and (strtofloat(t[p1].con) = 0) then
      begin  
        t[_t].num := 9;
        //  deltree(t[_t].l);
        t[_t].l := t[_t].r;
        t[_t].r := 0;
        Result := _t;  
        exit;
      end;
      if (t[p2].num = 7) and (strtofloat(t[p2].con) = 0) then
      begin  { t[_t].r:=deltree(t[_t].r); }Result := t[_t].l;  
        exit;  
      end;
      Result := _t;
    end;
    5:
    begin
      t[_t].l := simplify(t[_t].l); 
      t[_t].r := simplify(t[_t].r);
      p1 := t[_t].l; 
      p2 := t[_t].r;
      if (t[p1].num = 7) and (t[p2].num = 7) then
      begin
        t[_t].num := 7; 
        t[_t].con := floattostr(strtofloat(t[p1].con) * strtofloat(t[p2].con));
        { t[_t].l:=deltree(t[_t].l); t[_t].r:=deltree(t[_t].r); }Result := _t; 
        exit;
      end;
      if ((t[p1].num = 7) and (strtofloat(t[p1].con) = 0)) or
        ((t[p2].num = 7) and (strtofloat(t[p2].con) = 0)) then
      begin  
        t[_t].con := '0'; 
        t[_t].num := 7;
        {  t[_t].l:=deltree(t[_t].l); .r:=deltree(t[_t].r); }Result := _t; 
        exit;
      end;
      if ((t[p1].num = 7) and (strtofloat(t[p1].con) = 1)) then
      begin
        {  t[_t].l:=deltree(t[_t].l); }Result := t[_t].r;  
        exit;
      end;
      if ((t[p2].num = 7) and (strtofloat(t[p2].con) = 1)) then
      begin
        {  t[_t].r:=deltree(t[_t].r); } Result := t[_t].l;  
        exit;
      end;
      Result := _t;
    end;
    6:
    begin
      t[_t].l := simplify(t[_t].l); 
      t[_t].r := simplify(t[_t].r);
      p1 := t[_t].l; 
      p2 := t[_t].r;
      if (t[p1].num = 7) and (t[p2].num = 7) then
      begin
        t[_t].num := 7; 
        t[_t].con := floattostr(strtofloat(t[p1].con) / strtofloat(t[p2].con));
        {  t[_t].l:=deltree(t[_t].l); t[_t].r:=deltree(t[_t].r); }Result := _t; 
        exit;
      end;
      if (t[p1].num = 7) and (strtofloat(t[p1].con) = 0) then
      begin  
        t[_t].con := '0'; 
        t[_t].num := 7;
        { t[_t].l:=deltree(t[_t].l); t[_t].r:=deltree(t[_t].r); }Result := _t; 
        exit;
      end;
      if (t[p2].num = 7) and (strtofloat(t[p2].con) = 0) then
      begin  
        Error('Dividion by zero.');  
      end;
      if ((t[p2].num = 7) and (strtofloat(t[p2].con) = 1)) then
      begin
        {  t[_t].r:=deltree(t[_t].r); }Result := t[_t].l;  
        exit;
      end;
      Result := _t;
    end;
    7: Result := _t;
    8: Result := _t;
    9:
    begin
      t[_t].l := simplify(t[_t].l);
      p1 := t[_t].l;
      if t[p1].num = 7 then
      begin  
        t[_t].num := 7; 
        t[_t].con := floattostr(-strtofloat(t[p1].con));
        {  t[_t].l:=deltree(t[_t].l); t[_t].r:=deltree(t[_t].r); }Result := _t; 
        exit;
      end;
      Result := _t;
    end;
    10..30:
    begin
      t[_t].l := simplify(t[_t].l);
      p1 := t[_t].l;
      if t[p1].num = 7 then
      begin
        case t[_t].num of
          10: t[_t].con := floattostr(cos(strtofloat(t[p1].con)));
          11: t[_t].con := floattostr(sin(strtofloat(t[p1].con)));
          12: t[_t].con := floattostr(sin(strtofloat(t[p1].con)) / cos(strtofloat(t[p1].con)));
          13: t[_t].con := floattostr(cos(strtofloat(t[p1].con)) / sin(strtofloat(t[p1].con)));
          14: t[_t].con := floattostr(abs(strtofloat(t[p1].con)));
          15: if strtofloat(t[p1].con) > 0 then t[_t].con := '1'
            else if strtofloat(t[p1].con) < 0 then t[_t].con := '-1'
            else
              t[_t].con := '0';
          16: t[_t].con := floattostr(sqrt(strtofloat(t[p1].con)));
          17: t[_t].con := floattostr(ln(strtofloat(t[p1].con)));
          18: t[_t].con := floattostr(exp(strtofloat(t[p1].con)));
          19: t[_t].con := floattostr(arcsin(strtofloat(t[p1].con)));
          20: t[_t].con := floattostr(arccos(strtofloat(t[p1].con)));
          21: t[_t].con := floattostr(arctan(strtofloat(t[p1].con)));
          22: t[_t].con := floattostr(pi / 2 - arctan(strtofloat(t[p1].con)));
          23: t[_t].con := floattostr((exp(strtofloat(t[p1].con)) - exp(-strtofloat(t[p1].con))) /
              2);
          24: t[_t].con := floattostr((exp(strtofloat(t[p1].con)) + exp(-strtofloat(t[p1].con))) /
              2);
          25: t[_t].con := floattostr((exp(strtofloat(t[p1].con)) - exp(-strtofloat(t[p1].con))) /
              (exp(strtofloat(t[p1].con)) + exp(-strtofloat(t[p1].con))));
          26: t[_t].con := floattostr((exp(strtofloat(t[p1].con)) + exp(-strtofloat(t[p1].con))) /
              (exp(strtofloat(t[p1].con)) - exp(-strtofloat(t[p1].con))));
          27: if strtofloat(t[p1].con) >= 0 then  t[_t].con := '1'
            else 
              t[_t].con := '0';
        end;
        t[_t].num := 7;
        { t[_t].l:=deltree(t[_t].l); t[_t].r:=deltree(t[_t].r); }Result := _t; 
        exit;
      end;
      Result := _t;
    end;
    31:
    begin
      t[_t].l := simplify(t[_t].l); 
      t[_t].r := simplify(t[_t].r);
      p1 := t[_t].l; 
      p2 := t[_t].r;
      if (t[p1].num = 7) and (strtofloat(t[p1].con) = 0) then
      begin  
        t[_t].num := 7; 
        t[_t].con := '0';
        {  t[_t].l:=deltree(t[_t].l); t[_t].r:=deltree(t[_t].r); }Result := _t; 
        exit;
      end 
      else if strtofloat(t[p2].con) = 0 then
      begin  
        t[_t].num := 7; 
        t[_t].con := '1';
        {  t[_t].l:=deltree(t[_t].l); t[_t].r:=deltree(t[_t].r);} Result := _t; 
        exit;
      end 
      else if t[p1].num = 7 then
      begin
        t[_t].num := 7;
        t[_t].con :=
          floattostr(exp(ln(abs(strtofloat(t[p1].con))) * strtofloat(t[p2].con)));
        if strtofloat(t[p1].con) < 0 then
        begin
          if round(strtofloat(t[p2].con) / 2) <> (strtofloat(t[p2].con) / 2) then
            t[_t].con := floattostr(-strtofloat(t[_t].con));
        end;
        {  t[_t].l:=deltree(t[_t].l); t[_t].r:=deltree(t[_t].r);} Result := _t; 
        exit;
      end;
      if strtofloat(t[p2].con) = 1 then
      begin
        {  t[_t].r:=deltree(t[_t].r);} Result := t[_t].l; 
        exit;
      end;
      Result := _t;
    end;
  end;
end;

//  Construction of simplified formula by tree

function TDiffExpress.getformula2(_t: integer): string;
var 
  p1, p2: PTree;
  s1, s2: string;
begin
  Result := '';
  if _t = 0 then exit;
  s1 := getformula2(t[_t].l); 
  s2 := getformula2(t[_t].r);
  p1 := t[_t].l; 
  p2 := t[_t].r;
  case t[_t].num of
    3: Result := s1 + '+' + s2;
    4: 
    begin
      if not (t[p2].num in [5,6,7,8,10..31]) then
        s2 := '(' + s2 + ')';
      Result := s1 + '-' + s2;
    end;
    5: 
    begin
      if not (t[p1].num in [5,6,7,8,10..31]) then
        s1 := '(' + s1 + ')';
      if not (t[p2].num in [5,6,7,8,10..31]) then
        s2 := '(' + s2 + ')';
      Result := s1 + '*' + s2;
    end;
    6: 
    begin
      if not (t[p1].num in [5,6,7,8,10..31]) then
        s1 := '(' + s1 + ')';
      if not (t[p2].num in [7,8,10..31]) then
        s2 := '(' + s2 + ')';
      Result := s1 + '/' + s2;
    end;
    7: 
    begin
      Result := t[_t].con;
      if strtofloat(t[_t].con) < 0 then Result := '(' + t[_t].con + ')';
    end;
    8: Result := t[_t].con;
    9: 
    begin
      if not (t[p1].num in [7,8,10..30]) then  s1 := '(' + s1 + ')';
      Result := '(-' + s1 + ')';
    end;
    10..30: Result := t[_t].con + '(' + s1 + ')';
    31: 
    begin
      p1 := t[_t].l;
      if not (t[p1].num in [7,8]) then
        s1 := '(' + s1 + ')';
      Result := s1 + '^' + s2;
    end;
  end;
end;
// Construcion of formula by tree

function TDiffExpress.getformula(_t: PTree): string;
begin
  Result := '';
  if _t = 0 then exit;
  case t[_t].num of
    3: Result := '((' + getformula(t[_t].l) + ')+(' + getformula(t[_t].r) + '))';
    4: Result := '((' + getformula(t[_t].l) + ')-(' + getformula(t[_t].r) + '))';
    5: Result := '((' + getformula(t[_t].l) + ')*(' + getformula(t[_t].r) + '))';
    6: Result := '((' + getformula(t[_t].l) + ')/(' + getformula(t[_t].r) + '))';
    7,8: Result := t[_t].con;
    9: Result := '(-(' + getformula(t[_t].l) + '))';
    10..30: Result := t[_t].con + '(' + getformula(t[_t].l) + ')';
    31: Result := '((' + getformula(t[_t].l) + ')^(' + getformula(t[_t].r) + '))';
  end;
end;

// Differentiaite expression

function TDiffExpress.diff(v: string): string;
  function df(_t: PTree): string;
  var 
    r: string;
  begin
    Result := '0';
    if _t = 0 then exit;
    case t[_t].num of
      3:
        Result := '((' + df(t[_t].l) + ')+(' + df(t[_t].r) + '))';
      4:
        Result := '((' + df(t[_t].l) + ')-(' + df(t[_t].r) + '))';
      5:
      begin
        r := '((' + df(t[_t].l) + ')*(' + getformula(t[_t].r) + ')+';
        r := r + '(' + df(t[_t].r) + ')*(' + getformula(t[_t].l) + '))';
        Result := r;
      end;
      6:
      begin
        r := '((' + df(t[_t].l) + ')*(' + getformula(t[_t].r) + ')-';
        r := r + '(' + df(t[_t].r) + ')*(' + getformula(t[_t].l) + '))';
        r := r + '/(' + getformula(t[_t].r) + ')^2';
        Result := r;
      end;
      7: Result := '0';
      8: if LowerCase(t[_t].con) = LowerCase(DVar) then  Result := '1';
      9: Result := '(-(' + df(t[_t].l) + '))';
      10: Result := '(-sin(' + getformula(t[_t].l) + ')*(' + df(t[_t].l) + '))';
      11: Result := '(cos(' + getformula(t[_t].l) + ')*(' + df(t[_t].l) + '))';
      12: Result := '(1/(cos(' + getformula(t[_t].l) + ')^2)*(' + df(t[_t].l) + '))';
      13: Result := '(-1/(sin(' + getformula(t[_t].l) + ')^2)*(' + df(t[_t].l) + '))';
      14: Result := '(sgn(' + getformula(t[_t].l) + ')*(' + df(t[_t].l) + '))';
      15,27: Result := '0';
      16: Result := '(0.5/sqrt(' + getformula(t[_t].l) + ')*(' + df(t[_t].l) + '))';
      17: Result := '(1/(' + getformula(t[_t].l) + ')*(' + df(t[_t].l) + '))';
      18: Result := '(exp(' + getformula(t[_t].l) + ')*(' + df(t[_t].l) + '))';
      19: Result := '(1/sqrt(1-(' + getformula(t[_t].l) + ')^2)*(' + df(t[_t].l) + '))';
      20: Result := '(-1/sqrt(1-(' + getformula(t[_t].l) + ')^2)*(' + df(t[_t].l) + '))';
      21: Result := '(1/(1+(' + getformula(t[_t].l) + ')^2)*(' + df(t[_t].l) + '))';
      22: Result := '(-1/(1+(' + getformula(t[_t].l) + ')^2)*(' + df(t[_t].l) + '))';
      23: Result := '(cosh(' + getformula(t[_t].l) + ')*(' + df(t[_t].l) + '))';
      24: Result := '(sinh(' + getformula(t[_t].l) + ')*(' + df(t[_t].l) + '))';
      25: Result := '(1/(cosh(' + getformula(t[_t].l) + ')^2)*(' + df(t[_t].l) + '))';
      26: Result := '(-1/(sinh(' + getformula(t[_t].l) + ')^2)*(' + df(t[_t].l) + '))';
      31:
      begin
        r := '((' + getformula(t[_t].r) + ')*(' + getformula(t[_t].l) + ')^(';
        r := r + floattostr(strtofloat(getformula(t[_t].r)) - 1);
        Result := r + ')*(' + df(t[_t].l) + '))';
      end;
    end;
  end;

begin
  DVar := v;
  DelTree;
  Err := False;
  Prevlex := 0;
  Curlex := 0;
  Pos := 1;
  bc := 0;
  Tree := GetTree(Formula);
  if (bc <> 0) or Err then
  begin
    Tree := 0;
    Error('Error in formula.');
  end;

  Err := False;
  Prevlex := 0;
  Curlex := 0;
  Pos := 1;
  bc := 0;
  Tree2 := GetTree(df(Tree));
  if (bc <> 0) or Err then
  begin
    Tree2 := 0;
    Error('Error in formula.');
  end
  else
    Result := getformula2(simplify(Tree2));
  DelTree;
end;

end.