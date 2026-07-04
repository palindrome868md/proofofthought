;--- Sort declarations -------------------------------------------------
(declare-sort Person 0)
(declare-sort Injury 0)

;--- Function / predicate declarations ---------------------------------
; The person has served (current or former member)
(declare-fun served (Person) Bool)

; The person suffered a specific injury while serving
(declare-fun injured-during-service (Person Injury) Bool)

; The injury occurred after 5 April 2005 (the post‑2005 regime)
(declare-fun injury-after-2005 (Injury) Bool)

; The claim is made within the 7‑year deadline that applies after 2005
(declare-fun claim-within-7-years (Person Injury) Bool)

; Derivable predicate: the person can claim compensation
(declare-fun can-claim (Person) Bool)

;--- Knowledge‑base rules -----------------------------------------------
; If a former member was injured during service, the injury is after 5 Apr 2005,
; and the claim is filed within 7 years, then the person can claim compensation.
(assert (forall ((p Person) (i Injury))
  (=> (and (served p)
           (injured-during-service p i)
           (injury-after-2005 i)
           (claim-within-7-years p i))
      (can-claim p))))

;--- Scenario facts ----------------------------------------------------
(declare-const me Person)               ; the asker
(declare-const leg-injury Injury)       ; right‑leg injury

; He is a former member of the armed forces
(assert (served me))

; He was injured to his right leg while serving
(assert (injured-during-service me leg-injury))

; The injury happened after 5 April 2005
(assert (injury-after-2005 leg-injury))

; The claim is being made within the 7‑year deadline
(assert (claim-within-7-years me leg-injury))

;--- Test the question --------------------------------------------------
; Can I claim compensation for the injury?
(assert (can-claim me))

;--- Solver query -------------------------------------------------------
(check-sat)   ; expected result: sat  (the claim is possible)
(get-model)