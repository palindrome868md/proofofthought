; SMT-LIB 2.0 Program: Lasting Power of Attorney Appointment Question
; Question: Can I appoint my daughter as my attorney even if she does not want to be?

; 1. Declare sorts
(declare-sort Person 0)
(declare-sort Document 0)

; 2. Declare functions
(declare-fun wants-to-be-attorney (Person) Bool)
(declare-fun signs-attorney-form (Person Document) Bool)
(declare-fun can-complete-appointment (Person Person Document) Bool)
(declare-fun lpa-registered (Document) Bool)

; 3. Declare constants
(declare-const donor Person)
(declare-const daughter Person)
(declare-const lpa-form Document)

; 4. Assert knowledge base (facts from the document)

; Rule 1: For an LPA to be valid, the attorney must sign the forms
; (From "Signing the forms" section: "They also need to be signed by: the attorneys")
(assert (forall ((d Person) (a Person) (doc Document))
  (=> (can-complete-appointment d a doc)
      (signs-attorney-form a doc))))

; Rule 2: A person will only sign the attorney form if they want to be an attorney
; (Implicit: signing indicates consent/willingness)
(assert (forall ((a Person) (doc Document))
  (=> (signs-attorney-form a doc)
      (wants-to-be-attorney a))))

; Rule 3: For LPA to be registered, appointment must be completable
; (From "Register a lasting power of attorney" section)
(assert (forall ((doc Document))
  (=> (lpa-registered doc)
      (exists ((d Person) (a Person)) (can-complete-appointment d a doc)))))

; Fact: Daughter does not want to be an attorney (given in the question scenario)
(assert (not (wants-to-be-attorney daughter)))

; 5. Test the question: Can donor appoint daughter as attorney?
; We test if a valid appointment can be completed with an unwilling attorney
(assert (can-complete-appointment donor daughter lpa-form))

; 6. Check satisfiability
(check-sat)
(get-model)

; Expected result: unsat
; Reasoning: 
; - If can-complete-appointment is true, then signs-attorney-form must be true (Rule 1)
; - If signs-attorney-form is true, then wants-to-be-attorney must be true (Rule 2)
; - But we asserted (not (wants-to-be-attorney daughter))
; - This creates a contradiction, proving you CANNOT appoint someone who doesn't want to be attorney