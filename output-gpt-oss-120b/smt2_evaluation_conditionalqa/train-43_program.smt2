;---------------------------------
; 1. Sorts
;---------------------------------
(declare-sort Person 0)
(declare-sort Child 0)

;---------------------------------
; 2. Functions / Predicates
;---------------------------------
; Facts about a person and a child
(declare-fun parental_responsibility (Person Child) Bool)   ; parent of the child
(declare-fun works_fulltime (Person) Bool)                ; works full‑time
(declare-fun employed_continuous (Person) Bool)           ; 26‑week continuous employment
(declare-fun employee_status (Person) Bool)               ; is an “employee”, not a “worker”
(declare-fun earnings_average (Person) Int)               ; average weekly earnings (£)

; Derived eligibility for SPL
(declare-fun eligible_SPL (Person) Bool)

; Taking SPL
(declare-fun take_SPL (Person) Bool)

; Two persons can take SPL at the same time
(declare-fun simultaneous_leave (Person Person) Bool)

;---------------------------------
; 3. Constants (the people involved)
;---------------------------------
(declare-const me Person)
(declare-const partner Person)
(declare-const baby Child)

;---------------------------------
; 4. Knowledge base (facts from the scenario)
;---------------------------------
; Both have parental responsibility
(assert (parental_responsibility me baby))
(assert (parental_responsibility partner baby))

; Both work full‑time
(assert (works_fulltime me))
(assert (works_fulltime partner))

; Both have the required 26‑week continuous employment
(assert (employed_continuous me))
(assert (employed_continuous partner))

; Both are “employees”
(assert (employee_status me))
(assert (employee_status partner))

; Both earn at least £120 weekly on average
(assert (>= (earnings_average me) 120))
(assert (>= (earnings_average partner) 120))

;---------------------------------
; 5. Rules (derived from the document)
;---------------------------------
; Eligibility for SPL: all the above conditions must hold
(assert (forall ((p Person))
  (=> (and (parental_responsibility p baby)
           (works_fulltime p)
           (employed_continuous p)
           (employee_status p)
           (>= (earnings_average p) 120))
      (eligible_SPL p))))

; If two persons are each eligible, they may take SPL simultaneously
(assert (forall ((p1 Person) (p2 Person))
  (=> (and (eligible_SPL p1) (eligible_SPL p2))
      (simultaneous_leave p1 p2))))

;---------------------------------
; 6. Test the question: “Can I take shared parental leave at the same time as my partner?”
;---------------------------------
(assert (simultaneous_leave me partner))

;---------------------------------
; 7. Check satisfiability
;---------------------------------
(check-sat)
(get-model)