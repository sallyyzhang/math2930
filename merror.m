
%x = [ -pi : .01 : pi];
x = linspace(-5,5,200);
f = zeros(size(x));
m = 20; % order of partial sum
Sm = zeros(1,numel((x))); % initialize the sum
for n = 1 : m
    Sm = Sm +((1-cos(n*pi))/(pi*n*n))*cos(n*x) +(-1)^(n+1)*sin(n*x)/n;
end
Sm = -pi/4 + Sm;
mask = (mod(x,2*pi)-pi)<0;
f(mask) = 0;
mask = (mod(x,2*pi)-pi>=0);
f(mask) = -pi + abs(mod(x(mask),2*pi)-pi);
%plot(x, f)
% plot original function
figure(1)
plot(x,f,'Color','b',"LineWidth",2)
grid on
hold on
% superimpose partial sum
plot(x,Sm,'color', 'r', 'linewidth', 1.5)
% Calculate error for 0<x<2
xstart = find(x==-pi); % Index of x=0
xend = find(x==0); % Index of x=2
% Plot error
figure(2)
plot(x,abs(Sm-f), 'linewidth', 3)
% Calculate the maximum error
maxError = max(abs(Sm-f));
testString = "Error max("+maxError+")";
title(testString)