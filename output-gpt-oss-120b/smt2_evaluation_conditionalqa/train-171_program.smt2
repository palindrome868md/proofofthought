;--- Sorts -------------------------------------------------
(declare-sort Person 0)

;--- Functions / Predicates --------------------------------
(declare-fun married (Person Person) Bool)          ; they are married
(declare-fun cannot_agree (Person Person) Bool)    ; no agreement on assets
(declare-fun can_go_to_court (Person Person) Bool) ; court may decide

;--- Constants --------------------------------------------
(declare-const alice Person)
(declare-const bob   Person)

;--- Knowledge base ----------------------------------------
; They are married
(assert (married alice bob))

; They cannot agree on how to divide the assets
(assert (cannot_agree alice bob))

; Rule from the document: if parties cannot agree, they may ask a court to decide
(assert (forall ((p1 Person) (p2 Person))
        (=> (cannot_agree p1 p2)
            (can_go_to_court p1 p2))))

;--- Test the question -------------------------------------
; Ask: “Can we go to court and get them to decide?”
(assert (can_go_to_court alice bob))

;--- Check the result ---------------------------------------
(check-sat)   ; expected: sat  (the statement can be true)
(get-model)