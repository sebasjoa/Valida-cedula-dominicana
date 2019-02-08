unit Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ScrollBox,
  FMX.Memo, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    function ValidaCedula(Num:String): boolean;
    function ValidaRNC(Num:String): boolean;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}
const
    TablaCedula : Array[1..10] of Integer=(1,2,1,2,1,2,1,2,1,2);
    TablaRNC    : Array[1..8] of Integer=(7,9,8,6,5,4,3,2);

{ TForm2 }

procedure TForm2.Button1Click(Sender: TObject);
begin
  if length(edit1.Text) = 11 then
     ValidaCedula(edit1.text)
    else
  if length(edit1.Text) = 9 then
     ValidaRNC(edit1.text)
    else
     showmessage('Digito Invalido');

end;

function TForm2.ValidaCedula(Num: String): boolean;
type
  ArrayDe11=Array[1..11] of Integer;
var
 R       :ArrayDe11;
 Cedula  :ArrayDe11;
 I, a, b, Suma, Division,
 DigitoVerif:Integer;
 comodin : string;
begin
memo1.Lines.Clear;
result:=false;
Num  := StringReplace(num, '-', '',[rfReplaceAll]);
if Length(Num) = 11 then
  begin
    try
      for i:=1 to 11 do Cedula[i]:=StrToInt(Num[i]);
    except
      Exit;
    end;
   end
    else Exit;

Suma:=0;

for i:=1 to 10 do
  Begin
  R[i]:=Cedula[i]*TablaCedula[i];

  if length(inttostr(R[i])) > 1 then
     Begin
         a := strtoint(copy(R[i].ToString,0,1));
         b := strtoint(copy(inttostr(R[i]),2,1));
         comodin := ' > 1 ';
       end
      else
       Begin
         a := 0;
         b := strtoint(copy(inttostr(R[i]),0,1));
         comodin := ' <= 1 ';
       end;
        // Calcular la sumatoria de los resultados
       memo1.lines.add(Cedula[i].ToString+' x '+TablaCedula[i].ToString+' = '+R[i].ToString+comodin+' = '+(a+b).ToString );
       Suma:=Suma+a+b;
  end;
Division:=(Suma div 10)*10;
memo1.Lines.Add('Resultado = '+Suma.ToString);
memo1.Lines.Add('Recalculo = (('+Suma.ToString+' / 10) * 10) = '+Division.ToString );

if Division < Suma then
  begin
   memo1.Lines.Add('Verificador Si('+Division.ToString+' < '+Suma.ToString+') = ('+Division.ToString+' + 10) - '+Suma.ToString );
   Division := Division + 10;
  end
 else
  memo1.Lines.Add('Verificador ('+Division.ToString+' - '+Suma.ToString+') ' );

  DigitoVerif := Division - Suma;

  memo1.Lines.Add('DigitoVerif = '+DigitoVerif.ToString);

if DigitoVerif = Cedula[11] then
    result:=true;

  if result = true then
    Memo1.Lines.Add('CEDULA CORRECTA!!!!')
   else
    Memo1.Lines.Add('CEDULA INCORRECTA!!!!')


end;

function TForm2.ValidaRNC(Num: String): boolean;
type
  ArrayDe9=Array[1..9] of Integer;
var
 RNC     :ArrayDe9;
 I, Suma,
 Division,
 DigitoVerif:Integer;
begin
memo1.Lines.Clear;
result:=false;
Num  := StringReplace(num, '-', '',[rfReplaceAll]);
if Length(Num) = 9 then
  begin
    try
      for i:=1 to 9 do RNC[i]:=StrToInt(Num[i]);
    except
      Exit;
    end;
   end
    else Exit;

Suma:=0;
for i:=1 to 8 do
  Begin
    Suma:=Suma+(RNC[i]*TablaRNC[i]);
    memo1.lines.add(RNC[i].ToString+' x '+TablaRNC[i].ToString+' = '+(RNC[i] * TablaRNC[i]).ToString );
  end;

Division:=suma -((Suma div 11)*11);
memo1.Lines.Add('Resultado = '+Suma.ToString);
memo1.Lines.Add('Recalculo = ('+Suma.ToString+'-(('+Suma.ToString+' / 11) * 11) = '+Division.ToString );
memo1.Lines.Add('Verificador Si('+Division.ToString+' = 0) = 2 } ');
memo1.Lines.Add('            Si('+Division.ToString+' = 1) = 1 } ');
memo1.Lines.Add('           else ('+Division.ToString+' = 11 - '+Division.ToString);
if Division = 0 then
   DigitoVerif := 2
else if Division = 1 then
   DigitoVerif := 1
else
   DigitoVerif := 11 - Division;

memo1.Lines.Add('Digito Verificador = '+DigitoVerif.ToString);

if DigitoVerif = RNC[9] then
   result:=true;

 if result = true then
    Memo1.Lines.Add('RNC CORRECTO!!!!')
   else
    Memo1.Lines.Add('RNC INCORRECTO!!!!')

end;

end.
