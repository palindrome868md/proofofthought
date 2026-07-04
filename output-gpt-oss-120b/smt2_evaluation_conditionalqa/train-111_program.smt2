;--- Sorts -------------------------------------------------
(declare-sort Person 0)

;--- Constants ---------------------------------------------
(declare-const mother Person)
(declare-const ex_partner Person)

;--- Predicates / Functions --------------------------------
; Capacity and health
(declare-fun has_dementia (Person) Bool)
(declare-fun has_capacity (Person) Bool)          ; true → capacity present

; Visitor background
(declare-fun has_domestic_violence_conviction (Person) Bool)

; Effect of a visit
(declare-fun causes_distress (Person Person) Bool) ; (person, visitor)

; Court’s power
(declare-fun court_can_issue_prevent_order (Person Person) Bool)

;--- Knowledge base -----------------------------------------

; Mother’s condition
(assert (has_dementia mother))
; After four years of dementia she is deemed to lack capacity
(assert (not (has_capacity mother)))

; Ex‑partner’s criminal background
(assert (has_domestic_violence_conviction ex_partner))

; The prospect of his visit distresses the mother
(assert (causes_distress mother ex_partner))

; Legal rule (derived from the Court of Protection practice):
; If a person lacks capacity, has dementia, the visitor has a domestic‑violence
; conviction, and the visit would cause distress, the court may grant a
; one‑off preventive order.
(assert (forall ((p Person) (v Person))
  (=> (and (has_dementia p)
           (not (has_capacity p))
           (has_domestic_violence_conviction v)
           (causes_distress p v))
      (court_can_issue_prevent_order p v))))

;--- Question to verify -------------------------------------

; Can a preventive order be obtained for the ex‑partner’s visit?
(assert (court_can_issue_prevent_order mother ex_partner))

;--- Query -------------------------------------------------
(check-sat)
(get-model)