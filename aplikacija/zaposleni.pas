unit zaposleni;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts, FMX.Edit;

type
  TformZaposleni = class(TForm)
    Image1: TImage;
    top: TLayout;
    bot: TLayout;
    nazadButton: TButton;
    S: TLayout;
    Text1: TText;
    loginButton: TButton;
    Image2: TImage;
    username: TLayout;
    Text2: TText;
    editUsername: TEdit;
    password: TLayout;
    Text3: TText;
    editPassword: TEdit;
    procedure loginButtonClick(Sender: TObject);
    procedure nazadButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    ime1, prezime1: string
    { Public declarations }
  end;

var
  formZaposleni: TformZaposleni;

implementation

uses dm, main, zaposleniMain;
{$R *.fmx}

procedure TformZaposleni.loginButtonClick(Sender: TObject);
var
  pwd: string;
  zaposlen: Integer;
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
          // Provera zaposlenja
          zaposlen := qtemp.FieldByName('Zaposleni').AsInteger;
          if zaposlen = 0 then
          begin
            // Postavljanje imena i prezimena
            formZaposleni.ime1 := qtemp.FieldByName('Ime').AsString;
            formZaposleni.prezime1 := qtemp.FieldByName('Prezime').AsString;
            // Dozvoljen pristup aplikaciji
            ShowMessage('Pristup dozvoljen!');
            // Ovdje možete dodati kod za otvaranje nove forme ili prelazak na sledeći ekran

            formZaposleni.hide;
            formZaposleniMain.show;
          end
          else
          begin
            ShowMessage('Pristup nije dozvoljen!');
          end;
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


procedure TformZaposleni.nazadButtonClick(Sender: TObject);
begin
    formZaposleni.Hide;
    mainForm.show;
end;

end.
