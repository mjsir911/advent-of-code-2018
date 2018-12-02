(define (reduce f l #!optional (v 0))
	(define (normalize-list l?)
		(if (list? l?)
			l?
			(list l?)))

	(normalize-list (if (null? l) v
		(apply f (car l) (reduce f (cdr l) v)))))

(define (part1 l)
	(reduce + l))


(define (wrapper l #!optional (args 0))
	(reverse (car (reverse (reduce (lambda (a b #!optional (c '())) (list (+ a b) (cons (+ a b) c))) (reverse l) args)))))


(define (set-member? k t)
	(table-ref t k #f))

(define (set-add! t k)
	(table-set! t k #t))

(define (set-adds! t l)
	(if (null? l)
		t
		(let ()
			(set-add! t (car l))
			(set-adds! t (cdr l)))))

(define (set-members? l2 l)
	(if (null? l2)
		#f
		(if (set-member? (car l2) l)
			(car l2)
			(set-members? (cdr l2) l))))

(define (part2 l #!optional (acc (make-table)) (last 0))
	(let ((new (wrapper l last)))
		(if (set-members? new acc) 
			(set-members? new acc)
			(let ()
				(part2 l (set-adds! acc new) (car (reverse new)))))))

(call-with-input-file "input" (lambda (file)
	(let ((l (map string->number (read-all file read-line))))
		(println (part1 l))
		(println (part2 l)))))
