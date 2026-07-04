; 1. Declare constants (propositions)
(declare-const battery_is_flat Bool)
(declare-const switch_is_on Bool)
(declare-const wire_is_metal Bool)
(declare-const wire_is_plastic Bool)
(declare-const wire_is_conducting Bool)
(declare-const circuit_includes_battery Bool)
(declare-const circuit_includes_switch Bool)
(declare-const circuit_includes_bell Bool)
(declare-const circuit_includes_light_bulb Bool)
(declare-const circuit_includes_radio Bool)
(declare-const circuit_is_powered Bool)
(declare-const circuit_is_complete Bool)
(declare-const current_runs_circuit Bool)
(declare-const current_runs_light_bulb Bool)
(declare-const current_runs_bell Bool)
(declare-const current_runs_radio Bool)
(declare-const light_bulb_glowing Bool)
(declare-const bell_ringing Bool)
(declare-const radio_playing Bool)

; 2. Assert Knowledge Base (Facts from text)
(assert battery_is_flat)
(assert switch_is_on)
(assert wire_is_metal)
(assert circuit_includes_bell)

; 3. Assert Knowledge Base (Rules from text)
; If the circuit includes the battery and the battery is not flat then the circuit is powered.
(assert (=> (and circuit_includes_battery (not battery_is_flat)) circuit_is_powered))

; If the circuit includes the switch and the switch is on then the circuit is complete.
(assert (=> (and circuit_includes_switch switch_is_on) circuit_is_complete))

; If the circuit does not include the switch then the circuit is complete.
(assert (=> (not circuit_includes_switch) circuit_is_complete))

; If the wire is metal then the wire is conducting.
(assert (=> wire_is_metal wire_is_conducting))

; If the wire is plastic then the wire is not conducting.
(assert (=> wire_is_plastic (not wire_is_conducting)))

; If the circuit is powered and the circuit is complete and the wire is conducting then the current runs through the circuit.
(assert (=> (and circuit_is_powered circuit_is_complete wire_is_conducting) current_runs_circuit))

; If the current runs through the circuit and the circuit includes the light bulb then the current runs through the light bulb.
(assert (=> (and current_runs_circuit circuit_includes_light_bulb) current_runs_light_bulb))

; If the current runs through the circuit and the circuit includes the bell then the current runs through the bell.
(assert (=> (and current_runs_circuit circuit_includes_bell) current_runs_bell))

; If the current runs through the circuit and the circuit includes the radio then the current runs through the radio.
(assert (=> (and current_runs_circuit circuit_includes_radio) current_runs_radio))

; If the current runs through the light bulb then the light bulb is glowing.
(assert (=> current_runs_light_bulb light_bulb_glowing))

; If the current runs through the bell then the bell is ringing.
(assert (=> current_runs_bell bell_ringing))

; If the current runs through the radio then the radio is playing.
(assert (=> current_runs_radio radio_playing))

; 4. Verification: Test the question "The switch is on."
; Since this is a factual question ("Is X true?"), we assert the statement and check satisfiability.
; If sat, it is consistent (True). If unsat, it contradicts (False).
(assert switch_is_on)

; 5. Check satisfiability
(check-sat)
(get-model)