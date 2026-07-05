; Declare sorts
(declare-sort Person 0)

; Declare predicates/functions
(declare-fun uninsured (Person) Bool)
(declare-fun insured (Person) Bool)
(declare-fun ct_decline_likelihood (Person) Int)

; Witnesses to ensure the scenario exists
(declare-const p-uninsured Person)
(declare-const p-insured Person)

; Distinct individuals to avoid triviality
(assert (distinct p-uninsured p-insured))

; Domain constraints for witnesses
(assert (uninsured p-uninsured))
(assert (not (insured p-uninsured)))
(assert (insured p-insured))
(assert (not (uninsured p-insured)))

; Knowledge base: uninsured individuals are more likely to decline CT than insured individuals
(assert (forall ((p Person) (q Person))
  (=> (and (uninsured p) (insured q))
      (> (ct_decline_likelihood p) (ct_decline_likelihood q)))))

; Test: Would an uninsured person be more likely than an insured person to decline a CT scan?
; Use the witnesses to express the directional claim
(assert (> (ct_decline_likelihood p-uninsured) (ct_decline_likelihood p-insured)))

; Verification
(check-sat)
(get-model)