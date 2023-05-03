<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

Spectral deconvolution application. The deconvolution uses multivariate curve resolution method with an alternating least squares algorithm. The application is constructed and based off a GUI built by Jaumot, Joaquim; de Juan, Anna; Tauler, Roma. "MCR-ALS GUI 2.0: new features and applications"Chemometrics and Intelligent Laboratory Systems  (2015), 140, 1-12

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- GETTING STARTED -->
## Getting Started

To use the app you will first upload a 2D matrix that you wish to decompose into two component matrices. In some cases you may want to work with 3D data. This can be done by first augmenting a matrix and in the second window enter the number of submatrices. Once you have selected the data matrix you will need to determine the number of significant components. The number of components will determine the size of the decomposed spectra and concentration matrices and can be determined using the SVD tool. Then an initial estimate for one of the decomposed matricies can be developed with the Purest or EFA methods. 

Once your data is set up, you may begin applying any constraints needed. Some constraints include non-negativity, unimodality, closure, and equality. For more information of what these constraints mean and how to use them, see the internal help tool in the app. These constraints will apply in every iteration of the mcr-als algorithm. This algorithm will be fairly quick to calculate and will show a visual as the data changes. The final decomposed matrices will save to your workspace.

### Prerequisites

Make sure MATLAB is installed. It is available for download in the Software Distribution section under the Help tab after you log into [Canvas.](https://canvas.ubc.ca/)

### Installation

1. Clone the repo to your PC
   ```sh
   git clone https://github.com/SolarSpec/SpectralDeconvolution.git
   ```
2. Install the application 
   ```
   Click on the .mlappinstall file in your repository to open and install in MATLAB
   ```
3. Browse the APPS header
   ```
   You will find the recently installed application and can add it to your favourites
   ```

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- LICENSE -->
## License

Distributed under the BSD 3-Clause License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

SolarSpec - [SolarSpec Website](https://solarspec.ok.ubc.ca/)

Project Link: [https://github.com/SolarSpec/SpectralDeconvolution](https://github.com/SolarSpec/SpectralDeconvolution)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [Group Leader - Dr. Robert Godin](https://solarspec.ok.ubc.ca/people/)
* [The Entire SolarSpec Team](https://solarspec.ok.ubc.ca/people/)

<p align="right">(<a href="#top">back to top</a>)</p>


