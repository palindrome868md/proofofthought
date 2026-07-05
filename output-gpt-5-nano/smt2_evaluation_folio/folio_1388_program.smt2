; Declare sorts
(declare-sort App 0)

; Predicates
(declare-fun SocialMedia (App) Bool)
(declare-fun ChatFeatures (App) Bool)
(declare-fun VideoFeatures (App) Bool)
(declare-fun AllowsMessages (App) Bool)
(declare-fun Software (App) Bool)
(declare-fun ComputerProgram (App) Bool)
(declare-fun UploadsVideos (App) Bool)
(declare-fun HighEngagement (App) Bool)
(declare-fun Addictive (App) Bool)
(declare-fun NotIdealForPreteen (App) Bool)

; Constant for TikTok
(declare-const tiktok App)

; Knowledge base (premises)

; 1. All social media applications containing chat features are software.
(assert (forall ((a App))
  (=> (and (SocialMedia a) (ChatFeatures a))
      (Software a))))

; 2. All social media applications that allow users to send messages to each other have chat features.
(assert (forall ((a App))
  (=> (and (SocialMedia a) (AllowsMessages a))
      (ChatFeatures a))))

; 3. All social media applications have chat features or video features.
(assert (forall ((a App))
  (=> (SocialMedia a)
      (or (ChatFeatures a) (VideoFeatures a)))))

; 4. All social media applications that have video features allow users to upload videos.
(assert (forall ((a App))
  (=> (and (SocialMedia a) (VideoFeatures a))
      (UploadsVideos a))))

; 5. All software that is social media applications are computer programs.
(assert (forall ((a App))
  (=> (and (Software a) (SocialMedia a))
      (ComputerProgram a))))

; 6. All social media applications that have high engagement metrics are addictive.
(assert (forall ((a App))
  (=> (and (SocialMedia a) (HighEngagement a))
      (Addictive a))))

; 7. If a social media application is addictive, then it is not ideal for preteens.
(assert (forall ((a App))
  (=> (and (SocialMedia a) (Addictive a))
      (NotIdealForPreteen a))))

; 8. TikTok is a social media application, and it is not ideal for preteens.
(assert (SocialMedia tiktok))
(assert (NotIdealForPreteen tiktok))

; Test: Statement to verify
; "TikTok either has chat features or is a computer program."
(assert (or (ChatFeatures tiktok) (ComputerProgram tiktok)))

; Check satisfiability and obtain a model
(check-sat)
(get-model)