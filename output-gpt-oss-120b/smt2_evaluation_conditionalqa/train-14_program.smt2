;-------------------------------------------------
; Declarations
;-------------------------------------------------
(declare-sort Person 0)

; Predicates
(declare-fun abused (Person) Bool)                 ; partner has abused the person
(declare-fun unreasonable_behaviour_ground (Person) Bool) ; can cite unreasonable behaviour

; Constant representing the asker
(declare-const me Person)

;-------------------------------------------------
; Knowledge base extracted from the document
;-------------------------------------------------
; Rule: Abuse (including mental/physical cruelty) qualifies as unreasonable behaviour
(assert (forall ((p Person))
  (=> (abused p)
      (unreasonable_behaviour_ground p))))

; Scenario fact: the asker has been abused/coercively controlled
(assert (abused me))

;-------------------------------------------------
; Test the question:
; "Can I use unreasonable behaviour as the ground to dissolve the partnership?"
;-------------------------------------------------
(assert (unreasonable_behaviour_ground me))

;-------------------------------------------------
; Query
;-------------------------------------------------
(check-sat)   ; Expected: sat  (the ground can be used)
(get-model)