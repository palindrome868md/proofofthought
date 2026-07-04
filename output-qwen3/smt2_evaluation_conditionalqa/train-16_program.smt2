; SMT-LIB 2.0 Program to verify school admission rescission legality
; Question: Can the school rescind their offer due to child's disability?

; 1. Declare sorts
(declare-sort School 0)
(declare-sort Child 0)
(declare-sort Disability 0)

; 2. Declare functions
(declare-fun has-disability (Child Disability) Bool)
(declare-fun offered-place (School Child) Bool)
(declare-fun rescind-offer (School Child) Bool)
(declare-fun is-discrimination (School Child Disability) Bool)
(declare-fun is-legal-action (School Child) Bool)
(declare-fun disability-cause (School Child Disability) Bool)

; 3. Declare constants
(declare-const my-sons-school School)
(declare-const my-son Child)
(declare-const scoliosis Disability)

; 4. Assert knowledge base (from Equality Act 2010 and document)

; Fact: The child has scoliosis (a disability)
(assert (has-disability my-son scoliosis))

; Fact: The school offered a place
(assert (offered-place my-sons-school my-son))

; Rule: Under Equality Act 2010, refusing admission due to disability is discrimination
(assert (forall ((s School) (c Child) (d Disability))
  (=> (and (has-disability c d)
           (offered-place s c)
           (rescind-offer s c)
           (disability-cause s c d))
      (is-discrimination s c d))))

; Rule: Discrimination against disabled children is illegal
(assert (forall ((s School) (c Child) (d Disability))
  (=> (is-discrimination s c d)
      (not (is-legal-action s c)))))

; Fact: The school is rescinding because of the disability
(assert (disability-cause my-sons-school my-son scoliosis))

; 5. Test: Can the school legally rescind the offer?
; We assert they CAN rescind and check if this is consistent with the law
(assert (rescind-offer my-sons-school my-son))
(assert (is-legal-action my-sons-school my-son))

; 6. Check satisfiability
(check-sat)
(get-model)

; Expected result: unsat
; This means the school CANNOT legally rescind the offer due to disability discrimination
; Answer to question: NO, the school cannot rescind their offer in this manner