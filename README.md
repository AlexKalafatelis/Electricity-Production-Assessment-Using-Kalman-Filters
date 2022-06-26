# Electricity Production Assessment Using Kalman Filters

## Introduction

Kalman filter is named with respect to Rudolf E. Kalman who in 1960 published his famous research “A new approach to linear filtering and prediction problems”. The Kalman filter or the linear quadratic estimation (LQE) is nevertheless one of the most significant and common sensor and data fusion algorithms today. The efficiency of the Kalman filter is due to its inexpensive computational requirements, well-designed recursive properties, representation of the optimal estimator for one-dimensional linear systems assuming Gaussian error statistics, and suitability for real-time implementation.

The most important concepts when using the Kalman filter are summarized as:

- Kalman filters are discrete: they rely on measurement samples taken between repeated but constant periods of time.

- Kalman filters are recursive: its prediction of the future relies on the state of the present (position, velocity, acceleration, etc.). Further, it presents a guess about external factors that may affect the situation.

- Kalman filters predict the future: this is applied by making measurements (such as by sensors) and then deriving an adjusted estimate of the state from both prediction and measurements.


The basic Kalman filter is meant for linear systems, but challenging scientific problems, for example in satellite navigation, are nonlinear and therefore it was necessary to implement a special version of the Kalman filter called the extended Kalman Filter (EKF).

The Kalman filter has several applications in technology. Some common applications are:

- Guidance and navigation of vehicles, particularly aircraft and spacecraft.

- Robotic motion planning and trajectory adjustment.

- Position awareness radar sensors for advanced driver assistance systems (ADAS) in autonomous vehicles.

- Many computer vision applications such as stabilizing depth measurements, object tracking (e.g., faces, heads, hands), fusing data from laser scanners, stereo cameras for depth and velocity measurements, and 3D mapping through Kinect or range cameras.

## Problem Definition

Kalman filters are used to estimate states based on linear dynamical systems in state space format. The process model defines the evolution of the state from time $k−1$ to time $k$ as:

$x_k = F_{x_k−1}+B_{u_k−1} + w_{k−1}$

where $F$ is the state transition matrix applied to the previous state vector $x_{k−1}$, $B$ is the control-input matrix applied to the control vector $u_{k−1}$, and $w_{k−1}$ is the process noise vector that is assumed to be zero-mean Gaussian with the covariance $Q$, i.e., $w_{k−1}∼N(0,Q)$.

The process model is paired with the measurement model that describes the relationship between the state and the measurement at the current time step $k$ as:

$z_k=H_{x_k}+ν_k$ 

where  $z_k$ 
is the measurement vector, $H$ is the measurement matrix, 
and $ν_k$ is the measurement noise vector that is assumed to be zero-mean Gaussian with the covariance $R$, 
i.e., $ν_k$ $∼N(0,R)$. Note that sometimes the term “measurement” is called “observation” in different literature.

The role of the Kalman filter is to provide estimate of $x_k$ at time $k$, given the initial estimate of $x_0$, the series of measurement, $z_1,z_2,…,z_k$, and the information of the system described by $F, B, H, Q,$ and $R$. Note that subscripts to these matrices are omitted here by assuming that they are invariant over time as in most applications. Although the covariance matrices are supposed to reflect the statistics of the noises, the true statistics of the noises is not known or not Gaussian in many practical applications. Therefore, $Q$ and $R$ are usually used as tuning parameters that the user can adjust to get desired performance.


## Kalman Filter Algorithm

Kalman filter algorithm consists of two stages: prediction and update. Note that the terms “prediction” and “update” are often called “propagation” and “correction,” respectively, in different literature. The Kalman filter algorithm is summarized as follows:

- Prediction:

| Objective | Equation |
|   :---:      |     :---:      |
| Predicted State Estimate | $x_k = F{x_{k-1}} + B_{u_{k-1}}$ | 
| Predicted Error Covariance | Show file differences that haven't been staged |


## Example

### Problem 
We want to estimate the production of electricity using Kalman Filter with the following parameters: F = 1, H = -350, Q = 0.3, R = 0.2, s = 400 and initial conditions x0 = 1.1, p0 = 0.1.

Write a program that for one week calculates and plans the actual and estimated electricity production:

1. using a time-invariant Kalman filter
2. using a steady state Kalman filter

In addition, write a program that calculates and displays the average absolute error in terms of actual power generation for the two filters. For which filter do you notice a smaller deviation of the estimate from the actual electricity production? 


### Results


The following image depicts the real and estimated electricity generation, using different types of Kalman filters.

![untitled2](https://user-images.githubusercontent.com/47864776/175816833-57f43205-52bb-4222-881f-7041ec39560e.png)


The following image depicts the results of the mean absolute percentage calculations of the actual power generation of the two filters.

![Screenshot](https://user-images.githubusercontent.com/47864776/175818107-579b584c-0ab0-4e0a-8a4f-2755eb2a8e1e.png)


Based on the above results, we observe that the estimates of the two different techniques are equivalent.



## References

Bashar Alsadik, 2019, Adjustment Models in 3D Geomatics and Computational Geophysics, 1st Ed, DOI: 10.1016/C2018-0-02477-9.

Govaers, F., 2019, Introduction and Implementations of the Kalman Filter, DOI: 10.5772/intechopen.75731. 
