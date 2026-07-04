;--- 1. Declare the uninterpreted sort for people
(declare-sort Person 0)

;--- 2. Declare the functions and constants we need
(declare-const lil-wayne Person)               ; the person of interest
(declare-const birth-year Int)                 ; year Lil Wayne was born
(declare-const career-start-year Int)          ; year his career began
(declare-const legal-driving-age Int)          ; minimum age to drive alone
(declare-const age-at-start Int)               ; his age when career began
(declare-fun can-drive (Person) Bool)          ; can legally drive alone?

;--- 3. Encode the factual knowledge base
(assert (= birth-year 1982))                    ; Lil Wayne's birth year
(assert (= career-start-year 1996))             ; approximate career start
(assert (= legal-driving-age 16))               ; US legal driving age

; Age at the start of his career = career year – birth year
(assert (= age-at-start (- career-start-year birth-year)))

; Definition: a person can drive iff his/her age is at least the legal age
(assert (= (can-drive lil-wayne) (>= age-at-start legal-driving-age)))

;--- 4. Test the question: "Could Lil Wayne legally operate a vehicle on his own at the beginning of his career?"
; We assert that he can drive and ask Z3 whether this is possible.
(assert (can-drive lil-wayne))

;--- 5. Check satisfiability (sat = possible / true, unsat = impossible / false)
(check-sat)