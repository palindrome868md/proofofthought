;--- Declarations -------------------------------------------------
(declare-sort Church 0)
(declare-sort Person 0)

(declare-fun is-catholic (Church) Bool)
(declare-fun recognizes-saint (Church Person) Bool)
(declare-fun canonized-by-papacy (Person) Bool)

(declare-const ugcc Church)          ; Ukrainian Greek Catholic Church
(declare-const alexander Person)     ; Alexander Nevsky

;--- Knowledge Base ------------------------------------------------
; UGCC is a Catholic church
(assert (is-catholic ugcc))

; Alexander Nevsky has NOT been canonized by the papacy
(assert (not (canonized-by-papacy alexander)))

; Catholic churches only recognize saints that are papally canonized
(assert (forall ((c Church) (p Person))
  (=> (and (is-catholic c) (recognizes-saint c p))
      (canonized-by-papacy p))))

;--- Test the claim ------------------------------------------------
; Claim: UGCC recognizes Alexander Nevsky as a saint
(assert (recognizes-saint ugcc alexander))

;--- Solving -------------------------------------------------------
(check-sat)   ; Expected result: unsat (the claim is false)
(get-model)