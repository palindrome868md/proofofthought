; Declare sorts
(declare-sort Animal 0)

; Declare functions
(declare-fun is-chinese-zodiac (Animal) Bool)
(declare-fun is-chordata (Animal) Bool)

; Declare constants for Chinese zodiac animals
(declare-const rat Animal)
(declare-const ox Animal)
(declare-const tiger Animal)
(declare-const rabbit Animal)
(declare-const dragon Animal)
(declare-const snake Animal)
(declare-const horse Animal)
(declare-const goat Animal)
(declare-const monkey Animal)
(declare-const rooster Animal)
(declare-const dog Animal)
(declare-const pig Animal)

; Knowledge base: All 12 animals are in the Chinese zodiac
(assert (is-chinese-zodiac rat))
(assert (is-chinese-zodiac ox))
(assert (is-chinese-zodiac tiger))
(assert (is-chinese-zodiac rabbit))
(assert (is-chinese-zodiac dragon))
(assert (is-chinese-zodiac snake))
(assert (is-chinese-zodiac horse))
(assert (is-chinese-zodiac goat))
(assert (is-chinese-zodiac monkey))
(assert (is-chinese-zodiac rooster))
(assert (is-chinese-zodiac dog))
(assert (is-chinese-zodiac pig))

; Knowledge base: Biological classification
; All real animals in the zodiac are Chordata (vertebrates)
; Dragon is mythical, not a real animal, so not Chordata
(assert (is-chordata rat))
(assert (is-chordata ox))
(assert (is-chordata tiger))
(assert (is-chordata rabbit))
(assert (not (is-chordata dragon)))
(assert (is-chordata snake))
(assert (is-chordata horse))
(assert (is-chordata goat))
(assert (is-chordata monkey))
(assert (is-chordata rooster))
(assert (is-chordata dog))
(assert (is-chordata pig))

; Test: Are any animals in Chinese calendar Chordata?
; Assert existence of at least one Chinese zodiac animal that is Chordata
(declare-const test-animal Animal)
(assert (and (is-chinese-zodiac test-animal) (is-chordata test-animal)))

; Check satisfiability
(check-sat)
(get-model)