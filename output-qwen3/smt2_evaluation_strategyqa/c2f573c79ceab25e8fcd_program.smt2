; Question: Can a strawberry get worms similar to dogs?
; This tests biological possibility based on organism type

; Declare sorts
(declare-sort Organism 0)
(declare-sort WormType 0)

; Declare functions
(declare-fun is-plant (Organism) Bool)
(declare-fun is-animal (Organism) Bool)
(declare-fun is-strawberry (Organism) Bool)
(declare-fun is-dog (Organism) Bool)
(declare-fun has-animal-biology (Organism) Bool)
(declare-fun can-get-parasitic-worms (Organism) Bool)
(declare-fun similar-worm-infestation (Organism Organism) Bool)

; Declare constants
(declare-const strawberry-organism Organism)
(declare-const dog-organism Organism)

; Knowledge Base Facts

; Strawberries are plants, not animals
(assert (is-plant strawberry-organism))
(assert (not (is-animal strawberry-organism)))
(assert (is-strawberry strawberry-organism))

; Dogs are animals, not plants
(assert (is-animal dog-organism))
(assert (not (is-plant dog-organism)))
(assert (is-dog dog-organism))

; Rule: Animals have animal biology
(assert (forall ((o Organism))
  (=> (is-animal o) (has-animal-biology o))))

; Rule: Plants do not have animal biology
(assert (forall ((o Organism))
  (=> (is-plant o) (not (has-animal-biology o)))))

; Rule: Only organisms with animal biology can get parasitic worms like dogs
(assert (forall ((o Organism))
  (=> (can-get-parasitic-worms o) (has-animal-biology o))))

; Fact: Dogs can get parasitic worms
(assert (can-get-parasitic-worms dog-organism))

; Rule: Similar worm infestation requires same biology type
(assert (forall ((o1 Organism) (o2 Organism))
  (=> (similar-worm-infestation o1 o2)
      (= (has-animal-biology o1) (has-animal-biology o2)))))

; Test Scenario: Can strawberry get worms similar to dogs?
; We assert this is possible and check if it's satisfiable
(assert (can-get-parasitic-worms strawberry-organism))
(assert (similar-worm-infestation strawberry-organism dog-organism))

; Check satisfiability
(check-sat)
(get-model)

; Expected result: unsat (false)
; Reason: Strawberries are plants without animal biology,
; so they cannot get parasitic worms in the same way dogs do