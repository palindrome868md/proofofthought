; Question: Is the best tasting part of the papaya in the center?

; Declare sorts
(declare-sort Fruit 0)
(declare-sort FruitPart 0)
(declare-sort Location 0)

; Declare functions
(declare-fun best-tasting-part (Fruit) FruitPart)
(declare-fun part-location (FruitPart) Location)
(declare-fun is-center (Location) Bool)
(declare-fun is-papaya (Fruit) Bool)

; Declare constants
(declare-const papaya Fruit)
(declare-const papaya-flesh FruitPart)
(declare-const center Location)
(declare-const outer Location)

; Knowledge base - facts about papaya
(assert (is-papaya papaya))
(assert (is-center center))
(assert (not (is-center outer)))

; Fact: The flesh is the best tasting part of papaya
(assert (= (best-tasting-part papaya) papaya-flesh))

; Fact: The flesh of papaya is located in the center
(assert (= (part-location papaya-flesh) center))

; Test: Is the best tasting part of papaya in the center?
; We assert this claim and check if it's consistent with our knowledge base
(assert (is-center (part-location (best-tasting-part papaya))))

; Check satisfiability
(check-sat)
(get-model)