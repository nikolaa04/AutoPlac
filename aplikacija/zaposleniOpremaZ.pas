unit zaposleniOpremaZ;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.ListBox, FMX.Objects, dm;

type
  TformZaposleniOpremaZ = class(TForm)
    slika: TLayout;
    Image1: TImage;
    top: TLayout;
    Line1: TLine;
    Oprema: TText;
    client: TLayout;
    ListBoxTermini: TListBox;
    bot: TLayout;
    buttonNazad: TButton;
    buttonPrikazi: TButton;
    procedure buttonPrikaziClick(Sender: TObject);
    procedure ListBoxTerminiItemClick(const Sender: TCustomListBox; const Item: TListBoxItem);
  private
    { Private declarations }
    procedure LoadTermini;
  public
    { Public declarations }
  end;

var
  formZaposleniOpremaZ: TformZaposleniOpremaZ;

implementation

{$R *.fmx}

procedure TformZaposleniOpremaZ.buttonPrikaziClick(Sender: TObject);
begin
  LoadTermini;
end;

procedure TformZaposleniOpremaZ.LoadTermini;
var
  ListItem: TListBoxItem;
begin
  ListBoxTermini.Clear;

  with dm.db do
  begin
    try
      qtemp.SQL.Clear;
      qtemp.SQL.Text := 'SELECT usluga, vreme, datum, kolicina FROM opremaNarucena ORDER BY datum, vreme';
      qtemp.Open;

      if qtemp.IsEmpty then
      begin
        ShowMessage('Nema zakazane opreme za prikaz.');
      end
      else
      begin
        while not qtemp.Eof do
        begin
          ListItem := TListBoxItem.Create(ListBoxTermini);
          ListItem.Text := Format('Usluga: %s, Vreme: %s, Datum: %s, Kolicina: %d',
            [qtemp.FieldByName('usluga').AsString,
             TimeToStr(qtemp.FieldByName('vreme').AsDateTime),
             DateToStr(qtemp.FieldByName('datum').AsDateTime),
             qtemp.FieldByName('kolicina').AsInteger]);
          ListItem.TagString := Format('Usluga: %s' + sLineBreak + 'Vreme: %s' + sLineBreak + 'Datum: %s' + sLineBreak + 'Kolicina: %d',
            [qtemp.FieldByName('usluga').AsString,
             TimeToStr(qtemp.FieldByName('vreme').AsDateTime),
             DateToStr(qtemp.FieldByName('datum').AsDateTime),
             qtemp.FieldByName('kolicina').AsInteger]);
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

procedure TformZaposleniOpremaZ.ListBoxTerminiItemClick(const Sender: TCustomListBox; const Item: TListBoxItem);
begin
  ShowMessage(Item.TagString);
end;

end.

