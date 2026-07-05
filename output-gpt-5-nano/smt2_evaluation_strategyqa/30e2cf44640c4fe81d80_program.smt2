; Question: Is the Illuminati card game still popular?

(declare-sort Game 0)

; Predicate: popular(G) is true if game G is popular
(declare-fun popular (Game) Bool)

; Constant: the Illuminati card game
(declare-const illuminati Game)

; Knowledge base (assumed): Illuminati is not popular
(assert (not (popular illuminati)))

; Test scenario: Is Illuminati still popular?
(assert (popular illuminati))

; Check satisfiability to answer the question
(check-sat)