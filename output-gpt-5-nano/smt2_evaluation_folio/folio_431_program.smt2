; Sorts
(declare-sort Person 0)
(declare-sort Band 0)
(declare-sort Style 0)

; Constants
(declare-const vic Person)
(declare-const inside_out Band)

; Predicates / Functions
(declare-fun plays_guitar (Person) Bool)
(declare-fun plays_bass (Person) Bool)
(declare-fun member_of (Person Band) Bool)
(declare-fun style_of (Person) Style)

; Styles
(declare-const punk Style)
(declare-const other Style)

; Knowledge base (premises)
(assert (= (style_of vic) punk))        ; Vic's only style is punk
(assert (plays_guitar vic))             ; Vic plays guitar
(assert (plays_bass vic))               ; Vic plays bass
(assert (member_of vic inside_out))      ; Vic is in Inside Out

; Test: "A musician from Inside Out plays bass."
(assert (exists ((p Person))
  (and (member_of p inside_out)
       (plays_bass p))))

; Verification
(check-sat)
(get-model)