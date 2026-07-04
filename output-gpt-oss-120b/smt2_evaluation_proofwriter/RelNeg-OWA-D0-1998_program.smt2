;----- Declare an uninterpreted sort for all objects -----
(declare-sort Obj 0)

;----- Declare predicates (unary/binary) -----
(declare-fun round (Obj) Bool)
(declare-fun blue  (Obj) Bool)
(declare-fun red   (Obj) Bool)
(declare-fun cold  (Obj) Bool)

(declare-fun likes (Obj Obj) Bool)
(declare-fun needs (Obj Obj) Bool)
(declare-fun sees  (Obj Obj) Bool)

(declare-fun nice (Obj) Bool)

;----- Declare the concrete individuals -----
(declare-const cow     Obj)
(declare-const lion    Obj)
(declare-const squirrel Obj)

;===== Knowledge base (facts) =====
; Cow
(assert (not (round cow)))
(assert (needs cow lion))
(assert (needs cow squirrel))
(assert (not (sees cow lion)))
(assert (not (sees cow squirrel)))

; Lion
(assert (not (red lion)))
(assert (needs lion squirrel))
(assert (sees lion cow))
(assert (not (sees lion squirrel)))

; Squirrel
(assert (cold squirrel))
(assert (not (red squirrel)))
(assert (likes squirrel cow))
(assert (not (likes squirrel lion)))
(assert (needs squirrel cow))
(assert (sees squirrel cow))

;===== General rules (implications) =====
; 1. Blue → does NOT see the squirrel
(assert (forall ((x Obj))
        (=> (blue x) (not (sees x squirrel)))))

; 2. Round ∧ ¬Blue → sees the squirrel
(assert (forall ((x Obj))
        (=> (and (round x) (not (blue x))) (sees x squirrel))))

; 3. Blue → does NOT like the lion
(assert (forall ((x Obj))
        (=> (blue x) (not (likes x lion)))))

; 4. Blue → likes the lion (creates a potential inconsistency only for blue objects)
(assert (forall ((x Obj))
        (=> (blue x) (likes x lion))))

; 5. If someone sees the lion then the lion does NOT see the cow
(assert (forall ((x Obj))
        (=> (sees x lion) (not (sees lion cow)))))

; 6. If the lion is round and needs the cow then the cow is nice
(assert (=> (and (round lion) (needs lion cow)) (nice cow)))

;===== Query: "The squirrel likes the cow" =====
; The fact is already in the KB, we assert it again to test satisfiability.
(assert (likes squirrel cow))

; Check whether the combined knowledge base is consistent.
(check-sat)
(get-model)