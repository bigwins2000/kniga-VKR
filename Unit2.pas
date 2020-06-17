unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.OleCtrls, SHDocVw,
  Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    ScrollBox1: TScrollBox;
    Memo1: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses Unit1;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Form1.Show;
end;

procedure TForm2.FormResize(Sender: TObject);
begin
Memo1.Width:=Form2.Width-33;

//owMessage(' '+ IntToStr(Form2.Width+33) +' ');

end;

procedure TForm2.FormShow(Sender: TObject);
begin

Memo1.Lines.LoadFromFile('BD/1.1.txt');
end;

end.
