;--------------- Declarations -----------------
(declare-sort Species 0)
(declare-sort TempRegion 0)

; Species and temperature constants
(declare-const anchovy Species)
(declare-const cold TempRegion)
(declare-const warm TempRegion)

; Population function: Species × TempRegion → Int
(declare-fun pop (Species TempRegion) Int)

;--------------- Knowledge Base ----------------
; Populations are non‑negative
(assert (>= (pop anchovy cold) 0))
(assert (>= (pop anchovy warm) 0))

; Core fact: more anchovy live in colder waters than in warmer waters
(assert (> (pop anchovy cold) (pop anchovy warm)))

;--------------- Test the Question -------------
; Claim: "Do more anchovy live in colder temperature waters than warmer?"
(assert (> (pop anchovy cold) (pop anchovy warm)))

;--------------- Solver Query ------------------
(check-sat)
(get-model)