program ValidaCedulaRnc;

uses
  System.StartUpCopy,
  FMX.Forms,
  Principal in 'Principal.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
