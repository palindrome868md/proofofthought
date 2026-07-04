;--- 1. Declare the uninterpreted sort for broadcasters
(declare-sort Entity 0)

;--- 2. Declare predicates (functions returning Bool)
(declare-fun broadcast (Entity Int) Bool)      ; broadcast(e,year)
(declare-fun major (Entity) Bool)              ; e is a major network
(declare-fun makes-news (Entity Int) Bool)     ; e's broadcast makes the news

;--- 3. Declare the constant representing "Spirit"
(declare-const Spirit Entity)

;--- 4. Knowledge base
; Spirit made a broadcast in 2020
(assert (broadcast Spirit 2020))

; Spirit is not a major network
(assert (not (major Spirit)))

; Only broadcasts from major networks can make the news
(assert (forall ((e Entity) (y Int))
  (=> (and (broadcast e y) (major e))
      (makes-news e y))))

;--- 5. Test the question:
; "Would a broadcast from Spirit make the news in 2020?"
(assert (makes-news Spirit 2020))

;--- 6. Check the result
(check-sat)
(get-model)