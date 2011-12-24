#lang planet neil/sicp

;make a "make-monitored" procedure

(define (make-monitored f)
  (let ((count 0))
    (define (mf arg)
      (cond ((eq? arg 'how-many-calls?) count)
            ((eq? arg 'reset-count) (set! count 0) count)
            (else (set! count (+ count 1))
                         (f arg))))
    mf))

(define s (make-monitored sqrt))

(s 100)
(s 'how-many-calls?)
(s 36)
(s 'how-many-calls?)
(s 'reset-count)
(s 'how-many-calls?)
   
           


         