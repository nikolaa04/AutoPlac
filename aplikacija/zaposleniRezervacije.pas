unit zaposleniRezervacije;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts;

type
  TformZaposleniRezervacije = class(TForm)
    slika: TLayout;
    Image1: TImage;
    top: TLayout;
    Line1: TLine;
    Text1: TText;
    client: TLayout;
    bot: TLayout;
    buttonNazad: TButton;
    Button1: TButton;
    Oprema: TButton;
    procedure Button1Click(Sender: TObject);
    procedure buttonNazadClick(Sender: TObject);
    procedure OpremaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formZaposleniRezervacije: TformZaposleniRezervacije;

implementation

uses zaposleniServisi,zaposleniMain,zaposleniOpremaZ;

{$R *.fmx}

procedure TformZaposleniRezervacije.Button1Click(Sender: TObject);
begin
    formzaposleniRezervacije.hide;
    formzaposleniServisi.show;
end;

procedure TformZaposleniRezervacije.buttonNazadClick(Sender: TObject);
begin
    formzaposleniRezervacije.hide;
    formZaposleniMain.show;
end;

procedure TformZaposleniRezervacije.OpremaClick(Sender: TObject);
begin
    formzaposleniRezervacije.Hide;
    formZaposleniOpremaZ.show;
end;

end.
