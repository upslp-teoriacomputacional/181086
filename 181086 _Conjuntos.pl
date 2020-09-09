#!/usr/bin/perl
use strict;
use warnings;



#print "hello world\n";

#my @mascotas=qw(perro gato canario pez);

#print $mascotas[0];
#print $mascotas[1];
#print $mascotas[2];
#print $mascotas[3];

sub cardinalidad{
	return scalar @_;
}

my @A=qw(1 2 3);
print("el set A es: ",@A);
print ("\n");
my @B=qw(1 2 3 4 5);
#print (@B);
print("el set B es: ",@B);
#my @C=qw("hola mundo");
#print(@C);
print ("\n");
print ("la cardinalidad del conjunto A es: ",cardinalidad(@A));

