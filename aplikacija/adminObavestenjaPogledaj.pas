unit adminObavestenjaPogledaj;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.ListBox, FMX.Objects;

type
  TformAdminObavestenjaPogledaj = class(TForm)
    slika: TLayout;
    Image1: TImage;
    top: TLayout;
    Line1: TLine;
    Text1: TText;
    client: TLayout;
    ListBoxObavestenja: TListBox;
    bot: TLayout;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    procedure LoadObavestenja;
  public
    { Public declarations }
  end;

var
  formAdminObavestenjaPogledaj: TformAdminObavestenjaPogledaj;

implementation

uses adminObavestenja, dm;

{$R *.fmx}

procedure TformAdminObavestenjaPogledaj.Button1Click(Sender: TObject);
begin
    formAdminObavestenjaPogledaj.hide;
    formadminObavestenja.show;
end;

procedure TformAdminObavestenjaPogledaj.Button2Click(Sender: TObject);
begin
  LoadObavestenja;
end;

procedure TformAdminObavestenjaPogledaj.LoadObavestenja;
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
