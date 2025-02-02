# Duck-1Tsu

Telegram bot for moderation written in Common Lisp.

## Description

Duck-1Tsu is a feature-rich bot for moderating Telegram groups. It provides a wide set of commands to manage users, customize moderation settings and automate routine tasks.

## Features

* User management: Ban, kick, mut (regular and quick), issue warnings (warns).
* Customize settings: Set the number of warnings to block, quick mut time, time zone and language.
* Admin Management: Add and remove administrators.
* Automation: Automatically apply penalties when a certain number of warnings is reached.
* Information Commands: Get help on commands.

## Commands

* /mod --help or /mod -h: Displays a list of all available commands.
* /mod --set <setting> <value>: Sets the specified setting.
    * --wfa-tt <number>: Number of warnings for an admin before revocation.
    * --wfu-tt <number>: Number of warnings for a user before banning.
    * --s-mute <number>: Time to fast-mute in minutes.
    * --aoulsc-add-admin <@username>: Adds the user to the admin list.
    * --aoulsc-del-admin <@username>: Removes a user from the admin list.
    * --time-zone <hour-zone>: Sets the time zone (e.g. Asia/Tokyo, Europe/London).
    * --lang <language>: Sets the language of the bot (Russian, English, Japanese, Italian).
* /mod --s-mute <@username>: Quickly mut the user.
* /mod --ban <@username>: Ban a user.
* /mod --wfa <@username>: Issue a warning to admin.
* /mod --wfu <@username>: Issue a warning to a user.
* /mod --mute <time> <@username>: Mute a user for a specified time.
* /mod --kick <@username>: Kick the user.

## Installation

1.  Install Common Lisp: It is recommended to use SBCL.
2.  Install Quicklisp: Follow the instructions on the Quicklisp website.
3.  Install dependencies:
   
    (ql:quickload :cl-telegram-bot)
    (ql:quickload :cl-json)
    (ql:quickload :local-time)
    (ql:quickload :split-sequence)
    (ql:quickload :fiveam) ; For tests (optional)
    4.  Clone the repository:
   
    git clone https://github.com/GiganticDoor136/duck-1tsu.git
    5.  Set up the configuration: Edit the config.lisp file, specifying the bot token and admin IDs.
6.  Build the project: Use ASDF to build the project.  See the build.lisp file for details.
7.  Run the bot: Run the duck-1tsu executable.

## Run tests

To run the tests, execute:

`lisp
(duck-1tsu-build:run-tests).
