;--- Sorts ---------------------------------------------------------
(declare-sort Person 0)

;--- Predicate symbols (functions returning Bool) ------------------
(declare-fun wentToSchool (Person) Bool)
(declare-fun makesMatcha (Person) Bool)
(declare-fun wakeLate (Person) Bool)
(declare-fun startAfterNoon (Person) Bool)
(declare-fun livesInCA (Person) Bool)
(declare-fun yoga (Person) Bool)
(declare-fun celeb (Person) Bool)
(declare-fun regular9to5 (Person) Bool)
(declare-fun prefersHome (Person) Bool)

;--- Universal premises --------------------------------------------
; 1. school ∧ makesMatcha → (¬wakeLate ∧ startAfterNoon)
(assert (forall ((p Person))
  (=> (and (wentToSchool p) (makesMatcha p))
      (and (not (wakeLate p)) (startAfterNoon p)))))

; 2. school ∧ livesInCA ∧ yoga → makesMatcha
(assert (forall ((p Person))
  (=> (and (wentToSchool p) (livesInCA p) (yoga p))
      (makesMatcha p))))

; 3. school ∧ celeb → (wakeLate ∧ startAfterNoon)
(assert (forall ((p Person))
  (=> (and (wentToSchool p) (celeb p))
      (and (wakeLate p) (startAfterNoon p)))))

; 4. school ∧ ¬regular9to5 → celeb
(assert (forall ((p Person))
  (=> (and (wentToSchool p) (not (regular9to5 p)))
      (celeb p))))

; 5. school ∧ prefersHome → ¬regular9to5
(assert (forall ((p Person))
  (=> (and (wentToSchool p) (prefersHome p))
      (not (regular9to5 p)))))

;--- Constants -----------------------------------------------------
(declare-const bunny Person)

;--- Bunny’s specific premise ---------------------------------------
; Bunny went to Clay’s school
(assert (wentToSchool bunny))

; (prefersHome ∧ makesMatcha)  OR  (¬prefersHome ∧ ¬makesMatcha)
(assert (or (and (prefersHome bunny) (makesMatcha bunny))
            (and (not (prefersHome bunny)) (not (makesMatcha bunny)))))

;--- Statement to be evaluated --------------------------------------
; “Bunny went to Clay’s school and she lives in California and attends yoga classes regularly.”
(assert (and (wentToSchool bunny) (livesInCA bunny) (yoga bunny)))

;--- Check the consistency of the whole knowledge base + statement
(check-sat)
(get-model)