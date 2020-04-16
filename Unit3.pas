unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.MPlayer,BASS_DSHOW, ComCtrls;


type
  TForm3 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ScrollBox1: TScrollBox;
    Memo1: TMemo;
    Next: TButton;
    Back: TButton;
    Home: TButton;
    Panel3: TPanel;
    OpenDialog1: TOpenDialog;
    Display: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BackClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure NextClick(Sender: TObject);
    procedure HomeClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure DisplayClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  strs, str, vid : Integer;
    chan: cardinal;
implementation

{$R *.dfm}

uses Unit1;

procedure TForm3.BackClick(Sender: TObject);
begin
  if str>1 then
  begin
    str:=str-1;
    Memo1.Lines.LoadFromFile('BD/' + IntToStr(str) + '.txt');
    Memo1.Height:=Memo1.Lines.Count*13;
    Panel3.Caption:=(IntToStr(str) + '/' + IntToStr(strs));
  end
end;


  procedure TForm3.Button2Click(Sender: TObject);
begin
 xVideo_ChannelPlay(chan);
end;

procedure TForm3.Button3Click(Sender: TObject);
begin
  xVideo_ChannelPause(chan);

end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form1.Show;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  strs:=10;
  str:=1;
  vid:=1;
  // �������������
  xVideo_Init(Handle,0);
  // �������
  xVideo_LoadPluginDS(PChar('{04FE9017-F873-410E-871E-AB91661A4EF7}'),PChar('FFDSHOW Video Decoder'),0);
  xVideo_LoadPluginDS(PChar('{0F40E1E5-4F79-4988-B1A9-CC98794E6B55}'),PChar('FFDSHOW Audio Decoder'),0);
  xVideo_LoadPluginDS(PChar('{0F40E1E5-4F79-4988-B1A9-CC98794E6B55}'),PChar('HAALI Media Splitter'),0);
  // �����
  xVideo_SetConfig(xVideo_CONFIG_VideoRenderer,xVideo_VMR9)

end;




procedure TForm3.Button4Click(Sender: TObject);
begin

  xVideo_ChannelStop(chan);
end;






procedure TForm3.DisplayClick(Sender: TObject);
begin
      if(chan<>0) then begin
      xVideo_StreamFree(chan);
      chan := 0;
    end;
    chan := xVideo_StreamCreateFile(PChar('BD/vid/'+ IntToStr(vid) +'.avi'),0,Display.Handle,{$IFDEF UNICODE}xVideo_UNICODE or {$ENDIF}xVideo_STREAM_LOOP);
    if(chan <> 0) then
    begin
      xVideo_ChannelSetWindow(chan,0,Display.Handle);
      xVideo_ChannelPlay(chan);
    end;
   // end open dialog

end;

procedure TForm3.HomeClick(Sender: TObject);
begin
  str:=1;
  Memo1.Lines.LoadFromFile('BD/' + IntToStr(str) + '.txt');
  Memo1.Height:=Memo1.Lines.Count*13;
  Panel3.Caption:=(IntToStr(str) + '/' + IntToStr(strs));
end;

procedure TForm3.NextClick(Sender: TObject);
begin
  if str<strs then
  begin
    str:=str+1;
    Memo1.Lines.LoadFromFile('BD/' + IntToStr(str) + '.txt');
    Memo1.Height:=Memo1.Lines.Count*13;
    Panel3.Caption:=(IntToStr(str) + '/' + IntToStr(strs));
  end

end;



end.
