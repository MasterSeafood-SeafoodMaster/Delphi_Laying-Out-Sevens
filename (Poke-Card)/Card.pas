unit Card;

{
TCard component for Delphi 32 - Freeware.
Version 1.1 (26-9-97)
Copyright 1997 by Giulio Ferrari

This is Freeware. Feel free to improve the code and to use the component
as you like. Please share your Delphi components and support the
freeware concept.
I'm not responsible for any damage on your computer.

PROPERTIES
property Value;
   The value of the card, between 1 and 13 ( 11,12,13 are court cards;
   1 is the ace).
property Suit;
   The suit of the card (Hearts,Clubs,Diamonds,Spades).
property ShowDeck;
   If True shows the back of the card.
property DeckType;
   Select the type of deck that is shown if ShowDeck is True.

METHODS
procedure SetCard(CValue: Integer; CSuit: TShortSuit);
   Quickly set card's Value and Suit.
   e.g. Card1.SetCard(1,H);  // set card to Ace of Hearts
procedure Turn;
   Turn the card and show the deck, or viceversa.
procedure RandomCard;
   Randomly choose a card.
function DifferentFrom(FromCard: TCard): Boolean;
   Returns True if the card is different in Value or Suit
   from the specified one.
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TCardValue = 1..13;
  TCardSuit = (Spades,Diamonds,Clubs,Hearts);
  TShortSuit = (S,D,C,H);
  TDecks = (Standard1, Standard2, Fishes1, Fishes2,
           Beach, Leaves1, Leaves2, Robot,
           Roses, Shell, Castle, Hand);
  TCard = class(TGraphicControl)
  private
    FValue: TCardValue;
    FSuit: TCardSuit;
    FDeckType: TDecks;
    FShowDeck: Boolean;
    procedure WMSize(var Message: TWMSize); message WM_PAINT;
    procedure SetValue(Value : TCardValue);
    procedure SetSuit(Suit: TCardSuit);
    procedure SetShowDeck(ShowDeck: Boolean);
    procedure SetDeckType(DeckType: TDecks);
  protected
    property Height default 96;
    property Width default 71;
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure SetCard(CValue: Integer; CSuit: TShortSuit);
    procedure RandomCard;
    procedure Turn;
    function DifferentFrom(FromCard: TCard): Boolean;
  published
    property Value: TCardValue read FValue write SetValue;
    property Suit: TCardSuit read FSuit write SetSuit;
    property ShowDeck: Boolean read FShowDeck write SetShowDeck;
    property DeckType: TDecks read FDeckType write SetDeckType;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
  end;

procedure Register;

implementation

{$R CARDS.RES}

procedure Register;
begin
  // change here to set the palette page for the TCard component
  RegisterComponents('CWM_OBJ_01', [TCard]);
end;

constructor TCard.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Height := 96;
  Width := 71;
  FValue := 1;
  FSuit := Hearts;
  FDeckType := Standard1;
  FShowDeck := False;
  Randomize;
end;

destructor TCard.Destroy;
begin
  inherited Destroy;
end;                    

procedure TCard.WMSize(var Message: TWMSize); // No resizing allowed !
begin
  inherited;
  Width := 71;
  Height := 96;
end;

procedure TCard.SetValue(Value : TCardValue);
begin
  if Value<1 then Value := 1;
  if Value>13 then Value :=13;
  FValue := Value;
  Paint;
end;

procedure TCard.SetSuit(Suit: TCardSuit);
begin
  FSuit := Suit;
  Paint;
end;

procedure TCard.SetShowDeck(ShowDeck: Boolean);
begin
  FShowDeck := ShowDeck;
  Paint;
end;

procedure TCard.SetDeckType(DeckType: TDecks);
begin
  FDeckType := DeckType;
  Paint;
end;

procedure TCard.SetCard(CValue: Integer; CSuit: TShortSuit);
begin
  if (CValue>0) and (CValue<14) then Value := CValue;
  if CSuit in [C,H,S,D] then
    case CSuit of
      C: Suit := Clubs;
      H: Suit := Hearts;
      S: Suit := Spades;
      D: Suit := Diamonds;
    end;
end;

procedure TCard.Turn;
begin
  ShowDeck := not ShowDeck;
end;

procedure TCard.RandomCard;
var Rand: Integer;
begin
  Rand := Random(4)+1;
  if Rand=1 then FSuit := Hearts
  else if Rand=2 then FSuit := Clubs
  else if Rand=3 then FSuit := Spades
  else FSuit := Diamonds;
  Rand := Random(13)+1;
  FValue := Rand;
  Paint;
end;

function TCard.DifferentFrom(FromCard: TCard): Boolean;
begin
  if (FSuit <> FromCard.Suit)
  or (FValue <> FromCard.Value)
  then DifferentFrom := True
  else DifferentFrom := False;
end;

procedure TCard.Paint;
var CardBitmap: TBitmap;
    ResName: String;
begin
  CardBitmap := TBitmap.Create;
  if not ShowDeck then begin   // show selected card
    case FSuit of Hearts: ResName := 'H';
    Spades: ResName := 'S';
    Clubs: ResName := 'C';
    Diamonds: ResName := 'D';
    end;
    ResName := ResName+IntToStr(FValue);
  end
  else                         // show selected deck
    case DeckType of
    Standard1: ResName := 'STD1';
    Standard2: ResName := 'STD2';
    Fishes1: ResName := 'FISHES1';
    Fishes2: ResName := 'FISHES2';
    Beach: ResName := 'BEACH';
    Leaves1: ResName := 'LEAVES1';
    Leaves2: ResName := 'LEAVES2';
    Robot: ResName := 'ROBOT';
    Roses: ResName := 'ROSES';
    Shell: ResName := 'SHELL';
    Castle: ResName := 'CASTLE';
    Hand: ResName := 'HAND';
    end;
  // load bitmap from resources
  CardBitmap.LoadFromResourceName(HInstance,ResName);
  Canvas.Draw(0,0,CardBitmap);
  Canvas.Brush.Color := (Owner as TForm).Color;
  Canvas.FloodFill(0,0,clBlack,fsBorder);
  Canvas.FloodFill(70,0,clBlack,fsBorder);
  Canvas.FloodFill(0,95,clBlack,fsBorder);
  Canvas.FloodFill(70,95,clBlack,fsBorder);
  CardBitmap.Free;
end;

end.
