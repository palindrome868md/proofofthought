;--- Sort declarations -------------------------------------------------
(declare-sort Person 0)
(declare-sort Location 0)

;--- Predicate/function declarations ------------------------------------
; Does a person have dementia (lost mental capacity)?
(declare-fun has_dementia (Person) Bool)

; Where does a person reside?
(declare-fun resides_in (Person Location) Bool)

; Sibling relationship (used to identify the sister)
(declare-fun is_sister_of (Person Person) Bool)

; Is it possible, via a Court of Protection one‑off decision, to stop
; the first person from visiting the second?
(declare-fun can_stop_visiting (Person Person) Bool)

;--- Constant declarations -----------------------------------------------
(declare-const father Person)
(declare-const sister Person)
(declare-const care_home Location)

;--- Knowledge base -----------------------------------------------------
; The father has dementia and lives in a care home.
(assert (has_dementia father))
(assert (resides_in father care_home))

; The sister is the sister of the father.
(assert (is_sister_of sister father))

; Legal rule (derived from the document):
; If a person has lost mental capacity and resides in a care home,
; a Court of Protection one‑off decision can be sought to stop any
; other person from visiting them.
(assert (forall ((v Person) (p Person) (l Location))
  (=> (and (has_dementia p) (resides_in p l) (is_sister_of v p))
      (can_stop_visiting v p))))

;--- Test the question ---------------------------------------------------
; Is it possible to stop the sister from visiting the father?
(assert (can_stop_visiting sister father))

;--- Check the result ----------------------------------------------------
(check-sat)
(get-model)