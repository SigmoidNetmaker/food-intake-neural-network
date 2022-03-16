# food-intake-neural-network
This repository contains Maude and MATLAB code that parameterizes, implements, and analyzes a neural network model of the hypothalamic and other neuron types that control food intake. The essential feature is that the model, though simple, still has many states, and some of those states correspond to patterns of observed neural resopnses that experimentalists had heretofore considered anomalous. The same model is implemented both in MATLAB (an imperative language) and in Maude (a declarative language). The two different programming modalities offer complementary functionality.   

Here is a link for MATLAB:
https://www.mathworks.com/products/matlab.html

Here is a link for Maude:
http://maude.cs.illinois.edu/w/index.php/Maude_Tools:_Maude-NPA

Development and analysis of the model and its neurobiological implications are discussed in detail in:  
Tabe-Bordbar S, Anastasio TJ. Computational analysis of the hypothalamic control of food intake.  
Frontiers in computational neuroscience. 2016 Apr 26;10:27.

MATLAB mfiles have extension .m
Maude files have extension .txt

The MATLAB files are:  
FoodIntakeSetV2 -- sets up the food intake model  
FoodIntakeSetV2v2 -- later version of above  
FoodIntakeFitCheckV2 -- sets fixed parameter values  
FoodIntakeFitCheckIndExpV2 -- sets fixed parameter values  
FoodIntakeFitV2 -- fitness function for GA optimization  
FoodIntakeFitV2v2 -- later version of above  
FoodIntakeGAV2 -- finds  parameters using genetic algorithm (GA)  
FoodIntakeGAV2v2 -- later version of above  
FoodIntakeV2 -- implements the food intake neural network model  
VectorSaver -- just saves some vectors to a file  

The Maude files are:
FoodIntakeFuncV2 -- specifies model using equaitons only  
FoodIntakeSysV2 -- specifies model using equaitons and rules  
FoodIntakeSysV2v2 -- later version of above  
FoodIntakeSysV2v2v2 -- later version of above  
FoodIntake-rewV2 -- rewrite command for food intake specification  
FoodIntake-searchV2 -- search command for food intake specification  
FoodIntake-searchV2v2 -- later version of above  




 

