; Reasoning Steps:
; 1. Analyze Premises:
;    - P1: For all persons p and instruments i, if p plays i in a concert, then p is good at i.
;    - P2: Peter plays piano, violin, saxophone (general).
;    - P3: Peter plays piano in a concert.
;    - P4: Oliver and Peter both play instruments in a concert.
;    - P5: Oliver plays a different instrument from Peter in the concert.
;
; 2. Logical Deduction:
;    - From P3, we know (PlaysInConcert Peter Piano) is True.
;    - From P1, we know (PlaysInConcert Peter Piano) => (GoodAt Peter Piano).
;    - By Modus Ponens, (GoodAt Peter Piano) must be True.
;
; 3. Verification Strategy:
;    - Assert the Knowledge Base (P1-P5).
;    - Assert the Statement to be tested: (GoodAt Peter Piano).
;    - Run (check-sat).
;    - If 'sat', the statement is True (consistent with KB).
;    - If 'unsat', the statement is False (contradicts KB).
;    - Expected Result: sat (True).

; 1. Declare sorts
(declare-sort Person 0)
(declare-sort Instrument 0)

; 2. Declare functions
; PlaysInConcert: Person plays Instrument in a concert
(declare-fun PlaysInConcert (Person Instrument) Bool)
; GoodAt: Person is good at playing Instrument
(declare-fun GoodAt (Person Instrument) Bool)
; Plays: Person plays Instrument (general capability)
(declare-fun Plays (Person Instrument) Bool)

; 3. Declare constants
(declare-const Peter Person)
(declare-const Oliver Person)
(declare-const Piano Instrument)
(declare-const Violin Instrument)
(declare-const Saxophone Instrument)
; Constant to represent the specific instrument Oliver plays in the concert
(declare-const OliverInstrument Instrument)

; 4. Assert knowledge base (Premises)

; Premise 1: If a person plays an instrument in a concert, they are good at playing this kind of instrument.
(assert (forall ((p Person) (i Instrument))
  (=> (PlaysInConcert p i) (GoodAt p i))))

; Premise 2: Peter plays piano, violin, and saxophone.
(assert (Plays Peter Piano))
(assert (Plays Peter Violin))
(assert (Plays Peter Saxophone))

; Premise 3: Peter plays piano in a concert.
(assert (PlaysInConcert Peter Piano))

; Premise 4: Oliver and Peter both play instruments in a concert.
; Peter's part is covered by Premise 3.
; Assert Oliver plays an instrument in the concert.
(assert (PlaysInConcert Oliver OliverInstrument))

; Premise 5: Oliver plays a different musical instrument from Peter in the concert.
; Peter plays Piano in the concert (from Premise 3).
(assert (distinct OliverInstrument Piano))

; 5. Verification
; Statement: Peter is good at playing piano.
; We assert the statement to check if it is satisfiable given the knowledge base.
(assert (GoodAt Peter Piano))

; 6. Check satisfiability
(check-sat)
(get-model)