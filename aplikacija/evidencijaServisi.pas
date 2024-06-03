unit evidencijaServisi;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.ListBox, FMX.Objects;

type
  TformEvidencijaServisi = class(TForm)
    slika: TLayout;
    Image1: TImage;
    top: TLayout;
    Line1: TLine;
    Text1: TText;
    client: TLayout;
    ListBoxTermini: TListBox;
    bot: TLayout;
    buttonNazad: TButton;
    buttonPrikazi: TButton;
    procedure buttonPrikaziClick(Sender: TObject);
    procedure buttonNazadClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formEvidencijaServisi: TformEvidencijaServisi;

implementation

uses dm, evidencija;

{$R *.fmx}

procedure TformEvidencijaServisi.buttonNazadClick(Sender: TObject);
begin
    formEvidencijaservisi.hide;
    formEvidencija.show;
end;

procedure TformEvidencijaServisi.buttonPrikaziClick(Sender: TObject);
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
