program TempViewer;

uses
  Vcl.Forms,
  FormMultiView in 'FormMultiView.pas' {FormViewer};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormViewer, FormViewer);
  Application.Run;
end.
