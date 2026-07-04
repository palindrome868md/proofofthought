; Question: Would a hypothetical Yeti be towered over by Andre the Giant?
; This tests whether Andre the Giant's height exceeds a typical Yeti's height

; 1. Declare sorts
(declare-sort Being 0)

; 2. Declare functions
(declare-fun height (Being) Int)

; 3. Declare constants
(declare-const andre Being)
(declare-const yeti Being)

; 4. Assert knowledge base (facts)

; Andre the Giant's documented height: approximately 7'4" (224 cm)
(assert (= (height andre) 224))

; Yeti typical height from folklore: approximately 6'7" (200 cm)
; (Descriptions vary from 6-10 feet, but 6-7 feet is most common)
(assert (= (height yeti) 200))

; 5. Test scenario: Would Andre tower over the Yeti?
; "Towered over" means Andre's height is greater than Yeti's height
(assert (> (height andre) (height yeti)))

; 6. Check satisfiability
; If sat: Yes, Andre would tower over the Yeti (224 > 200 is consistent)
; If unsat: No, Andre would not tower over the Yeti
(check-sat)
(get-model)