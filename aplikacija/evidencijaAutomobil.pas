unit evidencijaAutomobil;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.ListBox, FMX.Objects;

type
  TformEvidencijaAutomobil = class(TForm)
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
    procedure buttonNazadClick(Sender: TObject);
    procedure buttonPrikaziClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formEvidencijaAutomobil: TformEvidencijaAutomobil;

implementation

uses evidencija,dm;

{$R *.fmx}

procedure TformEvidencijaAutomobil.buttonNazadClick(Sender: TObject);
begin
    formEvidencijaAutomobil.hide;
    formEvidencija.show;
end;

procedure TformEvidencijaAutomobil.buttonPrikaziClick(Sender: TObject);
var
  ListItem: TListBoxItem;
begin
  ListBoxTermini.Clear;

  with dm.db do
  begin
    try
      qtemp.SQL.Clear;
      qtemp.SQL.Text := 'SELECT automobilID, marka, model, godiste FROM automobili';
      qtemp.Open;

      if qtemp.IsEmpty then
      begin
        ShowMessage('Nema automobila za prikaz.');
      end
      else
      begin
        while not qtemp.Eof do
        begin
          ListItem := TListBoxItem.Create(ListBoxTermini);
          ListItem.Text := Format('marka: %s, model: %s, godiste: %s',
            [qtemp.FieldByName('marka').AsString,
             qtemp.FieldByName('model').AsString,
             qtemp.FieldByName('godiste').AsString]);
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
