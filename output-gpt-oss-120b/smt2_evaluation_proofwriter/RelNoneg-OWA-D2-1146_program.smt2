;--- 1. Sort ---------------------------------------------------------
(declare-sort Entity 0)

;--- 2. Predicates ---------------------------------------------------
(declare-fun sees   (Entity Entity) Bool)
(declare-fun chases (Entity Entity) Bool)
(declare-fun eats   (Entity Entity) Bool)

(declare-fun blue   (Entity) Bool)
(declare-fun red    (Entity) Bool)
(declare-fun big    (Entity) Bool)
(declare-fun cold   (Entity) Bool)
(declare-fun nice   (Entity) Bool)

;--- 3. Named individuals --------------------------------------------
(declare-const bald_eagle Entity)
(declare-const bear       Entity)
(declare-const rabbit     Entity)
(declare-const mouse      Entity)

;--- 4. Facts from the story -----------------------------------------
(assert (sees bald_eagle bear))
(assert (sees bald_eagle rabbit))

(assert (chases bear bald_eagle))
(assert (chases bear rabbit))

(assert (eats bear mouse))
(assert (blue bear))
(assert (sees bear rabbit))

(assert (chases mouse rabbit))
(assert (cold mouse))
(assert (nice mouse))
(assert (sees mouse bear))
(assert (sees mouse rabbit))

(assert (eats rabbit bear))
(assert (eats rabbit mouse))        ; the fact we will test
(assert (sees rabbit bald_eagle))

;--- 5. Logical rules -----------------------------------------------
; Rule 1: If something chases the rabbit then the rabbit eats the bald eagle.
(assert (forall ((x Entity))
        (=> (chases x rabbit)
            (eats rabbit bald_eagle))))

; Rule 2: If something sees the bear then the bear is red.
(assert (forall ((x Entity))
        (=> (sees x bear)
            (red bear))))

; Rule 3: If something is red then it is big.
(assert (forall ((x Entity))
        (=> (red x)
            (big x))))

; Rule 4: If something chases the bald eagle and the bald eagle eats the rabbit then the bald eagle is red.
(assert (forall ((x Entity))
        (=> (and (chases x bald_eagle)
                 (eats bald_eagle rabbit))
            (red bald_eagle))))

; Rule 5: Red things are blue.
(assert (forall ((x Entity))
        (=> (red x)
            (blue x))))

; Rule 6: If something eats the rabbit and the rabbit is red then it is blue.
(assert (forall ((x Entity))
        (=> (and (eats x rabbit)
                 (red rabbit))
            (blue x))))

;--- 6. Query: "The rabbit eats the mouse." -------------------------
(assert (eats rabbit mouse))

;--- 7. Ask Z3 -------------------------------------------------------
(check-sat)
(get-model)