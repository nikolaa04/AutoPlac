unit ZaposleniOpremaI;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.ListBox, FMX.Objects;

type
  TformZaposleniOprema1 = class(TForm)
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
  formZaposleniOprema1: TformZaposleniOprema1;

implementation

uses dm, zaposleniInventar;

{$R *.fmx}

procedure TformZaposleniOprema1.buttonNazadClick(Sender: TObject);
begin
    formZaposleniOprema1.Hide;
    formZaposleniInventar.Show;
end;

procedure TformZaposleniOprema1.buttonPrikaziClick(Sender: TObject);
var
  ListItem: TListBoxItem;
begin
  ListBoxTermini.Clear;

  with dm.db do
  begin
    try
      qtemp.SQL.Clear;
      qtemp.SQL.Text := 'SELECT imeOpreme, kolicina FROM oprema';
      qtemp.Open;

      if qtemp.IsEmpty then
      begin
        ShowMessage('Nema opreme za prikaz.');
      end
      else
      begin
        while not qtemp.Eof do
        begin
          ListItem := TListBoxItem.Create(ListBoxTermini);
          ListItem.Text := Format('imeOpreme: %s, kolicina: %s',
            [qtemp.FieldByName('imeOpreme').AsString,
             qtemp.FieldByName('kolicina').AsString]);
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
