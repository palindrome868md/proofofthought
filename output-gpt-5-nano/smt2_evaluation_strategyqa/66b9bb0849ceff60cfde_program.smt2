; Declare sorts
(declare-sort Plant 0)
(declare-sort Disease 0)

; Declare constants
(declare-const dandelion Plant)
(declare-const hepatitis Disease)

; Declare predicates
(declare-fun has-liver (Plant) Bool)
(declare-fun suffers (Plant Disease) Bool)

; Knowledge base
; 1) If a plant suffers from hepatitis, it does not have a liver
(assert (forall ((p Plant))
  (=> (suffers p hepatitis)
      (not (has-liver p)))))

; 2) If a plant does not have a liver, it cannot suffer from hepatitis
(assert (forall ((p Plant))
  (=> (not (has-liver p))
      (not (suffers p hepatitis)))))

; Test: Could a dandelion suffer from hepatitis?
(assert (suffers dandelion hepatitis))

; Check satisfiability
(check-sat)
(get-model)