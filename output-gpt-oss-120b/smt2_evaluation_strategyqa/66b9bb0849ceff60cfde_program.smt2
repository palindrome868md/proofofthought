;--- Sort declarations -------------------------------------------------
(declare-sort Organism 0)
(declare-sort Disease 0)

;--- Function and predicate declarations --------------------------------
; True if the organism is a plant
(declare-fun is-plant (Organism) Bool)
; True if the organism is an animal (i.e., has a liver)
(declare-fun is-animal (Organism) Bool)
; True if the organism suffers from the disease
(declare-fun has-disease (Organism Disease) Bool)

;--- Constant declarations ----------------------------------------------
(declare-const dandelion Organism)
(declare-const hepatitis Disease)

;--- Knowledge base -----------------------------------------------------
; Dandelion is a plant
(assert (is-plant dandelion))
; Plants are not animals
(assert (forall ((o Organism))
  (=> (is-plant o) (not (is-animal o)))))

; Hepatitis can only affect animals (organisms that have a liver)
(assert (forall ((o Organism) (dis Disease))
  (=> (and (has-disease o dis) (= dis hepatitis))
      (is-animal o))))

;--- Question to verify -------------------------------------------------
; Can a dandelion suffer from hepatitis?
(assert (has-disease dandelion hepatitis))

;--- Check the scenario -------------------------------------------------
(check-sat)   ; Expected result: unsat (the scenario is impossible)
(get-model)