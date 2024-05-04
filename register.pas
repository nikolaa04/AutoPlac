unit register;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts;

type
  TregisterForm = class(TForm)
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
    Ime: TLayout;
    Text4: TText;
    editIme: TEdit;
    prezime: TLayout;
    Text5: TText;
    editPrezime: TEdit;
    brojTelefona: TLayout;
    Text6: TText;
    editBrojTelefona: TEdit;
    adresa: TLayout;
    Text7: TText;
    editAdresa: TEdit;
    email: TLayout;
    Text8: TText;
    editEmail: TEdit;
    procedure nazadButtonClick(Sender: TObject);
    procedure loginButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  registerForm: TregisterForm;

implementation

uses main,dm,login;
{$R *.fmx}

procedure TregisterForm.loginButtonClick(Sender: TObject);
begin
var username, sifra, ime, prezime, telefon, email, adresa: string;
  begin
  //provera da li su podaci uneti
  if trim(editUsername.Text)='' then
      begin
        ShowMessage('Molimo vas unesite korisnicko ime!');
        editUsername.SetFocus;
      end;
  if trim(editpassword.Text)='' then
      begin
        ShowMessage('Molimo vas unesite sifru!');
        editpassword.SetFocus;
      end;
  if trim(editEmail.Text)='' then
      begin
        ShowMessage('Molimo vas unesite email!');
        editEmail.SetFocus;
      end;
  if trim(editime.Text)='' then
      begin
        ShowMessage('Molimo vas unesite ime!');
        editime.SetFocus;
      end;
  if trim(editprezime.Text)='' then
      begin
        ShowMessage('Molimo vas unesite prezime!');
        editprezime.SetFocus;
      end;
  if trim(editbrojtelefona.Text)='' then
      begin
        ShowMessage('Molimo vas unesite broj telefona!');
        editbrojtelefona.SetFocus;
      end;
      if trim(editAdresa.Text)='' then
      begin
        ShowMessage('Molimo vas unesite vasu adresu!');
        editbrojtelefona.SetFocus;
      end
      else
  // Dohvaćanje unesenih podataka
      username := editUsername.Text;
      sifra := editpassword.Text;
      ime := editime.Text;
      prezime := editprezime.Text;
      telefon := editbrojtelefona.Text;
      email := editemail.Text;
      adresa := editAdresa.Text;
    with db do
      begin
        dbauto.Open();
        qtemp.SQL.Clear;
        qtemp.SQL.Text:= 'SELECT COUNT(*) FROM Kupci WHERE Email = :Email';
        qtemp.ParamByName('Email').AsString := editEmail.Text;
        qtemp.Open;
        if qtemp.Fields[0].AsInteger > 0 then
          begin
            ShowMessage('Email adresa već postoji. Molimo izaberite drugu.');
            qtemp.Close;
            qtemp.Connection.Close;
            Exit;
          end;
      begin
        dbauto.Open();
        qtemp.SQL.Clear;
        qtemp.SQL.Text:= 'SELECT COUNT(*) FROM Kupci WHERE Username = :Username';
        qtemp.ParamByName('Username').AsString := editUsername.Text;
        qtemp.Open;
        if qtemp.Fields[0].AsInteger > 0 then
          begin
            ShowMessage('Username već postoji. Molimo izaberite drugi.');
            qtemp.Close;
            qtemp.Connection.Close;
            Exit;
          end;

      end;
    with db do
      begin
        dbauto.open;
        qtemp.sql.clear;
        qtemp.SQL.Text:='INSERT INTO Kupci (Ime, Prezime, Username, Password, Email, BrojTelefona, Adresa) ' +
                        'VALUES (:ime, :prezime, :username, :sifra, :email, :telefon,:adresa)';
      qtemp.Params.ParamByName('username').AsString := username;
      qtemp.Params.ParamByName('sifra').AsString := sifra;
      qtemp.Params.ParamByName('ime').AsString := ime;
      qtemp.Params.ParamByName('prezime').AsString := prezime;
      qtemp.Params.ParamByName('email').AsString := email;
      qtemp.Params.ParamByName('telefon').AsString := telefon;
      qtemp.Params.ParamByName('adresa').AsString := adresa;
      qtemp.ExecSQL;

        ShowMessage('Uspešno ste se registrovali!');

        registerForm.Hide;

        loginform.Show;

        qtemp.Free;

      end;
    end;
  end;
end;

procedure TregisterForm.nazadButtonClick(Sender: TObject);
begin
    registerform.hide;
    mainform.show;
end;

end.
