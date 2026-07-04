;--- Declarations ----------------------------------------------------
(declare-sort App 0)                       ; sort of applications

; predicates (return Bool)
(declare-fun isSocialMedia   (App) Bool)
(declare-fun hasChat         (App) Bool)
(declare-fun hasVideo        (App) Bool)
(declare-fun canSendMessages (App) Bool)
(declare-fun isSoftware      (App) Bool)
(declare-fun isComputerProg  (App) Bool)
(declare-fun canUploadVideos (App) Bool)
(declare-fun highEngagement  (App) Bool)
(declare-fun isAddictive     (App) Bool)
(declare-fun isIdealPreteens (App) Bool)

; constant TikTok
(declare-const TikTok App)

;--- Knowledge Base --------------------------------------------------
; 1. All social‑media apps with chat are software
(assert (forall ((a App))
        (=> (and (isSocialMedia a) (hasChat a))
            (isSoftware a))))

; 2. All social‑media apps that let users send messages have chat
(assert (forall ((a App))
        (=> (and (isSocialMedia a) (canSendMessages a))
            (hasChat a))))

; 3. Every social‑media app has chat or video
(assert (forall ((a App))
        (=> (isSocialMedia a)
            (or (hasChat a) (hasVideo a)))))

; 4. Video‑feature apps allow uploading videos
(assert (forall ((a App))
        (=> (and (isSocialMedia a) (hasVideo a))
            (canUploadVideos a))))

; 5. Software that is a social‑media app is a computer program
(assert (forall ((a App))
        (=> (and (isSoftware a) (isSocialMedia a))
            (isComputerProg a))))

; 6. High‑engagement social‑media apps are addictive
(assert (forall ((a App))
        (=> (and (isSocialMedia a) (highEngagement a))
            (isAddictive a))))

; 7. Addictive ⇒ not ideal for preteens
(assert (forall ((a App))
        (=> (isAddictive a)
            (not (isIdealPreteens a)))))

; 8. TikTok is a social‑media app and NOT ideal for preteens
(assert (isSocialMedia TikTok))
(assert (not (isIdealPreteens TikTok)))

;--- Test the Negation of the Statement -------------------------------
; Statement:  (isIdealPreteens TikTok) OR (isComputerProg TikTok)
; Negation:   (not (isIdealPreteens TikTok)) AND (not (isComputerProg TikTok))
(assert (not (isComputerProg TikTok)))   ; already have not ideal from premise 8

;--- Check satisfiability --------------------------------------------
(check-sat)
(get-model)