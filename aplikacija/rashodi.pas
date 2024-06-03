unit rashodi;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts, FMX.ListBox;

type
  TformRashodi = class(TForm)
    slika: TLayout;
    Image1: TImage;
    top: TLayout;
    Line1: TLine;
    Text1: TText;
    client: TLayout;
    ListBoxTermini: TListBox;
    Rectangle1: TRectangle;
    UkupnoPrihoda: TText;
    bot: TLayout;
    buttonNazad: TButton;
    buttonPrikazi: TButton;
    procedure buttonNazadClick(Sender: TObject);
    procedure buttonPrikaziClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRashodi: TformRashodi;

implementation

uses finansije, dm;

{$R *.fmx}

procedure TformRashodi.buttonNazadClick(Sender: TObject);
begin
    formRashodi.hide;
    formFinansije.show;
end;

procedure TformRashodi.buttonPrikaziClick(Sender: TObject);
var
  ListItem: TListBoxItem;
  TotalRevenue: Integer;
begin
  TotalRevenue := 0;
  ListBoxTermini.Clear;

    with db do
    begin
      qtemp.SQL.Clear;
      qtemp.SQL.Text := 'SELECT ime, prezime, username, usluga, cena FROM rashodi';
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

    UkupnoPrihoda.Text := 'Ukupno prihoda: -' + IntToStr(TotalRevenue);
      end;
    end;



end.
