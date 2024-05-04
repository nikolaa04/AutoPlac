program AutoPlac;

uses
  System.StartUpCopy,
  FMX.Forms,
  main in 'main.pas' {mainForm},
  login in 'login.pas' {loginForm},
  dm in 'dm.pas' {db},
  register in 'register.pas' {registerForm},
  prvastrana in 'prvastrana.pas' {prvaForm},
  automobili1 in 'automobili1.pas' {automobili1Form};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TmainForm, mainForm);
  Application.CreateForm(TloginForm, loginForm);
  Application.CreateForm(Tdb, db);
  Application.CreateForm(TregisterForm, registerForm);
  Application.CreateForm(TprvaForm, prvaForm);
  Application.CreateForm(Tautomobili1Form, automobili1Form);
  Application.Run;
end.
