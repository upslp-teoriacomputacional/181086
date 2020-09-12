#!/usr/bin/perl

#/-----------------------------------------------\
#| 181086_conjuntos.pl                           |
#| Rodrigo Alejandro Ortiz Muñiz                 |
#| Universidad Politécnica de San Luis Potosí	 |
#| Profesor: Juan Carlos Gonzáles Ibarra         |
#| Descripción: Un programa para utilizar        |
#| conjuntos y operaciones con conjuntos en Perl |
#\-----------------------------------------------/

use strict;
use warnings;

# /--------------------------------------------------------------\
# | Set::Scalar es un módulo de perl que se instala por separado |
# | incluye varias funcionalidades para trabajar con conjuntos   |
# | puede obtenerse en:                                          |
# |            https://metacpan.org/pod/Set::Scalar              |
# \--------------------------------------------------------------/

use Set::Scalar;

#definir tres conjuntos
my $A=Set::Scalar ->new(1,2,3,4,5);
my $B=Set::Scalar ->new(3,4,5,6,7);
my $C=Set::Scalar ->new();

print("el set A es: ",$A,"\n");
print("el set B es: ",$B,"\n");
print("el set C es: ",$C,"\n");

#Remover un elemento del set
sub quitar(){
	$A -> delete(2);
	print("El set A luego de eliminar: ",$A,"\n");
}

#Remover todos los elementos de un set
sub clear(){
	$A -> clear();
	print("El set A luego de eliminar todos sus elementos: ",$A,"\n");
}

#Copiar un set
sub copiar(){
	$B = $A->copy();
	print("El set A: ",$A," y el set B: ",$B,"\n");
}

#agregar un elemento a un set
sub agregar(){
	$B->insert(987);
	print("El nuevo set B: ",$B,"\n");
}

#operaciones con conjuntos

##Unión
sub union(){	
	print("La union de A y B: ",$A->union($B),"\n");
}

##Intersección
sub interseccion(){	
	print("La interseccion de A y B: ",$A->intersection($B),"\n");
}

##Diferencia
sub diferencia(){
	print("La diferencia de A y B: ",$A->difference($B),"\n");
}

##Diferencia simétrica
sub simetrica(){
	print("diferencia simetrica A B: ",$A->symmetric_difference($B),"\n");
	print("diferencia simetrica B A: ",$B->symmetric_difference($A),"\n");
	print("diferencia simetrica A C: ",$A->symmetric_difference($C),"\n");
	print("diferencia simetrica B C: ",$B->symmetric_difference($C),"\n");
}

# /------------------------------------------------------------------------------------------\
# | Para las de subconjunto y superconjunto utilicé estructuras if para poder imprimir algo  |
# | ya que Perl no imprime nada al realizarlo de un modo más apegado al código fuente	     |
# \------------------------------------------------------------------------------------------/

#Subconjunto
sub subconjunto(){
	if($A->is_subset($B)){
		print("A es subconjunto de B\n");
	}else{
		print("A no es subconjunto de B\n");
	}
	if($B->is_subset($A)){
		print("B es subconjunto de A\n");
	}else{
		print("B no es subconjunto de A\n");
	}
}

#Superconjunto
sub superconjunto(){
	if($B->is_superset($A)){
		print("B es superconjunto de A\n");
	}else{
		print("B no es superconjunto de A\n");
	}
	if($A->is_superset($B)){
		print("A es superconjunto de B\n");
	}else{
		print("A no es superconjunto de B\n");
	}
}

#utilizar las funciones creadas para comprobar que funcionen
quitar();
clear();
copiar();
agregar();
union();
interseccion();
diferencia();
simetrica();
subconjunto();
superconjunto();