; Declare sorts
(declare-sort Person 0)

; Declare predicates
(declare-fun regularly-drink-coffee (Person) Bool)
(declare-fun caffeine-dependent (Person) Bool)
(declare-fun wants-addiction (Person) Bool)
(declare-fun aware-caffeine-drug (Person) Bool)
(declare-fun is-student (Person) Bool)

; Declare constant for Rina
(declare-const rina Person)

; Knowledge base (premises)

; 1. All people who regularly drink coffee are dependent on caffeine.
(assert
  (forall ((p Person))
    (=> (regularly-drink-coffee p)
        (caffeine-dependent p))))

; 2. People regularly drink coffee, or they don't want to be addicted to caffeine, or both.
(assert
  (forall ((p Person))
    (or (regularly-drink-coffee p)
        (not (wants-addiction p)))))

; 3. No one who doesn't want to be addicted to caffeine is unaware that caffeine is a drug.
(assert
  (forall ((p Person))
    (=> (not (wants-addiction p))
        (aware-caffeine-drug p))))

; 4. Rina is either a student who is unaware that caffeine is a drug,
;    or she is not a student and is aware that caffeine is a drug.
(assert
  (or
    (and (is-student rina) (not (aware-caffeine-drug rina)))
    (and (not (is-student rina)) (aware-caffeine-drug rina))))

; 5. Rina is either a student who is dependent on caffeine, or she is not a student and not dependent on caffeine.
(assert
  (or
    (and (is-student rina) (caffeine-dependent rina))
    (and (not (is-student rina)) (not (caffeine-dependent rina)))))

; Test: Statement to verify
; "Rina either regularly drinks coffee or is unaware that caffeine is a drug."
(assert
  (or (regularly-drink-coffee rina)
      (not (aware-caffeine-drug rina))))

; Check satisfiability of KB + test statement
(check-sat)
(get-model)