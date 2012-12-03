(deffunction ask-user (?question)
	"Ask a question, and return the answer"
	(printout t ?question " ")
	(return (read))
)

(deffunction is-of-type (?type ?answer)
	"Check that the answer has the right form"
	(if (eq ?type yes-no) then
		(return (or (eq ?answer yes) (eq ?answer no)))
	else
		(if (eq ?type "number") then
			(printout t "type:" ?type ",number:" ?number)
			(return (numberp ?answer))
		else
		(return (> (str-length ?answer) 0)))
	)
)

;(deffunction is-of-type (?answer ?type)
;    "Check that the answer has the right form"
;    (if (eq ?type yes-no) then
;      (return (or (eq ?answer yes) (eq ?answer no))))
;    else if (eq ?type number) then
;           return (numberp ?answer)
;         else ;(return (> (str-length ?answer) 0))
;           (return 2)
;    ;if (eq ?type number) then
;    ;       (return (numberp ?answer))
;    ;     else (return (> (str-length ?answer) 0))
;)

(deffunction is-number (?v)
	return (numberp ?v)
)
