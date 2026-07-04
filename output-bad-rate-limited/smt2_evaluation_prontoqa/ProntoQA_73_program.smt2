; Declare sorts
(declare-sort Person 0)

; Declare predicates (uninterpreted for this reasoning)
(declare-fun Rompuse (Person) Bool)
(declare-fun Yumpuse (Person) Bool)
(declare-fun Jompuse (Person) Bool)
(declare-fun Impuse (Person) Bool)
(declare-fun Numpuse (Person) Bool)
(declare-fun Vumpuse (Person) Bool)
(declare-fun Earthy (Person) Bool)
(declare-fun Blue (Person) Bool)
(declare-fun Dumpuse (Person) Bool)

; Declare constants
(declare-const Wren Person)

; Knowledge base
(assert (Rompuse Wren))

; Rules (universal)
(assert (forall ((p Person)) (=> (Rompuse p) (Yumpuse p))))
(assert (forall ((p Person)) (=> (Yumpuse p) (Jompuse p))))
(assert (forall ((p Person)) (=> (Jompuse p) (Impuse p))))
(assert (forall ((p Person)) (=> (Impuse p) (Numpuse p))))
(assert (forall ((p Person)) (=> (Numpuse p) (Earthy p))))
(assert (forall ((p Person)) (=> (Jompuse p) (not (Blue p)))))
(assert (forall ((p Person)) (=> (Dumpuse p) (not (Earthy p)))))
(assert (forall ((p Person)) (=> (Numpuse p) (Vumpuse p))))

; Test scenario: Wren is not earthy
(assert (not (Earthy Wren)))

; Check satisfiability: does there exist a model where Wren is not earthy along with the knowledge base?
(check-sat)
(get-model)