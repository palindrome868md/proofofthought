; Question: Is the Illuminati card game still popular?
; This SMT-LIB 2.0 program models the popularity status of the Illuminati card game

; 1. Declare sorts
(declare-sort Game 0)

; 2. Declare functions (predicates about games)
(declare-fun is-popular (Game) Bool)
(declare-fun still-in-print (Game) Bool)
(declare-fun has-active-community (Game) Bool)
(declare-fun is-cult-classic (Game) Bool)

; 3. Declare constants
(declare-const illuminati-game Game)

; 4. Assert knowledge base (facts about the Illuminati card game)
; The Illuminati card game was created by Steve Jackson Games in 1982
; It maintains a niche following as a cult classic
(assert (is-cult-classic illuminati-game))
(assert (still-in-print illuminati-game))
(assert (has-active-community illuminati-game))

; Rule: Cult classics have niche followings, not mainstream popularity
; Being a cult classic means it's NOT broadly popular
(assert (forall ((g Game))
  (=> (is-cult-classic g)
      (not (is-popular g)))))

; Rule: Mainstream popularity requires broad appeal beyond cult status
(assert (forall ((g Game))
  (=> (is-popular g)
      (not (is-cult-classic g)))))

; 5. Test the question: Is the Illuminati card game still popular?
; We assert the claim and check if it's satisfiable with our knowledge base
(assert (is-popular illuminati-game))

; 6. Check satisfiability
(check-sat)
; Expected result: unsat
; Interpretation: The claim "Illuminati is popular" contradicts the knowledge base
; Therefore: The Illuminati card game is NOT still popular (it's a cult classic with niche appeal)

; 7. Get model (if sat, would show example values)
(get-model)