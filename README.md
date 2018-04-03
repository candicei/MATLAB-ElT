# Applied Math Project -- Application of Green's Functions
This project is to learn an application of Green's Functions towards Electrical Impedance Tomography (EIT) to image a tumour in a circular region.


**See the resulting EIT layers rendered to produce a 3D gif!**

<p align="center"> 
<img src="MATLAB-Output-Images/tumor-animation.gif">
</p>

Trouble viewing the GIF? Download the video here: [Video](MATLAB-Output-Images/tumorAnimation.mp4)


---
# Table of Contents
1. [Introduction to Electrical Impedance Tomography](#intro)
2. [Problem Description](#problem-description)
	1. [Orientation](#orientation)


---

## Introduction to Electrical Impedance Tomography<a name="intro"></a>

Electrical impedance tomography (EIT) is a method imaging which uses surface measurements to determine variations in electrical conductivity, permittivity, and impedance within an object to image that specific object. It is highly used in medical imaging as it is noninvasive and biological tissues and fluids have considerable variations from each other in conductivity and is therefore distinguishiable using EIT. 

In the regular set-up for an EIT system, surface electrodes are attached to the skin of the object being examined. Current is then applied to node pairs (located such that the examined area separates the two nodes) and the voltage across the nodes is measured such that conductivity can be measured.


## Problem Description <a name="problem-description"></a>
To determine the changes of conductivity, noted by equation 1, within a circular region from a finaite number of voltage measurements on a boundry for a current I applied to parts of the boundary, the boundary value problelm (bvp) is given as:  


![equation](https://latex.codecogs.com/gif.latex?%5Ctriangledown%20%5Ccdot%20%28%5Csigma%20%5Ctriangledown%20u%29%20%3D%200%20%7E%7E%7E%7E%20%5COmega%20%3D%20%5Cbig%5C%7B%28r%2C%5Ctheta%29%20%3A%20r%20%5Cleq%20a%2C%200%20%5Cleq%20%5Ctheta%20%3C%202%5Cpi%20%5Cbig%5C%7D)

![equation](https://latex.codecogs.com/gif.latex?%5Csigma%20%5Cfrac%7B%5Cpartial%20u%7D%7B%5Cpartial%20n%7D%20%3D%20I%5B%5Cdelta%28%5Ctheta%20-%20%5Calpha%29%20-%20%5Cdelta%28%5Ctheta%20&plus;%20%5Calpha%29%5D)


### Orientation  

---

<p align="center"> 
<img src="MATLAB-Output-Images/layers.gif">
</p>

Trouble viewing the GIF? Download the video here: [Video](MATLAB-Output-Images/layers.mp4)
