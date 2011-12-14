#lang planet neil/sicp

;Exercise 2.33. Fill in the missing expressions to complete the following definitions of some basic listmanipulation
;operations as accumulations:

;(define (map p sequence)
;  (accumulate (lambda (x y) <??>) nil sequence))
;
;(define (append seq1 seq2)
;  (accumulate cons <??> <??>))
;
;(define (length sequence)
;  (accumulate <??> 0 sequence))(map (lambda (x) (* x x)) (list 1 2 3))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) nil sequence))

;(map (lambda (x) (* x x)) (list 1 2 3))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

;(display (append (list 1 2) (list 3 4)))

(define (length sequence)
  (accumulate 
   (lambda (x y) (+ 1 (* y))) 
   0 sequence))

(length (list -1 0 1 2 3))
