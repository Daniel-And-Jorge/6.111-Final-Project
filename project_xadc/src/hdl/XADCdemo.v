`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/12/2015 03:26:51 PM
// Design Name: 
// Module Name: // Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
 

module XADCdemo(
   input CLK100MHZ,
   input vauxp2,
   input vauxn2,
   input vauxp3,
   input vauxn3,
   input vauxp10,
   input vauxn10,
   input vauxp11,
   input vauxn11,
   input [1:0] sw,
   output reg [15:0] LED,
   output [7:0] an,
   output dp,
   output [6:0] seg 
 );
   
     
   reg [32:0] decimal;   
   reg [3:0] dig0;
   reg [3:0] dig1;
   reg [3:0] dig2;
   reg [3:0] dig3;
   reg [3:0] dig4;
   reg [3:0] dig5;
   reg [3:0] dig6;

   wire reset;

   // XADC IP module
   wire eoc;
   wire ready;
   wire [15:0] data;   
   reg [6:0] Address_in;   
  //xadc instantiation connect the eoc_out .den_in to get continuous conversion
   xadc_wiz_0  XLXI_7 (.daddr_in(Address_in), //addresses can be found in the artix 7 XADC user guide DRP register space
                     .dclk_in(CLK100MHZ), 
                     .den_in(eoc), 
                     .di_in(), 
                     .dwe_in(), 
                     .busy_out(),                    
                     .vauxp11(vauxp11),
                     .vauxn11(vauxn11),
                     .vn_in(),
                     .vp_in(),
                     .alarm_out(),
                     .do_out(data),
                     .reset_in(reset), // ddr
                     .eoc_out(eoc), // ddr high for one cycle on end of conversion
                     .channel_out(),
                     .drdy_out(ready));
     
     // ADC controller
     wire adcc_ready;
     wire [11:0] dataOut;
     ADCController adcc(
                         .clock(CLK100MHZ),
                         .reset(reset),
                         .sampleEnabled(1),
                         .inputReady(eoc),
                         .dataIn(data[15:4]),
                         .ready(adcc_ready),
                         .dataOut(dataOut)
                         );
      
      // copied from proj/XADC_Demo.ip_user_files/ip/blk_mem_gen_0/blk_mem_gen_0.veo [generated after running BRAM synth tool]
    blk_mem_gen_0 bram (
                           .clka(clka),    // input wire clka
                           .ena(ena),      // input wire ena
                           .wea(wea),      // input wire [0 : 0] wea
                           .addra(addra),  // input wire [9 : 0] addra
                           .dina(dina),    // input wire [11 : 0] dina
                           .douta(douta),  // output wire [11 : 0] douta
                           .clkb(clkb),    // input wire clkb
                           .enb(enb),      // input wire enb
                           .web(web),      // input wire [0 : 0] web
                           .addrb(addrb),  // input wire [9 : 0] addrb
                           .dinb(dinb),    // input wire [11 : 0] dinb
                           .doutb(doutb)  // output wire [11 : 0] doutb
                         );
    
      //led visual dmm              
      always @( posedge(CLK100MHZ))
      begin            
        if(adcc_ready == 1'b1)
        begin
          case (dataOut[11:8])
            1:  LED <= 16'b11;
            2:  LED <= 16'b111;
            3:  LED <= 16'b1111;
            4:  LED <= 16'b11111;
            5:  LED <= 16'b111111;
            6:  LED <= 16'b1111111; 
            7:  LED <= 16'b11111111;
            8:  LED <= 16'b111111111;
            9:  LED <= 16'b1111111111;
            10: LED <= 16'b11111111111;
            11: LED <= 16'b111111111111;
            12: LED <= 16'b1111111111111;
            13: LED <= 16'b11111111111111;
            14: LED <= 16'b111111111111111;
            15: LED <= 16'b1111111111111111;                        
           default: LED <= 16'b1; 
           endcase
        end 

          
      end
      
     reg [32:0] count; 
     //binary to decimal conversion
      always @ (posedge(CLK100MHZ))
      begin
      
        if(count == 10000000)begin
        
        decimal = dataOut;
        //looks nicer if our max value is 1V instead of .999755
        if(decimal >= 4093)
        begin
            dig0 = 0;
            dig1 = 0;
            dig2 = 0;
            dig3 = 0;
            dig4 = 0;
            dig5 = 0;
            dig6 = 1;
            count = 0;
        end
        else 
        begin
            decimal = decimal * 250000;
            decimal = decimal >> 10;
            
            
            dig0 = decimal % 10;
            decimal = decimal / 10;
            
            dig1 = decimal % 10;
            decimal = decimal / 10;
                   
            dig2 = decimal % 10;
            decimal = decimal / 10;
            
            dig3 = decimal % 10;
            decimal = decimal / 10;
            
            dig4 = decimal % 10;
            decimal = decimal / 10;
                   
            dig5 = decimal % 10;
            decimal = decimal / 10; 
            
            dig6 = decimal % 10;
            decimal = decimal / 10; 
            
            count = 0;
        end
       end
       
      count = count + 1;
               
      end
      
      always @(posedge(CLK100MHZ))
      begin
        // not sure why we write this since it's listed as read-only but we do
        Address_in <= 7'h1b; // VAUX P/N 11; see p. 36 of Xilinx XADC guide
        
        // adc IP is no longer configured with all these pins
//        case(sw)
//        0: Address_in <= 8'h12;
//        1: Address_in <= 8'h13;
//        2: Address_in <= 8'h1a;
//        3: Address_in <= 8'h1b;
//        endcase
      
      
      end
      
      DigitToSeg segment1(.in1(dig0),
                         .in2(dig1),
                         .in3(dig2),
                         .in4(dig3),
                         .in5(dig4),
                         .in6(dig5),
                         .in7(dig6),
                         .in8(),
                         .mclk(CLK100MHZ),
                         .an(an),
                         .dp(dp),
                         .seg(seg));  
endmodule
