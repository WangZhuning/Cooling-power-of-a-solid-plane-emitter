%%%%%%%%%%%%%%
%Case 2:Steady-state temperature of blackbody emitter
%%%%%%%%%%%%%%
    clear;close all;
%%%%%%%%%%%%%%%%
%Parameters Setting
%%%%%%%%%%%%%%%%%
    Tamb=300;   %ambient temperature,(K)
    tau_nir=0;  %infrared transmittance
    r_nir=0;    %infrared reflectance
    tau_solar=0;%solar transmittance
    r_solar=1;  %solar reflectance
    S=1000;     %solar irradiance(W/m2)
    cloud=0;    %cloud cover,0-1
    h=0;        %Non-radiative heat transfer coefficient(W/m2/K)
%%%%%%%%%%%%%%%%
%Steady-state temperature Calculating
%%%%%%%%%%%%%%%%%
    Temperature=Tcool_cal(Tamb,tau_nir,r_nir,tau_solar,r_solar,S,cloud,h);
%%%%%%%%%%%%%%
%Result output
    disp(["Steady-state temperature: "+num2str(Temperature-273.15)+"°C"]);


    
