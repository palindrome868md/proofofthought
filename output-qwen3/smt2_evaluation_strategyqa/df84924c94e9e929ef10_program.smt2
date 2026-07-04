; Declare sorts
(declare-sort Person 0)
(declare-sort Issue 0)

; Declare functions
(declare-fun is-politician (Person) Bool)
(declare-fun is-democrat (Person) Bool)
(declare-fun supports (Person Issue) Bool)
(declare-fun publicly-denounce (Person Issue) Bool)

; Declare constants
(declare-const nancy-pelosi Person)
(declare-const abortion Issue)

; Knowledge base - Facts about Nancy Pelosi
(assert (is-politician nancy-pelosi))
(assert (is-democrat nancy-pelosi))
(assert (supports nancy-pelosi abortion))

; Knowledge base - General rule
; Democrats do not publicly denounce issues they support
(assert (forall ((p Person) (i Issue))
  (=> (and (is-democrat p) (supports p i))
      (not (publicly-denounce p i)))))

; Test: Would Nancy Pelosi publicly denounce abortion?
; We assert the scenario and check if it's satisfiable
(assert (publicly-denounce nancy-pelosi abortion))

; Check satisfiability
(check-sat)
(get-model)