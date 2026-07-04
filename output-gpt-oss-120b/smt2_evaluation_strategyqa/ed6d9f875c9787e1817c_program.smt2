; -------------------------------------------------
;  Declarations
; -------------------------------------------------
(declare-sort Person 0)
(declare-sort Technology 0)

; Birth‑ and death‑year of a person
(declare-fun born (Person) Int)
(declare-fun died (Person) Int)

; Invention year of a technology
(declare-fun invented (Technology) Int)

; Predicate: a person’s speech was recorded live to a given technology
(declare-fun recorded-to-cd (Person) Bool)

; -------------------------------------------------
;  Constants
; -------------------------------------------------
(declare-const george-washington Person)
(declare-const compact-disc Technology)

; -------------------------------------------------
;  Knowledge Base
; -------------------------------------------------
; Washington’s lifetime
(assert (= (born george-washington) 1732))
(assert (= (died george-washington) 1799))

; CD invention year (historical)
(assert (= (invented compact-disc) 1979))

; Rule: To be recorded live to a CD, the speaker must still be alive
;       when the CD technology exists.
(assert (forall ((p Person) (t Technology))
  (=> (recorded-to-cd p)
      (>= (died p) (invented t)))))

; -------------------------------------------------
;  Test the proposition
; -------------------------------------------------
; Assume Washington’s speech was recorded live to a CD
(assert (recorded-to-cd george-washington))

; -------------------------------------------------
;  Verification
; -------------------------------------------------
(check-sat)      ; Expected: unsat (the scenario is impossible)
(get-model)