%GB comments
1. 70 incorrect plots with no labels. Should be generated like this:
sol = ode23(@repressilator,[0 200], [1, 0,0]);
hold on
plot(sol.x, sol.y(1,:));
plot(sol.x, sol.y(2,:));
plot(sol.x, sol.y(3,:));
hold off 
legend('x1','x2','x3')

2. 90 Same, incorrect plots. General discussion is ok
3. 90 This questions requires you to scan through multiple parameters of k2 to capture and understand the behavior of the system. Values of k2<1 leads to dampened oscillations. Values below 0.15 remove osclliations. Values above 1 generate oscillations with a periodicity and amplitude directed by the magnitude of k2.  
4.100
overall 88

%In this directory, you will find a derivaitve function representing a
%three gene circuit in which each gene product represses the transcription of another
%gene in a cycle. This simple three gene circuit displays oscillations and was one
%of the first synthetic circuits ever constructed (see Elowitz & Leibler
%Nature 2000). 

% 1. Start with initial conditions x(1) = 1, x(2) = x(3) = 0. 
% Run the model for 200 time units and plot the result. verify that it
% does indeed oscillate. 

x = [1 0 0];
sol1 = ode23(@repressilator,[0,200],x);
plot3(sol1.y(1,:),sol1.y(2,:),sol1.y(3,:),'r.-')

% 2. What happens if you start with initial conditions x(1) = x(2) = x(3) =
% 0.5? Why?

x = [0.5 0.5 0.5];
sol1 = ode23(@repressilator,[0,1000],x);
plot3(sol1.y(1,:),sol1.y(2,:),sol1.y(3,:),'r.-')
%when x(1) = x(2) = x(3) = xx,dx(1) = dx(2) = dx(3) = 0.1*(1 - xx) - 5*xx^5/(1 + xx^4), there is a solution at
%x=0.43 from positive to negative, which is a fix point apart from the fix
%line elsewhere.these three gene in turn turn off each other in a circle on the same
%function, thus when they start equally, a fixed stable condition with all
%three identical expression would be the end solution

% 3. The strength of the repression is governed by the constant k2 which is
% the same for all the genes. What happens when you make k2 larger or
% smaller? Find the approximate value of k2 for which the system no longer
% oscillates. 

x = [0.3 0.4 0.4];
sol1 = ode23(@repressilator_k2,[0,1000],x);
plot3(sol1.y(1,:),sol1.y(2,:),sol1.y(3,:),'r.-')
%the genes will ocillate closer to 0 if the k is larger, and the ocillate
%cycle more tripolar-ish and smaller.when k2 is smaller than 2.60 the
%system no longer oscillate.
.........
% 4. What happens when you make k2 larger or smaller for only one of the
% genes? 

x = [0.6 0.2 0.2];
sol1 = ode23(@repressilator_k23,[0,10000],x);
plot3(sol1.y(1,:),sol1.y(2,:),sol1.y(3,:),'r.-')
%when its large enough the system stop oscillating. before that the system
%would down-proportion the other two.
