; ------------------------------------------------------------
;  Sorts
; ------------------------------------------------------------
(declare-sort Animal 0)          ; Uninterpreted sort for all animals
(declare-sort Phylum 0)          ; Uninterpreted sort for biological phyla

; ------------------------------------------------------------
;  Predicates (Boolean functions)
; ------------------------------------------------------------
; Marks an animal as part of the Chinese zodiac
(declare-fun zodiac-animal (Animal) Bool)

; Indicates that an animal belongs to the phylum Chordata
(declare-fun in-chordata (Animal) Bool)

; ------------------------------------------------------------
;  Constants for the twelve zodiac animals
; ------------------------------------------------------------
(declare-const rat      Animal)
(declare-const ox       Animal)
(declare-const tiger    Animal)
(declare-const rabbit   Animal)
(declare-const dragon   Animal)
(declare-const snake    Animal)
(declare-const horse    Animal)
(declare-const goat     Animal)   ; also called sheep
(declare-const monkey   Animal)
(declare-const rooster  Animal)
(declare-const dog      Animal)
(declare-const pig      Animal)

; ------------------------------------------------------------
;  Knowledge base: which constants are zodiac animals
; ------------------------------------------------------------
(assert (zodiac-animal rat))
(assert (zodiac-animal ox))
(assert (zodiac-animal tiger))
(assert (zodiac-animal rabbit))
(assert (zodiac-animal dragon))
(assert (zodiac-animal snake))
(assert (zodiac-animal horse))
(assert (zodiac-animal goat))
(assert (zodiac-animal monkey))
(assert (zodiac-animal rooster))
(assert (zodiac-animal dog))
(assert (zodiac-animal pig))

; ------------------------------------------------------------
;  Knowledge base: classification into Chordata
; ------------------------------------------------------------
; All mammals, birds, and reptiles are chordates.
; We pick a few representative zodiac animals to assert this.
(assert (in-chordata rat))      ; mammal
(assert (in-chordata snake))    ; reptile
(assert (in-chordata rooster))  ; bird

; (The dragon is mythical – we do *not* assert it as chordate,
;   but that does not affect the existence claim.)

; ------------------------------------------------------------
;  Test the query: "Is there any zodiac animal that is a chordate?"
; ------------------------------------------------------------
(declare-const test-animal Animal)

; Constrain test-animal to be both a zodiac animal and a chordate
(assert (zodiac-animal test-animal))
(assert (in-chordata test-animal))

; ------------------------------------------------------------
;  Check the query
; ------------------------------------------------------------
(check-sat)
(get-model)