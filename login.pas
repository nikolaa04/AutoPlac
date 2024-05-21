unit login;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts, FMX.Edit;

type
  TloginForm = class(TForm)
    Image1: TImage;
    top: TLayout;
    bot: TLayout;
    S: TLayout;
    Text1: TText;
    loginButton: TButton;
    Image2: TImage;
    nazadButton: TButton;
    username: TLayout;
    Text2: TText;
    editUsername: TEdit;
    password: TLayout;
    Text3: TText;
    editPassword: TEdit;
    procedure nazadButtonClick(Sender: TObject);
    procedure loginButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ime1, prezime1: string
  end;

var
  loginForm: TloginForm;

implementation

uses main, dm,prvastrana,placanje,zakazivanje;

{$R *.fmx}

procedure TloginForm.loginButtonClick(Sender: TObject);
var
  pwd: string;
begin
  if Trim(editUsername.Text) = '' then
  begin
    Showmessage('Molimo unesite username!');
    editUsername.SetFocus;
  end
  else if Trim(editPassword.Text) = '' then
  begin
    Showmessage('Molimo unesite sifru!');
    editPassword.SetFocus;
  end
  else
  begin
    // Validacija
    with db do
    begin
      dbAuto.Open;
      qtemp.SQL.Clear;
      qtemp.SQL.Text := 'SELECT * FROM Kupci WHERE Username=' + QuotedStr(editUsername.Text);
      qtemp.Open;
      if qtemp.RecordCount = 0 then
      begin
        ShowMessage('Username ne postoji!');
        editUsername.SetFocus;
      end
      else
      begin
        pwd := qtemp.FieldByName('Password').AsString;
        if pwd = editPassword.Text then
        begin
          // Postavljanje imena i prezimena
          loginForm.ime1 := qtemp.FieldByName('Ime').AsString;
          loginForm.prezime1 := qtemp.FieldByName('Prezime').AsString;

          //PLacanje
          formPlacanje.ime := ime1;
          formPLacanje.prezime := prezime1;
          //Zakazivanje
          formzakazivanje.ime := ime1;
          formZakazivanje.prezime := prezime1;

          loginForm.Hide;
          prvaForm.Show;
        end
        else
        begin
          ShowMessage('Pogresna sifra!');
          editPassword.SetFocus;
        end;
      end;
    end;
  end;
end;


procedure TloginForm.nazadButtonClick(Sender: TObject);
begin
    loginForm.Hide;
    mainForm.Show;
end;

end.
