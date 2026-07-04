; SMT-LIB 2.0 Program to verify Childcare Grant repayment requirement
; Question: Do I repay the Childcare Grant back in the future if I claim it now?

; 1. Declare sorts
(declare-sort Person 0)
(declare-sort Grant 0)
(declare-sort Child 0)
(declare-sort Course 0)

; 2. Declare functions
(declare-fun is-full-time-student (Person) Bool)
(declare-fun is-enrolled (Person Course) Bool)
(declare-fun has-child (Person Child) Bool)
(declare-fun child-age (Child) Int)
(declare-fun child-has-special-needs (Child) Bool)
(declare-fun grant-type (Grant) String)
(declare-fun needs-repayment (Grant) Bool)
(declare-fun is-eligible (Person Grant) Bool)

; 3. Declare constants
(declare-const user Person)
(declare-const childcare-grant Grant)
(declare-const user-child Child)
(declare-const pharmacist-course Course)

; 4. Assert knowledge base from document

; Key fact from Overview: "The grant does not have to be paid back"
(assert (not (needs-repayment childcare-grant)))

; Grant type identification
(assert (= (grant-type childcare-grant) "Childcare Grant"))

; User scenario: Pre-registered pharmacist course student (full-time)
(assert (is-full-time-student user))
(assert (is-enrolled user pharmacist-course))

; User has a 6-year-old child with autism (special educational needs)
(assert (has-child user user-child))
(assert (= (child-age user-child) 6))
(assert (child-has-special-needs user-child))

; Eligibility criteria from document (child under 15, or under 17 with special needs)
(assert (forall ((p Person) (c Child) (g Grant))
  (=> (and (is-full-time-student p)
           (has-child p c)
           (<= (child-age c) 15)
           (= (grant-type g) "Childcare Grant"))
      (is-eligible p g))))

; 5. Test: Does the user need to repay the Childcare Grant?
; We assert that repayment IS required and check if this contradicts the knowledge base
(assert (needs-repayment childcare-grant))

; 6. Check satisfiability
(check-sat)
; Expected result: unsat (meaning the statement "needs repayment" contradicts the knowledge base)
; This proves: NO, the Childcare Grant does NOT need to be repaid

; 7. Get model to see the contradiction
(get-model)