#lang planet neil/sicp

(define (make-vect x y)
  (cons x y))

(define (xcor-vect vect)
  (car vect))

(define (ycor-vect vect)
  (cdr vect))

(define (add-vect v1 v2)
  (cons (+ (xcor-vect v1) (xcor-vect v2))
        (+ (ycor-vect v1) (ycor-vect v2))))

(define (sub-vect v1 v2)
  (cons (- (xcor-vect v1) (xcor-vect v2))
        (- (ycor-vect v1) (ycor-vect v2))))

(define (scale-vect v s)
  (cons (* s (xcor-vect v))
        (* s (ycor-vect v))))

(define (make-segment v-start v-end)
  (cons v-start v-end))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))