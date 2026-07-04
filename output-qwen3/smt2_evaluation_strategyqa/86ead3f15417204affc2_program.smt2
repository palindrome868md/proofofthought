; Question: Is Dustin Hoffman one of the B'nei Yisrael?
; B'nei Yisrael = Children of Israel = Jewish people

; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions
(declare-fun is-jewish (Person) Bool)
(declare-fun is-bnei-yisrael (Person) Bool)

; 3. Declare constants
(declare-const dustin-hoffman Person)

; 4. Assert knowledge base
; Definition: B'nei Yisrael refers to Jewish people
(assert (forall ((p Person))
  (=> (is-jewish p) (is-bnei-yisrael p))))

; Fact: Dustin Hoffman is Jewish (his parents were Jewish, he identifies as Jewish)
(assert (is-jewish dustin-hoffman))

; 5. Test: Is Dustin Hoffman one of the B'nei Yisrael?
(assert (is-bnei-yisrael dustin-hoffman))

; 6. Check satisfiability
(check-sat)
(get-model)