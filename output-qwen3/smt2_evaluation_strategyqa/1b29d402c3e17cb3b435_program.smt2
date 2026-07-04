; Question: Is a pound sterling valuable?
; This SMT2 program verifies whether pound sterling is valuable based on known facts about currencies

; 1. Declare sorts
(declare-sort Currency 0)

; 2. Declare functions
(declare-fun is-major-currency (Currency) Bool)
(declare-fun is-valuable (Currency) Bool)

; 3. Declare constants
(declare-const pound-sterling Currency)

; 4. Assert knowledge base (facts about currencies)
; Fact: Pound sterling is a major world currency
(assert (is-major-currency pound-sterling))

; Rule: Major currencies are valuable (widely traded and accepted)
(assert (forall ((c Currency))
  (=> (is-major-currency c)
      (is-valuable c))))

; 5. Test the question: Is pound sterling valuable?
; We assert the statement we want to verify
(assert (is-valuable pound-sterling))

; 6. Check satisfiability
; sat = True (pound sterling IS valuable)
; unsat = False (pound sterling is NOT valuable)
(check-sat)
(get-model)