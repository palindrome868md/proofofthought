; Question: While on a liquid diet, are there some types of soup you cannot eat?
; This is an existential question - we test if there exists a soup that cannot be eaten

; Declare sorts
(declare-sort Soup 0)
(declare-sort Diet 0)

; Declare functions/predicates
(declare-fun has-chunks (Soup) Bool)
(declare-fun is-pureed (Soup) Bool)
(declare-fun is-liquid-diet (Diet) Bool)
(declare-fun can-eat-on-diet (Soup Diet) Bool)

; Declare constants for specific soups and diet
(declare-const chicken-noodle-soup Soup)
(declare-const vegetable-chunk-soup Soup)
(declare-const clear-broth Soup)
(declare-const tomato-bisque Soup)
(declare-const liquid-diet Diet)

; Knowledge base: Define the liquid diet
(assert (is-liquid-diet liquid-diet))

; Rule 1: On a liquid diet, you cannot eat soups with chunks
(assert (forall ((s Soup) (d Diet))
  (=> (and (has-chunks s) (is-liquid-diet d))
      (not (can-eat-on-diet s d)))))

; Rule 2: On a liquid diet, you can eat clear/pureed soups without chunks
(assert (forall ((s Soup) (d Diet))
  (=> (and (not (has-chunks s)) (is-liquid-diet d))
      (can-eat-on-diet s d))))

; Fact: Chicken noodle soup has chunks (noodles, vegetables, meat)
(assert (has-chunks chicken-noodle-soup))

; Fact: Vegetable chunk soup has chunks
(assert (has-chunks vegetable-chunk-soup))

; Fact: Clear broth does not have chunks
(assert (not (has-chunks clear-broth)))

; Fact: Tomato bisque is pureed (no chunks)
(assert (not (has-chunks tomato-bisque)))

; Test: Are there some types of soup you cannot eat on a liquid diet?
; We assert that chicken-noodle-soup cannot be eaten on liquid diet
(assert (not (can-eat-on-diet chicken-noodle-soup liquid-diet)))

; Check satisfiability
; If sat = True, then yes, there are soups you cannot eat on liquid diet
; If unsat = False, then no, all soups can be eaten
(check-sat)
(get-model)