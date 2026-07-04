;--- 1. Declare the uninterpreted sort for people
(declare-sort Person 0)

;--- 2. Declare predicates (unary functions returning Bool)
(declare-fun quiet (Person) Bool)
(declare-fun young (Person) Bool)
(declare-fun furry (Person) Bool)
(declare-fun big   (Person) Bool)

;--- 3. Declare the individual constants
(declare-const erin Person)
(declare-const fiona Person)

;--- 4. Knowledge base (facts)
(assert (quiet erin))          ; Erin is quiet
(assert (young erin))          ; Erin is young
(assert (furry fiona))         ; Fiona is furry

;--- 5. General rules
; If someone is young then they are big
(assert (forall ((p Person))
          (=> (young p) (big p))))

; All furry people are young
(assert (forall ((p Person))
          (=> (furry p) (young p))))

;--- 6. Test the query: "Fiona is not furry"
(assert (not (furry fiona)))   ; negation of the known fact

;--- 7. Check consistency
(check-sat)                    ; Expected result: unsat
(get-model)                    ; (optional) model if sat