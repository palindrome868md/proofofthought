;--- Sort declarations -------------------------------------------------
(declare-sort Group 0)
(declare-sort Event 0)

;--- Predicate/function declarations ------------------------------------
(declare-fun first-responder (Group) Bool)
(declare-fun memorial (Event) Bool)
(declare-fun included-in (Group Event) Bool)

;--- Constant symbols ---------------------------------------------------
(declare-const firefighters Group)
(declare-const sep11 Event)   ; September 11th memorial

;--- Knowledge base -----------------------------------------------------
; Firefighters are a first‑responder group
(assert (first-responder firefighters))

; The September 11th event is a memorial
(assert (memorial sep11))

; Universal rule: every first‑responder group is included in every memorial
(assert (forall ((g Group) (e Event))
        (=> (and (first-responder g) (memorial e))
            (included-in g e))))

;--- Question to verify -------------------------------------------------
; Would firefighters be included in the September 11th memorial?
(assert (included-in firefighters sep11))

;--- Check the result ----------------------------------------------------
(check-sat)
(get-model)