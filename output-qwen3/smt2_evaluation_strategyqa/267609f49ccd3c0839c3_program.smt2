; Question: Can the Swiss Guard fill the Virginia General Assembly chairs?
; This is a capacity comparison question

; 1. Declare sorts
(declare-sort Organization 0)

; 2. Declare functions
(declare-fun member-count (Organization) Int)

; 3. Declare constants
(declare-const swiss-guard Organization)
(declare-const virginia-general-assembly Organization)

; 4. Assert knowledge base (facts)
; Swiss Guard (Pontifical Swiss Guard) has approximately 135 members
(assert (= (member-count swiss-guard) 135))

; Virginia General Assembly has 140 chairs total
; (100 House of Delegates + 40 Senate seats)
(assert (= (member-count virginia-general-assembly) 140))

; 5. Test the question: Can Swiss Guard fill Virginia GA chairs?
; This means: Is Swiss Guard member count >= Virginia GA chair count?
(assert (>= (member-count swiss-guard) (member-count virginia-general-assembly)))

; 6. Check satisfiability
; sat = Yes, they can fill the chairs
; unsat = No, they cannot fill the chairs
(check-sat)
(get-model)