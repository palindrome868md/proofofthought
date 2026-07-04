;-------------------------------------------------
;  Declarations
;-------------------------------------------------
(declare-sort Building 0)          ; uninterpreted sort for buildings
(declare-sort Person 0)            ; uninterpreted sort for people (optional)

; Predicates / Functions
(declare-fun is_five_story (Building) Bool)   ; true ⇔ building has five stories
(declare-fun built_year    (Building) Int)    ; construction year
(declare-fun works_at      (Person Building) Bool) ; employment relation

; Constants (named entities)
(declare-const BlakeMcFallCompanyBuilding Building)
(declare-const EmmetBuilding                Building)
(declare-const John                         Person)

;-------------------------------------------------
;  Knowledge Base (premises)
;-------------------------------------------------
; 1. Blake McFall Company Building is a building added to the NRHP in 1990
;    (the exact NRHP fact is irrelevant for the target statement, so we omit it)

; 2. The Emmet Building is a five‑story building in Portland, Oregon.
(assert (is_five_story EmmetBuilding))

; 3. The Emmet Building was built in 1915.
(assert (= (built_year EmmetBuilding) 1915))

; 4. The Emmet Building is another name for the Blake McFall Company Building.
(assert (= EmmetBuilding BlakeMcFallCompanyBuilding))

; 5. John works at the Emmet Building.
(assert (works_at John EmmetBuilding))

;-------------------------------------------------
;  Statement to verify:
;  “A five‑story building is built in 1915.”
;  (∃b. is_five_story(b) ∧ built_year(b) = 1915)
;-------------------------------------------------
(assert (exists ((b Building))
          (and (is_five_story b)
               (= (built_year b) 1915))))

;-------------------------------------------------
;  Check the statement
;-------------------------------------------------
(check-sat)   ; expected result: sat  (the statement is true)
(get-model)   ; optional: shows a concrete witness for the existential claim