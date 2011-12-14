#lang planet neil/sicp

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (count-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))

(define (flatten l)
  (display l)
  (newline)
  (cond ((null? l) nil)
        ((not (pair? (car l))) (append (list (car l)) (flatten (cdr l))))
        (else (append (flatten (car l)) (flatten (cdr l))))))

(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

;use flatten and length helper functions
(define (count-leaves-mod t)
  (accumulate (lambda (x y) (+ (length x) y 0)) 0 (map flatten t)))

(count-leaves-mod (list (list 1 2) (list 3 (list 5 4))))
