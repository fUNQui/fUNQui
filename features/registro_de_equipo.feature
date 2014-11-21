Feature: Pagina de registrar equipo en un torneo

	Como Administrador
	Quiero poder registrar un equipo en un torneo

	Background:
        Given Tengo un torneo

	Scenario: Equipo registrado exitosamente
		Given Estoy en la pagina de registro de equipo
		When Ingreso el nombre del equipo "Sacachispas"
		And Ingreso el director tecnico "Leandro"
		And Ingreso los jugadores "Juan Nico Santi Esteban Ari"
		And Apreto el boton crear equipo
		Then Veo un mensaje que dice "El equipo Sacachispas fue creado exitosamente"

	Scenario: Falla al registrar el equipo, el equipo ya existe
		Given Estoy en la pagina de registro de equipo
		When Ingreso el nombre del equipo "Sacachispas"
		And Ingreso el director tecnico "Leandro"
		And Ingreso los jugadores "Juan Nico Santi Esteban Ari"
		And Apreto el boton crear equipo
		Then Veo un mensaje que dice "El equipo Sacachispas ya fue registrado"

	# Scenario: Fallo al registrar un equipo, no se completo el campo nombre de equipo
	# 	Given Estoy en la pagina de registro de equipo
	# 	When Ingreso el director tecnico "Leandro"
	# 	And Ingreso los jugadores "Juan Nico Santi Esteban Ari"
	# 	And Apreto el boton crear equipo
	# 	Then Veo un mensaje que dice "Error"

	# Scenario: Fallo al registrar un equipo, no se completo el campo director tecnico
	# 	Given Estoy en la pagina de registro de equipo
	# 	When Ingreso el nombre del equipo "Sacachispas"
	# 	And Ingreso los jugadores "Juan Nico Santi Esteban Ari"
	# 	And Apreto el boton crear equipo
	# 	Then Veo un mensaje que dice "Error"

	# Scenario: Fallo al registrar un equipo, no se completo el campo jugadores
	# 	Given Estoy en la pagina de registro de equipo
	# 	When Ingreso el nombre del equipo "Sacachispas"
	# 	And Ingreso el director tecnico "Leandro"
	# 	And Apreto el boton crear equipo
	# 	Then Veo un mensaje que dice "Error"
