; Sorts
(declare-sort Person 0)
(declare-sort Language 0)

; Constants
(declare-const LanguageA Language)
(declare-const Katya Person)
(declare-const Danil Person)

; Predicates / Functions
(declare-fun knows (Person Language) Bool)
(declare-fun is-universal (Language) Bool)
(declare-fun can-communicate (Person Person) Bool)

; Knowledge base
(assert (is-universal LanguageA))  ; LanguageA is a universal language

; If a universal language exists, then for any two people if they both know it, they can communicate
(assert (forall ((p1 Person) (p2 Person))
  (=> (and (knows p1 LanguageA) (knows p2 LanguageA) (is-universal LanguageA))
      (can-communicate p1 p2))))

; Katya knows LanguageA
(assert (knows Katya LanguageA))

; Katya cannot communicate with Danil
(assert (not (can-communicate Katya Danil)))

; Test scenario: Danil knows LanguageA
(assert (knows Danil LanguageA))

; Query: Is the statement "Danil knows LanguageA" true?
(check-sat)