; Declare sorts
(declare-sort Fruit 0)

; Declare predicates
(declare-fun red (Fruit) Bool)
(declare-fun apple (Fruit) Bool)
(declare-fun grows_in_ben_yard (Fruit) Bool)
(declare-fun has_vitamin_c (Fruit) Bool)
(declare-fun healthy (Fruit) Bool)
(declare-fun on_warning_list (Fruit) Bool)

; Declare constant for the cherries
(declare-const cherries Fruit)

; Premises
; 1. All red fruits that grow in Ben's yard contain some Vitamin C.
(assert (forall ((x Fruit)) (=> (and (red x) (grows_in_ben_yard x)) (has_vitamin_c x))))
; 2. All apples that grow in Ben's yard are red fruits.
(assert (forall ((x Fruit)) (=> (and (apple x) (grows_in_ben_yard x)) (red x))))
; 3. All fruits that grow in Ben's yard and contain some Vitamin C are healthy.
(assert (forall ((x Fruit)) (=> (and (grows_in_ben_yard x) (has_vitamin_c x)) (healthy x))))
; 4. No fruits that grow in Ben's yard and are healthy are on a warning list.
(assert (forall ((x Fruit)) (=> (and (grows_in_ben_yard x) (healthy x)) (not (on_warning_list x)))))
; 5. The cherries grow in Ben's yard.
(assert (grows_in_ben_yard cherries))
; 6. If cherries are not apples and are not healthy, then they are red fruits.
(assert (=> (and (not (apple cherries)) (not (healthy cherries))) (red cherries)))

; Test statement: The cherries either contain some amount of vitamin C or are on a warning list.
(assert (not (or (has_vitamin_c cherries) (on_warning_list cherries))))

; Check satisfiability
(check-sat)
(get-model)