;-------------------------------------------------
; 1.  Declare the uninterpreted sort for persons
;-------------------------------------------------
(declare-sort Person 0)

;-------------------------------------------------
; 2.  Declare predicates (unary functions returning Bool)
;-------------------------------------------------
(declare-fun leader_for_life (Person) Bool)   ; “is a leader for life”
(declare-fun has_power      (Person) Bool)   ; “has power”
(declare-fun king           (Person) Bool)   ; “is a king”
(declare-fun queen          (Person) Bool)   ; “is a queen”
(declare-fun male           (Person) Bool)   ; “is male”
(declare-fun female         (Person) Bool)   ; “is female”

;-------------------------------------------------
; 3.  Declare the constant representing Elizabeth
;-------------------------------------------------
(declare-const elizabeth Person)

;-------------------------------------------------
; 4.  Encode the premises
;-------------------------------------------------
; (1) Leader for life ⇒ has power
(assert (forall ((p Person))
  (=> (leader_for_life p) (has_power p))))

; (2) Leader for life ⇒ (king ∨ queen)
(assert (forall ((p Person))
  (=> (leader_for_life p) (or (king p) (queen p)))))

; (3) Queen ⇒ female
(assert (forall ((p Person))
  (=> (queen p) (female p))))

; (4) King ⇒ male
(assert (forall ((p Person))
  (=> (king p) (male p))))

; (5) King and queen are mutually exclusive
(assert (forall ((p Person))
  (=> (king p) (not (queen p)))))

; (6) Elizabeth is a queen
(assert (queen elizabeth))

; (7) Elizabeth is a leader for life
(assert (leader_for_life elizabeth))

;-------------------------------------------------
; 8.  Test the statement: “Elizabeth is a king”
;-------------------------------------------------
(assert (king elizabeth))

;-------------------------------------------------
; 9.  Ask Z3 whether this can hold together with the premises
;-------------------------------------------------
(check-sat)
(get-model)