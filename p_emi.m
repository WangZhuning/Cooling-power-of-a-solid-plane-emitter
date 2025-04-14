%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Blackbody radiative heat flux
%   Para:
%           Temperature,(K)
%           wl,(wavelength,μm)
%   Result: p,(blackbody irradiance,W/m2/um)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function p=p_emi(T,wl)
  theta=0:0.1:90;theta=theta.*pi/180;    
  p=IBB(T,wl).*sum(cos(theta).*sin(theta).*(theta(2)-theta(1))).*2.*pi;
end