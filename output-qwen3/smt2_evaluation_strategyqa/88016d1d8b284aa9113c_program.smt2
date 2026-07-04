; Question: If your skin was turning the color of a zombie, could it be because of nickel?
; This is a possibility question - we test if nickel exposure could cause zombie-like skin discoloration

; 1. Declare sorts
(declare-sort Substance 0)
(declare-sort SkinCondition 0)
(declare-sort Color 0)

; 2. Declare functions
(declare-fun causes (Substance SkinCondition) Bool)
(declare-fun has-color (SkinCondition Color) Bool)
(declare-fun resembles (Color Color) Bool)
(declare-fun is-zombie-color (Color) Bool)

; 3. Declare constants
(declare-const nickel Substance)
(declare-const nickel-dermatitis SkinCondition)
(declare-const greenish-gray Color)
(declare-const zombie-skin-color Color)

; 4. Assert knowledge base (facts about nickel and skin reactions)

; Fact: Nickel can cause contact dermatitis (skin reaction)
(assert (causes nickel nickel-dermatitis))

; Fact: Nickel dermatitis can cause greenish-gray skin discoloration
(assert (has-color nickel-dermatitis greenish-gray))

; Fact: Greenish-gray color resembles typical "zombie" skin color
(assert (resembles greenish-gray zombie-skin-color))

; Fact: Zombie skin color is characterized by pale/gray/greenish tones
(assert (is-zombie-color zombie-skin-color))

; Rule: If a substance causes a condition with a color that resembles zombie color,
; then that substance could cause zombie-like skin appearance
(assert (forall ((s Substance) (sc SkinCondition) (c Color))
  (=> (and (causes s sc)
           (has-color sc c)
           (resembles c zombie-skin-color))
      (is-zombie-color c))))

; 5. Test: Could nickel cause zombie-like skin color?
; We assert the scenario and check if it's satisfiable
(declare-const test-substance Substance)
(declare-const test-condition SkinCondition)
(declare-const test-color Color)

; Bind test variables to nickel scenario
(assert (= test-substance nickel))
(assert (= test-condition nickel-dermatitis))
(assert (= test-color greenish-gray))

; Assert the causal chain exists
(assert (causes test-substance test-condition))
(assert (has-color test-condition test-color))
(assert (resembles test-color zombie-skin-color))

; 6. Check satisfiability
; sat = Yes, it COULD be because of nickel
; unsat = No, it could NOT be because of nickel
(check-sat)
(get-model)