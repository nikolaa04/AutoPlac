unit placanje;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts, FMX.Edit;

type
  TformPlacanje = class(TForm)
    slika: TLayout;
    Image1: TImage;
    top: TLayout;
    Line1: TLine;
    Text1: TText;
    client: TLayout;
    bot: TLayout;
    Button1: TButton;
    nazadButton: TButton;
    username: TLayout;
    Text2: TText;
    editBrojKartice: TEdit;
    cbKartica: TCheckBox;
    cbGotovina: TCheckBox;
    Layout1: TLayout;
    Text3: TText;
    editAdresa: TEdit;
    cbDostava: TCheckBox;
    procedure nazadButtonClick(Sender: TObject);
  private
    { Private declarations }
    FAutomobiliInfo, Fime, Fprezime : string;
  public
    { Public declarations }
    property AutomobiliInfo: string read FAutomobiliInfo write FAutomobiliInfo;
    property ime: string read Fime write Fime;
    property prezime: string read Fprezime write Fprezime;
  end;

var
  formPlacanje: TformPlacanje;

implementation

uses dm, obavestenje;

{$R *.fmx}

procedure TformPlacanje.nazadButtonClick(Sender: TObject);
var
  kartica, adresa, auto: string;
  gotovina_kartica, dostava: integer;
begin
  // Provera da li su podaci uneti
  if Trim(editAdresa.Text) = '' then
  begin
    ShowMessage('Molimo vas unesite adresu!');
    editAdresa.SetFocus;
    Exit;
  end;
  if cbKartica.IsChecked and (Trim(editBrojKartice.Text) = '') then
  begin
    ShowMessage('Molimo vas unesite broj kartice ili štiklirajte polje za gotovinsko plaćanje!');
    editBrojKartice.SetFocus;
    Exit;
  end;

  // Postavljanje vrednosti gotovina_kartica i dostava na osnovu CheckBox-eva
  if cbKartica.IsChecked then
    gotovina_kartica := 1
  else if cbGotovina.IsChecked then
    gotovina_kartica := 0;

  if cbDostava.IsChecked then
    dostava := 1
  else
    dostava := 0;

  // Dohvatanje unesenih podataka
  kartica := editBrojKartice.Text;
  adresa := editAdresa.Text;
  auto := AutomobiliInfo;
  // Promenljiva AutomobiliInfo sadrži Model+Marka koji je prosleđen iz prethodne forme

  with db do
  begin
    qtemp.SQL.Clear;
    qtemp.SQL.Text := 'INSERT INTO racuni (kartica, adresa, gotovina_kartica, dostava, auto, ime, prezime) ' +
                      'VALUES (:kartica, :adresa, :gotovina_kartica, :dostava, :auto, :ime, :prezime)';
    qtemp.Params.ParamByName('kartica').AsString := kartica;
    qtemp.Params.ParamByName('adresa').AsString := adresa;
    qtemp.Params.ParamByName('gotovina_kartica').AsInteger := gotovina_kartica;
    qtemp.Params.ParamByName('dostava').AsInteger := dostava;
    qtemp.Params.ParamByName('auto').AsString := auto;
    qtemp.Params.ParamByName('ime').AsString := ime;
    qtemp.Params.ParamByName('prezime').AsString := prezime;
    qtemp.ExecSQL;

    if cbDostava.IsChecked then
    begin
      ShowMessage('Poštovani ' + ime + ' ' + prezime +' automobil mozete preuzeti na ' + adresa)
    end
    else
    begin
      ShowMessage('Poštovani ' + ime + ' ' + prezime +' automobil mozete preuzeti na nasoj adresi')
    end;


    qtemp.Free;
  end;
end;

end.
