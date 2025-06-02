`ifndef TOP_COVERAGE_SV
`define TOP_COVERAGE_SV 

class top_coverage extends uvm_component;

  `uvm_component_utils(top_coverage)
  `uvm_analysis_imp_decl(_adder)
  uvm_analysis_imp_adder#(adder_uvc_sequence_item, top_coverage) adder_imp_export;


  adder_uvc_sequence_item m_trans;

    covergroup m_cov;

    cp_A: coverpoint  m_trans.m_A_trans{bins A_trans_bin[]={[0:50]};}
    cp_B: coverpoint  m_trans.m_B_trans{bins B_trans_bin[]={[0:50]};}
    cp_C: coverpoint  m_trans.m_C_trans{bins C_trans_bin[]={[0:100]};}

    cross_AB: cross cp_A, cp_B;

    endgroup

  extern function new(string name, uvm_component parent);
  extern function void build_phase(uvm_phase phase);
  extern function void report_phase(uvm_phase phase);
  extern function void write_adder(input adder_uvc_sequence_item t);

endclass : top_coverage


function top_coverage:: new(string name, uvm_component parent);
super.new(name,parent);
m_trans = adder_uvc_sequence_item::type_id::create("m_trans");
m_cov=new();
endfunction: new

function void top_coverage::build_phase(uvm_phase phase);
adder_imp_export = new("adder_imp_export",this);
endfunction: build_phase    

function void top_coverage::write_adder(input adder_uvc_sequence_item t);
    m_trans = t;
    m_cov.sample();


endfunction : write_adder

function void top_coverage::report_phase (uvm_phase phase);

  `uvm_info(get_type_name(), $sformatf("FINAL Coverage Score = %3.1f%%", m_cov.get_coverage()), UVM_DEBUG)

endfunction: report_phase



`endif // TOP_SCOREBOARD_SV
