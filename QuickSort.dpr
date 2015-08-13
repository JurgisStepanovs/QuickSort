program QuickSort;
//(c) JurgisStepanovs 2015
//runs and compiles with Delphi XE as console application
//please modify for other Pascal distributions

{$APPTYPE CONSOLE}

uses
  SysUtils;

//dynamic array def
type
  TIntArray = array of Integer;

//implemented QuickSort as procedure
procedure Qsort(var Steps: Integer; var Ints: TIntArray; Left, Right: integer);
var
  ptrLeft, ptrRight, Pivot, Temp: integer;
begin
  ptrLeft := Left;
  ptrRight := Right;
  Pivot := Ints[(Left + Right) div 2];

  Inc(Steps); //for statistics only, remove for faster implementation

  repeat
    while (ptrLeft < Right) and (Ints[ptrLeft] < Pivot) do
      inc(ptrLeft);
    while (ptrRight > Left) and (Ints[ptrRight] > Pivot) do
      dec(ptrRight);
    if ptrLeft <= ptrRight then
      begin
        if ptrLeft < ptrRight then
          begin
            Temp := Ints[ptrLeft];
            Ints[ptrLeft] := Ints[ptrRight];
            Ints[ptrRight] := Temp;
          end;
        inc(ptrLeft);
        dec(ptrRight);
     end;
  until ptrLeft > ptrRight;

  if ptrRight > Left then
    Qsort(steps, ints , Left, ptrRight);
  if ptrLeft < Right then
    Qsort(steps, ints, ptrLeft, Right);

end;

//global variables
var
 i, i1: Integer;
 Ints: TIntArray;
 input: String;
 RecursiveSteps: Integer;

//main programm
begin

     i:=0;
     RecursiveSteps:=0;

     //read user input until 'q', other non numeric inputs will crash programm
     WriteLn('***** Quick Sort demo porgramm by JurgisStepanovs *****');
     WriteLn('Please enter some numbers ("q" to sort):');
     repeat
       ReadLn(input);
       if not ((input='Q') or (input='q')) then begin
        SetLength(Ints, i+1);
        Ints[i]:=StrToInt(input);
        Inc(i);
       end;
     until (input='Q') or (input='q');

     //if nothing to sort
     if i=0 then Exit;

     //Quick sort the list
     Qsort(RecursiveSteps,Ints,0,i-1);

     //print out sorted list to console window
     WriteLn('Sorted list (sorted in ',RecursiveSteps,' recursive steps):');
     for i1 := 0 to i-1 do
       WriteLn(Ints[i1]);

     //stop programm until user input 'q'
     WriteLn('Type "q" to exit:');
     repeat
       ReadLn(input);
     until (input='Q') or (input='q');

end.
