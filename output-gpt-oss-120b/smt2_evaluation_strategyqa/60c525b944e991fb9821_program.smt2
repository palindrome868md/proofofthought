;--- Sort declarations -------------------------------------------------
(declare-sort Person 0)
(declare-sort Language 0)

;--- Function / predicate declarations ----------------------------------
; Classification of a person as a Pict
(declare-fun is-pict (Person) Bool)

; Language knowledge
(declare-fun speaks (Person Language) Bool)

; Confusion predicate
(declare-fun confusedBy (Person Language) Bool)

;--- Constant declarations ----------------------------------------------
(declare-const pict Person)          ; a representative Pict
(declare-const pictish Language)     ; the Pictish language
(declare-const oldEnglish Language)  ; Old English

;--- Knowledge base -----------------------------------------------------
; The individual is a Pict
(assert (is-pict pict))

; A Pict speaks Pictish (and only that language)
(assert (speaks pict pictish))

; The two languages are distinct
(assert (distinct pictish oldEnglish))

; General rule: if a person does NOT speak a language, they are confused by it
(assert (forall ((p Person) (l Language))
        (=> (not (speaks p l))
            (confusedBy p l))))

; Optional uniqueness rule: a person can speak at most one language
(assert (forall ((p Person) (l1 Language) (l2 Language))
        (=> (and (speaks p l1) (speaks p l2))
            (= l1 l2))))

;--- Test the question ---------------------------------------------------
; Would a Pict be confused by Old English?
(assert (confusedBy pict oldEnglish))

;--- Check the query -----------------------------------------------------
(check-sat)
(get-model)