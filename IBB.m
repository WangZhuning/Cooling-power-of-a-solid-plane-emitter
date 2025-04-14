%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Planck's blackbody radiation law
%   Para:
%           Temperature,(K)
%           wl,(wavelength,μm)
%   Result: EmissiveIntensity=IBB(T,λ),(blackbody radiance,W/m2/um/sr)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function EmissiveIntensity=IBB(Temperature,wl)
c1=3.743*1e8;%W*μm4/m2
c2=1.4387*1e4;%um*K
EmissiveIntensity=c1.*wl.^-5./(exp(c2./wl./Temperature)-1)./pi;%W/(m2*um)
end