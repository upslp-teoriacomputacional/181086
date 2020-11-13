#!/usr/bin/perl

#/-----------------------------------------------\
#| 181086_pda.pl                                 |
#| Rodrigo Alejandro Ortiz Muñiz                 |
#| Universidad Politécnica de San Luis Potosí	 |
#| Profesor: Juan Carlos Gonzáles Ibarra         |
#| Descripción: Un programa para utilizar        |
#| y crear un autómata de pila que cumpla la     |
#| expresión anbn                                |
#\-----------------------------------------------/

#use strict;
#use warnings;
#it starts essentially the same as the NFA program, except we use other global variables such as a or b, which will be counters.
our $simbolo = "";
our $Fin = "";
our $estado = 0;
our $a=0;
our $b=0;
our @pila=(" ");
#it is necessary for us to use this variables in a global scale

sub encabezado{
	print("\n|  Edo. Actual	|Caracter| Simbolo 	| Edo. Sig   | ");
	body();
}	
sub contenido{
	my ($estadosig, $character, $simbolo, $estado) = @_;
	print ("\n|	",$_[0],"	| ",$_[1],"	 | ",$_[2],"		|  ",$_[3],"	     | ",@pila);
	body();
}
sub body{
	print("\n+---------------+--------+--------------+------------+");
}


#Notice how we elevate each counter to count each letters' instances, also we start poping when we start using b's
sub caracter{
	$simbolo = "";
	$Fin = "";
	my ($char)=@_;	
	if($_[0] =~/a/){	
		$simbolo = "a";
		$a++;
		return 0;
	}else{
		if($_[0]=~/b/){
				$simbolo = "b";
				pop @pila;
				$b++;
				return 1;
		}
		else{	# if it's neither a nor b the character will not be valid
				$simbolo = "No valido";
				return 2;
				exit();
		}
	}
	
}
#MAIN
my @tabla= ([0,1,2],[1,2,2],[2,2,2]);
my $estado=0;
$simbolo="";
print ("+-------------------------------------+\n|    Ingrese una cadena a evaluar:    |\n+-------------------------------------+");
print("\n");
my $cadena = <STDIN>;
chomp $cadena;
my @chararray = split //,$cadena;
body();
encabezado();
print("\n|	",$estado,"       |Epsilon |              |  ",$estado,"	     |");
body();
#we add an element to the pile to be able to represent when it fills and when it pops
for my $character (@chararray){	
	my $estadosig = $estado;	
	push(@pila," X ");
	my $charcaracter=caracter($character);	
	$estado=$tabla[$estado][$charcaracter];	
	if($charcaracter==2){
		print("\n|       ",$estadosig,"       | ",$character,"      | ",$simbolo,"		|  ",$estado,"         |");
		body();
		print("\n|              Cadena No Valida                    :(|\n+----------------------------------------------------+");
        exit();
	}
	if($charcaracter==1){
		pop @pila;
	}
	contenido($estadosig,$character,$simbolo,$estado);
}


if($a != $b){
	print("\n|	",$estado,"       |        |Fin de Cadena |            |");
    body();
    print("\n|                Cadena NO Valida                    |\n+----------------------------------------------------+");
}

#it can end on basically every state, at least in a way that made sense to me. also, since the expression is anbn, n being the quantity, the amount of a's and b's has to be the same
if(($estado==1 or $estado==2 or $estado==0) and $a==$b){
    print("\n|	",$estado,"        |        |Fin de Cadena |            |");
    body();
    print("\n|                Cadena Valida                       |\n+----------------------------------------------------+");
}



