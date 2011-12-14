#lang planet neil/sicp

(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

;selectors for the above

(define (get-origin frame)
  (car frame))

(define (get-edge1 frame)
  (car (cdr frame)))

(define (get-edge2 frame)
  (car (cdr (cdr frame))))

;----

(define (make-frame origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

;selectors for the above

(define (get-origin frame)
  (car frame))

(define (get-edge1 frame)
  (car (cdr frame)))

(define (get-edge2 frame)
  (cdr (cdr frame)))
