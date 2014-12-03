Feature: Ingresar resultado de un partido

 Como Administrador
 Quiero ingresar el resultado de un partido


 Background:
 	Given Tengo un torneo "fUNQui"
 	And Tengo tres partidos

 Scenario: Ingresar resultado 0-0 al primer partido
 	Given Estoy en la pagina de los partidos del torneo "fUNQui"
 	When Apreto el boton ingesar resultado
 	And Ingreso como resultado del primer partido "0-0"
 	And Aprieto Submit
 	Then El resultado del primer partido es "0-0"

 Scenario: Ingresar resultado 2-0 al segundo partido
 	Given Estoy en la pagina de los partidos del torneo "fUNQui"
 	When Apreto el boton ingesar resultado
 	And Ingreso como resultado del segundo partido "2-0"
 	And Aprieto Submit
 	Then El resultado del segundo partido es "2-0"

 Scenario: Ingresar resultado 0-2 al tercer partido
 	Given Estoy en la pagina de los partidos del torneo "fUNQui"
 	When Apreto el boton ingesar resultado
 	And Ingreso como resultado del tercer partido "0-2"
 	And Aprieto Submit
 	Then El resultado del terccer partido es "0-2"