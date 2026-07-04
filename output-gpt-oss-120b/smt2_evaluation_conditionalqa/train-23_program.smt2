;--- Sorts ---------------------------------------------------------
(declare-sort Person 0)

;--- Functions / Predicates ----------------------------------------
; relationship predicates
(declare-fun is_spouse (Person Person) Bool)   ; is_spouse(s, d)  => s is spouse of d
(declare-fun is_child  (Person Person) Bool)   ; is_child(c, d)   => c is child of d

; ability to stop a probate administrator
(declare-fun can_stop (Person Person) Bool)   ; can_stop(child, admin)

;--- Constants -----------------------------------------------------
(declare-const father       Person)
(declare-const step_mother  Person)
(declare-const child1       Person)
(declare-const child2       Person)

;--- Knowledge base (facts) ---------------------------------------
; step‑mother is the spouse of the father
(assert (is_spouse step_mother father))

; the two persons are children of the father
(assert (is_child child1 father))
(assert (is_child child2 father))

;--- Rule: a child cannot stop a spouse who is more entitled -----
; If someone is a child of the deceased and another person is the spouse of the deceased,
; then the child cannot stop that spouse.
(assert (forall ((c Person) (s Person) (d Person))
  (=> (and (is_child c d) (is_spouse s d))
      (not (can_stop c s)))))

;--- Test the question ---------------------------------------------
; Can a child stop the step‑mother (who is the spouse) from handling probate?
(assert (can_stop child1 step_mother))

;--- Check the result -----------------------------------------------
(check-sat)   ; Expected: unsat (children cannot stop the step‑parent)
(get-model)