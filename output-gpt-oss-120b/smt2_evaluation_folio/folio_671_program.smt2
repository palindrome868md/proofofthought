;--- Sorts -------------------------------------------------
(declare-sort Metric 0)          ; abstract sort for a kind of measurement

;--- Constants --------------------------------------------
(declare-const pvalue Metric)    ; the specific entity “P value”

;--- Predicates --------------------------------------------
(declare-fun isMetricOfEffect (Metric) Bool)   ; true iff the metric measures effect

;--- Knowledge base (premises) ----------------------------
; Premise: P values are thresholds for belief, not metrics of effect.
(assert (not (isMetricOfEffect pvalue)))

;--- Statement to be verified -----------------------------
; Statement: P values don't represent metrics of effect.
(assert (not (isMetricOfEffect pvalue)))

;--- Check consistency ------------------------------------
(check-sat)      ; expect sat → the statement is true given the premises
(get-model)      ; optional: shows a model that satisfies the assertions