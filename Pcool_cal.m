%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Calculation of cooling power for solid planar emitters
%   Parameters:
%           Tamb:       ambient temperature,(K)
%           Temperature (K)
%           tau_nir:    infrared transmittance
%           r_nir:      infrared reflectance
%           tau_solar:  solar transmittance
%           r_solar:    solar reflectance
%           S:          solar irradiance
%           cloud:      cloud cover
%           h:          Non-radiative heat transfer coefficient(W/m2)
%   Result: pcool:      cooling power(W/m2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function pcool=Pcool_cal(Tamb,Temperature,tau_nir,r_nir,tau_solar,r_solar,S,cloud,h)
%sigma_T=5.669*1e-8;    %   boltzmann constantW/(m2*K4)
d2=0.1;         %   wavelength interval
wlir=2.5:d2:40; %   wavelength range

%%setting emissivity
e_nir = 1-tau_nir-r_nir;          %   Infrared emissivity
e_solar = 1-tau_solar-r_solar;    %   Solar emissivity


%%calculating

patm_clear = sum(p_atm(Tamb,wlir)).*d2.* e_nir; % Atmospheric radiation(W/m2), clear
patm_cloud = sum(p_emi(Tamb,wlir)).*d2.* e_nir;            % Atmospheric radiation(W/m2), cloud
patm=patm_clear.*(1-cloud)+patm_cloud.*cloud;   % Atmospheric radiation(W/m2)

psun=S.*e_solar;                                % Solar radiation(W/m2)

pemi=sum(p_emi(Temperature,wlir)).*d2.* e_nir;  % Cooling radiation(W/m2)

pc=p_c(Tamb,Temperature,h);                     % Non-radiative heat flux(W/m2)

pcool=pemi-patm-psun-pc;                        % Cooling heat flux(W/m2)
end