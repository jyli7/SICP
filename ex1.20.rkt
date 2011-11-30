;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1.20) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;Normal v. Applicative Order

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(gcd 206 40)

;Normal order: Does normal order work this way? If so, how do we know when to stop?

(gcd 40 (remainder 206 40))
(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
(gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) ((remainder 40 (remainder 206 40)))))
(gcd (remainder (remainder 206 40) ((remainder 40 (remainder 206 40)))) 
     (remainder ((remainder 40 (remainder 206 40))) ((remainder (remainder 206 40) ((remainder 40 (remainder 206 40)))))))

;Applicative order:
(gcd 40 (remainder 206 40))
(gcd 40 6)
(gcd 6 (remainder 40 6))
(gcd 6 4)
(gcd 4 (remainder 6 4))
(gcd 4 2)
(gcd 2 (remainder 4 2))
(gcd 2 0)
2