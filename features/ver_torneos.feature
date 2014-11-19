Feature: Pagina de ver torneos
   
    Como Administrador
    Quiero ver todos los torneos registrados

    Background:
        Given Tengo una lista con un torneo

    Scenario: Ver todos los torneos
        Given Estoy en la pagina de los torneos
        Then Veo la lista con todos los torneos registrados