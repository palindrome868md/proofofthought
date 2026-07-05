(declare-sort Person 0)
(declare-sort Issue 0)

(declare-fun is-politician (Person) Bool)
(declare-fun is-democrat (Person) Bool)
(declare-fun supports (Person Issue) Bool)
(declare-fun publicly-denounce (Person Issue) Bool)

(declare-const nancy-pelosi Person)
(declare-const abortion Issue)

(assert (is-politician nancy-pelosi))
(assert (is-democrat nancy-pelosi))

; Rule: Democrats don't denounce issues they support
(assert (forall ((p Person) (i Issue))
  (=> (and (is-democrat p) (supports p i))
      (not (publicly-denounce p i)))))

; Pelosi supports abortion
(assert (supports nancy-pelosi abortion))

; Test: Would she denounce abortion?
(assert (publicly-denounce nancy-pelosi abortion))

(check-sat)
(get-model)