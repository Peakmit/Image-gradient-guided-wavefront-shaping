# Image Gradient Guided Wavefront Shaping
​
## Basic information

Code for image gradient guided wavefront shaping proposed in the paper "Overcoming the diffraction limit by exploiting unmeasured scattering media" by Shuai Sun, Zhen-Wu Nie, Long-Kun Du, Chen Chang, and Wei-Tao Liu. 

Paper Links: https://doi.org/10.1364/OPTICA.507310

​Citation Format: Shuai Sun, Zhen-Wu Nie, Long-Kun Du, Chen Chang, and Wei-Tao Liu, "Overcoming the diffraction limit by exploiting unmeasured scattering media," Optica 11, 385-391 (2024) 

Contact Information:  
Code Author: Nie Zhenwu  
Email: niezhenwu@126.com

## File description

Image-gradient-guided-wavefront-shaping  
---- Source: Different targets tested in the optimization.  
---- opt.m: The main file of the simulation.  
---- initial_pra.m: The file initializing parameters for optimization.  
---- show_pic.m: Draw Intensity distribution on the camera.  
---- Image_metric.m: Cost function for GA including different image metrics(e.g. image gradient, modified entropy, image variance, single point)   

## How to Start

Directly run 'opt.m'

## Principle

Figure 1: Principle Of image gradient guided wavefront shaping

![Figure1](https://github.com/Peakmit/Image-gradient-guided-wavefront-shaping/assets/46422710/079af191-4da0-4841-a161-77b75dfbcdda)

Scattering media(e.g. diffuser, fog, biological tissue) on the light path will causing the degradation of images. With the help of wavefront shaping, abberation brought by scatter media can be cancelled by iteratively optimizing the compensation phase on the SLM(Spatial Light Modulator). The difference between scattered image and diffraction limited image on image gradient can replace invasive guide-star to guide the optimization, reconstructing high contract images.

Figure 2: Flow chart of image gradient guided wavefront shaping

![Figure2](https://github.com/Peakmit/Image-gradient-guided-wavefront-shaping/assets/46422710/abc481e6-64e9-4e59-beaa-2d187d90262e)





