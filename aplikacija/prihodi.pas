unit prihodi;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.ListBox;

type
  TformPrihodi = class(TForm)
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
    Rectangle1: TRectangle;
    UkupnoPrihoda: TText;
    procedure buttonNazadClick(Sender: TObject);
    procedure buttonPrikaziClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formPrihodi: TformPrihodi;

implementation

uses dm, finansije;

{$R *.fmx}

procedure TformPrihodi.buttonNazadClick(Sender: TObject);
begin
  formPrihodi.Hide;
  formFinansije.Show;
end;

procedure TformPrihodi.buttonPrikaziClick(Sender: TObject);
var
  ListItem: TListBoxItem;
  TotalRevenue: Integer;
begin
  TotalRevenue := 0;
  ListBoxTermini.Clear;

    with db do
    begin
      qtemp.SQL.Clear;
      qtemp.SQL.Text := 'SELECT ime, prezime, username, usluga, cena FROM prihodi';
      qtemp.Open;

        ListItem := TListBoxItem.Create(ListBoxTermini);
        ListItem.Text := Format('Ime: %s, Prezime: %s, Username: %s, Usluga: %s, Cena: %d',
          [qtemp.FieldByName('ime').AsString,
           qtemp.FieldByName('prezime').AsString,
           qtemp.FieldByName('username').AsString,
           qtemp.FieldByName('usluga').AsString,
           qtemp.FieldByName('cena').AsInteger]);
        ListBoxTermini.AddObject(ListItem);

        TotalRevenue := TotalRevenue + qtemp.FieldByName('cena').AsInteger;
        qtemp.Next;

    UkupnoPrihoda.Text := 'Ukupno prihoda: ' + IntToStr(TotalRevenue);
      end;
    end;


end.

