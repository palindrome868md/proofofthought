; -------------------------------------------------
; Sorts (uninterpreted types)
; -------------------------------------------------
(declare-sort Person 0)    ; people / anchors
(declare-sort Network 0)   ; TV networks
(declare-sort Language 0)  ; languages

; -------------------------------------------------
; Functions
; -------------------------------------------------
; p works for network n ?
(declare-fun works-for (Person Network) Bool)
; p speaks language l ?
(declare-fun speaks (Person Language) Bool)

; -------------------------------------------------
; Constants (objects)
; -------------------------------------------------
(declare-const rede-globo Network)  ; the TV network
(declare-const chinese Language)    ; Chinese language
(declare-const portuguese Language) ; Portuguese language

; -------------------------------------------------
; Knowledge base
; -------------------------------------------------
; Every person who works for Rede Globo speaks Portuguese
; and does NOT speak Chinese.
(assert
  (forall ((p Person))
    (=> (works-for p rede-globo)
        (and (speaks p portuguese)
             (not (speaks p chinese))))))

; -------------------------------------------------
; Test the proposition: "An anchor on Rede Globo speaks Chinese"
; -------------------------------------------------
; Introduce a fresh person to stand for a potential anchor.
(declare-const test-anchor Person)

; Assume this person works for Rede Globo.
(assert (works-for test-anchor rede-globo))

; Assume this person speaks Chinese.
(assert (speaks test-anchor chinese))

; -------------------------------------------------
; Query
; -------------------------------------------------
; Is the above combination consistent with the knowledge base?
(check-sat)   ; Expected result: unsat (the scenario cannot happen)
(get-model)   ; Optional: show the (unsatisfiable) model if any