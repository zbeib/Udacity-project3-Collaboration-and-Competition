# Project 2: Collaboration and Competition
## Introduction
In this project, we will explore how policy-based methods can be used to learn the optimal policy in a model-free Reinforcement Learning setting using a Unity environment. In this environment, two agents control rackets to bounce a ball over a net.

![image](https://user-images.githubusercontent.com/128342152/227089792-aed18eb8-b291-4d2b-b847-a0443ceffc08.png)

The observation space consists of 33 variables corresponding to position, rotation, velocity, and angular velocities of the arm. Each action is a vector with four numbers, corresponding to torque applicable to two joints. Every entry in the action vector should be a number between -1 and 1.

## Implementation
The algorithm used for this project is DDPG (Deep Deterministic Policy Gradient). In DDPG, there are two networks: an actor network and a critic network. The actor network maps the current state to an action, while the critic network estimates the value of the current state-action pair. The actor network is updated using the deterministic policy gradient, which is the gradient of the expected return with respect to the parameters of the actor network. The critic network is updated using the TD (temporal difference) error, which is the difference between the estimated value of the current state-action pair and the expected value of the next state-action pair. <br>
One of the key innovations of DDPG is the use of a replay buffer, which stores experience tuples (state, action, reward, next state) and randomly samples them during training. This helps to decorrelate the data and reduces the variance of the gradient updates.

#### Model Architecture
<strong>The actor (and the actor target) network uses 3 fully-connected layers:</strong><br>
•	batch normalization -> state_size -> 128 -> Leaky ReLU<br>
•	128 -> 128 -> Leaky ReLU<br>
•	128 -> action_size -> tanh<br>

<strong>The critic (and the critic target) network uses 3 fully-connected layers:</strong><br>
•	batch normalization -> state_size -> 128 -> ReLU<br>
•	128 + action_size -> 128 -> ReLU<br>
•	128 -> 1<br>

#### Parameters
BUFFER_SIZE = int(1e5)  # replay buffer size<br>
BATCH_SIZE = 128        # minibatch size<br>
GAMMA = 0.99            # discount factor<br>
TAU = 1e-3              # for soft update of target parameters<br>
LR_ACTOR = 1e-3         # learning rate of the actor <br>
LR_CRITIC = 1e-3        # learning rate of the critic<br>
WEIGHT_DECAY = 0        # L2 weight decay<br>
LEAKY =0.01             # slope for negative values<br>

#### Performance
The agents solved the environment (by reaching a collective average reward of 30.0 over 100 episodes) in 11 episodes, before the 1000 episode limit.

![image](https://user-images.githubusercontent.com/128342152/226429499-1014582b-9e15-437c-9410-9169b7afea54.png)

## Future Work
Several improvements to DDPG can be considered to improve the performance:
1.	PPO (Proximal Policy Optimization): PPO is a policy gradient method that is more sample-efficient than DDPG and other actor-critic algorithms. It uses a clipped surrogate objective function to update the policy parameters, which prevents large policy updates that can lead to instability.
2.	HER (Hindsight Experience Replay): HER is a technique that can be used with any reinforcement learning algorithm, including DDPG, to improve sample efficiency in tasks with sparse rewards. It works by relabeling the achieved goal in a trajectory with a different goal, which is a state that the agent could have reached from the initial state. This allows the agent to learn from failures and achieve more successful trajectories.
