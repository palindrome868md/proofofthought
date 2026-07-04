; Sorts
(declare-sort Person 0)

; Constants
(declare-const rina Person)

; Predicates (properties)
(declare-fun drinks-coffee (Person) Bool)
(declare-fun dependent (Person) Bool)
(declare-fun wants-addicted (Person) Bool)
(declare-fun unaware-drug (Person) Bool)
(declare-fun student (Person) Bool)

; 1. All people who regularly drink coffee are dependent on caffeine.
(assert (forall ((p Person))
  (=> (drinks-coffee p)
      (dependent p))))

; 2. People regularly drink coffee, or they don't want to be addicted to caffeine, or both.
(assert (forall ((p Person))
  (or (drinks-coffee p)
      (not (wants-addicted p)))))

; 3. No one who doesn't want to be addicted to caffeine is unaware that caffeine is a drug.
(assert (forall ((p Person))
  (=> (not (wants-addicted p))
      (not (unaware-drug p)))))

; 4. Rina is either a student who is unaware that caffeine is a drug, or she is not a student and is aware that caffeine is a drug.
(assert (or (and (student rina)
                (unaware-drug rina))
            (and (not (student rina))
                 (not (unaware-drug rina)))))

; 5. Rina is either a student who is dependent on caffeine, or she is not a student and not dependent on caffeine.
(assert (or (and (student rina)
                (dependent rina))
            (and (not (student rina))
                 (not (dependent rina)))))

; Question test: "Rina doesn't want to be addicted to caffeine or is unaware that caffeine is a drug."
; Negation of the question to check entailment:
; (wants-addicted rina) AND (not (unaware-drug rina))
(assert (and (wants-addicted rina)
             (not (unaware-drug rina))))

(check-sat)
(get-model)