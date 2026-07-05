; Sorts
(declare-sort Person 0)

; Constants
(declare-const george Person)
(declare-const archie Person)

; Predicates
(declare-fun swim (Person) Bool)
(declare-fun walk (Person) Bool)
(declare-fun breath (Person) Bool)      ; can control their breath
(declare-fun brainstem (Person) Bool)   ; brainstem is functional
(declare-fun balance (Person) Bool)     ; can balance
(declare-fun stand (Person) Bool)       ; can stand on the ground by themselves
(declare-fun legmuscle (Person) Bool)   ; functional leg muscles

; Knowledge base (premises)

; Functional brainstems are necessary for breath control:
; breath -> brainstem
(assert (forall ((p Person)) (=> (breath p) (brainstem p))))

; All humans that can swim can control their breath:
; swim -> breath
(assert (forall ((p Person)) (=> (swim p) (breath p))))

; Humans can swim or walk:
(assert (forall ((p Person)) (or (swim p) (walk p))))

; Humans who can walk can stand on the ground by themselves:
(assert (forall ((p Person)) (=> (walk p) (stand p))))

; Humans whose brainstems are functional can control their balance:
; brainstem -> balance
(assert (forall ((p Person)) (=> (brainstem p) (balance p))))

; Every human who can stand on the ground by themselves has functional leg muscles:
; stand -> legmuscle
(assert (forall ((p Person)) (=> (stand p) (legmuscle p))))

; Archie can walk iff he has functional brainstems:
; (walk archie) <-> (brainstem archie)
(assert (=> (walk archie) (brainstem archie)))
(assert (=> (brainstem archie) (walk archie)))

; George and Archie are humans (implicit via type Person for constants)

; Facts about George
(assert (balance george))
(assert (swim george))

; Test scenario: "Archie cannot balance and doesn't have functional leg muscles."
(assert (and (not (balance archie)) (not (legmuscle archie))))

; Check satisfiability and output a model if possible
(check-sat)
(get-model)