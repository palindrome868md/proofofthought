; Sorts
(declare-sort Person 0)

; Constants
(declare-const rina Person)

; Predicates
(declare-fun student (Person) Bool)
(declare-fun dependent (Person) Bool)
(declare-fun drink-coffee (Person) Bool)
(declare-fun wants-add (Person) Bool)
(declare-fun aware-drug (Person) Bool)

; 1. All who regularly drink coffee are dependent on caffeine
(assert (forall ((p Person)) (=> (drink-coffee p) (dependent p))))

; 2. People regularly drink coffee, or they don't want to be addicted to caffeine, or both
(assert (forall ((p Person)) (or (drink-coffee p) (not (wants-add p)))))

; 3. No one who doesn't want to be addicted is unaware that caffeine is a drug
(assert (forall ((p Person)) (=> (not (wants-add p)) (aware-drug p))))

; 4. Rina is either a student who is unaware that caffeine is a drug, or not a student and aware
(assert (or (and (student rina) (not (aware-drug rina)))
            (and (not (student rina)) (aware-drug rina))))

; 5. Rina is either a student who is dependent on caffeine, or not a student and not dependent
(assert (or (and (student rina) (dependent rina))
            (and (not (student rina)) (not (dependent rina)))))

; Test: negate the query "Rina doesn't want to be addicted to caffeine or is unaware that caffeine is a drug"
; Negation: (wants-add rina) ∧ (aware-drug rina)
(assert (and (wants-add rina) (aware-drug rina)))

(check-sat)