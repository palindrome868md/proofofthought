; ==============================================================================
; REASONING STEPS
; ==============================================================================
; 1. Analyze the Premises (Knowledge Base):
;    - P1: Miroslav Venhoda is a choral conductor.
;    - P2: Miroslav Venhoda specialized in Renaissance music.
;          (Combined from: "Miroslav Venhoda was a Czech choral conductor who 
;          specialized in the performance of Renaissance and Baroque music.")
;    - P3: All choral conductors are musicians.
;    - P4: Some musicians love music.
;
; 2. Analyze the Statement to Verify:
;    - S: "No choral conductor specialized in the performance of Renaissance."
;    - Logical Form: For all persons p, if p is a choral conductor, 
;                    then p did NOT specialize in Renaissance.
;
; 3. Logical Conflict Detection:
;    - P1 & P2 establish that there exists at least one choral conductor 
;      (Venhoda) who specialized in Renaissance.
;    - S claims that NO choral conductor specialized in Renaissance.
;    - These are contradictory.
;    - Therefore, asserting the Knowledge Base + Statement should yield 'unsat'.
;    - According to Verification Semantics: 'unsat' means the Statement is False.
;
; 4. SMT-LIB Encoding Strategy:
;    - Define Sort 'Person'.
;    - Define Predicates for properties (is-choral-conductor, specialized-renaissance, etc.).
;    - Declare Constant for 'miroslav-venhoda'.
;    - Declare Witness Constant for existential premise ('some musicians').
;    - Assert all Premises.
;    - Assert the Statement S.
;    - Run (check-sat) exactly once.
; ==============================================================================

; 1. Declare Sorts
(declare-sort Person 0)

; 2. Declare Functions (Predicates)
(declare-fun is-choral-conductor (Person) Bool)
(declare-fun specialized-renaissance (Person) Bool)
(declare-fun is-musician (Person) Bool)
(declare-fun loves-music (Person) Bool)

; 3. Declare Constants
(declare-const miroslav-venhoda Person)
; Witness for Premise 4: "Some musicians love music"
(declare-const musician-witness Person)

; 4. Assert Knowledge Base (Premises)

; Premise 1 & 2: Venhoda is a choral conductor and specialized in Renaissance
(assert (is-choral-conductor miroslav-venhoda))
(assert (specialized-renaissance miroslav-venhoda))

; Premise 3: Any choral conductor is a musician
(assert (forall ((p Person))
  (=> (is-choral-conductor p)
      (is-musician p))))

; Premise 4: Some musicians love music (Existential constraint)
(assert (is-musician musician-witness))
(assert (loves-music musician-witness))

; 5. Assert the Statement to Verify
; Statement: "No choral conductor specialized in the performance of Renaissance."
(assert (forall ((p Person))
  (=> (is-choral-conductor p)
      (not (specialized-renaissance p)))))

; 6. Check Satisfiability
; Expected Result: unsat (The statement contradicts the premises)
; Interpretation: The statement is False.
(check-sat)
(get-model)