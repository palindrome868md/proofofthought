; Seven Deadly Sins as an enumerated datatype
(declare-datatypes () ((Sin greed lust gluttony envy wrath sloth pride)))

; Prevalence score for each sin
(declare-fun prevalence (Sin) Int)

; Scenario: greed is the most prevalent sin
; i.e., for every other sin, greed's prevalence is greater than that sin's prevalence
(assert (forall ((s Sin))
  (=> (not (= s greed))
      (> (prevalence greed) (prevalence s)))))

; Check whether the scenario is satisfiable
(check-sat)
(get-model)