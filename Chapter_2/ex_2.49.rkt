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

(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

;selectors for the above

(define (get-origin frame)
  (car frame))

(define (get-edge1 frame)
  (car (cdr frame)))

(define (get-edge2 frame)
  (car (cdr (cdr frame))))

;new stuff below

(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
     (lambda (segment)
       (draw-line
        ((frame-coord-map frame) (start-segment segment))
        ((frame-coord-map frame) (end-segment segment))))
     segment-list)))

;a. draws an outline of the frame

(define (draw-outline frame)
  (let ((segment-list) (list (make-segment (get-origin frame) (get-edge1 frame)) (make-segment (get-origin frame) (get-edge2 frame))))
    (segments->painter segment-list)))

