; Determine if any Chinese zodiac animals are Chordata (vertebrates)

(declare-sort Animal 0)

; Predicate: chordata(x) means x is a chordate
(declare-fun chordata (Animal) Bool)

; Chinese zodiac animal constants
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

; Knowledge base: real zodiac animals and their chordata status
(assert (chordata rat))
(assert (chordata ox))
(assert (chordata tiger))
(assert (chordata rabbit))
; Dragon is mythical/celestial and not assumed to be a chordate
(assert (not (chordata dragon)))
(assert (chordata snake))
(assert (chordata horse))
(assert (chordata goat))
(assert (chordata monkey))
(assert (chordata rooster))
(assert (chordata dog))
(assert (chordata pig))

; Test: there exists a zodiac animal that is chordata
(declare-const a Animal)
(assert (or (= a rat) (= a ox) (= a tiger) (= a rabbit) (= a dragon)
            (= a snake) (= a horse) (= a goat) (= a monkey)
            (= a rooster) (= a dog) (= a pig)))
(assert (chordata a))

; Check satisfiability and provide a witness
(check-sat)
(get-model)