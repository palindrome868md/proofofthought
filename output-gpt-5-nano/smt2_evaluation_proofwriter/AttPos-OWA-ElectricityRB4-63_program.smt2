; Booleans representing basic facts and circuit state
(declare-const battery-flat Bool)
(declare-const switch-on Bool)
(declare-const wire-metal Bool)
(declare-const wire-plastic Bool)

; Circuit composition and state
(declare-const circuit-includes-battery Bool)
(declare-const circuit-includes-switch Bool)
(declare-const circuit-complete Bool)
(declare-const circuit-powered Bool)
(declare-const wire-conducting Bool)
(declare-const current-runs-circuit Bool)
(declare-const circuit-includes-light-bulb Bool)
(declare-const current-runs-light-bulb Bool)
(declare-const circuit-includes-bell Bool)
(declare-const current-runs-bell Bool)
(declare-const circuit-includes-radio Bool)
(declare-const current-runs-radio Bool)
(declare-const light-bulb-glowing Bool)
(declare-const bell-ringing Bool)
(declare-const radio-playing Bool)

; Facts (given)
(assert battery-flat)     ; The battery is flat
(assert switch-on)          ; The switch is on
(assert wire-metal)          ; The wire is metal

; Rules (as implications)
; If the switch is included and on, the circuit is complete
(assert (=> (and circuit-includes-switch switch-on) circuit-complete))
; If the circuit does not include the switch, the circuit is complete
(assert (=> (not circuit-includes-switch) circuit-complete))
; Metal wire implies conducting
(assert (=> wire-metal wire-conducting))
; Plastic wire implies not conducting
(assert (=> wire-plastic (not wire-conducting)))
; If powered and complete and wire is conducting, then current runs in circuit
(assert (=> (and circuit-powered circuit-complete wire-conducting) current-runs-circuit))
; If current runs in circuit and light bulb included, current runs through light bulb
(assert (=> (and current-runs-circuit circuit-includes-light-bulb) current-runs-light-bulb))
; If current runs in circuit and bell included, current runs through bell
(assert (=> (and current-runs-circuit circuit-includes-bell) current-runs-bell))
; If current runs in circuit and radio included, current runs through radio
(assert (=> (and current-runs-circuit circuit-includes-radio) current-runs-radio))
; If current runs through light bulb, bulb glows
(assert (=> current-runs-light-bulb light-bulb-glowing))
; If current runs through bell, bell rings
(assert (=> current-runs-bell bell-ringing))
; If current runs through radio, radio plays
(assert (=> current-runs-radio radio-playing))
; Battery powering rule
(assert (=> (and circuit-includes-battery (not battery-flat)) circuit-powered))

; Test scenario: The switch is on (the given question)
(assert switch-on)

; Check satisfiability and model
(check-sat)
(get-model)