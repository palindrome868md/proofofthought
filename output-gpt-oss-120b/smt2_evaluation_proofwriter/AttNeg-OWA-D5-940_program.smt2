;--- Sorts -------------------------------------------------
(declare-sort Person 0)

;--- Predicates (unary functions) ---------------------------
(declare-fun blue   (Person) Bool)
(declare-fun green  (Person) Bool)
(declare-fun rough  (Person) Bool)
(declare-fun red    (Person) Bool)
(declare-fun quiet  (Person) Bool)
(declare-fun cold   (Person) Bool)
(declare-fun young  (Person) Bool)

;--- Constants --------------------------------------------
(declare-const charlie Person)
(declare-const dave    Person)
(declare-const erin    Person)
(declare-const harry   Person)

;--- Knowledge base (facts) -------------------------------
(assert (blue  charlie))      ; Charlie is blue
(assert (green charlie))      ; Charlie is green
(assert (rough dave))         ; Dave is rough
(assert (not (cold  erin)))   ; Erin is not cold
(assert (green erin))         ; Erin is green
(assert (rough erin))         ; Erin is rough
(assert (young erin))         ; Erin is young
(assert (green harry))        ; Harry is green
(assert (red   harry))        ; Harry is red
(assert (rough harry))        ; Harry is rough
(assert (not (young harry)))  ; Harry is not young

;--- General rules -----------------------------------------

; All rough people are red
(assert (forall ((p Person))
  (=> (rough p) (red p))))

; If someone is blue then they are rough
(assert (forall ((p Person))
  (=> (blue p) (rough p))))

; All green people are rough
(assert (forall ((p Person))
  (=> (green p) (rough p))))

; If someone is quiet then they are cold
(assert (forall ((p Person))
  (=> (quiet p) (cold p))))

; If Harry is blue then Harry is green
(assert (=> (blue harry) (green harry)))

; If Dave is blue and Dave is red then Dave is quiet
(assert (=> (and (blue dave) (red dave)) (quiet dave)))

; Rough, red people are blue
(assert (forall ((p Person))
  (=> (and (rough p) (red p)) (blue p))))

; Green, cold people are not quiet
(assert (forall ((p Person))
  (=> (and (green p) (cold p)) (not (quiet p)))))

; Cold people are not young
(assert (forall ((p Person))
  (=> (cold p) (not (young p)))))

;--- Query ------------------------------------------------
; Test the claim: "Charlie is not red"
(assert (not (red charlie)))

;--- Solve ------------------------------------------------
(check-sat)   ; Expected result: unsat (the claim is false)
(get-model)