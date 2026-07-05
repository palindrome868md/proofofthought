; Determine if Lil Jon's top-ranked Billboard song is a collaboration with a member of The Lox

(require-logic AUFLIA)  ; Optional: ensures compatible logic (may be omitted in some environments)

; Sorts
(declare-sort Person 0)
(declare-sort Song 0)

; Constants
(declare-const lil_jon Person)
(declare-const witness Person)
(declare-const top_song_turn_down_for_what Song)
(declare-const dj_snake Person)

; Functions
(declare-fun top_song_of (Person) Song)
(declare-fun collab (Song Person) Bool)
(declare-fun is_lox_member (Person) Bool)

; Knowledge base
; Lil Jon's top song is top_song_turn_down_for_what
(assert (= (top_song_of lil_jon) top_song_turn_down_for_what))

; The top song collab: Turn Down for What features DJ Snake (not a Lox member)
(assert (collab top_song_turn_down_for_what dj_snake))
(assert (not (is_lox_member dj_snake)))

; Universal rule: No Lox member collabs with Lil Jon's top song
(assert (forall ((p Person))
  (=> (is_lox_member p)
      (not (collab top_song_turn_down_for_what p)))))

; Test scenario (the question): Is there a Lox member who collab'd on Lil Jon's top song?
(assert (is_lox_member witness))
(assert (collab top_song_turn_down_for_what witness))

; Check satisfiability to answer the question
(check-sat)