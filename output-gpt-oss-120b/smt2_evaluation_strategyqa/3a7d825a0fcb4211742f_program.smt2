;--- Sorts -------------------------------------------------
(declare-sort Profession 0)
(declare-sort Field 0)

;--- Predicates / Functions --------------------------------
; Is a given profession a geographer?
(declare-fun is-geographer (Profession) Bool)

; Is a given field biochemistry?
(declare-fun is-biochemistry (Field) Bool)

; Does a profession use a particular field in its work?
(declare-fun uses (Profession Field) Bool)

;--- Constants --------------------------------------------
(declare-const G Profession)   ; a generic geographer
(declare-const B Field)        ; the field biochemistry

;--- Knowledge Base ----------------------------------------
; G is a geographer
(assert (is-geographer G))

; B is biochemistry
(assert (is-biochemistry B))

; Rule: Geographers do NOT use biochemistry
(assert (forall ((p Profession) (f Field))
  (=> (and (is-geographer p) (is-biochemistry f))
      (not (uses p f)))))

;--- Test the claim ----------------------------------------
; Would a geographer use biochemistry?
(assert (uses G B))

;--- Check the claim ---------------------------------------
(check-sat)
(get-model)