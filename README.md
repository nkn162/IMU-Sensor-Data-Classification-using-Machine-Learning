# IMU Sensor Data Classification using Machine Learning for Exoskeleton Action Recognition

## Project Overview

This project focuses on the development and comparative analysis of three Machine Learning models—**Artificial Neural Network (ANN), Support Vector Machine (SVM), and Convolutional Neural Network (CNN)**—to classify five distinct movement actions (Sit-to-Stand, Stand-to-Sit, Ramp-Up/Down Walk, and Normal Walk) using raw **IMU sensor data** collected from a lower-limb exoskeleton device.

The core challenge involved handling high-dimensional, time-series biosignal data and conducting **rigorous feature engineering** to optimise model performance across different architectural approaches, all developed in **MATLAB**.

---

## My Core Contribution (Machine Learning Lead)

*This project was the Machine Learning component of a group project for the Biomechatronics and Medical Robotics module. I was the primary developer for all models and data processing pipelines.*

| Contribution Area | Technical Skills Demonstrated | Relevant Files |
| :--- | :--- | :--- |
| **Full Modeling Pipeline** | **ANN**, **SVM** (various kernel types), and **1D-CNN** development and optimisation. | `ANN.m`, `SVM.m`, `CNN.m` |
| **Advanced Feature Engineering** | **Time-series feature extraction** (Max, Min, Mean, RMS, Standard Deviation, Maximum Gradient, Zero Crossings) using the **Sliding Window** technique. | `Data_Processing/Sliding_Window.m` |
| **Robust Data Pre-processing** | Handling **missing data (interpolation)**, **data cleaning**, and **filtering** (Moving Mean selection). | `Data_Processing/` folder |
| **Hyperparameter & Feature Selection** | **Brute-force optimisation** for feature selection (identifying 15 optimal signals) and comparison of model performance across different body segments. | `SVM_Post_Feature_Selection.m` |

---

## Methodology and Data Pipeline

### 1. Data Source & Challenge
* **Source:** Raw IMU (x, y, z) data from 7 sensors (Thigh, Shank, Foot, Pelvis) on an lower-limb exoskeleton.
* **Challenge:** Extracting robust, discriminative features from noisy, multi-channel biosignal data while managing the high dimensionality ($N=441$).

### 2. Data Pre-processing & Feature Extraction

| Stage | Goal | Key Technique |
| :--- | :--- | :--- |
| **Cleaning** | Data Integrity | Removal of duplicate timestamps and annotation columns. |
| **Missing Data** | Data Continuity | Interpolation (best-fit method selected via graphical analysis). |
| **Filtering** | Noise Reduction | **Moving Mean** filter applied after evaluating various alternatives. |
| **Feature Extraction** | Dimensionality & Signal Processing | Applied a **sliding window** (`Sliding_Window.m`) to calculate 7 time-domain features for each : Max, Min, Mean, RMS, Std. Dev, Max Gradient, and Zero Crossings per sensor trial. |
| **Dataset** | Preparation of Final Dataset | All methods applied for each trial raw data to build a final dataset totalling **441 time-domain feature** and **6709 data samples**, to be used for training, validation, and testing. |

### 3. Model Architectures & Evaluation

The project compared three distinct classification architectures under various conditions:

| Model | Approach | Key Variation Trials |
| :--- | :--- | :--- |
| **Artificial Neural Network (ANN)** | Standard fully connected network. | Performance with **Full Dataset**, **15 Selected Features** (Brute-Force), and **Single Body Segment** (e.g., Pelvis only). |
| **Support Vector Machine (SVM)** | Classification using kernel methods. | Comparison of performance across various **Vector Function Types**; featured optimised version in `SVM_Post_Feature_Selection.m`. |
| **Convolutional Neural Network (CNN)** | Raw time-series data input (minimal feature extraction). | Direct comparison against feature-engineered results; required specific **data grouping and padding** for input layers. |

## Results and Validation

The models were evaluated using standard metrics, with full justification for selection choices based on trial outputs, and generated images. All key result plots (e.g., Confusion Matrices, Validation Performance Plots) are available in the **`Figures/`** directory.

* **Moving-Mean Filtration:** Various filters were trialled and evaluated - LPF, Kalman, Moving-mean. Moving-mean selected for good balance between accuracy, effectiveness, processing speed, and complexity.
* 
* **Feature Selection Finding:** Brute-force feature selection, despite being computationally expensive, yielded the most consistent and highest-accuracy results after initial trials with ReliefF and MRMR proved inconsistent.

---

## Repository Structure & Files

* `Figures/`: **Contains all generated plots** (Confusion Matrices, Validation Performance Plots, Error Histograms) for all major model trials.
* `Final_Code/`: Contains all MATLAB source files:
    * `Data_Processing/`: Code for data cleaning, interpolation, filtering, and the core processing steps.
        * `parameters.m`: Code to generate the final feature dataset from the sliding window output.
        * `Sliding_Window.m`: Core implementation of the feature extraction sliding window.
    * `ANN.m`: Artificial Neural Network model implementation.
    * `CNN.m`: Convolutional Neural Network model implementation.
    * `SVM.m`: Baseline Support Vector Machine model implementation.
    * `SVM_Post_Feature_Selection.m`: Optimized SVM model using the 15 selected features.

## Important Note on Data

The original IMU sensor data used for training and testing is proprietary and sensitive human trial data, and **cannot be shared** in this public repository. The code is structured to accept appropriately formatted data matrices.

---

## Group Roles and Responsibilities

* **Neeraj Nambudiri (ML Lead):** Primary developer for all data processing and machine learning models (ANN, SVM, CNN) and model evaluation.
* **Avinash Nair:** Support on data preparation and co-division of dataset annotation and processing for SVM model training.
* **Carol Li:** Support on CNN data preparation, and initial trials with CNN model training.

## Contact

* **Author/ML Lead:** Neeraj Nambudiri (`nkn162`)
* I am available for detailed technical discussions regarding the feature engineering pipeline or the comparative model analysis.

---

We now have strong, professional READMEs for both of your group projects. Let's move on to drafting a template for your **individual local projects** (like Computer Vision/Robotics or MATLAB).

Which individual project should we tackle next: **The Computer Vision/Robotics project** or the **MATLAB-only codes**?
