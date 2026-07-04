;----------------------------------------
;  Sorts
;----------------------------------------
(declare-sort Person 0)
(declare-sort Account 0)

;----------------------------------------
;  Functions / Predicates
;----------------------------------------
(declare-fun deceased (Person) Bool)               ; true if the person is dead
(declare-fun owned-by (Account Person) Bool)        ; account is owned by a person
(declare-fun can-pay-from (Account) Bool)           ; account may be used for IHT payment
(declare-fun make-payment-from (Account) Bool)      ; we attempt to pay from this account

;----------------------------------------
;  Constants (the specific people / accounts in the scenario)
;----------------------------------------
(declare-const father Person)
(declare-const father_acc Account)

;----------------------------------------
;  Knowledge base (facts from the situation)
;----------------------------------------
; The father has died
(assert (deceased father))

; The account belongs to the father
(assert (owned-by father_acc father))

; Rule from HMRC: an account owned by a deceased person can be used to pay IHT
(assert (forall ((a Account) (p Person))
  (=> (and (owned-by a p) (deceased p))
      (can-pay-from a))))

; You can only make a payment from an account if that account is allowed for IHT payment
(assert (forall ((a Account))
  (=> (make-payment-from a)
      (can-pay-from a))))

;----------------------------------------
;  Test the question:
;  "Can I make the payment from deceased father's account?"
;----------------------------------------
; Attempt to pay from the father's account
(assert (make-payment-from father_acc))

;----------------------------------------
;  Query
;----------------------------------------
(check-sat)   ; Expected: sat (the payment is permissible)
(get-model)