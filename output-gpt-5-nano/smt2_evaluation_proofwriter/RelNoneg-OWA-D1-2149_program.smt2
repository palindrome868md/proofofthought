; Declare sorts
(declare-sort Entity 0)

; Declare constants
(declare-const bear Entity)
(declare-const cat Entity)
(declare-const tiger Entity)

; Declare predicates / functions
(declare-fun blue (Entity) Bool)
(declare-fun nice (Entity) Bool)
(declare-fun rough (Entity) Bool)
(declare-fun chases (Entity Entity) Bool)
(declare-fun likes (Entity Entity) Bool)
(declare-fun needs (Entity Entity) Bool)
(declare-fun red (Entity) Bool)

; Knowledge base
(assert (blue bear))
(assert (nice bear))
(assert (likes bear cat))
(assert (likes bear tiger))
(assert (chases cat tiger))
(assert (blue cat))
(assert (nice cat))
(assert (rough cat))
(assert (needs cat tiger))
(assert (chases tiger cat))
(assert (blue tiger))
(assert (rough tiger))
(assert (likes tiger bear))
(assert (likes tiger cat))
(assert (needs tiger bear))
(assert (needs tiger cat))

; Rule: If someone needs the cat then the cat likes the tiger.
(assert (forall ((x Entity)) (=> (needs x cat) (likes cat tiger))))

; Rule: Red people are blue.
(assert (forall ((e Entity)) (=> (red e) (blue e))))

; Test: The cat needs the tiger.
(assert (needs cat tiger))

; Check satisfiability
(check-sat)
(get-model)