unit trenutnoStanje;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts;

type
  TformTrenutnoStanje = class(TForm)
    slika: TLayout;
    Image1: TImage;
    top: TLayout;
    bot: TLayout;
    logoutButton: TButton;
    client: TLayout;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    trenutnoStanje: TText;
    rashodiText: TText;
    prihodiText: TText;
    Text1: TText;
    buttonPrikazi: TButton;
    procedure logoutButtonClick(Sender: TObject);
    procedure buttonPrikaziClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formTrenutnoStanje: TformTrenutnoStanje;

implementation

uses dm, finansije;

{$R *.fmx}

procedure TformTrenutnoStanje.logoutButtonClick(Sender: TObject);
begin
    formTrenutnoStanje.Hide;
    formFinansije.Show;
end;

procedure TformTrenutnoStanje.buttonPrikaziClick(Sender: TObject);
var
  TotalIncome, TotalExpenses, CurrentState: Integer;
begin
  TotalIncome := 0;
  TotalExpenses := 0;


    // Fetching total income from the prihodi table
    with db do
    begin
      qtemp.SQL.Clear;
      qtemp.SQL.Text := 'SELECT SUM(cena) as TotalIncome FROM prihodi';
      qtemp.Open;
      if not qtemp.FieldByName('TotalIncome').IsNull then
        TotalIncome := qtemp.FieldByName('TotalIncome').AsInteger;
    end;

    // Fetching total expenses from the rashodi table
    with db do
    begin
      qtemp.SQL.Clear;
      qtemp.SQL.Text := 'SELECT SUM(cena) as TotalExpenses FROM rashodi';
      qtemp.Open;
      if not qtemp.FieldByName('TotalExpenses').IsNull then
        TotalExpenses := qtemp.FieldByName('TotalExpenses').AsInteger;
    end;

    CurrentState := TotalIncome - TotalExpenses;

    prihodiText.Text := 'Prihodi: ' + IntToStr(TotalIncome);
    rashodiText.Text := 'Rashodi: ' + IntToStr(TotalExpenses);
    trenutnoStanje.Text := 'Trenutno Stanje: ' + IntToStr(CurrentState);
  end;

end.

