(declare-sort Person 0)
(declare-sort Band 0)

(declare-const vic Person)
(declare-const insideOut Band)

(declare-fun member_of (Person Band) Bool)
(declare-fun plays_guitar (Person) Bool)
(declare-fun plays_bass (Person) Bool)
(declare-fun plays_style (Person MusicStyle) Bool)

(declare-datatypes () ((MusicStyle punk)))

; Knowledge base
(assert (member_of vic insideOut))    ; Vic is in Inside Out
(assert (plays_guitar vic))           ; Vic plays guitar
(assert (plays_bass vic))             ; Vic plays bass
(assert (plays_style vic punk))        ; Vic plays punk style

; The only style of music Vic plays is punk
(assert (forall ((p Person) (s MusicStyle))
  (=> (plays_style p s)
      (= s punk))))

; Test: is there a musician from Inside Out who plays bass?
(declare-const w Person)
(assert (member_of w insideOut))
(assert (plays_bass w))

(check-sat)
(get-model)