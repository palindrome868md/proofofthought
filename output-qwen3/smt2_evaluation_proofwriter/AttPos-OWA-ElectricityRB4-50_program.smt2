; 1. Declare sorts
(declare-sort Entity 0)
(declare-datatypes () ((Material metal plastic)))

; 2. Declare functions
(declare-fun includes (Entity Entity) Bool)
(declare-fun is_on (Entity) Bool)
(declare-fun material_of (Entity) Material)
(declare-fun is_flat (Entity) Bool)
(declare-fun is_powered (Entity) Bool)
(declare-fun is_complete (Entity) Bool)
(declare-fun is_conducting (Entity) Bool)
(declare-fun current_runs (Entity) Bool)
(declare-fun is_glowing (Entity) Bool)
(declare-fun is_ringing (Entity) Bool)
(declare-fun is_playing (Entity) Bool)

; 3. Declare constants
(declare-const circuit Entity)
(declare-const switch Entity)
(declare-const wire Entity)
(declare-const light_bulb Entity)
(declare-const battery Entity)
(declare-const bell Entity)
(declare-const radio Entity)

; 4. Assert knowledge base (facts)
(assert (includes circuit switch))
(assert (is_on switch))
(assert (= (material_of wire) metal))
(assert (includes circuit light_bulb))

; 5. Assert knowledge base (rules)
; If the circuit includes the battery and the battery is not flat then the circuit is powered.
(assert (=> (and (includes circuit battery) (not (is_flat battery))) (is_powered circuit)))

; If the circuit includes the switch and the switch is on then the circuit is complete.
(assert (=> (and (includes circuit switch) (is_on switch)) (is_complete circuit)))

; If the circuit does not include the switch then the circuit is complete.
(assert (=> (not (includes circuit switch)) (is_complete circuit)))

; If the wire is metal then the wire is conducting.
(assert (=> (= (material_of wire) metal) (is_conducting wire)))

; If the wire is plastic then the wire is not conducting.
(assert (=> (= (material_of wire) plastic) (not (is_conducting wire))))

; If the circuit is powered and the circuit is complete and the wire is conducting then the current runs through the circuit.
(assert (=> (and (is_powered circuit) (is_complete circuit) (is_conducting wire)) (current_runs circuit)))

; If the current runs through the circuit and the circuit includes the light bulb then the current runs through the light bulb.
(assert (=> (and (current_runs circuit) (includes circuit light_bulb)) (current_runs light_bulb)))

; If the current runs through the circuit and the circuit includes the bell then the current runs through the bell.
(assert (=> (and (current_runs circuit) (includes circuit bell)) (current_runs bell)))

; If the current runs through the circuit and the circuit includes the radio then the current runs through the radio.
(assert (=> (and (current_runs circuit) (includes circuit radio)) (current_runs radio)))

; If the current runs through the light bulb then the light bulb is glowing.
(assert (=> (current_runs light_bulb) (is_glowing light_bulb)))

; If the current runs through the bell then the bell is ringing.
(assert (=> (current_runs bell) (is_ringing bell)))

; If the current runs through the radio then the radio is playing.
(assert (=> (current_runs radio) (is_playing radio)))

; 6. Verification: Test the question "The circuit includes the light bulb."
; Assert the scenario being tested
(assert (includes circuit light_bulb))

; 7. Check satisfiability
(check-sat)
(get-model)