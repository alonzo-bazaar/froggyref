(defun 
(reduce (lambda (x y) (merge-pathnames y x)) '("hello" "darkness" "my")
        :initial-value (uiop:getcwd))
