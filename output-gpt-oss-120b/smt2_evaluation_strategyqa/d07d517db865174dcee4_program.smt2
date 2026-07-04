;-------------------------------------------------
;  Declarations
;-------------------------------------------------
(declare-sort Soup 0)          ; Uninterpreted sort for soups
(declare-sort Diet 0)          ; Uninterpreted sort for diets

; Predicate: is a given soup allowed on a given diet?
(declare-fun allowed (Soup Diet) Bool)

; Property: does the soup contain solid pieces (chunks)?
(declare-fun has_chunks (Soup) Bool)

; Specific constants
(declare-const liquid_diet Diet) ; the liquid diet we are interested in
(declare-const broth Soup)       ; a clear, chunk‑free soup
(declare-const chicken_noodle Soup) ; a chunky soup

;-------------------------------------------------
;  Knowledge base
;-------------------------------------------------
; Broth has no chunks → it is a pure liquid soup
(assert (not (has_chunks broth)))

; Chicken‑noodle soup has solid pieces
(assert (has_chunks chicken_noodle))

; Rule: any soup that has chunks cannot be eaten on a liquid diet
(assert (forall ((s Soup))
  (=> (has_chunks s)
      (not (allowed s liquid_diet)))))

; Rule: any soup without chunks is allowed on a liquid diet
(assert (forall ((s Soup))
  (=> (not (has_chunks s))
      (allowed s liquid_diet))))

;-------------------------------------------------
;  Question: "Are there some types of soup you cannot eat while on a liquid diet?"
;-------------------------------------------------
; Introduce a witness soup that is *not* allowed on the liquid diet
(declare-const bad_soup Soup)
(assert (not (allowed bad_soup liquid_diet)))

;-------------------------------------------------
;  Verification
;-------------------------------------------------
(check-sat)      ; sat  → such a soup exists (answer: Yes)
(get-model)