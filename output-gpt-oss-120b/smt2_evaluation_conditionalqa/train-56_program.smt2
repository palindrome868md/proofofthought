; -------------------------------------------------
; 1. Declare sorts (uninterpreted types)
; -------------------------------------------------
(declare-sort Person 0)
(declare-sort Asset 0)

; -------------------------------------------------
; 2. Declare functions / predicates
; -------------------------------------------------
; Spousal relationship
(declare-fun spouse (Person Person) Bool)

; Person inherits a given asset
(declare-fun inherits (Person Asset) Bool)

; Monetary value of an asset (in pounds)
(declare-fun asset_value (Asset Int) Int)

; Does a person have to pay Inheritance Tax?
(declare-fun inheritance_tax_due (Person) Bool)

; -------------------------------------------------
; 3. Declare constants for the case at hand
; -------------------------------------------------
(declare-const husband Person)
(declare-const widow  Person)   ; the question‑asker
(declare-const house  Asset)

; -------------------------------------------------
; 4. Knowledge base (facts from the scenario)
; -------------------------------------------------
; The husband and widow are spouses
(assert (spouse husband widow))

; The house is valued at £300,000
(assert (= (asset_value house) 300000))

; The widow inherits the house after the husband’s death
(assert (inherits widow house))

; -------------------------------------------------
; 5. Inheritance‑Tax exemption rule
;    (No tax is due when a spouse inherits from their partner)
; -------------------------------------------------
(assert
  (forall ((h Person) (w Person) (a Asset))
    (=> (and (spouse h w) (inherits w a))
        (not (inheritance_tax_due w)))))

; -------------------------------------------------
; 6. Test the question: "Will I be required to pay inheritance tax?"
;    We assert that the widow *does* have tax due and ask Z3 to check.
; -------------------------------------------------
(assert (inheritance_tax_due widow))

; -------------------------------------------------
; 7. Check satisfiability
; -------------------------------------------------
(check-sat)      ; Expected result: unsat (the statement cannot hold)
(get-model)      ; Optional: shows a model for the other symbols