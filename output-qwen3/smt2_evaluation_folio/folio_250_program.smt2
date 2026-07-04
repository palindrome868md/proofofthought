; Step 1: Logical Decomposition
; Premise 1: Lawton Park is a neighborhood (Context).
; Premise 2: For all persons p, if p is a citizen of Lawton Park, then p uses zip code 98199.
; Premise 3: Tom is a citizen of Lawton Park.
; Premise 4: Daniel uses zip code 98199.
; Statement to Verify: Tom does NOT use zip code 98199.
;
; Step 2: Verification Strategy
; We assert the Knowledge Base (Premises 1-4).
; We assert the Statement (Tom does NOT use 98199).
; We check satisfiability.
; - If UNSAT: The statement contradicts the KB -> Statement is FALSE.
; - If SAT: The statement is consistent with the KB -> Statement is TRUE.
;
; Step 3: Expected Reasoning
; From Premise 2 and 3: Tom uses zip code 98199.
; Statement claims: Tom does NOT use zip code 98199.
; Contradiction exists. Expected result: UNSAT (Statement is False).

; --- SMT-LIB 2.0 Program ---

; 1. Declare Sorts
(declare-sort Person 0)
(declare-sort Neighborhood 0)

; 2. Declare Functions
(declare-fun citizen-of (Person Neighborhood) Bool)
(declare-fun uses-zip (Person Int) Bool)

; 3. Declare Constants
(declare-const tom Person)
(declare-const daniel Person)
(declare-const lawton-park Neighborhood)

; 4. Assert Knowledge Base (Premises)
; Premise: Tom is a citizen of Lawton Park
(assert (citizen-of tom lawton-park))

; Premise: Daniel uses the zip code 98199
(assert (uses-zip daniel 98199))

; Premise: All citizens of Lawton Park use the zip code 98199
(assert (forall ((p Person))
  (=> (citizen-of p lawton-park)
      (uses-zip p 98199))))

; 5. Assert Statement to Test
; Statement: Tom doesn't use the zip code 98199
(assert (not (uses-zip tom 98199)))

; 6. Check Satisfiability
(check-sat)

; 7. Get Model
(get-model)