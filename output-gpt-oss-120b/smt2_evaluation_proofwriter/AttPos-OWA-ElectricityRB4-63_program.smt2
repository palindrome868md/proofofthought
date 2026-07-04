; -------------------------------------------------
; 1. Declare Boolean constants for all atoms
; -------------------------------------------------
(declare-const battery_flat Bool)          ; The battery is flat
(declare-const switch_on Bool)             ; The switch is on
(declare-const wire_metal Bool)            ; The wire is metal
(declare-const circuit_includes_bell Bool) ; The circuit includes the bell
(declare-const circuit_includes_battery Bool)
(declare-const circuit_includes_switch Bool)
(declare-const circuit_includes_lightbulb Bool)
(declare-const circuit_includes_radio Bool)

(declare-const circuit_powered Bool)
(declare-const circuit_complete Bool)
(declare-const wire_conducting Bool)

(declare-const current_runs Bool)                ; current runs through the circuit
(declare-const current_runs_bell Bool)           ; current runs through the bell
(declare-const current_runs_lightbulb Bool)      ; current runs through the light bulb
(declare-const current_runs_radio Bool)          ; current runs through the radio

(declare-const bell_ringing Bool)
(declare-const lightbulb_glowing Bool)
(declare-const radio_playing Bool)

; -------------------------------------------------
; 2. Assert the facts given in the problem
; -------------------------------------------------
(assert battery_flat)                ; The battery is flat
(assert switch_on)                   ; The switch is on
(assert wire_metal)                  ; The wire is metal
(assert circuit_includes_bell)       ; The circuit includes the bell

; -------------------------------------------------
; 3. Encode the general rules (implications)
; -------------------------------------------------
; Rule: If the circuit includes the battery and the battery is not flat then the circuit is powered.
(assert (=> (and circuit_includes_battery (not battery_flat))
            circuit_powered))

; Rule: If the circuit includes the switch and the switch is on then the circuit is complete.
(assert (=> (and circuit_includes_switch switch_on)
            circuit_complete))

; Rule: If the circuit does NOT include the switch then the circuit is complete.
(assert (=> (not circuit_includes_switch)
            circuit_complete))

; Rule: If the wire is metal then the wire is conducting.
(assert (=> wire_metal wire_conducting))

; Rule: If the wire is plastic then the wire is NOT conducting.
(assert (=> (not wire_metal) (not wire_conducting))) ; (wire plastic) is the negation of metal

; Rule: If the circuit is powered and complete and the wire conducts then current runs through the circuit.
(assert (=> (and circuit_powered circuit_complete wire_conducting)
            current_runs))

; Rule: Propagation of current to components
(assert (=> (and current_runs circuit_includes_lightbulb)
            current_runs_lightbulb))
(assert (=> (and current_runs circuit_includes_bell)
            current_runs_bell))
(assert (=> (and current_runs circuit_includes_radio)
            current_runs_radio))

; Rule: Effects of current on components
(assert (=> current_runs_lightbulb lightbulb_glowing))
(assert (=> current_runs_bell bell_ringing))
(assert (=> current_runs_radio radio_playing))

; -------------------------------------------------
; 4. Test the query: "The switch is on."
; -------------------------------------------------
(assert switch_on)   ; the proposition we want to verify

; -------------------------------------------------
; 5. Check satisfiability (single check)
; -------------------------------------------------
(check-sat)
(get-model)