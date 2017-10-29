Lab №4. Working with one-dimensional arrays
--------------------
***
#### Task:
![The task](https://i.imgur.com/V7jeSPI.png)

>The program removes the minimum number of elements of the original array so that the remaining elements go in ascending order

**Language**: Delphi

**Algorithm scheme**: 

![Algorithm scheme](https://github.com/N1ghtF1re/lab4/blob/master/algorithm_scheme.jpg)

**Code:**
```
program lab4;
   {$APPTYPE CONSOLE}
const n=10; maxNum=20;
resourcestring
  PrimArr = 'Primary array: ';
  EdArr = 'Edited array: ';
  Del = 'Deleted';
  El = 'elements';
type TArray = array[1..N] of Integer;
var MainArray, EditedArray: TArray;
i,j,k, count, val, maxsize:Integer;

function checkRepeatValue(arr:TArray;value,num:integer):Boolean;
{ ==========================
  The function checks if
  the received value is
  in the arr array.
  In the case of repetition,
  returns true
  ========================== }
var isRepeat:Boolean; k:byte;
begin
  isRepeat:=false;
  k:=1;
  while(k < num) do
  begin
    if (arr[k] = value) then
    begin
      isRepeat:=true;
      k:=num;
    end;
    Inc(k);
  end;
  checkRepeatValue:=isRepeat;
end;

function isIncreases(arr: TArray; size: Integer):boolean;
{ =============================
  The function checks to see if
  the items of array are sorted
  =============================}
var i,j, NextArrElem: Integer;
isIncr: boolean;
begin
  i:=1;
  k:=0;
  isIncr:=True;
  NextArrElem:=arr[2];
  while (i < size) do
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
        begin
          if (j >= size) then
          begin
            nextarrelem:=arr[size];
            j:=size;
          end;
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
{ =================================
  The function recursively remove
  repeated value of array to obtain
  an ascending array with minimal
  deleted elements
  =================================}
var TempArr: TArray;
i,j,m,p:Integer;
begin
  for i:=1 to size do
  begin
    for j:=1 to size do
    begin
      if (((arr[j] < arr [i]) and (j > i))
          or
         ((arr[j] > arr [i]) and (j < i)))
      then
        TempArr[j] := maxNum+1 // To delete an item,
        // a value greater than the maximum value
      else
        TempArr[j]:=arr[j];
    end;
    Inc(k);
    if (k <= size) then
    begin
      getMainArray(TempArr, size, k)
    end
    else
    begin
        if(isIncreases(TempArr, Size)) then
        begin
          count:=0;
          for m:=1 to size do
          begin
            if(TempArr[m] < maxNum) then // Skipping deleted items
            begin
              Inc(count);
            end;
          end;
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
  maxSize:=0;
  Randomize;
  i:=1;
  Writeln(PrimArr);
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
  getMainArray(MainArray, N, k);
  Writeln(EdArr);
  for j:=1 to n do
  begin
    if(EditedArray[j] < maxNum) then // Array output with missing elements
      write(EditedArray[j]:4);
  end;
  writeln;
  Writeln(Del,' ', n-maxsize,' ', el);
  Readln;
end.



```

