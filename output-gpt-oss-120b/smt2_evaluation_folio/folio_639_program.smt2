;--- Sorts ---------------------------------------------------------
(declare-sort Person 0)

;--- Constants -----------------------------------------------------
(declare-const william-dickinson Person)

;--- Predicates ----------------------------------------------------
(declare-fun sat-in-house-commons (Person) Bool)
(declare-fun supports-portland-whigs (Person) Bool)

;--- Knowledge base (premises) ------------------------------------
; 1. William Dickinson sat in the House of Commons
(assert (sat-in-house-commons william-dickinson))

; 2. William Dickinson supported the Portland Whigs
(assert (supports-portland-whigs william-dickinson))

; 3. Universal rule: supporters of the Portland Whigs did NOT get a seat in Parliament
(assert (forall ((p Person))
  (=> (supports-portland-whigs p)
      (not (sat-in-house-commons p)))))

;--- Statement to verify -----------------------------------------
; Statement: "William Dickinson sat in the House of Commons"
(assert (sat-in-house-commons william-dickinson))

;--- Check the consistency of the whole set ----------------------
(check-sat)   ; Expected result: unsat  (the statement cannot hold together with all premises)
(get-model)