unit evidencija;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts;

type
  TformEvidencija = class(TForm)
    slika: TLayout;
    Image1: TImage;
    top: TLayout;
    bot: TLayout;
    logoutButton: TButton;
    client: TLayout;
    Text1: TText;
    registerButton: TButton;
    Image2: TImage;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formEvidencija: TformEvidencija;

implementation

{$R *.fmx}

end.
