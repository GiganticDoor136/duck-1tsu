(defun handle-wfu (chat-id username)
    (let ((user-id (get-user-id username))) 
    (if user-id
        (progn
          (send-message chat-id (format nil "~A got a wfu" username))
          )
        (send-message chat-id "No such username was found"))))


(defun handle-mute (chat-id time username)
    (let ((user-id (get-user-id username))) 
    (if user-id
        (progn
          (send-message chat-id (format nil "~A got a mute on ~A min." username time))
          )
        (send-message chat-id "No such username found"))))

(defun handle-kick (chat-id username)
    (let ((user-id (get-user-id username))) 
    (if user-id
        (progn
          (send-message chat-id (format nil "The ~A has been kicked" username))
          )
        (send-message chat-id "No such username found"))))

(defun add-admin (chat-id username)
    (let ((user-id (get-user-id username))) 
    (if user-id
        (progn
          (send-message chat-id (format nil "The ~A is now an admin(S class)" username))
          )
        (send-message chat-id "No such username found"))))

(defun del-admin (chat-id username)
    (let ((user-id (get-user-id username))) 
    (if user-id
        (progn
          (send-message chat-id (format nil "The ~A is no longer an admin" username))
          )
        (send-message chat-id "No such username found"))))

(defvar *wfa-tt* 5) 
(defvar *wfu-tt* 5) 
(defvar *s-mute-time* 10) 
(defvar *time-zone* "Asia/Tokyo") 
(defvar *language* "English") 


(defun get-user-id (username)
  nil)