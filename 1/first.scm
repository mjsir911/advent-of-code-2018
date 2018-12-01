(define (reduce f l #!optional (v 0))
	(f (car l)
		(if (eq? (length l) 1)
			v
			(reduce f (cdr l) v))))

(define (sum l)
	(reduce + l))

(print (sum (map string->number (call-with-input-file "input" (lambda (p) (read-all p read-line))))))
