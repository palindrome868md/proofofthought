; Question: Is the tibia necessary to win the Stanley Cup?
; Reasoning: We test if it's possible to win the Stanley Cup without having a tibia.
; If satisfiable (sat) = tibia is NOT necessary
; If unsatisfiable (unsat) = tibia IS necessary

; Declare sorts
(declare-sort Person 0)
(declare-sort BodyPart 0)
(declare-sort Award 0)
(declare-sort Role 0)

; Declare functions
(declare-fun has-body-part (Person BodyPart) Bool)
(declare-fun wins-award (Person Award) Bool)
(declare-fun has-role (Person Role) Bool)
(declare-fun is-player (Person) Bool)
(declare-fun requires-tibia-for-role (Role) Bool)

; Declare constants
(declare-const tibia BodyPart)
(declare-const stanley-cup Award)
(declare-const player-role Role)
(declare-const coach-role Role)
(declare-const owner-role Role)
(declare-const test-person Person)

; Knowledge Base

; Rule 1: Players need a tibia to play hockey
(assert (requires-tibia-for-role player-role))

; Rule 2: Coaches and owners don't need a tibia
(assert (not (requires-tibia-for-role coach-role)))
(assert (not (requires-tibia-for-role owner-role)))

; Rule 3: If a role requires tibia and person has that role, they need a tibia
(assert (forall ((p Person) (r Role))
  (=> (and (has-role p r) (requires-tibia-for-role r))
      (has-body-part p tibia))))

; Rule 4: To win Stanley Cup, you must have some role on the team
(assert (forall ((p Person))
  (=> (wins-award p stanley-cup)
      (or (has-role p player-role)
          (has-role p coach-role)
          (has-role p owner-role)))))

; TEST SCENARIO: Can someone win the Stanley Cup without a tibia?
; We assert they win the cup but don't have a tibia
(assert (wins-award test-person stanley-cup))
(assert (not (has-body-part test-person tibia)))

; Check satisfiability
; sat = Yes, it's possible (tibia NOT necessary)
; unsat = No, it's impossible (tibia IS necessary)
(check-sat)
(get-model)