;--- 1. Declare the uninterpreted sort for persons
(declare-sort Person 0)

;--- 2. Declare the relevant predicates
(declare-fun has_dependent_children (Person) Bool)   ; true if the person has dependent children
(declare-fun full_time_student (Person) Bool)       ; true if the person is a full‑time student
(declare-fun can_claim (Person) Bool)               ; true if the person can claim the allowance

;--- 3. Declare the constant representing "me"
(declare-const me Person)

;--- 4. Knowledge base (facts)
(assert (has_dependent_children me))   ; I have two children ⇒ dependent children
(assert (full_time_student me))        ; I will start a full‑time degree this Autumn

;--- 5. Eligibility rule from the document
; If a person has dependent children and is a full‑time student, they can claim the allowance
(assert (forall ((p Person))
  (=> (and (has_dependent_children p) (full_time_student p))
      (can_claim p))))

;--- 6. Test the question: "Can I make a claim?"
(assert (can_claim me))

;--- 7. Check satisfiability (sat = yes, unsat = no)
(check-sat)
(get-model)