; -------------------------------------------------
; 1. Sort declaration
; -------------------------------------------------
(declare-sort Entity 0)

; -------------------------------------------------
; 2. Predicate (function) declarations
; -------------------------------------------------
(declare-fun chases   (Entity Entity) Bool)
(declare-fun visits   (Entity Entity) Bool)
(declare-fun likes    (Entity Entity) Bool)
(declare-fun rough    (Entity)       Bool)
(declare-fun red      (Entity)       Bool)
(declare-fun blue     (Entity)       Bool)
(declare-fun big      (Entity)       Bool)
(declare-fun kind     (Entity)       Bool)

; -------------------------------------------------
; 3. Constant declarations
; -------------------------------------------------
(declare-const bald-eagle Entity)
(declare-const bear       Entity)
(declare-const mouse      Entity)

; -------------------------------------------------
; 4. Knowledge base (facts)
; -------------------------------------------------
(assert (chases bald-eagle mouse))   ; The bald eagle chases the mouse.
(assert (rough bear))                ; The bear is rough.
(assert (visits mouse bear))         ; The mouse visits the bear.

; -------------------------------------------------
; 5. Knowledge base (rules)
; -------------------------------------------------
; Red things are not rough.
(assert (forall ((x Entity))
        (=> (red x) (not (rough x)))))

; Rough, red things are not blue.
(assert (forall ((x Entity))
        (=> (and (rough x) (red x)) (not (blue x)))))

; If something chases the mouse then the mouse chases the bear.
(assert (forall ((x Entity))
        (=> (chases x mouse) (chases mouse bear))))

; If something chases the mouse and the mouse is big then it visits the bear.
(assert (forall ((x Entity))
        (=> (and (chases x mouse) (big mouse)) (visits x bear))))

; If the bear likes the mouse and the bear is not red then the mouse chases the bald eagle.
(assert (=> (and (likes bear mouse) (not (red bear)))
            (chases mouse bald-eagle)))

; If something chases the bear then it is kind.
(assert (forall ((x Entity))
        (=> (chases x bear) (kind x))))

; -------------------------------------------------
; 6. Query: "The bear is rough."
; -------------------------------------------------
(assert (rough bear))

; -------------------------------------------------
; 7. Check satisfiability
; -------------------------------------------------
(check-sat)
(get-model)