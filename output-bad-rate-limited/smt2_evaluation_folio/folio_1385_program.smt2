; Sorts
(declare-sort App 0)

; Predicates
(declare-fun SocialMediaApp (App) Bool)
(declare-fun hasChatFeatures (App) Bool)
(declare-fun hasVideoFeatures (App) Bool)
(declare-fun allowsMessages (App) Bool)
(declare-fun isSoftware (App) Bool)
(declare-fun computerProgram (App) Bool)
(declare-fun canUploadVideos (App) Bool)
(declare-fun highEngagement (App) Bool)
(declare-fun addictive (App) Bool)
(declare-fun idealForPreteens (App) Bool)

; Constants
(declare-const tiktok App)

; Facts
(assert (SocialMediaApp tiktok))

; Rules (Knowledge Base)

; 1. All social media apps containing chat features are software.
(assert
 (forall ((a App))
  (=> (SocialMediaApp a)
      (=> (hasChatFeatures a)
          (isSoftware a)))))

; 2. All social media apps that allow users to send messages have chat features.
(assert
 (forall ((a App))
  (=> (SocialMediaApp a)
      (=> (allowsMessages a)
          (hasChatFeatures a)))))

; 3. All social media apps have chat features or video features.
(assert
 (forall ((a App))
  (=> (SocialMediaApp a)
      (or (hasChatFeatures a) (hasVideoFeatures a)))))

; 4. All social media apps with video features allow users to upload videos.
(assert
 (forall ((a App))
  (=> (SocialMediaApp a)
      (=> (hasVideoFeatures a)
          (canUploadVideos a)))))

; 5. All software that is social media applications are computer programs.
(assert
 (forall ((a App))
  (=> (and (isSoftware a) (SocialMediaApp a))
      (computerProgram a))))

; 6. All social media apps with high engagement metrics are addictive.
(assert
 (forall ((a App))
  (=> (SocialMediaApp a)
      (=> (highEngagement a)
          (addictive a)))))

; 7. If a social media application is addictive, then it is not ideal for preteens.
(assert
 (forall ((a App))
  (=> (addictive a)
      (not (idealForPreteens a)))))

; 8. TikTok is a social media application, and it is not ideal for preteens.
(assert (not (idealForPreteens tiktok)))

; Test: Is TikTok a computer program?
; Assert the negation to verify consistency with the knowledge base
(assert (not (computerProgram tiktok)))
(check-sat)
(get-model)