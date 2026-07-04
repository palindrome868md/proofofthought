;--- Sorts ---------------------------------------------------------
(declare-sort Person 0)   ; generic person sort
(declare-sort Relationship 0) ; kind of relationship (widowhood)

;--- Functions ------------------------------------------------------
; Relationship between a widow and her deceased spouse
(declare-fun is-widow (Person Person) Bool)   ; (widow, deceased)

; Did the deceased die as a result of service **before** 6 Apr 2005 ?
(declare-fun died-before-2005 (Person) Bool)

; Did the deceased die as a result of service **after** 6 Apr 2005 ?
(declare-fun died-after-2005 (Person) Bool)

; Can the widow claim the War Widow Pension ?
(declare-fun can-claim-pension (Person) Bool)

;--- Knowledge Base ------------------------------------------------
; Rule: a widow can claim the pension only if her spouse died as a
; result of service **before** 6 April 2005 (other historic categories
; are omitted here because they do not apply to the present case).
(assert (forall ((w Person) (h Person))
  (=> (and (is-widow w h) (died-before-2005 h))
      (can-claim-pension w))))

; Facts from the scenario
(declare-const aunt Person)      ; the aunt (widow)
(declare-const husband Person)   ; her late husband

; She is the widow of her husband
(assert (is-widow aunt husband))

; Husband died in an ambush in Iraq → death **after** 6 Apr 2005
(assert (died-after-2005 husband))

; Therefore he did **not** die before 6 Apr 2005
(assert (not (died-before-2005 husband)))

;--- Question ------------------------------------------------------
; Test whether the aunt can claim the War Widow Pension
(assert (can-claim-pension aunt))

;--- Check ---------------------------------------------------------
(check-sat)   ; expected: unsat (she cannot claim)
(get-model)