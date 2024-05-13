unit automobili2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts;

type
  TformAutomobili2 = class(TForm)
    slika: TLayout;
    Image1: TImage;
    top: TLayout;
    Line1: TLine;
    Text1: TText;
    client: TLayout;
    bot: TLayout;
    nazadButton: TButton;
    Text2: TText;
    Image2: TImage;
    Button1: TButton;
    Button2: TButton;
    Text3: TText;
    Text4: TText;
    Text5: TText;
    Text6: TText;
    Text7: TText;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure nazadButtonClick(Sender: TObject);
  private
    FAutomobiliInfo : string;
    FMarka: string;
    FModel: string;
  public
    property AutomobiliInfo: string read FAutomobiliInfo write FAutomobiliInfo;
    property Marka: string read FMarka;
    property Model: string read FModel;
  end;

var
  formAutomobili2: TformAutomobili2;

implementation

uses dm,automobili1,placanje;
{$R *.fmx}

procedure TformAutomobili2.Button1Click(Sender: TObject);
begin
    formAutomobili2.hide;
    formautomobili1.Show;
end;

procedure TformAutomobili2.Button2Click(Sender: TObject);
var
  parts: TArray<string>;
  godiste, karoserija, gorivo, polovno, cena: string;
begin
  // Razdvajanje stringa na model i marku koristeći razmak kao separator
  parts := AutomobiliInfo.Split([' ']);

  // Provera da li smo dobili bar dva dela
  if Length(parts) >= 2 then
  begin
    // Prvi deo će biti marka
    FMarka := parts[0];
    // Ostali delovi će biti model
    FModel := String.Join(' ', Copy(parts, 1, Length(parts) - 1));
  end
  else
  begin
    // Ako nismo dobili bar dva dela, postavljamo ceo string kao marku
    FMarka := AutomobiliInfo;
    FModel := '';
  end;

  // SQL upit za dohvatanje detalja automobila iz baze
  with dm.db do
  begin
    qtemp.SQL.Text := 'SELECT godiste, karoserija, gorivo, polovno, cena ' +
                      'FROM automobili ' +
                      'WHERE marka = :marka AND model = :model';
    qtemp.ParamByName('marka').AsString := FMarka;
    qtemp.ParamByName('model').AsString := FModel;
    qtemp.Open;

    // Provera da li smo pronašli automobil u bazi
    if not qtemp.IsEmpty then
    begin
      godiste := qtemp.FieldByName('godiste').AsString;
      karoserija := qtemp.FieldByName('karoserija').AsString;
      gorivo := qtemp.FieldByName('gorivo').AsString;
      polovno := qtemp.FieldByName('polovno').AsString;
      cena := qtemp.FieldByName('cena').AsString;

      // Postavljanje teksta komponentama Text3, Text4, itd.
      Text1.Text := fmodel + ' ' + Fmarka;
      Text3.Text := 'Godište: ' + godiste;
      Text4.Text := 'Karoserija: ' + karoserija;
      Text5.Text := 'Gorivo: ' + gorivo;
      Text6.Text := 'Polovno: ' + polovno;
      Text7.Text := 'Cena: ' + cena + ' $' ;
    end
    else
    begin
      // Ako automobil nije pronađen u bazi, ispisuje se odgovarajuća poruka
      ShowMessage('Automobil nije pronađen.');
    end;

    // Zatvaranje upita
    qtemp.Close;
  end;
end;


procedure TformAutomobili2.nazadButtonClick(Sender: TObject);
begin
    formAutomobili2.Hide;
    formPlacanje.show;
end;

end.
