unit BASS_DSHOW;
{
  xVideo 1.2 Delphi unit
  Copyright (c) 2010-2011 Cristea Aurel Ionut.
  Check http://surodev.com for updates
}
{$DEFINE BASS_DSHOW}
interface
uses Windows{$IFDEF BASS_DSHOW},BASS{$ENDIF};





{$IFDEF BASS_DSHOW}
const
  DLLNAME                       =   'BASS_DSHOW.dll';
{$ENDIF}
{$IFNDEF BASS_DSHOW}
const
  DLLNAME                       =   'xVideo.dll';
{$ENDIF}

{$IFDEF BASS_DSHOW}
{xVideo Version}  
 xVideo_VERSION = $102020;              // API version
 xVideo_VERSIONTEXT = '1.2.2';          //TEXT version
{$ENDIF}

{$IFNDEF BASS_DSHOW}
{xVideo Version}
 xVideo_VERSION = $102020;              // API version
 xVideo_VERSIONTEXT = '1.2.2';          //TEXT version
{$ENDIF}

type
 DWORD = LongWord;
 BOOL = LongBool;
 FLOAT = Single;
 QWORD = Int64;
 LONG  = LongInt;


 HWINDOW = DWORD;   // multi video handle
 HDVP    = DWORD;   // DVP handle
 {$IFNDEF BASS_DSHOW}
 HSTREAM = DWORD;   // playing sample's channel handle
 HRECORD = DWORD;   // recording handle
 HSYNC   = DWORD;   // synchronizer handle
 HDSP    = DWORD;   // DSP handle
 HFX     = DWORD;   // FX Handle
 HPLUGIN = DWORD;   // Plugin Handle
 {$ENDIF}

/////////////CALLBACKS///////////////////
///
 TCallBackEnumerator = function(name: PChar;guid: TGUID;user: Pointer): BOOL; stdcall;
 {
   name - the device name
   guid - device GUID
   user - the 'user' parameter
 }

 TCallBackConnectedFilters  = function(Filter : Pointer; FilterName: PChar;pp:BOOL;user:pointer) : BOOL; stdcall;
 {
   Filter- the instance of a IBaseFilter;
   FilterName - The name of the Filter
   pp - Boolean, Filter supports or not Property Pages
   user - The 'user' parameter 
 }

 TCallBackEnumProfiles = function(profile: PChar; user: Pointer): BOOL; stdcall;
 {
  profile - the device profile
  user - The 'user' parameter
 }


 TCallBackSync = function(chan: HSTREAM; sync: DWORD; data: DWORD; user: Pointer): BOOL; stdcall;
 {
  chan - the channel that triggered the sync
  sync - one of the xVideo_SYNC_XXX
  data - sync data
  user - the 'user' parameter 
 }

 {$IFNDEF BASS_DSHOW}
 
  DSPPROC = procedure(handle: HDSP; channel: DWORD; buffer: Pointer; length: DWORD; user: Pointer); stdcall;
  {
    DSP callback function. NOTE: A DSP function should obviously be as quick
    as possible... other DSP functions, streams and MOD musics can not be
    processed until it's finished.
    handle : The DSP handle
    channel: Channel that the DSP is being applied to
    buffer : Buffer to apply the DSP to
    length : Number of bytes in the buffer
    user   : The 'user' parameter given when calling xVideo_ChannelSetDSP
  }
 CallBackStreamEnumerator = function(format: DWORD; name: PChar; index: DWORD;enable: BOOL;user : Pointer): BOOL; stdcall;
 {
  format - 0: unknown, 1: video , 2: audio , 3: subtitle
  name -  the format name
  index - stream index. Use this index to enable or disable it
  enabled -is this stream enabled??
  user - The 'user' parameter
 }
 {$ENDIF}
 
 DVPPROC  = procedure(handle: HDVP; channel: DWORD; buffer: Pointer; length: DWORD;dataType: DWORD; Width: Integer;Height: Integer; user: Pointer); stdcall;
 {
  DVP callback function. NOTE: A DVP function should obviously be as quick as
  possible... other DVP functions, streams can not be processed
  until it's finished.
  handle     : The DVP handle
  channel    : Channel that the DVP is being applied to
  buffer     : Buffer to apply the DVP to
  length     : Number of bytes in the buffer
  dataType   : one of the xVideo_TYPE_xxx
  width      : video width
  height     : video height
  user       : The 'user' parameter given when calling xVideo_ChannelSetDVP
  }

 {$IFNDEF BASS_DSHOW}
   // User file stream callback functions
  FILECLOSEPROC = procedure(user: Pointer); stdcall;
  FILELENPROC = function(user: Pointer): QWORD; stdcall;
  FILEREADPROC = function(buffer: Pointer; length: DWORD; user: Pointer): DWORD; stdcall;
  FILESEEKPROC = function(offset: QWORD; user: Pointer): BOOL; stdcall;

  xVideo_FILEPROCS = record
    close: FILECLOSEPROC;
    length: FILELENPROC;
    read: FILEREADPROC;
    seek: FILESEEKPROC;
  end;
  {$ENDIF}
  //for xVideo_ChannelGetInfo function
  xVideo_ChannelInfo = record
     AvgTimePerFrame  : FLOAT; //average Time per frame (i.e 23.97 - it will draw 23.97 frames per seconds);
     Height: integer; //video size;
     Width : Integer; //video size
     nChannels: integer; //number of channels (i.e.1= mono,2= stereo...)
     freq: DWORD;  //sample rate
     wBits: DWORD; // number of bits per sample of mono data */
     floatingpoint: BOOL;//true if audio is 32 bit floating point, false else
  end;

  
 //for Video BMP functions////
  xVideo_VideoBitmap = record
    visible: Integer;     //0(zero) to hide bitmap, 1(one) to show it
    inLeft : Integer;     //bitmap in Left
    inTop  : Integer;     //bitmap in Top
    inRight: Integer;     //bitmap in Right
    inBottom: Integer;    //bitmap in Bottom
    outLeft : Single;     //bitmap out Left (0 ... 1.0)
    outTop  : Single;     //bitmap out Top (0 ... 1.0)
    outRight: Single;     //bitmap out right (0 ... 1.0)
    outBottom: Single;    //bitmap out Bottom (0 ... 1.0)
    alphavalue: Single;   //bitmap alpha blend value (0 ... 1.0)
    transcolor: COLORREF; //bitmap transparent color
    bmp: HDC;
  end;

{$IFNDEF BASS_DSHOW}

  xVideoFX_PARAMEQ = record
    fCenter : float;
    fBandwidth : float;
    fGain : float;
  end;

  xVideoFX_TEMPO = record
    tempo : FLOAT;
    pitch : FLOAT;
    tempoRate: FLOAT;
  end;


  xVideoFX_REVERB = record
    fInGain : float;                // [-96.0,0.0]            default: 0.0 dB
    fReverbMix : float;             // [-96.0,0.0]            default: 0.0 db
    fReverbTime : float;            // [0.001,3000.0]         default: 1000.0 ms
    fHighFreqRTRatio : float;       // [0.001,0.999]          default: 0.001
  end;

 xVideoFX_FLANGER = record
    fWetDryMix : FLOAT;
    fDepth : FLOAT;
    fFeedback : FLOAT;
    fFrequency : FLOAT;
    lWaveform : LONG;
    fDelay : FLOAT;
    lPhase : LONG;
  end;

  xVideoFX_CHORUS = record
    fWetDryMix : FLOAT;
    fDepth : FLOAT;
    fFeedback : FLOAT;
    fFrequency : FLOAT;
    lWaveform : LONG;          // 0=triangle, 1=sine
    fDelay : FLOAT;
    lPhase : LONG;   //xVideo_PHASE_xxx
  end;


  xVideoFX_COMPRESSOR = record
    fGain : FLOAT;
    fAttack : FLOAT;
    fRelease : FLOAT;
    fThreshold : FLOAT;
    fRatio : FLOAT;
    fPredelay : FLOAT;
  end;

  xVideoFX_ECHO = record
    fWetDryMix : FLOAT;
    fFeedback : FLOAT;
    fLeftDelay : FLOAT;
    fRightDelay : FLOAT;
    lPanDelay : LONG;
  end;

  xVideoFX_CHANNELMIX = record
    mode : DWORD;  //xVideo_CHANMIX_xxx
  end;
{$ENDIF}


  xVideo_Encode = record
    audioEncoder: integer;
    videoEncoder: integer;
    muxer       : TGUID;
    encodetype  : DWORD;
    filename    : Pointer;
    preview     : BOOL;
  end;


  
  //for xVideo_ChannelColorRange function////
  xVideo_ColorsRange = record
		MinValue     : float;
    MaxValue     : float;
    DefaultValue : float;
    StepSize     : float;
		typ          : DWORD; // one of the xVideo_ControlXXX
  end;
  //for xVideo_ChannelSetColors function////
  xVideo_ColorsSet = record
    Contrast    : float;
    Brightness  : float;
    Hue         : float;
    Saturation  : float;
  end;

  xVideo_PLUGININFO = record
    version : DWORD;					// version
	  decoderType : DWORD;				// decoder type: 1=audio 2=video
	  plgdescription : PChar;          //plugin description
  end;
  xVideo_STREAMS = record
    format: DWORD;  //0: unknown, 1: video , 2: audio , 3: subtitle
    name: PChar;    // the format name
    index: DWORD;   //stream index. Use this index to enable or disable it
    enabled: BOOL;  //is this stream enabled??
  end;

  FORMATCLOSE = procedure(user: Pointer); stdcall;
  FORMATLENGTH = function(user: Pointer): QWORD; stdcall;
  FORMATREAD = function(buffer: Pointer; length: DWORD; position: QWORD; user: Pointer): DWORD; stdcall;
  FORMATSEEK = function(offset: QWORD; user: Pointer): BOOL; stdcall;


 xVideo_USERFORMAT = record
	mtype : DWORD;
	format: Pointer;
  subtype: TGUID;
  close: FORMATCLOSE;
  length: FORMATLENGTH;
  read: FORMATREAD;
  seek: FORMATSEEK;
	user: Pointer;    //can be NULL
	next: Pointer;    //can be NULL
 end;
const
 /////xVideo_Init Flags////
 ///////////////////////////////////////////////////////////////////////////
 ///////////////////////////////////////////////////////////////////////////
  xVideo_MultiThread       = $00000010;  ///enable multithread support


 
//Stream Creation Flags
///////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////
  xVideo_UNICODE            = $80000000; //pass this flag when use UNICODE strings
  xVideo_STREAM_AUTOFREE    = $40000;    //put this flag to free the stream when it completes
  xVideo_STREAM_DECODE      = $200000;   //put this flag to set the channnel as a encoding one
  xVideo_STREAM_MIX         = $1000000;  //put this flag to enable channel video mixer
  xVideo_NOAUDIO_PROC       = $80000;    //Use this flag to disable audio processor
  xVideo_STREAM_AUTODVD     = $4000000;  //use this flag to enable auto dvd functions(on mouse down, keys etc)
  xVideo_STREAM_LOOP        = $8000000;  //use this flag to restart stream when it's finished
  xVideo_STREAM_VIDEOPROC   = $20000;    //Use this to enable video processor
//xVideo_CaptureXXX functions flags
//...........................................
  xVideo_CaptureAudio       =  $10066;
  xVideo_CaptureVideo       =  $10080;


  //xVideo_ChannelGetState return values
///////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////
  xVideo_STATE_PLAYING	  = 1;  //channel is playing
  xVideo_STATE_PAUSED  	  = 2;  //channel is paused
  xVideo_STATE_STOPPED    =	3;  //channel is stopped
  

//xVideo_ChannelGetLenght/SetPosition/GetPosition: modes
///////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////
  xVideo_POS_SEC            =     0; //position in seconds
  xVideo_POS_FRAME          =     1; //position in frames
  xVideo_POS_MILISEC        =     2; //position in miliseconds
  xVideo_POS_REFTIME        =     3; //position in reference time


 ///////xVideo_ChannelSetAttribute/GetAttribute Constants
 ///////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////
  xVideo_ATTRIB_VOL        = 1;    //used to set Audio Volume
  xVideo_ATTRIB_PAN        = 2;    //used to set Audio Pan
  xVideo_ATTRIB_RATE       = 3;    //used to set Graph Rate
  xVideo_ATTRIB_ALPHA      = 4;    //use this to set main video alpha blend value


  /////////////////////////////xVideo_FX constants///////////////


{$IFNDEF BASS_DSHOW}
// FX effect types, use with xVideo_ChannelSetFX
  xVideo_FX_REVERB      = 1;
  xVideo_FX_PARAMEQ     = 2;
  xVideo_FX_CHORUS      = 3;
  xVideo_FX_COMPRESSOR  = 4;
  xVideo_FX_ECHO        = 5;
  xVideo_FX_FLANGER     = 6;
  xVideo_FX_PITCHTEMPO  = 7;
  xVideo_FX_CHANMIX     = 8;
{$ENDIF}


//xVideo_SetConfig configs and values
///////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////
  xVideo_CONFIG_VideoRenderer  =    $1000;
  xVideo_VMR7                  =    1;          //pass this to select VMR7 Windowed render
  xVideo_VMR9                  =    2;          //pass this to select VMR9 Windowed render
  xVideo_VMR7WindowsLess       =    3;          //pass this to select VMR7 window less render

  xVideo_VMR9WindowsLess       =    4;          //pass this to select VMR9 window less render
  xVideo_EVR                   =    5;          //pass this to select Enhanced Video Renderer
  xVideo_NULLVideo             =    6;          //pass this to select NULL Video Renderer
  xVideo_WindowLessStreams     =    $1002;      //use this to set the number of streams in a VMR7/9 Windowsless mode
  xVideo_WindowLessHandle      =    $1001;      //VMR7/VMR9 WindowLess Mode need an initial window so set a HWND to use properly VMR
 {$IFNDEF BASS_DSHOW}
 //............................................
  xVideo_CONFIG_AudioRenderer  = $1004;  //use this to select audio renderer
  xVideo_NULLAudio             = $1432;  //use this to select NULL Audio Renderer
  xVideo_DefaultAudio          = $1433;  //use this to select Windows Default Audio Device
  xVideo_CONFIG_FLOATDSP       = $1005;  //use this to enable/disable floating point processing DSP
 //.............................................
 {$ENDIF}

//////Color Controls FLAGS////////////////////////////
  xVideo_ControlBrightness     =    $00000001;
  xVideo_ControlContrast       =    $00000002;
  xVideo_ControlHue            =    $00000004;
  xVideo_ControlSaturation     =    $00000008;

//xVideo_ChannelGetData Flags
  xVideo_DATA_END              = $80000000;  // end of file

  xVideo_DATA_FFT256           = $60000001;   // flag: return FFT 256
  xVideo_DATA_FFT512           = $60000002;   // flag: return FFT 512
  xVideo_DATA_FFT1024          = $60000003;   // flag: return FFT 1024
  xVideo_DATA_FLOAT  	         = $40000000;	 // flag: return floating-point sample data

//xVideo_CallbackItemByIndex
  xVideo_CALLBACK_AC    = 1;  //used to get the audio capture device
  xVideo_CALLBACK_VC    = 2;  //used to get the Video capture device
  xVideo_CALLBACK_AR    = 3;  //used to get the audio renderer device


{$IFNDEF BASS_DSHOW}
  xVideo_CHANMIX_STEREO       = 0; //unchanged
  xVideo_CHANMIX_LEFTRIGHT    = 1; //copy left audio data to right
  xVideo_CHANMIX_RIGHTLEFT    = 2; //copy right audio data to left
{$ENDIF}


//DVD function flags
//............................................
//for xVideo_DVDGetProperty function
  xVideo_CurentDVDTitle             = $10010;
  xVideo_DVDTitles                  = $10020;
  xVideo_DVDTitleChapters           = $10030;
  xVideo_DVDCurrentTitleDuration    = 145 ;
  xVideo_DVDCurrentTitlePosition    = 146 ;

//for xVideo_DVDSetProperty function
  xVideo_DVD_TITLEMENU        = 100;
  xVideo_DVD_ROOT             = 101;      //go to DVD root
  xVideo_DVD_NEXTCHAPTER      = 102;      //go to dvd next chapter
  xVideo_DVD_PREVCHAPTER      = 103;     //go to dvd previous chapter
  xVideo_DVD_TITLE            = 104;     //go to dvd title
  xVideo_DVD_TITLECHAPTER     = 105;     //play chapter in current title

//for xVideo_DVDChannelMenu function
  xVideo_DVDSelectAtPos  = 21;
  xVideo_DVDActionAtPos  = 22;
  xVideo_DVDActivateBut  = 23;
  xVideo_DVDSelectButton = 24;

//xVideo Error Codes
//.............................................................

  xVideo_OK                 = 0;   //all ok
  xVideo_INVALIDCHAN        = 1;   //invalid channel was specified
  xVideo_UNKNOWN            = 2;   //unknown error
  xVideo_NotInitialized     = 3;   //xVideo is not initialized
  xVideo_POSNOTAVAILABLE    = 4;   //the specified position mode is not available
  xVideo_NODSHOW            = 5;   //no Directshow framework available
  xVideo_INVALIDWINDOW      = 6;   //invalid window handle specified
  xVideo_NOAUDIO            = 7;   //no audio available in channel
  xVideo_NOVIDEO            = 8;   //no video available in channel
  xVideo_ERRORMEM           = 9;   //no memory available
  xVideo_ERRORCALLBACK      = 10;  //the callback function is NULL
  xVideo_ERRORFLAG          = 11;  //invalid flag was specified
  xVideo_NOTAVAILABLE       = 12;  //this function is not available
  xVideo_ERRORINIT          = 13;  //failed to initialize xVideo

 /////xVideo_SYNC_XXX//////////////////////////////////
  xVideo_SYNC_END                           = 1; //used to sync when channel end
  xVideo_SYNC_DVD_CHAPTER_START             = 2; //used to sync when a chapter start
  xVideo_SYNC_DVD_TITLE_CHANGE              = 3; //used to sync when a title change
  xVideo_SYNC_DVD_ERROR                     = 4; //used to sync when a DVD error occurs
  xVideo_SYNC_REPAINT                       = 5; //used to sync when videorenderrer need a repaint
  xVideo_SYNC_VIDEO_SIZE_CHANGED            = 6; //used to sync when video renderer changes it's display size

 /////xVideo_TYPE_XXX//////////////////////////////////
  xVideo_TYPE_RGB24        = 1;
  xVideo_TYPE_RGB32        = 2;
  xVideo_TYPE_YUYV         = 3;
  xVideo_TYPE_IYUV         = 4;
  xVideo_TYPE_YVU9         = 5;
  xVideo_TYPE_YV12         = 6;
  xVideo_TYPE_NV12         = 7;
  xVideo_TYPE_UYVY         = 8;

  
/////////////////////////Functions//////////////////////////////////////
  function  xVideo_ErrorGetCode(): DWORD; stdcall; external DLLNAME;
  function  xVideo_GetVersion(): DWORD; stdcall; external DLLNAME;
  function  xVideo_Init(handle: HWND;flags: DWORD):BOOL;stdcall; external DLLNAME;
  function  xVideo_StreamCreateFile(str: Pointer;position: DWORD;win: HWND;flags: DWORD):HSTREAM;stdcall; external DLLNAME;
  function  xVideo_ChannelPlay(chan: HSTREAM):BOOL;stdcall;  external DLLNAME;
  function  xVideo_ChannelPause(chan: HSTREAM):bool;stdcall;  external DLLNAME;
  function  xVideo_ChannelStop(chan: HStream): bool; stdcall;  external DLLNAME;
  function  xVideo_StreamFree(chan: HStream): bool; stdcall;  external DLLNAME;
  procedure xVideo_ChannelSetWindow(chan: HSTREAM;hVideo:DWORD;handle: HWND);stdcall;   external DLLNAME;
  function  xVideo_ChannelSetPosition(chan: HSTREAM;pos: Double;mode: DWORD): BOOL;stdcall;   external DLLNAME;
  function  xVideo_ChannelGetLength(chan: HSTREAM;mode: DWORD): Double; stdcall;  external DLLNAME;
  function  xVideo_ChannelGetPosition(chan: HSTREAM;mode: DWORD): Double;    stdcall;  external DLLNAME;
  procedure xVideo_ChannelGetConnectedFilters(chan: HSTREAM;callback :Pointer;user:Pointer);stdcall; external DLLNAME;
  function  xVideo_GetGraph(chan: HSTREAM): Pointer;   stdcall;  external DLLNAME;
  function  xVideo_ChannelGetState(chan: HSTREAM): DWORD; stdcall; external DLLNAME;
  procedure xVideo_ChannelResizeWindow(chan: HSTREAM;hVideo:DWORD;left,top,right,bottom: integer);stdcall; external DLLNAME;
  procedure xVideo_ChannelSetFullscreen(chan: HSTREAM;value: boolean);stdcall; external DLLNAME;
  procedure xVideo_ShowFilterPropertyPage(chan:HSTREAM;filter:DWORD;hndparent: HWND);  stdcall; external DLLNAME;
  function  xVideo_Free(): BOOL; stdcall;  external DLLNAME;
  function  xVideo_ChannelAddWindow( chan:HSTREAM;win:HWND): HWINDOW;  stdcall; external DLLNAME;
  function  xVideo_ChannelRemoveWindow(Chan: HSTREAM; win: HWINDOW): BOOL; stdcall; external DLLNAME;
  function  xVideo_ChannelRepaint(Chan: HSTREAM; win: HWINDOW;dc: HDC): BOOL; stdcall; external DLLNAME;
  procedure xVideo_ChannelSetAttribute(chan: HSTREAM;option: DWORD;value: FLOAT); stdcall; external DLLNAME;
  function  xVideo_ChannelGetAttribute(chan: HSTREAM; option: DWORD): FLOAT; stdcall; external DLLNAME;
  procedure xVideo_SetConfig(config: DWORD; value: DWORD); stdcall; external DLLNAME;
  function  xVideo_SetVideoAlpha(chan: HSTREAM;win: HWINDOW; layer: Integer;alpha: FLOAT): BOOL; stdcall; external DLLNAME;
  function  xVideo_GetVideoAlpha(chan: HSTREAM;win: HWINDOW; layer: Integer): FLOAT; stdcall; external DLLNAME;

  function  xVideo_ChannelAddFile(chan: HSTREAM;filename: Pointer;flags: DWORD): BOOL; stdcall; external DLLNAME;
  procedure xVideo_ChannelGetInfo(chan: HSTREAM; info: Pointer);  stdcall; external DLLNAME;
  function  xVideo_ChannelOverlayBMP(chan: HSTREAM;Struct: Pointer): BOOL;  stdcall; external DLLNAME;

 
  function  xVideo_CaptureGetDevices(devicetype: DWORD; callback: Pointer; user: Pointer): Integer;   stdcall; external DLLNAME;
  function  xVideo_CaptureFree( chan: HRECORD): BOOL;  stdcall; external DLLNAME;
  function  xVideo_CaptureCreate(audio: Integer;video:Integer;audioprofile: Integer; videoprofile: Integer;flags:DWORD): HRECORD;  stdcall; external DLLNAME;
  function  xVideo_CaptureDeviceProfiles(device: Integer; devicetype: DWORD; callback: Pointer; user : Pointer): Integer; stdcall; external DLLNAME;

  function  xVideo_ChannelGetBitmap(chan: HSTREAM): HBITMAP;  stdcall external DLLNAME;
  function  xVideo_MIXChannelResize(chan: HSTREAM; layer: Integer; left: integer;top: integer; right: Integer; bottom: Integer): BOOL; stdcall external DLLNAME;


  function  xVideo_ChannelColorRange(chan: HSTREAM;id: DWORD;ctrl : Pointer): BOOL; stdcall external DLLNAME;
  function  xVideo_ChannelSetColors(chan: HSTREAM; id: DWORD; Struct: Pointer): BOOL; stdcall external DLLNAME;

  function  xVideo_StreamCreateFileMem(data: Pointer; size: int64; win: HWND; flags: DWORD): HSTREAM; stdcall external DLLNAME;
  function  xVideo_StreamCreateFileUser(flags: DWORD;win: HWND;  procs: Pointer; user: Pointer): HSTREAM; stdcall; external DLLNAME;

  function  xVideo_ChannelSetFX(chan: HSTREAM; fx: Integer): HFX; stdcall; external DLLNAME;
  function  xVideo_ChannelRemoveFX(chan: HSTREAM; fx: HFX): BOOL; stdcall; external DLLNAME;
  function  xVideo_SetFXParameters(chan: HSTREAM; fx: HFX; param: Pointer): BOOL; stdcall; external DLLNAME;
  function  xVideo_GetFXParameters(chan: HSTREAM; fx: HFX; param: Pointer): BOOL; stdcall; external DLLNAME;

  function  xVideo_ChannelSetDSP(chan: HSTREAM; proc: Pointer;user: Pointer): HDSP; stdcall; external DLLNAME;
  function  xVideo_ChannelRemoveDSP(chan: HSTREAM; dsp: HDSP): BOOL; stdcall; external DLLNAME;
  function  xVideo_ChannelGetData(chan: HSTREAM; buffer: Pointer; size: DWORD): DWORD; stdcall; external DLLNAME;
  function  xVideo_CallbackItemByIndex(typo: DWORD; index: DWORD): PChar; stdcall; external DLLNAME;
  function  xVideo_LoadPlugin(filename: Pointer;flags: DWORD): HPLUGIN; stdcall; external DLLNAME;
  function  xVideo_PluginGetInfo(plugin: HPLUGIN; info: Pointer): BOOL; stdcall; external DLLNAME;
  function  xVideo_RemovePlugin(plugin: HPLUGIN): BOOL; stdcall; external DLLNAME;
  function  xVideo_StreamCreateDVD(str: Pointer;win: HWND;flags: DWORD):HSTREAM;stdcall; external DLLNAME;
  function  xVideo_DVDGetProperty(chan: HSTREAM; prop: DWORD; value : DWORD): DWORD; stdcall external DLLNAME;
  function  xVideo_DVDSetProperty(chan: HSTREAM; prop: DWORD; value : DWORD): BOOL; stdcall external DLLNAME;
  function  xVideo_DVDChannelMenu(chan: HSTREAM;option: DWORD; value1 : Integer;value2: Integer): BOOL; stdcall external DLLNAME;
  function  xVideo_GetConfig(config: DWORD): DWORD; stdcall; external DLLNAME;
  function  xVideo_ChannelSetPositionVB(chan: HSTREAM;pos: QWORD;mode: DWORD): BOOL;stdcall;   external DLLNAME;
  function  xVideo_ChannelGetLevel(chan : HSTREAM): DWORD; stdcall;   external DLLNAME;

  function  xVideo_LoadPluginDS(guid: Pointer; name: Pointer; flags: DWORD): HPLUGIN;  stdcall;   external DLLNAME;
  function  xVideo_StreamCreateFilter(filename: Pointer;clsid : Pointer;win: HWND; flags: DWORD): HSTREAM;  stdcall;   external DLLNAME;

  function  xVideo_VCamStreamChannel(chan: HSTREAM; stream: BOOL): BOOL;  stdcall;   external DLLNAME;
  function  xVideo_VCamPush(win: HWND; data: Pointer): BOOL;  stdcall;   external DLLNAME;
  function  xVideo_Register(email: Pointer; reg: Pointer;flags: DWORD): BOOL;   stdcall;   external DLLNAME;

  function  xVideo_ChannelCallBackSync(chan: HSTREAM;callback: Pointer;user: Pointer): BOOL; stdcall; external DLLNAME;
  function  xVideo_ChannelSetDVP(chan: HSTREAM; proc: Pointer;user: Pointer): HDVP; stdcall; external DLLNAME;
  function  xVideo_ChannelRemoveDVP(chan: HSTREAM; dvp: HDVP): BOOL; stdcall; external DLLNAME;
  function  xVideo_ChannelStreamsCount(chan : HSTREAM): DWORD; stdcall; external DLLNAME;
  function  xVideo_ChannelGetStream(chan: HSTREAM; index: DWORD; pstream: Pointer): BOOL ; stdcall; external DLLNAME;
  function  xVideo_ChannelEnableStream(chan: HSTREAM; index: DWORD): BOOL; stdcall ;external DLLNAME;
  function  xVideo_ChannelEnumerateStreams(chan: HSTREAM; callback: Pointer;user: Pointer): integer; stdcall; external DLLNAME;

  function  xVideo_StreamCreateCustom(format: Pointer;win: HWND; flags: DWORD): HSTREAM; stdcall; external DLLNAME;


implementation
initialization
 Set8087CW($133f);  //disable floating point exceptions
end.
