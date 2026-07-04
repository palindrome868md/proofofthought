; Question: Is there a warthog on Broadway?
; This tests whether a warthog can exist on Broadway given real-world knowledge

; 1. Declare sorts (types)
(declare-sort Animal 0)
(declare-sort Location 0)

; 2. Declare functions
(declare-fun is-warthog (Animal) Bool)
(declare-fun location-of (Animal) Location)
(declare-fun is-in-africa (Location) Bool)
(declare-fun is-broadway (Location) Bool)

; 3. Declare constants
(declare-const broadway Location)
(declare-const test-animal Animal)

; 4. Assert knowledge base (facts about warthogs and Broadway)

; Broadway is a specific location (in New York City)
(assert (is-broadway broadway))

; Broadway is NOT in Africa (it's in NYC, USA)
(assert (not (is-in-africa broadway)))

; Warthogs are native to sub-Saharan Africa and only found there in the wild
; If something is a warthog, its location must be in Africa
(assert (forall ((a Animal))
  (=> (is-warthog a)
      (is-in-africa (location-of a)))))

; 5. Test the question: Is there a warthog on Broadway?
; We assert that there IS a warthog on Broadway and check if this is satisfiable

; Assume test-animal is a warthog
(assert (is-warthog test-animal))

; Assume test-animal is located on Broadway
(assert (= (location-of test-animal) broadway))

; 6. Check satisfiability
; If unsat: No warthog can be on Broadway (contradiction with knowledge)
; If sat: A warthog could be on Broadway (consistent with knowledge)
(check-sat)
(get-model)