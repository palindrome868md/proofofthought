;--- Sort declarations -------------------------------------------------
(declare-sort Discipline 0)
(declare-sort Topic 0)

;--- Function / predicate declarations ----------------------------------
(declare-fun studies (Discipline Topic) Bool)   ; "d studies t"
(declare-fun is-physics (Discipline) Bool)     ; "d is the physics discipline"

;--- Constants ---------------------------------------------------------
(declare-const biochemistry Discipline)
(declare-const gluon Topic)

;--- Knowledge base ----------------------------------------------------
; Biochemistry is not physics
(assert (not (is-physics biochemistry)))

; Rule: non‑physics disciplines do not study gluons
(assert (forall ((d Discipline))
        (=> (not (is-physics d))
            (not (studies d gluon)))))

;--- Question to verify ------------------------------------------------
; Does Biochemistry study gluons?
(assert (studies biochemistry gluon))

;--- Solve -------------------------------------------------------------
(check-sat)   ; Expected: unsat (Biochemistry does NOT study gluons)
(get-model)