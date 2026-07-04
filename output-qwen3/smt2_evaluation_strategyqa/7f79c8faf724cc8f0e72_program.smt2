; Question: Could Robert Wadlow hypothetically see Frankenstein's monster's bald spot from above?
; This tests if the scenario is POSSIBLE (sat = yes, unsat = no)

; Declare sorts
(declare-sort Entity 0)

; Declare functions
(declare-fun height (Entity) Int)  ; Height in centimeters
(declare-fun can-see-bald-spot-from-above (Entity Entity) Bool)

; Declare constants
(declare-const robert-wadlow Entity)
(declare-const frankenstein-monster Entity)

; Knowledge Base: Robert Wadlow's recorded height (tallest human ever)
; 8 feet 11 inches = approximately 272 cm
(assert (= (height robert-wadlow) 272))

; Knowledge Base: Frankenstein's monster typical height in adaptations
; Usually depicted around 8 feet = approximately 244 cm
(assert (= (height frankenstein-monster) 244))

; Rule: One entity can see another's bald spot from above if they are taller
(assert (forall ((e1 Entity) (e2 Entity))
  (=> (> (height e1) (height e2))
      (can-see-bald-spot-from-above e1 e2))))

; Test Scenario: Could Wadlow see the monster's bald spot from above?
(assert (can-see-bald-spot-from-above robert-wadlow frankenstein-monster))

; Check satisfiability
; sat = TRUE (it is possible)
; unsat = FALSE (it contradicts the knowledge base)
(check-sat)
(get-model)