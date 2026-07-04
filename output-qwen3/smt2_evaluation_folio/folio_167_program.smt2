; Reasoning Steps:
; 1. Define Sort 'Person' to represent individuals.
; 2. Define Predicates for properties (is_leader_for_life, is_queen, etc.).
; 3. Declare Constant 'elizabeth'.
; 4. Assert Premises (Knowledge Base).
;    - P1: Leader for life => Power
;    - P2: Leader for life => King OR Queen
;    - P3: Queen => Female
;    - P4: King => Male
;    - P5: Elizabeth is Queen
;    - P6: Elizabeth is Leader for life
; 5. Assert the Statement to Verify: "Elizabeth is a leader of a country for life".
; 6. Check Satisfiability.
;    - Since P6 asserts this fact directly, (check-sat) should return 'sat'.
;    - 'sat' implies the statement is True/Consistent with KB.

; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions (Predicates)
(declare-fun is_leader_for_life (Person) Bool)
(declare-fun has_power (Person) Bool)
(declare-fun is_king (Person) Bool)
(declare-fun is_queen (Person) Bool)
(declare-fun is_female (Person) Bool)
(declare-fun is_male (Person) Bool)

; 3. Declare constants
(declare-const elizabeth Person)

; 4. Assert knowledge base (facts)
; Premise 1: If a person is the leader of a country for life, that person has power.
(assert (forall ((p Person))
  (=> (is_leader_for_life p) (has_power p))))

; Premise 2: Leaders of a country for life are either a king or a queen.
(assert (forall ((p Person))
  (=> (is_leader_for_life p) (or (is_king p) (is_queen p)))))

; Premise 3: Queens are female.
(assert (forall ((p Person))
  (=> (is_queen p) (is_female p))))

; Premise 4: Kings are male.
(assert (forall ((p Person))
  (=> (is_king p) (is_male p))))

; Premise 5: Elizabeth is a queen.
(assert (is_queen elizabeth))

; Premise 6: Elizabeth is a leader of a country for life.
(assert (is_leader_for_life elizabeth))

; 5. Test Statement: Elizabeth is a leader of a country for life.
; We assert the statement to check if it is consistent (sat) or contradictory (unsat).
(assert (is_leader_for_life elizabeth))

; 6. Check satisfiability
(check-sat)
(get-model)
```