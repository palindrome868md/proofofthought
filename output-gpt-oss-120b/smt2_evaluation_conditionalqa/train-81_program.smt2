;-------------------------------------------------
; Sorts
(declare-sort Person 0)

;-------------------------------------------------
; Predicates (functions returning Bool)
(declare-fun is_parent (Person Person) Bool)
(declare-fun is_step_parent (Person Person) Bool)
(declare-fun is_guardian (Person Person) Bool)
(declare-fun is_grandparent (Person Person) Bool)
(declare-fun is_foster_parent (Person Person) Bool)
(declare-fun is_sibling_caregiver (Person Person) Bool)

(declare-fun can_claim_dla (Person Person) Bool)

;-------------------------------------------------
; Constants representing the people in the scenario
(declare-const me Person)      ; the step‑father (question asker)
(declare-const child Person)   ; the 14‑year‑old child

;-------------------------------------------------
; Knowledge base extracted from the document

; The asker is a step‑parent of the child
(assert (is_step_parent me child))

; The asker is NOT a biological parent of the child
(assert (not (is_parent me child)))

; Rule: anyone who looks after the child “as if they were their parent”
; (including step‑parents, guardians, grandparents, foster‑parents,
;  or older siblings) may claim DLA for that child.
(assert
  (forall ((p Person) (c Person))
    (=> (or (is_parent p c)
            (is_step_parent p c)
            (is_guardian p c)
            (is_grandparent p c)
            (is_foster_parent p c)
            (is_sibling_caregiver p c))
        (can_claim_dla p c))))

;-------------------------------------------------
; Test the specific question:
; Can the step‑father claim DLA for the child?
(assert (can_claim_dla me child))

;-------------------------------------------------
(check-sat)   ; Expected result: sat (the claim is permitted)
(get-model)