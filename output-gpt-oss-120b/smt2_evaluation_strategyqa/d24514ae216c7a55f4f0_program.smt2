; -------------------------------------------------
; 1. Declare sorts (types)
; -------------------------------------------------
(declare-sort City 0)
(declare-sort State 0)
(declare-sort Region 0)

; -------------------------------------------------
; 2. Declare predicates / functions
; -------------------------------------------------
; City belongs to a State
(declare-fun city-in-state (City State) Bool)

; State belongs to a Region
(declare-fun state-in-region (State Region) Bool)

; Derived predicate: a City is on the West Coast
(declare-fun on-west-coast (City) Bool)

; -------------------------------------------------
; 3. Declare the concrete objects we need
; -------------------------------------------------
(declare-const Miami City)
(declare-const Florida State)
(declare-const WestCoast Region)

; -------------------------------------------------
; 4. Knowledge base (facts and rules)
; -------------------------------------------------
; Fact: Miami is a city in Florida
(assert (city-in-state Miami Florida))

; Fact: Florida is NOT a West‑Coast state
(assert (not (state-in-region Florida WestCoast)))

; Rule 1: If a city is in a state that lies in the West Coast,
;         then the city is on the West Coast.
(assert (forall ((c City) (s State))
        (=> (and (city-in-state c s) (state-in-region s WestCoast))
            (on-west-coast c))))

; Rule 2: If a city is on the West Coast, then *any* state it belongs
;         to must be a West‑Coast state.  This makes the converse true
;         and forces a contradiction for Miami.
(assert (forall ((c City) (s State))
        (=> (and (on-west-coast c) (city-in-state c s))
            (state-in-region s WestCoast))))

; -------------------------------------------------
; 5. Test the statement: “Miami is a city on the American West Coast.”
; -------------------------------------------------
(assert (on-west-coast Miami))

; -------------------------------------------------
; 6. Ask Z3 to decide
; -------------------------------------------------
(check-sat)      ; Expected result: unsat (the statement is false)
(get-model)      ; Optional: show a model for the remaining symbols