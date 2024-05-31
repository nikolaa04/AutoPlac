unit zaposleniMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts;

type
  TformZaposleniMain = class(TForm)
    slika: TLayout;
    Image1: TImage;
    top: TLayout;
    bot: TLayout;
    logoutButton: TButton;
    client: TLayout;
    Text1: TText;
    loginButton: TButton;
    registerButton: TButton;
    Image2: TImage;
    Button1: TButton;
    procedure logoutButtonClick(Sender: TObject);
    procedure loginButtonClick(Sender: TObject);
    procedure registerButtonClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formZaposleniMain: TformZaposleniMain;

implementation

uses zaposleni, obavestenja,zaposleniRezervacije,zaposleniInventar;

{$R *.fmx}

procedure TformZaposleniMain.Button1Click(Sender: TObject);
begin
    formZaposleniMain.hide;
    formZaposleniInventar.show;
end;

procedure TformZaposleniMain.loginButtonClick(Sender: TObject);
begin
    formZaposleniMain.hide;
    formObavestenja.show;
end;

procedure TformZaposleniMain.logoutButtonClick(Sender: TObject);
begin
    formZaposleniMain.hide;
    formZaposleni.show;
end;

procedure TformZaposleniMain.registerButtonClick(Sender: TObject);
begin
    formZaposleniMain.Hide;
    formZaposleniRezervacije.show;
end;

end.
