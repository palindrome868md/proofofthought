; 1. Declare sorts
(declare-sort Person 0)
(declare-sort Issue 0)

; 2. Declare predicates / functions
(declare-fun is-politician (Person) Bool)
(declare-fun is-democrat (Person) Bool)
(declare-fun supports (Person Issue) Bool)
(declare-fun publicly-denounce (Person Issue) Bool)

; 3. Declare the relevant constants
(declare-const nancy-pelosi Person)
(declare-const abortion Issue)

; 4. Knowledge base
(assert (is-politician nancy-pelosi))
(assert (is-democrat nancy-pelosi))
(assert (supports nancy-pelosi abortion))

; Rule: Democrats never publicly denounce an issue they support
(assert (forall ((p Person) (i Issue))
  (=> (and (is-democrat p) (supports p i))
      (not (publicly-denounce p i)))))

; 5. Test the query: "Would Nancy Pelosi publicly denounce abortion?"
(assert (publicly-denounce nancy-pelosi abortion))

; 6. Verdict
(check-sat)
(get-model)