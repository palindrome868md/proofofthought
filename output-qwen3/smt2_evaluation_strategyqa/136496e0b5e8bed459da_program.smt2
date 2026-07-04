; Question: Would it be impossible to use an Iwato scale for a twelve-tone technique composition?

; Declare sorts
(declare-sort Scale 0)
(declare-sort Composition 0)
(declare-sort Note 0)

; Declare functions
(declare-fun num-unique-notes (Scale) Int)
(declare-fun is-twelve-tone (Composition) Bool)
(declare-fun uses-scale (Composition Scale) Bool)
(declare-fun is-iwato (Scale) Bool)

; Declare constants
(declare-const iwato-scale Scale)
(declare-const test-composition Composition)

; Knowledge Base: Iwato scale has 5 unique notes (Japanese pentatonic)
(assert (= (num-unique-notes iwato-scale) 5))
(assert (is-iwato iwato-scale))

; Knowledge Base: Twelve-tone technique requires all 12 chromatic notes
(assert (forall ((c Composition))
  (=> (is-twelve-tone c)
      (exists ((s Scale))
        (and (uses-scale c s)
             (= (num-unique-notes s) 12))))))

; Knowledge Base: If a composition uses a scale as its basis, 
; the scale must provide enough notes for the technique
(assert (forall ((c Composition) (s Scale))
  (=> (and (uses-scale c s) (is-twelve-tone c))
      (>= (num-unique-notes s) 12))))

; Test Scenario: Try to use Iwato scale in a twelve-tone composition
(assert (is-twelve-tone test-composition))
(assert (uses-scale test-composition iwato-scale))

; Check satisfiability - if unsat, it's impossible
(check-sat)
(get-model)