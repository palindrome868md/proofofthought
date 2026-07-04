;--- Sort declarations -------------------------------------------------
(declare-sort Person 0)
(declare-sort Role 0)
(declare-sort Podcast 0)

;--- Function / predicate declarations ----------------------------------
(declare-fun hasRole (Person Role) Bool)      ; person holds a role
(declare-fun isFanOf (Person Podcast) Bool)  ; person is a fan of a podcast
(declare-fun isSecular (Podcast) Bool)       ; podcast is secular (non‑religious)

;--- Constant declarations ---------------------------------------------
(declare-const deacon Role)               ; the role “Deacon”
(declare-const godAwfulMovies Podcast)    ; the podcast “God Awful Movies”

;--- Knowledge base ----------------------------------------------------
; There exists at least one person who is a Deacon
(declare-const someDeacon Person)
(assert (hasRole someDeacon deacon))

; The podcast “God Awful Movies” is secular (i.e., not a religious podcast)
(assert (isSecular godAwfulMovies))

; General rule: Deacons do NOT become fans of secular podcasts
(assert (forall ((p Person) (pod Podcast))
  (=> (and (hasRole p deacon) (isSecular pod))
      (not (isFanOf p pod)))))

;--- Test the question -------------------------------------------------
; Would a Deacon be a fan of “God Awful Movies”?
(assert (isFanOf someDeacon godAwfulMovies))

;--- Check the result ---------------------------------------------------
(check-sat)   ; Expected: unsat → a Deacon would NOT be a fan
(get-model)