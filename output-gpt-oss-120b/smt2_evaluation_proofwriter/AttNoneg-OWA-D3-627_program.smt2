;--- Sort declaration -------------------------------------------------
(declare-sort Person 0)

;--- Predicate (function) declarations --------------------------------
(declare-fun furry (Person) Bool)
(declare-fun cold  (Person) Bool)
(declare-fun green (Person) Bool)
(declare-fun nice  (Person) Bool)
(declare-fun red   (Person) Bool)
(declare-fun round (Person) Bool)
(declare-fun rough (Person) Bool)

;--- Constant (individual) declarations --------------------------------
(declare-const anne  Person)
(declare-const dave  Person)
(declare-const fiona Person)
(declare-const gary  Person)

;--- Facts -------------------------------------------------------------
(assert (furry anne))                 ; Anne is furry
(assert (cold  dave))
(assert (furry dave))
(assert (green dave))
(assert (nice  dave))
(assert (red   dave))
(assert (round dave))
(assert (cold  fiona))
(assert (red   fiona))
(assert (rough gary))

;--- General rules -----------------------------------------------------
; All round, furry people are red.
(assert (forall ((x Person))
  (=> (and (round x) (furry x)) (red x))))

; All nice, red people are furry.
(assert (forall ((x Person))
  (=> (and (nice x) (red x)) (furry x))))

; All red people are round.
(assert (forall ((x Person))
  (=> (red x) (round x))))

; If someone is furry and cold then they are rough.
(assert (forall ((x Person))
  (=> (and (furry x) (cold x)) (rough x))))

; Round people are furry.
(assert (forall ((x Person))
  (=> (round x) (furry x))))

; All furry people are red.
(assert (forall ((x Person))
  (=> (furry x) (red x))))

; If Dave is nice and Dave is furry then Dave is green.
(assert (=> (and (nice dave) (furry dave)) (green dave)))

; If Anne is red then Anne is nice.
(assert (=> (red anne) (nice anne)))

;--- Test the queried statement ----------------------------------------
; Question: "Anne is furry."
(assert (furry anne))

;--- Satisfiability check ----------------------------------------------
(check-sat)
(get-model)