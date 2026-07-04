;------------------------------------------------------------
;  Declarations
;------------------------------------------------------------
(declare-sort Person 0)
(declare-sort Band 0)
(declare-sort Instrument 0)

; Functions
(declare-fun plays (Person Instrument) Bool)   ; person plays an instrument
(declare-fun member (Person Band) Bool)        ; person is member of a band

; Constants for the relevant individuals / objects
(declare-const vic-di-cara Person)
(declare-const inside-out Band)
(declare-const bass Instrument)

;------------------------------------------------------------
;  Knowledge base (premises)
;------------------------------------------------------------
; Vic DiCara plays bass (and also guitar, but guitar is irrelevant here)
(assert (plays vic-di-cara bass))

; Vic DiCara was a member of the band Inside Out
(assert (member vic-di-cara inside-out))

; (The premise about style of music is not needed for the query,
;  so it is omitted.)

;------------------------------------------------------------
;  Test the statement: "A musician from Inside Out plays bass."
;  We introduce a witness constant that stands for the existential
;  musician and assert the required properties.
;------------------------------------------------------------
(declare-const witness Person)

; Witness must be a member of Inside Out and must play bass
(assert (member witness inside-out))
(assert (plays witness bass))

;------------------------------------------------------------
;  Solve
;------------------------------------------------------------
(check-sat)    ; Expected result: sat (the statement is true)
(get-model)   ; Optional: shows a model, e.g., witness = vic-di-cara