;--- Sort declarations -------------------------------------------------
(declare-sort Person 0)
(declare-sort Subject 0)

;--- Function / predicate declarations ----------------------------------
(declare-fun is-ethics-professor (Person) Bool)
(declare-fun is-art-subject (Subject) Bool)
(declare-fun teaches (Person Subject) Bool)

;--- Constants -----------------------------------------------------------
(declare-const alice Person)      ; an ethics professor
(declare-const cezanne Subject)   ; a class about the painter Cezanne

;--- Knowledge base ------------------------------------------------------
; Alice is an ethics professor
(assert (is-ethics-professor alice))

; Cezanne belongs to the art domain
(assert (is-art-subject cezanne))

; Rule: Ethics professors never teach art subjects
(assert
  (forall ((p Person) (s Subject))
    (=> (and (is-ethics-professor p) (is-art-subject s))
        (not (teaches p s)))))

;--- Test scenario -------------------------------------------------------
; Would Alice teach a class on Cezanne?
(assert (teaches alice cezanne))

;--- Verification ---------------------------------------------------------
(check-sat)   ; Expected result: unsat (the scenario is impossible)
(get-model)