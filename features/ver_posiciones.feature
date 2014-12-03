Feature: Ver posiciones

	Como Administrador
	Quiero ver la tabla de posiciones

	Background: 
		Given Tengo un torneo "Funqui"
		And Tengo tres partidos con los equipos "River", "Boca" y "Lanus"

	Scenario: Ver tabla de posiciones
		Given Estoy en la pagina de los partidos del torneo "Funqui"
		When Apreto el boton ingesar resultado
 		And Ingreso como resultado del primer partido "3-0"
 		And Aprieto Submit
 		And Ingreso como resultado del segundo partido "1-1"
 		And Aprieto Submit
 		And Ingreso como resultado del tercer partido "0-0"
 		And Aprieto Submit
 		Then Estoy en la pagina de los torneos
		When Aprieto el boton de "ver posiciones"
		Then Veo al primer equipo "River"
		And Veo al segundo equipo "Boca"
		And Veo al tercer equipo "Lanus"