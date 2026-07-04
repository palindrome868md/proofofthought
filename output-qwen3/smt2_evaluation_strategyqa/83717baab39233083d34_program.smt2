; Question: Would a broadcast from Spirit make the news in 2020?
; Reasoning: NASA's Mars rover Spirit ended its mission in 2011.
; A spacecraft cannot broadcast after its mission ends.

; Declare sorts
(declare-sort Spacecraft 0)

; Declare functions
(declare-fun is-operational (Spacecraft Int) Bool)
(declare-fun can-broadcast (Spacecraft Int) Bool)
(declare-fun would-make-news (Spacecraft Int) Bool)
(declare-fun mission-end-year (Spacecraft) Int)

; Declare constants
(declare-const spirit Spacecraft)

; Knowledge base - Spirit's mission timeline
; Spirit's last communication was in 2010, mission declared complete in 2011
(assert (= (mission-end-year spirit) 2011))

; Rule 1: A spacecraft can only broadcast if it's operational
(assert (forall ((s Spacecraft) (y Int))
  (=> (can-broadcast s y)
      (is-operational s y))))

; Rule 2: A spacecraft is not operational after its mission end year
(assert (forall ((s Spacecraft) (y Int))
  (=> (> y (mission-end-year s))
      (not (is-operational s y)))))

; Rule 3: If a spacecraft can broadcast, it would make news
(assert (forall ((s Spacecraft) (y Int))
  (=> (can-broadcast s y)
      (would-make-news s y))))

; Test: Would a broadcast from Spirit make the news in 2020?
; We assert that Spirit can broadcast in 2020 and check satisfiability
(assert (can-broadcast spirit 2020))

; Check satisfiability
(check-sat)
(get-model)

; Expected result: unsat
; Explanation: Since 2020 > 2011 (mission end year), Spirit cannot be operational,
; therefore cannot broadcast, therefore the assertion is unsatisfiable.
; Answer: NO - a broadcast from Spirit would NOT make the news in 2020
; (because Spirit was non-operational and could not broadcast)