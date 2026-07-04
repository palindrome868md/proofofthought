; Declaration of sorts
(declare-sort Person 0)
(declare-sort Language 0)

; Constants
(declare-const LanguageA Language)
(declare-const katya Person)
(declare-const danil Person)

; Predicates / Functions
(declare-fun universal (Language) Bool)
(declare-fun knows (Person Language) Bool)
(declare-fun communicates (Person Person) Bool)

; Knowledge base
(assert (universal LanguageA))
(assert (knows katya LanguageA))
(assert (not (communicates katya danil)))

; Rule: If a universal language exists, then for all p1, p2, if they both know LanguageA then they can communicate
(assert (=> (universal LanguageA)
            (forall ((p1 Person) (p2 Person))
              (=> (and (knows p1 LanguageA) (knows p2 LanguageA))
                  (communicates p1 p2)))))

; Test: Does Danil know LanguageA?
(assert (knows danil LanguageA))

; Check satisfiability to answer the question
(check-sat)
(get-model)