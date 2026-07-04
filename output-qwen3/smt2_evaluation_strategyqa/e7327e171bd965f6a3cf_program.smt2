; Question: Is art prioritized in the US education system?
; Strategy: Model education priorities and test if art is prioritized
; Expected: unsat (false) - art is typically NOT prioritized in US education

; Declare sorts
(declare-sort Subject 0)
(declare-sort EducationSystem 0)

; Declare functions/predicates
(declare-fun is-prioritized (Subject EducationSystem) Bool)
(declare-fun is-stem-subject (Subject) Bool)
(declare-fun is-arts-subject (Subject) Bool)
(declare-fun is-core-subject (Subject EducationSystem) Bool)
(declare-fun receives-major-funding (Subject EducationSystem) Bool)

; Declare constants
(declare-const us-education EducationSystem)
(declare-const art Subject)
(declare-const math Subject)
(declare-const science Subject)
(declare-const reading Subject)

; Knowledge Base: Facts about US Education System

; Art is an arts subject
(assert (is-arts-subject art))

; Math, science, reading are STEM/core subjects
(assert (is-stem-subject math))
(assert (is-stem-subject science))
(assert (is-core-subject reading us-education))

; Rule 1: STEM subjects are prioritized in US education
(assert (forall ((s Subject) (e EducationSystem))
  (=> (is-stem-subject s) (is-prioritized s e))))

; Rule 2: Core subjects receive major funding
(assert (forall ((s Subject) (e EducationSystem))
  (=> (is-core-subject s e) (receives-major-funding s e))))

; Rule 3: Arts subjects are NOT prioritized (based on typical US education policy)
(assert (forall ((s Subject) (e EducationSystem))
  (=> (is-arts-subject s) (not (is-prioritized s e)))))

; Rule 4: Prioritized subjects receive major funding
(assert (forall ((s Subject) (e EducationSystem))
  (=> (is-prioritized s e) (receives-major-funding s e))))

; Fact: US education focuses on standardized testing in core subjects, not arts
(assert (not (is-core-subject art us-education)))

; VERIFICATION: Test if art is prioritized in US education
; If this returns unsat, then art is NOT prioritized (answer: No)
; If this returns sat, then art IS prioritized (answer: Yes)
(assert (is-prioritized art us-education))

; Check satisfiability
(check-sat)
(get-model)