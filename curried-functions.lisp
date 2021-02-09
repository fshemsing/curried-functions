;;; capply: applies a curried function to a list of
;;;   arguments
(defun capply (f &rest arglist)
  (reduce #'funcall arglist :initial-value f))

;;; flip: given a curried function of two arguments,
;;;   produces a new curried function that takes its
;;;   arguments in the opposite order
(cdefun flip (f x y)
	(capply f y x))
