; Sorts
(declare-sort Person 0)

; Constants
(declare-const rina Person)

; Predicates
(declare-fun is_student (Person) Bool)
(declare-fun drinks_coffee (Person) Bool)
(declare-fun dependent (Person) Bool)
(declare-fun wants_addicted (Person) Bool)
(declare-fun unaware_drug (Person) Bool)

; Knowledge base (premises)

; P1: All people who regularly drink coffee are dependent on caffeine.
(assert (forall ((p Person)) (=> (drinks_coffee p) (dependent p))))

; P2: People regularly drink coffee, or they don't want to be addicted to caffeine, or both.
(assert (forall ((p Person)) (or (drinks_coffee p) (not (wants_addicted p)))))

; P3: No one who doesn't want to be addicted to caffeine is unaware that caffeine is a drug.
(assert (forall ((p Person)) (=> (not (wants_addicted p)) (not (unaware_drug p)))))

; P4: Rina is either a student who is unaware that caffeine is a drug, or not a student and aware that caffeine is a drug.
; (aware) is represented as (not (unaware_drug ...))
(assert (or (and (is_student rina) (unaware_drug rina))
            (and (not (is_student rina)) (not (unaware_drug rina)))))

; P5: Rina is either a student who is dependent on caffeine, or not a student and not dependent on caffeine.
(assert (or (and (is_student rina) (dependent rina))
            (and (not (is_student rina)) (not (dependent rina)))))

; Statement to test:
; If Rina either (not wants_addicted and unaware) or (wants_addicted and not unaware),
; then (not wants_addicted) and drinks_coffee.
; We test the negation of the implication to see if a counterexample exists.
(assert (not (=> (or (and (not (wants_addicted rina)) (unaware_drug rina))
                  (and (wants_addicted rina) (not (unaware_drug rina))))
             (and (not (wants_addicted rina)) (drinks_coffee rina)))))

; Check satisfiability
(check-sat)