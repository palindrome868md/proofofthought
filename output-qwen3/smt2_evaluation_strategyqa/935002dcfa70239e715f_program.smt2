; 1. Declare Sorts (Types)
; We need types for Groups of people, Events, and Memorials
(declare-sort Group 0)
(declare-sort Event 0)
(declare-sort Memorial 0)

; 2. Declare Functions (Predicates)
; is-first-responder: Checks if a group is considered first responders
(declare-fun is-first-responder (Group) Bool)
; served-at: Checks if a group served at a specific event
(declare-fun served-at (Group Event) Bool)
; commemorates: Checks if a memorial commemorates a specific event
(declare-fun commemorates (Memorial Event) Bool)
; included-in: Checks if a group is included in a specific memorial
(declare-fun included-in (Group Memorial) Bool)

; 3. Declare Constants
; Specific entities involved in the reasoning
(declare-const firefighters Group)
(declare-const september-11 Event)
(declare-const national-911-memorial Memorial)

; 4. Assert Knowledge Base (Facts and Rules)

; Fact: Firefighters are first responders
(assert (is-first-responder firefighters))

; Fact: Firefighters served at the September 11th attacks
(assert (served-at firefighters september-11))

; Fact: The National 9/11 Memorial commemorates the September 11th attacks
(assert (commemorates national-911-memorial september-11))

; Rule: If a group is a first responder, served at an event, 
; and a memorial commemorates that event, then the group is included in the memorial.
(assert (forall ((g Group) (e Event) (m Memorial))
  (=> (and (is-first-responder g)
           (served-at g e)
           (commemorates m e))
      (included-in g m))))

; 5. Verification Scenario
; Question: "Would Firefighters be included in a September 11th memorial?"
; We assert the positive scenario to check if it is consistent (sat) or contradictory (unsat) with the KB.
; Since the KB implies this statement, it should be consistent (sat).
(assert (included-in firefighters national-911-memorial))

; 6. Check Satisfiability
(check-sat)

; 7. Get Model (to see example values confirming consistency)
(get-model)