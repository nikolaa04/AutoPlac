unit zaposleniServisi;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts, FMX.ListBox, dm;

type
  TformZaposleniServisi = class(TForm)
    slika: TLayout;
    Image1: TImage;
    top: TLayout;
    Line1: TLine;
    Text1: TText;
    client: TLayout;
    bot: TLayout;
    buttonNazad: TButton;
    buttonPrikazi: TButton;
    ListBoxTermini: TListBox;
    procedure buttonNazadClick(Sender: TObject);
    procedure buttonPrikaziClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formZaposleniServisi: TformZaposleniServisi;

implementation

uses zaposleniMain,zaposleniRezervacije;

{$R *.fmx}


procedure TformZaposleniServisi.buttonNazadClick(Sender: TObject);
begin
  formZaposleniservisi.Hide;
  formZaposleniRezervacije.show;
end;

procedure TformZaposleniServisi.buttonPrikaziClick(Sender: TObject);
var
  ListItem: TListBoxItem;
begin
  ListBoxTermini.Clear;

  with dm.db do
  begin
    try
      qtemp.SQL.Clear;
      qtemp.SQL.Text := 'SELECT ime, prezime, vozilo, kvar, vreme, datum FROM zakazivanje ORDER BY datum, vreme';
      qtemp.Open;

      if qtemp.IsEmpty then
      begin
        ShowMessage('Nema zakazanih termina za prikaz.');
      end
      else
      begin
        while not qtemp.Eof do
        begin
          ListItem := TListBoxItem.Create(ListBoxTermini);
          ListItem.Text := Format('Ime: %s, Prezime: %s, Vozilo: %s, Kvar: %s, Vreme: %s, Datum: %s',
            [qtemp.FieldByName('ime').AsString,
             qtemp.FieldByName('prezime').AsString,
             qtemp.FieldByName('vozilo').AsString,
             qtemp.FieldByName('kvar').AsString,
             qtemp.FieldByName('vreme').AsString,
             qtemp.FieldByName('datum').AsString]);
          ListBoxTermini.AddObject(ListItem);
          qtemp.Next;
        end;
      end;

      qtemp.Close;
    except
      on E: Exception do
      begin
        ShowMessage('Error: ' + E.Message);
      end;
    end;
  end;
end;


end.

