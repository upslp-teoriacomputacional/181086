#!/usr/bin/perl

#/-----------------------------------------------\
#| 181086_Demostracion.pl                        |
#| Rodrigo Alejandro Ortiz Muñiz                 |
#| Universidad Politécnica de San Luis Potosí	 |
#| Profesor: Juan Carlos Gonzáles Ibarra         |
#| Description: A program to construct truth     |
#| tables by using logical operators             |
#\-----------------------------------------------/

use strict;
use warnings;
my @booleanos =(0,1); 
#/--------------------------------------------------------------------------------------------------------\
#|note that perl doesn't have a specific boolean type, so i will need to use numbers instead              |
#|also, lists in perl are not a data structure, they are subexpressions/expressions in code and they are  |
#|typically assigned to an array                                                                          |
#\--------------------------------------------------------------------------------------------------------/

my $x;
my $y;
#we need these two variables in order to make the use of both for structures easier

#Truth table for OR 
print("\n\nTruth table for OR: \n");
print("| x\t| y\t| x or y|\n");
print('-------------------------');
print("\n");
for $x (@booleanos){
	for $y (@booleanos){
		print("| ",$x);
		print("\t| ");
		print($y);
		print("\t| ");
		print($x or $y);
		print("\t|\n");
	}
}
#/--------------------------------------------------------------------------------------------\
#| even though it might be cleaner and more efficient to print everything in one single line  |
#| i, however fint it easier to organize what i'm printing when doing it this way.            |
#\--------------------------------------------------------------------------------------------/

#Truth table for AND
print("\n\nTruth table for AND: \n");
print("| x\t| y\t| x or y|\n");
print('-------------------------');
print("\n");
for $x (@booleanos){
	for $y (@booleanos){
		print("| ",$x);
		print("\t| ");
		print($y);
		print("\t| ");
		print($x and $y);
		print("\t|\n");
	}
}

#Truth table for NOT
print("\n\nTruth table for NOT: \n");
print("| x\t| not x |\n");
print('-----------------');
print("\n");
for $x (@booleanos){
		print("| ",$x);
		print("\t| ");
		if((not $x)== 0){
			print(0);
		}else{
			print(not $x);
		}
		print("\t| \n");
}

#Truth table for ^ (exclusive OR or also XOR)
print("\n\nTruth table for ^ (XOR): \n");
print("| x\t| y\t| x or y|\n");
print('-------------------------');
print("\n");
for $x (@booleanos){
	for $y (@booleanos){
		print("| ",$x);
		print("\t| ");
		print($y);
		print("\t| ");
		print($x ^ $y);
		print("\t|\n");
	}
}

