unit dodavanje;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts;

type
  TformDodavanje = class(TForm)
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
    procedure botClick(Sender: TObject);
    procedure registerButtonClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure logoutButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formDodavanje: TformDodavanje;

implementation

uses adminMain, dodavanjeoprema, dodavanjeAutomobil;

{$R *.fmx}

procedure TformDodavanje.botClick(Sender: TObject);
begin
    formDodavanje.hide;
    formadminMain.show;
end;

procedure TformDodavanje.Button1Click(Sender: TObject);
begin
    formDodavanje.hide;
    formDodavanjeAutomobil.show;
end;

procedure TformDodavanje.logoutButtonClick(Sender: TObject);
begin
    formDodavanje.hide;
    formAdminMain.show;
end;

procedure TformDodavanje.registerButtonClick(Sender: TObject);
begin
    formDodavanje.hide;
    formDodavanjeOprema.show;
end;

end.
