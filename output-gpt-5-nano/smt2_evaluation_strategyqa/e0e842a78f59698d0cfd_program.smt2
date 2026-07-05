; Can you write a whole Haiku in a single tweet?
; Model the question as: does there exist a 5-7-5 haiku whose total length fits in 280 chars?

; Declare syllable counts for a haiku (5-7-5)
(declare-const line1-syl Int)
(declare-const line2-syl Int)
(declare-const line3-syl Int)
(assert (= line1-syl 5))
(assert (= line2-syl 7))
(assert (= line3-syl 5))

; Declare line lengths (in characters) and total tweet length constraint
(declare-const line1-len Int)
(declare-const line2-len Int)
(declare-const line3-len Int)
(assert (>= line1-len 1))
(assert (>= line2-len 1))
(assert (>= line3-len 1))

; Total length is the sum of line lengths
(declare-const total-length Int)
(assert (= total-length (+ line1-len line2-len line3-len)))
; A tweet allows up to 280 characters
(assert (<= total-length 280))

; Test: Can a 5-7-5 haiku be written in a single tweet?
; Existence of such a haiku is evidenced by the above constraints being satisfiable.
(check-sat)
(get-model)