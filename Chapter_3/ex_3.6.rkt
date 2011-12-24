#lang planet neil/sicp

(define random-init 0)

;placeholder function
(define (rand-update x)
  (+ x 1))

(define rand
  (let ((x random-init))
    (define (dispatch message)
      (if (eq? message 'generate)
          (begin (set! x (rand-update x))
                 x)
          (lambda (new-value)
            (set! x new-value))))
    dispatch))

(rand 'generate)
(rand 'generate)