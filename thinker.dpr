program thinker;

uses
  Forms,
  UMain in 'UMain.pas' {frmMain},
  UGameRules in 'UGameRules.pas' {frmGameRules},
  UAbout in 'UAbout.pas' {frmAbout},
  UComputerMoves in 'UComputerMoves.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Thinker';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmGameRules, frmGameRules);
  Application.CreateForm(TfrmAbout, frmAbout);
  Application.Run;
end.
