; -------------------------------------------------
; Declarations
; -------------------------------------------------
(declare-sort Entity 0)

; Height of any entity (in centimeters)
(declare-fun height (Entity) Int)

; Height of the bald spot on an entity (we assume it is at the top of the head)
(declare-fun baldSpotHeight (Entity) Int)

; Predicate: viewer can see the bald spot of target from above
(declare-fun can-see-bald-spot (Entity Entity) Bool)

; Constants for the two individuals
(declare-const robert Entity)          ; Robert Wadlow
(declare-const frankenstein Entity)    ; Frankenstein's monster

; -------------------------------------------------
; Knowledge base
; -------------------------------------------------
; Known (or reasonable) heights
(assert (= (height robert) 272))        ; Robert Wadlow ≈ 272 cm tall
(assert (= (height frankenstein) 250)) ; assume monster ≈ 250 cm tall

; Bald spot lies at the top of the head
(assert (= (baldSpotHeight frankenstein) (height frankenstein)))

; Rule: If the viewer is taller than the bald‑spot height, they can see it from above
(assert (forall ((v Entity) (m Entity))
        (=> (> (height v) (baldSpotHeight m))
            (can-see-bald-spot v m))))

; -------------------------------------------------
; Test the query
; -------------------------------------------------
; Question: Could Robert see Frankenstein's bald spot from above?
(assert (can-see-bald-spot robert frankenstein))

; -------------------------------------------------
; Solve
; -------------------------------------------------
(check-sat)
(get-model)