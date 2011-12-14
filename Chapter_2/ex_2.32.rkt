#lang planet neil/sicp

;The following method (which I filled in) generates a set of all the subsets of a set. How?

(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x) (cons (car s) x)) rest)))))

(display (subsets (list 1 2 3)))

;This procedure is like the count-coins procedure. 
;It appends "All the subsets of cdr s" to "All the subsets that involve 'car s' cons to all the subsets of 'cdr s'".
;This is exhaustive: The subsets of s = Subsets of s that include car s + Subsets of s that do not include car s.