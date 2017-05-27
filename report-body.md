---
title: Internship Report
author: Subham Roy
institute: PEC University of Technology
date: January 20, 2014
colorlinks: true
links-as-notes: true
font-size: 12pt
chaptersDepth: 2
figPrefix:
  - "figure"
  - "figures"
eqnPrefix:
  - "equation"
  - "equations"
tblPrefix:
  - "table"
  - "tables"
lstPrefix:
  - "list"
  - "lists"
secPrefix:
  - "section"
  - "sections"
linkReferences: true
link-citations: true
mainfont: Libre Baskerville
monofont: Fantasque Sans Mono
# Abbreviation List:
# The abbreviation list will be prepended here. Do not remove the above line.
---
\pagenumbering{arabic}
\listoffigures


# Summary

During my internship period at +ST, +grnoida, +in, I was involved with several projects in the AMG^[+AMG] Systems Lab +dept and in the S&M +dept. The AMG +slab, also called the Central Lab, is involved with the design, development and implementation of various proof-of-concept systems revolving around fields like IoT, LED lighting, efficient power supplies, wireless communication systems and various motor control applications. As part of the S&M +dept and AMG Systems Lab, I got an oppurtunity to work on various realms of the industry, from application software development and firmware development to circuit design and testing. A brief categorisation of the projects is depicted in @fig:proj_categ. A short summary of each project is also mentioned in @sec:proj_sum. 

![Categorisation of projects done in the Internship period.](img/proj_categ.png){#fig:proj_categ}

## Summary of projects {#sec:proj_sum}

This is a summary of the broad fields and the corresponding projects that I was involved with in +ST, +in.

### BLDC ^[+BLDC] and ACIM ^[+ACIM] Drives and Speed Controllers {#sec:bldc_sum}

Electrical motors are one of the most used actutators that can convert electrical energy to mechanical energy. Many other mechanical actuators like the Hydraulic Cylinder is a linear actuator, which has , electrical motors deliver mechanical energy in the form of rotation.

PMSM ^[+PMSM], are synchronous motors that use permanant magnets for magnetic field generation instead of a separate set of windings called the field windings. BLDC motors are a special kind of PMSM, also called the ECM or +ECM. These are called so, because, instead of having a mechanical commutator^[Mechanical commutators are common in electrical machines like the permanant magnet DC motor.], a specifically conditioned signal is provided to the windings directly^[later discussed in @sec:bldc_motors]. The electronic device which is responsible for the generation of such a conditioned signal, for the BLDC motor is called a *BLDC Motor Drive*.

Following is a brief list about the projects involving BLDC and ACIM motor drives.

- **BLDC Motor Drive on SPC platform** : The project involved testing of a BLDC drive library already implemented by +ST. An exhaustive testing and verification of the firmware library was done.

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

[^6lowpan]: **6LowPan** is an +abbr for IPv6 over Low power Wireless Personal Area Networks. It is a technology that was originally intended to extend internet connectivity to smaller low power devices that may not have any dedicated TCP/IP stack.
  Now-a-days, it is used for creating pico-nets or micro-networks of devices, +P2P device communication.

### Implementation of Servo Motor Abstraction library.

A hardware abstraction library for servo motors was implemented using STM32 Cube HAL on STM32F3 platform. The Servo library featured APIs for setting the Servo final position and the speed of rotation.


# Introduction

## TODO : brief intro about automotive industry

## Battery technology in Automotive Industry

The automotive industry is expanding at a rapid pace. Automobiles are now-a-days more "smarter" and react to environment changes more rapidly. Contrast todays vehicles with the first ever automobiles, which had no logical processing units or sensors. Everything needed to done manually. Today, autmotive industry is highly dependent on the electronics industry for providing efficient systems. This may be called **Automotive Electrification**. With the introduction of high-efficiency high-density LiPo^[LiPo is an abbreviation for Lithium-Polymer ion batteries. These are a variety of battery which uses a polymer electrolyte composed of Li ions instead of a traditional liquid electrolyte. These are extremely light weight and pack a relatively larger amount of energy per volume than other types available.] batteries in the market, the automotive market has taken a turn towards electrification of vehicles. Corporations like Tesla Motors are the pioneers of this technology. With an increase in the production of various kinds of cells and batteries, the market has been flooded with these components. As a consequence, the prices for batteries has dropped sharply in the last decade. This has also impacted the automotive industry, with big companies like Tesla Motors to take the intitiative for making "clean" and pollution-free vehicles. Due to the reduced costs and a foresee-able future of such components, developing countries like +in has also started embracing this technology. Introduction of light battery-powered three and four wheelers on Indian roads is a direct consequence of this trend. 

## Internet of Things

Internet of Things refers to a network of physical objects, like household articles, vehicles, tools, buildings, worn-items, etc. embedded with suitable software and hardware. This software and hardware may enable these objects to communicate with each other or with devices on another network like the Internet. IoT^[+IoT] is also a rapidly growing field. Wireless IoT devices are now-a-days avaialable in any shape or size, starting from smart household appliances like TV, AC, Refrigerators, etc. to small beacons the size of a coin and wearable devices. IoT enabled devices may enable the user to interact with the devices in a number of ways, which include:
- Controlling the device with the help of another device like a mobile phone or a computer.
- Controlling the device with help of HID (Human Interface Device).
- Controlling the device with the help of ones body, using suitable sensors. For example, a smart-watch may be used to turn on an appliance when it detects motion in a certain direction. Sensors such as accelerometers and gyroscopes may be used to detect linear or radial motion.
- Device controlling another appliance.

The uses of IoT are limitless and it is just a matter of time, when the market will be flooded with IoT based devices.

## Combining Automotive Electrification and IoT

With the development of dedicated sensors and low cost IoT devices, it is now possible to efficiently integrate IoT into automobiles. Various kinds of electronic integration is already existent in present automobiles, such as
- **Automotive ECU** : ECU stands for +ECU. It is a logical control system, which takes some input data from the automobiles engine sensors like temperature, acceleration, rate of fuel flow, etc. The ECU is responsible for the efficient combustion of fuel and maintaining the engine conditions well within its operation limits.
- **Body Control Devices** : Body Control Units are responsible for various body control functions of the automobile like central locking system, power windows, various lights like the headlights, tail-lights and indicator lights.
- **Automotive Audio Equipment** : Audio Equipments in automobiles are composed of various electronic devices like audio amplifiers, radio-frequency systems, audio decoders and effects-processors(DSP), low noise amplifiers, speaker systems.
- **CAN Bus** : CAN stands for +CAN. It is a automotive bus specification designed for high speed data transfer. The CAN bus enables several microcontrollers to share data with each other without the presence of a host or central system. It is used for integrating various electronic automotive components like the ECU, Body control unit, sensors, etc. with each other so that they can function in harmony. The CAN bus is discussed in more detail in {@sec:canbus}

### The need for IoT in automobiles

- Integration of more and more Silicon[^si] into automobiles.
- Smarter and more efficient automobiles.
- Larger economic benefit. Smarter automobiles are more desirable in the current market and hence provide more economic value than its counterparts.

[^si]: Silicon, here refers to electronic logic components. These may refer to logic gates, ASICs, sensors or microcontroller units.


# Software Tools and Hardware Components {#sec:tools}

| Specifications | Title | Justification |
|:--------------:|:----------:|:--------------|
| Operating Sytem | Windows 7 | Base OS |
| IDE | IAR Workbench | IDE for ARM embedded software developmnet |
| IDE | SPC5Studio | IDE for SPC embedded software development |
| Software | UDE Debugger Toolkit | A debugger software that supports debugging of microcontrollers with the IEEE compliant JTAG specifications |
| Software | STM32CubeMX | Firmware Code Generator for the STM32 ARM hardware platform devices |
| API | BlueNRG-DK | A comprehensive software development kit for the BlueNRG family of SoCs |
| Programming Language | C | Default language interface for IAR and ppc-gcc-vle compilers used in code production | 
| Hardware Device | STM32 nucleo boards | Evaluation boards for STM32 ARM hardware platform | 
| Hardware Device | SPC discovery boards | Evaluation boards for SPC hardware platform |
| Hardware Device | BlueNRG-1 | BLE SOC based on ARM Cortex-M0 core |
| Hardware Device | Telit GL865 | SoC for GSM Communication |
| Hardware Device | Quectel M66 | SoC for GSM Communication |
| Management Tools | Git | Code Version Management and Repository System |

## IAR Workbench (also called EWARM, Embedded Workbench for ARM)

IAR Embedded Workbench is the preferred platform for embedded software development at +ST, +in. IAR offers a fast and easy way to write code, compile, upload and flash onto the hardware with minimal effort. It provides an integrated solution for rapid software development. IAR employs its own compiler toolchain for compiling C code to the ARM Cortex-M core based hardware platforms. There are several other IDEs as well like Keil, AC6 Studio, etc. but they do not provide as much streamlined development cycle as IAR does. 

### In-built debugger system

IAR workbench has an in-built debugger system, that supports several hardware specifications like JTAG, J-LINK, STLINK, SWD^[+SWD], SWIM, etc. The debugger supports functions such as
- Breakpoints
- Run or pause execution control
- C-SPY single command execution
- Custom scatter file or linker file configuration
- Live-watch of variables
- Real time view of memory, SFRs and CPU registers
- Injecting values in registers and memory location in real time.

### Language Support

IAR compiler supports both C and C++ as programming languages for embedded software. With the introduction of +OOP concepts in programming, it has become very easy to implement close to real life systems and procedures. Thus, embedded software has also moved a step away from the bare-metal programming^[close to Assembly Language Programming] to more abstract programming. This has been possible due to cheap and highly efficient memory and logic systems. Thus, memory speed and capacity is not a bottleneck, but the speed of development of software is.

## SPC5Studio 

It is the official IDE for embedded firmware development for the SPC hardware platform (discussed in @sec:spc}. It supports three compiler toolchains:
- FreeGCC compiler toolchain with VLE (GNU)
- Hightec Compiler Collection (Proprietary)
- GHS Compiler Toolchain (Proprietary)
The IDE is based on the Eclipse IDE, a popular open-source IDE for C development. The low level-firmware packages are part of the SPC5Studio itself. The low-level drivers are made in the Freemarker templating language. A GUI interface is provided for manual configuration of the low-level drivers. The configuration can also be done directly to the low-level header files. This kind of configuration is kept persistent using the Patch Architecture of SPC5Studio. It is discussed in @sec:spcstudio_patches.

### Patch architecture {#sec:spcstudio_patches}

The common code for the low-level drivers is embedded in the SPC5Studio itself and included in the project automatically. This is in contrast to other IDEs, where the user has to download the relevant low-level drivers and include them manually in the project. THe advantage of SPC5Studio's method is that, in case of a new version of the low-level drivers is released the IDE will automatically the project according to the new version, while in other IDEs the user has to do so manually. 
If the user wishes to change or edit the low-level driver's code, he/she can do so without having any portabliity issues. This is done using patches. A patch is a piece of arbitrary code that is added on to the base code. The information about each patch is stored in a database file by SPC5Studio and applied to the base code whenever the project is generated.

### Powerful code-completion and management platform

SPC5Studio is built on Eclipse IDE, which is a very popular IDE for Java and C programming. It has borrowed excellent code completion and management features from Eclipse. This enhances productivity and speed of the developer. 

### Pre-built project templates and configuration

To increase the speed of development, several pre-built project templates are already included in the IDE. These project templates contain code for general configuration and operation of each peripheral of the device.

## UDE Debugger Toolkit

Since SPC5Studio does not have any built-in debugging framework or tools, an external toolkit is necessary for operation and debugging. For SPC platform, UDE Debugging toolkit is the standard and default software for debugging. It has built in support for many CPU architectures and several debugging specifications. It also has support for assembly language style breakpoints, i.e. it will show the code in assembly language and the user can run the code one line at a time.



