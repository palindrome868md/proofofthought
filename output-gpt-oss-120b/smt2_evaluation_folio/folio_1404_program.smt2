;--- 1. Declare the domain sort ---------------------------------
(declare-sort Entity 0)

;--- 2. Declare predicates ----------------------------------------
(declare-fun biodegradable (Entity) Bool)
(declare-fun envFriendly   (Entity) Bool)
(declare-fun woodware     (Entity) Bool)
(declare-fun paper        (Entity) Bool)
(declare-fun good         (Entity) Bool)
(declare-fun bad          (Entity) Bool)

;--- 3. Declare the constant that represents “a worksheet” -------
(declare-const w Entity)

;--- 4. Knowledge base (premises) ---------------------------------

; All biodegradable things are environment‑friendly.
(assert (forall ((x Entity)) (=> (biodegradable x) (envFriendly x))))

; All woodware is biodegradable.
(assert (forall ((x Entity)) (=> (woodware x) (biodegradable x))))

; All paper is woodware.
(assert (forall ((x Entity)) (=> (paper x) (woodware x))))

; Nothing is both good and bad.
(assert (forall ((x Entity)) (not (and (good x) (bad x)))))

; All environment‑friendly things are good.
(assert (forall ((x Entity)) (=> (envFriendly x) (good x))))

; A worksheet is either paper or environment‑friendly.
(assert (or (paper w) (envFriendly w)))

;--- 5. Test the statement: “A worksheet is bad.” -----------------
(assert (bad w))

;--- 6. Ask Z3 ----------------------------------------------------
(check-sat)          ; expected result: unsat (the statement is false)
(get-model)          ; optional: shows why it is unsat