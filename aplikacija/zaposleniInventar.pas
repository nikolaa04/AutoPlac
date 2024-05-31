unit zaposleniInventar;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts;

type
  TformZaposleniInventar = class(TForm)
    slika: TLayout;
    Image1: TImage;
    top: TLayout;
    Line1: TLine;
    Text1: TText;
    client: TLayout;
    Button1: TButton;
    Oprema: TButton;
    bot: TLayout;
    buttonNazad: TButton;
    procedure Button1Click(Sender: TObject);
    procedure OpremaClick(Sender: TObject);
    procedure buttonNazadClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formZaposleniInventar: TformZaposleniInventar;

implementation

uses zaposleniAutomobili,zaposleniOpremaI,zaposleniMain;

{$R *.fmx}

procedure TformZaposleniInventar.Button1Click(Sender: TObject);
begin
    formZaposleniInventar.Hide;
    formZaposleniAutomobili1.show;
end;

procedure TformZaposleniInventar.buttonNazadClick(Sender: TObject);
begin
    formZaposleniInventar.hide;
    formZaposleniMain.show;
end;

procedure TformZaposleniInventar.OpremaClick(Sender: TObject);
begin
    formzaposleniInventar.hide;
    formZaposleniOprema1.show;
end;

end.
