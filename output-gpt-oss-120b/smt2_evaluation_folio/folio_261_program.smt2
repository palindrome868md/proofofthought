;--- Sorts -------------------------------------------------
(declare-sort Person 0)

;--- Constants --------------------------------------------
(declare-const tiffany Person)

;--- Predicates (uninterpreted functions) -----------------
(declare-fun legislator   (Person) Bool)   ; p is a legislator in the MD House
(declare-fun found_guilty (Person) Bool)   ; p was found guilty of stealing funds
(declare-fun suspended    (Person) Bool)   ; p was suspended from office

;--- Knowledge base (premises) ----------------------------
; Tiffany was a legislator in Maryland's House of Delegates
(assert (legislator tiffany))

; Tiffany was found guilty of stealing government funds in 2012
(assert (found_guilty tiffany))

; Rule: Legislator ∧ guilty  ⇒  suspended
(assert
  (forall ((p Person))
    (=> (and (legislator p) (found_guilty p))
        (suspended p))
  )
)

;--- Statement to test ------------------------------------
; "Tiffany T. Alston was suspended from the Maryland House of Delegates."
(assert (suspended tiffany))

;--- Solver query -----------------------------------------
(check-sat)   ; sat  → statement is true
(get-model)