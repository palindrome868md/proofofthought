; ==============================================================================
; Reasoning Steps for DLA Claim Verification
; ==============================================================================
; 1. Decompose the Question:
;    - Claimant: Step-father (not biological parent).
;    - Child: 14 years old, born in UK, currently in France (EEA), walking difficulty.
;    - Query: Can the step-father claim DLA on behalf of the child?
;
; 2. Extract Rules from Document:
;    - Claimant Eligibility: Must be parent OR look after as parent (includes step-parents).
;      Biological parenthood is NOT strictly required.
;    - Child Eligibility: 
;      a) Age < 16.
;      b) Has walking difficulties OR needs extra care.
;      c) Resides in GB, EEA, or Switzerland when claiming.
;
; 3. Map Scenario to Facts:
;    - is-step-parent(me, child) = True
;    - is-biological-parent(me, child) = False
;    - child-age(child) = 14 (Satisfies < 16)
;    - has-walking-difficulty(child) = True
;    - resides-in-eea(child) = True (France is in EEA)
;
; 4. Logical Verification:
;    - If Step-Parent AND Child Eligible THEN Can Claim.
;    - Assert the scenario and the claim predicate.
;    - Check Satisfiability: 
;      - sat = True (Claim is valid/possible)
;      - unsat = False (Claim contradicts rules)
; ==============================================================================

; 1. Declare Sorts
(declare-sort Person 0)

; 2. Declare Functions (Predicates and Properties)
; Relationship predicates
(declare-fun is-step-parent (Person Person) Bool)
(declare-fun is-biological-parent (Person Person) Bool)

; Child properties
(declare-fun child-age (Person) Int)
(declare-fun has-walking-difficulty (Person) Bool)
(declare-fun resides-in-eea (Person) Bool)

; Eligibility intermediates
(declare-fun eligible-claimant (Person Person) Bool)
(declare-fun eligible-child (Person) Bool)

; Final claim ability
(declare-fun can-claim-dla (Person Person) Bool)

; 3. Declare Constants
(declare-const me Person)
(declare-const child Person)

; 4. Assert Knowledge Base (Rules from Document)

; Rule 1: Claimant Eligibility
; "To claim DLA for a child you need to be their parent or look after them as if you're their parent."
; "This includes step-parents..."
(assert (forall ((p Person) (c Person))
  (=> (is-step-parent p c)
      (eligible-claimant p c))))

; Rule 2: Child Eligibility
; "be under 16"
; "has difficulties walking or needs much more looking after"
; "be in Great Britain, a European Economic Area (EEA) country or Switzerland when you claim"
(assert (forall ((c Person))
  (=> (and (< (child-age c) 16)
           (has-walking-difficulty c)
           (resides-in-eea c))
      (eligible-child c))))

; Rule 3: Final Claim Authorization
; If claimant is eligible AND child is eligible, then claim is possible
(assert (forall ((p Person) (c Person))
  (=> (and (eligible-claimant p c)
           (eligible-child c))
      (can-claim-dla p c))))

; 5. Assert Scenario Facts

; Fact: I am the step-father
(assert (is-step-parent me child))

; Fact: I am NOT the biological parent (Testing the "despite" condition)
(assert (not (is-biological-parent me child)))

; Fact: Child is 14 years old
(assert (= (child-age child) 14))

; Fact: Child has difficulty walking after accident
(assert (has-walking-difficulty child))

; Fact: Child is in France (EEA)
(assert (resides-in-eea child))

; 6. Verification Query
; Question: Can I claim for disability living allowance on their behalf?
; We assert the claim is happening and check for consistency (sat)
(assert (can-claim-dla me child))

; 7. Check Satisfiability
; Expected Result: sat (True)
; Explanation: The step-parent relationship satisfies the claimant eligibility, 
; and the child meets age, disability, and residence requirements.
(check-sat)
(get-model)