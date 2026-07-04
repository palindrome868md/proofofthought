; Sorts
(declare-sort Fruit 0)

; Constants
(declare-const cherry Fruit)

; Predicates
(declare-fun InBenYard (Fruit) Bool)
(declare-fun Red (Fruit) Bool)
(declare-fun Apple (Fruit) Bool)
(declare-fun ContainsVitC (Fruit) Bool)
(declare-fun Healthy (Fruit) Bool)
(declare-fun OnWarning (Fruit) Bool)

; Premises

; 1. All red fruits that grow in Ben's yard contain some Vitamin C.
(assert (forall ((f Fruit))
  (=> (and (InBenYard f) (Red f))
      (ContainsVitC f))))

; 2. All apples that grow in Ben's yard are red fruits.
(assert (forall ((f Fruit))
  (=> (and (InBenYard f) (Apple f))
      (Red f))))

; 3. All fruits that grow in Ben's yard and contain some Vitamin C are healthy.
(assert (forall ((f Fruit))
  (=> (and (InBenYard f) (ContainsVitC f))
      (Healthy f))))

; 4. No fruits that grow in Ben's yard and are healthy are on a warning list.
(assert (forall ((f Fruit))
  (=> (and (InBenYard f) (Healthy f))
      (not (OnWarning f)))))

; 5. The cherries grow in Ben's yard.
(assert (InBenYard cherry))

; 6. If cherries are not apples and are not healthy, then they are red fruits.
(assert (=> (and (not (Apple cherry)) (not (Healthy cherry)))
            (Red cherry)))

; Test: Statement to verify
; S: If the cherries are either on a warning list or are red, then they are not healthy
; and do not contain any amount of vitamin C.
(assert (=> (or (OnWarning cherry) (Red cherry))
            (and (not (Healthy cherry)) (not (ContainsVitC cherry)))))

; Check satisfiability and get a model (one check-sat as required)
(check-sat)
(get-model)