# PSO - Study of the particule swarm optimization algorithm

## Abstract

This work aims to introduce the Particle swarm optimization (**PSO**) method, applied on a wide range of real life complex problems.\\Depending on the context, PSO outperforms other optimization methods such as gradient based algorithms and other derivative-free algorithms, especially in the case of some non-linear objective function, as they tend to get trapped in local optimums and fail to find the global one.

The core of this paper is to discuss theories behind PSO, and then test them. We will apply PSO algorithm on highly complex non-linear functions and test them using different approaches on each one of the algorithm's parameters, aiming to build an improved version of PSO suitable for each problem.

The empirical approach developed here, brings some good insights on the several shortcomings of PSO that we need to overcome like premature convergence and low accuracy. The characteristics of a function will have some implications on the parameter’s settings. Finally, we demonstrate the power of PSO with the right parameters in optimizing difficult functions, reducing computational cost and the risk of returning local optimum.

## Testing PSO on complex functions 
<p align="center">
  <img src="https://github.com/Mehdi2402/images/blob/main/pso_schwefel_function.PNG?raw=true" />
</p>
<p align="center">
  <img src="https://github.com/Mehdi2402/images/blob/main/pso_schwefel.PNG?raw=true" />
</p>

## Visualizing particle movement depending on parameters (c1 and c2)
### The arbitrage between search space and precision
<p align="center">
  <img src="https://github.com/Mehdi2402/images/blob/main/pso_viz_particules.PNG?raw=true" />
</p>

## Swarm size and (c1, c2) parameters effects on the number of iterations
<p align="center">
  <img src="https://github.com/Mehdi2402/images/blob/main/pso_swarmsize.png?raw=true" />
</p>

## Convergence speed depending on parameters (c1 and c2)
<p align="center">
  <img src="https://github.com/Mehdi2402/images/blob/main/pso_convergence_speed.PNG?raw=true" />
</p>

<p align="center">
  <img src="https://github.com/Mehdi2402/images/blob/main/pso_heatmap.png?raw=true" />
</p>


