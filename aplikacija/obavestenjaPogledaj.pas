unit obavestenjaPogledaj;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts, FMX.ListBox, dm;

type
  TformPogledaj = class(TForm)
    slika: TLayout;
    Image1: TImage;
    top: TLayout;
    Line1: TLine;
    Text1: TText;
    client: TLayout;
    bot: TLayout;
    Button1: TButton;
    ListBoxObavestenja: TListBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    procedure LoadObavestenja;
  public
    { Public declarations }
  end;

var
  formPogledaj: TformPogledaj;

implementation

uses obavestenja;

{$R *.fmx}

procedure TformPogledaj.Button1Click(Sender: TObject);
begin
  formPogledaj.Hide;
  formObavestenja.Show;
end;


procedure TformPogledaj.Button2Click(Sender: TObject);
begin
  LoadObavestenja;
end;

procedure TformPogledaj.LoadObavestenja;
var
  ListItem: TListBoxItem;
begin
  ShowMessage('Loading obavestenja...'); // Dijagnostička poruka
  ListBoxObavestenja.Clear;

  with dm.db do
  begin
    try
      qtemp.SQL.Clear;
      qtemp.SQL.Text := 'SELECT kome, poruka FROM obavestenja ORDER BY obavestenjeID DESC';
      qtemp.Open;

      if qtemp.IsEmpty then
      begin
        ShowMessage('Nema obaveštenja za prikaz.');
      end
      else
      begin
        while not qtemp.Eof do
        begin
          ListItem := TListBoxItem.Create(ListBoxObavestenja);
          ListItem.Text := Format('%s: %s', [qtemp.FieldByName('kome').AsString, qtemp.FieldByName('poruka').AsString]);
          ListBoxObavestenja.AddObject(ListItem);
          qtemp.Next;
        end;
        ShowMessage('Obavestenja successfully loaded.');
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

