; Sorts
(declare-sort Person 0)

; Predicates / Functions
(declare-fun is-spouse (Person Person) Bool)
(declare-fun is-civil-partner (Person Person) Bool)
(declare-fun can-claim (Person Person) Bool)

; Constants
(declare-const aunt Person)
(declare-const husband Person)

; Knowledge base / Rules
; If someone is not the spouse or civil partner of the veteran, they cannot claim
(assert (forall ((p Person) (v Person))
  (=> (not (or (is-spouse p v) (is-civil-partner p v)))
      (not (can-claim p v)))))

; Test scenario: aunt is not spouse or civil partner of the husband
(assert (not (is-spouse aunt husband)))
(assert (not (is-civil-partner aunt husband)))

; Question: Can aunt claim for War Widow Pension for her husband?
(assert (can-claim aunt husband))

; Verification
(check-sat)
(get-model)