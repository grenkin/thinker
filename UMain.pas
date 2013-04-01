unit UMain;

interface

uses
  Windows, Messages, SysUtils, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, Classes, jpeg, StdCtrls, UComputerMoves;
type
  TfrmMain = class(TForm)
    MainMenu: TMainMenu;
    mnGame: TMenuItem;
    mnNewGame: TMenuItem;
    mnExit: TMenuItem;
    mnHelp: TMenuItem;
    mnAbout: TMenuItem;
    mnGameRules: TMenuItem;
    imgComputerField: TImage;
    lblComputer: TLabel;
    imgComputerChoice: TImage;
    imgUserField: TImage;
    lblUser: TLabel;
    imgUserChoice: TImage;
    shpComputerRes11: TShape;
    shpComputerRes12: TShape;
    shpComputerChoice1: TShape;
    lblQuestion1: TLabel;
    shpComputerChoice2: TShape;
    lblQuestion2: TLabel;
    shpComputerChoice3: TShape;
    lblQuestion3: TLabel;
    shpComputerChoice4: TShape;
    lblQuestion4: TLabel;
    shpComputerRes13: TShape;
    shpComputerRes14: TShape;
    shpComputer11: TShape;
    shpComputer12: TShape;
    shpComputer13: TShape;
    shpComputer14: TShape;
    shpComputer21: TShape;
    shpComputer22: TShape;
    shpComputer23: TShape;
    shpComputer24: TShape;
    shpComputerRes21: TShape;
    shpComputerRes22: TShape;
    shpComputerRes24: TShape;
    shpComputerRes23: TShape;
    shpComputer31: TShape;
    shpComputer32: TShape;
    shpComputer33: TShape;
    shpComputer34: TShape;
    shpComputerRes31: TShape;
    shpComputerRes32: TShape;
    shpComputerRes34: TShape;
    shpComputerRes33: TShape;
    shpComputer41: TShape;
    shpComputer42: TShape;
    shpComputer43: TShape;
    shpComputer44: TShape;
    shpComputerRes41: TShape;
    shpComputerRes42: TShape;
    shpComputerRes44: TShape;
    shpComputerRes43: TShape;
    shpComputer51: TShape;
    shpComputer52: TShape;
    shpComputer53: TShape;
    shpComputer54: TShape;
    shpComputerRes51: TShape;
    shpComputerRes52: TShape;
    shpComputerRes54: TShape;
    shpComputerRes53: TShape;
    shpComputer61: TShape;
    shpComputer62: TShape;
    shpComputer63: TShape;
    shpComputer64: TShape;
    shpComputerRes61: TShape;
    shpComputerRes62: TShape;
    shpComputerRes64: TShape;
    shpComputerRes63: TShape;
    shpUser11: TShape;
    shpUser12: TShape;
    shpUser13: TShape;
    shpUser14: TShape;
    shpUserRes11: TShape;
    shpUserRes12: TShape;
    shpUserRes14: TShape;
    shpUserRes13: TShape;
    shpUser21: TShape;
    shpUser22: TShape;
    shpUser23: TShape;
    shpUser24: TShape;
    shpUser34: TShape;
    shpUser33: TShape;
    shpUser32: TShape;
    shpUser31: TShape;
    shpUserRes31: TShape;
    shpUserRes32: TShape;
    shpUserRes34: TShape;
    shpUserRes33: TShape;
    shpUser41: TShape;
    shpUser42: TShape;
    shpUser43: TShape;
    shpUser44: TShape;
    shpUserRes41: TShape;
    shpUserRes42: TShape;
    shpUserRes44: TShape;
    shpUserRes43: TShape;
    shpUser51: TShape;
    shpUser52: TShape;
    shpUser53: TShape;
    shpUser54: TShape;
    shpUserRes51: TShape;
    shpUserRes52: TShape;
    shpUserRes54: TShape;
    shpUserRes53: TShape;
    shpUser61: TShape;
    shpUser62: TShape;
    shpUser63: TShape;
    shpUser64: TShape;
    shpUserRes61: TShape;
    shpUserRes62: TShape;
    shpUserRes64: TShape;
    shpUserRes63: TShape;
    shpUserRes21: TShape;
    shpUserRes22: TShape;
    shpUserRes24: TShape;
    shpUserRes23: TShape;
    shpUserChoice1: TShape;
    shpUserChoice2: TShape;
    shpUserChoice3: TShape;
    shpUserChoice4: TShape;
    procedure mnAboutClick(Sender: TObject);
    procedure mnExitClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure mnNewGameClick(Sender: TObject);
    procedure UserChoiceShapeMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ComputerShapeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mnGameRulesClick(Sender: TObject);
  private
    { Private declarations }
    ComputerChoice, UserChoice: TCirclesColors;
    Computer, User: TMoves;
    ComputerRes, UserRes: TRes;
    GameStart: boolean;
    MovesDone: byte;
    PlayingOut: boolean;
    ComputerShapes, UserShapes: array[1..6, 1..4] of TShape;
    ComputerResShapes, UserResShapes: array[1..6, 1..4] of TShape;
    ComputerChoiceShapes, UserChoiceShapes: array[1..4] of TShape;
    QuestionLabels: array[1..4] of TLabel;
    procedure SetUserChoiceColor(i: byte; color: TCircleColor);
    procedure SetComputerColor(i, j: byte; color: TCircleColor);
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses UAbout, UGameRules;

const
  MovesColors: array[1..6] of TColor = ($4028DF, $1D4D0F, $691D16, $0A2958, $BCF1BD, $6FB7FF);
  WhiteColor: TColor = clWhite;
  GrayColor: TColor = clGray;

{$R *.dfm}

procedure TfrmMain.mnAboutClick(Sender: TObject);
begin
  frmAbout.ShowModal;
end;

procedure TfrmMain.mnExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i, j: byte;
  flag: boolean;
begin
  if (Key = VK_RETURN) then
  begin
    if (GameStart) then
    begin
      flag := false;
      for i := 1 to 4 do
      begin
        for j := i+1 to 4 do
        begin
          if (UserChoice[i] = UserChoice[j]) then
            flag := true;
        end;
      end;
      if (flag) then
        ShowMessage('Please choose different colors!')
      else
      begin
        GameStart := false;
        for i := 1 to 4 do
          SetComputerColor(1, i, 1);
        for i := 1 to 4 do
          ComputerShapes[1, i].Show;
      end;
    end
    else
    begin
      if (MovesDone < 6) then
      begin
        flag := false;
        for i := 1 to 4 do
        begin
          for j := i+1 to 4 do
          begin
            if (Computer[MovesDone+1][i] = Computer[MovesDone+1][j]) then
              flag := true;
          end;
        end;
        if (flag) then
          ShowMessage('Please choose different colors!')
        else
        begin
          ComputerRes[MovesDone+1] := GetRes(Computer[MovesDone+1], ComputerChoice);
          if (not PlayingOut) then
          begin
            Screen.Cursor := crHourGlass;
            User[MovesDone+1] := GetComputerMove(MovesDone, User, UserRes);
            Screen.Cursor := crDefault;
            UserRes[MovesDone+1] := GetRes(User[MovesDone+1], UserChoice);
            for i := 1 to 4 do
              UserShapes[MovesDone+1, i].Brush.Color := MovesColors[User[MovesDone+1, i]];
            for i := 1 to 4 do
              UserShapes[MovesDone+1, i].Show;
          end;
          for i := 1 to ComputerRes[MovesDone+1].GrayCircles do
          begin
            ComputerResShapes[MovesDone+1, i].Brush.Color := GrayColor;
            ComputerResShapes[MovesDone+1, i].Show;
          end;
          for i := ComputerRes[MovesDone+1].GrayCircles+1 to ComputerRes[MovesDone+1].GrayCircles+ComputerRes[MovesDone+1].WhiteCircles do
          begin
            ComputerResShapes[MovesDone+1, i].Brush.Color := WhiteColor;
            ComputerResShapes[MovesDone+1, i].Show;
          end;
          if (not PlayingOut) then
          begin
            for i := 1 to UserRes[MovesDone+1].GrayCircles do
            begin
              UserResShapes[MovesDone+1, i].Brush.Color := GrayColor;
              UserResShapes[MovesDone+1, i].Show;
            end;
            for i := UserRes[MovesDone+1].GrayCircles+1 to UserRes[MovesDone+1].GrayCircles+UserRes[MovesDone+1].WhiteCircles do
            begin
              UserResShapes[MovesDone+1, i].Brush.Color := WhiteColor;
              UserResShapes[MovesDone+1, i].Show;
            end;
          end;
          inc(MovesDone);

          if (not PlayingOut) then
          begin
            if (ComputerRes[MovesDone].GrayCircles = 4) then
            begin
              if (UserRes[MovesDone].GrayCircles = 4) then
                ShowMessage('Draw!')
              else
                ShowMessage('You won!');
              MovesDone := 6;
            end
            else if (UserRes[MovesDone].GrayCircles = 4) then
            begin
              if (MovesDone = 6) then
                ShowMessage('Computer won.')
              else
              begin
                if (Application.MessageBox('Computer won. Would you like to continue the game?', 'Thinker', MB_YESNO) = IDNO) then
                  MovesDone := 6
                else
                  PlayingOut := true;
              end;
            end;
          end
          else
          begin
            if (ComputerRes[MovesDone].GrayCircles = 4) then
              MovesDone := 6;
          end;

          if (MovesDone < 6) then
          begin
            for i := 1 to 4 do
              SetComputerColor(MovesDone+1, i, 1);
            for i := 1 to 4 do
              ComputerShapes[MovesDone+1, i].Show;
          end
          else
          begin
            for i := 1 to 4 do
              QuestionLabels[i].Hide;
            for i := 1 to 4 do
              ComputerChoiceShapes[i].Brush.Color := MovesColors[ComputerChoice[i]];
          end;
        end;
      end;
    end;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  Randomize;
  ComputerShapes[1, 1] := shpComputer11;
  ComputerShapes[1, 2] := shpComputer12;
  ComputerShapes[1, 3] := shpComputer13;
  ComputerShapes[1, 4] := shpComputer14;
  ComputerShapes[2, 1] := shpComputer21;
  ComputerShapes[2, 2] := shpComputer22;
  ComputerShapes[2, 3] := shpComputer23;
  ComputerShapes[2, 4] := shpComputer24;
  ComputerShapes[3, 1] := shpComputer31;
  ComputerShapes[3, 2] := shpComputer32;
  ComputerShapes[3, 3] := shpComputer33;
  ComputerShapes[3, 4] := shpComputer34;
  ComputerShapes[4, 1] := shpComputer41;
  ComputerShapes[4, 2] := shpComputer42;
  ComputerShapes[4, 3] := shpComputer43;
  ComputerShapes[4, 4] := shpComputer44;
  ComputerShapes[5, 1] := shpComputer51;
  ComputerShapes[5, 2] := shpComputer52;
  ComputerShapes[5, 3] := shpComputer53;
  ComputerShapes[5, 4] := shpComputer54;
  ComputerShapes[6, 1] := shpComputer61;
  ComputerShapes[6, 2] := shpComputer62;
  ComputerShapes[6, 3] := shpComputer63;
  ComputerShapes[6, 4] := shpComputer64;
  UserShapes[1, 1] := shpUser11;
  UserShapes[1, 2] := shpUser12;
  UserShapes[1, 3] := shpUser13;
  UserShapes[1, 4] := shpUser14;
  UserShapes[2, 1] := shpUser21;
  UserShapes[2, 2] := shpUser22;
  UserShapes[2, 3] := shpUser23;
  UserShapes[2, 4] := shpUser24;
  UserShapes[3, 1] := shpUser31;
  UserShapes[3, 2] := shpUser32;
  UserShapes[3, 3] := shpUser33;
  UserShapes[3, 4] := shpUser34;
  UserShapes[4, 1] := shpUser41;
  UserShapes[4, 2] := shpUser42;
  UserShapes[4, 3] := shpUser43;
  UserShapes[4, 4] := shpUser44;
  UserShapes[5, 1] := shpUser51;
  UserShapes[5, 2] := shpUser52;
  UserShapes[5, 3] := shpUser53;
  UserShapes[5, 4] := shpUser54;
  UserShapes[6, 1] := shpUser61;
  UserShapes[6, 2] := shpUser62;
  UserShapes[6, 3] := shpUser63;
  UserShapes[6, 4] := shpUser64;
  ComputerResShapes[1, 1] := shpComputerRes11;
  ComputerResShapes[1, 2] := shpComputerRes12;
  ComputerResShapes[1, 3] := shpComputerRes13;
  ComputerResShapes[1, 4] := shpComputerRes14;
  ComputerResShapes[2, 1] := shpComputerRes21;
  ComputerResShapes[2, 2] := shpComputerRes22;
  ComputerResShapes[2, 3] := shpComputerRes23;
  ComputerResShapes[2, 4] := shpComputerRes24;
  ComputerResShapes[3, 1] := shpComputerRes31;
  ComputerResShapes[3, 2] := shpComputerRes32;
  ComputerResShapes[3, 3] := shpComputerRes33;
  ComputerResShapes[3, 4] := shpComputerRes34;
  ComputerResShapes[4, 1] := shpComputerRes41;
  ComputerResShapes[4, 2] := shpComputerRes42;
  ComputerResShapes[4, 3] := shpComputerRes43;
  ComputerResShapes[4, 4] := shpComputerRes44;
  ComputerResShapes[5, 1] := shpComputerRes51;
  ComputerResShapes[5, 2] := shpComputerRes52;
  ComputerResShapes[5, 3] := shpComputerRes53;
  ComputerResShapes[5, 4] := shpComputerRes54;
  ComputerResShapes[6, 1] := shpComputerRes61;
  ComputerResShapes[6, 2] := shpComputerRes62;
  ComputerResShapes[6, 3] := shpComputerRes63;
  ComputerResShapes[6, 4] := shpComputerRes64;
  UserResShapes[1, 1] := shpUserRes11;
  UserResShapes[1, 2] := shpUserRes12;
  UserResShapes[1, 3] := shpUserRes13;
  UserResShapes[1, 4] := shpUserRes14;
  UserResShapes[2, 1] := shpUserRes21;
  UserResShapes[2, 2] := shpUserRes22;
  UserResShapes[2, 3] := shpUserRes23;
  UserResShapes[2, 4] := shpUserRes24;
  UserResShapes[3, 1] := shpUserRes31;
  UserResShapes[3, 2] := shpUserRes32;
  UserResShapes[3, 3] := shpUserRes33;
  UserResShapes[3, 4] := shpUserRes34;
  UserResShapes[4, 1] := shpUserRes41;
  UserResShapes[4, 2] := shpUserRes42;
  UserResShapes[4, 3] := shpUserRes43;
  UserResShapes[4, 4] := shpUserRes44;
  UserResShapes[5, 1] := shpUserRes51;
  UserResShapes[5, 2] := shpUserRes52;
  UserResShapes[5, 3] := shpUserRes53;
  UserResShapes[5, 4] := shpUserRes54;
  UserResShapes[6, 1] := shpUserRes61;
  UserResShapes[6, 2] := shpUserRes62;
  UserResShapes[6, 3] := shpUserRes63;
  UserResShapes[6, 4] := shpUserRes64;
  ComputerChoiceShapes[1] := shpComputerChoice1;
  ComputerChoiceShapes[2] := shpComputerChoice2;
  ComputerChoiceShapes[3] := shpComputerChoice3;
  ComputerChoiceShapes[4] := shpComputerChoice4;
  UserChoiceShapes[1] := shpUserChoice1;
  UserChoiceShapes[2] := shpUserChoice2;
  UserChoiceShapes[3] := shpUserChoice3;
  UserChoiceShapes[4] := shpUserChoice4;
  QuestionLabels[1] := lblQuestion1;
  QuestionLabels[2] := lblQuestion2;
  QuestionLabels[3] := lblQuestion3;
  QuestionLabels[4] := lblQuestion4;
  mnNewGame.Click;
end;

procedure TfrmMain.mnNewGameClick(Sender: TObject);
var
  i, j: byte;
  color: TCircleColor;
  flag: boolean;
begin
  GameStart := true;
  MovesDone := 0;
  PlayingOut := false;
  for i := 1 to 6 do
  begin
    for j := 1 to 4 do
    begin
      ComputerShapes[i, j].Hide;
      UserShapes[i, j].Hide;
      ComputerResShapes[i, j].Hide;
      UserResShapes[i, j].Hide;
    end;
  end;
  for i := 1 to 4 do
  begin
    ComputerChoiceShapes[i].Brush.Color := clBlack;
    QuestionLabels[i].Show;
    SetUserChoiceColor(i, 1);
  end;
  for i := 1 to 4 do
  begin
    repeat
      color := random(6)+1;
      flag := false;
      for j := 1 to i-1 do
      begin
        if (ComputerChoice[j] = color) then
          flag := true;
      end;
    until (not flag);
    ComputerChoice[i] := color;
  end;   
end;

procedure TfrmMain.SetUserChoiceColor(i: byte; color: TCircleColor);
begin
  UserChoice[i] := color;
  UserChoiceShapes[i].Brush.Color := MovesColors[color];
end;

procedure TfrmMain.UserChoiceShapeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  i: byte;
  ii: byte;
begin
  if (not GameStart) then
    Exit;
  for i := 1 to 4 do
  begin
    if (UserChoiceShapes[i] = Sender) then
      ii := i;
  end;
  SetUserChoiceColor(ii, UserChoice[ii] mod 6 + 1);
end;

procedure TfrmMain.SetComputerColor(i, j: byte; color: TCircleColor);
begin
  Computer[i, j] := color;
  ComputerShapes[i, j].Brush.Color := MovesColors[color];
end;

procedure TfrmMain.ComputerShapeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  i, j: byte;
  ii, jj: byte;
begin
  if (Screen.Cursor = crHourGlass) then
    Exit;
  for i := 1 to 6 do
  begin
    for j := 1 to 4 do
    begin
      if (ComputerShapes[i, j] = Sender) then
      begin
        ii := i;
        jj := j;
      end;
    end;
  end;
  if (ii = MovesDone+1) then
    SetComputerColor(ii, jj, Computer[ii, jj] mod 6 + 1);
end;

procedure TfrmMain.mnGameRulesClick(Sender: TObject);
begin
  with frmGameRules do
    ActiveControl := btnOK; 
  frmGameRules.ShowModal;
end;

end.
