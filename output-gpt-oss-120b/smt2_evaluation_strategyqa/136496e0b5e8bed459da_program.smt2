; -------------------------------------------------
; 1. Declare sorts
; -------------------------------------------------
(declare-sort Scale 0)
(declare-sort Technique 0)

; -------------------------------------------------
; 2. Declare functions and predicates
; -------------------------------------------------
; Number of distinct pitch classes a scale provides
(declare-fun num-pitches (Scale) Int)

; Number of distinct pitch classes a technique requires
(declare-fun required-pitches (Technique) Int)

; Predicate: using this scale for this technique is impossible
(declare-fun impossible-use (Scale Technique) Bool)

; -------------------------------------------------
; 3. Declare the relevant constants
; -------------------------------------------------
(declare-const iwato Scale)          ; the Iwato pentatonic scale
(declare-const twelve-tone Technique) ; twelve‑tone technique

; -------------------------------------------------
; 4. Knowledge base (facts)
; -------------------------------------------------
; Iwato provides exactly 5 pitch classes (pentatonic)
(assert (= (num-pitches iwato) 5))

; Twelve‑tone technique requires exactly 12 pitch classes
(assert (= (required-pitches twelve-tone) 12))

; General rule: if a scale supplies fewer pitches than a technique needs,
; then using the scale for that technique is impossible
(assert (forall ((s Scale) (t Technique))
  (=> (< (num-pitches s) (required-pitches t))
      (impossible-use s t))))

; -------------------------------------------------
; 5. Test the statement: "It would be impossible to use an Iwato
;    scale for a twelve‑tone technique composition."
; -------------------------------------------------
(assert (impossible-use iwato twelve-tone))

; -------------------------------------------------
; 6. Check satisfiability (sat ⇒ the statement is true)
; -------------------------------------------------
(check-sat)
(get-model)