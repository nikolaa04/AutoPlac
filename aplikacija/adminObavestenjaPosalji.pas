unit adminObavestenjaPosalji;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.Objects, FMX.Layouts;

type
  TformAdminObavestenjaPosalji = class(TForm)
    slika: TLayout;
    Image1: TImage;
    top: TLayout;
    Line1: TLine;
    Text1: TText;
    client: TLayout;
    username: TLayout;
    Text2: TText;
    editKome: TEdit;
    Layout1: TLayout;
    Text3: TText;
    editPoruka: TEdit;
    bot: TLayout;
    Button1: TButton;
    Posalji: TButton;
    procedure PosaljiClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formAdminObavestenjaPosalji: TformAdminObavestenjaPosalji;

implementation

uses dm,adminObavestenja;

{$R *.fmx}

procedure TformAdminObavestenjaPosalji.Button1Click(Sender: TObject);
begin
    formAdminObavestenjaPosalji.hide;
    formAdminObavestenja.show;
end;

procedure TformAdminObavestenjaPosalji.PosaljiClick(Sender: TObject);
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
