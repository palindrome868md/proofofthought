; 1. Declare sorts
(declare-sort Person 0)
(declare-sort Instrument 0)
(declare-sort Band 0)
(declare-sort MusicStyle 0)

; 2. Declare functions
(declare-fun plays-instrument (Person Instrument) Bool)
(declare-fun member-of (Person Band) Bool)
(declare-fun plays-style (Person MusicStyle) Bool)

; 3. Declare constants
(declare-const vic-dicara Person)
(declare-const guitar Instrument)
(declare-const bass Instrument)
(declare-const inside-out Band)
(declare-const punk MusicStyle)

; Witness constant for the statement verification
(declare-const witness Person)

; 4. Assert knowledge base (premises)
; Premise 1: Vic DiCara plays guitar and bass.
(assert (plays-instrument vic-dicara guitar))
(assert (plays-instrument vic-dicara bass))

; Premise 2: The only style of music Vic DiCara plays is punk music.
(assert (forall ((s MusicStyle))
  (=> (plays-style vic-dicara s) (= s punk))))

; Premise 3: Vic DiCara played in the band Inside Out.
(assert (member-of vic-dicara inside-out))

; 5. Assert statement for verification
; Statement: A musician from Inside Out plays bass.
; We assert the existence of a person (witness) who is in Inside Out and plays bass.
(assert (member-of witness inside-out))
(assert (plays-instrument witness bass))

; 6. Check satisfiability
; sat = True (Statement is consistent/entailed by KB)
; unsat = False (Statement contradicts KB)
(check-sat)
(get-model)