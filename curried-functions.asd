(defpackage #:curried-functions-asd
  (:use :cl :asdf))

(defsystem curried-functions
    :name "curried-functions"
    :version "0.0.0"
    :maintainer "Frank Hemsing"
    :description "construct and manipulate curried functions"
    :long-description "construct and manipulate curried functions"
    :components ((:file "macros")
		 (:file "curried-functions"
			:depends-on ("macros"))))
