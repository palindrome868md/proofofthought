(declare-sort App 0)

; Predicates
(declare-fun social-media (App) Bool)
(declare-fun has-chat (App) Bool)
(declare-fun has-video (App) Bool)
(declare-fun allows-messages (App) Bool)
(declare-fun software (App) Bool)
(declare-fun can-upload-videos (App) Bool)
(declare-fun computer-program (App) Bool)
(declare-fun high-engagement (App) Bool)
(declare-fun addictive (App) Bool)
(declare-fun ideal-for-preteens (App) Bool)

; Constants
(declare-const TikTok App)

; Premises
(assert (social-media TikTok))

; 1. All social media applications containing chat features are software.
(assert (forall ((a App))
  (=> (and (social-media a) (has-chat a))
      (software a))))

; 2. All social media applications that allow users to send messages to each other have chat features.
(assert (forall ((a App))
  (=> (and (social-media a) (allows-messages a))
      (has-chat a))))

; 3. All social media applications have chat features or video features.
(assert (forall ((a App))
  (=> (social-media a)
      (or (has-chat a) (has-video a)))))

; 4. All social media applications that have video features allow users to upload videos.
(assert (forall ((a App))
  (=> (and (social-media a) (has-video a))
      (can-upload-videos a))))

; 5. All software that is social media applications are computer programs.
(assert (forall ((a App))
  (=> (and (software a) (social-media a))
      (computer-program a))))

; 6. All social media applications that have high engagement metrics are addictive.
(assert (forall ((a App))
  (=> (high-engagement a)
      (addictive a))))

; 7. If a social media application is addictive, then it is not ideal for preteens.
(assert (forall ((a App))
  (=> (addictive a)
      (not (ideal-for-preteens a)))))

; 8. TikTok is a social media application. (asserted above)
; 9. TikTok is not ideal for preteens.
(assert (not (ideal-for-preteens TikTok)))

; Test: Is TikTok a computer program? (test the negation to determine entailment)
(assert (not (computer-program TikTok)))

; Check satisfiability
(check-sat)