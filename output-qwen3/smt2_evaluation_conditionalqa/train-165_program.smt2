; SMT-LIB 2.0 Program to verify financial assistance for LPA costs
; Question: Can you get financial assistance with the cost of making a lasting power of attorney?

; 1. Declare sorts
(declare-sort Person 0)
(declare-sort Benefit 0)

; 2. Declare functions
(declare-fun age (Person) Int)
(declare-fun lives-in-england (Person) Bool)
(declare-fun on-benefit (Person Benefit) Bool)
(declare-fun income (Person) Int)
(declare-fun eligible-for-reduction (Person) Bool)
(declare-fun eligible-for-exemption (Person) Bool)
(declare-fun can-get-financial-assistance (Person) Bool)

; 3. Declare constants
(declare-const test-person Person)
(declare-const income-support Benefit)

; 4. Assert knowledge base (facts from the document)

; Rule: Can get reduction if income < £12,000
(assert (forall ((p Person))
  (=> (< (income p) 12000)
      (eligible-for-reduction p))))

; Rule: Can get exemption if on certain benefits (Income Support is mentioned)
(assert (forall ((p Person))
  (=> (on-benefit p income-support)
      (eligible-for-exemption p))))

; Rule: Financial assistance available if eligible for reduction OR exemption
(assert (forall ((p Person))
  (=> (or (eligible-for-reduction p)
          (eligible-for-exemption p))
      (can-get-financial-assistance p))))

; 5. Assert the test scenario (from the question)
; Person is 57 years old
(assert (= (age test-person) 57))

; Person lives in England
(assert (lives-in-england test-person))

; Person is on Income Support
(assert (on-benefit test-person income-support))

; 6. Test: Can this person get financial assistance?
; We assert they CAN get financial assistance and check if it's satisfiable
(assert (can-get-financial-assistance test-person))

; 7. Check satisfiability
(check-sat)
(get-model)

; Expected result: sat (true)
; Reasoning: The document states "You might also be able to apply for an exemption 
; if you're on certain benefits, such as Income Support." Since the person is on 
; Income Support, they are eligible for exemption, which means they can get 
; financial assistance with the LPA registration cost.