unit prvastrana;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts;

type
  TprvaForm = class(TForm)
    slika: TLayout;
    Image1: TImage;
    top: TLayout;
    bot: TLayout;
    client: TLayout;
    Text1: TText;
    loginButton: TButton;
    registerButton: TButton;
    Image2: TImage;
    Button1: TButton;
    logoutButton: TButton;
    procedure logoutButtonClick(Sender: TObject);
    procedure loginButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  prvaForm: TprvaForm;

implementation

uses main, automobili1;

{$R *.fmx}

procedure TprvaForm.loginButtonClick(Sender: TObject);
begin
    prvaForm.hide;
    formAutomobili1.show;
end;

procedure TprvaForm.logoutButtonClick(Sender: TObject);
begin
    prvaForm.Hide;
    mainForm.show;
end;

end.
