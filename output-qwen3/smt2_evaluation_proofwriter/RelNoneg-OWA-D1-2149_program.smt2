; SMT-LIB 2.0 Program
; Task: Verify the statement "The cat needs the tiger" based on the provided knowledge base.

; 1. Declare Sorts
(declare-sort Entity 0)

; 2. Declare Constants
(declare-const bear Entity)
(declare-const cat Entity)
(declare-const tiger Entity)

; 3. Declare Functions (Predicates and Relations)
(declare-fun is_blue (Entity) Bool)
(declare-fun is_nice (Entity) Bool)
(declare-fun is_rough (Entity) Bool)
(declare-fun is_red (Entity) Bool)
(declare-fun likes (Entity Entity) Bool)
(declare-fun chases (Entity Entity) Bool)
(declare-fun needs (Entity Entity) Bool)

; 4. Assert Knowledge Base (Facts from Text)
; The bear is blue.
(assert (is_blue bear))
; The bear is nice.
(assert (is_nice bear))
; The bear likes the cat.
(assert (likes bear cat))
; The bear likes the tiger.
(assert (likes bear tiger))
; The cat chases the tiger.
(assert (chases cat tiger))
; The cat is blue.
(assert (is_blue cat))
; The cat is nice.
(assert (is_nice cat))
; The cat is rough.
(assert (is_rough cat))
; The cat needs the tiger.
(assert (needs cat tiger))
; The tiger chases the cat.
(assert (chases tiger cat))
; The tiger is blue.
(assert (is_blue tiger))
; The tiger is rough.
(assert (is_rough tiger))
; The tiger likes the bear.
(assert (likes tiger bear))
; The tiger likes the cat.
(assert (likes tiger cat))
; The tiger needs the bear.
(assert (needs tiger bear))
; The tiger needs the cat.
(assert (needs tiger cat))
; Rule: If someone needs the cat then the cat likes the tiger.
(assert (forall ((x Entity)) (=> (needs x cat) (likes cat tiger))))
; Rule: Red people are blue.
(assert (forall ((x Entity)) (=> (is_red x) (is_blue x))))

; 5. Verification Scenario
; Question: The cat needs the tiger.
; We assert this statement to check if it is satisfiable (True) given the KB.
(assert (needs cat tiger))

; 6. Check Satisfiability
(check-sat)
(get-model)