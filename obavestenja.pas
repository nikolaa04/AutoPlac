unit obavestenja;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts;

type
  TformObavestenja = class(TForm)
    slika: TLayout;
    Image1: TImage;
    top: TLayout;
    Line1: TLine;
    Text1: TText;
    client: TLayout;
    bot: TLayout;
    Button1: TButton;
    Posalji: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formObavestenja: TformObavestenja;

implementation

uses zaposleniMain;
{$R *.fmx}

procedure TformObavestenja.Button1Click(Sender: TObject);
begin
    formObavestenja.Hide;
    formZaposleniMain.show;
end;

end.
