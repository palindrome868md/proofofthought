;--- Sort declarations -------------------------------------------------
(declare-sort Person 0)
(declare-sort Country 0)
(declare-sort Child 0)

;--- Function and predicate declarations --------------------------------
; Lives‑in relation
(declare-fun lives-in (Person Country) Bool)

; Marital relation (not needed for the reasoning but declared for completeness)
(declare-fun married (Person Person) Bool)

; Custody relation: child_of(child, custodial_parent)
(declare-fun child-of (Child Person) Bool)

; Predicate meaning “a court can issue an order for the paying parent to pay
; maintenance for the child to the custodial parent”.
(declare-fun court-order-obtained (Person Person Child) Bool)

;--- Constants ----------------------------------------------------------
(declare-const mother Person)
(declare-const husband Person)
(declare-const baby   Child)

(declare-const Ghana Country)
(declare-const UK   Country)

;--- Knowledge base -----------------------------------------------------
; Persons live in the indicated countries
(assert (lives-in mother Ghana))
(assert (lives-in husband UK))

; They are married
(assert (married mother husband))

; Mother has custody of the baby
(assert (child-of baby mother))

;--- Legal rule extracted from the document -----------------------------
; If the custodial parent and the paying parent live in different countries,
; a court order can be obtained (subject to REMO arrangements, which we
; treat as always possible for the purpose of this model).
(assert (forall ((cust Person) (pay Person) (ch Child) (c1 Country) (c2 Country))
  (=> (and (lives-in cust c1)
           (lives-in pay c2)
           (not (= c1 c2))
           (child-of ch cust))
      (court-order-obtained cust pay ch))))

;--- Query: does such a court order exist for mother, husband, and baby? ---
(assert (court-order-obtained mother husband baby))

;--- Check the result ----------------------------------------------------
(check-sat)
(get-model)