## Programa de Perl para realizar operaciones con conjuntos
  <li>En este código declaro tres conjuntos para posteriorente realizar operaciones con ellos, tales como la union, la intersección, o la diferencia simétrica.</li>
  <li> - Algo a considerar es que para la correcta ejecución de este código es necesario utilizar un módulo externo de Perl que se instala por separado de la instalación regular de Perl. El módulo se llama Set::Scalar</li>
  Obtener Set::Scalar <a href="https://metacpan.org/pod/Set::Scalar" target="\_blank"> (CPAN's Set::Scalar official page).

#### Conjuntos
#### (Última actualización: 13-09-2020)
Con la inclusión de Set::Scalar en Perl, la utilización de conjuntos se vuelve trivial y existen varias funcionalidades que podemos utilizar de un modo realmente sencillo. 
Aunque existen otros métodos de trabajar conjuntos tales como los llamados hashes, realizar las operaciones requeridas se volvería innecesariamente complicado.

##### Instalación de Set::Scalar:
Para poder instalar el módulo Set::Scalar en Perl solamente es necesario el acceso a una consola de comandos.
En windows al abrir la consola hay que dirigirse a C:\Perl64\bin y utilizar  comando:

```cmd
cpan install Set::Scalar
```
Teniendo en cuenta que las mayúsculas y minúsculas son importantes.

Dependiendo de la configuración de internet que tengamos, particularmente el proxy, esto podría fallar.
La solución que encontré en caso de que sea así es descargar manualmente el módulo (en https://metacpan.org/pod/Set::Scalar) y descomprimir los archivos contenidos en el .tar.gz en C:\Perl64\lib según corresponda con las carpetas del archivo descargado
Una vez hecho esto pude utilizar el módulo añadiendo

```perl
use Set::Scalar;
```
Al inicio del código.

##### Uso de los conjuntos en Perl:

Lo primero que se debe de hacer es declarar el conjuntos

```perl
my $conjuntoA = Set::Scalar -> new (1,2,3);
```
Esa instrucción estaría generando un conjunto llamado conjuntoA cuyos elementos son 1, 2 y 3

Si es necesario manipular los conjuntos se puede hacer con las siguientes instrucciones:

```perl
$conjuntoA -> delete(2); #esta instrucción eliminará el elemento 2 del conjunto, sus elementos serían {1,3}

$conjuntoA -> clear(); #esta instrucción elimina todos los elementos del conjunto

$conjuntoA = conjuntoB -> copy(); #esta instrucción copia todo el contenido del conjuntoB y lo pega al conjuntoA, sobreescribiéndolo

$conjuntoA -> insert(9); #inserta el elemento 9 en el conjuntoA

```

Para imprimir el conjunto basta con utilizar un simple
```perl
print($conjuntoA);
```

#### Operaciones con conjuntos en Perl:

Algunas de las operaciones con conjuntos que nos es posible realizar en Perl son la unión, la intersección, la diferencia y la deferencia simétrica 
También es posible determinar si un conjunto es subconjunto o superconjunto de otro conjunto.
```perl
$conjuntoA -> union($conjuntoB);  # unión del conjuntoA y el conjuntoB

$conjuntoA -> intersection($conjuntoB);  #intersección del conjuntoA con el conjuntoB

$conjuntoA -> difference($conjuntoB);  #la diferencia entre el conjuntoA y el conjuntoB

$conjuntoA -> symmetric_difference($conjuntoB);  #la diferencia simétrica entre el conjuntoA y el conjuntoB
```

Para determinar si un conjunto es subconjunto o superconjunto de otro:
```perl

$conjuntoA -> is_subset($conjuntoB); # indica si el conjuntoA es un subconjunto del conjuntoB

$conjuntoA -> is_superset($conjuntoB); # indica si el conjuntoA es un superconjunto del conjuntoB

```

Algo que considerar es que en los casos del subconjunto y superconjunto lo que la función nos regresará como valor será un booleano,
Sin embargo tuve problemas mostrando esto en pantalla utilizando Perl, en otro lenguaje, incluyendo python o java simplemente mostraría TRUE o FALSE
pero en Perl, esto no ocurrió. 
Para solucionar este problema utilicé estructuras condicionales IF en el código para mostrar un mensaje en pantalla en caso de que devuelvan true o que devuelvan false

#### Nota: 

Al final del código simplemente se usan las funciones previamente desarrolladas con el propósito de verificar su funcionamiento
pueden comentarse y descomentarse según convenga para observar la manera en la que cada una se ejecuta.


## Información

Universidad Politécnica de San Luis Potosí <p>
Escrito por: Rodrigo Alejandro Ortiz Muñiz - 181086 <p>
Profesor: Juan Carlos Gonzáles Ibarra <p>
Materia: Teoría computacional. <p>


## License
[MIT](https://choosealicense.com/licenses/mit/)
