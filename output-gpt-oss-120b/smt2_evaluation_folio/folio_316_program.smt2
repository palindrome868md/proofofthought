;--- Sorts ---------------------------------------------------------
(declare-sort Community 0)
(declare-sort Route 0)

;--- Predicates ----------------------------------------------------
(declare-fun unincorporated (Community) Bool)
(declare-fun on_route        (Community Route) Bool)

;--- Constants ------------------------------------------------------
(declare-const ordinary Community)
(declare-const ky32    Route)

;--- Knowledge base (premises) --------------------------------------
(assert (unincorporated ordinary))   ; Ordinary is an unincorporated community
(assert (on_route ordinary ky32))    ; Ordinary is on Kentucky Route 32

;--- Statement to verify -------------------------------------------
; "There are no unincorporated communities along Kentucky Route 32."
; i.e., for all communities c, if c is on ky32 then c is NOT unincorporated.
(assert (forall ((c Community))
  (=> (on_route c ky32) (not (unincorporated c)))))

;--- Check the consistency -----------------------------------------
(check-sat)    ; Expected result: unsat (the statement is false)
(get-model)