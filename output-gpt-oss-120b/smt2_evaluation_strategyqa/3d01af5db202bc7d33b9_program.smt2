;--- Sorts ---------------------------------------------------------
(declare-sort Person 0)
(declare-sort City 0)
(declare-sort Plant 0)

;--- Constants ------------------------------------------------------
(declare-const Mumbai City)                ; the city Mumbai
(declare-const solanum-melongena Plant)    ; Solanum melongena (the plant)

;--- Functions ------------------------------------------------------
; p lives in c ?
(declare-fun resident (Person City) Bool)
; p calls plant pl by the English name `name` ?
(declare-fun refers-to (Person Plant String) Bool)

;--- Knowledge base ------------------------------------------------
; At least one person lives in Mumbai (so the city is non‑empty)
(declare-const p1 Person)
(assert (resident p1 Mumbai))

; No resident of Mumbai calls Solanum melongena "eggplant"
(assert (forall ((p Person))
  (=> (resident p Mumbai)
      (not (refers-to p solanum-melongena "eggplant")))))

;--- Test the question ---------------------------------------------
; Assume there is a person in Mumbai who does call it "eggplant"
(declare-const test-person Person)
(assert (resident test-person Mumbai))
(assert (refers-to test-person solanum-melongena "eggplant"))

;--- Check the scenario ---------------------------------------------
(check-sat)       ; Expected: unsat (the scenario cannot occur)
(get-model)      ; Optional: show the model if sat (here it will be absent)