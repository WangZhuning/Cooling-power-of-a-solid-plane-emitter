%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Non-radiative heat flux
%   Para:   
%           Ambient temperature,(K)
%           Temperature,(K)
%           wl,(wavelength,μm)
%   Result: p(W/m2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function p=p_c(Tamb,Temperature,h)
p=h.*(Tamb-Temperature);
end