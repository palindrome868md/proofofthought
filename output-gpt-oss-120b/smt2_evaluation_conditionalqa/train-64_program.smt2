;-------------------------------------------------
;  Sorts
;-------------------------------------------------
(declare-sort Person 0)

;-------------------------------------------------
;  Functions / Predicates
;-------------------------------------------------
(declare-fun injured-while-serving (Person) Bool)   ; injured while in the forces
(declare-fun injury-year (Person) Int)              ; calendar year of injury
(declare-fun current-year () Int)                  ; present calendar year
(declare-fun late-onset (Person) Bool)             ; illness worsened later
(declare-fun claim-eligible (Person) Bool)         ; can claim compensation

;-------------------------------------------------
;  Policy Rules (knowledge base)
;-------------------------------------------------
; 1. Injuries before 6 April 2005 – no time limit
(assert (forall ((p Person) (y Int))
  (=> (and (injured-while-serving p)
           (= (injury-year p) y)
           (< y 2005))               ; 2005‑04‑06 is year 2005, we use year <2005
      (claim-eligible p))))

; 2. Injuries on/after 6 April 2005 – must be within 7 years
;    or be a late‑onset illness
(assert (forall ((p Person) (y Int))
  (=> (and (injured-while-serving p)
           (= (injury-year p) y)
           (>= y 2005))               ; injury on/after 2005
      (=> (or (<= (- (current-year) y) 7)   ; within 7 years
              (late-onset p))               ; or late‑onset illness
          (claim-eligible p)))))

;-------------------------------------------------
;  Specific case: the asker
;-------------------------------------------------
(declare-const me Person)

; He was injured while serving
(assert (injured-while-serving me))

; Injury happened in 2016 (10 years before the current year 2026)
(assert (= (injury-year me) 2016))

; Current calendar year
(assert (= (current-year) 2026))

; Illness has worsened later → qualifies as late‑onset
(assert (late-onset me))

;-------------------------------------------------
;  Test the question: “Can I still claim compensation?”
;-------------------------------------------------
; We assert that the person is claim‑eligible and ask Z3 if this fits the KB.
(assert (claim-eligible me))

;-------------------------------------------------
;  Solve
;-------------------------------------------------
(check-sat)
(get-model)