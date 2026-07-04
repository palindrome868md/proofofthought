;--- Sorts -------------------------------------------------
(declare-sort Person 0)
(declare-sort Property 0)

;--- Functions / Predicates --------------------------------
; Gift the whole property from one person to another
(declare-fun gift_all (Person Person Property) Bool)
; Person lives in a property
(declare-fun livesIn (Person Property) Bool)
; Rent must be paid by giver to receiver for a property
(declare-fun rent_needed (Person Person Property) Bool)

;--- Constants --------------------------------------------
(declare-const us Person)          ; the couple (treated as a single entity)
(declare-const son Person)         ; the son
(declare-const wife Person)        ; son's wife (not needed for the rule)
(declare-const home Property)      ; the main house
(declare-const annexe Property)    ; the annexe they will occupy

;--- Knowledge Base ----------------------------------------

; The couple give the whole house to their son (and his wife)
(assert (gift_all us son home))

; The couple continue to live in the house
(assert (livesIn us home))

; The son (and his wife) will live in the annexe, not in the house
(assert (not (livesIn son home)))
(assert (livesIn son annexe))

; Rule from the HMRC guidance:
; If you give away the entire property, keep living in it,
; and the new owner does NOT live there, you must pay rent.
(assert
  (forall ((g Person) (r Person) (p Property))
    (=> (and (gift_all g r p)
             (livesIn g p)
             (not (livesIn r p)))
        (rent_needed g r p))))

;--- Test the claim: "We would NOT have to pay rent"
; (i.e., assert the negation of the required rent)
(assert (not (rent_needed us son home)))

;--- Check the result ---------------------------------------
(check-sat)   ; expected: unsat  (the claim that no rent is needed is impossible)
(get-model)