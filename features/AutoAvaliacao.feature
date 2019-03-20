Feature: Auto-Avaliação
	As a student
	I want to record my self-evaluation about my understanding of the learning goals
	so that I can keep track of my knowledge on the subject
	
Feature: Auto-Avaliação
	As a professor
	I want to check how many and which were the discrepancies found on the self assessment grades 		and the given ones
	so that I can talk with the listed students about that discrepancy


Scenario: Adicionando autoavaliação corretamente
	Given I am at the “Auto-Avaliação” page
	And I am logged as “Student”
	And I see no grades on self-evaluation section for all of the learning goals
	When I add grade “MA” for all of the learning goals
	Then I’m at the “Auto-Avaliação” page
	And a pop-up appears confirming that the self-evaluation was completed successfully.
	And I am redirected to the “Auto-Avaliação”page
	And I see “MA” on self-evaluation section for all of the learning goals.

Scenario: Adicionando autoavaliação incorretamente
	Given I am at the “Auto-Avaliação” page
	And I am logged as “Student”
	And I see no grades on self-evaluation section for all of the learning goals
	When I add grade “MA” for “Entender conceitos de requisitos”
	And I add grade “MPA” for “Especificar requisitos com qualidade”
	Then I’m at the “Auto-Avaliação” page
	And a pop-up appears showing a Error message alerting that I didn’t fill all the grades
	And I am redirected to the “Auto-Avaliação”page
	And I see no grades on self assessment section for all of the learning goals
	
Scenario: Analisando discrepâncias na auto-avaliação
	Given I am at the “Avaliação” page
	And I am logged as “Professor”
	And the “Student”s “João Paulo”, “Luiz Henrique” and “Pedro Lucas” have achieved grades “MPA” 			for all of the 5 goals.
	And the “Student” “João Paulo” evaluated himself by giving him “MA” for “Entender conceitos de 			requisitos” and “MPA” for all the others
	And the “Student” “Luiz Henrique” evaluated himself by giving him “MANA” for all of his 5 goals
	And the “Student” “Pedro Lucas” evaluated himself by giving him “MPA” for all of his 5 goals
	When I ask the system for the list of discrepancies
	Then I’m at the “Auto-Avaliações Discrepancies” page
	And I see that there was no discrepancies
	And I see “0%” on discrepancies percentage
	And I see no “Student”s on discrepant students list	
	
Scenario: Analisando discrepâncias na auto-avaliação
	Given I am at the “Avaliação” page
	And I am logged as “Professor”
	And the “Student”s “João Paulo”, “Luiz Henrique” and “Pedro Lucas” have achieved grades “MPA” 			for all of the 5 goals.
	And the “Student” “João Paulo” evaluated himself by giving him “MA” for all of his 5 goals
	And the “Student” “Luiz Henrique” evaluated himself by giving him “MANA” for all of his 5 goals
	And the “Student” “Pedro Lucas” evaluated himself by giving him “MPA” for all of his 5 goals
	When I ask the system for the list of discrepancies
	Then I’m at the “Auto-Avaliações Discrepancies” page
	And I see that there was “1” discrepancies
	And I see “33,33%” on discrepancies percentage
	And I see “João Paulo” on discrepant students list
