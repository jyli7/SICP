#lang planet neil/sicp

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (unique-triples n)
  (flatmap
   (lambda (i)
     (flatmap (lambda (j)
       (map (lambda (k) (list i j k))
            (enumerate-interval 1 (- j 1))))
       (enumerate-interval 1 (- i 1))))
   (enumerate-interval 1 n)))

;(display (unique-triples 6))

(define (triple-sum n s)
  (define (s-sum? l)
    (if (= s (+ (car l) (car (cdr l)) (car (cdr (cdr l)))))
        #t
        #f))
  (filter s-sum? (unique-triples n)))

(display (triple-sum 12 14))