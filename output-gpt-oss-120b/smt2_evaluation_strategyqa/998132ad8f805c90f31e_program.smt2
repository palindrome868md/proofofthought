;--- Sort declarations -------------------------------------------------
(declare-sort Location 0)
(declare-sort Event 0)

;--- Function (predicate) declarations ---------------------------------
(declare-fun good-location (Location Event) Bool)   ; suitability
(declare-fun has-groundhog (Location) Bool)        ; presence of groundhogs
(declare-fun extreme-cold (Location) Bool)        ; extreme cold climate

;--- Constant declarations ---------------------------------------------
(declare-const antarctica Location)
(declare-const groundhog-day Event)

;--- Knowledge base ----------------------------------------------------
; Fact: Antarctica is extremely cold
(assert (extreme-cold antarctica))

; Fact: Antarctica has no groundhogs
(assert (not (has-groundhog antarctica)))

; Rule 1: No groundhogs ⇒ not a good location for any event
(assert (forall ((l Location) (e Event))
        (=> (not (has-groundhog l))
            (not (good-location l e)))))

; Rule 2: Extreme cold ⇒ not a good location for any event
(assert (forall ((l Location) (e Event))
        (=> (extreme-cold l)
            (not (good-location l e)))))

;--- Query -------------------------------------------------------------
; Is Antarctica a good location for Groundhog Day?
(assert (good-location antarctica groundhog-day))

;--- Solve --------------------------------------------------------------
(check-sat)   ; Expected result: unsat (i.e., the answer is False)
(get-model)