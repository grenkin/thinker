unit UComputerMoves;

interface

type
  TCircleColor = 1..6;
  TCirclesColors = array[1..4] of TCircleColor;
  TMoveResult = record
    WhiteCircles, GrayCircles: byte;
  end;
  TMoves = array[1..6] of TCirclesColors;
  TRes = array[1..6] of TMoveResult;

function GetComputerMove(MovesDone: byte; ComputerMoves: TMoves; ComputerMovesRes: TRes): TCirclesColors;
function GetRes(a, b: TCirclesColors): TMoveResult;

implementation

function rec1(MovesDone: byte; ComputerMoves: TMoves; ComputerMovesRes: TRes;
  k: byte; var BestMove: TCirclesColors): integer;
var
  v: array[0..4, 0..4] of boolean;
  used, used2: array[1..6] of boolean;
  a, b, tmp: TCirclesColors;
  i1, i2, i3, i4, j1, j2, j3, j4: byte;
  r: TMoveResult;
  i, j: byte;
  flag: boolean;
  cnt: integer;
  x: integer;
  max_cnt, min_max_cnt: integer;
begin
  if ((MovesDone = 6) or (k = 1)) then
  begin
    for i := 1 to 6 do
      used[i] := false;
    cnt := 0;
    for i1 := 1 to 6 do
    begin
      if (used[i1]) then
        continue;
      used[i1] := true;
      for i2 := 1 to 6 do
      begin
        if (used[i2]) then
          continue;
        used[i2] := true;
        for i3 := 1 to 6 do
        begin
          if (used[i3]) then
            continue;
          used[i3] := true;
          for i4 := 1 to 6 do
          begin
            if (used[i4]) then
              continue;
            a[1] := i1;
            a[2] := i2;
            a[3] := i3;
            a[4] := i4;
            flag := true;
            for j := 1 to MovesDone do
            begin
              r := GetRes(a, ComputerMoves[j]);
              if ((r.WhiteCircles <> ComputerMovesRes[j].WhiteCircles) or
                (r.GrayCircles <> ComputerMovesRes[j].GrayCircles)) then
              begin
                flag := false;
              end;
            end;
            if (flag) then
              inc(cnt);
          end;
          used[i3] := false;
        end;
        used[i2] := false;
      end;
      used[i1] := false;
    end;
    Result := cnt;
  end
  else
  begin
    min_max_cnt := maxint;
    //i1, i2, i3, i4 - перебираем возможные ходы компьютера
    for i := 1 to 6 do
      used[i] := false;
    for i1 := 1 to 6 do
    begin
      if (used[i1]) then
        continue;
      used[i1] := true;
      for i2 := 1 to 6 do
      begin
        if (used[i2]) then
          continue;
        used[i2] := true;
        for i3 := 1 to 6 do
        begin
          if (used[i3]) then
            continue;
          used[i3] := true;
          for i4 := 1 to 6 do
          begin
            if (used[i4]) then
              continue;
            a[1] := i1;
            a[2] := i2;
            a[3] := i3;
            a[4] := i4;
            flag := true;
            for j := 1 to MovesDone do
            begin
              r := GetRes(a, ComputerMoves[j]);
              if ((r.WhiteCircles <> ComputerMovesRes[j].WhiteCircles) or
                (r.GrayCircles <> ComputerMovesRes[j].GrayCircles)) then
              begin
                flag := false;
              end;
            end;
            if (not flag) then
              continue;

            //j1, j2, j3, j4 - перебираем возможные загаданные цвета
            for i := 0 to 4 do
            begin
              for j := 0 to 4 do
                v[i, j] := false;
            end;
            for i := 1 to 6 do
              used2[i] := false;
            for j1 := 1 to 6 do
            begin
              if (used2[j1]) then
                continue;
              used2[j1] := true;
              for j2 := 1 to 6 do
              begin
                if (used2[j2]) then
                  continue;
                used2[j2] := true;
                for j3 := 1 to 6 do
                begin
                  if (used2[j3]) then
                    continue;
                  used2[j3] := true;
                  for j4 := 1 to 6 do
                  begin
                    if (used2[j4]) then
                      continue;
                    b[1] := j1;
                    b[2] := j2;
                    b[3] := j3;
                    b[4] := j4;
                    flag := true;
                    for j := 1 to MovesDone do
                    begin
                      r := GetRes(b, ComputerMoves[j]);
                      if ((r.WhiteCircles <> ComputerMovesRes[j].WhiteCircles) or
                        (r.GrayCircles <> ComputerMovesRes[j].GrayCircles)) then
                      begin
                        flag := false;
                      end;
                    end;
                    if (flag) then
                    begin
                      r := GetRes(a, b);
                      v[r.WhiteCircles, r.GrayCircles] := true;
                    end;
                  end;
                  used2[j3] := false;
                end;
                used2[j2] := false;
              end;
              used2[j1] := false;
            end;

            max_cnt := 0;
            for i := 0 to 4 do
            begin
              for j := 0 to 4 do
              begin
                if (v[i, j]) then
                begin
                  r.WhiteCircles := i;
                  r.GrayCircles := j;
                  ComputerMoves[MovesDone+1] := a;
                  ComputerMovesRes[MovesDone+1] := r;
                  x := rec1(MovesDone+1, ComputerMoves, ComputerMovesRes, k+1, tmp);
                  if (x > max_cnt) then
                    max_cnt := x;
                end;
              end;
            end;

            if (max_cnt < min_max_cnt) then
            begin
              min_max_cnt := max_cnt;
              BestMove := a;
            end;
          end;
          used[i3] := false;
        end;
        used[i2] := false;
      end;
      used[i1] := false;
    end;
    Result := min_max_cnt;
  end;
end;

function GetComputerMove(MovesDone: byte; ComputerMoves: TMoves; ComputerMovesRes: TRes): TCirclesColors;
var
  i, j: byte;
  color: TCircleColor;
  flag: boolean;
begin
  if (MovesDone = 0) then
  begin
    for i := 1 to 4 do
    begin
      repeat
        color := random(6)+1;
        flag := false;
        for j := 1 to i-1 do
        begin
          if (Result[j] = color) then
            flag := true;
        end;
      until (not flag);
      Result[i] := color;
    end;
  end
  else
    rec1(MovesDone, ComputerMoves, ComputerMovesRes, 0, Result);
end;

function GetRes(a, b: TCirclesColors): TMoveResult;
var
  i, j: byte;
begin
  Result.WhiteCircles := 0;
  Result.GrayCircles := 0;
  for i := 1 to 4 do
  begin
    if (a[i] = b[i]) then
      inc(Result.GrayCircles)
    else
    begin
      for j := 1 to 4 do
      begin
        if (a[i] = b[j]) then
          inc(Result.WhiteCircles);
      end;
    end;
  end;
end;

end.
