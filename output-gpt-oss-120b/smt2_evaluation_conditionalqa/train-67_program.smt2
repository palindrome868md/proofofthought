;--- Sorts ---------------------------------------------------------
(declare-sort Person 0)          ; persons
(declare-sort Location 0)        ; places (England/Wales, Canada, …)

;--- Constants -----------------------------------------------------
(declare-const claimant Person)   ; the civil partner making the claim
(declare-const missing  Person)   ; the person who disappeared

(declare-const EnglandWales Location) ; England or Wales (treated as one)
(declare-const Canada       Location) ; Canada (where the missing person was)

;--- Predicates / Functions ----------------------------------------
(declare-fun civilPartner (Person Person) Bool)   ; civil‑partner relationship
(declare-fun treatsDomicile (Person Location) Bool) ; "treats as permanent home"
(declare-fun livedWholeYearIn (Person Location) Bool) ; lived there for the whole year before the claim / disappearance
(declare-fun CanMakeClaim (Person Person) Bool)  ; ability to file a declaration of presumed death

;--- Knowledge base -----------------------------------------------
; 1. Claimant is the civil‑partner of the missing person
(assert (civilPartner claimant missing))

; 2. Claimant treats England/Wales as permanent home (condition 1)
(assert (treatsDomicile claimant EnglandWales))

; 3. Missing person was last known to be in Canada (does NOT give a condition)
(assert (treatsDomicile missing Canada))

; 4. No other conditions are required – we simply leave the other
;    predicates false (they are uninterpreted, so they can be false).

;--- Rule from the document ----------------------------------------
; A spouse/civil‑partner can claim if ANY of the four conditions hold.
(assert (forall ((c Person) (m Person))
  (=> (and (civilPartner c m)
           (or (treatsDomicile c EnglandWales)
               (livedWholeYearIn c EnglandWales)
               (treatsDomicile m EnglandWales)
               (livedWholeYearIn m EnglandWales)))
      (CanMakeClaim c m))))

;--- Test the question ---------------------------------------------
; Ask: "Can I make a claim for a declaration of presumed death?"
(assert (CanMakeClaim claimant missing))

;--- Check the result ------------------------------------------------
(check-sat)
(get-model)