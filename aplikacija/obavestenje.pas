unit obavestenje;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts;

type
  TformObavestenje = class(TForm)
    slika: TLayout;
    Image1: TImage;
    top: TLayout;
    bot: TLayout;
    client: TLayout;
    Text1: TText;
    Text2: TText;
  private
    { Private declarations }
    fime, fprezime :string;
  public
    { Public declarations }
    property ime: string read Fime write Fime;
    property prezime: string read Fprezime write Fprezime;
  end;

var
  formObavestenje: TformObavestenje;

implementation

{$R *.fmx}

end.
