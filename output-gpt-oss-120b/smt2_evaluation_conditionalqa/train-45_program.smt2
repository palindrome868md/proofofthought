; -------------------------------------------------
; Declarations
; -------------------------------------------------
(declare-sort Person 0)

; Predicates for non‑straightforward conditions
(declare-fun share_property_with_nonspouse (Person) Bool)
(declare-fun leave_to_incapable_dependant (Person) Bool)
(declare-fun multiple_family_claims      (Person) Bool)
(declare-fun property_overseas          (Person) Bool)
(declare-fun has_business               (Person) Bool)

; Predicate expressing the need for legal advice
(declare-fun need_legal_advice (Person) Bool)

; Scenario facts
(declare-const me Person)

; -------------------------------------------------
; Knowledge base (rules from the document)
; -------------------------------------------------
; You need legal advice iff at least one non‑straightforward condition holds
(assert (forall ((p Person))
  (= (need_legal_advice p)
     (or (share_property_with_nonspouse p)
         (leave_to_incapable_dependant p)
         (multiple_family_claims p)
         (property_overseas p)
         (has_business p)))))

; The given scenario does NOT trigger any of the above conditions
(assert (not (share_property_with_nonspouse me)))
(assert (not (leave_to_incapable_dependant me)))
(assert (not (multiple_family_claims me)))
(assert (not (property_overseas me)))
(assert (not (has_business me)))

; -------------------------------------------------
; Test the question:
; "Do I need legal advice?"
; -------------------------------------------------
(assert (need_legal_advice me))

(check-sat)   ; Expected result: unsat (the answer is NO, you do NOT need legal advice)
(get-model)   ; Optional: shows why the assertion is impossible