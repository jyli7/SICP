#lang planet neil/sicp

(define x 
  (list (list 1 2) (list 3 4)))

(define (reverse l)
  (if (null? (cdr l))
      (list (car l) )
      (append (reverse (cdr l)) (list (car l)))))

;tests
;(display (reverse x))
;(display (reverse (list 1 2 3)))
;(newline)

;deep reverse

;helper function
(define (has-no-lists? l)
    (cond ((null? (cdr l)) #t)
          ((list? (car l)) #f)
          (else (has-no-lists? (cdr l)))))

(define (deep-reverse l)
  (display l)
  (newline)
  (cond ((null? l) nil)
        ((not (pair? (car l))) (append (deep-reverse (cdr l)) (list (car l))))
        (else (append (deep-reverse (cdr l)) (list (deep-reverse (car l)))))))

(display (deep-reverse (list (list 1 2) (list 3 4))))