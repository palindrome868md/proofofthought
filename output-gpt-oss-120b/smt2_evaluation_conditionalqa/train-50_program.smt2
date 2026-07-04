;----- Sorts -------------------------------------------------
(declare-sort Person 0)
(declare-sort Org    0)

;----- Constants ---------------------------------------------
(declare-const widow   Person)   ; the applicant (widow)
(declare-const husband Person)   ; the late husband
(declare-const BCC     Org)      ; British Coal Corporation

;----- Predicates / Functions --------------------------------
(declare-fun works-at          (Person Org) Bool)   ; employment
(declare-fun qualified-for-ncfs (Person) Bool)      ; employee qualified for NCFS
(declare-fun widow-of          (Person Person) Bool) ; widow relationship
(declare-fun eligible-for-ncfs (Person) Bool)      ; eligibility for the scheme

;----- Knowledge base -----------------------------------------
; Husband worked for British Coal Corporation
(assert (works-at husband BCC))

; Husband qualified for the NCFS (ex‑employee eligibility)
(assert (qualified-for-ncfs husband))

; The applicant is the widow of the husband
(assert (widow-of widow husband))

; Rule: a widow (or widower) of a qualified ex‑employee is eligible
(assert (forall ((w Person) (h Person))
  (=> (and (widow-of w h) (qualified-for-ncfs h))
      (eligible-for-ncfs w))))

;----- Test the question --------------------------------------
; Is the widow eligible for the National Concessionary Fuel Scheme?
(assert (eligible-for-ncfs widow))

;----- Decision ------------------------------------------------
(check-sat)   ; Expected: sat  (the applicant is eligible)
(get-model)