; Step-by-Step Reasoning:
; 1. Identify the goal: Verify if "Elizabeth has power" is True given the premises.
; 2. Define the domain: We need a sort 'Person' to represent individuals.
; 3. Define properties (predicates): 
;    - LeaderForLife: Person -> Bool
;    - HasPower: Person -> Bool
;    - IsKing: Person -> Bool
;    - IsQueen: Person -> Bool
;    - IsFemale: Person -> Bool
;    - IsMale: Person -> Bool
; 4. Define specific individual: Elizabeth (Constant of sort Person).
; 5. Translate Premises into Assertions:
;    - P1: forall p, LeaderForLife(p) => HasPower(p)
;    - P2: forall p, LeaderForLife(p) => (IsKing(p) or IsQueen(p))
;    - P3: forall p, IsQueen(p) => IsFemale(p)
;    - P4: forall p, IsKing(p) => IsMale(p)
;    - P5: IsQueen(Elizabeth)
;    - P6: LeaderForLife(Elizabeth)
; 6. Formulate Verification:
;    - To check if "Elizabeth has power" is True, assert (HasPower Elizabeth).
;    - If (check-sat) returns 'sat', the statement is consistent/True.
;    - If (check-sat) returns 'unsat', the statement contradicts/False.
;    - Logic derivation: P6 + P1 => HasPower(Elizabeth). So we expect 'sat'.
; 7. Construct SMT2 Program below.

; 1. Declare Sorts
(declare-sort Person 0)

; 2. Declare Functions (Predicates)
(declare-fun LeaderForLife (Person) Bool)
(declare-fun HasPower (Person) Bool)
(declare-fun IsKing (Person) Bool)
(declare-fun IsQueen (Person) Bool)
(declare-fun IsFemale (Person) Bool)
(declare-fun IsMale (Person) Bool)

; 3. Declare Constants
(declare-const Elizabeth Person)

; 4. Assert Knowledge Base (Premises)

; Premise 1: If a person is the leader of a country for life, that person has power.
(assert (forall ((p Person))
  (=> (LeaderForLife p) (HasPower p))))

; Premise 2: Leaders of a country for life are either a king or a queen.
(assert (forall ((p Person))
  (=> (LeaderForLife p) (or (IsKing p) (IsQueen p)))))

; Premise 3: Queens are female.
(assert (forall ((p Person))
  (=> (IsQueen p) (IsFemale p))))

; Premise 4: Kings are male.
(assert (forall ((p Person))
  (=> (IsKing p) (IsMale p))))

; Premise 5: Elizabeth is a queen.
(assert (IsQueen Elizabeth))

; Premise 6: Elizabeth is a leader of a country for life.
(assert (LeaderForLife Elizabeth))

; 5. Verification Scenario
; Statement to test: Elizabeth has power.
; We assert this statement. If the solver returns 'sat', the statement is True (consistent).
; If 'unsat', the statement is False (contradiction).
(assert (HasPower Elizabeth))

; 6. Check Satisfiability
(check-sat)
(get-model)