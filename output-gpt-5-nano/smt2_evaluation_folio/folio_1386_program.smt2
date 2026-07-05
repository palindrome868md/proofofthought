; Declare sorts
(declare-sort App 0)

; Declare predicates (relations)
(declare-fun IsSocialMedia (App) Bool)
(declare-fun HasChat (App) Bool)
(declare-fun AllowsSendMessages (App) Bool)
(declare-fun HasVideo (App) Bool)
(declare-fun UploadsVideos (App) Bool)
(declare-fun IsSoftware (App) Bool)
(declare-fun IsComputerProgram (App) Bool)
(declare-fun HasHighEngagement (App) Bool)
(declare-fun IsAddictive (App) Bool)
(declare-fun IsIdealForPreteens (App) Bool)

; Declare constants
(declare-const TikTok App)

; Premises
; 8. TikTok is a social media application, and it is not ideal for preteens.
(assert (IsSocialMedia TikTok))
(assert (not (IsIdealForPreteens TikTok)))

; 1. All social media applications containing chat features are software.
(assert (forall ((a App))
  (=> (and (IsSocialMedia a) (HasChat a))
      (IsSoftware a))))

; 2. All social media applications that allow users to send messages to each other have chat features.
(assert (forall ((a App))
  (=> (and (IsSocialMedia a) (AllowsSendMessages a))
      (HasChat a))))

; 3. All social media applications have chat features or video features.
(assert (forall ((a App))
  (=> (IsSocialMedia a)
      (or (HasChat a) (HasVideo a)))))

; 4. All social media applications that have video features allow users to upload videos.
(assert (forall ((a App))
  (=> (and (IsSocialMedia a) (HasVideo a))
      (UploadsVideos a))))

; 5. All software that is social media applications are computer programs.
(assert (forall ((a App))
  (=> (and (IsSoftware a) (IsSocialMedia a))
      (IsComputerProgram a))))

; 6. All social media applications that have high engagement metrics are addictive.
(assert (forall ((a App))
  (=> (and (IsSocialMedia a) (HasHighEngagement a))
      (IsAddictive a))))

; 7. If a social media application is addictive, then it is not ideal for preteens.
(assert (forall ((a App))
  (=> (IsAddictive a)
      (not (IsIdealForPreteens a)))))

; Test: TikTok is either ideal for preteens or a computer program.
(assert (not (or (IsIdealForPreteens TikTok) (IsComputerProgram TikTok))))

; Check satisfiability for the test scenario
(check-sat)