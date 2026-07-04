; Declare sorts
(declare-sort Franchise 0)

; Declare functions
(declare-fun num-projects (Franchise) Int)

; Declare constants
(declare-const dragon-ball Franchise)
(declare-const friday-13th Franchise)

; Knowledge Base: Dragon Ball project count
; 4 TV series + 23 movies = 27 projects
(assert (= (num-projects dragon-ball) 27))

; Knowledge Base: Friday the 13th project count
; 12 films + 1 TV series = 13 projects
(assert (= (num-projects friday-13th) 13))

; Test: Does Dragon Ball fall short of Friday 13th?
; "Fall short" means Dragon Ball has FEWER projects than Friday 13th
(assert (< (num-projects dragon-ball) (num-projects friday-13th)))

; Check satisfiability
(check-sat)
; Expected: unsat (Dragon Ball does NOT fall short - it has MORE projects)

(get-model)