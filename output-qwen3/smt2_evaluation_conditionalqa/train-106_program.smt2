; SMT-LIB 2.0 Program for Inheritance Tax Reasoning
; Question: Would the couple have to pay rent to their son after gifting the home?

; 1. Declare Sorts (Types)
(declare-sort Person 0)
(declare-sort Property 0)

; 2. Declare Functions (Predicates)
; Relationship between person and property
(declare-fun gifts-home (Person Property) Bool)      ; Gifting the whole home
(declare-fun gifts-part (Person Property) Bool)      ; Gifting only part of the home
(declare-fun continues-living (Person Property) Bool) ; Original owners stay
(declare-fun new-owners-live (Person Property) Bool) ; Recipients live there
(declare-fun must-pay-rent (Person Property) Bool)   ; Obligation to pay rent
(declare-fun pays-bills (Person Property) Bool)      ; Obligation to pay bills

; 3. Declare Constants (Specific Entities)
(declare-const couple Person)
(declare-const son Person)
(declare-const home Property)

; 4. Assert Knowledge Base (Inheritance Tax Rules from Document)

; Rule 1: General Rule
; "If you want to continue living in your property after giving it away, you'll need to: pay rent"
(assert (forall ((p Person) (prop Property))
  (=> (and (gifts-home p prop) (continues-living p prop))
      (must-pay-rent p prop))))

; Rule 2: Exception to General Rule
; "You do not have to pay rent... if both the following apply: 
;  you only give away part of your property AND the new owners also live at the property"
(assert (forall ((p Person) (prop Property) (s Person))
  (=> (and (gifts-part p prop) (new-owners-live s prop))
      (not (must-pay-rent p prop)))))

; 5. Assert Scenario Facts

; Fact 1: Couple gifts the home to son
(assert (gifts-home couple home))

; Fact 2: Couple continues living there
(assert (continues-living couple home))

; Fact 3: Son (new owner) lives in the annexe (part of the property)
(assert (new-owners-live son home))

; Fact 4: Couple pays all bills (matches requirement "pay your share")
(assert (pays-bills couple home))

; Fact 5: Crucial Distinction - They gifted "the home" (Whole), not "part of the property"
; The scenario states "gift it [the home]", implying full ownership transfer.
; The exception requires "only give away part".
(assert (not (gifts-part couple home)))

; 6. Verification
; Question: "Would we have to pay rent to our son in addition to paying the bills?"
; We assert the obligation (must-pay-rent). 
; If sat (True), it means the rules allow/force this obligation.
; If unsat (False), it means the rules contradict this obligation.
(assert (must-pay-rent couple home))

(check-sat)
(get-model)