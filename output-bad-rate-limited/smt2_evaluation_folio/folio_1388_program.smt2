; Declare sorts
(declare-sort App 0)

; Declare predicates/functions
(declare-fun social_media (App) Bool)
(declare-fun chat (App) Bool)
(declare-fun video (App) Bool)
(declare-fun can_send_messages (App) Bool)
(declare-fun software (App) Bool)
(declare-fun computer_program (App) Bool)
(declare-fun upload_videos (App) Bool)
(declare-fun high_engagement (App) Bool)
(declare-fun addictive (App) Bool)
(declare-fun not_ideal_preteens (App) Bool)

; Declare constants
(declare-const tiktok App)

; Given facts
(assert (social_media tiktok))
(assert (not_ideal_preteens tiktok))

; Premises
; 1. All social media apps containing chat features are software
(assert (forall ((a App))
  (=> (and (social_media a) (chat a))
      (software a))))
; 2. All social media apps that allow users to send messages have chat features
(assert (forall ((a App))
  (=> (and (social_media a) (can_send_messages a))
      (chat a))))
; 3. All social media apps have chat features or video features
(assert (forall ((a App))
  (=> (social_media a)
      (or (chat a) (video a)))))
; 4. All social media apps with video features allow uploading videos
(assert (forall ((a App))
  (=> (video a)
      (upload_videos a))))
; 5. All software that is social media apps are computer programs
(assert (forall ((a App))
  (=> (and (software a) (social_media a))
      (computer_program a))))
; 6. All social media apps with high engagement are addictive
(assert (forall ((a App))
  (=> (high_engagement a)
      (addictive a))))
; 7. If addicted, then not ideal for preteens
(assert (forall ((a App))
  (=> (addictive a)
      (not_ideal_preteens a))))

; Test scenario: Statement to verify
; Test: TikTok either has chat features or is a computer program
(assert (or (chat tiktok) (computer_program tiktok)))

; Check satisfiability and provide a model
(check-sat)
(get-model)