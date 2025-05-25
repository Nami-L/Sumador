module tb;

  `include "uvm_macros.svh"
  import uvm_pkg::*;
  
  import top_test_pkg::*;



//Interface

adder_uvc_if adder_vif();

adder dut(
 .A(adder_vif.A),
 .B(adder_vif.A),
 .C(adder_vif.A)
);


  initial begin
    $timeformat(-9, 0, " ns", 10);
    uvm_config_db#(virtual adder_uvc_if)::set(null, "uvm_test_top.m_env.m_adder_agent", "vif", adder_vif);
    run_test();
  end

  
endmodule:tb