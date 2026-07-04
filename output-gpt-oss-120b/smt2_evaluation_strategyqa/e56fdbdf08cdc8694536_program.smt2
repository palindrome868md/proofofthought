;--- Declarations ----------------------------------------------------
(declare-sort Person 0)
(declare-sort Institution 0)

; Predicates
(declare-fun is-human (Person) Bool)
(declare-fun attends (Person Institution) Bool)

; Constants for the Powerpuff Girls and the school
(declare-const blossom Person)
(declare-const bubbles Person)
(declare-const buttercup Person)
(declare-const camden-military-academy Institution)

;--- Knowledge Base --------------------------------------------------
; The Powerpuff Girls are not human
(assert (not (is-human blossom)))
(assert (not (is-human bubbles)))
(assert (not (is-human buttercup)))

; Only humans are allowed to attend any institution
(assert (forall ((p Person) (i Institution))
        (=> (attends p i) (is-human p))))

;--- Test Scenario ---------------------------------------------------
; Suppose the Girls attend the academy
(assert (attends blossom camden-military-academy))
(assert (attends bubbles camden-military-academy))
(assert (attends buttercup camden-military-academy))

;--- Verification ----------------------------------------------------
(check-sat)   ; Expected result: unsat (they cannot attend)
(get-model)