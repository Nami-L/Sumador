`ifndef ADDER_UVC_MONITOR_SV
`define ADDER_UVC_MONITOR_SV

class adder_uvc_monitor extends uvm_monitor;

  `uvm_component_utils(adder_uvc_monitor)

uvm_analysis_port #(adder_uvc_sequence_item) analysis_port;

  virtual adder_uvc_if                         vif;
  adder_uvc_config                             m_config;
  adder_uvc_sequence_item                      m_trans;

  extern function new(string name, uvm_component parent);

  extern function void build_phase(uvm_phase phase);
  extern task run_phase(uvm_phase phase);
  extern task do_mon();

endclass : adder_uvc_monitor


function adder_uvc_monitor::new(string name, uvm_component parent);
super.new(name,parent);
endfunction: new

function void adder_uvc_monitor::build_phase(uvm_phase phase);
  if (!uvm_config_db#(virtual adder_uvc_if)::get(get_parent(), "", "vif", vif)) begin
    `uvm_fatal(get_name(), "Could not retrieve adder_uvc_if from adder db")
  end

  if (!uvm_config_db#(adder_uvc_config)::get(get_parent(), "", "config", m_config)) begin
    `uvm_fatal(get_name(), "Could not retrieve adder_uvc_config from config db")
  end

    analysis_port = new("analysis_port", this);

endfunction: build_phase

task adder_uvc_monitor::run_phase(uvm_phase phase);

m_trans= adder_uvc_sequence_item::type_id::create("m_trans");

endtask: run_phase

task adder_uvc_monitor::do_mon();
  forever begin
    `uvm_info(get_type_name(), {"\n ------ MONITOR (GPIO UVC) ------ ", m_trans.convert2string()}, UVM_DEBUG)
    analysis_port.write(m_trans);
  end
endtask: do_mon

`endif // ADDER_UVC_MONITOR_SV
