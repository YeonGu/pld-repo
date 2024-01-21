
module YCbCr2RGB_core
(
	//global clock
	input					clk,  				//cmos video pixel clock
	input					rst_n,				//global reset

	input		[7:0]	per_img_Y,			//Processed Image brightness output
	input		[7:0]	per_img_Cb,		//Processed Image blue shading output
	input		[7:0]	per_img_Cr	,
    output		[7:0]		post_img_red,		//Prepared Image red data to be processed
	output		[7:0]		post_img_green,		//Prepared Image green data to be processed
	output		[7:0]		post_img_blue			//Processed Image red shading output
);

	//--------------------------------------------
	/*********************************************
	//Refer to <OV7725 Camera Module Software Applicaton Note> page 5
		Y 	=	(77 *R 	+ 	150*G 	+ 	29 *B)>>8
		Cb 	=	(-43*R	- 	85 *G	+ 	128*B)>>8 + 128
		Cr 	=	(128*R 	-	107*G  	-	21 *B)>>8 + 128

		Y 	=	(77 *R 	+ 	150*G 	+ 	29 *B)>>8
		Cb 	=	(-43*R	- 	85 *G	+ 	128*B + 32768)>>8
		Cr 	=	(128*R 	-	107*G  	-	21 *B + 32768)>>8

        R= Y + ((360 * (Cr - 128))>>8) ;

		G= Y - (( ( 88 * (Cb - 128)  + 184 * (Cr - 128)) )>>8) ;

		B= Y +((455 * (Cb - 128))>>8) ;

	**********************************************/
	//Step 1 三步流水线操�?
	reg	[8:0]	img_R_r;
	reg	[8:0]	img_G_r; 
	reg	[8:0]	img_B_r; 
	
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)
			begin
			img_R_r	<=	0; 	
			img_G_r	<=	0; 	
			img_B_r	<=	0; 	
			end
		else
			begin
			img_R_r	<=	((per_img_Y     +   per_img_Cr*45/32)>180)?(per_img_Y     +   per_img_Cr*45/32-180):0 	; 
			img_G_r	<=	((per_img_Y +44 +92) >(per_img_Cb*11/32 +   per_img_Cr*23/32))?(per_img_Y +44 +92-per_img_Cb*11/32 -   per_img_Cr*23/32):0;
			img_B_r	<=	((per_img_Y     +   per_img_Cb*455/256)>227)?(per_img_Y     +   per_img_Cb*455/256-227):0;
			end
	end

	
	assign	post_img_red 	= img_R_r[8]?255:img_R_r[7:0];
	assign	post_img_green = img_G_r[8]?255:img_G_r[7:0];
	assign	post_img_blue = img_B_r[8]?255:img_B_r[7:0]; 
	
endmodule
