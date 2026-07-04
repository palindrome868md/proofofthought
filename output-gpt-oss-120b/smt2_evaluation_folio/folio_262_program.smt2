; Declare an uninterpreted sort for people
(declare-sort Person 0)

; Declare predicates (functions returning Bool)
(declare-fun legislator (Person) Bool)          ; is a legislator
(declare-fun found_guilty_stealing_funds (Person) Bool) ; found guilty of stealing government funds
(declare-fun suspended (Person) Bool)           ; is suspended from office

; Declare the constant representing Tiffany T. Alston
(declare-const tiffany Person)

; ------------------------------
; Knowledge base (premises)

; 1. Rule: if a legislator is found guilty of stealing government funds, then they are suspended
(assert (forall ((p Person))
        (=> (and (legislator p) (found_guilty_stealing_funds p))
            (suspended p))))

; 2. Tiffany was a legislator in Maryland's House of Delegates (2011‑2013)
(assert (legislator tiffany))

; 3. Tiffany was found guilty of stealing government funds in 2012
(assert (found_guilty_stealing_funds tiffany))

; ------------------------------
; Statement to verify:
; "Tiffany T. Alston was not suspended from the Maryland House of Delegates."

; We assert the negation of the statement we want to test (i.e., we assert that she WAS NOT suspended)
; If this leads to a contradiction, the original statement is false.
(assert (not (suspended tiffany)))

; ------------------------------
; Check whether the combined constraints are satisfiable
(check-sat)
(get-model)