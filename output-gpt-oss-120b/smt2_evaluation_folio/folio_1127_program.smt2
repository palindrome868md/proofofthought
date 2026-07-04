;--- Sorts -------------------------------------------------
(declare-sort Person 0)

;--- Predicates (Boolean functions) ------------------------
(declare-fun Student (Person) Bool)
(declare-fun RegularlyDrinkCoffee (Person) Bool)
(declare-fun Dependent (Person) Bool)
(declare-fun WantAdd (Person) Bool)   ; wants to be addicted to caffeine
(declare-fun Unaware (Person) Bool)   ; unaware that caffeine is a drug

;--- Constant ------------------------------------------------
(declare-const Rina Person)

;--- Premise 1: regular coffee drinkers are dependent -----
(assert (forall ((p Person))
  (=> (RegularlyDrinkCoffee p) (Dependent p))))

;--- Premise 2: everyone either drinks coffee or does not want to be addicted
(assert (forall ((p Person))
  (or (RegularlyDrinkCoffee p) (not (WantAdd p)))))

;--- Premise 3: nobody who doesn’t want to be addicted is unaware
(assert (forall ((p Person))
  (=> (not (WantAdd p)) (not (Unaware p)))))

;--- Premise 4: Rina is (Student ∧ Unaware)  or  (¬Student ∧ aware)
(assert (or (and (Student Rina) (Unaware Rina))
            (and (not (Student Rina)) (not (Unaware Rina))))) ; aware = ¬Unaware

;--- Premise 5: Rina is (Student ∧ Dependent)  or  (¬Student ∧ ¬Dependent)
(assert (or (and (Student Rina) (Dependent Rina))
            (and (not (Student Rina)) (not (Dependent Rina)))))

;--- Negation of the target statement:
;    Rina does NOT satisfy (¬WantAdd Rina ∨ Unaware Rina)
;    i.e. WantAdd(Rina) ∧ ¬Unaware(Rina)
(assert (and (WantAdd Rina) (not (Unaware Rina))))

;--- Check whether the premises together with the negation are consistent
(check-sat)
(get-model)