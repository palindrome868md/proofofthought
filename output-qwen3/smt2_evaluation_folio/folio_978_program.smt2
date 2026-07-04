; 1. Declare Sorts
(declare-sort Person 0)

; 2. Declare Functions (Predicates)
(declare-fun went-to-clays-school (Person) Bool)
(declare-fun makes-matcha (Person) Bool)
(declare-fun wakes-up-late (Person) Bool)
(declare-fun lives-in-california (Person) Bool)
(declare-fun attends-yoga (Person) Bool)
(declare-fun works-entertainment (Person) Bool)
(declare-fun has-regular-job (Person) Bool)
(declare-fun prefers-home (Person) Bool)

; 3. Declare Constants
(declare-const bunny Person)

; 4. Assert Knowledge Base (Premises)

; Premise 1: All people who went to Clay's school and make matcha do not wake up late.
(assert (forall ((x Person))
  (=> (and (went-to-clays-school x) (makes-matcha x))
      (not (wakes-up-late x)))))

; Premise 2: All people who went to Clay's school, live in CA, and attend yoga make matcha.
(assert (forall ((x Person))
  (=> (and (went-to-clays-school x) (lives-in-california x) (attends-yoga x))
      (makes-matcha x))))

; Premise 3: All people who went to Clay's school and work in entertainment wake up late.
(assert (forall ((x Person))
  (=> (and (went-to-clays-school x) (works-entertainment x))
      (wakes-up-late x))))

; Premise 4: All people who went to Clay's school and do not have regular jobs work in entertainment.
(assert (forall ((x Person))
  (=> (and (went-to-clays-school x) (not (has-regular-job x)))
      (works-entertainment x))))

; Premise 5: All people who went to Clay's school and prefer home do not have regular jobs.
(assert (forall ((x Person))
  (=> (and (went-to-clays-school x) (prefers-home x))
      (not (has-regular-job x)))))

; Premise 6: Bunny went to Clay's school.
(assert (went-to-clays-school bunny))

; Premise 6 (cont.): Bunny either (prefers home AND makes matcha) OR (not prefers home AND not makes matcha).
(assert (or 
  (and (prefers-home bunny) (makes-matcha bunny))
  (and (not (prefers-home bunny)) (not (makes-matcha bunny)))
))

; 5. Assert Statement to Verify
; Statement: Bunny went to Clay's school AND she neither prefers working at home NOR (lives in CA AND attends yoga).
; Logic: went-to-clays-school(bunny) AND NOT prefers-home(bunny) AND NOT (lives-in-california(bunny) AND attends-yoga(bunny))
(assert (and 
  (went-to-clays-school bunny)
  (not (prefers-home bunny))
  (not (and (lives-in-california bunny) (attends-yoga bunny)))
))

; 6. Check Satisfiability
(check-sat)
(get-model)