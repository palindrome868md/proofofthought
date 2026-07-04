;--- Sorts ---------------------------------------------------------
(declare-sort Person 0)

;--- Functions -----------------------------------------------------
(declare-fun age (Person) Int)                     ; age in years
(declare-fun cheating (Person) Bool)               ; partner is cheating
(declare-fun partnership_duration (Person Person) Int) ; years together
(declare-fun can_end (Person) Bool)                ; can petition dissolution

;--- Constants -----------------------------------------------------
(declare-const me Person)
(declare-const partner Person)

;--- Knowledge base -----------------------------------------------
; ages
(assert (= (age me) 34))
(assert (= (age partner) 36))

; partnership length = 2 years (>= 1 year required)
(assert (= (partnership_duration me partner) 2))

; partner is cheating (sexual unfaithfulness)
(assert (cheating partner))

; Rule: cheating + partnership >= 1 year ⇒ petitioner can end partnership
(assert (forall ((p Person) (q Person))
  (=> (and (cheating q)
           (>= (partnership_duration p q) 1))
      (can_end p))))

;--- Test the question ---------------------------------------------
; Is it possible for "me" to end the civil partnership?
(assert (can_end me))

;--- Check ---------------------------------------------------------
(check-sat)
(get-model)