unit finansije;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts;

type
  TformFinansije = class(TForm)
    slika: TLayout;
    Image1: TImage;
    top: TLayout;
    bot: TLayout;
    logoutButton: TButton;
    client: TLayout;
    Text1: TText;
    registerButton: TButton;
    Image2: TImage;
    Button1: TButton;
    Button2: TButton;
    procedure logoutButtonClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure registerButtonClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formFinansije: TformFinansije;

implementation

uses evidencija,prihodi,rashodi, trenutnoStanje;
{$R *.fmx}

procedure TformFinansije.Button1Click(Sender: TObject);
begin
    formFinansije.hide;
    formTrenutnoStanje.show;
end;

procedure TformFinansije.Button2Click(Sender: TObject);
begin
    formFinansije.Hide;
    formPrihodi.show;
end;

procedure TformFinansije.logoutButtonClick(Sender: TObject);
begin
    formFinansije.hide;
    formEvidencija.show;
end;

procedure TformFinansije.registerButtonClick(Sender: TObject);
begin
    formFinansije.hide;
    formrashodi.show;
end;

end.
