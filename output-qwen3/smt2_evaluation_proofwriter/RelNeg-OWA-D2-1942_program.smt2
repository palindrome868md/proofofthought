; ==============================================================================
; Reasoning Steps:
; ==============================================================================
; 1. Identify Sorts and Constants:
;    - Sort: Animal (to represent entities)
;    - Constants: mouse, rabbit (instances of Animal)
;
; 2. Identify Relations (Functions):
;    - visits: Animal -> Animal -> Bool
;    - needs:  Animal -> Animal -> Bool
;    - sees:   Animal -> Animal -> Bool
;    - is-rough: Animal -> Bool
;
; 3. Translate Knowledge Base (Premises):
;    - P1: The mouse visits the rabbit.
;    - P2: The rabbit needs the mouse.
;    - P3: If the mouse visits the rabbit then the mouse needs the rabbit.
;    - P4: If something visits the rabbit and the rabbit sees the mouse then the mouse does not see the rabbit.
;    - P5: If something needs the rabbit then it is not rough.
;
; 4. Translate Question (Claim to Verify):
;    - Claim: "The rabbit does not need the mouse."
;    - Logic: (not (needs rabbit mouse))
;
; 5. Verification Strategy:
;    - Assert all Knowledge Base facts.
;    - Assert the Claim.
;    - Run (check-sat).
;    - Interpretation: 
;      - 'sat' means the Claim is consistent with KB (True/Possible).
;      - 'unsat' means the Claim contradicts KB (False).
;    - Expectation: P2 states (needs rabbit mouse). Claim states (not (needs rabbit mouse)).
;      This is a direct contradiction. Result should be 'unsat'.
; ==============================================================================

; 1. Declare Sorts
(declare-sort Animal 0)

; 2. Declare Constants
(declare-const mouse Animal)
(declare-const rabbit Animal)

; 3. Declare Functions
(declare-fun visits (Animal Animal) Bool)
(declare-fun needs (Animal Animal) Bool)
(declare-fun sees (Animal Animal) Bool)
(declare-fun is-rough (Animal) Bool)

; 4. Assert Knowledge Base
; P1: The mouse visits the rabbit.
(assert (visits mouse rabbit))

; P2: The rabbit needs the mouse.
(assert (needs rabbit mouse))

; P3: If the mouse visits the rabbit then the mouse needs the rabbit.
(assert (=> (visits mouse rabbit) (needs mouse rabbit)))

; P4: If something visits the rabbit and the rabbit sees the mouse then the mouse does not see the rabbit.
(assert (forall ((x Animal))
  (=> (and (visits x rabbit) (sees rabbit mouse))
      (not (sees mouse x)))))

; P5: If something needs the rabbit then it is not rough.
(assert (forall ((x Animal))
  (=> (needs x rabbit)
      (not (is-rough x)))))

; 5. Assert Question Claim
; Question: The rabbit does not need the mouse.
(assert (not (needs rabbit mouse)))

; 6. Check Satisfiability
(check-sat)
(get-model)