# ClothSimulation
Projec2ClothSimulation
Created by Andrew Minerva

1. Cloth simulation.  A cloth simulation using verticle and horizontal lines that connect nodes, this version uses position based dynamics.  The cloth behaves in a realistic fashion with a ball obstacle on screen
2. User interaction.  Allows the user to move the ball obstacle using wasd, the ball obstacle reacts to the cloth in a realistic way.
3. Ripping/Tearing When forces exceed a certain amount the cloth will rip/tear in a realistic way.

https://www.youtube.com/shorts/0EJrHWr_xkI

This video features ripping/tearing, cloth simulation, and user interaction as the red ball is moved by the user to create tears in the fabric.

https://youtube.com/shorts/0EJrHWr_xkI?feature=share

This video features nodes over the cloth mesh to create a solid cloth object


I faced two major problems working on this project, the first being diagonal cross sections between nodes,  I eventually removed this element as I found that horizontal and vertical line segments were enough to create believable behavior.

The other problem I faced when creating the project was that nodes, when given sufficient energy, would fly too far and never be able to recover, this in turn would cause the nodes around it to stretch to their maximum and never relax.  I solved this behavior by simply creating small link lengths that would not generate a force large enough to destabilize the simulation.

Art contest submission

While working on creating diagonal cross sections I came across some very unexpected behavior.  


![ezgif com-video-to-gif](https://github.com/AndrewMinerva/ClothSimulation/assets/122182702/6e89e9a4-191d-4ad2-8949-dea8e0b3a247)

