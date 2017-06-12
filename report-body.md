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
- Controlling the device with the help of ones body, using suitable sensors. 
  For example, a smart-watch may be used to turn on an appliance when it detects motion in a certain direction. Sensors such as accelerometers and gyroscopes may be used to detect linear or radial motion.
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

\begingroup
\fontsize{7}{10}\selectfont

S.No.| Specifications             | Title                | Description                                                                                                 |
----:|:---------------------------|:---------------------|:------------------------------------------------------------------------------------------------------------|
  1. | Operating Sytem            | Windows 7            | Base OS                                                                                                     |
  2. | IDE                        | IAR Workbench        | IDE for ARM embedded software development                                                                   |
  3. | IDE                        | SPC5Studio           | IDE for SPC embedded software development                                                                   |
  4. | Software                   | UDE Debugger         | A debugger software that supports debugging of microcontrollers with the IEEE compliant JTAG specifications |
  5. | Software                   | STM32CubeMX          | Firmware Code Generator for the STM32 ARM hardware platform devices                                         |
  6. | API and Stack              | BlueNRG-DK           | A comprehensive software development kit for the BlueNRG family of SoCs                                     |
  7. | Programming Language       | C                    | Default language interface for IAR and ppc-gcc-vle compilers used in code production                        | 
  8. | Hardware Device            | STM32 Nucleo         | Evaluation boards for STM32 ARM hardware platform                                                           | 
  9. | Hardware Device            | SPC Discovery        | Evaluation boards for SPC hardware platform                                                                 |
 10. | Hardware Device            | BlueNRG-1            | BLE SOC based on ARM Cortex-M0 core                                                                         |
 11. | Hardware Device            | Telit GL865          | SoC for GSM Communication                                                                                   |
 12. | Hardware Device            | Quectel M66          | SoC for GSM Communication                                                                                   |
 13. | Management Tools           | Git                  | Code Version Management and Repository System                                                               |

: A brief summary of the tools used {#tbl:tool_summary}

\endgroup




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

Since SPC5Studio does not have any built-in debugging framework or tools, an external toolkit is necessary for operation and debugging. For SPC platform, UDE Debugging toolkit is the standard and default software for debugging. It has built in support for many CPU architectures and several debugging specifications. It also has support for assembly language mixed-breakpoints, i.e. it will show the code in assembly language and the user can run the code one line at a time.

## STM32CubeMX

STM32CubeMX is part of the STMCube project by +ST, whose objective is to ease and shorten the development efforts and time. The STM32CubeMX is targeted for the STM32 ARM-based platform. Similar software kit exists for the STM8 and SPC platforms also. In simple words, STM32CubeMX is a initialisation code generator. It provides an easy to use and interactive GUI to configure and generate firmware code for a platform. Its general flow of use is

- Select a suitable microcontroller platform, based on the features and number of peripherals. STM32CubeMX provides a comprehensive database so that the user can easily choose a platform, according to his/her needs.
- Configure which peripherals to use. It automatically disables the clock source for the peripherals selected not to be used.
- Configure the clock frequency to each peripheral by adjusting the clock prescalers for each of them.
- Generate the initialisation code and open it in the IDE of choice.
- Add the application code in the code thus generated.

At this moment, STM32CubeMX supports several IDEs out of the box like IAR, OpenSTM32Studio or AC6, Keil and Atollic TrueStudio.

## BlueNRG-1 DK

It stands for BlueNRG-1 Application Development Kit. It is a set of tools and low-level drivers for the BlueNRG-1 platform. The parts of the Development kit are

- **BlueNRG-1 Flasher** : It is tool for flashing compiled hex code to a BlueNRG-1 device.
- **BlueNRG-1 ST-LINK Utility** : It is a utility software for core level configuration of the BlueNRG-1 platform.
- **Documentation** : A comprehensive set of documentation for using the low-level drivers and APIs for the platform.
- **Example Firmwares** : A few examples that demonstrate typical uses of the Development Kit.
- **C Libraries** : Some C libraries needed by the Development Kit like, peripheral drivers, CMSIS^[+CMSIS], HAL^[+HAL] libraries and BSPs^[+BSP].

## Toolchains

A toolchain is a set of tools and software used to perform complex software development tasks. A toolchain may include compilers and debuggers for a platform and even version control systems. A Version Control System is a tool that allows easy management of code across many versions and changes.

For almost all of the period of internship, the C programming was used. As there were a number of different platforms it was necessary to use a wide variety of toolchains. Some toolchains that were used

- IAR ARM toolchain
- GNU GCC ARM toolchain
- GNU GCC PPC toolchain (with VLE support)
- COSMIC STM8 toolchain

## STM32 Nucleo

The STM32 Nucleo is a family of development boards based on the STM32 microcontroller platform. The STM32 Nucleo come in three variants, the Nucleo-32, Nucleo-64 and Nucleo-144. The boards are categorized on the package of the STM32 integated on the board. Thus the Nucleo-32 has TQFP-32, Nucleo-64 has TQFP-64 and Nucleo-144 has TQFP-144 integrated in them respectively. The STM32 Nucleo boards have morpho connectors which allow them to be easily integrated with Arduino shields. A shield is a stackable board which extends the functionality of the existing system. For example, Sensor shields, Ethernet Shields and Wireless connectivity Shields. The ability to integrate shields in the design results in a much faster prototyping period as the designer does not have to make new designs for the extended functionality. The Nucleo boards contain an on-board debugger, ST-Link. The debugger is cuttable i.e. it can be easily removed by cutting it away. This way the size of the nucleo board can be further minimized.

## SPC Discovery Boards


Similar to the Nucleo boards, Discovery boards provide a fast and reliable platform for prototyping. The boards provide common interfaces like SPI, UART and USB right away and also provide easy integration with debuggers like JTAG. The Discovery boards are manufactured according to the end application, for example a discovery board targetted for motor control applications will provide dedicated 34-pin motor control connectors and dedicated connectors for motor feedback inputs from hall sensors and other sensors. Most Discovery boards also provide an onboard debugger unit. The debugger units are based on two-channel FTDI UART modules, which support the JTAG debugging specifications through a process called bit-banging. Bit-Banging is basically a process of packet transmission by piggybacking it onto a different protocol. So the microcontrollers Debug Control Unit is communicated using the UART protocol. 


## BlueNRG-1 Bluetooth SoC platform

The BlueNRG-1 is a very low power Bluetooth low energy (BLE) single-mode system-on-chip, compliant with Bluetooth specification.
The BlueNRG-1 extends the features of award-winning BlueNRG network processor, enabling the usage of the embedded Cortex M0 for running the user application code.
The BlueNRG-1 includes 160 KB of programming Flash memory, 24 KB of static RAM memory with retention (two 12 KB banks) and SPI, UART, I²C standard communication interface peripherals. It also features multifunction timers, watchdog, RTC and DMA controller.
An ADC is available for interfacing with analog sensors, and for reading the measurement of the integrated battery monitor. A digital filter is available for processing a PDM stream.
The BlueNRG-1 offers the same excellent RF performance of the BlueNRG radio, and the integrated high efficiency DC/DC converter keeps the same ultra-low power characteristics, but the BlueNRG-1 improves the BlueNRG sleep mode current consumption allowing a further increase in the battery lifetime of the applications.

The key features of this network processor are:

-Bluetooth specification compliant master, slave and multiple roles simultaneously, single-mode Bluetooth low energy system-on-chip
- Operating supply voltage: from 1.7 to 3.6 V
- Integrated linear regulator and DC-DC step-down converter
- Operating temperature range: -40 °C to 105 °C
- High performance, ultra-low power Cortex-M0 32-bit based architecture core
- Programmable 160 KB Flash
- 24 KB RAM with retention (two 12 KB banks)
- 1 x UART interface
- 1 x SPI interface
- 2 x I²C interface
- 14 or 15 GPIO
- 2 x multifunction timer
- 10-bit ADC
- Watchdog & RTC
- DMA controller
- PDM stream processor
- 16 or 32 MHz crystal oscillator
- 32 kHz crystal oscillator
- 32 kHz ring oscillator
- Battery voltage monitor and temperature sensor
- Up to +8 dBm available output power (at antenna connector)
- Excellent RF link budget (up to 96 dB)
- Accurate RSSI to allow power control
- 8.3 mA TX current (@ -2 dBm, 3.0 V)
- Down to 1 µA current consumption with active BLE stack (sleep mode)
- Suitable for building applications compliant with the following radio frequency regulations: ETSI EN 300 328, EN 300 440, FCC CFR47 Part 15, ARIB STD-T66
- Pre-programmed bootloader via UART
- QFN32, WCSP34 package option
- Dedicated wettable flank QFN package for automotive grade qualification

## Telit GL865 and Quectel M66

The Telit GL865 and Quectel M66 are integrated network processor SoCs. These are designed for GSM communication. They support the dual GSM frequency bands. Both of the modules can be easily interfaced to a master device or microcontroller using UART or SPI, but can also function as tandalone network processors. The Telit GL865 features an in-built hardware python interpreter. This interpreter allows it to decode python statements that can be written to the modules flash memory to perform standalone tasks. The M66, on the other hand, is designed as a cheap and rugged SoC with the smallest footprint and size in the industry. Both of the processors are extremely efficient and operate at 1.6V CMOS technology.

## Git Version Control and Management System

Git is a software tool used for version control and management. It essentially keeps track of the changes and additions made in the project files and maintains a history for each of the selected files in a project directory. This helps the programmer to quickly revert back to a working version if an addition to the code breaks its functionality or to develop new features in complete isolation to the main branch, so that they don't break the main branch ir something goes wrong. Git is also an extremely useful tool for team coordination and collaboration. A central source code repository can be maintained, and a large team can contribute to the repository by "pushing" their code to this central repository. 


# 
