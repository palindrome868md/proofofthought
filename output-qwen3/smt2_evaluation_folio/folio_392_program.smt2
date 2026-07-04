; 1. Declare Sorts
(declare-sort Building 0)
(declare-sort Person 0)

; 2. Declare Functions
(declare-fun stories (Building) Int)
(declare-fun year-built (Building) Int)
(declare-fun register-year (Building) Int)
(declare-fun works-at (Person Building) Bool)

; 3. Declare Constants
(declare-const emmet-building Building)
(declare-const blake-mcfall-building Building)
(declare-const john Person)

; 4. Assert Knowledge Base (Premises)

; Premise: The Blake McFall Company Building is a building added to the National Register of Historic Places in 1990.
(assert (= (register-year blake-mcfall-building) 1990))

; Premise: The Emmet Building is a five-story building in Portland, Oregon.
(assert (= (stories emmet-building) 5))

; Premise: The Emmet Building was built in 1915.
(assert (= (year-built emmet-building) 1915))

; Premise: The Emmet Building is another name for the Blake McFall Company Building.
(assert (= emmet-building blake-mcfall-building))

; Premise: John works at the Emmet Building.
(assert (works-at john emmet-building))

; 5. Assert Statement to Verify
; Statement: "A five-story building is built in 1915."
; Logical Form: Exists a building b such that stories(b) == 5 AND year-built(b) == 1915
(assert (exists ((b Building)) 
    (and (= (stories b) 5) 
         (= (year-built b) 1915))))

; 6. Check Satisfiability
; sat = True (Statement is consistent/entailed by KB)
; unsat = False (Statement contradicts KB)
(check-sat)
(get-model)