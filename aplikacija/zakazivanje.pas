unit zakazivanje;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.DateTimeCtrls,
  FMX.Edit, Data.DB, FireDAC.Comp.Client;

type
  TformZakazivanje = class(TForm)
    slika: TLayout;
    Image1: TImage;
    top: TLayout;
    Line1: TLine;
    Text1: TText;
    client: TLayout;
    username: TLayout;
    Text2: TText;
    editVozilo: TEdit;
    cbKartica: TCheckBox;
    cbGotovina: TCheckBox;
    Layout1: TLayout;
    Text3: TText;
    editKvar: TEdit;
    bot: TLayout;
    buttonNazad: TButton;
    buttonZakazi: TButton;
    DateEdit1: TDateEdit;
    TimeEdit1: TTimeEdit;
    Layout2: TLayout;
    Text4: TText;
    editKartica: TEdit;
    procedure buttonZakaziClick(Sender: TObject);
    procedure buttonNazadClick(Sender: TObject);
  private
    { Private declarations }
    Fime, Fprezime : string;
    function IsTerminZauzet(Datum: TDate; Vreme: TTime): Boolean;
  public
    { Public declarations }
    property ime: string read Fime write Fime;
    property prezime: string read Fprezime write Fprezime;
  end;

var
  formZakazivanje: TformZakazivanje;

implementation

uses dm, prvastrana;

{$R *.fmx}

procedure TformZakazivanje.buttonNazadClick(Sender: TObject);
begin
    formZakazivanje.hide;
    prvaForm.show;
end;

procedure TformZakazivanje.buttonZakaziClick(Sender: TObject);
var
  Vozilo, Kvar, Placanje, Kartica: string;
  Datum: TDate;
  Vreme: TTime;
begin
  // Provera da li su podaci uneti
  if Trim(editVozilo.Text) = '' then
  begin
    ShowMessage('Molimo vas unesite informacije o vozilu!');
    editVozilo.SetFocus;
    Exit;
  end;

  if Trim(editKvar.Text) = '' then
  begin
    ShowMessage('Molimo vas unesite opis kvara!');
    editKvar.SetFocus;
    Exit;
  end;

  if not (cbKartica.IsChecked or cbGotovina.IsChecked) then
  begin
    ShowMessage('Molimo vas izaberite način plaćanja!');
    Exit;
  end;

  if cbKartica.IsChecked then
  begin
    Placanje := 'Kartica';
    Kartica := editKartica.Text;
    if Trim(Kartica) = '' then
    begin
      ShowMessage('Molimo vas unesite broj kartice!');
      editKartica.SetFocus;
      Exit;
    end;
  end
  else
  begin
    Placanje := 'Gotovina';
    Kartica := '/';
  end;

  Vozilo := editVozilo.Text;
  Kvar := editKvar.Text;
  Datum := DateEdit1.Date;
  Vreme := TimeEdit1.Time;

  // Provera da li je termin zauzet
  if IsTerminZauzet(Datum, Vreme) then
  begin
    ShowMessage('Izabrani termin je zauzet. Molimo vas izaberite drugi termin.');
    Exit;
  end;

  // Upisivanje podataka u bazu
  with dm.db do
  begin
    qtemp.SQL.Clear;
    qtemp.SQL.Text := 'INSERT INTO zakazivanje (ime, prezime, vozilo, kvar, datum, vreme, placanje, brojKartice) ' +
                      'VALUES (:ime, :prezime, :vozilo, :kvar, :datum, :vreme, :placanje, :brojKartice)';
    qtemp.Params.ParamByName('ime').AsString := Fime;
    qtemp.Params.ParamByName('prezime').AsString := Fprezime;
    qtemp.Params.ParamByName('vozilo').AsString := Vozilo;
    qtemp.Params.ParamByName('kvar').AsString := Kvar;
    qtemp.Params.ParamByName('datum').AsDate := Datum;
    qtemp.Params.ParamByName('vreme').AsTime := Vreme;
    qtemp.Params.ParamByName('placanje').AsString := Placanje;
    qtemp.Params.ParamByName('brojKartice').AsString := Kartica;
    qtemp.ExecSQL;

    ShowMessage('Uspešno ste zakazali servis!');
  end;
end;

function TformZakazivanje.IsTerminZauzet(Datum: TDate; Vreme: TTime): Boolean;
begin
  with dm.db do
  begin
    qtemp.SQL.Clear;
    qtemp.SQL.Text := 'SELECT COUNT(*) FROM zakazivanje WHERE datum = :datum AND vreme = :vreme';
    qtemp.Params.ParamByName('datum').AsDate := Datum;
    qtemp.Params.ParamByName('vreme').AsTime := Vreme;
    qtemp.Open;
    Result := qtemp.Fields[0].AsInteger > 0;
    qtemp.Close;
  end;
end;

end.

