Feature: Ver resultados de partido

Como: Administrador
Quiero: Tener una tabla con los resultados

  Background:
    Given Tengo un torneo "Funqui"
    And Tengo 3 partidos en dicho torneo

  Scenario: Con 3 partidos sin jugar
  	Given Estoy en la pagina de ver los torneos
  	When Apreto el link de ver partidos del torneo "Funqui"
    Then Estoy en la pagina de los resultados de los partidos del torneo "Funqui"
    And Veo la tabla con los tres partidos con resultado "-"