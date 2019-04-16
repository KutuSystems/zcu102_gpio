
# Set the original project directory path for adding/importing sources in the new project
set orig_proj_dir "../kutu_gpio_v1_00_a"

# Create project
create_project -force kutu_gpio_v1_00_a ../kutu_gpio_v1_00_a

# Set the directory path for the new project
set proj_dir [get_property directory [current_project]]

# Set project properties
set obj [get_projects kutu_gpio_v1_00_a]
set_property "board" "xilinx.com:zynq:zc706:1.1" $obj
set_property "simulator_language" "Mixed" $obj
set_property "target_language" "VHDL" $obj

# Create 'sources_1' fileset (if not found)
if {[string equal [get_filesets sources_1] ""]} {
  create_fileset -srcset sources_1
}

# Add files to 'sources_1' fileset
add_files -norecurse sources/axi4_lite_controller.vhd
add_files -norecurse sources/gpio_control.vhd
add_files -norecurse sources/kutu_gpio.vhd

set_property library kutu_gpio_v1_00_a [get_files sources/axi4_lite_controller.vhd]
set_property library kutu_gpio_v1_00_a [get_files sources/gpio_control.vhd]
set_property library kutu_gpio_v1_00_a [get_files sources/kutu_gpio.vhd]

# Set 'sources_1' fileset properties
set obj [get_filesets sources_1]
set_property "ip_repo_paths" "../../XilinxIP" $obj
set_property "top" "kutu_gpio" $obj

# Create 'constrs_1' fileset (if not found)
if {[string equal [get_filesets constrs_1] ""]} {
  create_fileset -constrset constrs_1
}

# Add files to 'constrs_1' fileset
set obj [get_filesets constrs_1]
# Empty (no sources present)

# Set 'constrs_1' fileset properties
set obj [get_filesets constrs_1]

# Create 'sim_1' fileset (if not found)
if {[string equal [get_filesets sim_1] ""]} {
   create_fileset -simset sim_1


   # Add files to 'sim_1' fileset
   set obj [get_filesets sim_1]
   # Empty (no sources present)

   # Set 'sim_1' fileset properties
   set obj [get_filesets sim_1]
   set_property "top" "kutu_gpio" $obj
}

# Create 'synth_1' run (if not found)
if {[string equal [get_runs synth_1] ""]} {
  create_run -name synth_1 -part xc7z045ffg900-2 -flow {Vivado Synthesis 2013} -strategy "Vivado Synthesis Defaults" -constrset constrs_1
}
set obj [get_runs synth_1]

# Create 'impl_1' run (if not found)
if {[string equal [get_runs impl_1] ""]} {
  create_run -name impl_1 -part xc7z045ffg900-2 -flow {Vivado Implementation 2013} -strategy "Vivado Implementation Defaults" -constrset constrs_1 -parent_run synth_1
}
set obj [get_runs impl_1]

ipx::package_project -root_dir {../kutu_gpio_v1_00_a}
set_property vendor {kutu.com.au} [ipx::current_core]
set_property library {kutu} [ipx::current_core]
set_property taxonomy {{/Kutu}} [ipx::current_core]
set_property vendor_display_name {Kutu Pty. Ltd.} [ipx::current_core]
set_property company_url {http://www.kutu.com.au} [ipx::current_core]
ipx::remove_bus_interface {sys_clk} [ipx::current_core]

ipx::create_xgui_files [ipx::current_core]
ipx::create_xgui_files [ipx::current_core]
ipx::save_core [ipx::current_core]
#update_ip_catalog -rebuild -repo_path ../../XilinxIP
ipx::check_integrity -quiet [ipx::current_core]
ipx::unload_core {kutu.com.au:kutu:kutu_gpio:1.0}

puts "INFO: Project created:kutu_gpio_v1_00_a"
