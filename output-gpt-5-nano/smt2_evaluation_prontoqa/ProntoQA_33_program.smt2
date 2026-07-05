(set-logic ALL)

; Sorts
(declare-sort Person 0)

; Predicates (unary)
(declare-fun yumpus (Person) Bool)
(declare-fun temperate (Person) Bool)
(declare-fun rompus (Person) Bool)
(declare-fun large (Person) Bool)
(declare-fun impus (Person) Bool)
(declare-fun blue (Person) Bool)
(declare-fun tumpus (Person) Bool)
(declare-fun nervous (Person) Bool)
(declare-fun wumpus (Person) Bool)
(declare-fun bright (Person) Bool)
(declare-fun numpus (Person) Bool)
(declare-fun zumpus (Person) Bool)
(declare-fun fruity (Person) Bool)
(declare-fun dumpus (Person) Bool)
(declare-fun opaque (Person) Bool)
(declare-fun vumpus (Person) Bool)
(declare-fun mean (Person) Bool)
(declare-fun jompus (Person) Bool)

; Constants
(declare-const Stella Person)

; Knowledge base
(assert (yumpus Stella))                                      ; Stella is a yumpus
(assert (forall ((p Person)) (=> (yumpus p) (not (temperate p))))) ; Every yumpus is not temperate
(assert (forall ((p Person)) (=> (yumpus p) (rompus p))))             ; Yumpuses are rompuses
(assert (forall ((p Person)) (=> (rompus p) (large p))))               ; Rompus -> large
(assert (forall ((p Person)) (=> (rompus p) (impus p))))               ; Rompus -> impus
(assert (forall ((p Person)) (=> (impus p) (not (blue p)))))         ; Impus -> not blue
(assert (forall ((p Person)) (=> (impus p) (tumpus p))))               ; Impus -> tumpus
(assert (forall ((p Person)) (=> (tumpus p) (nervous p))))             ; Tumpus -> nervous
(assert (forall ((p Person)) (=> (tumpus p) (wumpus p))))               ; Tumpus -> wumpus
(assert (forall ((p Person)) (=> (wumpus p) (bright p))))             ; Wumpus -> bright
(assert (forall ((p Person)) (=> (numpus p) (not (bright p)))))      ; Numpus -> not bright
(assert (forall ((p Person)) (=> (wumpus p) (zumpus p))))               ; Wumpus -> zumpus
(assert (forall ((p Person)) (=> (zumpus p) (not (fruity p)))))       ; Zumpus -> not fruity
(assert (forall ((p Person)) (=> (zumpus p) (dumpus p))))               ; Zumpus -> dumpus
(assert (forall ((p Person)) (=> (dumpus p) (opaque p))))               ; Dumpus -> opaque
(assert (forall ((p Person)) (=> (dumpus p) (vumpus p))))               ; Dumpus -> vumpus
(assert (forall ((p Person)) (=> (vumpus p) (mean p))))                 ; Vumpus -> mean
(assert (forall ((p Person)) (=> (vumpus p) (jompus p))))               ; Vumpus -> jompus

; Test scenario: Is "Stella is not bright" true?
(assert (not (bright Stella)))

; Verification: check satisfiability
(check-sat)
(get-model)