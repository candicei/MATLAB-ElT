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



![equation](<img src="http://bit.ly/2Ec3Yhb" align="center" border="0" alt="\triangledown \cdot (\sigma \triangledown u) = 0 ~~~~ \Omega =  \big\{(r,\theta) : r \leq a, 0 \leq \theta < 2\pi \big\} " width="371" height="21" />)


![equation](<img src="http://bit.ly/2GthF1l" align="center" border="0" alt="\sigma  \frac{\partial u}{\partial n} = I[\delta(\theta - \alpha) - \delta(\theta + \alpha)]" width="235" height="42" />)



### Orientation  

---

<p align="center"> 
<img src="MATLAB-Output-Images/layers.gif">
</p>

Trouble viewing the GIF? Download the video here: [Video](MATLAB-Output-Images/layers.mp4)
