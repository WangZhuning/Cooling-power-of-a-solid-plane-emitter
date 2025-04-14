%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Atmospheric radiative heat flux
%   Para:
%           Temperature,(K)
%           wl,(wavelength,μm)
%   Result: p(W/m2/um)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function p=p_atm(Temperature,wl)
  f2=importdata("AW1976.mat");%Atmospheric Window, US standard 1976
  t = interp1(25*400./f2(:,1), f2(:,2),wl,'pchip');  

  theta=0:0.1:89.9;theta=theta.*pi/180;
  e=1-t'.^(1./cos(theta));
  e=e.*cos(theta).*sin(theta).*(theta(2)-theta(1));
  e=real(sum(e')).*2.*pi;
    p=IBB(Temperature,wl).*e;
end