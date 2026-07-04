; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions (Predicates)
(declare-fun is-leader-for-life (Person) Bool)
(declare-fun has-power (Person) Bool)
(declare-fun is-king (Person) Bool)
(declare-fun is-queen (Person) Bool)
(declare-fun is-male (Person) Bool)
(declare-fun is-female (Person) Bool)

; 3. Declare constants
(declare-const Elizabeth Person)

; 4. Assert knowledge base (Premises)
; Premise 1: If a person is the leader of a country for life, that person has power.
(assert (forall ((p Person))
  (=> (is-leader-for-life p) (has-power p))))

; Premise 2: Leaders of a country for life are either a king or a queen.
(assert (forall ((p Person))
  (=> (is-leader-for-life p) (or (is-king p) (is-queen p)))))

; Premise 3: Queens are female.
(assert (forall ((p Person))
  (=> (is-queen p) (is-female p))))

; Premise 4: Kings are male.
(assert (forall ((p Person))
  (=> (is-king p) (is-male p))))

; Premise 5: Elizabeth is a queen.
(assert (is-queen Elizabeth))

; Premise 6: Elizabeth is a leader of a country for life.
(assert (is-leader-for-life Elizabeth))

; Implicit Axiom: Male and Female are disjoint sets.
; This is necessary to logically distinguish Kings from Queens based on the premises.
(assert (forall ((p Person))
  (=> (is-female p) (not (is-male p)))))

; 5. Test Statement: Elizabeth is a king.
; We assert this to check if it is consistent with the knowledge base.
; If unsat, the statement is False. If sat, the statement is True (possible).
(assert (is-king Elizabeth))

; 6. Check satisfiability
(check-sat)
(get-model)