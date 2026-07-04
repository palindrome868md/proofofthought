; Reasoning Steps:
; 1. Identify Entities:
;    - Buildings: BlakeMcFall, Emmet
;    - Location: Portland
;    - Person: John
;    - Years: 1990, 1915
;
; 2. Identify Relations/Functions:
;    - location(Building) -> Location
;    - built-year(Building) -> Int
;    - register-year(Building) -> Int
;    - works-at(Person, Building) -> Bool
;    - Equality between buildings (Emmet = BlakeMcFall)
;
; 3. Map Premises to Assertions:
;    - BlakeMcFall register year is 1990.
;    - Emmet location is Portland.
;    - Emmet built year is 1915.
;    - Emmet is the same building as BlakeMcFall (Equality).
;    - John works at Emmet.
;
; 4. Map Statement to Verification:
;    - Statement: BlakeMcFall location is Portland.
;    - To verify if True: Assert the statement and check satisfiability.
;    - If Sat: Consistent with premises (True).
;    - If Unsat: Contradicts premises (False).
;
; 5. Logical Deduction:
;    - Since Emmet = BlakeMcFall and location(Emmet) = Portland,
;    - Then location(BlakeMcFall) must be Portland.
;    - Expected Result: sat (True).

; 1. Declare sorts
(declare-sort Building 0)
(declare-sort Location 0)
(declare-sort Person 0)

; 2. Declare functions
(declare-fun location (Building) Location)
(declare-fun built-year (Building) Int)
(declare-fun register-year (Building) Int)
(declare-fun works-at (Person Building) Bool)

; 3. Declare constants
(declare-const BlakeMcFall Building)
(declare-const Emmet Building)
(declare-const Portland Location)
(declare-const John Person)

; 4. Assert knowledge base (premises)
; Premise 1: The Blake McFall Company Building is a building added to the National Register of Historic Places in 1990.
(assert (= (register-year BlakeMcFall) 1990))

; Premise 2: The Emmet Building is a five-story building in Portland, Oregon.
(assert (= (location Emmet) Portland))

; Premise 3: The Emmet Building was built in 1915.
(assert (= (built-year Emmet) 1915))

; Premise 4: The Emmet Building is another name for the Blake McFall Company Building.
(assert (= Emmet BlakeMcFall))

; Premise 5: John works at the Emmet Building.
(assert (works-at John Emmet))

; 5. Assert the statement to verify
; Statement: The Blake McFall Company Building is located in Portland, Oregon.
(assert (= (location BlakeMcFall) Portland))

; 6. Check satisfiability
; sat = True (Statement is consistent/entailed)
; unsat = False (Statement contradicts premises)
(check-sat)
(get-model)