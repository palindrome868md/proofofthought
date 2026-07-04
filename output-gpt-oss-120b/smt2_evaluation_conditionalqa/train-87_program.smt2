;-------------------------------------------------
; Sorts
(declare-sort Person 0)

;-------------------------------------------------
; Predicates / Functions
(declare-fun served_before_2005 (Person) Bool)     ; true if the person served before 6 Apr 2005
(declare-fun death_due_to_service (Person) Bool)   ; true if death was caused by the service
(declare-fun funeral_grant_eligible (Person) Bool) ; true if a funeral‑grant can be claimed

;-------------------------------------------------
; Constants (the husband)
(declare-const husband Person)

;-------------------------------------------------
; Knowledge base (facts from the scenario)
(assert (served_before_2005 husband))        ; he served in the 1990s
(assert (death_due_to_service husband))      ; his cancer was caused by that service

;-------------------------------------------------
; Rule from the document:
; If a person served before 6 Apr 2005 AND died as a result of that service,
; then a funeral‑grant may be paid to the widow/widower.
(assert (forall ((p Person))
  (=> (and (served_before_2005 p)
           (death_due_to_service p))
      (funeral_grant_eligible p))))

;-------------------------------------------------
; Test the question: “Can I get a grant … ?”
; We assert that the grant is eligible for the husband’s widow.
(assert (funeral_grant_eligible husband))

;-------------------------------------------------
; Check satisfiability
(check-sat)   ; Expected result: sat  (the grant is possible)
(get-model)