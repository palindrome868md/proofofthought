; Question: Could an ocelot subsist on a single bee hummingbird per day?
; This is a possibility question - we test if the scenario can be satisfied

; Declare sorts
(declare-sort Animal 0)

; Declare functions for animal properties
(declare-fun is-ocelot (Animal) Bool)
(declare-fun is-bee-hummingbird (Animal) Bool)
(declare-fun daily-caloric-need (Animal) Int)
(declare-fun caloric-content (Animal) Int)
(declare-fun weight-grams (Animal) Int)

; Declare constants for our test subjects
(declare-const ocelot Animal)
(declare-const hummingbird Animal)

; Knowledge Base: Ocelot facts
; Ocelots are medium-sized wild cats weighing 8-15 kg
(assert (is-ocelot ocelot))
(assert (>= (weight-grams ocelot) 8000))  ; Minimum 8kg
(assert (>= (daily-caloric-need ocelot) 300))  ; Minimum daily calories for a cat this size

; Knowledge Base: Bee Hummingbird facts
; Bee hummingbirds are the smallest birds, weighing 1.6-2 grams
(assert (is-bee-hummingbird hummingbird))
(assert (<= (weight-grams hummingbird) 2))  ; Maximum 2g
(assert (<= (caloric-content hummingbird) 10))  ; Very few calories (approx 5-10 cal)

; Biological constraint: Caloric need scales with body weight
; A carnivore needs approximately 30-50 calories per kg of body weight daily
(assert (forall ((a Animal))
  (=> (is-ocelot a)
      (>= (daily-caloric-need a) (* (div (weight-grams a) 1000) 30)))))

; Test scenario: Could one bee hummingbird subsist an ocelot for a day?
; This asserts that the hummingbird's calories meet or exceed the ocelot's daily need
(assert (>= (caloric-content hummingbird) (daily-caloric-need ocelot)))

; Check satisfiability
(check-sat)
; Expected: unsat (false) - A bee hummingbird cannot provide enough calories for an ocelot

(get-model)