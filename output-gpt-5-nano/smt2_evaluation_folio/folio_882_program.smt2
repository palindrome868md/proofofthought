; Declare sorts
(declare-sort Person 0)

; Predicates
(declare-fun Knicks (Person) Bool)
(declare-fun NBA (Person) Bool)
(declare-fun PBP (Person) Bool)      ; Professional Basketball Player
(declare-fun Athlete (Person) Bool)
(declare-fun Exercises (Person) Bool)

; Constants
(declare-const john Person)
(declare-const jim Person)

; Knowledge base
; Knicks -> NBA
(assert (forall ((p Person)) (=> (Knicks p) (NBA p))))
; NBA -> PBP
(assert (forall ((p Person)) (=> (NBA p) (PBP p))))
; PBP -> Athlete
(assert (forall ((p Person)) (=> (PBP p) (Athlete p))))
; Athlete -> Exercises (No athletes never exercise)
(assert (forall ((p Person)) (=> (Athlete p) (Exercises p))))

; John case: (John is a PBP and not exercises) OR (not PBP and exercises)
(assert (or
  (and (PBP john) (not (Exercises john)))
  (and (not (PBP john)) (Exercises john))
))

; Test: Jim is not a Knicks player
(assert (not (Knicks jim)))

; Check satisfiability
(check-sat)
(get-model)