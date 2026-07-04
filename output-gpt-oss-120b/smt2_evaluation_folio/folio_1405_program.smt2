;------------------------------------------------------------
;  Declarations
;------------------------------------------------------------
(declare-sort Thing 0)                     ; the universe of objects

; predicates (properties)
(declare-fun biodegradable (Thing) Bool)
(declare-fun env_friendly   (Thing) Bool)
(declare-fun woodware       (Thing) Bool)
(declare-fun paper          (Thing) Bool)
(declare-fun good           (Thing) Bool)
(declare-fun bad            (Thing) Bool)

; constant representing the specific object "a worksheet"
(declare-const w Thing)

;------------------------------------------------------------
;  Knowledge base (premises)
;------------------------------------------------------------

; 1. All biodegradable things are environment‑friendly.
(assert (forall ((x Thing))
        (=> (biodegradable x) (env_friendly x))))

; 2. All woodware is biodegradable.
(assert (forall ((x Thing))
        (=> (woodware x) (biodegradable x))))

; 3. All paper is woodware.
(assert (forall ((x Thing))
        (=> (paper x) (woodware x))))

; 4. Nothing is both good and bad.
(assert (forall ((x Thing))
        (not (and (good x) (bad x)))))

; 5. All environment‑friendly things are good.
(assert (forall ((x Thing))
        (=> (env_friendly x) (good x))))

; 6. A worksheet is either paper or environment‑friendly.
(assert (or (paper w) (env_friendly w)))

;------------------------------------------------------------
;  Test the statement: “A worksheet is not bad.”
;  We assert the opposite (that it is bad) and see if this is impossible.
;------------------------------------------------------------
(assert (bad w))

;------------------------------------------------------------
;  Check satisfiability
;------------------------------------------------------------
(check-sat)   ; expected result: unsat  (the worksheet cannot be bad)
(get-model)   ; optional: view a model if the result were sat