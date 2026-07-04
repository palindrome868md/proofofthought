;--- 1. Sort -------------------------------------------------
(declare-sort Entity 0)

;--- 2. Predicates -------------------------------------------
(declare-fun SocialMediaApp (Entity) Bool)
(declare-fun ChatFeature      (Entity) Bool)
(declare-fun VideoFeature     (Entity) Bool)
(declare-fun AllowsSendMsg    (Entity) Bool)
(declare-fun AllowsUploadVid  (Entity) Bool)
(declare-fun Software         (Entity) Bool)
(declare-fun ComputerProgram  (Entity) Bool)
(declare-fun HighEngagement   (Entity) Bool)
(declare-fun Addictive        (Entity) Bool)
(declare-fun IdealForPreteens (Entity) Bool)

;--- 3. Constant ---------------------------------------------
(declare-const TikTok Entity)

;--- 4. Premises ---------------------------------------------
; All social media applications containing chat features are software.
(assert (forall ((x Entity))
  (=> (and (SocialMediaApp x) (ChatFeature x))
      (Software x))))

; All social media applications that allow users to send messages have chat features.
(assert (forall ((x Entity))
  (=> (and (SocialMediaApp x) (AllowsSendMsg x))
      (ChatFeature x))))

; All social media applications have chat features or video features.
(assert (forall ((x Entity))
  (=> (SocialMediaApp x)
      (or (ChatFeature x) (VideoFeature x)))))

; All social media applications that have video features allow users to upload videos.
(assert (forall ((x Entity))
  (=> (and (SocialMediaApp x) (VideoFeature x))
      (AllowsUploadVid x))))

; All software that is social media applications are computer programs.
(assert (forall ((x Entity))
  (=> (and (Software x) (SocialMediaApp x))
      (ComputerProgram x))))

; All social media applications that have high engagement metrics are addictive.
(assert (forall ((x Entity))
  (=> (and (SocialMediaApp x) (HighEngagement x))
      (Addictive x))))

; If a social media application is addictive, then it is not ideal for preteens.
(assert (forall ((x Entity))
  (=> (Addictive x)
      (not (IdealForPreteens x)))))

; TikTok is a social media application, and it is not ideal for preteens.
(assert (SocialMediaApp TikTok))
(assert (not (IdealForPreteens TikTok)))

;--- 5. Test the NEGATION of the statement --------------------
; Negation: TikTok has chat features AND TikTok is a computer program.
(assert (ChatFeature TikTok))
(assert (ComputerProgram TikTok))

;--- 6. Check satisfiability ---------------------------------
(check-sat)
(get-model)