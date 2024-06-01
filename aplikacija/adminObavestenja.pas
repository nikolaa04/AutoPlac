unit adminObavestenja;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts;

type
  TformAdminObavestenja = class(TForm)
    slika: TLayout;
    Image1: TImage;
    top: TLayout;
    Line1: TLine;
    Text1: TText;
    client: TLayout;
    Posalji: TButton;
    Button2: TButton;
    bot: TLayout;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure PosaljiClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formAdminObavestenja: TformAdminObavestenja;

implementation

uses adminMain, adminObavestenjaPosalji, adminObavestenjaPogledaj;
{$R *.fmx}

procedure TformAdminObavestenja.Button1Click(Sender: TObject);
begin
    formAdminObavestenja.hide;
    formAdminMain.show;
end;

procedure TformAdminObavestenja.Button2Click(Sender: TObject);
begin
    formAdminObavestenja.Hide;
    formAdminObavestenjaPogledaj.show;
end;

procedure TformAdminObavestenja.PosaljiClick(Sender: TObject);
begin
    formAdminObavestenja.hide;
    formADminobavestenjaPosalji.show;
end;

end.
