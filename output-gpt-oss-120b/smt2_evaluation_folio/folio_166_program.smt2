;--- Sorts ---------------------------------------------------------
(declare-sort Person 0)

;--- Predicates (functions returning Bool) -------------------------
(declare-fun leaderForLife (Person) Bool)   ; “is a leader for life”
(declare-fun hasPower       (Person) Bool)   ; “has power”
(declare-fun isKing         (Person) Bool)   ; “is a king”
(declare-fun isQueen        (Person) Bool)   ; “is a queen”
(declare-fun isMale         (Person) Bool)   ; “is male”
(declare-fun isFemale       (Person) Bool)   ; “is female”

;--- Knowledge base (premises) ------------------------------------
; 1. Leader for life ⇒ has power
(assert (forall ((p Person))
  (=> (leaderForLife p) (hasPower p))))

; 2. Leader for life ⇒ king ∨ queen
(assert (forall ((p Person))
  (=> (leaderForLife p) (or (isKing p) (isQueen p)))))

; 3. Queen ⇒ female
(assert (forall ((p Person))
  (=> (isQueen p) (isFemale p))))

; 4. King ⇒ male
(assert (forall ((p Person))
  (=> (isKing p) (isMale p))))

; 5. Elizabeth is a queen
(declare-const elizabeth Person)
(assert (isQueen elizabeth))

; 6. Elizabeth is a leader of a country for life
(assert (leaderForLife elizabeth))

;--- Statement to be verified --------------------------------------
; “Elizabeth has power”
(assert (hasPower elizabeth))

;--- Solver query -------------------------------------------------
(check-sat)    ; Expected: sat (the statement can be true)
(get-model)   ; Optional: shows a model that satisfies everything