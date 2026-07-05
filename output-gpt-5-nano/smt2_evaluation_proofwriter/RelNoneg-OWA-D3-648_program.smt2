; Declare sorts
(declare-sort Animal 0)

; Declare predicates
(declare-fun Round (Animal) Bool)
(declare-fun Red (Animal) Bool)
(declare-fun Young (Animal) Bool)
(declare-fun Kind (Animal) Bool)

; Declare constants
(declare-const cow Animal)

; Knowledge base
(assert (forall ((x Animal)) (=> (Kind x) (Young x))))
(assert (forall ((x Animal)) (=> (and (Round x) (Red x)) (Young x))))
(assert (forall ((x Animal)) (=> (Young x) (Round x))))
(assert (=> (and (Round cow) (Young cow)) (Kind cow)))
(assert (forall ((x Animal)) (=> (Round x) (Red x))))
(assert (forall ((x Animal)) (=> (and (Round x) (Kind x)) (Young x))))
; The cow is round
(assert (Round cow))

; Test: The cow is round.
(assert (Round cow))

; Check satisfiability
(check-sat)
(get-model)