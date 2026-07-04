; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions (Predicates)
(declare-fun DrinksCoffee (Person) Bool)
(declare-fun Dependent (Person) Bool)
(declare-fun WantAddicted (Person) Bool)
(declare-fun Unaware (Person) Bool)
(declare-fun Student (Person) Bool)

; 3. Declare constants
(declare-const Rina Person)

; 4. Assert knowledge base (Premises)

; Premise 1: All people who regularly drink coffee are dependent on caffeine.
(assert (forall ((p Person))
  (=> (DrinksCoffee p) (Dependent p))))

; Premise 2: People regularly drink coffee, or they don't want to be addicted to caffeine, or both.
(assert (forall ((p Person))
  (or (DrinksCoffee p) (not (WantAddicted p)))))

; Premise 3: No one who doesn't want to be addicted to caffeine is unaware that caffeine is a drug.
; Logic: (not WantAddicted) => (not Unaware)
(assert (forall ((p Person))
  (=> (not (WantAddicted p)) (not (Unaware p)))))

; Premise 4: Rina is either a student who is unaware that caffeine is a drug, 
; or she is not a student and is aware that caffeine is a drug.
; Logic: (Student AND Unaware) OR (NOT Student AND NOT Unaware)
(assert (or 
  (and (Student Rina) (Unaware Rina))
  (and (not (Student Rina)) (not (Unaware Rina)))))

; Premise 5: Rina is either a student who is dependent on caffeine, 
; or she is not a student and not dependent on caffeine.
; Logic: (Student AND Dependent) OR (NOT Student AND NOT Dependent)
(assert (or 
  (and (Student Rina) (Dependent Rina))
  (and (not (Student Rina)) (not (Dependent Rina)))))

; 5. Verify the Statement
; Statement: Rina doesn't want to be addicted to caffeine or is unaware that caffeine is a drug.
; Logic: (not WantAddicted) OR Unaware
(assert (or (not (WantAddicted Rina)) (Unaware Rina)))

; Check satisfiability
; sat = True (Statement is consistent/entailed)
; unsat = False (Statement contradicts premises)
(check-sat)
(get-model)