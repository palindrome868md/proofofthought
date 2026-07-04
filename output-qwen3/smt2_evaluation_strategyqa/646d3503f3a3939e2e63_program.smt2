; Question: Would the top of Mount Fuji stick out of the Sea of Japan?
; This requires reasoning about Mount Fuji's height, Sea of Japan's depth,
; and whether Mount Fuji is actually located in the Sea of Japan

; Declare sorts
(declare-sort Mountain 0)
(declare-sort Sea 0)
(declare-sort Location 0)

; Declare functions
(declare-fun height (Mountain) Int)           ; height in meters above sea level
(declare-fun depth (Sea) Int)                 ; depth in meters below sea level
(declare-fun is-located-in (Mountain Sea) Bool) ; whether mountain is in the sea

; Declare constants
(declare-const mount-fuji Mountain)
(declare-const sea-of-japan Sea)

; Knowledge Base: Facts about Mount Fuji
(assert (= (height mount-fuji) 3776))  ; Mount Fuji is 3,776 meters tall

; Knowledge Base: Facts about Sea of Japan
(assert (= (depth sea-of-japan) 1350))  ; Average depth is 1,350 meters

; Knowledge Base: Geographic fact - Mount Fuji is on Honshu Island, NOT in the Sea of Japan
(assert (not (is-located-in mount-fuji sea-of-japan)))

; Rule: For a mountain to stick out of a sea, it must be located in that sea
; AND its height must exceed the sea's depth
(assert (forall ((m Mountain) (s Sea))
  (=> (and (is-located-in m s) (> (height m) (depth s)))
      (sticks-out m s))))

; Test scenario: Would Mount Fuji stick out of the Sea of Japan?
; We assert that it DOES stick out and check if this is satisfiable
(assert (sticks-out mount-fuji sea-of-japan))

; Check satisfiability
(check-sat)
(get-model)

; Expected result: unsat (false)
; Reason: Mount Fuji is NOT located in the Sea of Japan (it's on land in Japan),
; so it cannot "stick out" of the Sea of Japan regardless of height comparison