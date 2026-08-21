// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

// Full Airbus FCOM Dataset - Complete & Unabridged Dataset for Pilots
// (تم الاحتفاظ بجميع الاختصارات دون حذف أي حرف كما طلبت)
final List<Map<String, String>> airbusData = [
  {"abbr": r"A>B", "term": r"A is greater than B"},
  {"abbr": r"A≥B", "term": r"A is greater than or equal to B"},
  {"abbr": r"A<B", "term": r"A is less than B"},
  {"abbr": r"A≤B", "term": r"A is less than or equal to B"},
  {"abbr": r"A/BRK", "term": r"Autobrake"},
  {"abbr": r"A/C", "term": r"Aircraft"},
  {"abbr": r"A/P", "term": r"Autopilot"},
  {"abbr": r"AP", "term": r"Autopilot"},
  {"abbr": r"A/S", "term": r"Airspeed"},
  {"abbr": r"A/SKID", "term": r"Anti-skid"},
  {"abbr": r"A/THR", "term": r"Auto Thrust"},
  {"abbr": r"AA", "term": r"Airworthiness Authorities"},
  {"abbr": r"AB", "term": r"Abort"},
  {"abbr": r"ABCU", "term": r"Alternate Braking Control Unit"},
  {"abbr": r"ABN", "term": r"Abnormal"},
  {"abbr": r"ABV", "term": r"Above"},
  {"abbr": r"AC", "term": r"Alternating Current"},
  {
    "abbr": r"ACARS",
    "term": r"ARINC Communication Addressing and Reporting System"
  },
  {"abbr": r"ACAS", "term": r"Airborne Collision Avoidance System"},
  {"abbr": r"ACCEL", "term": r"Acceleration"},
  {"abbr": r"ACC", "term": r"Active Clearance Control"},
  {"abbr": r"ACCU", "term": r"Accumulator"},
  {"abbr": r"ACP", "term": r"Audio Control Panel"},
  {"abbr": r"ACSC", "term": r"Air Conditioning System Controller"},
  {"abbr": r"ACT", "term": r"Additional Center Tank"},
  {"abbr": r"ADF", "term": r"Automatic Direction Finder"},
  {"abbr": r"ADIRS", "term": r"Air Data Inertial Reference System"},
  {"abbr": r"ADIRU", "term": r"Air Data Inertial Reference Unit"},
  {"abbr": r"ADM", "term": r"Air Data Module"},
  {"abbr": r"ADR", "term": r"Air Data Reference"},
  {"abbr": r"ADS-B", "term": r"Automatic Dependent Surveillance-Broadcast"},
  {"abbr": r"ADV", "term": r"Advisory"},
  {"abbr": r"AEVC", "term": r"Avionic Equipment Ventilation Controller"},
  {"abbr": r"AFM", "term": r"Airplane Flight Manual"},
  {"abbr": r"AFS", "term": r"Auto Flight System"},
  {"abbr": r"AGL", "term": r"Above Ground Level"},
  {"abbr": r"AIDS", "term": r"Aircraft Integrated Data System"},
  {"abbr": r"AIL", "term": r"Aileron"},
  {"abbr": r"AIME", "term": r"Autonomous Integrity Monitoring Extrapolation"},
  {"abbr": r"AIU", "term": r"Audio Interface Unit"},
  {"abbr": r"ALT", "term": r"Altitude"},
  {"abbr": r"ALTN", "term": r"Alternate"},
  {"abbr": r"AMI", "term": r"Airline Modifiable Information"},
  {"abbr": r"AMU", "term": r"Audio Management Unit"},
  {"abbr": r"ANT", "term": r"Antenna"},
  {"abbr": r"AOA", "term": r"Angle of Attack"},
  {"abbr": r"AOC", "term": r"Airline Operational Control"},
  {"abbr": r"APP", "term": r"Approach"},
  {"abbr": r"APPR", "term": r"Approach"},
  {"abbr": r"APPU", "term": r"Asymmetry Position Pick-off Unit"},
  {"abbr": r"APU", "term": r"Auxiliary Power Unit"},
  {"abbr": r"AR", "term": r"Authorization Required"},
  {"abbr": r"ARINC", "term": r"Aeronautical Radio Incorporated"},
  {"abbr": r"ARN", "term": r"Aircraft Registration Number"},
  {"abbr": r"ARP", "term": r"Aerospace Recommended Practice"},
  {"abbr": r"ARPT", "term": r"Airport"},
  {"abbr": r"ASAP", "term": r"As Soon As Possible"},
  {"abbr": r"ASI", "term": r"Air Speed Indicator"},
  {"abbr": r"ASP", "term": r"Audio Selector Panel"},
  {"abbr": r"ATC", "term": r"Air Traffic Control"},
  {"abbr": r"ATM", "term": r"Air Traffic Management"},
  {"abbr": r"ATN", "term": r"Aeronautical Telecommunications Network"},
  {"abbr": r"ATE", "term": r"Automatic Test Equipment"},
  {"abbr": r"ATIS", "term": r"Airbus Technical Information System"},
  {"abbr": r"ATS", "term": r"Auto Thrust System"},
  {"abbr": r"ATSAW", "term": r"Airborne Traffic Situational Awareness"},
  {"abbr": r"ATSU", "term": r"Air Traffic Service Unit"},
  {"abbr": r"ATT", "term": r"Attitude"},
  {"abbr": r"AUTO", "term": r"Automatic"},
  {"abbr": r"AVNCS", "term": r"Avionics"},
  {"abbr": r"AWY", "term": r"Airway"},
  {"abbr": r"B/C", "term": r"Back Course"},
  {"abbr": r"BARO", "term": r"Barometric"},
  {"abbr": r"BAT", "term": r"Battery"},
  {"abbr": r"BCL", "term": r"Battery Charge Limiter"},
  {"abbr": r"BCDS", "term": r"Bite Centralized Data System"},
  {"abbr": r"BCU", "term": r"Backup Control Unit"},
  {"abbr": r"BDDV", "term": r"Brake Dual Distribution Valve"},
  {"abbr": r"BITE", "term": r"Built-In Test Equipment"},
  {"abbr": r"BIU", "term": r"BITE Interface Unit"},
  {"abbr": r"BFE", "term": r"Buyer Furnished Equipment"},
  {"abbr": r"BFO", "term": r"Beat Frequency Oscillator"},
  {"abbr": r"BMC", "term": r"Bleed Monitoring Computer"},
  {"abbr": r"BNR", "term": r"Binary"},
  {"abbr": r"BRG", "term": r"Bearing"},
  {"abbr": r"BRK", "term": r"Brake"},
  {"abbr": r"BRT", "term": r"Bright"},
  {"abbr": r"BSCU", "term": r"Braking Steering Control Unit"},
  {"abbr": r"BTC", "term": r"Bus Tie Contactor"},
  {"abbr": r"BTL", "term": r"Bottle"},
  {"abbr": r"BUS", "term": r"Busbar"},
  {"abbr": r"C/B", "term": r"Circuit Breaker"},
  {"abbr": r"CB", "term": r"Circuit Breaker"},
  {"abbr": r"C/L", "term": r"Checklist"},
  {"abbr": r"CL", "term": r"Checklist"},
  {"abbr": r"CAB", "term": r"Cabin"},
  {"abbr": r"CAPT", "term": r"Captain, Capture"},
  {"abbr": r"CAS", "term": r"Calibrated Airspeed"},
  {"abbr": r"CAT", "term": r"Category"},
  {"abbr": r"CBMS", "term": r"Circuit Breaker Monitoring System"},
  {"abbr": r"CCD", "term": r"Cursor Control Device"},
  {"abbr": r"CDL", "term": r"Configuration Deviation List"},
  {"abbr": r"CDLS", "term": r"Cockpit Door Locking System"},
  {"abbr": r"CDSS", "term": r"Cockpit Door Surveillance System"},
  {"abbr": r"CDU", "term": r"Control Display Unit"},
  {"abbr": r"CF", "term": r"Cost of Fuel"},
  {"abbr": r"CFDIU", "term": r"Centralized Fault Display Interface Unit"},
  {"abbr": r"CFDS", "term": r"Centralized Fault Display System"},
  {"abbr": r"CG", "term": r"Center of Gravity"},
  {"abbr": r"CHAN", "term": r"Channel"},
  {"abbr": r"CHG", "term": r"Change"},
  {"abbr": r"CHK", "term": r"Check"},
  {"abbr": r"CI", "term": r"Cost Index"},
  {"abbr": r"CIDS", "term": r"Cabin Intercommunication Data System"},
  {"abbr": r"CKPT", "term": r"Cockpit"},
  {"abbr": r"CLB", "term": r"Climb"},
  {"abbr": r"CLR", "term": r"Clear"},
  {"abbr": r"CLSD", "term": r"Closed"},
  {"abbr": r"CM1(2)", "term": r"Crewmember 1 (left seat) or 2 (right seat)"},
  {"abbr": r"CM1", "term": r"Crewmember 1 (left seat)"},
  {"abbr": r"CM2", "term": r"Crewmember 2 (right seat)"},
  {"abbr": r"CMPTR", "term": r"Computer"},
  {
    "abbr": r"CMS",
    "term": r"Constant Mach Segment / Centralized Maintenance System"
  },
  {"abbr": r"CNSU", "term": r"Cabin Network Server Unit"},
  {"abbr": r"CO", "term": r"Company"},
  {"abbr": r"CO RTE", "term": r"Company Route"},
  {"abbr": r"COND", "term": r"Conditioning"},
  {"abbr": r"CONF", "term": r"Configuration"},
  {"abbr": r"CONT", "term": r"Continuous"},
  {"abbr": r"CPC", "term": r"Cabin Pressure Controller"},
  {"abbr": r"CPCU", "term": r"Cabin Pressure Controller Unit"},
  {"abbr": r"CPDLC", "term": r"Controller-Pilot Data Link Communication"},
  {"abbr": r"CRC", "term": r"Continuous Repetitive Chime"},
  {"abbr": r"CRG", "term": r"Cargo"},
  {"abbr": r"CRS", "term": r"Course"},
  {"abbr": r"CRT", "term": r"Cathode Ray Tube"},
  {"abbr": r"CRZ", "term": r"Cruise"},
  {"abbr": r"CSAS", "term": r"Conditioned Service Air System"},
  {"abbr": r"CSCU", "term": r"Cargo Smoke Control Unit"},
  {"abbr": r"CSD", "term": r"Constant Speed Drive"},
  {"abbr": r"CSMG", "term": r"Constant Speed Motor/Generator"},
  {"abbr": r"CSTR", "term": r"Constraint"},
  {"abbr": r"CT", "term": r"Cost of Time"},
  {"abbr": r"CTL", "term": r"Control"},
  {"abbr": r"CTL PNL", "term": r"Control Panel"},
  {"abbr": r"CTR", "term": r"Center"},
  {"abbr": r"CVR", "term": r"Cockpit Voice Recorder"},
  {"abbr": r"DA", "term": r"Drift Angle"},
  {"abbr": r"DAC", "term": r"Digital to Analog Converter"},
  {"abbr": r"DAR", "term": r"Digital AIDS Recorder"},
  {"abbr": r"DC", "term": r"Direct Current"},
  {"abbr": r"DCDU", "term": r"Datalink Control and Display Unit"},
  {"abbr": r"DCL", "term": r"Digital Cabin Logbook"},
  {"abbr": r"DDRM", "term": r"Digital Distance and Radio Magnetic Indicator"},
  {"abbr": r"DECEL", "term": r"Deceleration"},
  {"abbr": r"DES", "term": r"Descent"},
  {"abbr": r"DEST", "term": r"Destination"},
  {"abbr": r"DET", "term": r"Detection, Detector"},
  {"abbr": r"DFA", "term": r"Delayed Flap Approach"},
  {"abbr": r"DFDR", "term": r"Digital Flight Data Recorder"},
  {"abbr": r"DH", "term": r"Decision Height"},
  {"abbr": r"DIR", "term": r"Direction"},
  {"abbr": r"DIR TO", "term": r"Direct To"},
  {"abbr": r"DISC", "term": r"Disconnect"},
  {"abbr": r"DISCH", "term": r"Discharge"},
  {"abbr": r"DIST", "term": r"Distance"},
  {"abbr": r"DITS", "term": r"Digital Information Transfer System"},
  {"abbr": r"DIV", "term": r"Diverter"},
  {"abbr": r"DMC", "term": r"Display Management Computer"},
  {"abbr": r"DME", "term": r"Distance Measuring Equipment"},
  {"abbr": r"DMU", "term": r"Data Management Unit (Aids)"},
  {"abbr": r"DN", "term": r"Down"},
  {"abbr": r"DSDL", "term": r"Dedicated Serial Data Link"},
  {"abbr": r"DTG", "term": r"Distance To Go"},
  {"abbr": r"DTO", "term": r"Derated Takeoff"},
  {"abbr": r"DU", "term": r"Display Unit / Documentary Unit"},
  {"abbr": r"EWD", "term": r"Engine/Warning Display"},
  {"abbr": r"ECAM", "term": r"Electronic Centralized Aircraft Monitoring"},
  {"abbr": r"ECAS", "term": r"Emergency Cockpit Alerting System"},
  {"abbr": r"ECB", "term": r"Electronic Control Box (APU)"},
  {"abbr": r"ECM", "term": r"Engine Condition Monitoring"},
  {"abbr": r"ECON", "term": r"Economic"},
  {"abbr": r"ECP", "term": r"ECAM Control Panel"},
  {"abbr": r"ECS", "term": r"Environmental Control System"},
  {"abbr": r"ECU", "term": r"Engine Control Unit"},
  {"abbr": r"EDP", "term": r"Engine-Driven Pump"},
  {"abbr": r"EEC", "term": r"Electronic Engine Computer"},
  {"abbr": r"EFB", "term": r"Electronic Flight Bag"},
  {"abbr": r"EFCS", "term": r"Electronic Flight Control System"},
  {"abbr": r"EFIS", "term": r"Electronic Flight Instruments System"},
  {"abbr": r"EFOB", "term": r"Estimated Fuel On Board"},
  {"abbr": r"EGPWS", "term": r"Enhanced Ground Proximity Warning System"},
  {"abbr": r"EGT", "term": r"Exhaust Gas Temperature"},
  {"abbr": r"EIS", "term": r"Electronic Instruments System"},
  {"abbr": r"EIU", "term": r"Engine Interface Unit"},
  {"abbr": r"ELAC", "term": r"Elevator Aileron Computer"},
  {"abbr": r"ELEC", "term": r"Electrics"},
  {"abbr": r"ELT", "term": r"Emergency Locator Transmitter"},
  {"abbr": r"ELEV", "term": r"Elevator"},
  {"abbr": r"ELV", "term": r"Elevation"},
  {"abbr": r"EMER", "term": r"Emergency"},
  {"abbr": r"EMER GEN", "term": r"Emergency Generator"},
  {"abbr": r"ENG", "term": r"Engine"},
  {"abbr": r"EO", "term": r"Engine-Out"},
  {"abbr": r"EOSID", "term": r"Engine-Out Standard Instrument Departure"},
  {"abbr": r"EPE", "term": r"Estimated Position Error (equal to EPU)"},
  {"abbr": r"EPR", "term": r"Engine Pressure Ratio"},
  {
    "abbr": r"EPU",
    "term": r"Emergency Power Unit / Estimated Position Uncertainty"
  },
  {"abbr": r"EROPS", "term": r"Extended Range Operation"},
  {"abbr": r"ESS", "term": r"Essential"},
  {"abbr": r"EST", "term": r"Estimated"},
  {"abbr": r"ETA", "term": r"Estimated Time of Arrival"},
  {"abbr": r"ETE", "term": r"Estimated Time Enroute"},
  {"abbr": r"ETOPS", "term": r"Extended Twin Operations"},
  {"abbr": r"ETP", "term": r"Equal Time Point"},
  {"abbr": r"EVMU", "term": r"Engine Vibration Monitoring Unit"},
  {"abbr": r"E/WD", "term": r"Engine/Warning Display"},
  {"abbr": r"EXP", "term": r"Expedite"},
  {"abbr": r"EXT PWR", "term": r"External Power"},
  {"abbr": r"EXTN", "term": r"Extension"},
  {"abbr": r"F", "term": r"Fuel"},
  {"abbr": r"FAA", "term": r"Federal Aviation Administration"},
  {"abbr": r"FAP", "term": r"Forward Attendant Panel"},
  {"abbr": r"F/C", "term": r"Flight Crew"},
  {"abbr": r"F/O", "term": r"First Officer"},
  {"abbr": r"FO", "term": r"First Officer"},
  {"abbr": r"FAC", "term": r"Flight Augmentation Computer"},
  {"abbr": r"FADEC", "term": r"Full Authority Digital Engine Control System"},
  {"abbr": r"FAF", "term": r"Final Approach Fix"},
  {"abbr": r"FAR", "term": r"Federal Aviation Regulations"},
  {"abbr": r"FAV", "term": r"Fan Air Valve"},
  {"abbr": r"FCDC", "term": r"Flight Control Data Concentrator"},
  {"abbr": r"FCMS", "term": r"Fuel Control and Monitoring System"},
  {"abbr": r"FCOM", "term": r"Flight Crew Operating Manual"},
  {"abbr": r"FCU", "term": r"Flight Control Unit"},
  {"abbr": r"FD", "term": r"Flight Director"},
  {"abbr": r"FDIMU", "term": r"Flight Data Interface and Management Unit"},
  {"abbr": r"FDIU", "term": r"Flight Data Interface Unit"},
  {"abbr": r"FDU", "term": r"Fire Detection Unit"},
  {"abbr": r"FEP", "term": r"Final End Point"},
  {"abbr": r"FF", "term": r"Fuel Flow"},
  {"abbr": r"FG", "term": r"Flight Guidance"},
  {"abbr": r"FGC", "term": r"Flight Guidance Computer"},
  {"abbr": r"F-G/S", "term": r"FLS Glide Slope"},
  {"abbr": r"FIDS", "term": r"Fault Isolation and Detection System"},
  {"abbr": r"FL", "term": r"Flight Level"},
  {"abbr": r"FLHV", "term": r"Fuel Lower Heating Value"},
  {"abbr": r"F-LOC", "term": r"FLS Localizer"},
  {"abbr": r"FLP", "term": r"Flap"},
  {"abbr": r"FLS", "term": r"FMS Landing System"},
  {"abbr": r"FLT", "term": r"Flight"},
  {"abbr": r"F/CTL", "term": r"Flight Control"},
  {"abbr": r"FLT CTL", "term": r"Flight Control"},
  {"abbr": r"FLXTO", "term": r"Flexible Takeoff"},
  {"abbr": r"FM", "term": r"Flight Management"},
  {"abbr": r"FMA", "term": r"Flight Mode Annunciator"},
  {"abbr": r"FMGC", "term": r"Flight Management and Guidance Computer"},
  {"abbr": r"FMGS", "term": r"Flight Management and Guidance System"},
  {"abbr": r"FMS", "term": r"Flight Management System"},
  {"abbr": r"FNL", "term": r"Final"},
  {"abbr": r"FOB", "term": r"Fuel On Board"},
  {"abbr": r"FOM", "term": r"Figure Of Merit"},
  {"abbr": r"FPA", "term": r"Flight Path Angle"},
  {"abbr": r"F-PLN", "term": r"Flight Plan"},
  {"abbr": r"FPD", "term": r"Flight Path Director"},
  {"abbr": r"FPPU", "term": r"Feedback Position Pick-off Unit"},
  {"abbr": r"FPV", "term": r"Flight Path Vector"},
  {"abbr": r"FQI", "term": r"Fuel Quantity Indication"},
  {"abbr": r"FQU", "term": r"Fuel Quantity Unit"},
  {"abbr": r"FREQ", "term": r"Frequency"},
  {"abbr": r"FRT", "term": r"Front"},
  {"abbr": r"FRV", "term": r"Fuel Return Valve"},
  {"abbr": r"FU", "term": r"Fuel Used"},
  {"abbr": r"FWC", "term": r"Flight Warning Computer"},
  {"abbr": r"FWD", "term": r"Forward"},
  {"abbr": r"FWS", "term": r"Flight Warning System"},
  {"abbr": r"G/S", "term": r"Glideslope"},
  {"abbr": r"GA", "term": r"Go-Around"},
  {"abbr": r"GAPCU", "term": r"Ground and Auxiliary Power Control Unit"},
  {"abbr": r"GBAS", "term": r"Ground Based Augmentation System"},
  {"abbr": r"GCU", "term": r"Generator Control Unit"},
  {"abbr": r"GDU", "term": r"Group of Documentary Unit"},
  {"abbr": r"GEN", "term": r"Generator"},
  {"abbr": r"GES", "term": r"Ground Earth Station"},
  {"abbr": r"GLC", "term": r"Generator Line Contactor"},
  {"abbr": r"GLS", "term": r"GBAS / GNSS Landing System"},
  {"abbr": r"GMT", "term": r"Greenwich Mean Time"},
  {"abbr": r"GND", "term": r"Ground"},
  {"abbr": r"GND TEMP", "term": r"Ground Temperature"},
  {"abbr": r"GPCU", "term": r"Ground Power Control Unit"},
  {
    "abbr": r"GPIRS",
    "term": r"Global Positioning and Inertial Reference System"
  },
  {"abbr": r"GPS", "term": r"Global Positioning System"},
  {"abbr": r"GPWS", "term": r"Ground Proximity Warning System"},
  {"abbr": r"GRND", "term": r"Ground"},
  {"abbr": r"GRP", "term": r"Geographic Reference Point"},
  {"abbr": r"GRVTY", "term": r"Gravity"},
  {"abbr": r"GS", "term": r"Ground Speed"},
  {"abbr": r"GW", "term": r"Gross Weight"},
  {"abbr": r"HC", "term": r"Harness Connector"},
  {"abbr": r"HCU", "term": r"Hydraulic Control Unit"},
  {"abbr": r"HDG", "term": r"Heading"},
  {"abbr": r"HDG/S", "term": r"Heading Selected"},
  {"abbr": r"HDL", "term": r"Handle"},
  {"abbr": r"HF", "term": r"High Frequency"},
  {"abbr": r"HI", "term": r"High"},
  {"abbr": r"HLD", "term": r"Hold"},
  {"abbr": r"HM", "term": r"Holding Pattern with a Manual Termination"},
  {"abbr": r"HMU", "term": r"Hydra-Mechanical Unit"},
  {"abbr": r"HMS", "term": r"Heat Management System"},
  {"abbr": r"HP", "term": r"High Pressure"},
  {"abbr": r"HPA", "term": r"Hectopascal"},
  {"abbr": r"HPV", "term": r"High Pressure Valve"},
  {"abbr": r"HUD", "term": r"Head Up Display"},
  {"abbr": r"HYD", "term": r"Hydraulic"},
  {"abbr": r"I/O", "term": r"Inputs/Outputs"},
  {"abbr": r"IVP", "term": r"Input or Intercept Profile"},
  {"abbr": r"IAF", "term": r"Initial Approach Fix"},
  {"abbr": r"IAS", "term": r"Indicated Airspeed"},
  {"abbr": r"IATA", "term": r"International Air Transport Association"},
  {"abbr": r"ICAO", "term": r"International Civil Aviation Organization"},
  {"abbr": r"IDENT", "term": r"Identification"},
  {"abbr": r"IDG", "term": r"Integrated Drive Generator"},
  {"abbr": r"IFE", "term": r"In Flight Entertainment"},
  {"abbr": r"IFR", "term": r"Instrument Flight Rules"},
  {"abbr": r"IGGS", "term": r"Inert Gas Generation System"},
  {"abbr": r"IGN", "term": r"Ignition"},
  {"abbr": r"ILS", "term": r"Instrument Landing System"},
  {"abbr": r"IM", "term": r"Inner Marker"},
  {"abbr": r"IMM", "term": r"Immediate"},
  {"abbr": r"INB", "term": r"Inbound"},
  {"abbr": r"INBO", "term": r"Inboard"},
  {"abbr": r"INCREM", "term": r"Increment"},
  {"abbr": r"INIT", "term": r"Initialization"},
  {"abbr": r"INOP", "term": r"Inoperative"},
  {"abbr": r"INR", "term": r"Inner"},
  {"abbr": r"INST", "term": r"Instrument"},
  {"abbr": r"INTCP", "term": r"Intercept"},
  {"abbr": r"INV", "term": r"Inverter"},
  {"abbr": r"IP", "term": r"Intermediate Pressure"},
  {"abbr": r"IPC", "term": r"Intermediate Pressure Check valve"},
  {"abbr": r"IPPU", "term": r"Instrumentation Position Pick-off Unit"},
  {"abbr": r"IR", "term": r"Inertial Reference"},
  {"abbr": r"IRS", "term": r"Inertial Reference System"},
  {"abbr": r"ISA", "term": r"International Standard Atmosphere"},
  {"abbr": r"ISDU", "term": r"Initial System Display Unit"},
  {"abbr": r"ISIS", "term": r"Integrated Standby Instrument System"},
  {"abbr": r"ISOL", "term": r"Isolation"},
  {"abbr": r"ISPSS", "term": r"In Seat Power Supply System"},
  {"abbr": r"L/G", "term": r"Landing Gear"},
  {"abbr": r"LAF", "term": r"Load Alleviation Function"},
  {"abbr": r"LAT", "term": r"Latitude"},
  {"abbr": r"LAT REV", "term": r"Lateral Revision"},
  {"abbr": r"LAV", "term": r"Lavatory"},
  {"abbr": r"LCD", "term": r"Liquid Crystal Display"},
  {"abbr": r"LCN", "term": r"Load Classification Number"},
  {
    "abbr": r"LDA",
    "term": r"Landing Distance Available / Localizer Directional Aid"
  },
  {"abbr": r"LDG", "term": r"Landing"},
  {"abbr": r"LDS", "term": r"Laptop Docking Station"},
  {"abbr": r"LED", "term": r"Light Emitting Diode"},
  {"abbr": r"LEDU", "term": r"List of Effective Documentary Units"},
  {
    "abbr": r"LEOEB",
    "term": r"List of Effective Operations Engineering Bulletins"
  },
  {"abbr": r"LESS", "term": r"List of Effective Section/Subsections"},
  {"abbr": r"LF", "term": r"Low Frequency"},
  {"abbr": r"LGCIU", "term": r"Landing Gear Control Interface Unit"},
  {"abbr": r"LGPIU", "term": r"Landing Gear Position Indicator Unit"},
  {"abbr": r"LH", "term": r"Right-Hand / Left-Hand"},
  {"abbr": r"LIM", "term": r"Limitation"},
  {"abbr": r"LIS", "term": r"Localizer Inertial Smoothing"},
  {"abbr": r"LK", "term": r"Lock"},
  {"abbr": r"LL", "term": r"Latitude/Longitude"},
  {"abbr": r"LLS", "term": r"Left-Line Select key"},
  {"abbr": r"LO", "term": r"Low"},
  {"abbr": r"LOC", "term": r"Localizer"},
  {"abbr": r"LONG", "term": r"Longitude"},
  {"abbr": r"LP", "term": r"Low Pressure"},
  {"abbr": r"LRRA", "term": r"Low Range Radio Altimeter"},
  {"abbr": r"LRU", "term": r"Line Replaceable Unit"},
  {"abbr": r"LS", "term": r"Loudspeaker"},
  {"abbr": r"LSK", "term": r"Line Select Key"},
  {"abbr": r"LT", "term": r"Light"},
  {"abbr": r"LTS", "term": r"Load and Trim Sheet"},
  {"abbr": r"LVL", "term": r"Level"},
  {"abbr": r"LVL/CH", "term": r"Level Change"},
  {"abbr": r"LVR", "term": r"Lever"},
  {"abbr": r"LW", "term": r"Landing Weight"},
  {"abbr": r"MABH", "term": r"Minimum Approach Break-off Height"},
  {"abbr": r"MAC", "term": r"Mean Aerodynamic Chord"},
  {"abbr": r"MAG", "term": r"Magnetic"},
  {"abbr": r"MAG DEC", "term": r"Magnetic Declination"},
  {"abbr": r"MAG VAR", "term": r"Magnetic Variation"},
  {"abbr": r"MAINT", "term": r"Maintenance"},
  {"abbr": r"MAN", "term": r"Manual"},
  {"abbr": r"MAP", "term": r"Missed Approach Point"},
  {"abbr": r"MAX", "term": r"Maximum"},
  {"abbr": r"MAX CLB", "term": r"Maximum Climb"},
  {"abbr": r"MAX DES", "term": r"Maximum Descent"},
  {"abbr": r"MAX END", "term": r"Maximum Endurance"},
  {"abbr": r"MC", "term": r"Master Caution"},
  {"abbr": r"MCDU", "term": r"Multipurpose Control and Display Unit"},
  {"abbr": r"MCT", "term": r"Maximum Continuous Thrust"},
  {"abbr": r"MCU", "term": r"Modular Concept Unit"},
  {"abbr": r"MDA", "term": r"Minimum Descent Altitude"},
  {"abbr": r"MDDU", "term": r"Multifunction Disk Drive Unit"},
  {"abbr": r"MDH", "term": r"Minimum Descent Height"},
  {"abbr": r"MECH", "term": r"Mechanic"},
  {"abbr": r"MEA", "term": r"Minimum En Route Altitude"},
  {"abbr": r"MED", "term": r"Medium"},
  {"abbr": r"MEL", "term": r"Minimum Equipment List"},
  {"abbr": r"MFA", "term": r"Memorized Fault Annunciator"},
  {"abbr": r"MIN", "term": r"Minimum"},
  {"abbr": r"MKR", "term": r"Marker"},
  {"abbr": r"MLA", "term": r"Maneuver Load Alleviation"},
  {"abbr": r"MLS", "term": r"Microwave Landing System"},
  {"abbr": r"MLW", "term": r"Maximum Landing Weight"},
  {"abbr": r"MM", "term": r"Middle Marker"},
  {"abbr": r"MMEL", "term": r"Master Minimum Equipment List"},
  {"abbr": r"MMO", "term": r"Maximum Operating Mach"},
  {"abbr": r"MMR", "term": r"Multi Mode Receiver"},
  {"abbr": r"MN", "term": r"Mach number"},
  {"abbr": r"MORA", "term": r"Minimum Off Route Altitude"},
  {"abbr": r"MRIU", "term": r"Maintenance and Recording Interface Unit"},
  {"abbr": r"MSA", "term": r"Minimum Safe Altitude"},
  {"abbr": r"MSG", "term": r"Message"},
  {"abbr": r"MSL", "term": r"Mean Sea Level"},
  {"abbr": r"MSU", "term": r"Mode Selector Unit"},
  {"abbr": r"MTBF", "term": r"Mean Time Between Failure"},
  {"abbr": r"MTOW", "term": r"Maximum Takeoff Weight"},
  {"abbr": r"MZFW", "term": r"Maximum Zero Fuel Weight"},
  {"abbr": r"N/A", "term": r"Not Applicable"},
  {"abbr": r"NA", "term": r"Not Applicable"},
  {"abbr": r"N1", "term": r"Low Pressure Rotor Speed (in %)"},
  {"abbr": r"N2", "term": r"High Pressure Rotor Speed (in %)"},
  {"abbr": r"NACA", "term": r"National Advisory Committee for Aeronautics"},
  {"abbr": r"NAI", "term": r"Engine Nacelle Anti-Ice"},
  {"abbr": r"NAV", "term": r"Navigation"},
  {"abbr": r"NAVAID", "term": r"Navigation Aid"},
  {"abbr": r"NCD", "term": r"Non Computed Data"},
  {"abbr": r"ND", "term": r"Navigation Display"},
  {"abbr": r"NDB", "term": r"Non Directional Beacon"},
  {"abbr": r"NLG", "term": r"Nose Landing Gear"},
  {"abbr": r"NORM", "term": r"Normal"},
  {"abbr": r"NW", "term": r"Nosewheel"},
  {"abbr": r"NWS", "term": r"Nosewheel Steering"},
  {"abbr": r"O/P", "term": r"Output"},
  {"abbr": r"OANS", "term": r"On-board Airport Navigation System"},
  {"abbr": r"OAT", "term": r"Outside Air Temperature"},
  {"abbr": r"OBRM", "term": r"On Board Replaceable Module"},
  {"abbr": r"OEB", "term": r"Operations Engineering Bulletin"},
  {"abbr": r"OFF/R", "term": r"Off Reset"},
  {"abbr": r"OFST", "term": r"Offset"},
  {"abbr": r"OIS", "term": r"Onboard Information System"},
  {"abbr": r"OIT", "term": r"Onboard Information Terminal"},
  {"abbr": r"OM", "term": r"Outer Marker"},
  {"abbr": r"OP", "term": r"Open"},
  {"abbr": r"OPP", "term": r"Opposite"},
  {"abbr": r"OPS", "term": r"Operations"},
  {"abbr": r"OPT", "term": r"Optimum"},
  {"abbr": r"OUTB", "term": r"Outbound"},
  {"abbr": r"OUTR", "term": r"Outer"},
  {"abbr": r"OVBD", "term": r"Overboard"},
  {"abbr": r"OVHD", "term": r"Overhead"},
  {"abbr": r"OVHT", "term": r"Overheat"},
  {"abbr": r"OVRD", "term": r"Override"},
  {"abbr": r"OVSPD", "term": r"Overspeed"},
  {"abbr": r"OXY", "term": r"Oxygen"},
  {"abbr": r"P/N", "term": r"Part Number"},
  {"abbr": r"PN", "term": r"Part Number"},
  {"abbr": r"PA", "term": r"Passenger Address"},
  {"abbr": r"P-ALT", "term": r"Profile Altitude"},
  {"abbr": r"PAX", "term": r"Passenger"},
  {"abbr": r"PBE", "term": r"Portable Breathing Equipment"},
  {"abbr": r"P-CLB", "term": r"Profile Climb"},
  {"abbr": r"PCU", "term": r"Power Control Unit"},
  {"abbr": r"P-DES", "term": r"Profile Descent"},
  {"abbr": r"PDB", "term": r"Performance Data Base"},
  {"abbr": r"PDU", "term": r"Pilot Display Unit"},
  {"abbr": r"PERF", "term": r"Performance"},
  {"abbr": r"PES", "term": r"Passenger Entertainment System"},
  {"abbr": r"PF", "term": r"Pilot Flying"},
  {"abbr": r"PFC", "term": r"Porous Friction Course"},
  {"abbr": r"PFD", "term": r"Primary Flight Display"},
  {"abbr": r"PHC", "term": r"Probes Heat Computer"},
  {"abbr": r"P-MACH", "term": r"Profile Mach"},
  {"abbr": r"PM", "term": r"Pilot Monitoring"},
  {"abbr": r"PNL", "term": r"Panel"},
  {"abbr": r"POB", "term": r"Pressure Off Brake"},
  {"abbr": r"POS", "term": r"Position"},
  {"abbr": r"PPOS", "term": r"Present Position"},
  {"abbr": r"PPU", "term": r"Position Pick-off Unit"},
  {"abbr": r"PR", "term": r"Pressure"},
  {"abbr": r"PRED", "term": r"Prediction"},
  {"abbr": r"PRESS", "term": r"Pressure, Pressurization"},
  {"abbr": r"PROC", "term": r"Procedure"},
  {"abbr": r"PROC T", "term": r"Procedure Turn"},
  {"abbr": r"PROF", "term": r"Profile"},
  {"abbr": r"PROG", "term": r"Progress"},
  {"abbr": r"PROTEC", "term": r"Protection"},
  {"abbr": r"P-SPEED", "term": r"Profile Speed"},
  {"abbr": r"PSL", "term": r"Product Structure Level"},
  {"abbr": r"PSU", "term": r"Passenger Service Unit"},
  {"abbr": r"PT", "term": r"Point"},
  {"abbr": r"PTR", "term": r"Printer"},
  {"abbr": r"PTT", "term": r"Push To Talk"},
  {"abbr": r"PTU", "term": r"Power Transfer Unit (Hydraulic)"},
  {"abbr": r"PVI", "term": r"Paravisual Indicator"},
  {"abbr": r"PWR", "term": r"Power"},
  {"abbr": r"PWS", "term": r"Predictive Windshear System"},
  {"abbr": r"QAR", "term": r"Quick Access Recorder"},
  {"abbr": r"QFE", "term": r"Field Elevation Atmosphere Pressure"},
  {"abbr": r"QFU", "term": r"Runway Heading"},
  {
    "abbr": r"QNE",
    "term": r"Sea Level Standard Atmosphere Pressure (1013 hPa)"
  },
  {"abbr": r"QNH", "term": r"Sea Level Atmosphere Pressure"},
  {"abbr": r"QRH", "term": r"Quick Reference Handbook"},
  {"abbr": r"QT", "term": r"Quart (US)"},
  {"abbr": r"QTY", "term": r"Quantity"},
  {"abbr": r"R", "term": r"Radio/Inertial"},
  {"abbr": r"RA", "term": r"Radio Altimeter / Resolution Advisory"},
  {"abbr": r"RACC", "term": r"Rotor Active Clearance Control"},
  {"abbr": r"RAD", "term": r"Radio"},
  {"abbr": r"RAIM", "term": r"Receiver Autonomous Integrity Monitoring"},
  {"abbr": r"RAT", "term": r"Ram Air Turbine"},
  {"abbr": r"RATC", "term": r"Remote ATC Box"},
  {"abbr": r"RCDR", "term": r"Recorder"},
  {"abbr": r"RCL", "term": r"Recall"},
  {"abbr": r"RCVR", "term": r"Receiver"},
  {"abbr": r"REAC", "term": r"Reactive"},
  {"abbr": r"REC", "term": r"Recommended"},
  {"abbr": r"RED", "term": r"Reduction"},
  {"abbr": r"REG", "term": r"Regulation"},
  {"abbr": r"REL", "term": r"Release"},
  {"abbr": r"REV", "term": r"Reverse"},
  {"abbr": r"RH", "term": r"Right-Hand"},
  {"abbr": r"RLSK", "term": r"Right Line Select Key"},
  {"abbr": r"RMI", "term": r"Radio Magnetic Indicator"},
  {"abbr": r"RMP", "term": r"Radio Management Panel"},
  {"abbr": r"RNAV", "term": r"Area Navigation"},
  {"abbr": r"RNG", "term": r"Range"},
  {"abbr": r"RNP", "term": r"Required Navigation Performance"},
  {"abbr": r"ROP", "term": r"Runway Overrun Protection"},
  {"abbr": r"ROPS", "term": r"Runway Overrun Prevention System"},
  {"abbr": r"ROW", "term": r"Runway Overrun Warning"},
  {"abbr": r"RPCU", "term": r"Residual Pressure Control Unit"},
  {"abbr": r"RPM", "term": r"Revolution Per Minute"},
  {"abbr": r"RPTG", "term": r"Repeating"},
  {"abbr": r"RQRD", "term": r"Required"},
  {"abbr": r"RSV", "term": r"Reserves"},
  {"abbr": r"RTE", "term": r"Route"},
  {"abbr": r"RTL", "term": r"Rudder Travel Limit"},
  {"abbr": r"RTO", "term": r"Rejected Takeoff"},
  {"abbr": r"RTOW", "term": r"Regulatory Takeoff Weight"},
  {"abbr": r"RUD", "term": r"Rudder"},
  {"abbr": r"RVSM", "term": r"Reduced Vertical Separation Minimum"},
  {"abbr": r"RWY", "term": r"Runway"},
  {"abbr": r"S", "term": r"South"},
  {"abbr": r"S/C", "term": r"Step Climb"},
  {"abbr": r"S/D", "term": r"Step Descent / Shut Down"},
  {"abbr": r"S/F", "term": r"Slats/Flaps"},
  {"abbr": r"S/N", "term": r"Serial Number"},
  {"abbr": r"SN", "term": r"Serial Number"},
  {
    "abbr": r"SAAAR",
    "term": r"Special Aircrew and Aircraft Authorization Required"
  },
  {"abbr": r"SAT", "term": r"Static Air Temperature"},
  {"abbr": r"SATCOM", "term": r"Satellite Communication"},
  {"abbr": r"SC", "term": r"Single Chime"},
  {"abbr": r"SCP", "term": r"Software Control Panel"},
  {"abbr": r"SD", "term": r"System Display"},
  {"abbr": r"SDAC", "term": r"System Data Acquisition Concentrator"},
  {"abbr": r"SDCU", "term": r"Smoke Detection Control Unit"},
  {"abbr": r"SDF", "term": r"Simplified Directional Facility"},
  {"abbr": r"SEC", "term": r"Spoiler Elevator Computer"},
  {"abbr": r"SEL", "term": r"Selector"},
  {"abbr": r"SFCC", "term": r"Slat/Flap Control Computer"},
  {"abbr": r"SFE", "term": r"Seller-Furnished Equipment"},
  {"abbr": r"SID", "term": r"Standard Instrument Departure"},
  {"abbr": r"SIM", "term": r"Simulation"},
  {"abbr": r"SLT", "term": r"Slat"},
  {"abbr": r"SPD", "term": r"Speed"},
  {"abbr": r"SPD LIM", "term": r"Speed Limit"},
  {"abbr": r"SPLR", "term": r"Spoiler"},
  {"abbr": r"SRS", "term": r"Speed Reference System"},
  {"abbr": r"STAR", "term": r"Standard Terminal Arrival Route"},
  {"abbr": r"STAT", "term": r"Static"},
  {"abbr": r"STAT INV", "term": r"Static Inverter"},
  {"abbr": r"STBY", "term": r"Standby"},
  {"abbr": r"STD", "term": r"Standard"},
  {"abbr": r"STEER", "term": r"Steering"},
  {"abbr": r"STRG", "term": r"Steering"},
  {"abbr": r"STS", "term": r"Status"},
  {"abbr": r"SWTG", "term": r"Switching"},
  {"abbr": r"SYNC", "term": r"Synchronize"},
  {"abbr": r"SYS", "term": r"System"},
  {"abbr": r"T.O", "term": r"Takeoff"},
  {"abbr": r"T/O", "term": r"Takeoff"},
  {"abbr": r"TO", "term": r"Takeoff"},
  {"abbr": r"T/C", "term": r"Top of Climb"},
  {"abbr": r"T/D", "term": r"Top of Descent"},
  {"abbr": r"TA", "term": r"Traffic Advisory"},
  {"abbr": r"TAC", "term": r"Taxiing Aid Camera"},
  {"abbr": r"TACAN", "term": r"Tactical Air Navigation"},
  {"abbr": r"TACT", "term": r"Tactical"},
  {"abbr": r"TAS", "term": r"True Air Speed"},
  {"abbr": r"TAT", "term": r"Total Air Temperature"},
  {"abbr": r"TAU", "term": r"Time to intercept"},
  {"abbr": r"TAWS", "term": r"Terrain Awareness and Warning System"},
  {"abbr": r"TBC", "term": r"To Be Confirmed"},
  {"abbr": r"TBD", "term": r"To Be Determined"},
  {"abbr": r"TCAS", "term": r"Traffic Alert and Collision Avoidance System"},
  {"abbr": r"TDU", "term": r"Temporary Documentary Unit"},
  {"abbr": r"TEMP", "term": r"Temperature"},
  {"abbr": r"TFTS", "term": r"Terrestrial Flight Telephone System"},
  {"abbr": r"TGT", "term": r"Target"},
  {"abbr": r"THR", "term": r"Thrust"},
  {"abbr": r"THS", "term": r"Trimmable Horizontal Stabilizer"},
  {"abbr": r"TK", "term": r"Tank / Track angle"},
  {"abbr": r"TKE", "term": r"Track Angle Error"},
  {"abbr": r"TLA", "term": r"Throttle Lever Angle"},
  {"abbr": r"TLU", "term": r"Travel Limitation Unit"},
  {"abbr": r"TMR", "term": r"Timer"},
  {"abbr": r"TOGA", "term": r"Takeoff-Go-Around"},
  {"abbr": r"TOGW", "term": r"Takeoff Gross Weight"},
  {"abbr": r"TOW", "term": r"Takeoff Weight"},
  {"abbr": r"T-P", "term": r"Turn Point"},
  {"abbr": r"TPIS", "term": r"Tire Pressure Indicating System"},
  {"abbr": r"TR", "term": r"Transformer Rectifier"},
  {"abbr": r"T-R", "term": r"Transmitter-Receiver"},
  {"abbr": r"TRANS", "term": r"Transition"},
  {"abbr": r"TRK", "term": r"Track"},
  {"abbr": r"TROPO", "term": r"Tropopause"},
  {"abbr": r"TRU", "term": r"Transformer Rectifier Unit"},
  {"abbr": r"TRV", "term": r"Travel"},
  {"abbr": r"TSM", "term": r"Trouble Shooting Manual"},
  {"abbr": r"TTG", "term": r"Time to Go"},
  {"abbr": r"TVMC", "term": r"Minimum Control Speed Temperature"},
  {"abbr": r"TWY", "term": r"Taxiway"},
  {"abbr": r"UFD", "term": r"Unit Fault Data"},
  {"abbr": r"ULB", "term": r"Underwater Locator Beacon"},
  {"abbr": r"UNLK", "term": r"Unlock"},
  {"abbr": r"UP", "term": r"Up, Upper"},
  {"abbr": r"UTC", "term": r"Universal Coordinated Time"},
  {"abbr": r"V/S", "term": r"Vertical Speed"},
  {"abbr": r"V1", "term": r"Decision Speed"},
  {"abbr": r"V2", "term": r"Takeoff Safety Speed"},
  {"abbr": r"VAPP", "term": r"Approach Speed"},
  {"abbr": r"VBV", "term": r"Variable Bypass Valve"},
  {"abbr": r"VC", "term": r"Calibrated airspeed"},
  {"abbr": r"VDEV", "term": r"Vertical Deviation"},
  {"abbr": r"VEL", "term": r"Velocity"},
  {"abbr": r"VERT", "term": r"Vertical"},
  {"abbr": r"VERT REV", "term": r"Vertical Revisor"},
  {"abbr": r"VFE", "term": r"Maximum Speed for each Flap configuration"},
  {"abbr": r"VFEN", "term": r"IVFE Next"},
  {"abbr": r"VFTO", "term": r"Final Takeoff Speed"},
  {"abbr": r"VHF", "term": r"Very High Frequency"},
  {"abbr": r"VHV", "term": r"Very High Voltage"},
  {"abbr": r"VIB", "term": r"Vibration"},
  {"abbr": r"VIP", "term": r"Vertical Intersection Point"},
  {"abbr": r"VLE", "term": r"Maximum Landing Gear Extended Speed"},
  {"abbr": r"VLS", "term": r"Lowest Selectable Speed"},
  {"abbr": r"VLV", "term": r"Valve"},
  {"abbr": r"VM", "term": r"Maneuvering Speed"},
  {"abbr": r"VMAX", "term": r"Maximum Allowable Speed"},
  {"abbr": r"VMCA", "term": r"Minimum Control Speed in the Air"},
  {"abbr": r"VMCG", "term": r"Minimum Control Speed on Ground"},
  {"abbr": r"VMCL", "term": r"Minimum Control Speed at Landing"},
  {"abbr": r"VMIN", "term": r"Minimum Operating Speed"},
  {"abbr": r"VMO", "term": r"Maximum Operating Speed"},
  {"abbr": r"VMU", "term": r"Minimum Unstick Speed"},
  {"abbr": r"VOR", "term": r"VHF Omnidirectional Range"},
  {"abbr": r"VOR-D", "term": r"VOR-DME"},
  {"abbr": r"VR", "term": r"Rotation Speed"},
  {"abbr": r"VREF", "term": r"Landing Reference Speed"},
  {"abbr": r"VSI", "term": r"Vertical Speed Indicator"},
  {"abbr": r"VSV", "term": r"Variable Stator Vane"},
  {"abbr": r"VU", "term": r"Visual Unit"},
  {"abbr": r"WAI", "term": r"Wing Anti-Ice"},
  {"abbr": r"WARN", "term": r"Warning"},
  {"abbr": r"WBC", "term": r"Weight and Balance Computer"},
  {"abbr": r"WBS", "term": r"Weight and Balance System"},
  {"abbr": r"WGD", "term": r"Windshield Guidance Display"},
  {"abbr": r"WHC", "term": r"Window Heat Computer"},
  {"abbr": r"WNDW", "term": r"Window"},
  {"abbr": r"WPT", "term": r"Waypoint"},
  {"abbr": r"WSHLD", "term": r"Windshield"},
  {"abbr": r"WT", "term": r"Weight"},
  {"abbr": r"WTB", "term": r"Wing Tip Brake"},
  {"abbr": r"WXR", "term": r"Weather Radar"},
  {"abbr": r"XBLD", "term": r"Crossbleed"},
  {"abbr": r"XCVR", "term": r"Transceiver"},
  {"abbr": r"XFR", "term": r"Transfer"},
  {"abbr": r"XMTR", "term": r"Transmitter"},
  {"abbr": r"XPDR", "term": r"Transponder"},
  {"abbr": r"XTK", "term": r"Crosstrack Error"},
  {"abbr": r"ZFCG", "term": r"Zero Fuel Center of Gravity"},
  {"abbr": r"ZFW", "term": r"Zero Fuel Weight"},
  {"abbr": r"ZFWCG", "term": r"Zero Fuel Weight Center of Gravity field"}
];

// اللون السماوي الموحد لجميع العناوين والأيقونات الأساسية
const Color cyanColor = Color(0xFF38BDF8);

class AirbusDictionaryApp extends StatefulWidget {
  final double? width;
  final double? height;

  final String? image1Url;
  final String? image2Url;

  final Future Function()? onTermsClick;
  final Future Function()? onPrivacyClick;

  const AirbusDictionaryApp({
    Key? key,
    this.width,
    this.height,
    this.image1Url,
    this.image2Url,
    this.onTermsClick,
    this.onPrivacyClick,
  }) : super(key: key);

  @override
  State<AirbusDictionaryApp> createState() => _AirbusDictionaryAppState();
}

class _AirbusDictionaryAppState extends State<AirbusDictionaryApp> {
  List<String> _savedAbbreviations = [];

  @override
  void initState() {
    super.initState();
    _loadSavedItems();
  }

  Future<void> _loadSavedItems() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedAbbreviations = prefs.getStringList('saved_abbrs') ?? [];
    });
  }

  Future<void> _toggleSave(String abbr) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      if (_savedAbbreviations.contains(abbr)) {
        _savedAbbreviations.remove(abbr);
      } else {
        _savedAbbreviations.add(abbr);
      }
    });
    await prefs.setStringList('saved_abbrs', _savedAbbreviations);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: const Color(0xFF12141D),
        ),
        home: _HomeScreen(
          image1Url: widget.image1Url,
          image2Url: widget.image2Url,
          onTermsClick: widget.onTermsClick,
          onPrivacyClick: widget.onPrivacyClick,
          savedAbbreviations: _savedAbbreviations,
          onToggleSave: _toggleSave,
        ),
      ),
    );
  }
}

// ---------------------------------------------------------
// 1. شاشة البداية (Home Screen)
// ---------------------------------------------------------
class _HomeScreen extends StatelessWidget {
  final String? image1Url;
  final String? image2Url;
  final Future Function()? onTermsClick;
  final Future Function()? onPrivacyClick;
  final List<String> savedAbbreviations;
  final Function(String) onToggleSave;

  const _HomeScreen({
    Key? key,
    this.image1Url,
    this.image2Url,
    this.onTermsClick,
    this.onPrivacyClick,
    required this.savedAbbreviations,
    required this.onToggleSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12141D),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF12141D),
        title: const Text(
          'Airbus Dictionary',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: cyanColor, // تم تغيير اللون ليكون سماوي
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            children: [
              // الكونتينر الأول: يأخذ مساحة كبيرة (Expanded)
              Expanded(
                child: _buildMenuCard(
                  context: context,
                  title: 'Airbus Abbreviations', // نص احترافي ومناسب
                  subtitle:
                      'Access the complete dictionary of Airbus operational acronyms and terminologies.',
                  imageUrl: image1Url,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => _DictionaryScreen(
                          savedAbbreviations: savedAbbreviations,
                          onToggleSave: onToggleSave,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              // الكونتينر الثاني: يأخذ مساحة كبيرة (Expanded)
              Expanded(
                child: _buildMenuCard(
                  context: context,
                  title: 'Saved Items',
                  subtitle:
                      'Review your bookmarked abbreviations and quick references anytime.',
                  imageUrl: image2Url,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => _SavedScreen(
                          savedAbbreviations: savedAbbreviations,
                          onToggleSave: onToggleSave,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              // الروابط أسفل الشاشة
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: onTermsClick ?? () {},
                      child: const Text(
                        'Terms of use',
                        style: TextStyle(
                          color: Color(0xFF94A3B8),
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: onPrivacyClick ?? () {},
                      child: const Text(
                        'Privacy policy',
                        style: TextStyle(
                          color: Color(0xFF94A3B8),
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // تصميم الكونتينر
  Widget _buildMenuCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required String? imageUrl,
    required VoidCallback onTap,
  }) {
    // التعديل السحري هنا: تنظيف وتجهيز رابط الصورة الخاص بجيتهاب عشان الفلاتر يفهمه
    String? finalImageUrl = imageUrl;
    if (finalImageUrl != null && finalImageUrl.isNotEmpty) {
      if (finalImageUrl.contains('github.com') &&
          finalImageUrl.contains('/blob/')) {
        finalImageUrl = finalImageUrl
            .replaceFirst('github.com', 'raw.githubusercontent.com')
            .replaceFirst('/blob/', '/');
      }
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xFF1F2332),
          image: (finalImageUrl != null && finalImageUrl.isNotEmpty)
              ? DecorationImage(
                  image: NetworkImage(finalImageUrl),
                  fit: BoxFit.cover,
                )
              : null,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 10,
              offset: const Offset(0, 5),
            )
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.7),
                Colors.black.withOpacity(0.2),
                Colors.black.withOpacity(0.8),
              ],
            ),
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: cyanColor, // توحيد اللون السماوي هنا أيضاً
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                subtitle,
                style: const TextStyle(
                  color: Color(0xFFE2E8F0),
                  fontSize: 15,
                  height: 1.4,
                ),
              ),
              const Spacer(),
              const Align(
                alignment: Alignment.bottomRight,
                child:
                    Icon(Icons.arrow_forward_ios, color: cyanColor, size: 24),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------
// 2. شاشة القاموس (Dictionary Screen)
// ---------------------------------------------------------
class _DictionaryScreen extends StatefulWidget {
  final List<String> savedAbbreviations;
  final Function(String) onToggleSave;

  const _DictionaryScreen({
    Key? key,
    required this.savedAbbreviations,
    required this.onToggleSave,
  }) : super(key: key);

  @override
  State<_DictionaryScreen> createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<_DictionaryScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> _filteredData = [];
  String _selectedLetter = 'ALL';

  final List<String> _alphabet = [
    'ALL',
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Z'
  ];

  @override
  void initState() {
    super.initState();
    _filteredData = List.of(airbusData);
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    _applyFilters();
  }

  void _applyFilters() {
    final query = _searchController.text.toLowerCase().trim();
    setState(() {
      _filteredData = airbusData.where((item) {
        final abbr = item['abbr'] ?? '';
        final term = item['term'] ?? '';

        final matchesQuery = abbr.toLowerCase().contains(query) ||
            term.toLowerCase().contains(query);
        final matchesLetter = _selectedLetter == 'ALL' ||
            abbr.toUpperCase().startsWith(_selectedLetter);

        return matchesQuery && matchesLetter;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12141D),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF1A1D29),
        centerTitle: true,
        title: const Text(
          'Airbus Dictionary',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: cyanColor,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: cyanColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              color: const Color(0xFF1A1D29),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Color(0xFF4DB6AC),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'GLOBAL AIRBUS FLEETS', // تم تغيير الجملة لتكون عامة واحترافية
                        style: TextStyle(
                          color: Color(0xFF94A3B8),
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: cyanColor.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: cyanColor.withOpacity(0.3)),
                    ),
                    child: Text(
                      '${_filteredData.length} ITEMS',
                      style: const TextStyle(
                        color: cyanColor,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: _searchController,
                style: const TextStyle(color: Colors.white, fontSize: 15),
                decoration: InputDecoration(
                  hintText: 'Search Airbus abbreviation or description...',
                  hintStyle:
                      const TextStyle(color: Color(0xFF64748B), fontSize: 13),
                  prefixIcon: const Icon(Icons.search, color: cyanColor),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          icon:
                              const Icon(Icons.clear, color: Color(0xFF64748B)),
                          onPressed: () {
                            _searchController.clear();
                            FocusScope.of(context).unfocus();
                          },
                        )
                      : const SizedBox.shrink(),
                  filled: true,
                  fillColor: const Color(0xFF222736),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFF2D3748)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: cyanColor, width: 1.5),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 38,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: _alphabet.length,
                itemBuilder: (context, index) {
                  final letter = _alphabet[index];
                  final isSelected = letter == _selectedLetter;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: ChoiceChip(
                      label: Text(
                        letter,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: isSelected
                              ? const Color(0xFF12141D)
                              : const Color(0xFF94A3B8),
                        ),
                      ),
                      selected: isSelected,
                      selectedColor: cyanColor,
                      backgroundColor: const Color(0xFF1A1D29),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                          color:
                              isSelected ? cyanColor : const Color(0xFF2D3748),
                        ),
                      ),
                      showCheckmark: false,
                      onSelected: (selected) {
                        FocusScope.of(context).unfocus();
                        setState(() {
                          _selectedLetter = selected ? letter : 'ALL';
                          _applyFilters();
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: _filteredData.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search_off,
                              size: 48, color: Color(0xFF475569)),
                          SizedBox(height: 12),
                          Text(
                            'No matching Airbus terms found',
                            style: TextStyle(
                                color: Color(0xFF94A3B8), fontSize: 14),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
                      itemCount: _filteredData.length,
                      itemBuilder: (context, index) {
                        final item = _filteredData[index];
                        final abbr = item['abbr'] ?? '';
                        final isSaved =
                            widget.savedAbbreviations.contains(abbr);

                        return Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1F2332),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color(0xFF2D3748),
                              width: 1,
                            ),
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 4),
                            title: Text(
                              abbr,
                              style: const TextStyle(
                                color: cyanColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: 'monospace',
                              ),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                item['term'] ?? '',
                                style: const TextStyle(
                                  color: Color(0xFFE2E8F0),
                                  fontSize: 13.5,
                                  height: 1.3,
                                ),
                              ),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.copy_rounded,
                                      size: 18, color: Color(0xFF64748B)),
                                  onPressed: () {
                                    Clipboard.setData(ClipboardData(
                                        text:
                                            '${item['abbr']} - ${item['term']}'));
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content:
                                            Text('Copied: ${item['abbr']}'),
                                        backgroundColor: cyanColor,
                                        duration: const Duration(seconds: 1),
                                      ),
                                    );
                                  },
                                ),
                                IconButton(
                                  icon: Icon(
                                    isSaved
                                        ? Icons.bookmark
                                        : Icons.bookmark_border,
                                    size: 22,
                                    color: isSaved
                                        ? cyanColor
                                        : const Color(0xFF64748B),
                                  ),
                                  onPressed: () {
                                    widget.onToggleSave(abbr);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(isSaved
                                            ? 'Removed from saved'
                                            : 'Saved successfully!'),
                                        backgroundColor: isSaved
                                            ? Colors.redAccent
                                            : const Color(0xFF4DB6AC),
                                        duration: const Duration(seconds: 1),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }
}

// ---------------------------------------------------------
// 3. شاشة الاختصارات المحفوظة (Saved Items Screen)
// ---------------------------------------------------------
class _SavedScreen extends StatelessWidget {
  final List<String> savedAbbreviations;
  final Function(String) onToggleSave;

  const _SavedScreen({
    Key? key,
    required this.savedAbbreviations,
    required this.onToggleSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final savedData = airbusData
        .where((item) => savedAbbreviations.contains(item['abbr']))
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFF12141D),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF1A1D29),
        centerTitle: true,
        title: const Text(
          'Saved Items',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: cyanColor,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: cyanColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: savedData.isEmpty
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.bookmark_border,
                        size: 64, color: Color(0xFF475569)),
                    SizedBox(height: 16),
                    Text(
                      'No saved items yet.',
                      style: TextStyle(color: Color(0xFF94A3B8), fontSize: 16),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: savedData.length,
                itemBuilder: (context, index) {
                  final item = savedData[index];
                  final abbr = item['abbr'] ?? '';

                  return Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1F2332),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color(0xFF2D3748),
                        width: 1,
                      ),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      title: Text(
                        abbr,
                        style: const TextStyle(
                          color: cyanColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: 'monospace',
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          item['term'] ?? '',
                          style: const TextStyle(
                            color: Color(0xFFE2E8F0),
                            fontSize: 13.5,
                            height: 1.3,
                          ),
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete_outline,
                            size: 22, color: Colors.redAccent),
                        onPressed: () {
                          onToggleSave(abbr);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Removed from saved'),
                              backgroundColor: Colors.redAccent,
                              duration: Duration(seconds: 1),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
