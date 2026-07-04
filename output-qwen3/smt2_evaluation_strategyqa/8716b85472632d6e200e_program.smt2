; Question: Is Disneyland Paris the largest Disney resort?
; This tests whether Disneyland Paris has the largest size among all Disney resorts

; 1. Declare sorts
(declare-sort DisneyResort 0)

; 2. Declare functions
(declare-fun resort-size (DisneyResort) Int)  ; Size in acres

; 3. Declare constants for specific Disney resorts
(declare-const disneyland-paris DisneyResort)
(declare-const walt-disney-world DisneyResort)
(declare-const disneyland-california DisneyResort)
(declare-const tokyo-disney-resort DisneyResort)
(declare-const shanghai-disney-resort DisneyResort)
(declare-const hong-kong-disneyland DisneyResort)

; 4. Assert knowledge base - actual resort sizes (approximate acres)
; Walt Disney World (Florida) is known to be the largest at ~25,000 acres
(assert (= (resort-size walt-disney-world) 25000))

; Disneyland Paris is approximately 4,800 acres
(assert (= (resort-size disneyland-paris) 4800))

; Other Disney resorts for comparison
(assert (= (resort-size disneyland-california) 85))
(assert (= (resort-size tokyo-disney-resort) 494))
(assert (= (resort-size shanghai-disney-resort) 963))
(assert (= (resort-size hong-kong-disneyland) 310))

; 5. Test the claim: Is Disneyland Paris the largest?
; For Disneyland Paris to be the largest, it must be >= all other resorts
; We specifically test against Walt Disney World which is known to be larger
(assert (>= (resort-size disneyland-paris) (resort-size walt-disney-world)))

; 6. Check satisfiability
(check-sat)
; Expected: unsat (False - Disneyland Paris is NOT the largest)
; Walt Disney World at 25,000 acres is larger than Disneyland Paris at 4,800 acres

(get-model)