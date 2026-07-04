; 1. Declare constants for reasoning about length and capacity
(declare-const haiku_syllables Int)
(declare-const min_chars_per_syllable Int)
(declare-const haiku_min_length Int)
(declare-const tweet_limit Int)

; 2. Assert Knowledge Base (Facts)
; A traditional Haiku consists of 17 syllables (5-7-5 structure)
(assert (= haiku_syllables 17))

; Each syllable consists of at least 1 character
(assert (= min_chars_per_syllable 1))

; Calculate the minimum character length of a Haiku
(assert (= haiku_min_length (* haiku_syllables min_chars_per_syllable)))

; A standard Tweet has a limit of 280 characters
(assert (= tweet_limit 280))

; 3. Assert the Scenario Being Tested
; Question: "Can you write a whole Haiku in a single tweet?"
; We test if the minimum Haiku length fits within the Tweet limit
(assert (<= haiku_min_length tweet_limit))

; 4. Check Satisfiability
; sat = Yes, it is possible
; unsat = No, it is impossible
(check-sat)
(get-model)