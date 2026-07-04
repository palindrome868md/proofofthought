; Declare sorts
(declare-sort SerfdomSystem 0)

; Declare functions
(declare-fun status-level (SerfdomSystem) Int)
(declare-fun has-legal-protections (SerfdomSystem) Bool)
(declare-fun can-own-property (SerfdomSystem) Bool)

; Declare constants
(declare-const japanese-serfdom SerfdomSystem)
(declare-const english-serfdom SerfdomSystem)

; Knowledge base - Historical facts about Japanese serfdom
; Japanese peasants/serfs had relatively higher status with more protections
(assert (= (status-level japanese-serfdom) 5))
(assert has-legal-protections japanese-serfdom)
(assert can-own-property japanese-serfdom)

; Knowledge base - Historical facts about English serfdom (villeinage)
; English serfs had lower status with fewer rights
(assert (= (status-level english-serfdom) 3))
(assert (not (has-legal-protections english-serfdom)))
(assert (not (can-own-property english-serfdom)))

; Rule: Higher status level means higher social standing
(assert (forall ((s1 SerfdomSystem) (s2 SerfdomSystem))
  (=> (> (status-level s1) (status-level s2))
      (higher-status s1 s2))))

; Declare higher-status predicate
(declare-fun higher-status (SerfdomSystem SerfdomSystem) Bool)

; Assert the relationship based on status levels
(assert (=> (> (status-level japanese-serfdom) (status-level english-serfdom))
            (higher-status japanese-serfdom english-serfdom)))

; Test: Did Japanese serfdom have higher status than English counterpart?
(assert (higher-status japanese-serfdom english-serfdom))

; Check satisfiability
(check-sat)
(get-model)