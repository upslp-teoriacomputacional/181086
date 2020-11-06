## Palindromes
### (Last updated: 05-11-2020)
The objective of the programm is to validate if a string is a palindrome, we accomplish this by using a data structure, for example, a list.


#### Program to validate a palindrome
  <p>A palindrome is a word or a phrase that is exactly the same if you reverse it's characters. 
	Luckyly for us, perl uses some functions that come in handy when doing something like this, for example reverse, chop and chomp. those functions can make everything much easier, reverse will arrange the characters in the oposite order, chop will remove the first character from the string, and chomp removes the newline character from the string.
	<p> What i did was to put the characters of the string entered up to the middle of it, into a list, then, the new string (which is basically the second half of the original one), gets reversed. I then proceed to add the characters from the list to the reversed half string, the elements from the list are extracted in a LIFO fashion (last in, first out).
	<p> as a final step, i compare both strings, the original one, and the one where we made all our operations. if they are equal, then it's a palindrome.
  

#### uderstanding the logic:

I got a little lost when making this program, particularly in how to properly implement the list. I made this sort of "prototype" which doesn't use lists, in order to understand better what i was doing. Later on i made the modifications needed to properly include a list
```perl
for(my $i=0;$i<$mid-1;$i++){
	$inversa=reverse($copia);
	$first=chop($inversa);	
	$copia=reverse($inversa);
	$recipiente.=$first;
}
if(length($cadena)%2==0){
	$inversa=reverse($copia);
	$first=chop($inversa);	
	$copia=reverse($inversa);
}
chomp($copia);
chomp($recipiente);
my $last=reverse($copia);
if($last eq $recipiente){
	print("\n- La cadena ingresada SI es un palindromo");
}else{
	print("\n- La cadena ingresada NO es un palindromo");
}
```
As noted, this code is the first version of the second half of the program.
It does almost the same, I only used it as my own handmade guide to what the program should do in its final state

#### Other issues
I found that when you ask for an input on perl, say, for a string, the newline character actually makes it into the string.
This was causing me a lot of issues when comparing strings. The solution is to use chomp
```perl
chomp($string);
```
this will eliminate the newline character from the string.

## Information

Universidad Politécnica de San Luis Potosí
Written by: Rodrigo Alejandro Ortiz Muñiz - 181086
Professor: Juan Carlos Gonzáles Ibarra
Assignature: Teoría computacional.


## License
[MIT](https://choosealicense.com/licenses/mit/)
