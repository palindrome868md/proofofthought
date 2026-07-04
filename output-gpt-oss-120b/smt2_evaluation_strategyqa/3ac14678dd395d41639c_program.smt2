; ------------------------------------------------------------
; 1. Declare the uninterpreted sort for people
; ------------------------------------------------------------
(declare-sort Person 0)

; ------------------------------------------------------------
; 2. Declare functions / predicates
; ------------------------------------------------------------
(declare-fun age (Person) Int)                 ; person's age
(declare-fun has-disability (Person) Bool)    ; qualifying disability?
(declare-fun eligible-medicare (Person) Bool) ; Medicare eligibility

; ------------------------------------------------------------
; 3. Declare the individual of interest
; ------------------------------------------------------------
(declare-const eleventh-grader Person)

; ------------------------------------------------------------
; 4. Knowledge base: Medicare eligibility rule
; ------------------------------------------------------------
; A person is eligible for Medicare iff they are >=65 years old
; or they have a qualifying disability.
(assert (forall ((p Person))
  (= (eligible-medicare p)
     (or (>= (age p) 65) (has-disability p)))))

; ------------------------------------------------------------
; 5. Facts about the eleventh‑grader
; ------------------------------------------------------------
; Typical age for an 11th‑grade student (≈16 years)
(assert (= (age eleventh-grader) 16))

; The student does not have a qualifying disability
(assert (not (has-disability eleventh-grader)))

; ------------------------------------------------------------
; 6. Test the query: "Would an eleventh‑grader be eligible for Medicare?"
; ------------------------------------------------------------
(assert (eligible-medicare eleventh-grader))

; ------------------------------------------------------------
; 7. Check satisfiability (single check)
; ------------------------------------------------------------
(check-sat)   ; Expected outcome: unsat (the statement is false)

(get-model)   ; Optional: shows a concrete model if sat (here not needed)