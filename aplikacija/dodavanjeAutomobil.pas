unit dodavanjeAutomobil;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts, FMX.Edit,
  FMX.ListBox;

type
  TformDodavanjeAutomobil = class(TForm)
    slika: TLayout;
    Image1: TImage;
    top: TLayout;
    bot: TLayout;
    logoutButton: TButton;
    client: TLayout;
    username: TLayout;
    Text2: TText;
    editMarka: TEdit;
    Layout1: TLayout;
    Text1: TText;
    editModel: TEdit;
    Layout2: TLayout;
    Text3: TText;
    editGodiste: TEdit;
    Layout3: TLayout;
    Text4: TText;
    editKaroserija: TEdit;
    Layout4: TLayout;
    Text5: TText;
    Layout5: TLayout;
    Text6: TText;
    editCena: TEdit;
    Layout6: TLayout;
    Text7: TText;
    editGorivo: TEdit;
    ComboBox1: TComboBox;
    ListBoxItemNov: TListBoxItem;
    ListBoxItemPolovan: TListBoxItem;
    buttonDodaj: TButton;
    procedure logoutButtonClick(Sender: TObject);
    procedure buttonDodajClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formDodavanjeAutomobil: TformDodavanjeAutomobil;

implementation

uses dodavanje, dm; // Add dm for the database connection

{$R *.fmx}

procedure TformDodavanjeAutomobil.logoutButtonClick(Sender: TObject);
begin
  formDodavanjeAutomobil.Hide;
  formDodavanje.Show;
end;

procedure TformDodavanjeAutomobil.buttonDodajClick(Sender: TObject);
var
  godiste, cena: Integer;
  polovno: string;
begin
  if Trim(editMarka.Text) = '' then
  begin
    ShowMessage('Molimo unesite marku!');
    editMarka.SetFocus;
    Exit;
  end;

  if Trim(editModel.Text) = '' then
  begin
    ShowMessage('Molimo unesite model!');
    editModel.SetFocus;
    Exit;
  end;

  if not TryStrToInt(Trim(editGodiste.Text), godiste) then
  begin
    ShowMessage('Molimo unesite validno godište!');
    editGodiste.SetFocus;
    Exit;
  end;

  if Trim(editKaroserija.Text) = '' then
  begin
    ShowMessage('Molimo unesite karoseriju!');
    editKaroserija.SetFocus;
    Exit;
  end;

  if Trim(editGorivo.Text) = '' then
  begin
    ShowMessage('Molimo unesite gorivo!');
    editGorivo.SetFocus;
    Exit;
  end;

  if not TryStrToInt(Trim(editCena.Text), cena) then
  begin
    ShowMessage('Molimo unesite validnu cenu!');
    editCena.SetFocus;
    Exit;
  end;

  if ComboBox1.ItemIndex = -1 then
  begin
    ShowMessage('Molimo odaberite polovno!');
    ComboBox1.SetFocus;
    Exit;
  end
  else
  begin
    polovno := ComboBox1.Selected.Text;
  end;

    with db do
    begin
      qtemp.SQL.Clear;
      qtemp.SQL.Text := 'INSERT INTO automobili (marka, model, godiste, karoserija, gorivo, cena, polovno) ' +
                  'VALUES (:marka, :model, :godiste, :karoserija, :gorivo, :cena, :polovno)';
      qtemp.ParamByName('marka').AsString := editMarka.Text;
      qtemp.ParamByName('model').AsString := editModel.Text;
      qtemp.ParamByName('godiste').AsInteger := godiste;
      qtemp.ParamByName('karoserija').AsString := editKaroserija.Text;
      qtemp.ParamByName('gorivo').AsString := editGorivo.Text;
      qtemp.ParamByName('cena').AsInteger := cena;
      qtemp.ParamByName('polovno').AsString := polovno;
      qtemp.ExecSQL;
    end;

    ShowMessage('Automobil je uspešno dodat!');

end;


end.

