; SMT-LIB 2.0 Program for Child Maintenance Claim Question
; Question: Does living abroad mean I can't claim Child Maintenance?

; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions
(declare-fun lives-abroad (Person) Bool)
(declare-fun is-child (Person) Bool)
(declare-fun is-parent-with-main-care (Person) Bool)
(declare-fun can-apply-to-cms (Person) Bool)
(declare-fun can-make-private-arrangement (Person) Bool)

; 3. Declare constants
(declare-const claimant Person)
(declare-const child Person)
(declare-const ex-partner Person)

; 4. Assert knowledge base (facts from document)

; Rule 1: Cannot make new CMS application if child AND parent with main care live abroad
(assert (forall ((p Person) (c Person))
  (=> (and (is-child c)
           (is-parent-with-main-care p)
           (lives-abroad p)
           (lives-abroad c))
      (not (can-apply-to-cms p)))))

; Rule 2: Can make private arrangement if one or both parents live abroad
(assert (forall ((p Person))
  (=> (lives-abroad p)
      (can-make-private-arrangement p))))

; Facts about this scenario
(assert (is-child child))
(assert (is-parent-with-main-care claimant))
(assert (lives-abroad claimant))
(assert (lives-abroad child))
(assert (not (lives-abroad ex-partner)))

; 5. Test: Can the claimant apply to Child Maintenance Service?
; This tests the question: "Does living abroad mean I can't claim Child Maintenance?"
(assert (can-apply-to-cms claimant))

; 6. Check satisfiability
(check-sat)
(get-model)

; Expected result: unsat
; Interpretation: The claimant CANNOT apply to CMS because both they and the child live abroad
; However, they CAN make a private arrangement (can-make-private-arrangement would be sat)