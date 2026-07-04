; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions (predicates)
(declare-fun drinks_coffee (Person) Bool)
(declare-fun dependent_caffeine (Person) Bool)
(declare-fun wants_addicted (Person) Bool)
(declare-fun unaware_drug (Person) Bool)
(declare-fun student (Person) Bool)

; 3. Declare constants
(declare-const rina Person)

; 4. Assert knowledge base (premises)

; Premise 1: All people who regularly drink coffee are dependent on caffeine.
(assert (forall ((p Person))
  (=> (drinks_coffee p) (dependent_caffeine p))))

; Premise 2: People regularly drink coffee, or they don't want to be addicted to caffeine, or both.
(assert (forall ((p Person))
  (or (drinks_coffee p) (not (wants_addicted p)))))

; Premise 3: No one who doesn't want to be addicted to caffeine is unaware that caffeine is a drug.
; Equivalent to: If unaware, then wants addicted.
(assert (forall ((p Person))
  (=> (unaware_drug p) (wants_addicted p))))

; Premise 4: Rina is either a student who is unaware, or not a student and aware.
; (Student <=> Unaware)
(assert (or
  (and (student rina) (unaware_drug rina))
  (and (not (student rina)) (not (unaware_drug rina)))))

; Premise 5: Rina is either a student who is dependent, or not a student and not dependent.
; (Student <=> Dependent)
(assert (or
  (and (student rina) (dependent_caffeine rina))
  (and (not (student rina)) (not (dependent_caffeine rina)))))

; 5. Assert the Statement to be verified
; Antecedent: (Not Wants AND Unaware) OR (Wants AND Not Unaware)
; Consequent: Not Wants AND Drinks Coffee
; Statement: Antecedent => Consequent

(assert (=>
  (or
    (and (not (wants_addicted rina)) (unaware_drug rina))
    (and (wants_addicted rina) (not (unaware_drug rina))))
  (and (not (wants_addicted rina)) (drinks_coffee rina))))

; Check satisfiability
; sat = True (Statement is consistent/entailed)
; unsat = False (Statement contradicts premises)
(check-sat)
(get-model)