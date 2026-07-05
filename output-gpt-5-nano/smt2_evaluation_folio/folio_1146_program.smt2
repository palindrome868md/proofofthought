(declare-sort Fruit 0)

; Constants
(declare-const cherry Fruit)

; Predicates
(declare-fun Red (Fruit) Bool)
(declare-fun Apple (Fruit) Bool)
(declare-fun VitaminC (Fruit) Bool)
(declare-fun Healthy (Fruit) Bool)
(declare-fun GrowsInBen (Fruit) Bool)
(declare-fun OnWarningList (Fruit) Bool)

; Premises (Knowledge Base)

; 1. All red fruits that grow in Ben's yard contain some Vitamin C.
(assert (forall ((f Fruit))
  (=> (and (Red f) (GrowsInBen f)) (VitaminC f))))

; 2. All apples that grow in Ben's yard are red fruits.
(assert (forall ((f Fruit))
  (=> (and (Apple f) (GrowsInBen f)) (Red f))))

; 3. All fruits that grow in Ben's yard and contain some Vitamin C are healthy.
(assert (forall ((f Fruit))
  (=> (and (GrowsInBen f) (VitaminC f)) (Healthy f))))

; 4. No fruits that grow in Ben's yard and are healthy are on a warning list.
(assert (forall ((f Fruit))
  (=> (and (GrowsInBen f) (Healthy f)) (not (OnWarningList f)))))

; 5. The cherries grow in Ben's yard.
(assert (GrowsInBen cherry))

; 6. If cherries are not apples and are not healthy, then they are red fruits.
(assert (=> (and (not (Apple cherry)) (not (Healthy cherry)))
            (Red cherry)))

; Testing the statement:
; P = (OnWarningList cherry) OR (Red cherry)
; Q = (not Healthy cherry) AND (not VitaminC cherry)
; not Q = Healthy cherry OR VitaminC cherry

; Assert P and not Q to check entailment of the implication
(assert (or (OnWarningList cherry) (Red cherry)))
(assert (or (Healthy cherry) (VitaminC cherry)))

(check-sat)
(get-model)