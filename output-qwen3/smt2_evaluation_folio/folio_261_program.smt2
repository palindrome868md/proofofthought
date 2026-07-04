; Reasoning Steps:
; 1. Identify Entities and Types:
;    - We need a sort 'Person' to represent individuals like Tiffany Alston.
;
; 2. Identify Predicates (Functions returning Bool):
;    - is-legislator: Checks if a person is a legislator.
;    - found-guilty: Checks if a person is found guilty of stealing funds.
;    - is-suspended: Checks if a person is suspended from office.
;
; 3. Identify Constants:
;    - tiffany-alston: A specific constant of sort Person.
;
; 4. Encode Premises (Knowledge Base):
;    - Premise 1: "If a legislator is found guilty of stealing government funds, they will be suspended from office."
;      Logical Form: forall p, (is-legislator(p) AND found-guilty(p)) => is-suspended(p)
;    - Premise 2: "Tiffany T. Alston was a legislator..."
;      Logical Form: is-legislator(tiffany-alston)
;    - Premise 3: "Tiffany T. Alston was found guilty..."
;      Logical Form: found-guilty(tiffany-alston)
;
; 5. Encode Statement to Verify:
;    - Statement: "Tiffany T. Alston was suspended from the Maryland House of Delegates."
;      Logical Form: is-suspended(tiffany-alston)
;
; 6. Verification Strategy:
;    - Assert the Knowledge Base.
;    - Assert the Statement.
;    - Run (check-sat).
;    - If 'sat': The statement is consistent with the premises (True in this deductive context).
;    - If 'unsat': The statement contradicts the premises (False).
;    - Given the premises entail the conclusion, we expect 'sat'.

; --- SMT-LIB 2.0 Program ---

; 1. Declare Sorts
(declare-sort Person 0)

; 2. Declare Functions (Predicates)
(declare-fun is-legislator (Person) Bool)
(declare-fun found-guilty (Person) Bool)
(declare-fun is-suspended (Person) Bool)

; 3. Declare Constants
(declare-const tiffany-alston Person)

; 4. Assert Knowledge Base (Premises)
; Premise 1: Rule regarding guilt and suspension
(assert (forall ((p Person))
  (=> (and (is-legislator p) (found-guilty p))
      (is-suspended p))))

; Premise 2: Tiffany is a legislator
(assert (is-legislator tiffany-alston))

; Premise 3: Tiffany is found guilty
(assert (found-guilty tiffany-alston))

; 5. Assert Statement to Verify
; Statement: Tiffany was suspended
(assert (is-suspended tiffany-alston))

; 6. Check Satisfiability
(check-sat)

; 7. Get Model (to see the assignment if sat)
(get-model)