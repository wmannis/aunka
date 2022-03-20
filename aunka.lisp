;;; Calculate the Aunka day cycle for Kílta.

(in-package :aunka)

(defvar +aunka+
  '(:kolkol :immira :nurës :kokwara :aunka))

(defvar +kiva+
  '(:rin :ussala :itar))

(defvar +tun+
  '(:lastun :anlastun :tillastun :vallastun :lólastun :nirsattun :sattun))


;;; The start of the cycle is September 5, 2001.
(defun aunka (&optional now)
  (let ((now (if now now (get-universal-time))))
    (multiple-value-bind (s m h date month year day) (decode-universal-time now)
      (declare (ignorable date month year))
      (let* ((epoch (encode-universal-time s m h 5 9 2001))
             (diffdays (/ (- now epoch) (* 24 60 60))))
        (list (nth (mod diffdays 5) +aunka+)
              (nth (mod diffdays 3) +kiva+)
              (nth day +tun+))))))

(defun aunka-string (&optional (aunka nil))
  (if aunka
      (format nil "~:(~{~A~^ ~}~)" aunka)
      (format nil "~:(~{~A~^ ~}~)" (aunka))))
