; -------------------------------------------------
; 1. Sorts
; -------------------------------------------------
(declare-sort City 0)

; -------------------------------------------------
; 2. Constants (the two Albany cities)
; -------------------------------------------------
(declare-const albany-ga City)   ; Albany, Georgia
(declare-const albany-ny City)   ; Albany, New York

; -------------------------------------------------
; 3. Population data (current population and yearly growth)
; -------------------------------------------------
; Georgia Albany
(declare-const curpop-ga Int)    ; current population
(declare-const growth-ga Int)   ; linear yearly increase
; New York Albany
(declare-const curpop-ny Int)
(declare-const growth-ny Int)

; -------------------------------------------------
; 4. Time variables (year when 100k is first reached)
; -------------------------------------------------
(declare-const t-ga Int)         ; year Georgia reaches ≥100k
(declare-const t-ny Int)         ; year New York reaches ≥100k

; -------------------------------------------------
; 5. Helper functions: population after t years (linear model)
; -------------------------------------------------
(define-fun pop ((c City) (t Int)) Int
  (ite (= c albany-ga)
       (+ curpop-ga (* growth-ga t))
       (ite (= c albany-ny)
            (+ curpop-ny (* growth-ny t))
            0)))   ; other cities are irrelevant

; -------------------------------------------------
; 6. Knowledge base (concrete numbers)
; -------------------------------------------------
; Georgia Albany: 70,000 now, grows 4,000 per year
(assert (= curpop-ga 70000))
(assert (= growth-ga 4000))

; New York Albany: 95,000 now, grows 500 per year
(assert (= curpop-ny 95000))
(assert (= growth-ny 500))

; Years are non‑negative
(assert (>= t-ga 0))
(assert (>= t-ny 0))

; -------------------------------------------------
; 7. Define "first year reaching 100,000"
; -------------------------------------------------
; GA reaches the threshold at t-ga
(assert (>= (pop albany-ga t-ga) 100000))
(assert (< (pop albany-ga (- t-ga 1)) 100000))

; NY reaches the threshold at t-ny
(assert (>= (pop albany-ny t-ny) 100000))
(assert (< (pop albany-ny (- t-ny 1)) 100000))

; -------------------------------------------------
; 8. Claim to verify: Georgia reaches before New York
; -------------------------------------------------
(assert (< t-ga t-ny))

; -------------------------------------------------
; 9. Check the claim
; -------------------------------------------------
(check-sat)
(get-model)