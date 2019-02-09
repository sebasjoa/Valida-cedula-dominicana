# Validador de Cedulas Dominicanas (Certificado) | JAVA

_En este projecto se desarrolla la formula de como se hace la validacion correcta del documento de identidad electoral de Rep. Dominicana.
para uso de desarrollo Nacional_

## Comenzando 🚀

_Aqui hice el ejemplo en NetBeans con un JPanel para darle un aspecto grafico para la prueba, teniendo en cuenta que faltan las validaciones de lugar,
 como que solo admita numeros, que solo tenga un length maximo de 11 y ponerle el formato de cedula_


## Funcion Implementada 

_En el evento que se ejecuta en el boton hago la parametrizacion de lugar.
 Esta vez validando que el campo este lleno y que tenga 11 digitos.
 Este contiene el mismo engranaje de la formula principal._

```
if ("".equals(cedula.getText())) {
          JOptionPane.showMessageDialog(null,"Debe llenar el Campo de Cedula"); 	  
        } 
     else {
      if (cedula.getText().length() < 11) {
          JOptionPane.showMessageDialog(null,"La cedula Ha de tener al menos 11 Numeros"); 	  
      } else {
          //Aqui comienza la validacion de los parametros
          
            char[] caracteres = cedula.getText().toCharArray();
            
            int[] constante = {1,2,1,2,1,2,1,2,1,2};
            
            int up = 0, result = 0, ac = 0;
            String ab ;
            char [] oc;            

         for (int i = 0; i < 10; i++) {            
             
              up = Character.getNumericValue(caracteres[i]) * constante[i];                           
              if ( up >= 10 ) {                  
               ab = Integer.toString(up);
               oc = ab.toCharArray();
               up = Integer.parseInt(String.valueOf(oc[0])) + Integer.parseInt(String.valueOf(oc[1]));
              }              
              result = result + up;                       
            }
                ac = Character.getNumericValue((Integer.toString(result).toCharArray()[0] )) * 10;                
                //ac = parseInt(ac);
                ac = (ac / 10) * 10;                
                  if (ac < result ) {
                  ac = (ac + 10) - result; 
                  }  else {
                    ac = ac - result;
                  }

              if ( Character.getNumericValue(caracteres[10]) == ac) {            
                
                JOptionPane.showMessageDialog(null,"Cedula Correcta");         
                resultadolb.setText("Resultado : Cedula Correcta");
                
              } else {
                
                JOptionPane.showMessageDialog(null,"Cedula Incorrecta");         
                resultadolb.setText("Resultado : Cedula Incorrecta");
              }

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