#lang planet neil/sicp

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess counter)
    (let ((next (f guess)))
      ;print out each try
      (display next)
      (newline)
      ;print each the try count
      (display counter)
      (newline)
      (if (close-enough? guess next)
          next
          (try next (+ counter 1)))))
  (try first-guess 0))

;without average damping: 36 tries
(fixed-point (lambda (x) (/ (log 1000) (log x)))
             1.1)

;with average damping: 12 tries
(fixed-point (lambda (x) (/ (+ x (/ (log 1000) (log x))) 2))
             1.1)
