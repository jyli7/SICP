#lang planet neil/sicp

(define (make-segment start-point end-point)
  (cons start-point end-point))

(define (start-segment seg)
  (car seg))

(define (end-segment seg)
  (cdr seg))

(define (make-point x y) (cons x y))

(define (x-point p) (car p))

(define (y-point p) (cdr p))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

;rectangle stuff proper begins here

(define (make-rect tl tr bl br)
  (cons tl (cons tr (cons bl br))))

(define (tl rect)
  (car rect))

(define (tr rect)
  (car (cdr rect)))

(define (bl rect)
  (car (cdr (cdr rect))))

(define (br rect)
  (cdr (cdr (cdr rect))))

;testing
(tl (make-rect (make-point 1 5) (make-point 4 5) (make-point 1 1) (make-point 4 1)))
(tr (make-rect (make-point 1 5) (make-point 4 5) (make-point 1 1) (make-point 4 1)))
(bl (make-rect (make-point 1 5) (make-point 4 5) (make-point 1 1) (make-point 4 1)))
(br (make-rect (make-point 1 5) (make-point 4 5) (make-point 1 1) (make-point 4 1)))

(define (distance-segment seg)
  (+ (- (x-point (end-segment seg)) (x-point (start-segment seg)))
     (- (y-point (end-segment seg)) (y-point (start-segment seg)))))

(define (perim rect)
  (+ (distance-segment (make-segment (tl rect) (tr rect)))
     (distance-segment (make-segment (br rect) (tr rect)))
     (distance-segment (make-segment (bl rect) (br rect)))
     (distance-segment (make-segment (bl rect) (tl rect)))))

(perim (make-rect (make-point 1 5) (make-point 4 5) (make-point 1 1) (make-point 4 1)))

(define (area rect)
  (* (distance-segment (make-segment (tl rect) (tr rect)))
     (distance-segment (make-segment (br rect) (tr rect)))))

(area (make-rect (make-point 1 5) (make-point 4 5) (make-point 1 1) (make-point 4 1)))

;can design with abstraction barriers. suppose rectangle was implemented with different ordering of points. change selector methods,
;and area and perim will still work. 