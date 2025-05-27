`ifndef ADDER_UVC_IF_SV
`define ADDER_UVC_IF_SV

interface adder_uvc_if #(
  parameter Width = 8
)();

  logic [Width-1:0] A;
  logic [Width-1:0] B;
  logic [Width-1:0] C;


//valores por defecto
initial begin
A='d0;
B='d0;  

end


endinterface: adder_uvc_if

`endif // ADDER_UVC_IF_SV
