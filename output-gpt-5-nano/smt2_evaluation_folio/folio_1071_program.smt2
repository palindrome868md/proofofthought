; Sorts
(declare-sort Lipstick 0)

; Predicates and relations
(declare-fun velvet_finish (Lipstick) Bool)
(declare-fun satin_finish (Lipstick) Bool)
(declare-fun refillable (Lipstick) Bool)
(declare-fun rosewood_desc (Lipstick) Bool)
(declare-fun rouge_dior_ll (Lipstick) Bool)  ; in Rouge Dior Lunar New Year Limited Edition set

; Constants
(declare-const r999 Lipstick)

; Knowledge base (premises)

; 5. r999 is in the Rouge Dior Lunar New Year Limited Edition set
(assert (rouge_dior_ll r999))

; 5. r999 has either "rosewood" or velvet finish
(assert (or (rosewood_desc r999) (velvet_finish r999)))

; 1. All velvet-finish lipsticks in the set are refillable
(assert (forall ((x Lipstick))
  (=> (and (velvet_finish x) (rouge_dior_ll x))
      (refillable x))))

; 2. Lipsticks in the Rouge Dior set have either velvet-finish or satin-finish
(assert (forall ((x Lipstick))
  (=> (rouge_dior_ll x)
      (or (velvet_finish x) (satin_finish x)))))

; 3. No satin-finish lipsticks in the set do not have "rosewood" in official description
;    i.e., if a lipstick is in the set and satin-finish, then it has rosewood
(assert (forall ((x Lipstick))
  (=> (and (rouge_dior_ll x) (satin_finish x))
      (rosewood_desc x))))

; 4. Lipsticks in the Rouge Dior set either do not have rosewood or have rosewood
;    (tautology; included for completeness)
(assert (forall ((x Lipstick))
  (=> (rouge_dior_ll x)
      (or (not (rosewood_desc x)) (rosewood_desc x)))))

; Test for the statement:
; Statement: If r999 is not both velvet_finish and in the set, then it neither is refillable nor has rosewood.
; We test the negation of the statement: A and not B
; A = not (velvet_finish r999 and rouge_dior_ll r999)
; not B = (refillable r999) or (rosewood_desc r999)

(assert (and (not (and (velvet_finish r999) (rouge_dior_ll r999)))
             (or (refillable r999) (rosewood_desc r999))))

; Check satisfiability to determine truth of the statement
(check-sat)
(get-model)