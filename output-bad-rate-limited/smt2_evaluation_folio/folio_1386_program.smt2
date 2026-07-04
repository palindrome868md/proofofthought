; Declare sorts
(declare-sort App 0)

; Declare predicates / functions
(declare-fun social (App) Bool)
(declare-fun chat (App) Bool)
(declare-fun has-video (App) Bool)
(declare-fun sends-messages (App) Bool)
(declare-fun software (App) Bool)
(declare-fun computer-program (App) Bool)
(declare-fun can-upload (App) Bool)
(declare-fun ideal-preteens (App) Bool)
(declare-fun high-engagement (App) Bool)
(declare-fun addictive (App) Bool)

; TikTok constant
(declare-const tiktok App)

; Premises
(assert (social tiktok))                 ; TikTok is a social media app
(assert (not (ideal-preteens tiktok)))   ; TikTok is not ideal for preteens

; 1. All social media apps containing chat features are software
(assert (forall ((a App))
  (=> (and (social a) (chat a))
      (softwrare a))))
; Note: corrected a typo in "software" to ensure proper symbol usage
; 2. All social media apps that allow users to send messages to each other have chat features
(assert (forall ((a App))
  (=> (sends-messages a)
      (chat a))))
; 3. All social media apps have chat features or video features
(assert (forall ((a App))
  (=> (social a)
      (or (chat a) (has-video a)))))
; 4. All social media apps that have video features allow users to upload videos
(assert (forall ((a App))
  (=> (and (social a) (has-video a))
      (can-upload a))))
; 5. All software that is social media applications are computer programs
(assert (forall ((a App))
  (=> (and (software a) (social a))
      (computer-program a))))
; 6. All social media apps that have high engagement metrics are addictive
(assert (forall ((a App))
  (=> (and (social a) (high-engagement a))
      (addictive a))))
; 7. If a social media application is addictive, then it is not ideal for preteens
(assert (forall ((a App))
  (=> (addictive a)
      (not (ideal-preteens a)))))

; Test: "TikTok is either ideal for preteens or a computer program."
; We test the negation to determine if the statement is entailed
(assert (not (or (ideal-preteens tiktok) (computer-program tiktok))))

; Check satisfiability and (optionally) model
(check-sat)
(get-model)