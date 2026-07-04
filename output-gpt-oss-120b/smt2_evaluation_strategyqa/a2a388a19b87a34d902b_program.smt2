; -------------------------------------------------
; Sorts
; -------------------------------------------------
(declare-sort Person 0)            ; all individuals

; -------------------------------------------------
; Predicates / Functions
; -------------------------------------------------
(declare-fun is-landowner (Person) Bool)   ; true if the person is a land owner
(declare-fun is-ruler     (Person) Bool)   ; true if the person is a ruler (king)
(declare-fun elects       (Person Person) Bool) ; landowner elects a ruler

; -------------------------------------------------
; Constants (example individuals)
; -------------------------------------------------
(declare-const alice  Person)   ; a typical land owner
(declare-const beatrice Person) ; a typical ruler (king/queen)

; -------------------------------------------------
; Knowledge base: historical facts about Hungary
; -------------------------------------------------
; Alice is a land owner
(assert (is-landowner alice))

; Beatrice is a ruler
(assert (is-ruler beatrice))

; Rule: In the Kingdom of Hungary, every land owner elects any ruler
; (i.e., the institution gave land owners the power to choose the king)
(assert
  (forall ((l Person) (r Person))
    (=> (and (is-landowner l) (is-ruler r))
        (elects l r))))

; -------------------------------------------------
; Test the claim: "Land owners elected their rulers."
; -------------------------------------------------
; We ask whether it is possible that a land owner (alice) elects a ruler (beatrice).
(assert (elects alice beatrice))

; -------------------------------------------------
; Verification
; -------------------------------------------------
(check-sat)   ; Expected result: sat  (the claim is consistent / true)
(get-model)   ; Show a concrete model supporting the claim