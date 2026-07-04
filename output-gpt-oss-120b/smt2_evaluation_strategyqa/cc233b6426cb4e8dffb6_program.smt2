;--- Sorts ---------------------------------------------------------
(declare-sort Person 0)
(declare-sort Location 0)

;--- Functions ------------------------------------------------------
; Birthplace of a person
(declare-fun birthplace (Person) Location)
; Predicate expressing that two locations are “near” each other
(declare-fun near (Location Location) Bool)

;--- Constants ------------------------------------------------------
; The original James Bond actor
(declare-const sean-connery Person)

; Relevant locations
(declare-const edinburgh Location)          ; Connery's birth city
(declare-const washington_dc Location)      ; City containing the monument
(declare-const washington_monument Location) ; The monument itself

;--- Knowledge Base -------------------------------------------------
; Connery was born in Edinburgh
(assert (= (birthplace sean-connery) edinburgh))

; The Washington Monument is located in Washington, D.C.
(assert (= washington_monument washington_dc))

; Edinburgh and Washington, D.C. are distinct places
(assert (distinct edinburgh washington_dc))

; Definition of “near”: two locations are near *only* if they are the same place
(assert (forall ((l1 Location) (l2 Location))
        (=> (= l1 l2) (near l1 l2))))

; Distinct locations are *not* near each other
(assert (forall ((l1 Location) (l2 Location))
        (=> (distinct l1 l2) (not (near l1 l2)))))

;--- Query ----------------------------------------------------------
; Was Sean Connery born near the Washington Monument?
(assert (near (birthplace sean-connery) washington_monument))

;--- Solve -----------------------------------------------------------
(check-sat)   ; Expected result: unsat (the claim is false)
(get-model)