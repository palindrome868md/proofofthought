;--- Sorts ---------------------------------------------------------
(declare-sort Person 0)

;--- Enumerated role datatype --------------------------------------
(declare-datatypes () ((Role
  (personal_welfare_deputy)
  (financial_deputy)
  (court_of_protection))))

;--- Functions ----------------------------------------------------
(declare-fun has_role (Person Role) Bool)          ; deputy‑ship role
(declare-fun has_capacity (Person) Bool)           ; can make a will himself?
(declare-fun can_apply_change_will (Person) Bool) ; may apply to Court of Protection

;--- Constants ----------------------------------------------------
(declare-const father Person)   ; the 75‑year‑old father
(declare-const user   Person)   ; you, the personal‑welfare deputy

;--- Knowledge base -----------------------------------------------
; Father lacks the mental capacity to make or change his will
(assert (not (has_capacity father)))

; You hold the personal‑welfare deputy role for your father
(assert (has_role user personal_welfare_deputy))

; Rule (from the guidance):
; If a person is the personal‑welfare deputy of someone who lacks capacity,
; that person may apply to the Court of Protection to make or change a will.
(assert (forall ((p Person) (r Role))
  (=> (and (has_role p r)
           (= r personal_welfare_deputy)
           (not (has_capacity father)))   ; the principal lacks capacity
      (can_apply_change_will p))))

;--- Test the question ---------------------------------------------
; Assert that you are able to apply to change the will
(assert (can_apply_change_will user))

;--- Decision ------------------------------------------------------
(check-sat)   ; Expected result: sat (the application is permissible)
(get-model)