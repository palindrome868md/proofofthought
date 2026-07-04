; Sort
(declare-sort App 0)

; Predicates / relations
(declare-fun SocialMedia (App) Bool)
(declare-fun HasChat (App) Bool)
(declare-fun HasVideo (App) Bool)
(declare-fun AllowsMessages (App) Bool)
(declare-fun Software (App) Bool)
(declare-fun CanUploadVideos (App) Bool)
(declare-fun ComputerProgram (App) Bool)
(declare-fun HighEngagement (App) Bool)
(declare-fun Addictive (App) Bool)
(declare-fun NotIdealForPreteens (App) Bool)

; Constant for TikTok
(declare-const TikTok App)

; Premises (assumed true)
(assert (SocialMedia TikTok))
(assert (NotIdealForPreteens TikTok))

; 1) All social media apps containing chat features are software.
(assert (forall ((a App)) (=> (and (SocialMedia a) (HasChat a)) (Software a))))

; 2) All social media apps that allow messages have chat features.
(assert (forall ((a App)) (=> (and (SocialMedia a) (AllowsMessages a)) (HasChat a))))

; 3) All social media apps have chat features or video features.
(assert (forall ((a App)) (=> (SocialMedia a) (or (HasChat a) (HasVideo a)))))

; 4) Social media apps with video features allow uploading videos.
(assert (forall ((a App)) (=> (and (SocialMedia a) (HasVideo a)) (CanUploadVideos a))))

; 5) All software that are social media apps are computer programs.
(assert (forall ((a App)) (=> (and (Software a) (SocialMedia a)) (ComputerProgram a))))

; 6) Social media apps with high engagement are addictive.
(assert (forall ((a App)) (=> (and (SocialMedia a) (HighEngagement a)) (Addictive a))))

; 7) If a social media app is addictive, then it is not ideal for preteens.
(assert (forall ((a App)) (=> (and (SocialMedia a) (Addictive a)) (NotIdealForPreteens a))))

; 8) TikTok is a social media app, and it is not ideal for preteens.
; (already asserted SocialMedia TikTok) and (NotIdealForPreteens TikTok)

; Test statement: "TikTok does not have chat features or it is not a computer program."
(assert (or (not (HasChat TikTok)) (not (ComputerProgram TikTok))))

; Check satisfiability to determine truth of the statement
(check-sat)
(get-model)