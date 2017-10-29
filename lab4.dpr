program lab4;
   {$APPTYPE CONSOLE}
const n=10; maxNum=20;
type TArray = array[1..N] of Integer;
var MainArray, EditedArray: TArray;
i,j,k, count, val, maxsize:Integer;

function checkRepeatValue(arr:TArray;value,num:integer):Boolean;
var isRepeat:Boolean; k:byte;
begin
  isRepeat:=false;
  for k:=1 to (num-1) do
  begin
    if (arr[k] = value) then
      isRepeat:=true

  end;
  checkRepeatValue:=isRepeat;
end;

function isIncreases(arr: TArray; size: Integer):boolean;
var i,j, NextArrElem: Integer;
isIncr: boolean;
begin
  i:=1;
  k:=0;
  isIncr:=True;
  NextArrElem:=arr[2];
  while ((i < size)) do
  begin
    if(arr[i] < MaxNum) then
    begin
      j:=i+1;
      while(j <= Size) do
      begin
        if(arr[j] < MaxNum) then
        begin
          NextArrElem:= arr[j];
          j:=size+1;
        end
        else
        if (j >= size) then
        begin
          nextarrelem:=arr[size];
          j:=222;
        end;
        Inc(j);
      end;
      if (arr[i] > NextArrElem) then
      begin
        isIncr:=false;
        i:=size;
      end
      else
        isIncr:=true;
    end;
    inc(i);
  end;
  isIncreases:=isIncr;
end;

procedure getMainArray(arr: TArray; size,k: integer);
var TempArr: TArray;
i,j,m,p:Integer;
begin
  for i:=1 to size do
  begin
    for j:=1 to size do
    begin
      {Writeln('j ', arr[j]);
      writeln('i ', arr[i]);}
      if (((arr[j] < arr [i]) and (j > i))
          or
         ((arr[j] > arr [i]) and (j < i)))
      then
        TempArr[j] := maxNum+1
      else
        TempArr[j]:=arr[j];
    end;

    //Writeln;
    Inc(k);
    //writeln(k);
    {if (not(isIncreases(TempArr,size))) then}
    //not(isIncreases(TempArr,N))
    if (k <= size) then
    begin
      //Writeln('sss');
      getMainArray(TempArr, size, k+1)
    end
    else
    begin
        if(isIncreases(TempArr, Size)) then
        begin
          count:=0;
          for m:=1 to size do
          begin
            if(TempArr[m] < maxNum) then
            begin
              //write(TempArr[m]:4);
              Inc(count);
            end;
          end;
          //write('  - ', count,'/',maxsize);
          if (count > maxsize) then
            begin
              maxsize:=count;
              for p:=1 to size do
                EditedArray[p] := TempArr[p];
            end;

        end;
    end;
  end;
end;

begin
  maxsize:=0;
  Randomize;
  i:=1;
  Writeln('Primary array:');
  while(i <= N) do
  begin
    val:=RANDOM(maxNum)-10;
    if(checkRepeatValue(MainArray,val,i)=false) then
    begin
      MainArray[I]:=val;
      write(MainArray[i]:4);
      inc(i);
    end;
  end;
  writeln;
  //MainArray[2] := maxNum+1;
  {for j:=1 to n do
  begin
    if(MainArray[j] < maxNum) then
      write(MainArray[j]:4);
  end; }
  getMainArray(MainArray, N, k);
  Writeln('Edited array: ');
  for j:=1 to n do
  begin
    if(EditedArray[j] < maxNum) then
      write(EditedArray[j]:4);
  end;
  writeln;
  Writeln('Deleted ', n-maxsize, ' elements');
  Readln;
end.


