; Determine if Dustin Hoffman is a Bnei Yisrael

; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare predicates
(declare-fun is_jewish (Person) Bool)
(declare-fun bnei_yisrael (Person) Bool)

; 3. Declare constants
(declare-const dustin-hoffman Person)

; 4. Knowledge base (facts)
(assert (is_jewish dustin-hoffman))

; 5. Rules
; All Jews are considered Bnei Yisrael
(assert (forall ((p Person)) (=> (is_jewish p) (bnei_yisrael p))))

; 6. Test: Is Dustin Hoffman a Bnei Yisrael?
(assert (bnei_yisrael dustin-hoffman))

; 7. Check satisfiability
(check-sat)
(get-model)