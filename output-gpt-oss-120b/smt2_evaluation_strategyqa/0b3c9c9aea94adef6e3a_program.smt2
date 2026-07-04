;----------------------------------------------
; Sort declarations
;----------------------------------------------
(declare-sort Event 0)      ; abstract sort for historical events
(declare-sort Currency 0)   ; abstract sort for monetary currencies

;----------------------------------------------
; Function declarations
;----------------------------------------------
; Indicates that a given currency was used to pay for an event
(declare-fun used-for (Event Currency) Bool)

;----------------------------------------------
; Constant declarations
;----------------------------------------------
(declare-const louisiana-purchase Event)   ; the Louisiana Purchase transaction
(declare-const bitcoin Currency)           ; the cryptocurrency Bitcoin
(declare-const us-dollar Currency)         ; US dollars (the historically used currency)

;----------------------------------------------
; Knowledge base (facts known to be true)
;----------------------------------------------
; The Louisiana Purchase was paid for with US dollars.
(assert (used-for louisiana-purchase us-dollar))

; Bitcoin did not exist at the time of the Louisiana Purchase.
; Therefore it could not have been used for that transaction.
(assert (not (used-for louisiana-purchase bitcoin)))

;----------------------------------------------
; Verification query
;----------------------------------------------
; Test the claim: "The Louisiana Purchase was made with bitcoin."
(assert (used-for louisiana-purchase bitcoin))

;----------------------------------------------
; Check satisfiability
;----------------------------------------------
(check-sat)   ; Expected result: unsat (the claim is false)
(get-model)