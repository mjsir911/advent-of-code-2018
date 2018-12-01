(define (sublist l start stop)
	(vector->list (subvector (list->vector l) start stop)))

(define (reduce f l #!optional (v 0))
	(f (list-ref l (- (length l) 1))
		(if (eq? (length l) 1)
			v
			(reduce f (sublist l 0 (- (length l) 1)) v))))

(define (sum l)
	(reduce + l))

(print (sum (map string->number (call-with-input-file "input" (lambda (p) (read-all p read-line))))))
