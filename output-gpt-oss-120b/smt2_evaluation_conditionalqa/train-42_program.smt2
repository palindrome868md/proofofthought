;--- Sorts ---------------------------------------------------------
(declare-sort Person 0)

;--- Functions / Predicates ----------------------------------------
(declare-fun age (Person) Int)                ; person's age
(declare-fun hasBankAccount (Person) Bool)    ; true if the person has a UK bank account
(declare-fun mentallyIncapable (Person) Bool) ; true if the person cannot manage own affairs
(declare-fun isBrother (Person Person) Bool)  ; sibling relationship
(declare-fun isAppointee (Person Person) Bool) ; a is appointed for b

;--- Constants ------------------------------------------------------
(declare-const me Person)        ; the question‑asker
(declare-const brother Person)   ; the brother with schizophrenia

;--- Knowledge base (facts) ----------------------------------------
; ages
(assert (= (age me) 28))
(assert (= (age brother) 30))

; bank account
(assert (hasBankAccount me))

; brother is mentally incapable (sectioned under the Mental Health Act)
(assert (mentallyIncapable brother))

; sibling relationship
(assert (isBrother me brother))

;--- Rules from the document ----------------------------------------
; To be an appointee you must be over 18 and have a bank account,
; and the person you act for must be mentally incapable.
(assert (forall ((a Person) (b Person))
  (=> (and (> (age a) 18)
           (hasBankAccount a)
           (mentallyIncapable b))
      (isAppointee a b))))

;--- Test the specific question --------------------------------------
; Can "me" be appointed for "brother"?
(assert (isAppointee me brother))

;--- Check the result -----------------------------------------------
(check-sat)
(get-model)