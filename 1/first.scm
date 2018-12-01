(define (sum l)
	(apply + l))

(print (sum (map string->number (call-with-input-file "input" (lambda (p) (read-all p read-line))))))
