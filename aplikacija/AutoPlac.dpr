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
  zakazivanje in 'zakazivanje.pas' {formZakazivanje},
  zaposleni in 'zaposleni.pas' {formZaposleni},
  zaposleniMain in 'zaposleniMain.pas' {formZaposleniMain},
  obavestenja in 'obavestenja.pas' {formObavestenja},
  obavestenjaPosalji in 'obavestenjaPosalji.pas' {formPosalji},
  obavestenjaPogledaj in 'obavestenjaPogledaj.pas' {formPogledaj},
  zaposleniServisi in 'zaposleniServisi.pas' {formZaposleniServisi},
  zaposleniRezervacije in 'zaposleniRezervacije.pas' {formZaposleniRezervacije},
  zaposleniOpremaZ in 'zaposleniOpremaZ.pas' {formZaposleniOpremaZ},
  zaposleniInventar in 'zaposleniInventar.pas' {formZaposleniInventar},
  zaposleniAutomobili in 'zaposleniAutomobili.pas' {formZaposleniAutomobili1},
  ZaposleniOpremaI in 'ZaposleniOpremaI.pas' {formZaposleniOprema1};

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
  Application.CreateForm(TformZaposleni, formZaposleni);
  Application.CreateForm(TformZaposleniMain, formZaposleniMain);
  Application.CreateForm(TformObavestenja, formObavestenja);
  Application.CreateForm(TformPosalji, formPosalji);
  Application.CreateForm(TformPogledaj, formPogledaj);
  Application.CreateForm(TformZaposleniServisi, formZaposleniServisi);
  Application.CreateForm(TformZaposleniRezervacije, formZaposleniRezervacije);
  Application.CreateForm(TformZaposleniOpremaZ, formZaposleniOpremaZ);
  Application.CreateForm(TformZaposleniInventar, formZaposleniInventar);
  Application.CreateForm(TformZaposleniAutomobili1, formZaposleniAutomobili1);
  Application.CreateForm(TformZaposleniOprema1, formZaposleniOprema1);
  Application.Run;
end.
