; SMT-LIB 2.0 Program to verify the statement about Bunny
; Based on the provided premises, we model the logic to check satisfiability.

; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions (predicates)
; Predicate: went-to-clays-school
(declare-fun went-to-clays-school (Person) Bool)
; Predicate: makes-matcha (makes own matcha teas every morning with ceremonial-grade powder)
(declare-fun makes-matcha (Person) Bool)
; Predicate: wakes-up-late (wakes up late and starts schedules past noon regularly)
(declare-fun wakes-up-late (Person) Bool)
; Predicate: lives-in-california
(declare-fun lives-in-california (Person) Bool)
; Predicate: attends-yoga (attends yoga classes regularly)
(declare-fun attends-yoga (Person) Bool)
; Predicate: works-in-entertainment (works in entertainment industry as high-profile celebrities)
(declare-fun works-in-entertainment (Person) Bool)
; Predicate: has-regular-job (has regular 9-5 jobs)
(declare-fun has-regular-job (Person) Bool)
; Predicate: prefers-home (prefers working at home over going to the office daily)
(declare-fun prefers-home (Person) Bool)

; 3. Declare constants
(declare-const bunny Person)

; 4. Assert knowledge base (Premises)

; Premise 1: All people who went to Clay's school and make matcha do not wake up late.
; ∀p, (Went(p) ∧ Matcha(p)) → ¬Late(p)
(assert (forall ((p Person))
  (=> (and (went-to-clays-school p) (makes-matcha p))
      (not (wakes-up-late p)))))

; Premise 2: All people who went to Clay's school, live in CA, and attend yoga make matcha.
; ∀p, (Went(p) ∧ CA(p) ∧ Yoga(p)) → Matcha(p)
(assert (forall ((p Person))
  (=> (and (went-to-clays-school p) (lives-in-california p) (attends-yoga p))
      (makes-matcha p))))

; Premise 3: All people who went to Clay's school and work in entertainment wake up late.
; ∀p, (Went(p) ∧ Entertainment(p)) → Late(p)
(assert (forall ((p Person))
  (=> (and (went-to-clays-school p) (works-in-entertainment p))
      (wakes-up-late p))))

; Premise 4: All people who went to Clay's school and do not have regular jobs work in entertainment.
; ∀p, (Went(p) ∧ ¬Job(p)) → Entertainment(p)
(assert (forall ((p Person))
  (=> (and (went-to-clays-school p) (not (has-regular-job p)))
      (works-in-entertainment p))))

; Premise 5: All people who went to Clay's school and prefer home do not have regular jobs.
; ∀p, (Went(p) ∧ Home(p)) → ¬Job(p)
(assert (forall ((p Person))
  (=> (and (went-to-clays-school p) (prefers-home p))
      (not (has-regular-job p)))))

; Premise 6: Bunny went to Clay's school.
(assert (went-to-clays-school bunny))

; Premise 6 (cont): Bunny either (prefers home AND makes matcha) OR (not prefers home AND not makes matcha).
; (Home(b) ∧ Matcha(b)) ∨ (¬Home(b) ∧ ¬Matcha(b))
(assert (or
  (and (prefers-home bunny) (makes-matcha bunny))
  (and (not (prefers-home bunny)) (not (makes-matcha bunny)))))

; 5. Test Statement
; Statement: "Bunny went to Clay's school and she lives in California and attends yoga classes regularly."
; We assert this statement to check if it is consistent with the Knowledge Base.
; If unsat, the statement is False. If sat, the statement is Possible/True.
(assert (and
  (went-to-clays-school bunny)
  (lives-in-california bunny)
  (attends-yoga bunny)))

; 6. Check satisfiability
; Expected result: unsat (The statement contradicts the premises)
(check-sat)
(get-model)