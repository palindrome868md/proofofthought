; Question: Is Menthol associated with Thanksgiving?
; This tests whether there is a meaningful association between menthol and Thanksgiving

; Declare sorts
(declare-sort Item 0)
(declare-sort Category 0)

; Declare functions
(declare-fun in-category (Item Category) Bool)
(declare-fun associated-with (Item Item) Bool)
(declare-fun same-category (Category Category) Bool)

; Declare constants - Items
(declare-const menthol Item)
(declare-const thanksgiving Item)
(declare-const cigarettes Item)
(declare-const candy Item)
(declare-const turkey Item)
(declare-const pumpkin-pie Item)
(declare-const family-gathering Item)

; Declare constants - Categories
(declare-const tobacco-product Category)
(declare-const flavoring Category)
(declare-const holiday Category)
(declare-const food Category)
(declare-const tradition Category)

; Knowledge Base: Menthol associations
(assert (in-category menthol tobacco-product))
(assert (in-category menthol flavoring))
(assert (associated-with menthol cigarettes))
(assert (associated-with menthol candy))

; Knowledge Base: Thanksgiving associations
(assert (in-category thanksgiving holiday))
(assert (in-category thanksgiving tradition))
(assert (associated-with thanksgiving turkey))
(assert (associated-with thanksgiving pumpkin-pie))
(assert (associated-with thanksgiving family-gathering))

; Rule: Items are associated if they share a category
(assert (forall ((x Item) (y Item) (c Category))
  (=> (and (in-category x c) (in-category y c))
      (associated-with x y))))

; Rule: Tobacco products and holidays are different categories
(assert (not (same-category tobacco-product holiday)))
(assert (not (same-category tobacco-product tradition)))
(assert (not (same-category flavoring holiday)))
(assert (not (same-category flavoring tradition)))

; Knowledge Base: Menthol is NOT associated with Thanksgiving
(assert (not (associated-with menthol thanksgiving)))

; Test: Is Menthol associated with Thanksgiving?
(assert (associated-with menthol thanksgiving))

; Check satisfiability
(check-sat)
(get-model)