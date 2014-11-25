Feature: Pagina de eliminar torneo

    Como Aministrador
    Quiero Eliminar un equipo

    Background:
        Given Tengo un torneo creado con el nombre "Funqui"
        And Tengo un equipo en el torneo con el nombre "Boca" y jugadores "Lea Juli Tehuel" y dt "Pablo"

    Scenario: Eliminar el equipo
        Given Estoy en la pagina de los equipos del torneo "Funqui"
        When Hago click en eliminar
        Then no tengo un equipo con el nombre "Boca"
