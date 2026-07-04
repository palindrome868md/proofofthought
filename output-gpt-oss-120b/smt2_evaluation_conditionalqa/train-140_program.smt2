;--- Sorts -------------------------------------------------
(declare-sort Person 0)

;--- Constants --------------------------------------------
(declare-const me Person)          ; the donor
(declare-const sister Person)      ; the attorney (your sister)

;--- Functions --------------------------------------------
; Person is an attorney on the LPA
(declare-fun is-attorney (Person) Bool)

; The attorney has changed her name (e.g., through marriage)
(declare-fun changed-name (Person) Bool)

; The OPG must be notified of the change
(declare-fun requires-update (Person) Bool)

;--- Knowledge base ---------------------------------------
; You appointed your sister as an attorney
(assert (is-attorney sister))

; She has changed her name by marriage
(assert (changed-name sister))

; Rule from the guidance:
; If an attorney’s name changes, you must write to OPG to update the record.
(assert (forall ((p Person))
  (=> (and (is-attorney p) (changed-name p))
      (requires-update p))))

;--- Test the question ------------------------------------
; Do I need to update the record for my sister?
(assert (requires-update sister))

;--- Query ------------------------------------------------
(check-sat)          ; Expected result: sat (an update is required)
(get-model)