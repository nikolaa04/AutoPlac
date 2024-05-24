unit obavestenjaPosalji;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts, FMX.Edit,
  Data.DB, FireDAC.Comp.Client;

type
  TformPosalji = class(TForm)
    slika: TLayout;
    Image1: TImage;
    top: TLayout;
    Line1: TLine;
    Text1: TText;
    client: TLayout;
    Posalji: TButton;
    bot: TLayout;
    Button1: TButton;
    username: TLayout;
    Text2: TText;
    editKome: TEdit;
    Layout1: TLayout;
    Text3: TText;
    editPoruka: TEdit;
    procedure PosaljiClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formPosalji: TformPosalji;

implementation

uses dm, obavestenja;  // Uključivanje modula sa bazom podataka

{$R *.fmx}

procedure TformPosalji.Button1Click(Sender: TObject);
begin
    formPosalji.Hide;
    formObavestenja.Show;
end;

procedure TformPosalji.PosaljiClick(Sender: TObject);
var
  Kome, Poruka: string;
begin
  // Provera da li su podaci uneti
  if Trim(editKome.Text) = '' then
  begin
    ShowMessage('Molimo vas unesite kome šaljete obaveštenje!');
    editKome.SetFocus;
    Exit;
  end;

  if Trim(editPoruka.Text) = '' then
  begin
    ShowMessage('Molimo vas unesite poruku!');
    editPoruka.SetFocus;
    Exit;
  end;

  // Dohvaćanje unesenih podataka
  Kome := editKome.Text;
  Poruka := editPoruka.Text;

  // Upisivanje podataka u bazu
  with dm.db do
  begin
    qtemp.SQL.Clear;
    qtemp.SQL.Text := 'INSERT INTO obavestenja (kome, poruka) ' +
                      'VALUES (:kome, :poruka)';
    qtemp.Params.ParamByName('kome').AsString := Kome;
    qtemp.Params.ParamByName('poruka').AsString := Poruka;
    qtemp.ExecSQL;

    ShowMessage('Obaveštenje je uspešno poslato!');

    // Čišćenje polja nakon uspešnog slanja
    editKome.Text := '';
    editPoruka.Text := '';
  end;
end;

end.

