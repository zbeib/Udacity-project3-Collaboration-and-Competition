# Project 3: Collaboration and Competition
### Introduction
For this project, you will work with the [Tennis](https://github.com/Unity-Technologies/ml-agents/blob/master/docs/Learning-Environment-Examples.md#tennis) environment.

![image](https://user-images.githubusercontent.com/128342152/227089792-aed18eb8-b291-4d2b-b847-a0443ceffc08.png)

In this environment, two agents control rackets to bounce a ball over a net. If an agent hits the ball over the net, it receives a reward of +0.1. If an agent lets a ball hit the ground or hits the ball out of bounds, it receives a reward of -0.01. Thus, the goal of each agent is to keep the ball in play.</br>
The observation space consists of 8 variables corresponding to the position and velocity of the ball and racket. Each agent receives its own, local observation. Two continuous actions are available, corresponding to movement toward (or away from) the net, and jumping.</br>
The task is episodic, and in order to solve the environment, your agents must get an average score of +0.5 (over 100 consecutive episodes, after taking the maximum over both agents). Specifically,

  After each episode, we add up the rewards that each agent received (without discounting), to get a score for each agent. This yields 2 (potentially different) scores. We then take the maximum of these 2 scores.</br>
  This yields a single score for each episode.</br>
The environment is considered solved, when the average (over 100 episodes) of those scores is at least +0.5.</br>


### Getting started
#### Download the Unity Environment
1. Download the environment from one of the links below.  You need only select the environment that matches your operating system:

   - Linux: [click here](https://s3-us-west-1.amazonaws.com/udacity-drlnd/P3/Tennis/Tennis_Linux.zip)
    - Mac OSX: [click here](https://s3-us-west-1.amazonaws.com/udacity-drlnd/P3/Tennis/Tennis.app.zip)
    - Windows (32-bit): [click here](https://s3-us-west-1.amazonaws.com/udacity-drlnd/P3/Tennis/Tennis_Windows_x86.zip)
    - Windows (64-bit): [click here](https://s3-us-west-1.amazonaws.com/udacity-drlnd/P3/Tennis/Tennis_Windows_x86_64.zip)
  
    (_For Windows users_) Check out [this link](https://support.microsoft.com/en-us/help/827218/how-to-determine-whether-a-computer-is-running-a-32-bit-version-or-64) if you need help with determining if your computer is running a 32-bit version or 64-bit version of the Windows operating system.

    (_For AWS_) If you'd like to train the agent on AWS (and have not [enabled a virtual screen](https://github.com/Unity-Technologies/ml-agents/blob/master/docs/Training-on-Amazon-Web-Service.md)), then please use [this link](https://s3-us-west-1.amazonaws.com/udacity-drlnd/P3/Tennis/Tennis_Linux_NoVis.zip) to obtain the "headless" version of the environment.  You will **not** be able to watch the agent without enabling a virtual screen, but you will be able to train the agent.  (_To watch the agent, you should follow the instructions to [enable a virtual screen](https://github.com/Unity-Technologies/ml-agents/blob/master/docs/Training-on-Amazon-Web-Service.md), and then download the environment for the **Linux** operating system above._)
    
2. Place the file in the DRLND GitHub repository, in the `p3_collab-compet/` folder, and unzip (or decompress) the file.</br>
3. Follow the instructions in `Tennis.ipynb` to get started with training your own agent!</br>

### Explanation
My solution for this environment uses the actor-critic MADDPG algorithm with fixed targets (for both actor and critic), soft updates, experienced replay, and added Ornstein–Uhlenbeck noise. The 2 agents are each created with four internal networks: a Q network, a deterministic policy network, a target Q network, and a target policy network.

The Q network and the target Q network have identical architectures: 3 fully-connected layers joined by ReLU activation functions and batch normalizatoin layers. The final output is entered into a tanh activation function.

The policy network and target policy network also have identical architectures: 3 fully-connected layers joined by ReLU activation functions with a batch normalization layer after the first fully-connected layer.

The agents each use a discount rate of 0.99.

The agents are each trained in a training loop for either 2000 episodes (with a max of 2000 timesteps each) or when they collectively reach an average reward over 100 episodes of 0.5 or greater.
