
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name UART -dir "C:/Users/Marta/Documents/Facultad Mauro/Arquitectura/Practico/Lab/UART/planAhead_run_5" -part xc6slx16csg324-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/Marta/Documents/Facultad Mauro/Arquitectura/Practico/Lab/UART/Top.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/Marta/Documents/Facultad Mauro/Arquitectura/Practico/Lab/UART} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "Top.ucf" [current_fileset -constrset]
add_files [list {Top.ucf}] -fileset [get_property constrset [current_run]]
link_design
