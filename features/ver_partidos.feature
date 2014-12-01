Feature: Ver resultados de partido

Como: Administrador
Quiero: Tener una tabla con los resultados

  Background:
    Given Tengo un torneo "Funqui"

  Scenario: Con 3 partidos sin jugar
  	Given Estoy en la pagina de ver los torneos
  	And Tengo 3 partidos en dicho torneo con resultado "-"
  	When Apreto el link de ver partidos del torneo "Funqui"
    Then Estoy en la pagina de los resultados de los partidos del torneo "Funqui"
    And Veo la tabla con los tres partidos con resultado "-"

  Scenario: Con 3 partidos jugados
   	Given Estoy en la pagina de ver los torneos
    And Tengo 3 partidos en dicho torneo con resultado "1-1"
    When Apreto el link de ver partidos del torneo "Funqui"
    Then Estoy en la pagina de los resultados de los partidos del torneo "Funqui"
    And Veo la tabla con los tres partidos con resultado "1-1"