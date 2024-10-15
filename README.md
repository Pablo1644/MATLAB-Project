# MATLAB PROJECT - Finding height of lenses matrix 

## Decription
This project was created as part of the "Numerical Methods in Optics" course. The aim of the project is to find the height of the lens array using various numerical methods, 
such as plane wave propagation, phase unwrapping, circle detection, etc. 

## Requirements
- MATLAB R2019 or later.
- Presence of image data in the `data/` folder. Due to copyright reasons, the photos were not placed in the repository.

## Summary
We managed to correctly achieve the main assumptions of the project. First, we extract the field using TPS formulas.</br>
The values depended on the row we analysed. Then we wrote a circle detection program, which works properly. </br>
Phase analysis for one lens showed that the maximum value varied was 19.78, but to be more precise we applied averaging of the phase based on one row of lenses.</br>
We had a slight difficulty in determining d, it is related to the arbitrariness in determining the beginning and end of the jumper. </br>
For this reason, depending on the designation, we will have a slightly different result.</br>
In our results, you can clearly see the Focus phase and also that there is focus. The curvature of the background is due to optical aberration due to the experiment. </br>
Full time of launching the project was 126.283 s, however without circle detection it would be only about 4s. Circle detection is needed only for demonstrating reason so if the speed is necessary user can comment lines for circle detection. </br>

## Refactor
Wagrodzki_Sarnacki_Project_Final_Version_refactored.pdf - it is the newest refactored version
