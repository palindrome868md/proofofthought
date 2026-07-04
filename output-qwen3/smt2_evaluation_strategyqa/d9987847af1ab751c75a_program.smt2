; Question: Will someone die without white blood cells?
; This tests whether the biological fact that white blood cells are essential
; for survival/immune function is encoded correctly.

; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions
(declare-fun has-white-blood-cells (Person) Bool)
(declare-fun will-die (Person) Bool)

; 3. Declare constants (test person)
(declare-const test-person Person)

; 4. Assert knowledge base
; Biological fact: White blood cells are necessary for immune function and survival
; Without white blood cells, a person cannot fight infections and will die
(assert (forall ((p Person))
  (=> (not (has-white-blood-cells p))
      (will-die p))))

; 5. Assert test scenario
; This person does not have white blood cells
(assert (not (has-white-blood-cells test-person)))

; 6. Verify the claim
; Test: Will this person die? (assert the conclusion we're verifying)
(assert (will-die test-person))

; 7. Check satisfiability
; sat = TRUE (yes, someone will die without white blood cells)
; unsat = FALSE (no, this contradicts our knowledge)
(check-sat)
(get-model)