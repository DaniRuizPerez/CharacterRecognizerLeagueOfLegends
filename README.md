League of Legends Champion Detector
============

This is a computer vision project that my team developed for the Machine Learning course in the junior year of my undergrad in computer science at UDC (Spain). Given an imagen, it tells you the position and name of different League of Legends characters (or champions), in different possitions and backgrounds. 

<p align="center">
<img src="https://github.com/DaniRuizPerez/CharacterRecognizerLeagueOfLegends/blob/master/AllInGrass.png" width="900">>
</p>

## Team work divission
I took care of the necesary matlab scripting, training the models, testing, feature extraction and approximation ideas. The other members of the team took care of taking the screenshots to create the database.



## ML techniques comparisson
For each of the incremental approximations used, we played with this three different models, being SVM the one with better results:
- Artificial Neural Networks (ANN)
- Support Vector Machines (SVM)
- K-Nearest Neighbours (KNN)


## Approximation used

The characters are smaller than the input image, not centered (can be anywhere) and more than one can appear. The approximation that we used was to convolute the image with varying size windows that would call our ML model with the subimage delimited by every new position. We know that this is not the most efficient way, but we didn't have any time constraints. As we detected 4 different characters, a model specific for each one would be called, outputting if it is present or not in that piece of image and highlighting it if so.

The models were trained with champion images for the possitive cases and background and terrain for the negative cases. From all the images obtained, we created specific .mat files with the features that we extracted from them, and that was what was feeded into the ML models. This features are the mean and standard Deviation of RGB channels for the whole window and for different fixed characteristics specific to the different characters. We only detect the champions when they are in a range of poses, so we took advantage of the locality of their main features. An example of the features that we took can be vieweded in the following image:

<p align="center">
<img src="https://github.com/DaniRuizPerez/CharacterRecognizerLeagueOfLegends/blob/master/UrgotFeatures.PNG" width="700">
</p>

## Image Data Base ad-hoc creation
We had to create a sufficiently large database of screenshots for the game. Then, we ran a script that obtain the features selected of each champion and stored it in a .mat file.


## Execution

You will need Matlab and to execute the file [processALL.m](https://github.com/DaniRuizPerez/CharacterRecognizerLeagueOfLegends/blob/master/Code/processALL.mf) with the desired image and displacement. This is set up to recognize all the suported champions and different backgrounds. A great testing file is [processALL.m](https://github.com/DaniRuizPerez/CharacterRecognizerLeagueOfLegends/blob/master/Code/All.png)


## Further explanation
You can take a look at the project report (in Spanish) [here](https://github.com/DaniRuizPerez/CharacterRecognizerLeagueOfLegends/blob/master/Report.pdf).


## Contact

Contact [Daniel Ruiz Perez](mailto:druiz072@fiu.edu) for requests, bug reports and good jokes.


## License

The software in this repository is available under the GNU General Public License, version 3. See the [LICENSE](https://github.com/DaniRuizPerez/CharacterRecognizerLeagueOfLegends/blob/master/LICENSE) file for more information.
