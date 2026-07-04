;--- Sorts ----------------------------------------------------
(declare-sort Person 0)

;--- Functions ------------------------------------------------
; Height of a person in metres
(declare-fun height (Person) Real)

;--- Constants ------------------------------------------------
(declare-const leila-george Person)

;--- Knowledge Base -------------------------------------------
; Fact: Leila George’s height is 1.65 m
(assert (= (height leila-george) 1.65))

; Rule: To be a (runway) model one must be at least 1.70 m tall
(define-fun is-model ((p Person)) Bool
  (>= (height p) 1.70))

;--- Query ----------------------------------------------------
; Does Leila George lack the required height to be a model?
; (i.e., is her height less than 1.70 m?)
(assert (< (height leila-george) 1.70))

(check-sat)
(get-model)