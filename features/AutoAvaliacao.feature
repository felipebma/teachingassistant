Feature: Auto-Avaliação
	As a student
	I want to record my self-evaluation about my understanding of the learning goals
	so that I can keep track of my knowledge on the subject

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