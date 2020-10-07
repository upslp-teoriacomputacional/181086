#!/usr/bin/perl

#/-----------------------------------------------\
#| 181086_conjuntos.pl                           |
#| Rodrigo Alejandro Ortiz Muñiz                 |
#| Universidad Politécnica de San Luis Potosí	 |
#| Profesor: Juan Carlos Gonzáles Ibarra         |
#| Descripción: Un programa para utilizar        |
#| y crear un autómata finito determinista       |
#\-----------------------------------------------/

#use strict;
#use warnings;
#in this program is not necessary to use an external module, what in python is re.match in perl can be accomplished by using =~

our $simbolo = "";
our $Fin = "";
our $estado = 0;
#it is necessary for us to us this two variables in a global scale

sub caracter{
	$simbolo = "";
	$Fin = "";
	my $digito = "^[0-9]\$";
	my ($char)=@_;	
	#we need to be extremely careful with the way we write what we're matching, otherwise this will not work at all and we will suffer
	if($_[0] =~ m/$digito/){	
		$simbolo = "Digito";
		return 0;
	}else{
		#this bit is extremely difficult because you need to get the amount of / and \ just right, this is so the syntax recognices +, -, * and / as characters and not metacharacters
		if($_[0]=~/\+|\-|\*|\//){
		#as it comes in the source code, i couldnt make the variable $operador = \+|\-|\*|\/ work, 
		#therefore i just put that in to match instead of the variable.
				$simbolo = "Operador";
				return 1;
		}
		else{
			if($char eq $Fin){
				return 2;
			}else{
				#i found out that we needed to implement a second else returning 1 and making estado = 3 so that the value taken from the table is an E and know that the string is invalid.
				$estado = 3;
				$simbolo = "No valido";
				return 1	;
			}
		}
	}
	
}
#this three subroutines are the ones that print on screen the content of our table, and its borders and lines
sub encabezado{
	print("\n|  Edo. Actual	|Caracter| Simbolo 	| Edo. Sig   | ");
	body();
}
sub contenido{
	my ($estadosig, $character, $simbolo, $estado) = @_;
	print ("\n|	",$_[0],"	| ",$_[1],"	 | ",$_[2],"	|  ",$_[3],"	     | ");
	body();
}
sub body{
	print("\n+---------------+--------+--------------+------------+");
}


#MAIN
#tabla is a bidimentional array, if i understood correctly, this will determine if the state is valid or if it's E which in this case is invalid
my @tabla= ([1,"E","E"],["E",2,"E"],[3,"E","E"],["E","E","A"]);
#my $estado=0;
$simbolo="";
print ("+-------------------------------------+\n|    Ingrese una cadena a evaluar:    |\n+-------------------------------------+");
print("\n");
my $cadena = <STDIN>;
#since using STDIN as a means to get an input also counts the newline character, i had to use chomp to remove that character. otherwise the table would look extremely ugly 
chomp $cadena;
#for the next for to work, we need to have an array of characters instead of a string, split // manages to do just that.
my @chararray = split //,$cadena;
body();
encabezado();

#this will go through each character of the array, thus making the use of the caracter subroutine viable.
#also, this will asign the values of each variable we use accordingly 
for my $character (@chararray){	
	my $estadosig = $estado;	
	my $charcaracter=caracter($character);	
	$estado=$tabla[$estado][$charcaracter];		
	if($estado eq "E"){
		print("\n|       ",$estadosig,"       | ",$character,"      | ",$simbolo,"	|  ",$estado,"         |");
		body();
		print("\n|              Cadena No Valida :'v                  |\n+----------------------------------------------------+");
        exit();
	}
	contenido($estadosig,$character,$simbolo,$estado);
}

#this will make it so that if the string is longer or shorter than it needs to be, it becomes a non valid string for the dfa  
if($estado!=3){
        print("\n|              Cadena No Valida :(		     |\n+----------------------------------------------------+");
}
#this makes it so that if the string is exactly long enough to reach state 3, it's valid
if($estado==3){
    print("\n|	",$estado,"       |        |Fin de Cadena |            |");
    body();
    print("\n|                Cadena Valida                       |\n+----------------------------------------------------+");
}

