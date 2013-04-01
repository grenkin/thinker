unit UGameRules;

interface

uses
  Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls;

type
  TfrmGameRules = class(TForm)
    btnOK: TButton;
    mmGameRules: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGameRules: TfrmGameRules;

implementation

{$R *.dfm}

end.

