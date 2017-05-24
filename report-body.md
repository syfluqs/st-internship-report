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

This is a summary of the broad fields and the corresponding projects that I was involved with in +.ST, +.in

### BLDC ^[+BLDC] and ACIM ^[+ACIM] Drives and Speed Controllers {#sec:bldc_sum}

Electrical motors are one of the most used actutators that can convert electrical energy to mechanical energy. Many other mechanical actuators like the Hydraulic Cylinder is a linear actutaor, which has , electrical motors deliver mechanical energy in the form of rotation.

PMSM ^[+PMSM], are synchronous motors that use permanant magnets for magnetic field generation instead of a separate set of windings called the field windings. BLDC motors are a special kind of PMSM, also called the ECM or +ECM. These are called so, because, instead of having a mechanical commutator^[mechanical commutators are common in electrical machines like the permanant magnet DC motor.], a specifically conditioned signal is provided to the windings directly^[later discussed in @sec:bldc_motors]. The electronic device which is responsible for the generation of such a conditioned signal, for the BLDC motor is called a *BLDC Motor Drive*.

Following is a brief list about the projects involving BLDC and ACIM motor drives.

- **BLDC Motor Drive on SPC platform** : The project involved testing of a BLDC drive library already implemented by +.ST. An exhaustive testing and verification of the firmware library was done.

- **BLDC Motor Drive on STM8 platform**: This involved design and tuning of the motor drive using the six-step commutation algorithm.
  Although, the Motor Drive power stage (MB459) was designed for both low voltage (\<35V) and high voltage(\>35V) operations but the end objective was to drive a high power BLDC motor at 48V. The peak power rating of the motor drive was around 300W. The motor drive features Over current protection, over voltage protection, BEMF sampling, Configurable one or three shunt Current Sensing, Configurable UI and user input options and regenerative braking ability. The Motor Drive controls speed through a PI controller and can perform torque regulation in closed loop operation. 
  
- **ACIM drive on STM32 (STM32F303RE)** : This involved porting of an already implemented firmware from one Hardware Abstraction Layer (STM32-ARM Standard Peripheral Lib) to another (STM32 Cube HAL).


### Automotive Keyless Entry System using BLE

The objective of this project was to implement a communication system between a mobile phone app and a BlueNRG1 hardware module to transmit character messages. The BlueNRG1 is a dedicated SoC ^[+SoC] for Bluetooth applications. This project was designed for an automotive application in which the mobile app is used to unlock or lock an automobiles central locking system.


### Vehicle Tracking System

IoT is a fast expanding field for electronics devices. Many technologies and protocols have been developed and rigorously tested to expand the notion of internet onto devices like LED lighting systems, household security and surveillance systems. Technologies such as 6LoWPAN [^6lowpan] are aimed at connecting even the smallest of electronic devices like discrete sensor units and household objects. 
The idea of IoT in household objects is quite interesting. One such application was the use of RFID technology to detect the location of small household objects like keys.
The Vehicle Tracking System is an attempt to bring IoT technology to automobiles. The Vehicle Tracking System involves a hardware module  incorporated in an automobile and a central server system, designed to transmit and store data in the cloud(central server), which can be accessed by the user via an Android app. 
The objective was to design and implement a hardware module. The hardware module comprised of a micro-controller (SPC560D40L1) and a GSM module (Quectel M66). The hardware module uses the GSM communication band to transmit vital automobile statistics to the central server via the TCP/IP data packeting protocol. HTTP was used at the application layer.


### Implementation of Servo Motor Abstraction library.

A hardware abstraction library for servo motors was implemented using STM32 Cube HAL on STM32F3 platform. The Servo library featured APIs for setting the Servo final position and the speed of rotation.


# Introduction
