;--- Sorts ---------------------------------------------------------
(declare-sort Person 0)

;--- Predicates (functions returning Bool) -------------------------
(declare-fun Attend (Person) Bool)                ; attends a wedding
(declare-fun GettingMarried (Person) Bool)        ; is getting married
(declare-fun Knows (Person) Bool)                 ; knows the people who are getting married
(declare-fun Preteen (Person) Bool)               ; is a pre‑teen or young child
(declare-fun EnjoyCelebrate (Person) Bool)        ; enjoys celebrating life‑milestone events
(declare-fun FondLargeGroup (Person) Bool)        ; fond of large‑group functions
(declare-fun OutgoingSpirited (Person) Bool)      ; outgoing and spirited

;--- Constant for Carol -------------------------------------------
(declare-const carol Person)

;--- Premise 1: Attend → (GettingMarried ∨ Knows) ---------------
(assert (forall ((x Person))
  (=> (Attend x) (or (GettingMarried x) (Knows x)))))

;--- Premise 2: Preteen → ¬GettingMarried ∧ ¬Knows ---------------
(assert (forall ((x Person))
  (=> (Preteen x)
      (and (not (GettingMarried x)) (not (Knows x))))))

;--- Premise 3: EnjoyCelebrate → Attend -------------------------
(assert (forall ((x Person))
  (=> (EnjoyCelebrate x) (Attend x))))

;--- Premise 4: FondLargeGroup → EnjoyCelebrate -----------------
(assert (forall ((x Person))
  (=> (FondLargeGroup x) (EnjoyCelebrate x))))

;--- Premise 5: OutgoingSpirited → FondLargeGroup ---------------
(assert (forall ((x Person))
  (=> (OutgoingSpirited x) (FondLargeGroup x))))

;--- Premise 6 (Carol specific) ----------------------------------
; (¬(Preteen ∧ Attend)) → (¬GettingMarried ∨ Knows)
(assert (=> (or (not (Preteen carol)) (not (Attend carol)))
            (or (not (GettingMarried carol)) (Knows carol))))

;--- Negation of the target statement:
;   EnjoyCelebrate(carol) ∨ OutgoingSpirited(carol)
(assert (or (EnjoyCelebrate carol) (OutgoingSpirited carol)))

;--- Check whether a model exists -------------------------------
(check-sat)
(get-model)