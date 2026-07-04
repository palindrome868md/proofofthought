; ---------- 1. Sort ----------
(declare-sort Entity 0)

; ---------- 2. Unary predicates ----------
(declare-fun blue  (Entity) Bool)
(declare-fun nice  (Entity) Bool)
(declare-fun rough (Entity) Bool)
(declare-fun red   (Entity) Bool)

; ---------- 3. Binary predicates ----------
(declare-fun likes   (Entity Entity) Bool)
(declare-fun chases  (Entity Entity) Bool)
(declare-fun needs   (Entity Entity) Bool)

; ---------- 4. Constants ----------
(declare-const bear Entity)
(declare-const cat  Entity)
(declare-const tiger Entity)

; ---------- 5. Knowledge base (facts) ----------
; Bear
(assert (blue  bear))
(assert (nice  bear))
(assert (likes bear cat))
(assert (likes bear tiger))

; Cat
(assert (chases cat tiger))
(assert (blue   cat))
(assert (nice   cat))
(assert (rough  cat))
(assert (needs  cat tiger))

; Tiger
(assert (chases tiger cat))
(assert (blue   tiger))
(assert (rough  tiger))
(assert (likes  tiger bear))
(assert (likes  tiger cat))
(assert (needs  tiger bear))
(assert (needs  tiger cat))

; ---------- 6. General rules ----------
; If someone needs the cat then the cat likes the tiger
(assert (forall ((x Entity))
        (=> (needs x cat)
            (likes cat tiger))))

; Red people are blue
(assert (forall ((x Entity))
        (=> (red x)
            (blue x))))

; ---------- 7. Query: "The cat needs the tiger" ----------
(assert (needs cat tiger))

; ---------- 8. Check the query ----------
(check-sat)
(get-model)