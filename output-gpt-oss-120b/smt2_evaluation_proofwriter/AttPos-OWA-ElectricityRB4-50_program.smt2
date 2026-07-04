;--- Sorts ---------------------------------------------------------
(declare-sort Component 0)          ; objects such as switch, wire, light‑bulb …

;--- Predicates (functions returning Bool) -----------------------
(declare-fun includes (Component) Bool)        ; circuit includes this component
(declare-fun is_on (Component) Bool)          ; a switch is on
(declare-fun is_metal (Component) Bool)       ; a wire is metal
(declare-fun is_conducting (Component) Bool)  ; a wire conducts electricity
(declare-fun is_powered () Bool)               ; circuit is powered
(declare-fun is_complete () Bool)              ; circuit is complete
(declare-fun current_runs_circuit () Bool)     ; current runs through whole circuit
(declare-fun current_runs (Component) Bool)    ; current runs through a component
(declare-fun glowing (Component) Bool)         ; light‑bulb is glowing
; (other predicates such as ringing, playing are omitted – they are not needed)

;--- Constants -----------------------------------------------------
(declare-const switch Component)
(declare-const wire Component)
(declare-const lightbulb Component)
; (battery, bell, radio … are omitted because they are not referenced)

;--- Knowledge base ------------------------------------------------
; The circuit includes the switch.
(assert (includes switch))
; The switch is on.
(assert (is_on switch))

; The wire is metal.
(assert (is_metal wire))

; The circuit includes the light bulb.
(assert (includes lightbulb))

;--- Rules (optional – they do not affect the current query) -----
; Metal ⇒ conducting
(assert (forall ((c Component))
        (=> (is_metal c) (is_conducting c))))

; If the circuit includes the switch and the switch is on then the circuit is complete.
(assert (forall ((c Component))
        (=> (and (includes switch) (is_on switch)) is_complete)))

; (Other rules from the description are omitted because they are irrelevant
;  to the truth of “circuit includes the light bulb”.)

;--- Query ---------------------------------------------------------
; Test whether the circuit includes the light bulb.
(assert (includes lightbulb))

;--- Solve ---------------------------------------------------------
(check-sat)
(get-model)