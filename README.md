# OSC-CO2: Coattention and Cosegmentation Framework For Object State Change With Multiple Features

## Description

This is the code for the implementation of the paper: **OSC-CO2: Coattention and Cosegmentation Framework For Object State Change With Multiple Features** by Rubi Quiñones, Author2, Author3, Author 4. 
<Insert link to paper>

## Dependencies
- Pytorch 1.3.1
- Tensorboard
- Numpy
- Matplotlib
- tqdm
- PIL
- statistics
- itertools
- os
- math

## Dataset
The system was trained on the CosegPP Extension Data Repository (with ground truth data):
<Insert link here>

Make sure to put the 'CosegPP_extension' and the 'CosegPP_extension_ground_truth' folder in the 'OSCCO2' folder
```
.
+-- OSCOO2
|    |--CosegPP_extension
|    |--DosegPP_extension_ground_truth
|    |--object_mask_refinement.ipynb
|    |-- ...
.
```

## How to Run OSC-CO2

### 1. Object Mask Refinement

This module is ran in Jupyter Notebook and the file is 'object_mask_refinment.ipynb'. You may create a new environment with the listed dependencies or import our 'env_oscco2.yml' by using the following code in the terminal: 'conda env create -f env_oscoo2.yml'. 

### 2. Mask Generalization

This module is ran via command prompt and the file is 'mask_optimization.py'. You may need to edit the file to input your own paths to the images. 

### 3. Results

This part is ran in MATLAB R2020b. It computes the Jaccard, Precision, Recall, and F1. 


