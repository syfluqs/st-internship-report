---
title: My Internship Report
author: Subham Roy
institute: PEC University of Technology
date: January 20, 2014
colorlinks: true
links-as-notes: true
font-size: 12pt
chaptersDepth: 2
figPrefix:
  - "figure."
  - "figures."
eqnPrefix:
  - "equation."
  - "equations."
tblPrefix:
  - "table."
  - "tables."
lstPrefix:
  - "list."
  - "lists."
secPrefix:
  - "section."
  - "sections."
linkReferences: true
mainfont: Libre Baskerville
monofont: Fantasque Sans Mono
---
\pagenumbering{arabic}
\listoffigures


# Summary

During my internship period at +.ST, +.grnoida, +.in, I was involved with several projects in the AMG Systems Lab (+AMG) +.dept and in the S&M +.dept. The AMG (+AMG) +.slab, also called the Central Lab, is involved with the design, development and implementation of various proof-of-concept systems revolving around fields like IoT, LED lighting, efficient power supplies, wireless communication systems and various motor control applications. As part of the S&M +.dept and AMG Systems Lab, I got an oppurtunity to work on various realms of the industry, from application software development and firmware development to circuit design and testing. A brief categorisation of the projects is depicted in @fig:proj_categ. A short summary of each project is also mentioned in @sec:proj_sum. 

![Categorisation of projects done in the Internship period.](img/proj_categ.png){#fig:proj_categ}

## Summary of projects {#sec:proj_sum}

### BLDC (+BLDC) and ACIM (+ACIM) Drives and Speed Controllers

This project involved design of BLDC Motor Drives on two microcontroller platforms SPC and STM8 and design and testing of an AC Induction Motor drive on the STM32 platform.
  - BLDC Motor Drive on SPC platform: This involved testing of a BLDC drive library implemented by ST.
  - BLDC Motor Drive on STM8 platform: This involved design and tuning of the motor drive using the six-step commutation algorithm.
     Although, the Motor Drive power stage (MB459) was designed for both low voltage (<35V) and high voltage(>35V) operations but the end objective was to drive a high power BLDC motor at 48V. The peak power rating of the motor drive was around 300W. The motor drive features Over current protection, over voltage protection, BEMF sampling, Configurable one or three shunt Current Sensing, Configurable UI and user input options and regenerative braking ability. The Motor Drive controls speed through a PI controller and can perform torque regulation in closed loop operation. 
  - ACIM drive on STM32 (STM32F303RE): This involved porting of an already implemented firmware from one Hardware Abstraction Layer (STM32-ARM Standard Peripheral Lib) to another (STM32 Cube HAL).

### Implementation of Servo Motor Abstraction library

A Servo motor abstraction library was implemented using STM32 Cube HAL on STM32F3 platform. The Servo library featured APIs for setting the Servo final position and the speed of rotation.

### Work on BLE stack on BlueNRG1 (ARM Cortex M0 32-bit) platform.

The objective was to implement a communication system between a mobile phone app and a BlueNRG1 hardware module to transmit character messages. This was designed for an automotive application in which the mobile app is used to unlock an automobiles power lock.

### Vehicle Tracking System. (in progress)

The Vehicle Tracking System involves a hardware module to be incorporated in an automobile and a central server system, designed to transmit and store data in the cloud(central server), which can be accessed by the user via an Android app. 
My part of the job is to design and implement the hardware module. The hardware module comprises of a micro-controller (SPC560D40L1) and a GSM module (Quectel M66, previously Telit GL865). The hardware module uses the GSM communication band to transmit vital automobile stats to the central server via the TCP/IP data packeting protocol. HTTP is being used at the application layer. The microcontroller is based on the Power Architecture and supports the VLE (Variable Length Encoding) instructions. The communication between the GSM module and microcontroller is done via UART.
