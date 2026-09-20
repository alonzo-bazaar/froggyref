(require "asdf")
(require "uiop")
(defparameter *development-p* t)

;; utility path wrangling thing
(defun from-cwd (&rest path)
  (reduce (lambda (x y) (merge-pathnames y x))
	  path
	  :initial-value (uiop:getcwd)))

;; make asdf deps visible 
;; (we do this before making foreingn deps visible since cffi is an asdf dep
;;  and we need cffi to load foreing deps, so we're doing asdf deps first)
(dolist (dep-dir (mapcar
                  (lambda (dir) (namestring (from-cwd "thirdparty/" dir)))
                  '("alexandria/" "babel_0.5.0/" "trivial-features-1.0/" "cffi_0.24.1/"
                    "arrow-macros/" "cffi-object/"
                    "trivial-garbage-0.21/" "trivial-macroexpand-all/" "cffi-ops/"
                    "global-vars/" "claw-raylib/")))
  (format t "~A ~A~%" dep-dir asdf:*central-registry*)
  (pushnew dep-dir asdf:*central-registry* :test #'equal))

;; make foreign deps visible
;; code readapted from: https://stackoverflow.com/questions/58880772/
(asdf:load-system "cffi")
(dolist (dll-dir (mapcar
		   (lambda (dir) (namestring (from-cwd "thirdparty/" dir "lib/")))
		   '("claw-raylib/" "raylib-5.5_linux_amd64/")))
  (pushnew dll-dir cffi:*foreign-library-directories* :test #'equal))

(asdf:load-system "claw-raylib")

;; now that that's all done, load development deps as well
(when *development-p*
  (dolist (dep-dir (mapcar
                    (lambda (dir) (namestring (from-cwd "thirdparty/" dir)))
                    '("slynk/"))
                   (pushnew dep-dir asdf:*central-registry* :test #'equal)))
  (asdf:load-system "slynk")
  ;; https://joaotavora.github.io/sly/#Setting-up-the-Lisp-image
  (setf slynk:*use-dedicated-output-stream* nil)
  (slynk:create-server :port 1234  :dont-close t))
