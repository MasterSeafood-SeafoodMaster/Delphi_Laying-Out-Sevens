unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdBaseComponent, IdComponent, IdUDPBase, IdUDPClient,
  Card, ExtCtrls;

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
    Label3: TLabel;
    Label4: TLabel;
    Timer1: TTimer;
    Timer2: TTimer;
    Label5: TLabel;
    Button2: TButton;
    Label6: TLabel;
    Button3: TButton;
    Card18: TCard;
    Label7: TLabel;
    Heart13: TCard;
    Diamond13: TCard;
    Club13: TCard;
    Spade13: TCard;
    Heart12: TCard;
    Diamond12: TCard;
    Club12: TCard;
    Spade12: TCard;
    Heart11: TCard;
    Diamond11: TCard;
    Club11: TCard;
    Spade11: TCard;
    Heart10: TCard;
    Diamond10: TCard;
    Club10: TCard;
    Spade10: TCard;
    Heart9: TCard;
    Diamond9: TCard;
    Club9: TCard;
    Spade9: TCard;
    Heart8: TCard;
    Diamond8: TCard;
    Club8: TCard;
    Spade8: TCard;
    Heart7: TCard;
    Diamond7: TCard;
    Club7: TCard;
    Spade7: TCard;
    Heart6: TCard;
    Diamond6: TCard;
    Club6: TCard;
    Spade6: TCard;
    Heart5: TCard;
    Diamond5: TCard;
    Club5: TCard;
    Spade5: TCard;
    Heart4: TCard;
    Diamond4: TCard;
    Club4: TCard;
    Spade4: TCard;
    Heart3: TCard;
    Diamond3: TCard;
    Club3: TCard;
    Spade3: TCard;
    Heart2: TCard;
    Diamond2: TCard;
    Club2: TCard;
    Spade2: TCard;
    Heart1: TCard;
    Diamond1: TCard;
    Club1: TCard;
    Spade1: TCard;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Card1Click(Sender: TObject);
    procedure Card2Click(Sender: TObject);
    procedure Card3Click(Sender: TObject);
    procedure Card4Click(Sender: TObject);
    procedure Card5Click(Sender: TObject);
    procedure Card6Click(Sender: TObject);
    procedure Card7Click(Sender: TObject);
    procedure Card8Click(Sender: TObject);
    procedure Card9Click(Sender: TObject);
    procedure Card10Click(Sender: TObject);
    procedure Card11Click(Sender: TObject);
    procedure Card12Click(Sender: TObject);
    procedure Card13Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  MyIp, MyP: string;
  se,re: string;
  sr: string; ir: integer;
  ip: string; port: integer;
  Clr:array[0..3] of TCardSuit;
  Card:array[0..13]of TCard;
  CardOnTable:array[0..51]of TCard;
  CardIdx: integer;
  Round: integer;
  Card13V:integer;
  Card13S:integer;
  Loss: integer=0;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var r: string; i: integer;
begin
  UDPC.Host := Edit1.Text;
  ip:='192.168.137.1'; port:=5000;

  se:='Connecting';                // Connect to Server
  UDPC.Send(se);

  re:=UDPC.ReceiveString(ip, port);
  MyP:=  Copy(re, 2, 1);
  MyIP:= Copy(re, 4, 15);
  Label2.Caption:= MyIp;
  Label3.Caption:= 'P'+ MyP;

  se:='I need Card!'+MyP;          //Get card from Server
  UDPC.Send(se);
  re:=UDPC.ReceiveString(ip, port);
  for i:=0 to 12 do
  begin
    r:=Copy(re,4*(i+1)-3,2);
    Card[i].Suit := Clr[strtoint(r)-1];

    r:=Copy(re,4*(i+1)-1,2);
    Card[i].Value := strtoint(r);
  end;
  Label4.Caption:='Round';
  Label5.Caption:='Waiting';
  Timer1.Enabled:=True;

  Button1.Visible:=False;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  se:='Game start?';
  UDPC.Send(se);
  re:=UDPC.ReceiveString(ip, port);

  if (re='Game start!') then
  begin
    Label5.Caption:='Game start!';
    Timer1.Enabled:=False;
    Timer2.Enabled:=True;
  end;

end;

procedure TForm1.Timer2Timer(Sender: TObject);
var i: integer; Sv,Ss: string;
begin
    se:='What round is this?';
    UDPC.Send(se);
    re:=UDPC.ReceiveString(ip, port);
    Round:=strtoint(re);
    Label4.Caption:='Round '+re;

    ir:= strtoint(re);
    Label6.Caption:= 'P'+inttostr(ir mod 4+1)+'s Turn';

    if (inttostr(ir mod 4+1) = MyP) then
    begin
      Button2.Visible:=True;
      Button3.Visible:=True;
    end
    else
    begin
      Button2.Visible:=False;
      Button3.Visible:=False;
    end;

    se:='Who is the latest card?';
    UDPC.Send(se);
    re:=UDPC.ReceiveString(ip, port);

    Label7.Caption:=re;
    Ss:=Copy(re, 1, 2);
    Sv:=Copy(re, 3, 2);

    for i:=0 to 51 do
    begin
      if ((CardOnTable[i].Suit = Clr[strtoint(Ss)-1]) And(CardOnTable[i].Value = strtoint(Sv))) then
      begin
         CardOnTable[i].Visible:=True;
      end;
    end;

    if (Round>51)then
    begin
      Button2.Visible:=False;
      Button3.Visible:=False;

      se:='Game Over!'+MyP+inttostr(Loss);
      UDPC.Send(se);

      se:='Who is winner?';
      UDPC.Send(se);
      re:=UDPC.ReceiveString(ip, port);
      Label9.Visible:=True;
      Label9.Caption:='P'+re+' WIN!';

      re:=UDPC.ReceiveString(ip, port);
      Label10.Visible:=True;
      Label10.Caption:='Loss:'+re;

    end;
end;
procedure TForm1.Button2Click(Sender: TObject);
begin
  sr:=inttostr(Card13V) + ',' + inttostr(Card13S);
  se:='PlayCard request!'+sr;
  UDPC.Send(se);

  re:=UDPC.ReceiveString(ip, port);
  if (re = 'Card Played')then
  begin
    Card[CardIdx].Visible:=False;
    se:='Next Round!';
    UDPC.Send(se);
  end
  else if (re = 'Cant Play!')then
  begin
     Label6.Caption:='Cant Play!'
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Card[CardIdx].Visible:=False;
  Loss:=Loss + Card13V;
  Label8.Caption:=inttostr(Loss);
  se:='Next Round!';
  UDPC.Send(se);
end;

procedure TForm1.FormCreate(Sender: TObject);
var i: integer;
begin

  Button2.Visible:=False;
  Button3.Visible:=False;
  Clr[0]:=Clubs;Clr[1]:=Diamonds;Clr[2]:=Hearts;Clr[3]:=Spades;

  Card[0]:=Card1;Card[1]:=Card2;Card[2]:=Card3;Card[3]:=Card4;
  Card[4]:=Card5;Card[5]:=Card6;Card[6]:=Card7;Card[7]:=Card8;
  Card[8]:=Card9;Card[9]:=Card10;Card[10]:=Card11;Card[11]:=Card12;
  Card[12]:=Card13;Card[13]:=Card18;

  CardOnTable[0]:=Spade1;CardOnTable[1]:=Spade2;CardOnTable[2]:=Spade3;
  CardOnTable[3]:=Spade4;CardOnTable[4]:=Spade5;CardOnTable[5]:=Spade6;
  CardOnTable[6]:=Spade7;CardOnTable[7]:=Spade8;CardOnTable[8]:=Spade9;
  CardOnTable[9]:=Spade10;CardOnTable[10]:=Spade11;CardOnTable[11]:=Spade12;
  CardOnTable[12]:=Spade13;

  CardOnTable[13]:=Heart1;CardOnTable[14]:=Heart2;CardOnTable[15]:=Heart3;
  CardOnTable[16]:=Heart4;CardOnTable[17]:=Heart5;CardOnTable[18]:=Heart6;
  CardOnTable[19]:=Heart7;CardOnTable[20]:=Heart8;CardOnTable[21]:=Heart9;
  CardOnTable[22]:=Heart10;CardOnTable[23]:=Heart11;CardOnTable[24]:=Heart12;
  CardOnTable[25]:=Heart13;

  CardOnTable[26]:=Diamond1;CardOnTable[27]:=Diamond2;CardOnTable[28]:=Diamond3;
  CardOnTable[29]:=Diamond4;CardOnTable[30]:=Diamond5;CardOnTable[31]:=Diamond6;
  CardOnTable[32]:=Diamond7;CardOnTable[33]:=Diamond8;CardOnTable[34]:=Diamond9;
  CardOnTable[35]:=Diamond10;CardOnTable[36]:=Diamond11;CardOnTable[37]:=Diamond12;
  CardOnTable[38]:=Diamond13;

  CardOnTable[39]:=Club1;CardOnTable[40]:=Club2;CardOnTable[41]:=Club3;
  CardOnTable[42]:=Club4;CardOnTable[43]:=Club5;CardOnTable[44]:=Club6;
  CardOnTable[45]:=Club7;CardOnTable[46]:=Club8;CardOnTable[47]:=Club9;
  CardOnTable[48]:=Club10;CardOnTable[49]:=Club11;CardOnTable[50]:=Club12;
  CardOnTable[51]:=Club13;

  for i:=0 to 51 do
  begin
  CardOnTable[i].Visible:=False;
  end;

  Label9.Visible:=False;
  Label10.Visible:=False;

end;

procedure CardClick(CardNum: Integer);
var i: integer;
begin
  for i:=0 to 12 do
  begin
    if (Card[i].Visible = true)then
    begin
      Card[i].ShowDeck:=False;
    end;
  end;
  Card[CardNum].ShowDeck:=True;
  Card[13].Value:=Card[CardNum].Value;
  Card[13].Suit:=Card[CardNum].Suit;
  CardIdx:=CardNum;

  if (Card[13].Value=1) then
  begin Card13V:=1;end
  else if(Card[13].Value=2) then
  begin Card13V:=2;end
  else if(Card[13].Value=3) then
  begin Card13V:=3;end
  else if(Card[13].Value=4) then
  begin Card13V:=4;end
  else if(Card[13].Value=5) then
  begin Card13V:=5;end
  else if(Card[13].Value=6) then
  begin Card13V:=6;end
  else if(Card[13].Value=7) then
  begin Card13V:=7;end
  else if(Card[13].Value=8) then
  begin Card13V:=8;end
  else if(Card[13].Value=9) then
  begin Card13V:=9;end
  else if(Card[13].Value=10) then
  begin Card13V:=10;end
  else if(Card[13].Value=11) then
  begin Card13V:=11;end
  else if(Card[13].Value=12) then
  begin Card13V:=12;end
  else if(Card[13].Value=13) then
  begin Card13V:=13;end;

  if (Card[13].Suit = Spades) then
  begin Card13S:=4 end
  else if (Card[13].Suit = Hearts) then
  begin Card13S:=3 end
  else if (Card[13].Suit = Diamonds) then
  begin Card13S:=2 end
  else if (Card[13].Suit = Clubs) then
  begin Card13S:=1 end;

end;

procedure TForm1.Card1Click(Sender: TObject);
begin CardClick(0);end;

procedure TForm1.Card2Click(Sender: TObject);
begin CardClick(1);end;

procedure TForm1.Card3Click(Sender: TObject);
begin CardClick(2);end;

procedure TForm1.Card4Click(Sender: TObject);
begin CardClick(3);end;

procedure TForm1.Card5Click(Sender: TObject);
begin CardClick(4);end;

procedure TForm1.Card6Click(Sender: TObject);
begin CardClick(5);end;

procedure TForm1.Card7Click(Sender: TObject);
begin CardClick(6);end;

procedure TForm1.Card8Click(Sender: TObject);
begin CardClick(7);end;

procedure TForm1.Card9Click(Sender: TObject);
begin CardClick(8);end;

procedure TForm1.Card10Click(Sender: TObject);
begin CardClick(9);end;

procedure TForm1.Card11Click(Sender: TObject);
begin CardClick(10);end;

procedure TForm1.Card12Click(Sender: TObject);
begin CardClick(11);end;

procedure TForm1.Card13Click(Sender: TObject);
begin CardClick(12);end;



end.
