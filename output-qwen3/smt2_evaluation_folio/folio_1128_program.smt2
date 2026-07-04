; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions (predicates)
(declare-fun DrinksCoffee (Person) Bool)
(declare-fun DependentCaffeine (Person) Bool)
(declare-fun WantAddicted (Person) Bool)
(declare-fun UnawareDrug (Person) Bool)
(declare-fun Student (Person) Bool)

; 3. Declare constants
(declare-const Rina Person)

; 4. Assert knowledge base (premises)

; Premise 1: All people who regularly drink coffee are dependent on caffeine.
(assert (forall ((p Person))
  (=> (DrinksCoffee p) (DependentCaffeine p))))

; Premise 2: People regularly drink coffee, or they don't want to be addicted to caffeine, or both.
(assert (forall ((p Person))
  (or (DrinksCoffee p) (not (WantAddicted p)))))

; Premise 3: No one who doesn't want to be addicted to caffeine is unaware that caffeine is a drug.
; (not WantAddicted) => (not UnawareDrug)
(assert (forall ((p Person))
  (=> (not (WantAddicted p)) (not (UnawareDrug p)))))

; Premise 4: Rina is either a student who is unaware..., or not a student and aware...
; (Student AND Unaware) OR (NOT Student AND NOT Unaware)
(assert (or 
  (and (Student Rina) (UnawareDrug Rina))
  (and (not (Student Rina)) (not (UnawareDrug Rina)))))

; Premise 5: Rina is either a student who is dependent..., or not a student and not dependent...
; (Student AND Dependent) OR (NOT Student AND NOT Dependent)
(assert (or 
  (and (Student Rina) (DependentCaffeine Rina))
  (and (not (Student Rina)) (not (DependentCaffeine Rina)))))

; 5. Assert the statement to be verified
; Statement: Rina either regularly drinks coffee or is unaware that caffeine is a drug.
(assert (or (DrinksCoffee Rina) (UnawareDrug Rina)))

; 6. Check satisfiability
(check-sat)
(get-model)