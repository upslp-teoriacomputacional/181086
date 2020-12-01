#!/usr/bin/perl

#/-----------------------------------------------\
#| 181086_turing_machine.pl                      |
#| Rodrigo Alejandro Ortiz Muñiz                 |
#| Universidad Politécnica de San Luis Potosí	 |
#| Profesor: Juan Carlos Gonzáles Ibarra         |
#| Descripción: Un programa para utilizar        |
#| una máquina de turing que divide              |
#\-----------------------------------------------/

#use strict;
#use warnings;

#"""
#Tpe
#Cabezal (apuntador,simboloa sobreescribir,izquierda-derecha-izquierda)
#Registro de estados
#Tabla de transiciones
#La maquina de turing tiene las caracteristicas de un Automata finito
#Q = Es un conjunto de estados
    #Σ = Alfabeto conjunto de caracteres (codigo utf-8 ="\u03A3")	
    #Γ = Simbolos de la cinta
    #s = Estado inicial sϵQ
    #δ= Reglas nde transicion (Codigo utf-8 = "\u03B4")
    #QxΣ->Q Reglas de transicion
    #bϵΓ = es un simbolo denominado blanco, que se puede repetir 
          #infinitamente en toda la cinta 
    #F⊆Q Estado finales o de aceptacion
#    
    #Q = {s,q1}
    #Σ = {a}	
    #Γ = {a,b}
    #s = Estado inicial q0ϵQ
    #δ= Reglas de transicion 
    ##Reglas de transicion
    #Q x Σ -> Q
    #((q0,a)->q1*)
    #(estado, valor) -> nuevo estado, nuevo valor, dirección)
    #(s,a)->q1,b,right
    #(q1,b)->--Valido--
    #"si estamos en el estado s leyendo la posición q1, donde hay 
#    escrito el símbolo 'a', entonces este símbolo debe ser reemplazado 
#    por el símbolo 'b', y pasar a leer la celda siguiente, a la derecha".
#    F⊆Q = {q1}
#   
#    Estructura gafica es un grafo dirigido que se conecta en los vertices 
#    con:
#        (lee el cabezal/
#        símbolo que escribirá el cabezal, 
#       movimiento del cabezal.)
#        (s,a)->q1,b,right
#        ('a',b,right)
#        
#"""





#def turing_M (state = None, #estados de la maquina de turing
#              blank = None, #simbolo blanco de el alfabeto dela cinta
#              rules = [],   #reglas de transicion
#              tape = [],    #cinta
#              final = None,  #estado valido y/o final
#              pos = 0)#posicion siguiente de la maquina de turing
#
#    st = state
#    if not tape: tape = [blank]
#    if pos <0 : pos += len(tape)
#    if pos >= len(tape) or pos < 0 : raise Error ("Se inicializa mal la posicion")
#    
 #   rules = dict(((s0, v0), (v1, dr, s1)) 
 #for (s0, v0, v1, dr, s1) in rules)

	my $state=none;
	my $blank=none;
	my @rules;
	my @tape=();
	#change values to change tape, current one doesn't work 
	@tape=(1,1,1,1,1,1,0,1,1,0);
	my $final=none;
	my $pos = 0;
	my $s0;
	my $v0;
	my $v1;
	my $dr;
	my $s1;
	
#in the end i didn't use this list. only as a guide.	
	@rules=
	([0,1,"B","R",1],[1,1,1,"R",1],[1,0,0,"R",2]
	,[2,"X","X","R",2],[2,1,"X","L",3],[3,"X","X","L",3]
	,[3,1,1,"L",3],[3,1,1,"L",3],[3,"B",1,"R",0]
	,[2,0,"B","L",6],[6,0,"B","L",6],[6,1,"B","L",6]
	,[6,"X","B","L",6],[6,"B","B","R",7],[7,"B","B","R",7]
	,[7,1,1,"R",8],[0,0,0,"R",4],[4,0,0,"R",4]
	,[4,1,1,"R",4],[4,"X","X","R",4],[4,"B",1,"L",5]
	,[5,"X","X","L",5],[5,1,1,"L",5],[5,0,0,"L",5]
	,[5,"B","B","R",0]);
	
sub turingM{
	#my ($state=NULL, $blank= NULL, @rules = (), @tape= (), $final=NULL, $pos=0) = @_;
	#my ($state, $blank, @rules, @tape, $final, $pos) = @_;
	#my $st = $state;
	#if($pos < 0){
	#	$pos += scalar @tape;
	#}
	my $lock=1;
	my $state=0;
	my $char;
	$char=@tape[0];
	my $i=0;
	$st=$state;
	while($lock==1){
		#$st=$state;
		print($st,"\t",@tape[$i],"\n");		
		#for $char (@tape){
			if($char == 1 and $state == 0){
				@tape[$i]="B";
				$char=@tape[$i];
				$i++;
				$state=1;
			}else{
				if($char == 0 and $state == 0){
				@tape[$i]=0;
				$char=@tape[$i];
				$i++;
				$state=4;
				}else{
					
					if($char == 1 and $state == 1){
					@tape[$i]=1;
					$char=@tape[$i];
					$i++;
					$state=1;
					}else{
						
						if($char == 0 and $state == 1){
						@tape[$i]=0;
						$char=@tape[$i];
						$i++;
						$state=2;
						}else{
							if($char eq "X" and $state == 2){
							@tape[$i]="X";
							$char=@tape[$i];
							$i++;
							$state=2;
							}else{
								
								if($char ==1 and $state == 2){
								@tape[$i]="X";
								$char=@tape[$i];
								$i--;
								$state=3;
								}else{
									
									if($char == 0 and $state == 2){
									@tape[$i]="B";
									$char=@tape[$i];
									$i--;
									$state=6;
									}else{
										
										if($char == 0 and $state == 3){
										@tape[$i]=0;
										$char=@tape[$i];
										$i--;
										$state=3;
										}else{
											if($char == 1 and $state == 3){
											@tape[$i]=1;
											$char=@tape[$i];
											$i--;
											$state=3;
											}else{
												if($char eq "X" and $state == 3){
												@tape[$i]="X";
												$char=@tape[$i];
												$i--;
												$state=3;
												}else{
													
													if($char eq "B" and $state == 3){
													@tape[$i]=1;
													$char=@tape[$i];
													$i++;
													$state=3;
													}else{
														
														if($char == 1 and $state == 6){
														@tape[$i]="B";
														$char=@tape[$i];
														$i--;
														$state=6;
														}else{
															
															if($char eq "X" and $state == 6){
															@tape[$i]="B";
															$char=@tape[$i];
															$i--;
															$state=6;
															}else{
																if($char == 0 and $state == 6){
																@tape[$i]="B";
																$char=@tape[$i];
																$i--;
																$state=6;
																}else{
																	
																	if($char=="B" and $state == 6){
																	@tape[$i]="B";
																	$char=@tape[$i];
																	$i++;
																	$state=7;
																	}else{
																		if($char eq "B" and $state == 7){
																			@tape[$i]="B";
																			$char=@tape[$i];
																			$i++;
																			$state=7;
																		}else{
																			if($char == 1 and $state == 7){
																			@tape[$i]=1;
																			$char=@tape[$i];
																			$i++;
																			$state=8;
																			$lock=0;
																			}else{
																				
																				if($char == 0 and $state == 4){
																					@tape[$i]=0;
																					$char=@tape[$i];
																					$i++;
																					$state=4;
																				}else{
																					
																					if($char == 1 and $state == 4){
																						@tape[$i]=1;
																						$char=@tape[$i];
																						$i++;
																						$state=4;
																					}else{
																						
																						if($char == 1 and $state == 4){
																							@tape[$i]=1;
																							$char=@tape[$i];
																							$i++;
																							$state=4;
																						}else{
																							
																								if($char eq "X" and $state == 4){
																									@tape[$i]="X";
																									$char=@tape[$i];
																									$i++;
																									$state=4;
																								}
																								else{
																									
																									if($char eq "X" and $state == 4){
																											@tape[$i]="X";
																											$char=@tape[$i];
																											$i++;
																											$state=4;
																										}else{
																											if($char eq "B" and $state == 4){
																											@tape[$i]=1;
																											$char=@tape[$i];
																											$i--;
																											$state=5;
																											}else{
																												
																												if($char == 0 and $state == 5){
																													@tape[$i]=0;
																													$char=@tape[$i];
																													$i--;
																													$state=5;
																												}else{
																													if($char == 1 and $state == 5){
																														@tape[$i]=1;
																														$char=@tape[$i];
																														$i--;
																														$state=5;
																													}else{
																														
																														if($char eq "X" and $state == 5){
																																@tape[$i]="X";
																																$char=@tape[$i];
																																$i--;
																																$state=5;
																															}else{
																																
																																if($char eq "B" and $state == 5){
																																	@tape[$i]="B";
																																	$char=@tape[$i];
																																	$i++;
																																	$state=0;
																																}
																																
																															}
																														
																													}
																												}
																												
																											}
																											
																										}
																									
																								}
																						}
																					}
																				}
																			}																				
																		}
																	}


																

																	
																}

															}

															
														}

													
													}												
													
												}
												
											}
									
										}
									

										
									}

									
								}
								
							}
							

						}
						
					}
					
					
				}
				
			}
				
		$st=$state;	
		#}
	}
	print ("\n\n",@tape);
	
	
	


	
}
turingM();
