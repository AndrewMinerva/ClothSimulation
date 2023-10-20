# ClothSimulation
Projec2ClothSimulation
Created by Andrew Minerva

1. Cloth simulation.  A cloth simulation using verticle and horizontal lines that connect nodes, this version uses position based dynamics.  The cloth behaves in a realistic fashion with a ball obstacle on screen
2. User interaction.  Allows the user to move the ball obstacle using wasd, the ball obstacle reacts to the cloth in a realistic way.
3. Ripping/Tearing When forces exceed a certain amount the cloth will rip/tear in a realistic way.

<div style="height: 329.27px; width: 300.00px; position:relative;"><iframe allow="autoplay; gyroscope;" allowfullscreen height="100%" referrerpolicy="strict-origin" src="https://www.kapwing.com/e/6532e1f1c21eebe762f5206e" style="border:0; height:100%; left:0; overflow:hidden; position:absolute; top:0; width:100%" title="Embedded content made on Kapwing" width="100%"></iframe></div><p style="font-size: 12px; text-align: right;">Video edited on <a href="https://www.kapwing.com/video-editor">Kapwing</a></p>


I faced two major problems working on this project, the first being diagonal cross sections between nodes,  I eventually removed this element as I found that horizontal and vertical line segments were enough to create believable behavior.

The other problem I faced when creating the project was that nodes, when given sufficient energy, would fly too far and never be able to recover, this in turn would cause the nodes around it to stretch to their maximum and never relax.  I solved this behavior by simply creating small link lengths that would not generate a force large enough to destabilize the simulation.
