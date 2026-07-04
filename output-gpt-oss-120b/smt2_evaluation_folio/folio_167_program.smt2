; -------------------------------------------------
;  Declarations
; -------------------------------------------------
(declare-sort Person 0)

; Functions / predicates
(declare-fun leaderForLife (Person) Bool)   ; person is leader for life
(declare-fun hasPower      (Person) Bool)   ; person has power
(declare-fun isKing        (Person) Bool)   ; person is a king
(declare-fun isQueen       (Person) Bool)   ; person is a queen
(declare-fun isMale        (Person) Bool)   ; person is male
(declare-fun isFemale      (Person) Bool)   ; person is female

; Constant
(declare-const Elizabeth Person)

; -------------------------------------------------
;  Knowledge base (premises)
; -------------------------------------------------
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
(assert (isQueen Elizabeth))

; 6. Elizabeth is a leader of a country for life
(assert (leaderForLife Elizabeth))

; -------------------------------------------------
;  Test the statement
; -------------------------------------------------
; Statement to verify: "Elizabeth is a leader of a country for life."
; (already asserted above, but we assert again for clarity)
(assert (leaderForLife Elizabeth))

; -------------------------------------------------
;  Check satisfiability
; -------------------------------------------------
(check-sat)   ; Expected result: sat (the statement is true)
(get-model)   ; Optional: shows a model that satisfies all constraints