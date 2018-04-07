# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a15tftg256-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir D:/USA/video/Verilog_Vivado_FIFO/prj_FIFO/prj_FIFO.cache/wt [current_project]
set_property parent.project_path D:/USA/video/Verilog_Vivado_FIFO/prj_FIFO/prj_FIFO.xpr [current_project]
set_property XPM_LIBRARIES XPM_MEMORY [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_ip -quiet D:/USA/video/Verilog_Vivado_FIFO/prj_FIFO/prj_FIFO.srcs/sources_1/ip/fifo_test/fifo_test.xci
set_property is_locked true [get_files D:/USA/video/Verilog_Vivado_FIFO/prj_FIFO/prj_FIFO.srcs/sources_1/ip/fifo_test/fifo_test.xci]

foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]

synth_design -top fifo_test -part xc7a15tftg256-1 -mode out_of_context

rename_ref -prefix_all fifo_test_

write_checkpoint -force -noxdef fifo_test.dcp

catch { report_utilization -file fifo_test_utilization_synth.rpt -pb fifo_test_utilization_synth.pb }

if { [catch {
  file copy -force D:/USA/video/Verilog_Vivado_FIFO/prj_FIFO/prj_FIFO.runs/fifo_test_synth_1/fifo_test.dcp D:/USA/video/Verilog_Vivado_FIFO/prj_FIFO/prj_FIFO.srcs/sources_1/ip/fifo_test/fifo_test.dcp
} _RESULT ] } { 
  send_msg_id runtcl-3 error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}

if { [catch {
  write_verilog -force -mode synth_stub D:/USA/video/Verilog_Vivado_FIFO/prj_FIFO/prj_FIFO.srcs/sources_1/ip/fifo_test/fifo_test_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode synth_stub D:/USA/video/Verilog_Vivado_FIFO/prj_FIFO/prj_FIFO.srcs/sources_1/ip/fifo_test/fifo_test_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_verilog -force -mode funcsim D:/USA/video/Verilog_Vivado_FIFO/prj_FIFO/prj_FIFO.srcs/sources_1/ip/fifo_test/fifo_test_sim_netlist.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode funcsim D:/USA/video/Verilog_Vivado_FIFO/prj_FIFO/prj_FIFO.srcs/sources_1/ip/fifo_test/fifo_test_sim_netlist.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if {[file isdir D:/USA/video/Verilog_Vivado_FIFO/prj_FIFO/prj_FIFO.ip_user_files/ip/fifo_test]} {
  catch { 
    file copy -force D:/USA/video/Verilog_Vivado_FIFO/prj_FIFO/prj_FIFO.srcs/sources_1/ip/fifo_test/fifo_test_stub.v D:/USA/video/Verilog_Vivado_FIFO/prj_FIFO/prj_FIFO.ip_user_files/ip/fifo_test
  }
}

if {[file isdir D:/USA/video/Verilog_Vivado_FIFO/prj_FIFO/prj_FIFO.ip_user_files/ip/fifo_test]} {
  catch { 
    file copy -force D:/USA/video/Verilog_Vivado_FIFO/prj_FIFO/prj_FIFO.srcs/sources_1/ip/fifo_test/fifo_test_stub.vhdl D:/USA/video/Verilog_Vivado_FIFO/prj_FIFO/prj_FIFO.ip_user_files/ip/fifo_test
  }
}
