; Declare the uninterpreted sort for applications
(declare-sort App 0)

; Unary predicates (functions returning Bool)
(declare-fun SocialMediaApp (App) Bool)
(declare-fun ChatFeature (App) Bool)
(declare-fun VideoFeature (App) Bool)
(declare-fun AllowsSendMessages (App) Bool)
(declare-fun AllowsUploadVideos (App) Bool)
(declare-fun Software (App) Bool)
(declare-fun ComputerProgram (App) Bool)
(declare-fun HighEngagement (App) Bool)
(declare-fun Addictive (App) Bool)
(declare-fun IdealForPreteens (App) Bool)

; Constant representing TikTok
(declare-const TikTok App)

; Premises

; 1. All social media applications containing chat features are software.
(assert (forall ((x App))
  (=> (and (SocialMediaApp x) (ChatFeature x))
      (Software x))))

; 2. All social media applications that allow users to send messages to each other have chat features.
(assert (forall ((x App))
  (=> (and (SocialMediaApp x) (AllowsSendMessages x))
      (ChatFeature x))))

; 3. All social media applications have chat features or video features.
(assert (forall ((x App))
  (=> (SocialMediaApp x)
      (or (ChatFeature x) (VideoFeature x)))))

; 4. All social media applications that have video features allow users to upload videos.
(assert (forall ((x App))
  (=> (and (SocialMediaApp x) (VideoFeature x))
      (AllowsUploadVideos x))))

; 5. All software that is social media applications are computer programs.
(assert (forall ((x App))
  (=> (and (Software x) (SocialMediaApp x))
      (ComputerProgram x))))

; 6. All social media applications that have high engagement metrics are addictive.
(assert (forall ((x App))
  (=> (and (SocialMediaApp x) (HighEngagement x))
      (Addictive x))))

; 7. If a social media application is addictive, then it is not ideal for preteens.
(assert (forall ((x App))
  (=> (and (SocialMediaApp x) (Addictive x))
      (not (IdealForPreteens x)))))

; 8. TikTok is a social media application, and it is not ideal for preteens.
(assert (SocialMediaApp TikTok))
(assert (not (IdealForPreteens TikTok)))

; ----- Test the statement -----
; Statement: TikTok is a computer program.
(assert (ComputerProgram TikTok))

; Check whether the statement can hold given the premises
(check-sat)
(get-model)