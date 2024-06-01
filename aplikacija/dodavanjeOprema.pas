unit dodavanjeOprema;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts, FMX.Edit;

type
  TformDodavanjeOprema = class(TForm)
    slika: TLayout;
    Image1: TImage;
    top: TLayout;
    bot: TLayout;
    logoutButton: TButton;
    client: TLayout;
    buttonDodaj: TButton;
    imeOpreme: TLayout;
    Text2: TText;
    editImeOpreme: TEdit;
    Layout1: TLayout;
    K: TText;
    editKolicina: TEdit;
    procedure logoutButtonClick(Sender: TObject);
    procedure buttonDodajClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formDodavanjeOprema: TformDodavanjeOprema;

implementation

uses dodavanje, dm; // Add dm to the uses clause for database access

{$R *.fmx}

procedure TformDodavanjeOprema.logoutButtonClick(Sender: TObject);
begin
  formDodavanjeOprema.Hide;
  formDodavanje.Show;
end;

procedure TformDodavanjeOprema.buttonDodajClick(Sender: TObject);
begin
  if Trim(editImeOpreme.Text) = '' then
  begin
    ShowMessage('Molimo unesite ime opreme!');
    editImeOpreme.SetFocus;
    Exit;
  end;

  if Trim(editKolicina.Text) = '' then
  begin
    ShowMessage('Molimo unesite količinu!');
    editKolicina.SetFocus;
    Exit;
  end;
    with db do
    begin
     qtemp.SQL.Clear;
      qtemp.SQL.Text := 'INSERT INTO oprema (imeOpreme, kolicina) VALUES (:imeOpreme, :kolicina)';
      qtemp.ParamByName('imeOpreme').AsString := editImeOpreme.Text;
      qtemp.ParamByName('kolicina').AsString := editKolicina.Text;
      qtemp.ExecSQL;
    end;

    ShowMessage('Oprema je uspešno dodata!');
  end;


end.

