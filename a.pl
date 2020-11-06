#!/usr/bin/perl

#/-----------------------------------------------\
#| 181086_palindromo.pl                           |
#| Rodrigo Alejandro Ortiz Muñiz                 |
#| Universidad Politécnica de San Luis Potosí	 |
#| Profesor: Juan Carlos Gonzáles Ibarra         |
#| Descripción: Un programa para determinar      |
#| Si una cadena introducida es un palínromo,    |
#| usando una estructura de datos                |
#\-----------------------------------------------/

#use strict;
#use warnings;

print "\n\n----PROGRAMA PARA DETECTAR PALINDROMOS----\n\n";
print "Introduce una cadena: ";
my $cadena = <STDIN>;
my $mid;
my $inversa;
my $first;
#this is the list i'll be using as a data structure
my @recipiente=();
my $copia="";

#eliminate spaces, if there's any
$cadena =~ s/ //g;
#eliminate the newline character present when taking the input
chomp($cadena);
#we need to validate that the string is longer than 2 characters and that it doesn't contain numbers
if(length($cadena)>2){
	if(($cadena =~ /[a-z]/ or $cadena =~ /[A-Z]/) and not ($cadena =~ /[0-9]/)){
		#we make everything lower case
		$cadena=lc $cadena;
		#copia will be the string where we perform every operation
		$copia = $cadena; 
		#in order to determin the half of the string we use %2
		if(length($copia)%2==0){
			$mid=length($copia)/2;
		}else{
			$mid=(length($copia)+1)/2;
		}
		#the first letter of copia is added into the list recipiente, 
		#this is repeated until reaching the middle of the string
		for(my $i=0;$i<$mid-1;$i++){
			$inversa=reverse($copia);
			$first=chop($inversa);	
			$copia=reverse($inversa);
			push(@recipiente,$first);
		}
		#in case there still exists a newline character 
		chomp($copia);
		#The characters from the list are added to the string last
		#last is the second half of the string, but reversed
		my $last=reverse($copia);
		for(my $i=$mid;$i>-1;$i--){
			$last.=@recipiente[$i];
		}			
		#we can conclude that if the string last is equal to the string cadena, 
		#then the string entered is a palindrome.
		if($last eq $cadena){
			print("\n- La cadena ingresada SI es un palindromo");
		}else{
			print("\n- La cadena ingresada NO es un palindromo");
		}
	}else{
		print("\n - Los palindromos solo deben contener letras");
	}
}else{
	print("\n - No tiene sentido analizar una cadena de 2 caracteres o menos");
}
print "\n\n";












#for(my $i=0;$i<$mid-1;$i++){
			#$inversa=reverse($copia);
			#$first=chop($inversa);	
			#$copia=reverse($inversa);
			#$recipiente.=$first;
		#}
		#if(length($cadena)%2==0){
			#$inversa=reverse($copia);
			#$first=chop($inversa);	
			#$copia=reverse($inversa);
		#}
		#chomp($copia);
		#chomp($recipiente);
		#my $last=reverse($copia);
		#if($last eq $recipiente){
			#print("\n- La cadena ingresada SI es un palindromo");
		#}else{
			#print("\n- La cadena ingresada NO es un palindromo");
		#}
