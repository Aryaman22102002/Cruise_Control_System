# Cruise Control System
A simulation-based control systems project focused on designing and comparing three different controllers: PID, Lead-Lag, and LQR, for regulating the velocity of a Toyota Camry XLE under aerodynamic and rolling resistance forces. This project was done as a part of the ME 5659 (Control Systems Engineering) course at Northeastern University.

### Table of Content
* [File Structure] (#file-structure)
* [Objectives](#objectives)
* [Our Approach](#our-approach)
* [Evaluation Metrics](#evaluation-metrics)
* [Results](#results)
* [Acknowledgements](#acknowledgements)
* [Contributors](#contributors)
* [Contact](#contact)

### File Structure
```
   ┣ 📂MATLAB_Codes       
   ┃ ┗ 📜Calculate_damping_coeff.m                # Computes linear damping coefficient (b) using aerodynamic drag and rolling resistance equations.                           
   ┃ ┗ 📜LQR_Gain_Compute.m                       # Calculates LQR gains (K and Nbar) for the linear plant.
   ┃ ┗ 📜LeadLag_Controller.m                     # Implements Lead-Lag control law in Laplace domain.
   ┃ ┗ 📜PID.m                                    # Implements custom PID controller function. 
   ┃ ┗ 📜Plot_AeroDrag_vs_Vel.m                   # Plots linear vs nonlinear aerodynamic drag vs velocity.
   ┃ ┗ 📜Plot_Graphs.m                            # Compares controller performance via Percent Overshoot, Setlling Time, and Final Steady-State Values. 
   ┣ 📂Simulink_Files                        
   ┃ ┗ 📜Linear_Plant_LQR.slx                     # Simulink model of linear plant with LQR controller.          
   ┃ ┗ 📜Linear_Plant_Lead_Lag.slx                # Simulink model of linear plant with Lead-Lag controller.
   ┃ ┗ 📜Linear_Plant_PID.slx                     # Simulink model of linear plant with PID controller.
   ┃ ┗ 📜Non_Linear_Plant_LQR.slx                 # Simulink model of nonlinear plant with LQR controller.   
   ┃ ┗ 📜Non_Linear_Plant_Lead_Lag.slx            # Simulink model of nonlinear plant with Lead-Lag controller.
   ┃ ┗ 📜Non_Linear_Plant_PID.slx                 # Simulink model of nonlinear plant with PID controller.
   ┣ 📜LICENSE
   ┣ 📜Project_Presentation.pdf
   ┣ 📜Project_Report.pdf
   ┣ 📜README.md
```

### Objectives
The main objectives of this project were as follows:
- Develop a cruise control system for a Toyota Camry XLE to perform velocity tracking and maintain a constant vehicle speed.
- Model both linear and nonlinear plant dynamics incorporating aerodynamic drag and rolling resistance.
- Implement and compare the performance of Lead-Lag, PID, and LQR controllers under various speed conditions.

### Our Approach
- We first build a dynamic model of the Toyota Camry using the car's physical parameters and force equations. Using the dynamical model, we calculated the damping co-efficients for the resistive forces for both, the linear approximation of the plant as well as the actual non-linear plant.
- In the second step, we modeled these systems in Simulink.
- After that, we designed the Lead-Lag, PID, and LQR controllers and inetgrated them with the Simulink models.
- We decided to evaluation metrics for the system.
- Finally, we evaluated the linear and non-linear systems using the different controllers for different desired velocities.

### Evaluation Metrics
Each controller was evaluated using the following criteria:
- <b> Percent Overshoot (% OS):</b> The maximum amount by which the vehicle’s speed exceeds the desired cruise speed during the transient response, expressed as a percentage of the desired speed. It is used to assess how aggressively the controller responds before settling.
- <b> Settling Time (Ts):</b> The time it takes for the vehicle’s velocity to enter and remain within a ±2% tolerance band around the desired speed. It indicates how quickly the system stabilizes after a step input.
- <b> Steady-State Error (Final Speed vs Desired Speed):</b> The absolute difference between the final velocity of the vehicle and the desired cruise speed after all transients have died out. It reflects the accuracy of long-term speed tracking.
  
To ensure consistency, we have used the same gain values for a particular controller for both, the linear and non-linear cases across the entire range of desired velocities. 

### Results
- PID was the most robust overall, providing fast convergence and minimal error across both linear and nonlinear systems.
- Lead-Lag showed fast and good convergence for both systems across a different range of desired velocities. It's overall performance was much better than LQR but not as good as PID. 
- LQR excelled on the linear plant at low speed but struggled in nonlinear cases, especially at high velocities. This is due to the fact that LQR controllers focus on optimization rather than adaptability and hence, they are very senstive to changes in system model.  

For more details and plots about the results, please refer the project presentation and project report provided in the repository above. 

### Acknowledgements
We want to thank our course instructor, Prof. Sze Zheng Yong, as well as all the teaching assistant Saleh Faghfoorian who helped us immensely not only while doing this project but throughout the course. They were great at teaching and managing the course and were always available and enthusiastic about solving everyone's doubts.

### Contributors
- [Aryaman Shardul](https://github.com/Aryaman22102002)
- [Sachidanand Halhalli](https://github.com/halhalli-s)
- [Jaykumar Goswami](https://github.com/Aryaman22102002/FAST_LIO_Loop_Closure_Test_On_NUANCE/blob/main)

### Contact
- Aryaman Shardul - lnu.arya@northeastern.edu
- Sachidanand Halhalli - halhalli.s@northeastern.edu
- Jaykumar Goswami - goswami.j@northeastern.edu
