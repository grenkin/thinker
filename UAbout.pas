unit UAbout;

interface

uses
  Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls;

type
  TfrmAbout = class(TForm)
    Panel: TPanel;
    lblProductName: TLabel;
    lblAuthor: TLabel;
    lblEmail: TLabel;
    btnOK: TButton;
    imgLogo: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbout: TfrmAbout;

implementation

{$R *.dfm}

end.

