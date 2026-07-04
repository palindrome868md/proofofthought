;--- 1. Declare sorts -------------------------------------------------
(declare-sort Currency 0)

;--- 2. Declare predicates/functions ------------------------------------
(declare-fun valuable (Currency) Bool)   ; Is a currency valuable?
(declare-fun major   (Currency) Bool)   ; Is a currency a major world currency?

;--- 3. Declare constants -----------------------------------------------
(declare-const pound-sterling Currency)

;--- 4. Knowledge base --------------------------------------------------
; Pound sterling is a major world currency
(assert (major pound-sterling))

; All major world currencies are valuable
(assert (forall ((c Currency))
        (=> (major c) (valuable c))))

;--- 5. Test the query --------------------------------------------------
; Question: "Is a pound sterling valuable?"
; We assert the statement and see if it can hold.
(assert (valuable pound-sterling))

;--- 6. Check satisfiability --------------------------------------------
(check-sat)   ; Expected: sat (the statement is true under the KB)
(get-model)