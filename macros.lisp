;;; nested-lambdas: produce a sequence of nested lambdas
;;;   with the given args, containing the given body at the
;;;   deepset level.
(defun nested-lambdas (args body)
  (if (null args)
      `(lambda () ,@body)
      (let* ((first-arg (car args))
	     (underscore? (eq first-arg '_))
	     (arg (if underscore?
		      (gensym)
		      first-arg)))
	`(lambda (,arg)
	   ,@ (when underscore?
		`((declare (ignore ,arg))))
	   ,@(if (null (cdr args))
		 body
		 (list (nested-lambdas (cdr args) body)))))))

;;; clambda: specify an anonymous curried function
(defmacro clambda ((&rest args) &rest body)
  (nested-lambdas args body))

;;; cdefun: define a curried function
(defmacro cdefun (name (&rest args) &rest body)
  `(defun ,name (,(car args))
     ,(caddr (nested-lambdas args body))))

