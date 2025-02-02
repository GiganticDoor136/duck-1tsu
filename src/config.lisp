(defpackage :duck-1tsu/config
  (:use :cl)
  (:export *bot-token* *wfa-tt* *wfu-tt* *s-mute-time* *time-zone* *language*
           *admin-user-ids*)) 

(in-package :duck-1tsu/config)

(defvar *bot-token* "type your bot token") 

(defvar *wfa-tt* 5) 
(defvar *wfu-tt* 5) 
(defvar *s-mute-time* 10) 
(defvar *time-zone* "Asia/Tokyo") 
(defvar *language* "English") 

(defvar *admin-user-ids* '(5343967448 5205088109 7191249958 5683369636 1496770533 377953539))  
