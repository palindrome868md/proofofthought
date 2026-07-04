; Reasoning Steps:
; 1. Analyze Premises:
;    - P1: Concert performance implies skill (good-at).
;    - P2: Peter's capabilities (piano, violin, saxophone).
;    - P3: Peter's specific concert action (plays piano).
;    - P4: Oliver and Peter both perform in the concert.
;    - P5: Oliver's instrument in the concert is different from Peter's.
; 2. Analyze Statement: "Oliver plays piano in the concert."
; 3. Logical Deduction:
;    - From P3, Peter plays piano in the concert.
;    - From P5, Oliver cannot play the same instrument as Peter in the concert.
;    - Therefore, Oliver cannot play piano in the concert.
;    - The statement contradicts the premises.
; 4. SMT Encoding Strategy:
;    - Assert all premises.
;    - Assert the statement as a test constraint.
;    - Check satisfiability.
;    - Expected result: unsat (False).

; 1. Declare Sorts
(declare-sort Person 0)
(declare-sort Instrument 0)

; 2. Declare Constants
(declare-const peter Person)
(declare-const oliver Person)
(declare-const piano Instrument)
(declare-const violin Instrument)
(declare-const saxophone Instrument)

; 3. Declare Functions
(declare-fun plays (Person Instrument) Bool)
(declare-fun plays-in-concert (Person Instrument) Bool)
(declare-fun good-at (Person Instrument) Bool)

; 4. Assert Knowledge Base (Premises)

; Premise 1: If a person plays an instrument in a concert, they are good at it.
(assert (forall ((p Person) (i Instrument))
  (=> (plays-in-concert p i) (good-at p i))))

; Premise 2: Peter plays piano, violin, and saxophone.
(assert (plays peter piano))
(assert (plays peter violin))
(assert (plays peter saxophone))

; Premise 3: Peter plays piano in a concert.
(assert (plays-in-concert peter piano))

; Premise 4: Oliver plays an instrument in the concert.
; We use a Skolem constant to represent the instrument Oliver plays.
(declare-const oliver-concert-instrument Instrument)
(assert (plays-in-concert oliver oliver-concert-instrument))

; Premise 5: Oliver plays a different musical instrument from Peter in the concert.
; This implies no overlap in instruments played in the concert between them.
(assert (forall ((i Instrument))
  (=> (plays-in-concert peter i)
      (not (plays-in-concert oliver i)))))

; 5. Verify Statement
; Statement: Oliver plays piano in the concert.
; We assert this to check for contradiction with the knowledge base.
(assert (plays-in-concert oliver piano))

; 6. Check Satisfiability
; If unsat, the statement is False (contradicts premises).
; If sat, the statement is True/Possible.
(check-sat)
(get-model)