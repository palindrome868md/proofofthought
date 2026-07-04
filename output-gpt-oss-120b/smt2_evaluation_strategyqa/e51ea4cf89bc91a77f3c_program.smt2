; -------------------------------------------------
; 1. Declare sorts
; -------------------------------------------------
(declare-sort Country 0)

; Enumerated datatype for WWII roles
(declare-datatypes () ((Role (neutral) (belligerent))))

; -------------------------------------------------
; 2. Declare functions
; -------------------------------------------------
(declare-fun role (Country) Role)   ; role of a country in WWII

; -------------------------------------------------
; 3. Declare constants (countries)
; -------------------------------------------------
(declare-const switzerland Country)
(declare-const portugal Country)
(declare-const angola Country)
(declare-const mozambique Country)
(declare-const guinea_bissau Country)

; -------------------------------------------------
; 4. Knowledge base
; -------------------------------------------------
; Switzerland was neutral in WWII
(assert (= (role switzerland) neutral))

; Portugal was also neutral in WWII (historical fact)
(assert (= (role portugal) neutral))

; For illustration we give other war‑countries a non‑neutral role,
; but this is *not* required for the existence proof.
(assert (= (role angola) belligerent))
(assert (= (role mozambique) belligerent))
(assert (= (role guinea_bissau) belligerent))

; -------------------------------------------------
; 5. Test the question
; -------------------------------------------------
; Introduce a witness that must be one of the Portuguese Colonial War countries
(declare-const witness Country)
(assert (or (= witness portugal)
            (= witness angola)
            (= witness mozambique)
            (= witness guinea_bissau)))

; The witness must share Switzerland's WWII role
(assert (= (role witness) (role switzerland)))

; -------------------------------------------------
; 6. Check satisfiability (answers the question)
; -------------------------------------------------
(check-sat)   ; Expected: sat  (there exists such a country)
(get-model)  ; Show a concrete witness (e.g., Portugal)