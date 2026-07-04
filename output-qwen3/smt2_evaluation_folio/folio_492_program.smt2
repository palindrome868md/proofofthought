; Reasoning Steps:
; 1. Analyze Premises:
;    - P1: Some fish stings people.
;    - P2: Stonefish is a fish.
;    - P3: Stonefish stings when stepped on.
;    - P4: If stonefish stings + untreated -> causes death.
;    - P5: Treatment exists (heat/antivenom).
; 2. Analyze Statement:
;    - "Stings of some fish can cause death if not treated."
;    - Logical Form: Exists(f: Fish). (Sting(f) & Untreated -> CausesDeath(f)).
;    - Since Stonefish is a Fish and satisfies this (P2, P4), the statement is True.
; 3. SMT Strategy:
;    - Define Sorts: Fish, Person.
;    - Define Constants: stonefish (Fish), victim (Person).
;    - Assert KB: is_fish(stonefish), stings(stonefish, victim), Rule(untreated -> death).
;    - Assert Statement Scenario: untreated(victim), causes_death(stonefish, victim).
;    - Check Sat: If 'sat', the scenario is possible/consistent with KB, meaning Statement is True.
;    - Expected Result: sat.

; 1. Declare Sorts
(declare-sort Fish 0)
(declare-sort Person 0)

; 2. Declare Functions
(declare-fun is_fish (Fish) Bool)
(declare-fun stings (Fish Person) Bool)
(declare-fun is_untreated (Person) Bool)
(declare-fun causes_death (Fish Person) Bool)

; 3. Declare Constants
(declare-const stonefish Fish)
(declare-const victim Person)

; 4. Assert Knowledge Base (Premises)
; Premise 2: Stonefish is a fish
(assert (is_fish stonefish))

; Premise 3: Stonefish stings (modeling the scenario where it stings)
(assert (stings stonefish victim))

; Premise 4: If stonefish stings and victim is untreated, it causes death
(assert (=> (and (stings stonefish victim) (is_untreated victim))
            (causes_death stonefish victim)))

; 5. Verify Statement
; Statement: "Stings of some fish can cause death if not treated."
; We test this by asserting the conditions for the specific fish (stonefish) 
; and checking if the consequence is satisfiable (possible).

; Assert condition: Victim is not treated (matches "if not treated")
(assert (is_untreated victim))

; Assert consequence: Death occurs (matches "can cause death")
; Since Stonefish is a Fish, this validates "Some fish..."
(assert (causes_death stonefish victim))

; 6. Check Satisfiability
; sat = True (Statement is consistent/possible given premises)
; unsat = False (Statement contradicts premises)
(check-sat)
(get-model)