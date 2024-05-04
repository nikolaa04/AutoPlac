unit automobili1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts, FMX.ListBox,dm;

type
  Tautomobili1Form = class(TForm)
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
    procedure nazadButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure confirmButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  automobili1Form: Tautomobili1Form;

implementation

uses prvastrana;
{$R *.fmx}

procedure Tautomobili1Form.confirmButtonClick(Sender: TObject);
var
  izabranaMarka: string;
begin
  // Provera da li je neka marka izabrana
  if cbIzaberiMarku.ItemIndex <> -1 then
  begin
    // Čuvanje izabrane marke u promenljivu
    izabranaMarka := cbIzaberiMarku.Items[cbIzaberiMarku.ItemIndex];

    // Sada možete koristiti izabranaMarka promenljivu kako god želite
    ShowMessage('Izabrali ste marku: ' + izabranaMarka);
  end
  else
  begin
    // Ako nijedna marka nije izabrana, prikaži poruku korisniku
    ShowMessage('Molimo vas izaberite marku automobila.');
  end;
end;


procedure Tautomobili1Form.FormCreate(Sender: TObject);
begin
  with db do
  begin
  // SQL upit za dohvat svih soba iz tabele "sobe"
  qtemp.SQL.Text := 'SELECT marka FROM automobili';

  // Izvršavanje upita
  qtemp.Open;

  // Popunjavanje ComboBox-a sa rezultatima upita
  while not qtemp.Eof do
  begin
    cbIzaberiMarku.Items.Add(qtemp.FieldByName('marka').AsString);
    qtemp.Next;
  end;

  // Zatvaranje upita
  qtemp.Close;
  end;
end;

procedure Tautomobili1Form.nazadButtonClick(Sender: TObject);
begin
    automobili1Form.hide;
    prvaForm.show;
end;

end.
