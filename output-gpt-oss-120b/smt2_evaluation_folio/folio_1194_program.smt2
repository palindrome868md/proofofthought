;--- Sort declaration -------------------------------------------------
(declare-sort Person 0)

;--- Predicate (function) declarations ---------------------------------
(declare-fun AMC (Person) Bool)                     ; subscribes to AMC A‑List
(declare-fun HBO (Person) Bool)                     ; subscribes to HBO
(declare-fun Eligible3 (Person) Bool)               ; can watch 3 movies/week free
(declare-fun GoesWeekly (Person) Bool)              ; goes to cinema every week
(declare-fun PrefersSeries (Person) Bool)           ; prefers TV series
(declare-fun WatchesSeriesInCinema (Person) Bool)   ; watches TV series in cinema

;--- Constants ---------------------------------------------------------
(declare-const Lily Person)       ; Lily, member of James' family
(declare-const witness Person)    ; witness for “some go weekly”

;--- Knowledge base (premises) -----------------------------------------
; 1. AMC subscribers are eligible for 3 free movies each week
(assert (forall ((x Person))
  (=> (AMC x) (Eligible3 x))))

; 2. Some family member goes to the cinema every week
(assert (GoesWeekly witness))

; 3. Every family member subscribes to AMC or HBO (or both)
(assert (forall ((x Person))
  (or (AMC x) (HBO x))))

; 4. If a family member prefers TV series, they do NOT watch series in cinemas
(assert (forall ((x Person))
  (=> (PrefersSeries x) (not (WatchesSeriesInCinema x)))))

; 5. HBO subscribers prefer TV series to movies
(assert (forall ((x Person))
  (=> (HBO x) (PrefersSeries x))))

; 6. Lily watches TV series in cinemas
(assert (WatchesSeriesInCinema Lily))

;--- Test the statement ------------------------------------------------
; Statement: Lily goes to cinemas every week OR watches 3 movies weekly free
; To prove it must be true, assert its negation and expect unsat.
(assert (not (or (GoesWeekly Lily) (Eligible3 Lily))))

;--- Solving -----------------------------------------------------------
(check-sat)      ; expected result: unsat (statement is entailed)
(get-model)     ; optional, shows a concrete model if SAT (won't appear here)