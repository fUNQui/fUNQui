Feature: Pagina de crear torneo
	
	Como Administrador
	Quiero crear un torneo ingresando el nombre, fecha, lugar y comentario (puede estar o no)

	Scenario: Crear un torneo exitoso
		Given Estoy en la pagina de crear torneos
		When Ingreso el nombre del torneo "Torneo UNQ"
		And Ingreso la fecha "15/11/2014"
		And Ingreso el lugar "Palermo"
		And Ingreso un comentario "Gran torneo de futboll 5"
		When Apreto el boton crear
		Then Hay un torneo creado
		And Veo un mensaje de "Torneo creado"

	Scenario: Error al crear torneo por información faltante en el campo fecha
		Given Estoy en la pagina de crear torneos
		When Ingreso el nombre del torneo "Torneo UNQ"
		And Ingreso el lugar "Palermo"
		And Ingreso un comentario "Gran torneo de futboll 5"
		When Apreto el boton crear
		Then No hay un torneo creado

	Scenario: Error al crear torneo por información faltante en el campo nombre
		Given Estoy en la pagina de crear torneos
		When Ingreso el nombre del torneo "Torneo UNQ"
		And Ingreso la fecha "15/11/2014"
		And Ingreso un comentario "Gran torneo de futboll 5"
		When Apreto el boton crear
		Then No hay un torneo creado

	Scenario: Error al crear torneo por información faltante en el campo lugar
		Given Estoy en la pagina de crear torneos
		And Ingreso la fecha "15/11/2014"
		And Ingreso el lugar "Palermo"
		And Ingreso un comentario "Gran torneo de futboll 5"
		When Apreto el boton crear
		Then No hay un torneo creado	
