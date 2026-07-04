; Question: Could a dandelion suffer from hepatitis?
; This is a possibility question - we test if the scenario is satisfiable

; Declare sorts
(declare-sort Organism 0)
(declare-sort Disease 0)

; Declare functions
(declare-fun is-plant (Organism) Bool)
(declare-fun is-animal (Organism) Bool)
(declare-fun has-liver (Organism) Bool)
(declare-fun can-suffer-from (Organism Disease) Bool)
(declare-fun requires-liver (Disease) Bool)

; Declare constants
(declare-const dandelion Organism)
(declare-const hepatitis Disease)

; Knowledge Base

; Fact: Dandelion is a plant
(assert (is-plant dandelion))

; Rule: Plants are not animals
(assert (forall ((o Organism))
  (=> (is-plant o) (not (is-animal o)))))

; Rule: Only animals have livers
(assert (forall ((o Organism))
  (=> (has-liver o) (is-animal o))))

; Fact: Hepatitis is a disease that requires a liver
(assert (requires-liver hepatitis))

; Rule: To suffer from a liver-requiring disease, organism must have a liver
(assert (forall ((o Organism) (d Disease))
  (=> (and (can-suffer-from o d) (requires-liver d))
      (has-liver o))))

; Test Scenario: Could a dandelion suffer from hepatitis?
; We assert this and check if it's satisfiable with the knowledge base
(assert (can-suffer-from dandelion hepatitis))

; Check satisfiability
(check-sat)
(get-model)

; Expected result: unsat
; Reasoning: 
; 1. Dandelion is a plant
; 2. Plants are not animals
; 3. Only animals have livers, so dandelions don't have livers
; 4. Hepatitis requires a liver
; 5. To suffer from hepatitis, you need a liver
; 6. Dandelion cannot have a liver, therefore cannot suffer from hepatitis
; 7. The assertion creates a contradiction → unsat (False - it could NOT happen)