;--- Declare the uninterpreted sort for persons
(declare-sort Person 0)

;--- Predicates (functions returning Bool)
(declare-fun School (Person) Bool)                ; went to Clay's school
(declare-fun Matcha (Person) Bool)                ; makes own ceremonial‑grade matcha
(declare-fun WakeLate (Person) Bool)              ; wakes up late / starts past noon
(declare-fun LiveCA (Person) Bool)                ; lives in California
(declare-fun Yoga (Person) Bool)                  ; attends yoga classes regularly
(declare-fun Celeb (Person) Bool)                 ; high‑profile entertainment celebrity
(declare-fun Regular9to5 (Person) Bool)           ; has a regular 9‑to‑5 job
(declare-fun PreferHome (Person) Bool)            ; prefers working at home daily

;--- Constant for the individual Bunny
(declare-const bunny Person)

;--- Premise 1: School ∧ Matcha → ¬WakeLate
(assert (forall ((p Person))
  (=> (and (School p) (Matcha p))
      (not (WakeLate p)))))

;--- Premise 2: School ∧ LiveCA ∧ Yoga → Matcha
(assert (forall ((p Person))
  (=> (and (School p) (LiveCA p) (Yoga p))
      (Matcha p))))

;--- Premise 3: School ∧ Celeb → WakeLate
(assert (forall ((p Person))
  (=> (and (School p) (Celeb p))
      (WakeLate p))))

;--- Premise 4: School ∧ ¬Regular9to5 → Celeb
(assert (forall ((p Person))
  (=> (and (School p) (not (Regular9to5 p)))
      (Celeb p))))

;--- Premise 5: School ∧ PreferHome → ¬Regular9to5
(assert (forall ((p Person))
  (=> (and (School p) (PreferHome p))
      (not (Regular9to5 p)))))

;--- Information about Bunny:
;    School(bunny) ∧ [ (PreferHome ∧ Matcha) ∨ (¬PreferHome ∧ ¬Matcha) ]
(assert (and (School bunny)
             (or (and (PreferHome bunny) (Matcha bunny))
                 (and (not (PreferHome bunny)) (not (Matcha bunny))))))

;--- Statement to test:
;    School(bunny) ∧ ¬PreferHome(bunny) ∧ ¬(LiveCA(bunny) ∧ Yoga(bunny))
(assert (and (School bunny)
             (not (PreferHome bunny))
             (not (and (LiveCA bunny) (Yoga bunny)))))

;--- Check whether the combined constraints are satisfiable
(check-sat)
(get-model)