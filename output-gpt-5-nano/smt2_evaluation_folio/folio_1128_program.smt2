(declare-sort Person 0)

; Constants
(declare-const rina Person)

; Predicates
(declare-fun drinks-coffee (Person) Bool)
(declare-fun caffeine-dependent (Person) Bool)
(declare-fun wants-addiction (Person) Bool)
(declare-fun unaware-caffeine-drug (Person) Bool)
(declare-fun student (Person) Bool)

; 1. All who drink coffee are caffeine-dependent
(assert (forall ((x Person)) (=> (drinks-coffee x) (caffeine-dependent x))))

; 2. For all x: x drinks coffee OR not wants-addiction
(assert (forall ((x Person)) (or (drinks-coffee x) (not (wants-addiction x)))))

; 3. If not wants-addiction, then not unaware of caffeine as a drug
(assert (forall ((x Person)) (=> (not (wants-addiction x)) (not (unaware-caffeine-drug x)))))

; 4. Rina is either (Student and Unaware) or (NotStudent and NotUnaware)
(assert
  (or
    (and (student rina) (unaware-caffeine-drug rina))
    (and (not (student rina)) (not (unaware-caffeine-drug rina)))
  )
)

; 5. Rina is either (Student and Dependent) or (NotStudent and NotDependent)
(assert
  (or
    (and (student rina) (caffeine-dependent rina))
    (and (not (student rina)) (not (caffeine-dependent rina)))
  )
)

; Query: Not (Statement) to test entailment
; Statement: "Rina either regularly drinks coffee or is unaware that caffeine is a drug."
(assert (not (or (drinks-coffee rina) (unaware-caffeine-drug rina))))

(check-sat)