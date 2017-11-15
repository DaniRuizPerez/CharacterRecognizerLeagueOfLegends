League of Legends Champion Detector
============

This is a computer vision project that my team developed for the Machine Learning course in the junior year of my undergrad in computer science at UDC (Spain). Given an imagen, it tells you the position and name of different League of Legends characters (or champions), in different possitions and backgrounds. 



<img src="https://github.com/DaniRuizPerez/CharacterRecognizerLeagueOfLegends/blob/master/Result.png" width="900">




## ML techniques comparisson
Artificial Neural Networks (ANN)
Support Vector Machines (SVM)
K-Nearest Neighbours (KNN)



## Image Data Base ad-hoc creation

Esto es, cada base de datos es una matriz de 3xn elementos, siendo n el número de
imágenes.



## Approximation used

The characters are smaller than the input image, not centered (can be anywhere) and more than one can appear. The approximation that we used was to convolute the image with varying size windows that would call our ML model with the subimage delimited by every new position. We know that this is not the most efficient way, but we didn't have any time constraints. As we detected 4 different characters, a model specific for each one would be called, outputting if it is present or not in that piece of image and highlighting it if so.

The models were trained with champion images for the possitive cases and background and terrain for the negative cases.

Mean of RGB channels


## Further explanation
You can take a look at the project report (in Spanish) [here](https://github.com/DaniRuizPerez/CharacterRecognizerLeagueOfLegends/blob/master/Report.pdf).





## Contact

Contact [Daniel Ruiz Perez](mailto:druiz072@fiu.edu) for requests, bug reports and good jokes.


## License

The software in this repository is available under the GNU General Public License, version 3. See the [LICENSE](https://github.com/DaniRuizPerez/AutomaticReasoning/blob/master/LICENSE) file for more information.
