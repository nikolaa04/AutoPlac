unit evidencija;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts;

type
  TformEvidencija = class(TForm)
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
    Button3: TButton;
    procedure Button2Click(Sender: TObject);
    procedure registerButtonClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure logoutButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formEvidencija: TformEvidencija;

implementation

uses evidencijaAutomobil, evidencijaOprema,evidencijaServisi, finansije,adminmain;

{$R *.fmx}

procedure TformEvidencija.Button1Click(Sender: TObject);
begin
    formEvidencija.hide;
    formEvidencijaServisi.show;
end;

procedure TformEvidencija.Button2Click(Sender: TObject);
begin
    formEvidencija.hide;
    formEvidencijaAutomobil.show;
end;

procedure TformEvidencija.Button3Click(Sender: TObject);
begin
    formEvidencija.hide;
    formFinansije.show;
end;

procedure TformEvidencija.logoutButtonClick(Sender: TObject);
begin
    formEvidencija.hide;
    formAdminMain.show;
end;

procedure TformEvidencija.registerButtonClick(Sender: TObject);
begin
    formEvidencija.hide;
    formEvidencijaOprema.show;
end;

end.
