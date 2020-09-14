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

#Pertenencia
sub pertenencia(){
	my $A = Set::Scalar -> new(1,2,3,4,5);
	#1 en A
	if($A->has(1)){
		print("1 pertenece al conjunto A\n");
	}else{
		print("1 no pertenece al conjunto A\n");
	}
	#10 en A
	if($A->has(10)){
		print("10 pertenece al conjunto A\n");
	}else{
		print("10 no pertenece al conjunto A\n");
	}
}

#Convertir a un conjunto
sub transformar(){
	my @A = (1,2,3); #arreglo
	my $ConjuntoA = Set::Scalar -> new(@A); #conjunto
	print("El conjunto A es: ",$ConjuntoA,"\n");
	my @B = (1,2,3,4,5);
	my $ConjuntoB = Set::Scalar -> new(@B);
	print("El conjunto B es: ",$ConjuntoB,"\n");
	my @C="hola mundo";
	my $ConjuntoC = Set::Scalar -> new(@C);
	print("El conjunto C es: ",$ConjuntoC,"\n");
}

#Remover un elemento del set
sub quitar(){
	my $A=Set::Scalar -> new(0,1,2,3,4,5);
	$A -> delete(2);
	print("El set A luego de eliminar: ",$A,"\n");
}

#Remover todos los elementos de un set
sub clear(){
	my $A=Set::Scalar -> new(0,1,2,3,4,5);
	$A -> clear();
	print("El set A luego de eliminar todos sus elementos: ",$A,"\n");
}

#Copiar un set
sub copiar(){
	my $A=Set::Scalar -> new(0,1,2,3,4,5);
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
	my $A=Set::Scalar -> new(1,2,3,4,5);
	my $B=Set::Scalar -> new(3,4,5,6,7);
	print("La union de A y B: ",$A->union($B),"\n");
}

##Intersección
sub interseccion(){	
	my $A=Set::Scalar -> new(1,2,3,4,5);
	my $B=Set::Scalar -> new(3,4,5,6,7);
	print("La interseccion de A y B: ",$A->intersection($B),"\n");
}

##Diferencia
sub diferencia(){
	my $A=Set::Scalar -> new(1,2,3,4,5);
	my $B=Set::Scalar -> new(3,4,5,6,7);
	print("La diferencia de A y B: ",$A->difference($B),"\n");
}

##Diferencia simétrica
sub simetrica(){
	my $A=Set::Scalar -> new(1,2,3,4,5);
	my $B=Set::Scalar -> new(3,4,5,6,7);
	print("diferencia simetrica A B: ",$A->symmetric_difference($B),"\n");
	print("diferencia simetrica B A: ",$B->symmetric_difference($A),"\n");
	print("diferencia simetrica A C: ",$A->symmetric_difference($C),"\n");
	print("diferencia simetrica B C: ",$B->symmetric_difference($C),"\n");
}

# /------------------------------------------------------------------------------------------\
# | Para las de subconjunto y superconjunto utilicé estructuras if para poder imprimir algo  |
# | ya que Perl no imprime true ni false al realizarlo de un modo más apegado al código      |
# | fuente, solamente imprime un 1 si es lógicamente correcto y nada si es incorrecto        |
# \------------------------------------------------------------------------------------------/

#Subconjunto
sub subconjunto(){
	my $A=Set::Scalar -> new(1,2,3,4,5);
	my $B=Set::Scalar -> new(0,1,2,3,4,5,6,7,8,9);
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
	my $A=Set::Scalar -> new(1,2,3,4,5);
	my $B=Set::Scalar -> new(0,1,2,3,4,5,6,7,8,9);
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
pertenencia();
transformar();
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
