;-----------------------------------------------------------------
;  Sorts
;-----------------------------------------------------------------
(declare-sort Person 0)

;-----------------------------------------------------------------
;  Predicates / Functions
;-----------------------------------------------------------------
; Person lacks mental capacity
(declare-fun lacksCapacity (Person) Bool)

; Person is an adult (18 or over)
(declare-fun adult (Person) Bool)

; Deputy relationship: (deputy d p) means d is a deputy for p
(declare-fun deputy (Person Person) Bool)

;-----------------------------------------------------------------
;  Constants (the individuals involved)
;-----------------------------------------------------------------
(declare-const myBrother Person)          ; your brother who has dementia
(declare-const partnersBrother Person)    ; brother of the deceased partner

;-----------------------------------------------------------------
;  Knowledge base (facts)
;-----------------------------------------------------------------
; Your brother lacks capacity
(assert (lacksCapacity myBrother))

; The partner’s brother is an adult
(assert (adult partnersBrother))

; They are distinct persons
(assert (not (= myBrother partnersBrother)))

;-----------------------------------------------------------------
;  Legal rule (from the guidance)
;  If a person lacks capacity, any adult other than themselves can be
;  appointed as a deputy.
;-----------------------------------------------------------------
(assert (forall ((d Person) (p Person))
  (=> (and (lacksCapacity p) (adult d) (not (= d p)))
      (deputy d p))))

;-----------------------------------------------------------------
;  Test the scenario: the partner's brother wants to be the deputy
;-----------------------------------------------------------------
(assert (deputy partnersBrother myBrother))

;-----------------------------------------------------------------
;  Query
;-----------------------------------------------------------------
(check-sat)
(get-model)