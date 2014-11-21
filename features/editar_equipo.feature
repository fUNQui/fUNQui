Feature: Pagina de editar torneo

	Como Aministrador
	Quiero Modificar un equipo

	 Background:
	 	Given Tengo un torneo creado con el nombre "Funqui"
	 	And Tengo un equipo en el torneo con el nombre "Boca" y jugadores "Lea Juli Tehuel" y dt "Pablo"

	Scenario: Modificar el nombre de un equipo
		Given Estoy en la pagina de los equipos del torneo "Funqui"
		When Hago click en editar
		Then Modifico el campo nombre por "Saca chispas"
		And Hago click en guardar
		Then Tengo un equipo con el nuevo nombre "Saca chispas"
		And Veo un mensaje de "Equipo editado"

	Scenario: Modificar los jugadores de un equipo
		Given Estoy en la pagina de los equipos del torneo "Funqui"
		When Hago click en editar
		Then Modifico el campo jugadores por "Julian Leandro Tehuel"
		And Hago click en guardar
		Then Tengo un equipo con los nuevos jugadores "Julian Leandro Tehuel"
		And Veo un mensaje de "Equipo editado"

	Scenario: Modificar el dt de un equipo
		Given Estoy en la pagina de los equipos del torneo "Funqui"
		When Hago click en editar
		Then Modifico el campo dt por "Dt Pablo"
		And Hago click en guardar
		Then Tengo un equipo con el nuevo dt "Dt Pablo"
		And Veo un mensaje de "Equipo editado"