# Validador de Cedulas Dominicanas (Certificado) | DELPHI

_En este projecto se desarrolla la formula de como se hace la validacion correcta del documento de identidad electoral de Rep. Dominicana.
para uso de desarrollo Nacional_

## Comenzando 🚀

_Aqui hice el ejemplo en JAvaScript con un input para darle un aspecto grafico para la prueba, teniendo en cuenta que faltan las validaciones de lugar,
 como que solo admita numeros, que solo tenga un length maximo de 11 y ponerle el formato de cedula_


## Funcion Implementada 

_En la funcion ValidaCedula hago la parametrizacion de lugar pidiendo a cedula. 
 Este contiene el mismo engranaje de la formula principal._

```
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

```



### Formula Explicita 🔧

_Primero hay que saber la estructura de la cedula para entender como funciona la cedula.
Esta se compone de 11 Digitos_

```
402-0057193-9

**402**      Representa el codigo de area provincial
**0057193**  Representa el Numero siguiente de lote
**9**        Es el numero verificador 

```

_Entonces_
_La formula consiste en la adiccion del producto de cada digito por la constante indicada [1,2,1,2,1,2,1,2,1,2]_
_Es decir ..._

```
Var cedula = 40200571939
    constante = [1,2,1,2,1,2,1,2,1,2]

// Aqui se obtiene la adicion del producto de cada digitro por la constante
    for (i=0;i <10;i++){  
              producto =cedula[i] * constante[i];              
              if producto >= 10 {
                oc = producto[0]+producto[1]
              }else {
                oc = ab;
              }
            adicion = adicion + oc }

        verif1 = adicion[0] + '0'; //Aqui se parsea la adicion para obtener solo el valor de decena y se le agrega cero para que sea decena entero. ej. "adicion = 46 then verif1 = 40 "

        verif2 = (verif1 / 10) * 10; //Aqui se divide el verif1 entre 10 y se multiplica por 10, para evitar los decimales

            
            if (verif2 < adicion ) { // aqui se verifica si el valor obtenido es menor que la adicion 
            verif2 = (verif2 + 10) - adicion; 
            }   else {
              verif2 = verif2 - adicion;
            }


              // si el valor obtenido es igual al codigo verificador entonces la cedula es correcta y valida
              if (cedula[10] == verif2) {                             
                Cedula Valida ;
              } else {

                Cedula Valida ;                
              }    

```

## Autores / Agradecimientos ✒️

* **Plinio Alvarez** - *Trabajo Inicial/ Formula* - [Plinio Alvarez](https://gitlab.com/plinioalvarez)
* **Sebastian ALvarez** - *Documentación/ Transformacion* - [Sebastian Alvarez](https://github.com/sebasjoa)

---
Por [Sebastian Alvarez](http://sebasjoa.github.io) 😊