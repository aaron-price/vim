(ns lib.components.tabber
  (:require
    [lib.helpers.itr :refer [itri]]
    [reagent.core :as r]))

;;;;;;;;;;
;;VIEW
;;;;;;;;;;
(defn tab [i component]
  [(get-el i) (get-attrs i) (str "Option " i)])


(defn tabber 
  ([tabs] (tabber tabs {}))
  ([tabs _opts]
    (let [
      body (nth tabs (@state :open))
    ]
    [:div.paper.p0.m0
      [:div.fc.fs-a.p0.m0 
       (itri
        tab
        tabs)]
      [:div.paper.m0 [body]] ])))

;;;;;;;;;;
;;LOGIC
;;;;;;;;;;
(defn select-tab [i] (reset! state {:open i}))
(defn active? [i] (= i (@state :open)))


;;;; Attribute plugs ;;;;
(defn add-on-click [acc i] (assoc acc :on-click #(select-tab i)))


(defn add-disabled [acc i]
  (if (active? i)
    (assoc acc :disabled true)
    acc))


(defn get-attrs [i]
  (-> {}
      (add-on-click i)
      (add-disabled i)))

;;;;; Css Class plugs ;;;;
(defn add-bg [i] (if (active? i) ".btn-selected" ".btn-selectable"))

(defn get-el [i]
  (keyword (str "div.paper.sw1.c-white.m0" (add-bg i))))


