; Sorts
(declare-sort App 0)

; Constants
(declare-const tikTok App)

; Predicates
(declare-fun Social (App) Bool)
(declare-fun Chat (App) Bool)
(declare-fun Video (App) Bool)
(declare-fun AllowsMessages (App) Bool)
(declare-fun Software (App) Bool)
(declare-fun ComputerProgram (App) Bool)
(declare-fun HighEngagement (App) Bool)
(declare-fun Addictive (App) Bool)
(declare-fun NotIdealForPreteens (App) Bool)
(declare-fun UploadsVideos (App) Bool)

; Premises
(assert (Social tikTok))
(assert (NotIdealForPreteens tikTok))

; Rules (universal)
(assert (forall ((a App)) (=> (and (Social a) (Chat a)) (Software a))))
(assert (forall ((a App)) (=> (and (Social a) (AllowsMessages a)) (Chat a))))
(assert (forall ((a App)) (=> (Social a) (or (Chat a) (Video a)))))
(assert (forall ((a App)) (=> (and (Social a) (Video a)) (UploadsVideos a))))
(assert (forall ((a App)) (=> (and (Software a) (Social a)) (ComputerProgram a))))
(assert (forall ((a App)) (=> (and (Social a) (HighEngagement a)) (Addictive a))))
(assert (forall ((a App)) (=> (and (Social a) (Addictive a)) (NotIdealForPreteens a))))

; Test question: "TikTok does not have chat features or it is not a computer program."
(assert (or (not (Chat tikTok)) (not (ComputerProgram tikTok))))

(check-sat)
(get-model)