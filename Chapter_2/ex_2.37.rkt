#lang planet neil/sicp

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(dot-product (list 1 2) (list 3 4))

;(display (map * (list 1 2) (list 3 4)))

(define (matrix-*-vector m v)
  (map (lambda (m) (dot-product m v)) m))

;(display (matrix-*-vector (list (list 1 1 1) (list 2 2 2) (list 3 3 3)) (list 1 2 3)))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(define (transpose mat)
  (accumulate-n cons nil mat))

;(display (transpose (list (list 1 1 1) (list 2 2 2) (list 3 3 3))))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (m) (matrix-*-vector cols m))  m)))

(display (matrix-*-matrix (list (list 1 1 1) (list 2 2 2) (list 3 3 3)) (list (list 1 1 1) (list 2 2 2) (list 3 3 3))))