# Quake 3 Ergometer Edition
A Quake 3 Arena (Q3A) mod used in combination with input from an ergometer and a pulse sensor ([pulsesensor.com](http://pulsesensor.com/)) hooked up to an Arduino Leonardo. It has been part of a master thesis study conducted at the [Alpen-Adria University](https://www.aau.at/) (AAU), Klagenfurt. The game is controlled by keypresses send out by the Arduino: a specific key for an ergometer pedal cycle and another one for a heart beat. The cycling revolutions per minute (rpm) control the in-game characters speed, while the heart rate (HR) beats per minute (bpm) control the amount of powerups rewarded, depending on a set target HR zone (recover, aerobic, anerobic). Those zones are calulated relative to the age of the participant, which is therefore a mandatory input parameter of the mod. 

This work is licensed under the [Creative Commons Attribution-NonCommercial 4.0 International License](http://creativecommons.org/licenses/by-nc/4.0/).

## Controls
Keystrokes in the full setup are generated ergometer and pulse sensor hooked up to an Arduino Leonardo. It can therefore simply be tested using a plain keyboard.

* 'x' controls the players running speed
* 'h' signals a heartbeat to the mod (controls the amount and rate of rewards: items, wepons, power-ups)

## Q3A License
The complete Quake 3 Arena source code was released under the GNU GENERAL PUBLIC LICENSE on [id software's github](https://github.com/id-Software/Quake-III-Arena).

## Installation, compilation, etc.
There are a few steps to get things up and running, which are outlined in [Readme.txt](https://github.com/amplejoe/Q3AErgo/blob/master/Readme.txt).
