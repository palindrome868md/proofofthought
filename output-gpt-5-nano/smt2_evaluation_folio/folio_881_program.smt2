; Sorts
(declare-sort Person 0)

; Constants
(declare-const jim Person)
(declare-const john Person)

; Predicates
(declare-fun Knicks (Person) Bool)
(declare-fun NBA (Person) Bool)
(declare-fun PBP (Person) Bool)       ; professional basketball player
(declare-fun Athlete (Person) Bool)
(declare-fun Exercises (Person) Bool)

; Knowledge base (premises)

; 1. All Knicks players are NBA players
(assert (forall ((p Person)) (=> (Knicks p) (NBA p))))
; 2. All NBA players are professional basketball players
(assert (forall ((p Person)) (=> (NBA p) (PBP p))))
; 3. All professional basketball players are athletes
(assert (forall ((p Person)) (=> (PBP p) (Athlete p))))
; 4. No athletes never exercise -> athletes exercise
(assert (forall ((p Person)) (=> (Athlete p) (Exercises p))))
; 5. John scenario: Either John is a PBP and never exercises, or not PBP and exercises
(assert (or (and (PBP john) (not (Exercises john)))
            (and (not (PBP john)) (Exercises john))))

; Test scenario: Is Jim a Knicks player?
(assert (Knicks jim))

; Verification
(check-sat)
(get-model)