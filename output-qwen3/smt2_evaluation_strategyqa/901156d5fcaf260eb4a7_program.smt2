; Declare sorts
(declare-sort Fish 0)

; Declare enumerated datatype for water temperature types
(declare-datatypes () ((TempType (cold) (warm))))

; Declare functions
(declare-fun is-anchovy (Fish) Bool)
(declare-fun population-count (Fish TempType) Int)

; Declare constants
(declare-const anchovy Fish)

; Knowledge base
(assert (is-anchovy anchovy))

; Biological fact: Anchovies are more abundant in warmer waters
; Anchovies typically inhabit temperate to tropical coastal waters
(assert (> (population-count anchovy warm) 
           (population-count anchovy cold)))

; Test the question: Do more anchovy live in colder waters than warmer?
; We assert this claim and check if it's satisfiable with our knowledge base
(assert (> (population-count anchovy cold)
           (population-count anchovy warm)))

; Check satisfiability
(check-sat)
; Expected result: unsat (the claim contradicts the knowledge base)
; This means: NO, more anchovy do NOT live in colder waters than warmer

(get-model)