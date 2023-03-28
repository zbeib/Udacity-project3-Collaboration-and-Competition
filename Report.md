# Project 3: Collaboration and Competition
## Introduction
In this project, we will explore how policy-based methods can be used to learn the optimal policy in a model-free Reinforcement Learning setting using a Unity environment. 

![image](https://user-images.githubusercontent.com/128342152/227089792-aed18eb8-b291-4d2b-b847-a0443ceffc08.png)

In this environment, two agents control rackets to bounce a ball over a net. If an agent hits the ball over the net, it receives a reward of +0.1. If an agent lets a ball hit the ground or hits the ball out of bounds, it receives a reward of -0.01. Thus, the goal of each agent is to keep the ball in play.</br>
The observation space consists of 8 variables corresponding to the position and velocity of the ball and racket. Each agent receives its own, local observation. Two continuous actions are available, corresponding to movement toward (or away from) the net, and jumping.</br>
The task is episodic, and in order to solve the environment, your agents must get an average score of +0.5 (over 100 consecutive episodes, after taking the maximum over both agents). Specifically,

  After each episode, we add up the rewards that each agent received (without discounting), to get a score for each agent. This yields 2 (potentially different) scores. We then take the maximum of these 2 scores.</br>
  This yields a single score for each episode.</br>
The environment is considered solved, when the average (over 100 episodes) of those scores is at least +0.5.</br>

## Implementation
The algorithm used for this project is DDPG (Deep Deterministic Policy Gradient). In DDPG, there are two networks: an actor network and a critic network. The actor network maps the current state to an action, while the critic network estimates the value of the current state-action pair. The actor network is updated using the deterministic policy gradient, which is the gradient of the expected return with respect to the parameters of the actor network. The critic network is updated using the TD (temporal difference) error, which is the difference between the estimated value of the current state-action pair and the expected value of the next state-action pair. <br>
One of the key innovations of DDPG is the use of a replay buffer, which stores experience tuples (state, action, reward, next state) and randomly samples them during training. This helps to decorrelate the data and reduces the variance of the gradient updates.

#### Model Architecture
<strong>The actor (and the actor target) network uses 3 fully-connected layers:</strong><br>
•	batch normalization -> state_size -> 128 -> Leaky ReLU<br>
•	128 -> 128 -> Leaky ReLU<br>
•	128 -> action_size -> tanh<br>

<strong>The critic (and the critic target) network uses 3 fully-connected layers:</strong><br>
•	batch normalization -> state_size -> 128 -> Leaky ReLU<br>
•	128 + action_size -> 128 -> Leaky ReLU<br>
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
The agents solved the environment (by reaching a collective average reward of 0.5 over 100 consecutive episodes) in 1491 episodes, before the 2000 episode limit.</br>
![image](https://user-images.githubusercontent.com/128342152/227098050-7fc464c2-48c2-46d3-8ff4-881684e4da21.png)

## Future Work
Several improvements to DDPG can be considered to improve the performance:
1.	Prioritized Experience Replay: This method prioritizes the experiences based on their importance and samples them more frequently. This can help the agent to learn from more important experiences, which can accelerate the learning process.
2.	Exploration Strategies: Exploration is crucial for reinforcement learning. Techniques like noise injection and parameter space exploration can be used to encourage exploration and prevent the agent from getting stuck in a local optimum.
3.	Learning Rate Scheduling: Adjusting the learning rate over time can improve the convergence of the algorithm. Techniques like cyclical learning rates and learning rate decay can be used to optimize the learning rate.
