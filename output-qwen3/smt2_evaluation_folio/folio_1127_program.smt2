; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions (predicates)
(declare-fun DrinksCoffee (Person) Bool)
(declare-fun Dependent (Person) Bool)
(declare-fun WantAddicted (Person) Bool)
(declare-fun UnawareDrug (Person) Bool)
(declare-fun Student (Person) Bool)

; 3. Declare constants
(declare-const Rina Person)

; 4. Assert knowledge base (premises)

; Premise 1: All people who regularly drink coffee are dependent on caffeine.
(assert (forall ((p Person)) (=> (DrinksCoffee p) (Dependent p))))

; Premise 2: People regularly drink coffee, or they don't want to be addicted to caffeine, or both.
(assert (forall ((p Person)) (or (DrinksCoffee p) (not (WantAddicted p)))))

; Premise 3: No one who doesn't want to be addicted to caffeine is unaware that caffeine is a drug.
; Logic: If (not WantAddicted) then (not UnawareDrug)
(assert (forall ((p Person)) (=> (not (WantAddicted p)) (not (UnawareDrug p)))))

; Premise 4: Rina is either a student who is unaware that caffeine is a drug, 
; or she is not a student and is aware that caffeine is a drug.
; Logic: (Student AND Unaware) OR (NOT Student AND NOT Unaware)
(assert (or 
    (and (Student Rina) (UnawareDrug Rina)) 
    (and (not (Student Rina)) (not (UnawareDrug Rina)))
))

; Premise 5: Rina is either a student who is dependent on caffeine, 
; or she is not a student and not dependent on caffeine.
; Logic: (Student AND Dependent) OR (NOT Student AND NOT Dependent)
(assert (or 
    (and (Student Rina) (Dependent Rina)) 
    (and (not (Student Rina)) (not (Dependent Rina)))
))

; 5. Assert the statement to be verified
; Statement: Rina either doesn't want to be addicted to caffeine or is unaware that caffeine is a drug.
; Logic: (NOT WantAddicted) OR (UnawareDrug)
(assert (or (not (WantAddicted Rina)) (UnawareDrug Rina)))

; 6. Check satisfiability
; If sat, the statement is consistent with premises (True).
; If unsat, the statement contradicts premises (False).
(check-sat)
(get-model)