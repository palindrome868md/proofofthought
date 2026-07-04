; SMT-LIB 2.0 Program for Theorem Proving
; Task: Verify the truth of the statement based on provided premises.

; 1. Declare Sorts
(declare-sort Person 0)

; 2. Declare Functions (Predicates)
(declare-fun is-british-politician (Person) Bool)
(declare-fun sat-in-house-of-commons (Person) Bool)
(declare-fun attended-westminster (Person) Bool)
(declare-fun attended-edinburgh (Person) Bool)
(declare-fun supported-portland-whigs (Person) Bool)
(declare-fun seat-in-parliament (Person) Bool)

; 3. Declare Constants
(declare-const william-dickinson Person)

; 4. Assert Knowledge Base (Premises)
; Premise 1: William Dickinson was a British politician who sat in the House of Commons
(assert (is-british-politician william-dickinson))
(assert (sat-in-house-of-commons william-dickinson))

; Premise 2: William Dickinson attended Westminster school... and University of Edinburgh
(assert (attended-westminster william-dickinson))
(assert (attended-edinburgh william-dickinson))

; Premise 4: William Dickinson supported the Portland Whigs
(assert (supported-portland-whigs william-dickinson))

; Premise 5: People who supported the Portland Whigs did not get a seat in the Parliament
; Note: We treat 'seat-in-parliament' and 'sat-in-house-of-commons' as distinct predicates 
; based strictly on the provided text to maintain consistency of premises.
(assert (forall ((p Person))
  (=> (supported-portland-whigs p)
      (not (seat-in-parliament p)))))

; 5. Verification Strategy
; Statement to Verify: "William Dickinson sat in the House of Commons."
; To test if this is True given the KB, we assert the statement.
; If (check-sat) returns 'sat', the statement is consistent (True).
; If (check-sat) returns 'unsat', the statement contradicts the KB (False).
(assert (sat-in-house-of-commons william-dickinson))

; 6. Check Satisfiability
(check-sat)
(get-model)