;--- Sorts ---------------------------------------------------------
(declare-sort Person 0)
(declare-sort Language 0)

;--- Functions ------------------------------------------------------
; universal language predicate
(declare-fun universal (Language) Bool)

; knowledge relation: person knows a language
(declare-fun knows (Person Language) Bool)

; communication relation between two persons
(declare-fun communicate (Person Person) Bool)

;--- Constants ------------------------------------------------------
(declare-const Katya Person)
(declare-const Danil Person)
(declare-const LanguageA Language)

;--- Knowledge base (premises) --------------------------------------
; 1. LanguageA is universal
(assert (universal LanguageA))

; 2. If a universal language exists, then any two people who both know
;    the same universal language can communicate.
;    (We encode the implication directly; the existence of a universal
;    language is already asserted above.)
(assert
  (forall ((p Person) (q Person) (l Language))
    (=> (and (universal l) (knows p l) (knows q l))
        (communicate p q))))

; 3. Katya knows LanguageA
(assert (knows Katya LanguageA))

; 4. Katya cannot communicate with Danil
(assert (not (communicate Katya Danil)))

;--- Test the statement ---------------------------------------------
; Statement to verify: Danil knows LanguageA
(assert (knows Danil LanguageA))

;--- Check consistency ------------------------------------------------
(check-sat)   ; expected result: unsat (statement is false)
(get-model)