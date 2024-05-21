program AutoPlac;

uses
  System.StartUpCopy,
  FMX.Forms,
  main in 'main.pas' {mainForm},
  login in 'login.pas' {loginForm},
  dm in 'dm.pas' {db},
  register in 'register.pas' {registerForm},
  prvastrana in 'prvastrana.pas' {prvaForm},
  automobili1 in 'automobili1.pas' {formAutomobili1},
  automobili2 in 'automobili2.pas' {formAutomobili2},
  placanje in 'placanje.pas' {formPlacanje},
  zakazivanje in 'zakazivanje.pas' {formZakazivanje};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TmainForm, mainForm);
  Application.CreateForm(TloginForm, loginForm);
  Application.CreateForm(Tdb, db);
  Application.CreateForm(TregisterForm, registerForm);
  Application.CreateForm(TprvaForm, prvaForm);
  Application.CreateForm(TformAutomobili1, formAutomobili1);
  Application.CreateForm(TformAutomobili2, formAutomobili2);
  Application.CreateForm(TformPlacanje, formPlacanje);
  Application.CreateForm(TformZakazivanje, formZakazivanje);
  Application.Run;
end.
