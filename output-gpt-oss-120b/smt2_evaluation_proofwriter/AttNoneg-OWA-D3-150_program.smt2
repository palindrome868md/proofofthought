; -------------------------------------------------
; Sort declaration for all individuals
(declare-sort Entity 0)

; -------------------------------------------------
; Predicate declarations (uninterpreted functions returning Bool)
(declare-fun is-smart (Entity) Bool)
(declare-fun is-furry (Entity) Bool)
(declare-fun is-nice  (Entity) Bool)
(declare-fun is-red   (Entity) Bool)
(declare-fun is-blue  (Entity) Bool)
(declare-fun is-big   (Entity) Bool)

; -------------------------------------------------
; Constant symbols for the named individuals
(declare-const dave  Entity)
(declare-const erin  Entity)
(declare-const gary  Entity)
(declare-const harry Entity)

; -------------------------------------------------
; Facts from the problem statement
(assert (is-smart dave))
(assert (is-furry erin))
(assert (is-nice  erin))
(assert (is-nice  gary))
(assert (is-nice  harry))
(assert (is-red   harry))
(assert (is-smart harry))

; -------------------------------------------------
; General rules
; 1. Big things are furry
(assert (forall ((x Entity))
        (=> (is-big x) (is-furry x))))

; 2. If something is blue then it is big
(assert (forall ((x Entity))
        (=> (is-blue x) (is-big x))))

; 3. Red things are blue
(assert (forall ((x Entity))
        (=> (is-red x) (is-blue x))))

; -------------------------------------------------
; Query: "Harry is blue"
(assert (is-blue harry))

; -------------------------------------------------
; Solve
(check-sat)
(get-model)