; Question: Would a pear sink in water?
; This tests whether a pear would sink based on density principles

; 1. Declare sorts
(declare-sort Object 0)
(declare-sort Liquid 0)

; 2. Declare functions
(declare-fun density (Object) Real)
(declare-fun density-liquid (Liquid) Real)
(declare-fun sinks-in (Object Liquid) Bool)

; 3. Declare constants
(declare-const pear Object)
(declare-const water Liquid)

; 4. Assert knowledge base

; Fact: Water has density of 1.0 g/cm³
(assert (= (density-liquid water) 1.0))

; Fact: Pear has density of approximately 0.7 g/cm³ (less than water)
(assert (= (density pear) 0.7))

; Rule: An object sinks in a liquid if its density is greater than the liquid's density
(assert (forall ((o Object) (l Liquid))
  (=> (sinks-in o l)
      (> (density o) (density-liquid l)))))

; 5. Test: Would a pear sink in water?
; We assert the scenario and check if it's satisfiable
(assert (sinks-in pear water))

; 6. Check satisfiability
(check-sat)
; Expected: unsat (pear would NOT sink because its density is less than water)

(get-model)