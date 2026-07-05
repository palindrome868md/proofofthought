; Declare a generic entity sort to model individuals
(declare-sort Entity 0)

; Predicates representing categories and properties
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-tumpus (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)
(declare-fun is-impus (Entity) Bool)
(declare-fun is-vumpus (Entity) Bool)
(declare-fun is-numpus (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-jompus (Entity) Bool)
(declare-fun is-zumpus (Entity) Bool)
(declare-fun is-ramnum? (Entity) Bool) ; placeholder (not used)
(declare-fun is-amenable (Entity) Bool)
(declare-fun is-floral (Entity) Bool)
(declare-fun is-orange (Entity) Bool)
(declare-fun is-wooden (Entity) Bool)
(declare-fun is-rompus (Entity) Bool)
(declare-fun is-shy (Entity) Bool
)
(declare-fun is-small (Entity) Bool)
(declare-fun is-bitter (Entity) Bool)

; Wren as a constant individual
(declare-const wren Entity)

; Knowledge base (the given statements)

; 1) Every dumpus is not shy.
(assert (forall ((d Entity)) (=> (is-dumpus d) (not (is-shy d)))))

; 2) Each dumpus is a tumpus.
(assert (forall ((d Entity)) (=> (is-dumpus d) (is-tumpus d))))

; 3) Rompuses are not wooden.
(assert (forall ((r Entity)) (=> (is-rompus r) (not (is-wooden r)))))

; 4) Tumpuses are opaque. (Not needed for reasoning about wooden, so omitted)

; 5) Every tumpus is a wumpus.
(assert (forall ((t Entity)) (=> (is-tumpus t) (is-wumpus t))))

; 6) Wumpuses are not floral.
(assert (forall ((w Entity)) (=> (is-wumpus w) (not (is-floral w)))))

; 7) Each wumpus is an impus.
(assert (forall ((w Entity)) (=> (is-wumpus w) (is-impus w))))

; 8) Impuses are bitter.
(assert (forall ((i Entity)) (=> (is-impus i) (is-bitter i))))

; 9) Every impus is a vumpus.
(assert (forall ((i Entity)) (=> (is-impus i) (is-vumpus i))))

; 10) Vumpuses are small.
(assert (forall ((v Entity)) (=> (is-vumpus v) (is-small v))))

; 11) Each vumpus is a numpus.
(assert (forall ((v Entity)) (=> (is-vumpus v) (is-numpus v))))

; 12) Every numpus is wooden.
(assert (forall ((n Entity)) (=> (is-numpus n) (is-wooden n))))

; 13) Each numpus is a yumpus.
(assert (forall ((n Entity)) (=> (is-numpus n) (is-yumpus n))))

; 14) Each yumpus is orange.
(assert (forall ((y Entity)) (=> (is-yumpus y) (is-orange y))))

; 15) Each yumpus is a jompus.
(assert (forall ((y Entity)) (=> (is-yumpus y) (is-jompus y))))

; 16) Each jompus is amenable.
(assert (forall ((j Entity)) (=> (is-jompus j) (is-amenable j))))

; 17) Every jompus is a zumpus.
(assert (forall ((j Entity)) (=> (is-jompus j) (is-zumpus j))))

; 18) Wren is a tumpus.
(assert (is-tumpus wren))

; 19) Test: Wren is wooden.
(assert (is-wooden wren))

; Check satisfiability and provide a model if satisfiable
(check-sat)
(get-model)