; Sorts
(declare-sort Person 0)

; Predicates (uninterpreted relations)
(declare-fun yumpus (Person) Bool)
(declare-fun impus (Person) Bool)
(declare-fun jompus (Person) Bool)
(declare-fun rompus (Person) Bool)
(declare-fun wumpus (Person) Bool)
(declare-fun vumpus (Person) Bool)
(declare-fun zumpus (Person) Bool)

(declare-fun red (Person) Bool)
(declare-fun feisty (Person) Bool)
(declare-fun spicy (Person) Bool)
(declare-fun dumpus (Person) Bool)
(declare-fun luminous (Person) Bool)
(declare-fun tumpus (Person) Bool)
(declare-fun small (Person) Bool)
(declare-fun earthy (Person) Bool)
(declare-fun numbpus (Person) Bool)  ; intentional naming to avoid clash with "numpus" spelling
(declare-fun numbup (Person) Bool)   ; placeholder to avoid confusion (not used)
(declare-fun numpus (Person) Bool)

(declare-fun angry (Person) Bool)
; Note: Some names chosen to reflect the narrative; only those used are necessary.

; Constants
(declare-const Sally Person)

; Knowledge base (facts)
(assert (yumpus Sally))

; Global rules derived from the narrative
(assert (forall ((p Person)) (=> (yumpus p) (impus p))))
(assert (forall ((p Person)) (=> (impus p) (jompus p))))
(assert (forall ((p Person)) (=> (impus p) (red p))))
(assert (forall ((p Person)) (=> (jompus p) (not (feisty p)))))
(assert (forall ((p Person)) (=> (jompus p) (rompus p))))
(assert (forall ((p Person)) (=> (rompus p) (angry p))))
(assert (forall ((p Person)) (=> (rompus p) (wumpus p))))
(assert (forall ((p Person)) (=> (wumpus p) (spicy p))))
(assert (forall ((p Person)) (=> (wumpus p) (vumpus p))))
(assert (forall ((p Person)) (=> (vumpus p) (not (small p)))))
(assert (forall ((p Person)) (=> (vumpus p) (numpus p))))
(assert (forall ((p Person)) (=> (numpus p) (earthy p))))
(assert (forall ((p Person)) (=> (numpus p) (tumpus p))))
(assert (forall ((p Person)) (=> (tumpus p) (luminous p))))
(assert (forall ((p Person)) (=> (tumpus p) (dumpus p))))
(assert (forall ((p Person)) (=> (zumpus p) (not (spicy p)))))

; Test scenario: Is Sally spicy?
(assert (spicy Sally))

; Check satisfiability and provide a model
(check-sat)
(get-model)