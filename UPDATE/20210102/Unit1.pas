unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdBaseComponent, IdComponent, IdUDPBase, IdUDPClient,
  Card;

type
  TForm1 = class(TForm)
    Card1: TCard;
    UDPC: TIdUDPClient;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Card2: TCard;
    Card3: TCard;
    Card4: TCard;
    Card5: TCard;
    Card6: TCard;
    Card7: TCard;
    Card8: TCard;
    Card9: TCard;
    Card10: TCard;
    Card11: TCard;
    Card12: TCard;
    Card13: TCard;
    Button2: TButton;
    Label3: TLabel;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  MyIP: string;
  Clr:array[0..3] of TCardSuit;
  Card:array[0..12]of TCard;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var ip: string; port: integer;
var se,re: string;
var r: string; i: integer;
begin
  se:=Label2.Caption; //Send Password 'Offline'
  UDPC.Send(se);

  ip:='192.168.137.1'; port:=5000;
  re:=UDPC.ReceiveString(ip, port); //Connection Confirm!

  if (re='Connecting') then  //if Connecting
  begin
    re:=UDPC.ReceiveString(ip, port); //re IP Addr
    MyIP:=re;
    Label2.Caption:=MyIP;

    re:=UDPC.ReceiveString(ip, port); //re Name
    Label3.Caption:=re;

    re:=UDPC.ReceiveString(ip, port); //re Card
    for i:=0 to 12 do
    begin
      r:=Copy(re,4*(i+1)-3,2);
      Card[i].Suit := Clr[strtoint(r)-1];

      r:=Copy(re,4*(i+1)-1,2);
      Card[i].Value := strtoint(r);
    end;

    re:=UDPC.ReceiveString(ip, port);

    if (re:='Your Turn') then
    begin
      Label4:='re';
    end
    else
    begin
      Label4:='re';
    end;
  end;




end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Clr[0]:=Clubs;
  Clr[1]:=Diamonds;
  Clr[2]:=Hearts;
  Clr[3]:=Spades;

  Card[0]:=Card1;
  Card[1]:=Card2;
  Card[2]:=Card3;
  Card[3]:=Card4;
  Card[4]:=Card5;
  Card[5]:=Card6;
  Card[6]:=Card7;
  Card[7]:=Card8;
  Card[8]:=Card9;
  Card[9]:=Card10;
  Card[10]:=Card11;
  Card[11]:=Card12;
  Card[12]:=Card13;

end;

end.
 