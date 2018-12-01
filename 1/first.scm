(define (reduce f l #!optional (v 0))
	(define (normalize-list l?)
		(if (list? l?)
			l?
			(list l?)))

	(normalize-list (if (null? l) v
		(apply f (car l) (reduce f (cdr l) v)))))

(define (sum l)
	(reduce + l))


(define (wrapper l #!optional (args 0))
	(reverse (car (reverse (reduce (lambda (a b #!optional (c '())) (list (+ a b) (cons (+ a b) c))) (reverse l) args)))))


(define l (map string->number (call-with-input-file "input" (lambda (p) (read-all p read-line)))))

(define (members l2 l)
	(if (null? l2)
		#f
		(if (member (car l2) l)
			(car l2)
			(members (cdr l2) l))))

(define (test2 l #!optional (acc '(0)))
	(let ((new (wrapper l (car (reverse acc)))))
		(if (members new acc) 
			(members new acc)
			(test2 l (append acc (wrapper l (car (reverse acc))))))))

(println (test2 l))
