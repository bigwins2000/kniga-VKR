unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, BASS_DSHOW, ComCtrls,
  Vcl.StdCtrls;

type
  TForm4 = class(TForm)
    Display: TPanel;
    Panel1: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  paused: boolean;
  chan: cardinal;

implementation

{$R *.dfm}

uses Unit3;



procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Form3.Button4.Click;
end;

end.
