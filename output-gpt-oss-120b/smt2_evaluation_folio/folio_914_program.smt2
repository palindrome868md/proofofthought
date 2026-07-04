;-------------------------------------------------
; 1. Declare the uninterpreted sort for persons
;-------------------------------------------------
(declare-sort Person 0)

;-------------------------------------------------
; 2. Declare predicate symbols (functions returning Bool)
;-------------------------------------------------
(declare-fun ProfessionalAthlete (Person) Bool)
(declare-fun SpendSports (Person) Bool)
(declare-fun OlympicGold (Person) Bool)
(declare-fun FullTimeScientist (Person) Bool)
(declare-fun NobelPhysics (Person) Bool)

;-------------------------------------------------
; 3. Declare the constant representing Amy
;-------------------------------------------------
(declare-const Amy Person)

;-------------------------------------------------
; 4. Assert the premises (knowledge base)
;-------------------------------------------------
; all professional athletes spend most of their time on sports
(assert (forall ((p Person))
  (=> (ProfessionalAthlete p) (SpendSports p))))

; all Olympic gold medal winners are professional athletes
(assert (forall ((p Person))
  (=> (OlympicGold p) (ProfessionalAthlete p))))

; no full‑time scientists spend the majority of their time on sports
(assert (forall ((p Person))
  (=> (FullTimeScientist p) (not (SpendSports p)))))

; all Nobel physics laureates are full‑time scientists
(assert (forall ((p Person))
  (=> (NobelPhysics p) (FullTimeScientist p))))

; Amy spends most time on sports, or Amy is an Olympic gold medal winner
(assert (or (SpendSports Amy) (OlympicGold Amy)))

; If Amy is not a Nobel physics laureate then Amy is not an Olympic gold medal winner
(assert (=> (not (NobelPhysics Amy)) (not (OlympicGold Amy))))

;-------------------------------------------------
; 5. Assert the statement we want to test:
;    "Amy is neither a full‑time scientist nor an Olympic gold medal winner."
;-------------------------------------------------
(assert (and (not (FullTimeScientist Amy))
             (not (OlympicGold Amy))))

;-------------------------------------------------
; 6. Check satisfiability (sat = statement can hold, unsat = statement impossible)
;-------------------------------------------------
(check-sat)
(get-model)