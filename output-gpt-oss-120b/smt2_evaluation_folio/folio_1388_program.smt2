;------------------------------
; 1. Declare the uninterpreted sort for applications
;------------------------------
(declare-sort App 0)

;------------------------------
; 2. Declare predicates (functions returning Bool)
;------------------------------
(declare-fun isSocialMedia (App) Bool)          ; “is a social‑media application”
(declare-fun hasChat       (App) Bool)          ; “has chat features”
(declare-fun hasVideo      (App) Bool)          ; “has video features”
(declare-fun isSoftware    (App) Bool)          ; “is software”
(declare-fun isComputerProg(App) Bool)          ; “is a computer program”
(declare-fun isAddictive   (App) Bool)          ; “is addictive”
(declare-fun notIdealPreteens (App) Bool)       ; “not ideal for preteens”

;------------------------------
; 3. Declare the constant TikTok
;------------------------------
(declare-const TikTok App)

;------------------------------
; 4. Knowledge base (the premises)
;------------------------------

; All social‑media apps containing chat features are software.
(assert (forall ((a App))
  (=> (and (isSocialMedia a) (hasChat a))
      (isSoftware a))))

; All social‑media apps have chat features or video features.
(assert (forall ((a App))
  (=> (isSocialMedia a)
      (or (hasChat a) (hasVideo a)))))

; All software that is a social‑media app is a computer program.
(assert (forall ((a App))
  (=> (and (isSoftware a) (isSocialMedia a))
      (isComputerProg a))))

; (Other premises are not needed for the queried statement, but they can be added
;  similarly if desired.)

; TikTok is a social‑media application and it is not ideal for pre‑teens.
(assert (isSocialMedia TikTok))
(assert (notIdealPreteens TikTok))

;------------------------------
; 5. Statement to verify:
;    “TikTok either has chat features or is a computer program.”
;------------------------------
(assert (or (hasChat TikTok) (isComputerProg TikTok)))

;------------------------------
; 6. Check satisfiability
;------------------------------
(check-sat)
(get-model)