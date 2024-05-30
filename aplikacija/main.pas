unit main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, login, register;

type
  TmainForm = class(TForm)
    Image1: TImage;
    slika: TLayout;
    top: TLayout;
    bot: TLayout;
    client: TLayout;
    Text1: TText;
    loginButton: TButton;
    registerButton: TButton;
    Image2: TImage;
    Button1: TButton;
    procedure loginButtonClick(Sender: TObject);
    procedure registerButtonClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  mainForm: TmainForm;

implementation

uses zaposleni;

{$R *.fmx}

procedure TmainForm.Button1Click(Sender: TObject);
begin
    mainForm.Hide;
    formZaposleni.show;
end;

procedure TmainForm.loginButtonClick(Sender: TObject);
begin
  mainForm.hide;
  loginForm.show;
end;

procedure TmainForm.registerButtonClick(Sender: TObject);
begin
    mainForm.Hide;
    registerForm.show;
end;

end.
