;--- 1. Sort declaration -------------------------------------------------
(declare-sort Person 0)

;--- 2. Predicate declarations -------------------------------------------
(declare-fun furry (Person) Bool)
(declare-fun round (Person) Bool)
(declare-fun young (Person) Bool)
(declare-fun rough (Person) Bool)
(declare-fun kind  (Person) Bool)
(declare-fun cold  (Person) Bool)
(declare-fun big   (Person) Bool)

;--- 3. Constant (individual) declarations -------------------------------
(declare-const Charlie Person)
(declare-const Erin    Person)
(declare-const Fiona   Person)

;--- 4. Facts -------------------------------------------------------------
(assert (furry Charlie))
(assert (round Charlie))
(assert (young Charlie))

(assert (furry Erin))
(assert (rough Erin))

(assert (rough Fiona))
(assert (round Fiona))

;--- 5. General rules ----------------------------------------------------
; Kind people are cold
(assert (forall ((x Person)) (=> (kind x) (cold x))))

; If someone is big then they are round
(assert (forall ((x Person)) (=> (big x) (round x))))

; All rough, furry people are big
(assert (forall ((x Person)) (=> (and (rough x) (furry x)) (big x))))

; All kind, young people are cold
(assert (forall ((x Person)) (=> (and (kind x) (young x)) (cold x))))

; If someone is big then they are kind
(assert (forall ((x Person)) (=> (big x) (kind x))))

; If Erin is round and Erin is furry then Erin is cold
(assert (=> (and (round Erin) (furry Erin)) (cold Erin)))

; If Fiona is cold then Fiona is rough
(assert (=> (cold Fiona) (rough Fiona)))

; If Fiona is furry and Fiona is rough then Fiona is round
(assert (=> (and (furry Fiona) (rough Fiona)) (round Fiona)))

;--- 6. Test the query ---------------------------------------------------
; Query: Erin is NOT cold
(assert (not (cold Erin)))

;--- 7. Check satisfiability ---------------------------------------------
(check-sat)
(get-model)