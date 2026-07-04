; -------------------------------------------------
; Sorts
(declare-sort Building 0)
(declare-sort City 0)
(declare-sort Person 0)

; -------------------------------------------------
; Constants (named entities)
(declare-const blake Building)      ; Blake McFall Company Building
(declare-const emmet Building)      ; Emmet Building
(declare-const portland City)       ; Portland, Oregon
(declare-const john Person)         ; John

; -------------------------------------------------
; Predicates / Functions
(declare-fun located-in (Building City) Bool)      ; building is located in a city
(declare-fun added-to-nrhp (Building Int) Bool)    ; year added to NRHP
(declare-fun five-story (Building) Bool)          ; is a five‑story building
(declare-fun built-year (Building Int) Bool)       ; construction year
(declare-fun works-at (Person Building) Bool)      ; person works at building

; -------------------------------------------------
; Premises

; 1. Blake McFall Company Building added to NRHP in 1990
(assert (added-to-nrhp blake 1990))

; 2. Emmet Building is a five‑story building in Portland, Oregon
(assert (five-story emmet))
(assert (located-in emmet portland))

; 3. Emmet Building was built in 1915
(assert (built-year emmet 1915))

; 4. Emmet Building is another name for Blake McFall Company Building
(assert (= emmet blake))

; 5. John works at the Emmet Building
(assert (works-at john emmet))

; -------------------------------------------------
; Statement to verify:
; "The Blake McFall Company Building is located in Portland, Oregon."

(assert (located-in blake portland))

; -------------------------------------------------
; Check the result
(check-sat)
(get-model)