; Declare sorts
(declare-sort Person 0)

; Declare predicates (unary relations)
(declare-fun Vumpus (Person) Bool)
(declare-fun Tumpus (Person) Bool)
(declare-fun Wumpus (Person) Bool)
(declare-fun Rompus (Person) Bool)
(declare-fun Zumpus (Person) Bool)
(declare-fun Dumpus (Person) Bool)
(declare-fun Numpus (Person) Bool)
(declare-fun Jompus (Person) Bool)
(declare-fun Yumpus (Person) Bool)
(declare-fun Floral (Person) Bool)
(declare-fun Brown (Person) Bool)
(declare-fun Small (Person) Bool)
(declare-fun Happy (Person) Bool)
(declare-fun Impus (Person) Bool)
(declare-fun Amenable (Person) Bool)
(declare-fun Metallic (Person) Bool)
(declare-fun Bitter (Person) Bool)
(declare-fun Cold (Person) Bool)
(declare-fun Wompus (Person) Bool)  ; if you want to keep naming consistent with Wumpus
(declare-fun Wren ( ) Bool) ; dummy to satisfy potential naming; not used
(declare-const wren Person)

; Knowledge base (facts and rules)

; Facts
(assert (Tumpus wren))

; Rules (universal implications)
(assert (forall ((x Person)) (=> (Vumpus x) (Tumpus x))))
(assert (forall ((x Person)) (=> (Vumpus x) (Floral x))))
(assert (forall ((x Person)) (=> (Tumpus x) (Brown x))))
(assert (forall ((x Person)) (=> (Tumpus x) (Wumpus x))))
(assert (forall ((x Person)) (=> (Wumpus x) (Small x))))
(assert (forall ((x Person)) (=> (Wumpus x) (Rompus x))))
(assert (forall ((x Person)) (=> (Rompus x) (Happy x))))
(assert (forall ((x Person)) (=> (Rompus x) (Impus x))))
(assert (forall ((x Person)) (=> (Impus x) (Amenable x))))
(assert (forall ((x Person)) (=> (Impus x) (Dumpus x))))
(assert (forall ((x Person)) (=> (Dumpus x) (Numpus x))))
(assert (forall ((x Person)) (=> (Numpus x) (Bitter x))))
(assert (forall ((x Person)) (=> (Numpus x) (Jompus x))))
(assert (forall ((x Person)) (=> (Jompus x) (Cold x))))
(assert (forall ((x Person)) (=> (Jompus x) (Yumpus x))))
(assert (forall ((x Person)) (=> (Zumpus x) (Metallic x))))
; (Optional) ensure rompus implies happy (explicitly stated in text)
(assert (forall ((x Person)) (=> (Rompus x) (Happy x))))

; Additional linking rules to ensure the chain is possible
; (Already covered by the above universal rules)

; Test: Is "Wren is not metallic" true?
; We test by asserting the negation of Metallic(wren) and see if the KB remains satisfiable
(assert (not (Metallic wren)))
(check-sat)
(get-model)