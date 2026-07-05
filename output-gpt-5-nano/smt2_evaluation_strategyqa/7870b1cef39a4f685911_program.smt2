; Declare sorts
(declare-sort Person 0)
(declare-sort Thing 0)

; Declare binary relation: references(p, t) means Person p references Thing t
(declare-fun references (Person Thing) Bool)

; Declare constants
(declare-const adam-sandler Person)
(declare-const cole-spouse Thing)
(declare-const scuba-man-doll Thing)

; Knowledge base (facts / constraints)
; By default, Adam Sandler does not reference Cole Spouse or the scuba-man-doll
(assert (not (references adam-sandler cole-spouse)))
(assert (not (references adam-sandler scuba-man-doll)))

; Test: Would Adam Sandler get a reference to Cole Spouse and a scuba man doll?
(assert (references adam-sandler cole-spouse))
(assert (references adam-sandler scuba-man-doll))

; Check satisfiability
(check-sat)
(get-model)