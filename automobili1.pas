unit automobili1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts, FMX.ListBox,dm,
  FMX.Memo.Types, FMX.ScrollBox, FMX.Memo;

type
  TformAutomobili1 = class(TForm)
    slika: TLayout;
    Image1: TImage;
    top: TLayout;
    client: TLayout;
    Line1: TLine;
    Text1: TText;
    Text2: TText;
    cbIzaberiMarku: TComboBox;
    bot: TLayout;
    nazadButton: TButton;
    confirmButton: TButton;
    ListBox1: TListBox;
    procedure nazadButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure confirmButtonClick(Sender: TObject); procedure ListBoxClick(Sender: TObject);
  private
   { Private declarations }
  public
    InfoAutomobila : string
  end;

var
  formAutomobili1: TformAutomobili1;

implementation

uses prvastrana, automobili2, placanje;
{$R *.fmx}
procedure TformAutomobili1.ListBoxClick(Sender: TObject);
var
  automobilInfo: string;
begin
  // Provera da li je neka stavka u ListBox-u izabrana
  if ListBox1.ItemIndex <> -1 then
  begin
    // Dobijanje detalja o automobilu koji je izabran
    automobilInfo := ListBox1.Items[ListBox1.ItemIndex];

    InfoAutomobila := automobilInfo;

    //automobili2
    formAutomobili2.AutomobiliInfo := InfoAutomobila;
    //placanje
    formPlacanje.AutomobiliInfo := InfoAutomobila;


    formautomobili1.Hide;
    formautomobili2.show;

    end;
end;


procedure TformAutomobili1.confirmButtonClick(Sender: TObject);
var
  izabranaMarka: string;
begin
  // Provera da li je neka marka izabrana
  if cbIzaberiMarku.ItemIndex <> -1 then
  begin
    // Čuvanje izabrane marke u promenljivu
    izabranaMarka := cbIzaberiMarku.Items[cbIzaberiMarku.ItemIndex];

    // Izvršavanje SQL upita za dohvatanje automobila sa izabranom markom
    with dm.db do
    begin
      qtemp.SQL.Text := 'SELECT * FROM automobili WHERE marka = :izabranaMarka';
      qtemp.ParamByName('izabranaMarka').AsString := izabranaMarka;
      qtemp.Open;

      // Prikaz automobila koji su pronađeni
      if not qtemp.IsEmpty then
      begin
        ListBox1.Clear;
        while not qtemp.Eof do
        begin
          ListBox1.Items.Add(
            qtemp.FieldByName('marka').AsString + ' ' +qtemp.FieldByName('model').AsString
          );
          qtemp.Next;
        end;
        // Omogućavanje korisniku da klikne na stavku u ListBox-u
        ListBox1.OnClick := ListBoxClick;
      end
      else
      begin
        ListBox1.Clear;
        ListBox1.Items.Add('Nema automobila sa izabranom markom.');
      end;

      // Zatvaranje upita
      qtemp.Close;
    end;
  end
  else
  begin
    // Ako nijedna marka nije izabrana, prikaži poruku korisniku
    ShowMessage('Molimo vas izaberite marku automobila.');
  end;
end;

procedure TformAutomobili1.FormCreate(Sender: TObject);
var
  marka: string;
begin
  with dm.db do
  begin
    // SQL upit za dohvat svih marki iz tabele "automobili" bez ponavljanja
    qtemp.SQL.Text := 'SELECT DISTINCT marka FROM automobili';

    // Izvršavanje upita
    qtemp.Open;

    // Popunjavanje ComboBox-a sa rezultatima upita
    while not qtemp.Eof do
    begin
      marka := qtemp.FieldByName('marka').AsString;
      if cbIzaberiMarku.Items.IndexOf(marka) = -1 then
        cbIzaberiMarku.Items.Add(marka);
      qtemp.Next;
    end;

    // Zatvaranje upita
    qtemp.Close;
  end;
end;


procedure TformAutomobili1.nazadButtonClick(Sender: TObject);
begin
    formAutomobili1.hide;
    prvaForm.show;
end;

end.
