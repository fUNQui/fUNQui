Feature: Pagina de crear torneos
	
	Como Administrador
	Quiero poder crear un torneo ingresando el nombre, fecha y comentario

	Scenario: Crear un torneo exitoso
		Given Estoy en la pagina de crear torneos
		When Ingreso el nombre del torneo "Torneo UNQ"
		And Ingreso la fecha "15/11/2014"
		And Ingreso un comentario "Gran torneo de futboll 5"
		And Apreto el boton crear
		Then Hay un torneo creado
		And Veo un mensaje de "Torneo creado"

	Scenario: Error al crear torneo por información faltante en el campo fecha
		Given Estoy en la pagina de crear torneos
		When Ingreso el nombre del torneo "Torneo UNQ"
		And Ingreso un comentario "Gran torneo de futboll 5"
		And Apreto el boton crear
		Then No hay un torneo creado
		And Veo un mensaje de "Todos los campos son requeridos"	

	Scenario: Error al crear torneo por información faltante en el campo nombre
		Given Estoy en la pagina de crear torneos
		And Ingreso la fecha "15/11/2014"
		And Ingreso un comentario "Gran torneo de futboll 5"
		And Apreto el boton crear
		Then No hay un torneo creado
		And Veo un mensaje de "Todos los campos son requeridos"	