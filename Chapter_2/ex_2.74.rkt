#lang planet neil/sicp

(define (get-record division employee)
  ((get division 'record) employee))

(define (get-salary division employee)
  ((get division 'salary) employee))

(define (find-employee-record employee divisions)
  (cond ((null? divisions) '())
        (else
         (if (record-exists? (car divisions))
             (get-record (car divisions) employee)
             (find-employee-record (cdr divisions) employee)))))


