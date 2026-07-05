; Sorts
(declare-sort Person 0)

; Constants
(declare-const rina Person)

; Predicates
(declare-fun drinks (Person) Bool)
(declare-fun dependent (Person) Bool)
(declare-fun not_want (Person) Bool)
(declare-fun aware (Person) Bool)
(declare-fun unaware (Person) Bool)
(declare-fun student (Person) Bool)

; Knowledge base
; 1. All people who regularly drink coffee are dependent on caffeine.
(assert (forall ((p Person)) (=> (drinks p) (dependent p))))

; 2. People regularly drink coffee, or they don't want to be addicted to caffeine, or both.
(assert (forall ((p Person)) (or (drinks p) (not_want p))))

; 3. No one who doesn't want to be addicted to caffeine is unaware that caffeine is a drug.
(assert (forall ((p Person)) (=> (not_want p) (not (unaware p)))))

; 4. Rina is either a student who is unaware that caffeine is a drug, or she is not a student and is aware that caffeine is a drug.
(assert (or (and (student rina) (unaware rina))
            (and (not (student rina)) (aware rina))))

; 5. Rina is either a student who is dependent on caffeine, or she is not a student and not dependent on caffeine.
(assert (or (and (student rina) (dependent rina))
            (and (not (student rina)) (not (dependent rina)))))

; Statement: If Rina either doesn't want to be addicted to caffeine and is unaware that caffeine is a drug,
; or neither doesn't want to be addicted to caffeine nor is unaware that caffeine is a drug,
; then Rina doesn't want to be addicted to caffeine and regularly drinks coffee.
; We assert the negation of the statement to test entailment.
(assert (not
  (=> (or (and (not_want rina) (unaware rina))
           (and (not (not_want rina)) (not (unaware rina))))
      (and (not_want rina) (drinks rina)))))

; Check satisfiability
(check-sat)
(get-model)