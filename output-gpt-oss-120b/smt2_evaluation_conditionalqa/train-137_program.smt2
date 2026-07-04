;--- Declarations ----------------------------------------------------
(declare-sort Person 0)

; Income of a person
(declare-fun income (Person) Int)

; Whether the High‑Income Child Benefit tax charge is waived
(declare-fun tax-waived (Person) Bool)

; The husband in the scenario
(declare-const husband Person)

;--- Knowledge base --------------------------------------------------
; Husband's income is £52,000
(assert (= (income husband) 52000))

; Rule from the document:
; If a person's income is over £50,000, the tax cannot be waived.
(assert (forall ((p Person))
  (=> (> (income p) 50000)
      (not (tax-waived p)))))   ; tax‑waived must be false

;--- Test the question -----------------------------------------------
; Can the tax be waived for the husband who earns £52,000 ?
(assert (tax-waived husband))

;--- Check the result ------------------------------------------------
(check-sat)   ; Expected: unsat (tax cannot be waived)
(get-model)