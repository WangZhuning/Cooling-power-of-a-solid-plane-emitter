%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Calculation of steady-state temperature for solid planar emitters
%   Parameters:
%           Tamb:       ambient temperature,(K)
%           Temperature (K)
%           tau_nir:    infrared transmittance
%           r_nir:      infrared reflectance
%           tau_solar:  solar transmittance
%           r_solar:    solar reflectance
%           S:          solar irradiance
%           cloud:      cloud cover
%           h:          Non-radiative heat transfer coefficient(W/m2/K)

%   Result: Temperature steady-state temperature(K),when cooling power==0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Temperature=Tcool_cal(Tamb,tau_nir,r_nir,tau_solar,r_solar,S,cloud,h)
%%calculating
syms Tunknown
eqn=Pcool_cal(Tamb,Tunknown,tau_nir,r_nir,tau_solar,r_solar,S,cloud,h)==0;
sol=vpasolve(eqn,Tunknown,'Random',true);
Temperature=double(sol(sol==real(sol)&sol>0));
Temperature=Temperature(1);
end