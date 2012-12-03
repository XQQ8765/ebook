(bind ?grocery-list (create$ peas beans butter milk))

(defadvice before nth$
          ;; Strip off the function name
		  (printout t "?argv is: " ?argv crlf)
          (bind ?tail (rest$ ?argv))
		  (printout t "?tail is: " ?tail crlf)
          ;; Convert zero-based to one-based index
          (bind ?index (+ 1 (nth$ 1 ?tail)))
		  (printout t "?index is: " ?index crlf)
          ;; Put the argument list back together.
          (bind ?argv (create$ nth$ ?index (rest$ ?tail)))
		  (printout t "?argv is: " ?argv crlf)
)

(nth$ 1 ?grocery-list)

; Output is:
; ?argv is: (nth$ 1 ?grocery-list)
; ?tail is: (1 (peas beans butter milk))
; ?index is: 2
; ?argv is: (nth$ 2 (peas beans butter milk))
; beans

