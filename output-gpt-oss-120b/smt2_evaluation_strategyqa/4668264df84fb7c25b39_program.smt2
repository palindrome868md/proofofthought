;--- Sorts ---------------------------------------------------------
(declare-sort Person 0)

;--- Predicates ----------------------------------------------------
; p is a member of the police force
(declare-fun is-police (Person) Bool)
; p can perform a lawful arrest
(declare-fun lawful-arrest (Person) Bool)

;--- Knowledge base ------------------------------------------------
; Every police officer can lawfully arrest.
(assert (forall ((p Person))
  (=> (is-police p) (lawful-arrest p))))

;--- Existence of a police member ----------------------------------
(declare-const p Person)
(assert (is-police p))          ; p is a police officer

;--- Test the possibility -------------------------------------------
; We ask whether p can lawfully arrest.
(assert (lawful-arrest p))

;--- Solve ---------------------------------------------------------
(check-sat)
(get-model)