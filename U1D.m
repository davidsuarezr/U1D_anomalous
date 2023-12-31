Off[General::spell]

Model`Name = "U1D";
Model`NameLaTeX ="B-L extended Standard Model";
Model`Authors = "F.Staub";
Model`Date = "2015-11-16";

(* 2014-11-06: Changed sign in Lagrangian *)
(* 2015-11-16: fixed particles.m *)

(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

Global[[1]] = {Z[2], Z2};

(* Gauge Superfields *)

Gauge[[1]]={B,   U[1], hypercharge,  g1, False, 1};
Gauge[[2]]={WB, SU[2], left,         g2,  True, 1};
Gauge[[3]]={G,  SU[3], color,        g3, False, 1};
Gauge[[4]]={Bp,  U[1], U1L,         g1p, False, 1};


(* Chiral Superfields *)

FermionFields[[1]]  = { q, 3, {uL, dL},  1/6, 2,  3,    0,  1};  
FermionFields[[2]]  = { l, 3, {vL, eL}, -1/2, 2,  1,    0,  1};
FermionFields[[3]]  = { d, 3, conj[dR],  1/3, 1, -3,    0,  1};
FermionFields[[4]]  = { u, 3, conj[uR], -2/3, 1, -3,    0,  1};
FermionFields[[5]]  = { e, 3, conj[eR],    1, 1,  1,    0,  1};
FermionFields[[6]]  = { v, 2, conj[vR],    0, 1,  1,   -5,  1};
FermionFields[[7]]  = {CL, 1,       cl,    0, 1,  1,    6, -1};
FermionFields[[8]]  = {CR, 1, conj[cr],    0, 1,  1,   -1, -1};

ScalarFields[[1]] = { H, 1, {H0, Hm}, -1/2, 2,  1,   0, 1};
ScalarFields[[2]] = {bi, 1,      BiD,    0, 1,  1,  -5, 1};


(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};

(* ----- Before EWSB ----- *)

DEFINITION[GaugeES][Additional]= {
	{LagHC, {AddHC->True}},
	{LagNoHC,{ AddHC->False}}
};

LagNoHC = -(mu2 conj[H].H + 1/2 L1 conj[H].H.conj[H].H + MuP conj[bi].bi + 1/2 L2 conj[bi].bi.conj[bi].bi + L3 conj[bi].bi.conj[H].H);

LagHC = - (+ Yd H.d.q + Ye H.e.l - Yu conj[H].u.q  + Yc bi.CL.CR );

(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector] =
{ 
  {{VB,VWB[3],VBp},{VP,VZ,VZp},ZZ},
  {{VWB[1],VWB[2]},{VWm,conj[VWm]},ZW}
};
        
          	

(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs]= 
{    {H0, {vH, 1/Sqrt[2]}, {sigmaH, \[ImaginaryI]/Sqrt[2]},{phiH, 1/Sqrt[2]}},
     {BiD,{vX, 1/Sqrt[2]}, {sigmaB, \[ImaginaryI]/Sqrt[2]},{phiB, 1/Sqrt[2]}}     };
 

DEFINITION[EWSB][MatterSector]=   
    {
     {{phiH,phiB},{hh,ZH}},
     {{sigmaH,sigmaB},{Ah,ZA}},
     {{{dL}, {conj[dR]}}, {{DL,Vd}, {DR,Ud}}},
     {{{uL}, {conj[uR]}}, {{UL,Vu}, {UR,Uu}}},
     {{{eL}, {conj[eR]}}, {{EL,Ve}, {ER,Ue}}},
     {{vL,conj[vR]}, {VL,ZM}}
};  


(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)

DEFINITION[EWSB][DiracSpinors]={
 Fd ->{  DL, conj[DR]},
 Fe ->{  EL, conj[ER]},
 Fu ->{  UL, conj[UR]},
 Fv ->{  VL, conj[VL]},
 Chi ->{  cl, cr}
};

DEFINITION[EWSB][GaugeES]={
 Fd1 ->{  FdL, 0},
 Fd2 ->{  0, FdR},
 Fu1 ->{  Fu1, 0},
 Fu2 ->{  0, Fu2},
 Fe1 ->{  Fe1, 0},
 Fe2 ->{  0, Fe2}};



