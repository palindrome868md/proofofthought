; -------------------------------------------------
; 1. Declare the uninterpreted sort for people
; -------------------------------------------------
(declare-sort Person 0)

; -------------------------------------------------
; 2. Declare predicates
; -------------------------------------------------
; has-wbc(p)  –  p has white blood cells
; dies(p)     –  p is dead (has died)
(declare-fun has-wbc (Person) Bool)
(declare-fun dies    (Person) Bool)

; -------------------------------------------------
; 3. Knowledge base
;    If a person lacks white blood cells, then that person dies.
; -------------------------------------------------
(assert (forall ((p Person))
  (=> (not (has-wbc p))
      (dies p))))

; -------------------------------------------------
; 4. Witness person that lacks white blood cells and dies
; -------------------------------------------------
(declare-const witness Person)
(assert (not (has-wbc witness)))   ; no white blood cells
(assert (dies witness))            ; the person dies

; -------------------------------------------------
; 5. Check whether such a situation is possible
; -------------------------------------------------
(check-sat)
(get-model)