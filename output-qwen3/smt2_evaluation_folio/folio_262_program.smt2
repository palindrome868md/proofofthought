; 1. Declare Sorts
(declare-sort Person 0)

; 2. Declare Functions (Predicates)
(declare-fun is-legislator (Person) Bool)
(declare-fun guilty-stealing (Person) Bool)
(declare-fun suspended (Person) Bool)

; 3. Declare Constants
(declare-const tiffany-alston Person)

; 4. Assert Knowledge Base (Premises)

; Premise 1: If a legislator is found guilty of stealing government funds, they will be suspended.
(assert (forall ((p Person))
  (=> (and (is-legislator p) (guilty-stealing p))
      (suspended p))))

; Premise 2: Tiffany T. Alston was a legislator.
(assert (is-legislator tiffany-alston))

; Premise 3: Tiffany T. Alston was found guilty of stealing government funds.
(assert (guilty-stealing tiffany-alston))

; 5. Assert Statement to Verify
; Statement: Tiffany T. Alston was not suspended from the Maryland House of Delegates.
; We assert this to check if it is consistent with the knowledge base.
(assert (not (suspended tiffany-alston)))

; 6. Check Satisfiability
; Expected Result: unsat (The statement contradicts the premises, so the statement is False)
(check-sat)
(get-model)