unit adminMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts;

type
  TformAdminMain = class(TForm)
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
    procedure Button1Click(Sender: TObject);
    procedure registerButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formAdminMain: TformAdminMain;

implementation

uses zaposleni, adminObavestenja, dodavanje, evidencija;

{$R *.fmx}

procedure TformAdminMain.Button1Click(Sender: TObject);
begin
    formADminMain.hide;
    formDodavanje.show;
end;

procedure TformAdminMain.loginButtonClick(Sender: TObject);
begin
    formAdminMain.hide;
    formAdminObavestenja.show;
end;

procedure TformAdminMain.logoutButtonClick(Sender: TObject);
begin
    formAdminMain.hide;
    formZaposleni.show;
end;

procedure TformAdminMain.registerButtonClick(Sender: TObject);
begin
    formAdminMain.hide;
    formEvidencija.Show;
end;

end.
