; Question: Does Northern fur seal make good pet for six year old?
; Reasoning: We need to check if Northern fur seals satisfy the criteria 
; for being a good pet for a six-year-old child

; Declare sorts
(declare-sort Animal 0)

; Declare functions for animal properties
(declare-fun is-domesticated (Animal) Bool)
(declare-fun is-wild (Animal) Bool)
(declare-fun requires-aquatic-habitat (Animal) Bool)
(declare-fun is-safe-for-children (Animal) Bool)
(declare-fun can-live-in-home (Animal) Bool)
(declare-fun is-protected-wildlife (Animal) Bool)
(declare-fun good-pet-for-age (Animal Int) Bool)

; Declare constants
(declare-const northern-fur-seal Animal)
(declare-const six Int)

; Knowledge base - Properties of Northern fur seals
; Northern fur seals are wild marine mammals
(assert (is-wild northern-fur-seal))
(assert (requires-aquatic-habitat northern-fur-seal))
(assert (is-protected-wildlife northern-fur-seal))

; Wild animals are not domesticated
(assert (forall ((a Animal))
  (=> (is-wild a) (not (is-domesticated a)))))

; Animals requiring aquatic habitat cannot live in typical homes
(assert (forall ((a Animal))
  (=> (requires-aquatic-habitat a) (not (can-live-in-home a)))))

; Protected wildlife cannot be kept as pets
(assert (forall ((a Animal))
  (=> (is-protected-wildlife a) (not (is-safe-for-children a)))))

; Rules for what makes a good pet for a six year old
; A good pet must be: domesticated, safe for children, can live in home, not protected wildlife
(assert (forall ((a Animal))
  (=> (good-pet-for-age a six)
      (and (is-domesticated a)
           (is-safe-for-children a)
           (can-live-in-home a)
           (not (is-protected-wildlife a))))))

; Test: Is Northern fur seal a good pet for six year old?
(assert (good-pet-for-age northern-fur-seal six))

; Check satisfiability
(check-sat)
; Expected: unsat (Northern fur seal does NOT make a good pet for six year old)
; This is because: wild, requires aquatic habitat, protected wildlife, not domesticated

(get-model)