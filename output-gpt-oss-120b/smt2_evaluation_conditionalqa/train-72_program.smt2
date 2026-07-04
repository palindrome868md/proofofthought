;-------------------------------------------------
;  Declarations
;-------------------------------------------------
(declare-sort Person 0)
(declare-sort Benefit 0)

; The student (you) and the specific benefit
(declare-const me Person)
(declare-const childcare_grant Benefit)

; Predicate: the person receives the given benefit
(declare-fun has-grant (Person Benefit) Bool)

; Predicate: the person must repay the given benefit
(declare-fun repay (Person Benefit) Bool)

;-------------------------------------------------
;  Knowledge base (from the Childcare Grant document)
;-------------------------------------------------
; You are receiving a Childcare Grant
(assert (has-grant me childcare_grant))

; Rule: a Childcare Grant does NOT have to be repaid
(assert (forall ((p Person) (b Benefit))
  (=> (has-grant p b)
      (not (repay p b)))))   ; no repayment required

;-------------------------------------------------
;  Question to verify:
;  "Do I have to repay the grant?"
;-------------------------------------------------
; Assume you have to repay it
(assert (repay me childcare_grant))

;-------------------------------------------------
;  Check the consistency of the assumptions
;-------------------------------------------------
(check-sat)   ; Expected result: unsat (i.e., you do NOT repay)

(get-model)   ; Optional: shows a model if the problem were sat