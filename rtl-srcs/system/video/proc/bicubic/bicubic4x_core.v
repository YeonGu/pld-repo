`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/16 14:53:38
// Design Name: 
// Module Name: bicubic_core2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 4times superresolution
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module bicubic_core_4x(
input                  i_bicubic_clk,
input					rst_n,

//input matrix 4*4
input[23:0] i_raw_pix11,
input[23:0] i_raw_pix12,
input[23:0] i_raw_pix13,
input[23:0] i_raw_pix14,
input[23:0] i_raw_pix21,
input[23:0] i_raw_pix22,
input[23:0] i_raw_pix23,
input[23:0] i_raw_pix24,
input[23:0] i_raw_pix31,
input[23:0] i_raw_pix32,
input[23:0] i_raw_pix33,
input[23:0] i_raw_pix34,
input[23:0] i_raw_pix41,
input[23:0] i_raw_pix42,
input[23:0] i_raw_pix43,
input[23:0] i_raw_pix44,

//output matrix 4*4
output[23:0] o_res_pix11,
output[23:0] o_res_pix12,
output[23:0] o_res_pix13,
output[23:0] o_res_pix14,

output[23:0] o_res_pix21,
output[23:0] o_res_pix22,
output[23:0] o_res_pix23,
output[23:0] o_res_pix24,

output[23:0] o_res_pix31,
output[23:0] o_res_pix32,
output[23:0] o_res_pix33,
output[23:0] o_res_pix34,

output[23:0] o_res_pix41,
output[23:0] o_res_pix42,
output[23:0] o_res_pix43,
output[23:0] o_res_pix44

    );
    // Parameter
	//        1/4                  1/2                       3/4                       0				   
	//[-9/64 57/64 19/64 -3/64]  [-1/8 5/8 5/8 -1/8]  [-3/64 19/64 57/64 -9/64]   [0 1 0 0]
    reg [15:0] red21,gre21,blu21,red12,gre12,blu12,red14,gre14,blu14,red41,gre41,blu41;
	reg [20:0] red22,gre22,blu22,red24,gre24,blu24,red44,gre44,blu44,red42,gre42,blu42;
	reg [17:0] red23,gre23,blu23,red32,gre32,blu32,red34,gre34,blu34,red43,gre43,blu43;
    reg [7:0] red11,gre11,blu11;
    reg [11:0] red13,gre13,blu13,red31,gre31,blu31;
    reg [14:0] red33,gre33,blu33;
	
	reg [15:0] red_21,gre_21,blu_21,red_12,gre_12,blu_12,red_14,gre_14,blu_14,red_41,gre_41,blu_41;
	reg [20:0] red_22,gre_22,blu_22,red_24,gre_24,blu_24,red_44,gre_44,blu_44,red_42,gre_42,blu_42;
	reg [17:0] red_23,gre_23,blu_23,red_32,gre_32,blu_32,red_34,gre_34,blu_34,red_43,gre_43,blu_43;
    reg [7:0] red_11,gre_11,blu_11;
    reg [11:0] red_13,gre_13,blu_13,red_31,gre_31,blu_31;
    reg [14:0] red_33,gre_33,blu_33;

//step 1
	always@(posedge i_bicubic_clk or negedge rst_n)begin
		if(!rst_n)
			begin
				// a_1<=0;a_2<=0;a_3<=0;a_4<=0;
				// aa_1<=0;aa_2<=0;aa_3<=0;aa_4<=0;	
				// b_1<=0;b_2<=0;b_3<=0;b_4<=0;
				// bb_1<=0;bb_2<=0;bb_3<=0;bb_4<=0;	
				// c_1<=0;c_2<=0;c_3<=0;c_4<=0;
				// cc_1<=0;cc_2<=0;cc_3<=0;cc_4<=0;		
				red11<=0;red12<=0;red21<=0;red22<=0;
				gre11<=0;gre12<=0;gre21<=0;gre22<=0;
				blu11<=0;blu12<=0;blu21<=0;blu22<=0;	
			end
		else
			begin
			    // a_1<=((i_raw_pix21[23:16]*5+i_raw_pix31[23:16]*5)>(i_raw_pix11[23:16]+i_raw_pix41[23:16]))?(i_raw_pix21[23:16]*5+i_raw_pix31[23:16]*5-i_raw_pix11[23:16]-i_raw_pix41[23:16]):0;
			    red21<=((i_raw_pix22[23:16]*57+i_raw_pix32[23:16]*19)>(i_raw_pix12[23:16]*9+i_raw_pix42[23:16]*3))?(i_raw_pix22[23:16]*57+i_raw_pix32[23:16]*19-i_raw_pix12[23:16]*9-i_raw_pix42[23:16]*3):0;
				gre21<=((i_raw_pix22[15:8]*57+i_raw_pix32[15:8]*19)>(i_raw_pix12[15:8]*9+i_raw_pix42[15:8]*3))?(i_raw_pix22[15:8]*57+i_raw_pix32[15:8]*19-i_raw_pix12[15:8]*9-i_raw_pix42[15:8]*3):0;
				blu21<=((i_raw_pix22[7:0]*57+i_raw_pix32[7:0]*19)>(i_raw_pix12[7:0]*9+i_raw_pix42[7:0]*3))?(i_raw_pix22[7:0]*57+i_raw_pix32[7:0]*19-i_raw_pix12[7:0]*9-i_raw_pix42[7:0]*3):0;
			    
                red12<=((i_raw_pix22[23:16]*57+i_raw_pix23[23:16]*19)>(i_raw_pix21[23:16]*9+i_raw_pix24[23:16]*3))?(i_raw_pix22[23:16]*57+i_raw_pix23[23:16]*19-i_raw_pix21[23:16]*9-i_raw_pix24[23:16]*3):0;
				gre12<=((i_raw_pix22[15:8]*57+i_raw_pix23[15:8]*19)>(i_raw_pix21[15:8]*9+i_raw_pix24[15:8]*3))?(i_raw_pix22[15:8]*57+i_raw_pix23[15:8]*19-i_raw_pix21[15:8]*9-i_raw_pix24[15:8]*3):0;
				blu12<=((i_raw_pix22[7:0]*57+i_raw_pix23[7:0]*19)>(i_raw_pix21[7:0]*9+i_raw_pix24[7:0]*3))?(i_raw_pix22[7:0]*57+i_raw_pix23[7:0]*19-i_raw_pix21[7:0]*9-i_raw_pix24[7:0]*3):0;
			    
                red14<=((i_raw_pix22[23:16]*19+i_raw_pix23[23:16]*57)>(i_raw_pix21[23:16]*3+i_raw_pix24[23:16]*9))?(i_raw_pix22[23:16]*19+i_raw_pix23[23:16]*57-i_raw_pix21[23:16]*3-i_raw_pix24[23:16]*9):0;
				gre14<=((i_raw_pix22[15:8]*19+i_raw_pix23[15:8]*57)>(i_raw_pix21[15:8]*3+i_raw_pix24[15:8]*9))?(i_raw_pix22[15:8]*19+i_raw_pix23[15:8]*57-i_raw_pix21[15:8]*3-i_raw_pix24[15:8]*9):0;
				blu14<=((i_raw_pix22[7:0]*19+i_raw_pix23[7:0]*57)>(i_raw_pix21[7:0]*3+i_raw_pix24[7:0]*9))?(i_raw_pix22[7:0]*19+i_raw_pix23[7:0]*57-i_raw_pix21[7:0]*3-i_raw_pix24[7:0]*9):0;
			    
                red41<=((i_raw_pix22[23:16]*19+i_raw_pix32[23:16]*57)>(i_raw_pix12[23:16]*3+i_raw_pix42[23:16]*9))?(i_raw_pix22[23:16]*19+i_raw_pix32[23:16]*57-i_raw_pix12[23:16]*3-i_raw_pix42[23:16]*9):0;
				gre41<=((i_raw_pix22[15:8]*19+i_raw_pix32[15:8]*57)>(i_raw_pix12[15:8]*3+i_raw_pix42[15:8]*9))?(i_raw_pix22[15:8]*19+i_raw_pix32[15:8]*57-i_raw_pix12[15:8]*3-i_raw_pix42[15:8]*9):0;
				blu41<=((i_raw_pix22[7:0]*19+i_raw_pix32[7:0]*57)>(i_raw_pix12[7:0]*3+i_raw_pix42[7:0]*9))?(i_raw_pix22[7:0]*19+i_raw_pix32[7:0]*57-i_raw_pix12[7:0]*3-i_raw_pix42[7:0]*9):0;
			    
                
                // a_3<=((i_raw_pix23[23:16]*5+i_raw_pix33[23:16]*5)>(i_raw_pix13[23:16]+i_raw_pix43[23:16]))?(i_raw_pix23[23:16]*5+i_raw_pix33[23:16]*5-i_raw_pix13[23:16]-i_raw_pix43[23:16]):0;
			    // a_4<=((i_raw_pix24[23:16]*5+i_raw_pix34[23:16]*5)>(i_raw_pix14[23:16]+i_raw_pix44[23:16]))?(i_raw_pix24[23:16]*5+i_raw_pix34[23:16]*5-i_raw_pix14[23:16]-i_raw_pix44[23:16]):0;

				// a_1<=((i_raw_pix21[23:16]*5+i_raw_pix31[23:16]*5)>(i_raw_pix11[23:16]+i_raw_pix41[23:16]))?(i_raw_pix21[23:16]*5+i_raw_pix31[23:16]*5-i_raw_pix11[23:16]-i_raw_pix41[23:16]):0;
			    // a_2<=((i_raw_pix22[23:16]*5+i_raw_pix32[23:16]*5)>(i_raw_pix12[23:16]+i_raw_pix42[23:16]))?(i_raw_pix22[23:16]*25+i_raw_pix32[23:16]*25-i_raw_pix12[23:16]*5-i_raw_pix42[23:16]*5):0;
			    // a_3<=((i_raw_pix23[23:16]*5+i_raw_pix33[23:16]*5)>(i_raw_pix13[23:16]+i_raw_pix43[23:16]))?(i_raw_pix23[23:16]*25+i_raw_pix33[23:16]*25-i_raw_pix13[23:16]*5-i_raw_pix43[23:16]*5):0;
			    // a_4<=((i_raw_pix24[23:16]*5+i_raw_pix34[23:16]*5)>(i_raw_pix14[23:16]+i_raw_pix44[23:16]))?(i_raw_pix24[23:16]*5+i_raw_pix34[23:16]*5-i_raw_pix14[23:16]-i_raw_pix44[23:16]):0;
				red22<=((i_raw_pix22[23:16]*3249+i_raw_pix32[23:16]*1083+i_raw_pix23[23:16]*1083+i_raw_pix33[23:16]*361+i_raw_pix11[23:16]*81+i_raw_pix41[23:16]*27+i_raw_pix14[23:16]*27+i_raw_pix44[23:16]*9)>
				(i_raw_pix12[23:16]*513+i_raw_pix42[23:16]*171+i_raw_pix13[23:16]*171+i_raw_pix43[23:16]*57+i_raw_pix21[23:16]*513+i_raw_pix31[23:16]*171+i_raw_pix24[23:16]*171+i_raw_pix34[23:16]*57))?
				(i_raw_pix22[23:16]*3249+i_raw_pix32[23:16]*1083+i_raw_pix23[23:16]*1083+i_raw_pix33[23:16]*361+i_raw_pix11[23:16]*81+i_raw_pix41[23:16]*27+i_raw_pix14[23:16]*27+i_raw_pix44[23:16]*9
				-i_raw_pix12[23:16]*513-i_raw_pix42[23:16]*171-i_raw_pix13[23:16]*171-i_raw_pix43[23:16]*57-i_raw_pix21[23:16]*513-i_raw_pix31[23:16]*171-i_raw_pix24[23:16]*171-i_raw_pix34[23:16]*57):0;
				gre22<=((i_raw_pix22[15:8]*3249+i_raw_pix32[15:8]*1083+i_raw_pix23[15:8]*1083+i_raw_pix33[15:8]*361+i_raw_pix11[15:8]*81+i_raw_pix41[15:8]*27+i_raw_pix14[15:8]*27+i_raw_pix44[15:8]*9)>
				(i_raw_pix12[15:8]*513+i_raw_pix42[15:8]*171+i_raw_pix13[15:8]*171+i_raw_pix43[15:8]*57+i_raw_pix21[15:8]*513+i_raw_pix31[15:8]*171+i_raw_pix24[15:8]*171+i_raw_pix34[15:8]*57))?
				(i_raw_pix22[15:8]*3249+i_raw_pix32[15:8]*1083+i_raw_pix23[15:8]*1083+i_raw_pix33[15:8]*361+i_raw_pix11[15:8]*81+i_raw_pix41[15:8]*27+i_raw_pix14[15:8]*27+i_raw_pix44[15:8]*9
				-i_raw_pix12[15:8]*513-i_raw_pix42[15:8]*171-i_raw_pix13[15:8]*171-i_raw_pix43[15:8]*57-i_raw_pix21[15:8]*513-i_raw_pix31[15:8]*171-i_raw_pix24[15:8]*171-i_raw_pix34[15:8]*57):0;
				blu22<=((i_raw_pix22[7:0]*3249+i_raw_pix32[7:0]*1083+i_raw_pix23[7:0]*1083+i_raw_pix33[7:0]*361+i_raw_pix11[7:0]*81+i_raw_pix41[7:0]*27+i_raw_pix14[7:0]*27+i_raw_pix44[7:0]*9)>
				(i_raw_pix12[7:0]*513+i_raw_pix42[7:0]*171+i_raw_pix13[7:0]*171+i_raw_pix43[7:0]*57+i_raw_pix21[7:0]*513+i_raw_pix31[7:0]*171+i_raw_pix24[7:0]*171+i_raw_pix34[7:0]*57))?
				(i_raw_pix22[7:0]*3249+i_raw_pix32[7:0]*1083+i_raw_pix23[7:0]*1083+i_raw_pix33[7:0]*361+i_raw_pix11[7:0]*81+i_raw_pix41[7:0]*27+i_raw_pix14[7:0]*27+i_raw_pix44[7:0]*9
				-i_raw_pix12[7:0]*513-i_raw_pix42[7:0]*171-i_raw_pix13[7:0]*171-i_raw_pix43[7:0]*57-i_raw_pix21[7:0]*513-i_raw_pix31[7:0]*171-i_raw_pix24[7:0]*171-i_raw_pix34[7:0]*57):0;

                red24<=((i_raw_pix23[23:16]*3249+i_raw_pix22[23:16]*1083+i_raw_pix33[23:16]*1083+i_raw_pix32[23:16]*361+i_raw_pix14[23:16]*81+i_raw_pix11[23:16]*27+i_raw_pix44[23:16]*27+i_raw_pix41[23:16]*9)>
				(i_raw_pix24[23:16]*513+i_raw_pix21[23:16]*171+i_raw_pix34[23:16]*171+i_raw_pix31[23:16]*57+i_raw_pix13[23:16]*513+i_raw_pix12[23:16]*171+i_raw_pix43[23:16]*171+i_raw_pix42[23:16]*57))?
				(i_raw_pix23[23:16]*3249+i_raw_pix22[23:16]*1083+i_raw_pix33[23:16]*1083+i_raw_pix32[23:16]*361+i_raw_pix14[23:16]*81+i_raw_pix11[23:16]*27+i_raw_pix44[23:16]*27+i_raw_pix41[23:16]*9
				-i_raw_pix24[23:16]*513-i_raw_pix21[23:16]*171-i_raw_pix34[23:16]*171-i_raw_pix31[23:16]*57-i_raw_pix13[23:16]*513-i_raw_pix12[23:16]*171-i_raw_pix43[23:16]*171-i_raw_pix42[23:16]*57):0;
				gre24<=((i_raw_pix23[15:8]*3249+i_raw_pix22[15:8]*1083+i_raw_pix33[15:8]*1083+i_raw_pix32[15:8]*361+i_raw_pix14[15:8]*81+i_raw_pix11[15:8]*27+i_raw_pix44[15:8]*27+i_raw_pix41[15:8]*9)>
				(i_raw_pix24[15:8]*513+i_raw_pix21[15:8]*171+i_raw_pix34[15:8]*171+i_raw_pix31[15:8]*57+i_raw_pix13[15:8]*513+i_raw_pix12[15:8]*171+i_raw_pix43[15:8]*171+i_raw_pix42[15:8]*57))?
				(i_raw_pix23[15:8]*3249+i_raw_pix22[15:8]*1083+i_raw_pix33[15:8]*1083+i_raw_pix32[15:8]*361+i_raw_pix14[15:8]*81+i_raw_pix11[15:8]*27+i_raw_pix44[15:8]*27+i_raw_pix41[15:8]*9
				-i_raw_pix24[15:8]*513-i_raw_pix21[15:8]*171-i_raw_pix34[15:8]*171-i_raw_pix31[15:8]*57-i_raw_pix13[15:8]*513-i_raw_pix12[15:8]*171-i_raw_pix43[15:8]*171-i_raw_pix42[15:8]*57):0;
				blu24<=((i_raw_pix23[7:0]*3249+i_raw_pix22[7:0]*1083+i_raw_pix33[7:0]*1083+i_raw_pix32[7:0]*361+i_raw_pix14[7:0]*81+i_raw_pix11[7:0]*27+i_raw_pix44[7:0]*27+i_raw_pix41[7:0]*9)>
				(i_raw_pix24[7:0]*513+i_raw_pix21[7:0]*171+i_raw_pix34[7:0]*171+i_raw_pix31[7:0]*57+i_raw_pix13[7:0]*513+i_raw_pix12[7:0]*171+i_raw_pix43[7:0]*171+i_raw_pix42[7:0]*57))?
				(i_raw_pix23[7:0]*3249+i_raw_pix22[7:0]*1083+i_raw_pix33[7:0]*1083+i_raw_pix32[7:0]*361+i_raw_pix14[7:0]*81+i_raw_pix11[7:0]*27+i_raw_pix44[7:0]*27+i_raw_pix41[7:0]*9
				-i_raw_pix24[7:0]*513-i_raw_pix21[7:0]*171-i_raw_pix34[7:0]*171-i_raw_pix31[7:0]*57-i_raw_pix13[7:0]*513-i_raw_pix12[7:0]*171-i_raw_pix43[7:0]*171-i_raw_pix42[7:0]*57):0;

                red44<=((i_raw_pix33[23:16]*3249+i_raw_pix32[23:16]*1083+i_raw_pix23[23:16]*1083+i_raw_pix22[23:16]*361+i_raw_pix44[23:16]*81+i_raw_pix41[23:16]*27+i_raw_pix14[23:16]*27+i_raw_pix11[23:16]*9)>
				(i_raw_pix34[23:16]*513+i_raw_pix42[23:16]*171+i_raw_pix13[23:16]*171+i_raw_pix12[23:16]*57+i_raw_pix43[23:16]*513+i_raw_pix31[23:16]*171+i_raw_pix24[23:16]*171+i_raw_pix21[23:16]*57))?
				(i_raw_pix33[23:16]*3249+i_raw_pix32[23:16]*1083+i_raw_pix23[23:16]*1083+i_raw_pix22[23:16]*361+i_raw_pix44[23:16]*81+i_raw_pix41[23:16]*27+i_raw_pix14[23:16]*27+i_raw_pix11[23:16]*9
				-i_raw_pix34[23:16]*513-i_raw_pix42[23:16]*171-i_raw_pix13[23:16]*171-i_raw_pix12[23:16]*57-i_raw_pix43[23:16]*513-i_raw_pix31[23:16]*171-i_raw_pix24[23:16]*171-i_raw_pix21[23:16]*57):0;
				gre44<=((i_raw_pix33[15:8]*3249+i_raw_pix32[15:8]*1083+i_raw_pix23[15:8]*1083+i_raw_pix22[15:8]*361+i_raw_pix44[15:8]*81+i_raw_pix41[15:8]*27+i_raw_pix14[15:8]*27+i_raw_pix11[15:8]*9)>
				(i_raw_pix34[15:8]*513+i_raw_pix42[15:8]*171+i_raw_pix13[15:8]*171+i_raw_pix12[15:8]*57+i_raw_pix43[15:8]*513+i_raw_pix31[15:8]*171+i_raw_pix24[15:8]*171+i_raw_pix21[15:8]*57))?
				(i_raw_pix33[15:8]*3249+i_raw_pix32[15:8]*1083+i_raw_pix23[15:8]*1083+i_raw_pix22[15:8]*361+i_raw_pix44[15:8]*81+i_raw_pix41[15:8]*27+i_raw_pix14[15:8]*27+i_raw_pix11[15:8]*9
				-i_raw_pix34[15:8]*513-i_raw_pix42[15:8]*171-i_raw_pix13[15:8]*171-i_raw_pix12[15:8]*57-i_raw_pix43[15:8]*513-i_raw_pix31[15:8]*171-i_raw_pix24[15:8]*171-i_raw_pix21[15:8]*57):0;
				blu44<=((i_raw_pix33[7:0]*3249+i_raw_pix32[7:0]*1083+i_raw_pix23[7:0]*1083+i_raw_pix22[7:0]*361+i_raw_pix44[7:0]*81+i_raw_pix41[7:0]*27+i_raw_pix14[7:0]*27+i_raw_pix11[7:0]*9)>
				(i_raw_pix34[7:0]*513+i_raw_pix42[7:0]*171+i_raw_pix13[7:0]*171+i_raw_pix12[7:0]*57+i_raw_pix43[7:0]*513+i_raw_pix31[7:0]*171+i_raw_pix24[7:0]*171+i_raw_pix21[7:0]*57))?
				(i_raw_pix33[7:0]*3249+i_raw_pix32[7:0]*1083+i_raw_pix23[7:0]*1083+i_raw_pix22[7:0]*361+i_raw_pix44[7:0]*81+i_raw_pix41[7:0]*27+i_raw_pix14[7:0]*27+i_raw_pix11[7:0]*9
				-i_raw_pix34[7:0]*513-i_raw_pix42[7:0]*171-i_raw_pix13[7:0]*171-i_raw_pix12[7:0]*57-i_raw_pix43[7:0]*513-i_raw_pix31[7:0]*171-i_raw_pix24[7:0]*171-i_raw_pix21[7:0]*57):0;

                red42<=((i_raw_pix32[23:16]*3249+i_raw_pix22[23:16]*1083+i_raw_pix33[23:16]*1083+i_raw_pix23[23:16]*361+i_raw_pix41[23:16]*81+i_raw_pix11[23:16]*27+i_raw_pix44[23:16]*27+i_raw_pix14[23:16]*9)>
				(i_raw_pix42[23:16]*513+i_raw_pix12[23:16]*171+i_raw_pix43[23:16]*171+i_raw_pix13[23:16]*57+i_raw_pix31[23:16]*513+i_raw_pix21[23:16]*171+i_raw_pix34[23:16]*171+i_raw_pix24[23:16]*57))?
				(i_raw_pix32[23:16]*3249+i_raw_pix22[23:16]*1083+i_raw_pix33[23:16]*1083+i_raw_pix23[23:16]*361+i_raw_pix41[23:16]*81+i_raw_pix11[23:16]*27+i_raw_pix44[23:16]*27+i_raw_pix14[23:16]*9
				-i_raw_pix42[23:16]*513-i_raw_pix12[23:16]*171-i_raw_pix43[23:16]*171-i_raw_pix13[23:16]*57-i_raw_pix31[23:16]*513-i_raw_pix21[23:16]*171-i_raw_pix34[23:16]*171-i_raw_pix24[23:16]*57):0;
				gre42<=((i_raw_pix32[15:8]*3249+i_raw_pix22[15:8]*1083+i_raw_pix33[15:8]*1083+i_raw_pix23[15:8]*361+i_raw_pix41[15:8]*81+i_raw_pix11[15:8]*27+i_raw_pix44[15:8]*27+i_raw_pix14[15:8]*9)>
				(i_raw_pix42[15:8]*513+i_raw_pix12[15:8]*171+i_raw_pix43[15:8]*171+i_raw_pix13[15:8]*57+i_raw_pix31[15:8]*513+i_raw_pix21[15:8]*171+i_raw_pix34[15:8]*171+i_raw_pix24[15:8]*57))?
				(i_raw_pix32[15:8]*3249+i_raw_pix22[15:8]*1083+i_raw_pix33[15:8]*1083+i_raw_pix23[15:8]*361+i_raw_pix41[15:8]*81+i_raw_pix11[15:8]*27+i_raw_pix44[15:8]*27+i_raw_pix14[15:8]*9
				-i_raw_pix42[15:8]*513-i_raw_pix12[15:8]*171-i_raw_pix43[15:8]*171-i_raw_pix13[15:8]*57-i_raw_pix31[15:8]*513-i_raw_pix21[15:8]*171-i_raw_pix34[15:8]*171-i_raw_pix24[15:8]*57):0;
				blu42<=((i_raw_pix32[7:0]*3249+i_raw_pix22[7:0]*1083+i_raw_pix33[7:0]*1083+i_raw_pix23[7:0]*361+i_raw_pix41[7:0]*81+i_raw_pix11[7:0]*27+i_raw_pix44[7:0]*27+i_raw_pix14[7:0]*9)>
				(i_raw_pix42[7:0]*513+i_raw_pix12[7:0]*171+i_raw_pix43[7:0]*171+i_raw_pix13[7:0]*57+i_raw_pix31[7:0]*513+i_raw_pix21[7:0]*171+i_raw_pix34[7:0]*171+i_raw_pix24[7:0]*57))?
				(i_raw_pix32[7:0]*3249+i_raw_pix22[7:0]*1083+i_raw_pix33[7:0]*1083+i_raw_pix23[7:0]*361+i_raw_pix41[7:0]*81+i_raw_pix11[7:0]*27+i_raw_pix44[7:0]*27+i_raw_pix14[7:0]*9
				-i_raw_pix42[7:0]*513-i_raw_pix12[7:0]*171-i_raw_pix43[7:0]*171-i_raw_pix13[7:0]*57-i_raw_pix31[7:0]*513-i_raw_pix21[7:0]*171-i_raw_pix34[7:0]*171-i_raw_pix24[7:0]*57):0;

                red23<=((i_raw_pix22[23:16]*285+i_raw_pix23[23:16]*285+i_raw_pix32[23:16]*95+i_raw_pix33[23:16]*95+i_raw_pix11[23:16]*9+i_raw_pix14[23:16]*9+i_raw_pix41[23:16]*3+i_raw_pix44[23:16]*3)>
				(i_raw_pix21[23:16]*57+i_raw_pix24[23:16]*57+i_raw_pix31[23:16]*19+i_raw_pix34[23:16]*19+i_raw_pix12[23:16]*45+i_raw_pix13[23:16]*45+i_raw_pix42[23:16]*15+i_raw_pix43[23:16]*15))?
				(i_raw_pix22[23:16]*285+i_raw_pix23[23:16]*285+i_raw_pix32[23:16]*95+i_raw_pix33[23:16]*95+i_raw_pix11[23:16]*9+i_raw_pix14[23:16]*9+i_raw_pix41[23:16]*3+i_raw_pix44[23:16]*3
				-i_raw_pix21[23:16]*57-i_raw_pix24[23:16]*57-i_raw_pix31[23:16]*19-i_raw_pix34[23:16]*19-i_raw_pix12[23:16]*45-i_raw_pix13[23:16]*45-i_raw_pix42[23:16]*15-i_raw_pix43[23:16]*15):0;
				gre23<=((i_raw_pix22[15:8]*285+i_raw_pix23[15:8]*285+i_raw_pix32[15:8]*95+i_raw_pix33[15:8]*95+i_raw_pix11[15:8]*9+i_raw_pix14[15:8]*9+i_raw_pix41[15:8]*3+i_raw_pix44[15:8]*3)>
				(i_raw_pix21[15:8]*57+i_raw_pix24[15:8]*57+i_raw_pix31[15:8]*19+i_raw_pix34[15:8]*19+i_raw_pix12[15:8]*45+i_raw_pix13[15:8]*45+i_raw_pix42[15:8]*15+i_raw_pix43[15:8]*15))?
				(i_raw_pix22[15:8]*285+i_raw_pix23[15:8]*285+i_raw_pix32[15:8]*95+i_raw_pix33[15:8]*95+i_raw_pix11[15:8]*9+i_raw_pix14[15:8]*9+i_raw_pix41[15:8]*3+i_raw_pix44[15:8]*3
				-i_raw_pix21[15:8]*57-i_raw_pix24[15:8]*57-i_raw_pix31[15:8]*19-i_raw_pix34[15:8]*19-i_raw_pix12[15:8]*45-i_raw_pix13[15:8]*45-i_raw_pix42[15:8]*15-i_raw_pix43[15:8]*15):0;
				blu23<=((i_raw_pix22[7:0]*285+i_raw_pix23[7:0]*285+i_raw_pix32[7:0]*95+i_raw_pix33[7:0]*95+i_raw_pix11[7:0]*9+i_raw_pix14[7:0]*9+i_raw_pix41[7:0]*3+i_raw_pix44[7:0]*3)>
				(i_raw_pix21[7:0]*57+i_raw_pix24[7:0]*57+i_raw_pix31[7:0]*19+i_raw_pix34[7:0]*19+i_raw_pix12[7:0]*45+i_raw_pix13[7:0]*45+i_raw_pix42[7:0]*15+i_raw_pix43[7:0]*15))?
				(i_raw_pix22[7:0]*285+i_raw_pix23[7:0]*285+i_raw_pix32[7:0]*95+i_raw_pix33[7:0]*95+i_raw_pix11[7:0]*9+i_raw_pix14[7:0]*9+i_raw_pix41[7:0]*3+i_raw_pix44[7:0]*3
				-i_raw_pix21[7:0]*57-i_raw_pix24[7:0]*57-i_raw_pix31[7:0]*19-i_raw_pix34[7:0]*19-i_raw_pix12[7:0]*45-i_raw_pix13[7:0]*45-i_raw_pix42[7:0]*15-i_raw_pix43[7:0]*15):0;

                red32<=((i_raw_pix22[23:16]*285+i_raw_pix32[23:16]*285+i_raw_pix23[23:16]*95+i_raw_pix33[23:16]*95+i_raw_pix11[23:16]*9+i_raw_pix41[23:16]*9+i_raw_pix14[23:16]*3+i_raw_pix44[23:16]*3)>
				(i_raw_pix12[23:16]*57+i_raw_pix42[23:16]*57+i_raw_pix13[23:16]*19+i_raw_pix43[23:16]*19+i_raw_pix21[23:16]*45+i_raw_pix31[23:16]*45+i_raw_pix24[23:16]*15+i_raw_pix34[23:16]*15))?
				(i_raw_pix22[23:16]*285+i_raw_pix32[23:16]*285+i_raw_pix23[23:16]*95+i_raw_pix33[23:16]*95+i_raw_pix11[23:16]*9+i_raw_pix41[23:16]*9+i_raw_pix14[23:16]*3+i_raw_pix44[23:16]*3
				-i_raw_pix12[23:16]*57-i_raw_pix42[23:16]*57-i_raw_pix13[23:16]*19-i_raw_pix43[23:16]*19-i_raw_pix21[23:16]*45-i_raw_pix31[23:16]*45-i_raw_pix24[23:16]*15-i_raw_pix34[23:16]*15):0;
				gre32<=((i_raw_pix22[15:8]*285+i_raw_pix32[15:8]*285+i_raw_pix23[15:8]*95+i_raw_pix33[15:8]*95+i_raw_pix11[15:8]*9+i_raw_pix41[15:8]*9+i_raw_pix14[15:8]*3+i_raw_pix44[15:8]*3)>
				(i_raw_pix12[15:8]*57+i_raw_pix42[15:8]*57+i_raw_pix13[15:8]*19+i_raw_pix43[15:8]*19+i_raw_pix21[15:8]*45+i_raw_pix31[15:8]*45+i_raw_pix24[15:8]*15+i_raw_pix34[15:8]*15))?
				(i_raw_pix22[15:8]*285+i_raw_pix32[15:8]*285+i_raw_pix23[15:8]*95+i_raw_pix33[15:8]*95+i_raw_pix11[15:8]*9+i_raw_pix41[15:8]*9+i_raw_pix14[15:8]*3+i_raw_pix44[15:8]*3
				-i_raw_pix12[15:8]*57-i_raw_pix42[15:8]*57-i_raw_pix13[15:8]*19-i_raw_pix43[15:8]*19-i_raw_pix21[15:8]*45-i_raw_pix31[15:8]*45-i_raw_pix24[15:8]*15-i_raw_pix34[15:8]*15):0;
				blu32<=((i_raw_pix22[7:0]*285+i_raw_pix32[7:0]*285+i_raw_pix23[7:0]*95+i_raw_pix33[7:0]*95+i_raw_pix11[7:0]*9+i_raw_pix41[7:0]*9+i_raw_pix14[7:0]*3+i_raw_pix44[7:0]*3)>
				(i_raw_pix12[7:0]*57+i_raw_pix42[7:0]*57+i_raw_pix13[7:0]*19+i_raw_pix43[7:0]*19+i_raw_pix21[7:0]*45+i_raw_pix31[7:0]*45+i_raw_pix24[7:0]*15+i_raw_pix34[7:0]*15))?
				(i_raw_pix22[7:0]*285+i_raw_pix32[7:0]*285+i_raw_pix23[7:0]*95+i_raw_pix33[7:0]*95+i_raw_pix11[7:0]*9+i_raw_pix41[7:0]*9+i_raw_pix14[7:0]*3+i_raw_pix44[7:0]*3
				-i_raw_pix12[7:0]*57-i_raw_pix42[7:0]*57-i_raw_pix13[7:0]*19-i_raw_pix43[7:0]*19-i_raw_pix21[7:0]*45-i_raw_pix31[7:0]*45-i_raw_pix24[7:0]*15-i_raw_pix34[7:0]*15):0;

                red34<=((i_raw_pix33[23:16]*285+i_raw_pix23[23:16]*285+i_raw_pix32[23:16]*95+i_raw_pix22[23:16]*95+i_raw_pix11[23:16]*3+i_raw_pix41[23:16]*3+i_raw_pix14[23:16]*9+i_raw_pix44[23:16]*9)>
				(i_raw_pix13[23:16]*57+i_raw_pix43[23:16]*57+i_raw_pix12[23:16]*19+i_raw_pix42[23:16]*19+i_raw_pix24[23:16]*45+i_raw_pix34[23:16]*45+i_raw_pix21[23:16]*15+i_raw_pix31[23:16]*15))?
				(i_raw_pix33[23:16]*285+i_raw_pix23[23:16]*285+i_raw_pix32[23:16]*95+i_raw_pix22[23:16]*95+i_raw_pix11[23:16]*3+i_raw_pix41[23:16]*3+i_raw_pix14[23:16]*9+i_raw_pix44[23:16]*9
				-i_raw_pix13[23:16]*57-i_raw_pix43[23:16]*57-i_raw_pix12[23:16]*19-i_raw_pix42[23:16]*19-i_raw_pix24[23:16]*45-i_raw_pix34[23:16]*45-i_raw_pix21[23:16]*15-i_raw_pix31[23:16]*15):0;
				gre34<=((i_raw_pix33[15:8]*285+i_raw_pix23[15:8]*285+i_raw_pix32[15:8]*95+i_raw_pix22[15:8]*95+i_raw_pix11[15:8]*3+i_raw_pix41[15:8]*3+i_raw_pix14[15:8]*9+i_raw_pix44[15:8]*9)>
				(i_raw_pix13[15:8]*57+i_raw_pix43[15:8]*57+i_raw_pix12[15:8]*19+i_raw_pix42[15:8]*19+i_raw_pix24[15:8]*45+i_raw_pix34[15:8]*45+i_raw_pix21[15:8]*15+i_raw_pix31[15:8]*15))?
				(i_raw_pix33[15:8]*285+i_raw_pix23[15:8]*285+i_raw_pix32[15:8]*95+i_raw_pix22[15:8]*95+i_raw_pix11[15:8]*3+i_raw_pix41[15:8]*3+i_raw_pix14[15:8]*9+i_raw_pix44[15:8]*9
				-i_raw_pix13[15:8]*57-i_raw_pix43[15:8]*57-i_raw_pix12[15:8]*19-i_raw_pix42[15:8]*19-i_raw_pix24[15:8]*45-i_raw_pix34[15:8]*45-i_raw_pix21[15:8]*15-i_raw_pix31[15:8]*15):0;
				blu34<=((i_raw_pix33[7:0]*285+i_raw_pix23[7:0]*285+i_raw_pix32[7:0]*95+i_raw_pix22[7:0]*95+i_raw_pix11[7:0]*3+i_raw_pix41[7:0]*3+i_raw_pix14[7:0]*9+i_raw_pix44[7:0]*9)>
				(i_raw_pix13[7:0]*57+i_raw_pix43[7:0]*57+i_raw_pix12[7:0]*19+i_raw_pix42[7:0]*19+i_raw_pix24[7:0]*45+i_raw_pix34[7:0]*45+i_raw_pix21[7:0]*15+i_raw_pix31[7:0]*15))?
				(i_raw_pix33[7:0]*285+i_raw_pix23[7:0]*285+i_raw_pix32[7:0]*95+i_raw_pix22[7:0]*95+i_raw_pix11[7:0]*3+i_raw_pix41[7:0]*3+i_raw_pix14[7:0]*9+i_raw_pix44[7:0]*9
				-i_raw_pix13[7:0]*57-i_raw_pix43[7:0]*57-i_raw_pix12[7:0]*19-i_raw_pix42[7:0]*19-i_raw_pix24[7:0]*45-i_raw_pix34[7:0]*45-i_raw_pix21[7:0]*15-i_raw_pix31[7:0]*15):0;

                red43<=((i_raw_pix33[23:16]*285+i_raw_pix32[23:16]*285+i_raw_pix23[23:16]*95+i_raw_pix22[23:16]*95+i_raw_pix11[23:16]*3+i_raw_pix14[23:16]*3+i_raw_pix41[23:16]*9+i_raw_pix44[23:16]*9)>
				(i_raw_pix31[23:16]*57+i_raw_pix34[23:16]*57+i_raw_pix21[23:16]*19+i_raw_pix24[23:16]*19+i_raw_pix42[23:16]*45+i_raw_pix43[23:16]*45+i_raw_pix12[23:16]*15+i_raw_pix13[23:16]*15))?
				(i_raw_pix33[23:16]*285+i_raw_pix32[23:16]*285+i_raw_pix23[23:16]*95+i_raw_pix22[23:16]*95+i_raw_pix11[23:16]*3+i_raw_pix14[23:16]*3+i_raw_pix41[23:16]*9+i_raw_pix44[23:16]*9
				-i_raw_pix31[23:16]*57-i_raw_pix34[23:16]*57-i_raw_pix21[23:16]*19-i_raw_pix24[23:16]*19-i_raw_pix42[23:16]*45-i_raw_pix43[23:16]*45-i_raw_pix12[23:16]*15-i_raw_pix13[23:16]*15):0;
				gre43<=((i_raw_pix33[15:8]*285+i_raw_pix32[15:8]*285+i_raw_pix23[15:8]*95+i_raw_pix22[15:8]*95+i_raw_pix11[15:8]*3+i_raw_pix14[15:8]*3+i_raw_pix41[15:8]*9+i_raw_pix44[15:8]*9)>
				(i_raw_pix31[15:8]*57+i_raw_pix34[15:8]*57+i_raw_pix21[15:8]*19+i_raw_pix24[15:8]*19+i_raw_pix42[15:8]*45+i_raw_pix43[15:8]*45+i_raw_pix12[15:8]*15+i_raw_pix13[15:8]*15))?
				(i_raw_pix33[15:8]*285+i_raw_pix32[15:8]*285+i_raw_pix23[15:8]*95+i_raw_pix22[15:8]*95+i_raw_pix11[15:8]*3+i_raw_pix14[15:8]*3+i_raw_pix41[15:8]*9+i_raw_pix44[15:8]*9
				-i_raw_pix31[15:8]*57-i_raw_pix34[15:8]*57-i_raw_pix21[15:8]*19-i_raw_pix24[15:8]*19-i_raw_pix42[15:8]*45-i_raw_pix43[15:8]*45-i_raw_pix12[15:8]*15-i_raw_pix13[15:8]*15):0;
				blu43<=((i_raw_pix33[7:0]*285+i_raw_pix32[7:0]*285+i_raw_pix23[7:0]*95+i_raw_pix22[7:0]*95+i_raw_pix11[7:0]*3+i_raw_pix14[7:0]*3+i_raw_pix41[7:0]*9+i_raw_pix44[7:0]*9)>
				(i_raw_pix31[7:0]*57+i_raw_pix34[7:0]*57+i_raw_pix21[7:0]*19+i_raw_pix24[7:0]*19+i_raw_pix42[7:0]*45+i_raw_pix43[7:0]*45+i_raw_pix12[7:0]*15+i_raw_pix13[7:0]*15))?
				(i_raw_pix33[7:0]*285+i_raw_pix32[7:0]*285+i_raw_pix23[7:0]*95+i_raw_pix22[7:0]*95+i_raw_pix11[7:0]*3+i_raw_pix14[7:0]*3+i_raw_pix41[7:0]*9+i_raw_pix44[7:0]*9
				-i_raw_pix31[7:0]*57-i_raw_pix34[7:0]*57-i_raw_pix21[7:0]*19-i_raw_pix24[7:0]*19-i_raw_pix42[7:0]*45-i_raw_pix43[7:0]*45-i_raw_pix12[7:0]*15-i_raw_pix13[7:0]*15):0;

                // red24<=((i_raw_pix22[23:16]*25+i_raw_pix32[23:16]*25+i_raw_pix23[23:16]*25+i_raw_pix33[23:16]*25+i_raw_pix11[23:16]+i_raw_pix41[23:16]+-i_raw_pix14[23:16]+i_raw_pix44[23:16])>
				// (i_raw_pix12[23:16]*5+i_raw_pix42[23:16]*5+i_raw_pix13[23:16]*5+i_raw_pix43[23:16]*5+i_raw_pix21[23:16]*5+i_raw_pix31[23:16]*5+i_raw_pix24[23:16]*5+i_raw_pix34[23:16]*5))?
				// (i_raw_pix22[23:16]*25+i_raw_pix32[23:16]*25+i_raw_pix23[23:16]*25+i_raw_pix33[23:16]*25+i_raw_pix11[23:16]+i_raw_pix41[23:16]+-i_raw_pix14[23:16]+i_raw_pix44[23:16]
				// -i_raw_pix12[23:16]*5-i_raw_pix42[23:16]*5-i_raw_pix13[23:16]*5-i_raw_pix43[23:16]*5-i_raw_pix21[23:16]*5-i_raw_pix31[23:16]*5-i_raw_pix24[23:16]*5-i_raw_pix34[23:16]*5):0;
				// gre24<=((i_raw_pix22[15:8]*25+i_raw_pix32[15:8]*25+i_raw_pix23[15:8]*25+i_raw_pix33[15:8]*25+i_raw_pix11[15:8]+i_raw_pix41[15:8]+-i_raw_pix14[15:8]+i_raw_pix44[15:8])>
				// (i_raw_pix12[15:8]*5+i_raw_pix42[15:8]*5+i_raw_pix13[15:8]*5+i_raw_pix43[15:8]*5+i_raw_pix21[15:8]*5+i_raw_pix31[15:8]*5+i_raw_pix24[15:8]*5+i_raw_pix34[15:8]*5))?
				// (i_raw_pix22[15:8]*25+i_raw_pix32[15:8]*25+i_raw_pix23[15:8]*25+i_raw_pix33[15:8]*25+i_raw_pix11[15:8]+i_raw_pix41[15:8]+-i_raw_pix14[15:8]+i_raw_pix44[15:8]
				// -i_raw_pix12[15:8]*5-i_raw_pix42[15:8]*5-i_raw_pix13[15:8]*5-i_raw_pix43[15:8]*5-i_raw_pix21[15:8]*5-i_raw_pix31[15:8]*5-i_raw_pix24[15:8]*5-i_raw_pix34[15:8]*5):0;
				// blu24<=((i_raw_pix22[7:0]*25+i_raw_pix32[7:0]*25+i_raw_pix23[7:0]*25+i_raw_pix33[7:0]*25+i_raw_pix11[7:0]+i_raw_pix41[7:0]+-i_raw_pix14[7:0]+i_raw_pix44[7:0])>
				// (i_raw_pix12[7:0]*5+i_raw_pix42[7:0]*5+i_raw_pix13[7:0]*5+i_raw_pix43[7:0]*5+i_raw_pix21[7:0]*5+i_raw_pix31[7:0]*5+i_raw_pix24[7:0]*5+i_raw_pix34[7:0]*5))?
				// (i_raw_pix22[7:0]*25+i_raw_pix32[7:0]*25+i_raw_pix23[7:0]*25+i_raw_pix33[7:0]*25+i_raw_pix11[7:0]+i_raw_pix41[7:0]+-i_raw_pix14[7:0]+i_raw_pix44[7:0]
				// -i_raw_pix12[7:0]*5-i_raw_pix42[7:0]*5-i_raw_pix13[7:0]*5-i_raw_pix43[7:0]*5-i_raw_pix21[7:0]*5-i_raw_pix31[7:0]*5-i_raw_pix24[7:0]*5-i_raw_pix34[7:0]*5):0;


			    // aa_1<=i_raw_pix21[23:16];
			    red11<=i_raw_pix22[23:16];
				gre11<=i_raw_pix22[15:8];
				blu11<=i_raw_pix22[7:0];
				
			    // aa_3<=i_raw_pix23[23:16];
			    // aa_4<=i_raw_pix24[23:16];
				
                red13<=((i_raw_pix22[23:16]*5+i_raw_pix23[23:16]*5)>(i_raw_pix21[23:16]+i_raw_pix24[23:16]))?(i_raw_pix22[23:16]*5+i_raw_pix23[23:16]*5-i_raw_pix21[23:16]-i_raw_pix24[23:16]):0;
				gre13<=((i_raw_pix22[15:8]*5+i_raw_pix23[15:8]*5)>(i_raw_pix21[15:8]+i_raw_pix24[15:8]))?(i_raw_pix22[15:8]*5+i_raw_pix23[15:8]*5-i_raw_pix21[15:8]-i_raw_pix24[15:8]):0;
				blu13<=((i_raw_pix22[7:0]*5+i_raw_pix23[7:0]*5)>(i_raw_pix21[7:0]+i_raw_pix24[7:0]))?(i_raw_pix22[7:0]*5+i_raw_pix23[7:0]*5-i_raw_pix21[7:0]-i_raw_pix24[7:0]):0;
			    
                // red21<=((i_raw_pix22[23:16]*5+i_raw_pix32[23:16]*5)>(i_raw_pix12[23:16]+i_raw_pix42[23:16]))?(i_raw_pix22[23:16]*5+i_raw_pix32[23:16]*5-i_raw_pix12[23:16]-i_raw_pix42[23:16]):0;
				// gre21<=((i_raw_pix22[15:8]*5+i_raw_pix32[15:8]*5)>(i_raw_pix12[15:8]+i_raw_pix42[15:8]))?(i_raw_pix22[15:8]*5+i_raw_pix32[15:8]*5-i_raw_pix12[15:8]-i_raw_pix42[15:8]):0;
				// blu21<=((i_raw_pix22[7:0]*5+i_raw_pix32[7:0]*5)>(i_raw_pix12[7:0]+i_raw_pix42[7:0]))?(i_raw_pix22[7:0]*5+i_raw_pix32[7:0]*5-i_raw_pix12[7:0]-i_raw_pix42[7:0]):0;
                
                red31<=((i_raw_pix22[23:16]*5+i_raw_pix32[23:16]*5)>(i_raw_pix12[23:16]+i_raw_pix42[23:16]))?(i_raw_pix22[23:16]*5+i_raw_pix32[23:16]*5-i_raw_pix12[23:16]-i_raw_pix42[23:16]):0;
				gre31<=((i_raw_pix22[15:8]*5+i_raw_pix32[15:8]*5)>(i_raw_pix12[15:8]+i_raw_pix42[15:8]))?(i_raw_pix22[15:8]*5+i_raw_pix32[15:8]*5-i_raw_pix12[15:8]-i_raw_pix42[15:8]):0;
				blu31<=((i_raw_pix22[7:0]*5+i_raw_pix32[7:0]*5)>(i_raw_pix12[7:0]+i_raw_pix42[7:0]))?(i_raw_pix22[7:0]*5+i_raw_pix32[7:0]*5-i_raw_pix12[7:0]-i_raw_pix42[7:0]):0;
			    
                
                red33<=((i_raw_pix22[23:16]*25+i_raw_pix32[23:16]*25+i_raw_pix23[23:16]*25+i_raw_pix33[23:16]*25+i_raw_pix11[23:16]+i_raw_pix41[23:16]+-i_raw_pix14[23:16]+i_raw_pix44[23:16])>
				(i_raw_pix12[23:16]*5+i_raw_pix42[23:16]*5+i_raw_pix13[23:16]*5+i_raw_pix43[23:16]*5+i_raw_pix21[23:16]*5+i_raw_pix31[23:16]*5+i_raw_pix24[23:16]*5+i_raw_pix34[23:16]*5))?
				(i_raw_pix22[23:16]*25+i_raw_pix32[23:16]*25+i_raw_pix23[23:16]*25+i_raw_pix33[23:16]*25+i_raw_pix11[23:16]+i_raw_pix41[23:16]+-i_raw_pix14[23:16]+i_raw_pix44[23:16]
				-i_raw_pix12[23:16]*5-i_raw_pix42[23:16]*5-i_raw_pix13[23:16]*5-i_raw_pix43[23:16]*5-i_raw_pix21[23:16]*5-i_raw_pix31[23:16]*5-i_raw_pix24[23:16]*5-i_raw_pix34[23:16]*5):0;
				gre33<=((i_raw_pix22[15:8]*25+i_raw_pix32[15:8]*25+i_raw_pix23[15:8]*25+i_raw_pix33[15:8]*25+i_raw_pix11[15:8]+i_raw_pix41[15:8]+-i_raw_pix14[15:8]+i_raw_pix44[15:8])>
				(i_raw_pix12[15:8]*5+i_raw_pix42[15:8]*5+i_raw_pix13[15:8]*5+i_raw_pix43[15:8]*5+i_raw_pix21[15:8]*5+i_raw_pix31[15:8]*5+i_raw_pix24[15:8]*5+i_raw_pix34[15:8]*5))?
				(i_raw_pix22[15:8]*25+i_raw_pix32[15:8]*25+i_raw_pix23[15:8]*25+i_raw_pix33[15:8]*25+i_raw_pix11[15:8]+i_raw_pix41[15:8]+-i_raw_pix14[15:8]+i_raw_pix44[15:8]
				-i_raw_pix12[15:8]*5-i_raw_pix42[15:8]*5-i_raw_pix13[15:8]*5-i_raw_pix43[15:8]*5-i_raw_pix21[15:8]*5-i_raw_pix31[15:8]*5-i_raw_pix24[15:8]*5-i_raw_pix34[15:8]*5):0;
				blu33<=((i_raw_pix22[7:0]*25+i_raw_pix32[7:0]*25+i_raw_pix23[7:0]*25+i_raw_pix33[7:0]*25+i_raw_pix11[7:0]+i_raw_pix41[7:0]+-i_raw_pix14[7:0]+i_raw_pix44[7:0])>
				(i_raw_pix12[7:0]*5+i_raw_pix42[7:0]*5+i_raw_pix13[7:0]*5+i_raw_pix43[7:0]*5+i_raw_pix21[7:0]*5+i_raw_pix31[7:0]*5+i_raw_pix24[7:0]*5+i_raw_pix34[7:0]*5))?
				(i_raw_pix22[7:0]*25+i_raw_pix32[7:0]*25+i_raw_pix23[7:0]*25+i_raw_pix33[7:0]*25+i_raw_pix11[7:0]+i_raw_pix41[7:0]+-i_raw_pix14[7:0]+i_raw_pix44[7:0]
				-i_raw_pix12[7:0]*5-i_raw_pix42[7:0]*5-i_raw_pix13[7:0]*5-i_raw_pix43[7:0]*5-i_raw_pix21[7:0]*5-i_raw_pix31[7:0]*5-i_raw_pix24[7:0]*5-i_raw_pix34[7:0]*5):0;

                
                
                
                
                
                // b_1<=((i_raw_pix21[15:8]*5+i_raw_pix31[15:8]*5)>(i_raw_pix11[15:8]+i_raw_pix41[15:8]))?(i_raw_pix21[15:8]*5+i_raw_pix31[15:8]*5-i_raw_pix11[15:8]-i_raw_pix41[15:8]):0;
			    // b_2<=((i_raw_pix22[15:8]*5+i_raw_pix32[15:8]*5)>(i_raw_pix12[15:8]+i_raw_pix42[15:8]))?(i_raw_pix22[15:8]*5+i_raw_pix32[15:8]*5-i_raw_pix12[15:8]-i_raw_pix42[15:8]):0;
			    // b_3<=((i_raw_pix23[15:8]*5+i_raw_pix33[15:8]*5)>(i_raw_pix13[15:8]+i_raw_pix43[15:8]))?(i_raw_pix23[15:8]*5+i_raw_pix33[15:8]*5-i_raw_pix13[15:8]-i_raw_pix43[15:8]):0;
			    // b_4<=((i_raw_pix24[15:8]*5+i_raw_pix34[15:8]*5)>(i_raw_pix14[15:8]+i_raw_pix44[15:8]))?(i_raw_pix24[15:8]*5+i_raw_pix34[15:8]*5-i_raw_pix14[15:8]-i_raw_pix44[15:8]):0;
			    // bb_1<=i_raw_pix21[15:8];
			    // bb_2<=i_raw_pix22[15:8];
			    // bb_3<=i_raw_pix23[15:8];
			    // bb_4<=i_raw_pix24[15:8];
			    // c_1<=((i_raw_pix21[7:0]*5+i_raw_pix31[7:0]*5)>(i_raw_pix11[7:0]+i_raw_pix41[7:0]))?(i_raw_pix21[7:0]*5+i_raw_pix31[7:0]*5-i_raw_pix11[7:0]-i_raw_pix41[7:0]):0;
			    // c_2<=((i_raw_pix22[7:0]*5+i_raw_pix32[7:0]*5)>(i_raw_pix12[7:0]+i_raw_pix42[7:0]))?(i_raw_pix22[7:0]*5+i_raw_pix32[7:0]*5-i_raw_pix12[7:0]-i_raw_pix42[7:0]):0;
			    // c_3<=((i_raw_pix23[7:0]*5+i_raw_pix33[7:0]*5)>(i_raw_pix13[7:0]+i_raw_pix43[7:0]))?(i_raw_pix23[7:0]*5+i_raw_pix33[7:0]*5-i_raw_pix13[7:0]-i_raw_pix43[7:0]):0;
			    // c_4<=((i_raw_pix24[7:0]*5+i_raw_pix34[7:0]*5)>(i_raw_pix14[7:0]+i_raw_pix44[7:0]))?(i_raw_pix24[7:0]*5+i_raw_pix34[7:0]*5-i_raw_pix14[7:0]-i_raw_pix44[7:0]):0;
			    // cc_1<=i_raw_pix21[7:0];
			    // cc_2<=i_raw_pix22[7:0];
			    // cc_3<=i_raw_pix23[7:0];
			    // cc_4<=i_raw_pix24[7:0];	
                   
			end
    end
 //step2   
    always@(posedge i_bicubic_clk or negedge rst_n)begin
		if(!rst_n)
			begin
				red_11<=0;red_12<=0;red_13<=0;red_14<=0;red_21<=0;red_22<=0;red_23<=0;red_24<=0;red_31<=0;red_32<=0;red_33<=0;red_34<=0;red_41<=0;red_42<=0;red_43<=0;red_44<=0;
				gre_11<=0;gre_12<=0;gre_13<=0;gre_14<=0;gre_21<=0;gre_22<=0;gre_23<=0;gre_24<=0;gre_31<=0;gre_32<=0;gre_33<=0;gre_34<=0;gre_41<=0;gre_42<=0;gre_43<=0;gre_44<=0;
                blu_11<=0;blu_12<=0;blu_13<=0;blu_14<=0;blu_21<=0;blu_22<=0;blu_23<=0;blu_24<=0;blu_31<=0;blu_32<=0;blu_33<=0;blu_34<=0;blu_41<=0;blu_42<=0;blu_43<=0;blu_44<=0;		
			end
		else
			begin
			    red_11<=(red11>254)?255:red11;
			    red_12<=(red12>16320)?16320:red12;
                red_13<=(red13>2040)?2040:red13;
                red_14<=(red14>16320)?16320:red14;
			    red_21<=(red21>16320)?16320:red21;
			    red_22<=(red22>1044480)?1044480:red22;
                red_23<=(red23>130560)?130560:red23;
                red_24<=(red24>1044480)?1044480:red24;
                red_31<=(red31>2040)?2040:red31;
                red_32<=(red32>130560)?130560:red32;
                red_33<=(red33>16320)?16320:red33;
                red_34<=(red34>130560)?130560:red34;
                red_41<=(red41>16320)?16320:red41;
                red_42<=(red42>1044480)?1044480:red42;
                red_43<=(red43>130560)?130560:red43;
                red_44<=(red44>1044480)?1044480:red44;
                gre_11<=(gre11>254)?255:gre11;
			    gre_12<=(gre12>16320)?16320:gre12;
                gre_13<=(gre13>2040)?2040:gre13;
                gre_14<=(gre14>16320)?16320:gre14;
			    gre_21<=(gre21>16320)?16320:gre21;
			    gre_22<=(gre22>1044480)?1044480:gre22;
                gre_23<=(gre23>130560)?130560:gre23;
                gre_24<=(gre24>1044480)?1044480:gre24;
                gre_31<=(gre31>2040)?2040:gre31;
                gre_32<=(gre32>130560)?130560:gre32;
                gre_33<=(gre33>16320)?16320:gre33;
                gre_34<=(gre34>130560)?130560:gre34;
                gre_41<=(gre41>16320)?16320:gre41;
                gre_42<=(gre42>1044480)?1044480:gre42;
                gre_43<=(gre43>130560)?130560:gre43;
                gre_44<=(gre44>1044480)?1044480:gre44;
                blu_11<=(blu11>254)?255:blu11;
			    blu_12<=(blu12>16320)?16320:blu12;
                blu_13<=(blu13>2040)?2040:blu13;
                blu_14<=(blu14>16320)?16320:blu14;
			    blu_21<=(blu21>16320)?16320:blu21;
			    blu_22<=(blu22>1044480)?1044480:blu22;
                blu_23<=(blu23>130560)?130560:blu23;
                blu_24<=(blu24>1044480)?1044480:blu24;
                blu_31<=(blu31>2040)?2040:blu31;
                blu_32<=(blu32>130560)?130560:blu32;
                blu_33<=(blu33>16320)?16320:blu33;
                blu_34<=(blu34>130560)?130560:blu34;
                blu_41<=(blu41>16320)?16320:blu41;
                blu_42<=(blu42>1044480)?1044480:blu42;
                blu_43<=(blu43>130560)?130560:blu43;
                blu_44<=(blu44>1044480)?1044480:blu44;
				
			    // gre11<=((b_2*5+b_3*5)>(b_1+b_4))?(b_2*5+b_3*5-b_1-b_4):0;
			    // gre12<=b_2;
			    // gre21<=((bb_2*5+bb_3*5)>(bb_1+bb_4))?(bb_2*5+bb_3*5-bb_1-bb_4):0;
			    // gre22<=bb_2;
			    // blu11<=((c_2*5+c_3*5)>(c_1+c_4))?(c_2*5+c_3*5-c_1-c_4):0;
			    // blu12<=c_2;
			    // blu21<=((cc_2*5+cc_3*5)>(cc_1+cc_4))?(cc_2*5+cc_3*5-cc_1-cc_4):0;
			    // blu22<=cc_2;
			end
		end
		
    

    // assign o_res_pix11={red11,gre11,blu11};
    // assign o_res_pix12={(red12>2040)?255:red12[10:3],(gre12>2040)?255:gre12[10:3],(blu12>2040)?255:blu12[10:3]};
    // assign o_res_pix21={(red21>2040)?255:red21[10:3],(gre21>2040)?255:gre21[10:3],(blu21>2040)?255:blu21[10:3]};
    // assign o_res_pix22={(red22>16320)?255:red22[13:6],(gre22>16320)?255:gre22[13:6],(blu22>16320)?255:blu22[13:6]};
	assign o_res_pix11={red_11,gre_11,blu_11};
    assign o_res_pix12={red_12[13:6],gre_12[13:6],blu_12[13:6]};
    assign o_res_pix13={red_13[10:3],gre_13[10:3],blu_13[10:3]};
    assign o_res_pix14={red_14[13:6],gre_14[13:6],blu_14[13:6]};
    
    assign o_res_pix21={red_21[13:6],gre_21[13:6],blu_21[13:6]};
    assign o_res_pix22={red_22[19:12],gre_22[19:12],blu_22[19:12]};
    assign o_res_pix23={red_23[16:9],gre_23[16:9],blu_23[16:9]};
    assign o_res_pix24={red_24[19:12],gre_24[19:12],blu_24[19:12]};

    assign o_res_pix31={red_31[10:3],gre_31[10:3],blu_31[10:3]};
    assign o_res_pix32={red_32[16:9],gre_32[16:9],blu_32[16:9]};
    assign o_res_pix33={red_33[13:6],gre_33[13:6],blu_33[13:6]};
    assign o_res_pix34={red_34[16:9],gre_34[16:9],blu_34[16:9]};

    assign o_res_pix41={red_41[13:6],gre_41[13:6],blu_41[13:6]};
    assign o_res_pix42={red_42[19:12],gre_42[19:12],blu_42[19:12]};
    assign o_res_pix43={red_43[16:9],gre_43[16:9],blu_43[16:9]};
    assign o_res_pix44={red_44[19:12],gre_44[19:12],blu_44[19:12]};
    

endmodule
