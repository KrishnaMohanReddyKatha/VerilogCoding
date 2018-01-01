
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:35:35 03/04/2014 
// Design Name: 
// Module Name:    display 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module final_test(in1,in2,in3,b1,b2,in4,in5,clk,sf_e,e,rs,rw,d,c,b,a);
(* LOC = "V4" *)input in1;
(* LOC = "D18" *)input in2;
(* LOC = "H13" *)input in3;
(* LOC = "K17" *)input in4;
(* LOC = "V16" *)input in5;
(* LOC = "A6" *)output b1;
(* LOC = "B6" *)output b2;
(* LOC = "C9" *)input clk;
(* LOC = "D16" *)output reg sf_e;
(* LOC = "M18" *)output reg e;
(* LOC = "L18" *)output reg rs;
(* LOC = "L17" *)output reg rw;
(* LOC = "M15" *)output reg d;
(* LOC = "P17" *)output reg c;
(* LOC = "R16" *)output reg b;
(* LOC = "R15" *)output reg a;
reg defalt;
reg b1;
reg b2;
reg q1,aq1,wq1,q2,aq2,wq2,aq3,wq3,q3,q4,q5,aq4,aq5,wq4,wq5,res;
reg [27:0]count=0;
reg [5:0]code;
reg refresh;
reg [4:0]stage;
reg [3:0] counter;
reg stage2,stage3,stage4,stage5,stage6;
initial
     begin
	  defalt=1;
	   q1=0;
		q2=0;
		q3=0;
		q4=0;
		q5=0;
		aq1=0;
		aq2=0;
		aq3=0;
		aq4=0;
		aq5=0;
		wq1=0;
		wq2=0;
		wq3=0;
		wq4=0;
		wq5=0;
		res=0;
	   stage=0;
		stage2=0;
		stage3=0;
		stage4=0;
		stage5=0;
		stage6=0;
		counter=0;
		b1=0;
		b2=0;
	  end
always @(posedge clk)
begin    
   if((defalt))
	  begin
count <= count+1;
case(count[27:21])
0:code  <= 6'h03;
1: code <= 6'h03;
2: code <= 6'h03;
3: code <= 6'h02;  
4: code <= 6'h02;
5: code <= 6'h08;
6: code <= 6'h00;
7: code <= 6'h06; 
8: code <= 6'h00;
9: code <= 6'h0C;
10:code <= 6'h00;
11:code <= 6'h01;
//displaying default sentence
12: code <= 6'h25;
13: code <= 6'h27;//w
14: code <= 6'h26;
15: code <= 6'h25;//e
16: code <= 6'h26;
17: code <= 6'h2C;//l
18: code <= 6'h26;
19: code <= 6'h23;//c
20: code <= 6'h26;
21: code <= 6'h2F;//o
22: code <= 6'h26;
23: code <= 6'h2D;//m
24: code <= 6'h26;
25: code <= 6'h25;//e
26: code <= 6'b001100;
27: code <= 6'b000000;//newline
28: code <= 6'h27;
29: code <= 6'h20;//p
30: code <= 6'h27;
31: code <= 6'h22;//r
32: code <= 6'h26;
33: code <= 6'h25;//e
34: code <= 6'h27;
35: code <= 6'h23;//s
36: code <= 6'h27;
37: code <= 6'h23;//s
38: code <= 6'h2A;
39: code <= 6'h20;//_
40: code <= 6'h24;
41: code <= 6'h21;//A
42: code <= 6'h2A;
43: code <= 6'h20;//_
44: code <= 6'h27;
45: code <= 6'h24;//t
46: code <= 6'h26;
47: code <= 6'h2F;//o
48: code <= 6'h2A;
49: code <= 6'h20;//_
50: code <= 6'h27;
51: code <= 6'h23;//s
52: code <= 6'h27;
53: code <= 6'h24;//t
54: code <= 6'h26;
55: code <= 6'h21;//a
56: code <= 6'h27;
57: code <= 6'h22;//r
58: code <= 6'h27;
59: code <= 6'h24;//t
// displaying question
default:
       begin 
      code <= 6'h10;
	   stage=5'b00001;
		count<=0;
		defalt=0;
		 end
endcase
          end
	else if((stage==5'b00001 && in5)||q1)	
         begin   
			        if(in4 || aq1)
					     begin
						           if(aq1==0)
									       begin
											 aq1=1;
											 count<=0;
											 b1=1;
											 end
											 else
											    begin
                         count<=count+1;
                        case(count[27:21])
     								0: code <= 6'h03;
                           1: code <= 6'h03;
                           2: code <= 6'h03;
                           3: code <= 6'h02;  
                           4: code <= 6'h02;
                           5: code <= 6'h08;
                           6: code <= 6'h00;
                           7: code <= 6'h06;
                           8: code <= 6'h00;
                           9: code <= 6'h0C;
                           10:code <= 6'h00;
                           11:code <= 6'h01;
                     //displaying default sentence
                          12: code <= 6'h26;
                          13: code <= 6'h23;//c
                          14: code <= 6'h26;
                          15: code <= 6'h2F;//o
                          16: code <= 6'h27;
                          17: code <= 6'h22;//r
                          18: code <= 6'h27;
                          19: code <= 6'h22;//c
                          20: code <= 6'h26;
                          21: code <= 6'h25;//e
                          22: code <= 6'h26;
                          23: code <= 6'h23;//c
                          24: code <= 6'h27;
                          25: code <= 6'h24;//t
								  default: begin 
								         code <= 6'h10;
										//	stage=5'b00010;
										   stage2=1;
											aq1=0;
											 q1=0;
											 counter=counter+1;
											 count<=0;
								           end
                        endcase  
								      end
						  end
			    else if(in1||in2||in3||wq1)
				          begin
						         if(wq1==0)
									       begin
											 wq1=1;
											 count<=0;
											 b2=1;
											 end
									 else
									     begin
                         count<=count+1;
                        case(count[27:21])
     								0:code  <= 6'h03;
                           1: code <= 6'h03;
                           2: code <= 6'h03;
                           3: code <= 6'h02;  
                           4: code <= 6'h02;
                           5: code <= 6'h08;
                           6: code <= 6'h00;
                           7: code <= 6'h06;
                           8: code <= 6'h00;
                           9: code <= 6'h0C;
                           10:code <= 6'h00;
                           11:code <= 6'h01;
                     //displaying default sentence
                          12: code <= 6'h27;
                          13: code <= 6'h27;//w
                          14: code <= 6'h27;
                          15: code <= 6'h22;//r
                          16: code <= 6'h26;
                          17: code <= 6'h2F;//o
                          18: code <= 6'h26;
                          19: code <= 6'h2E;//n
                          20: code <= 6'h26;
                          21: code <= 6'h27;//g
								  default: begin 
								         code <= 6'h10;
										//	stage=5'b00010;
											wq1=0;
											 q1=0;
											 stage2=1;
											 count<=0;
								          end
                        endcase 
								    end
							 end
			else
			  begin
            count <= count+1;			
            case(count[27:21])
            0:  begin
            q1=1;
            code <= 6'h03;
                end
            1: code <= 6'h03;
            2: code <= 6'h03;
            3: code <= 6'h02;  
            4: code <= 6'h02;
            5: code <= 6'h08;
            6: code <= 6'h00;
            7: code <= 6'h06;
            8: code <= 6'h00;
            9: code <= 6'h0C;
            10:code <= 6'h00;
            11:code <= 6'h01;
              // displaying q1
            12: code <= 6'h25;
            13: code <= 6'h27;//w
            14: code <= 6'h26;
            15: code <= 6'h28;//h
            16: code <= 6'h26;
            17: code <= 6'h29;//i
            18: code <= 6'h26;
            19: code <= 6'h23;//c
            20: code <= 6'h26;
            21: code <= 6'h28;//h
            22: code <= 6'h2A;
            23: code <= 6'h20;//_
            24: code <= 6'h26;
            25: code <= 6'h29;//i
            26: code <= 6'h27;
            27: code <= 6'h23;//s
            28: code <= 6'h2A;
            29: code <= 6'h20;//_
            30: code <= 6'h26;
            31: code <= 6'h25;//e
            32: code <= 6'h27;
            33: code <= 6'h26;//v
            34: code <= 6'h26;
            35: code <= 6'h25;//e
            36: code <= 6'h26;
            37: code <= 6'h2E;//n
            38: code <= 6'b001100;
            39: code <= 6'b000000; //newline
            40: code <= 6'h27;
            41: code <= 6'h20;//p
            42: code <= 6'h27;
            43: code <= 6'h22;//r
            44: code <= 6'h26;
            45: code <= 6'h29;//i
            46: code <= 6'h26;
            47: code <= 6'h2D;//m
            48: code <= 6'h26;
            49: code <= 6'h25;//e
            50: code <= 6'h23;
            51: code <= 6'h2F;//?
			  // 52: code <= 6'h00;
			 //  53: code <= 6'h24;
          //  54: code <= 6'h21;//A	
            52:code <= 6'h00;
            53:code <= 6'h01;	
			   54: code <= 6'h24;
            55: code <= 6'h21;//A	
 			   56: code <= 6'h22;
            57: code <= 6'h29;//)	
			   58: code <= 6'h23;
            59: code <= 6'h21;//1	
			   60: code <= 6'h2A;
            61: code <= 6'h20;//_	
			   62: code <= 6'h24;
            63: code <= 6'h22;//B
			   64: code <= 6'h22;
            65: code <= 6'h29;//)	
			   66: code <= 6'h23;
            67: code <= 6'h20;//0	
			   68: code <= 6'h2A;
            69: code <= 6'h20;//_	
			   70: code <= 6'h24;
            71: code <= 6'h23;//C	
			   72: code <= 6'h22;
            73: code <= 6'h29;//)	
			   74: code <= 6'h23;
            75: code <= 6'h25;//5	
			   76: code <= 6'h2A;
            77: code <= 6'h20;//_	
			   78: code <= 6'h24;
            79: code <= 6'h24;//D
			   80: code <= 6'h22;
            81: code <= 6'h29;//)	
			   82: code <= 6'h23;
            83: code <= 6'h22;//2					
            default: begin
                code <= 6'h10;
		          stage=5'b00010;
			           end
                  endcase   

            end
    
        end		

   else if((stage2 && in5)|| q2 )	
            begin
				if(in2 || aq2)
					     begin
						           if(aq2==0)
									       begin
											 aq2=1;
											 count<=0;
											 b1=1;
											 end
											 else
											    begin
                         count<=count+1;
                        case(count[27:21])
     								0:code  <= 6'h03;
                           1: code <= 6'h03;
                           2: code <= 6'h03;
                           3: code <= 6'h02;  
                           4: code <= 6'h02;
                           5: code <= 6'h08;
                           6: code <= 6'h00;
                           7: code <= 6'h06;
                           8: code <= 6'h00;
                           9: code <= 6'h0C;
                           10:code <= 6'h00;
                           11:code <= 6'h01;
                     //displaying default sentence
                          12: code <= 6'h26;
                          13: code <= 6'h23;//c
                          14: code <= 6'h26;
                          15: code <= 6'h2F;//o
                          16: code <= 6'h27;
                          17: code <= 6'h22;//r
                          18: code <= 6'h27;
                          19: code <= 6'h22;//c
                          20: code <= 6'h26;
                          21: code <= 6'h25;//e
                          22: code <= 6'h26;
                          23: code <= 6'h23;//c
                          24: code <= 6'h27;
                          25: code <= 6'h24;//t
								  default: begin 
								         code <= 6'h10;
										//	stage=5'b00010;
											aq2=0;
											 q2=0;
											 stage3=1;
											 stage2=0;
											 counter=counter+1;
											 count<=0;
								           end
                        endcase  
								      end
						  end
			    else if(in1||in4||in3||wq2)
				          begin
						         if(wq2==0)
									       begin
											 wq2=1;
											 count<=0;
											 b2=1;
											 end
									 else
									     begin
                         count<=count+1;
                        case(count[27:21])
     								0:code  <= 6'h03;
                           1: code <= 6'h03;
                           2: code <= 6'h03;
                           3: code <= 6'h02;  
                           4: code <= 6'h02;
                           5: code <= 6'h08;
                           6: code <= 6'h00;
                           7: code <= 6'h06;
                           8: code <= 6'h00;
                           9: code <= 6'h0C;
                           10:code <= 6'h00;
                           11:code <= 6'h01;
                     //displaying default sentence
                          12: code <= 6'h27;
                          13: code <= 6'h27;//w
                          14: code <= 6'h27;
                          15: code <= 6'h22;//r
                          16: code <= 6'h26;
                          17: code <= 6'h2F;//o
                          18: code <= 6'h26;
                          19: code <= 6'h2E;//n
                          20: code <= 6'h26;
                          21: code <= 6'h27;//g
								  default: begin 
								         code <= 6'h10;
										//	stage=5'b00010;
											wq2=0;
											 q2=0;
											 stage3=1;
											 stage2=0;
											 count<=0;
								          end
                        endcase 
								    end
							 end
			else
			  begin
            count <= count+1;			
            case(count[27:21])
            0:  begin
            q2=1;
				b1=0;
				b2=0;
            code <= 6'h03;
                end
            1: code <= 6'h03;
            2: code <= 6'h03;
            3: code <= 6'h02;  
            4: code <= 6'h02;
            5: code <= 6'h08;
            6: code <= 6'h00;
            7: code <= 6'h06;
            8: code <= 6'h00;
            9: code <= 6'h0C;
            10:code <= 6'h00;
            11:code <= 6'h01;
              // displaying q1
            12: code <= 6'h24;
            13: code <= 6'h26;//F
            14: code <= 6'h26;
            15: code <= 6'h21;//a
            16: code <= 6'h26;
            17: code <= 6'h2D;//m
            18: code <= 6'h26;
            19: code <= 6'h2F;//o
            20: code <= 6'h27;
            21: code <= 6'h25;//u
            22: code <= 6'h27;
            23: code <= 6'h23;//s
            24: code <= 6'h2A;
            25: code <= 6'h20;//_
            26: code <= 6'h26;
            27: code <= 6'h23;//c
            28: code <= 6'h26;
            29: code <= 6'h21;//a
            30: code <= 6'h27;
            31: code <= 6'h22;//r
            32: code <= 6'h27;
            33: code <= 6'h24;//t
            34: code <= 6'h26;
            35: code <= 6'h2F;//o
            36: code <= 6'h26;
            37: code <= 6'h2F;//o
            38: code <= 6'h26;
            39: code <= 6'h2E; //n
            40: code <= 6'b001100;
            41: code <= 6'b000000;//newline
            42: code <= 6'h26;
            43: code <= 6'h23;//c
            44: code <= 6'h26;
            45: code <= 6'h21;//a
            46: code <= 6'h27;
            47: code <= 6'h24;//t
            48: code <= 6'h23;
            49: code <= 6'h2F;//?
            50: code <= 6'h2A;
            51: code <= 6'h20;//_
				
            52:code <= 6'h00;
            53:code <= 6'h01;	
			   54: code <= 6'h24;
            55: code <= 6'h21;//A	
 			   56: code <= 6'h22;
            57: code <= 6'h29;//)	
			   58: code <= 6'h24;
            59: code <= 6'h22;//B	
			   60: code <= 6'h26;
            61: code <= 6'h25;//e	
			   62: code <= 6'h26;
            63: code <= 6'h2E;//n
			   64: code <= 6'h2A;
            65: code <= 6'h20;//_	
			   66: code <= 6'h24;
            67: code <= 6'h22;//B	
			   68: code <= 6'h22;
            69: code <= 6'h29;//)	
			   70: code <= 6'h25;
            71: code <= 6'h24;//T	
			   72: code <= 6'h26;
            73: code <= 6'h2F;//o	
			   74: code <= 6'h26;
            75: code <= 6'h2D;//m	
			   76: code <= 6'b001100;
            77: code <= 6'b000000;//_	newline
			   78: code <= 6'h24;
            79: code <= 6'h23;//C
			   80: code <= 6'h22;
            81: code <= 6'h29;//)	
			   82: code <= 6'h24;
            83: code <= 6'h2A;//J
			   84: code <= 6'h26;
            85: code <= 6'h29;//i	
			   86: code <= 6'h26;
            87: code <= 6'h2D;//m	
			   88: code <= 6'h2A;
            89: code <= 6'h20;//_	
			   90: code <= 6'h24;
            91: code <= 6'h24;//D	
			   92: code <= 6'h22;
            93: code <= 6'h29;//)	
			   94: code <= 6'h25;
            95: code <= 6'h23;//S
			   96: code <= 6'h26;
            97: code <= 6'h21;//a	
			   98: code <= 6'h26;
            99: code <= 6'h2D;//m						
            default: begin
                code <= 6'h10;
		          stage=5'b00011;
			           end
                  endcase   

            end
				
				end	

 else if((stage3 && in5) || q3)
         begin
                  if(in1 || aq3)
					     begin
						           if(aq3==0)
									       begin
											 aq3=1;
											 count<=0;
											 b1=1;
											 end
											 else
											    begin
                         count<=count+1;
                        case(count[27:21])
     								0: code  <= 6'h03;
                           1: code <= 6'h03;
                           2: code <= 6'h03;
                           3: code <= 6'h02;  
                           4: code <= 6'h02;
                           5: code <= 6'h08;
                           6: code <= 6'h00;
                           7: code <= 6'h06;
                           8: code <= 6'h00;
                           9: code <= 6'h0C;
                           10:code <= 6'h00;
                           11:code <= 6'h01;
                     //displaying default sentence
                          12: code <= 6'h26;
                          13: code <= 6'h23;//c
                          14: code <= 6'h26;
                          15: code <= 6'h2F;//o
                          16: code <= 6'h27;
                          17: code <= 6'h22;//r
                          18: code <= 6'h27;
                          19: code <= 6'h22;//c
                          20: code <= 6'h26;
                          21: code <= 6'h25;//e
                          22: code <= 6'h26;
                          23: code <= 6'h23;//c
                          24: code <= 6'h27;
                          25: code <= 6'h24;//t
								  default: begin 
								         code <= 6'h10;
										//	stage=5'b00010;
											aq3=0;
											 q3=0;
											 stage3=0;
											 stage4=1;
											 counter=counter+1;
											 count<=0;
								           end
                        endcase  
								      end
						  end
			    else if(in2||in4||in3||wq3)
				          begin
						         if(wq3==0)
									       begin
											 wq3=1;
											 count<=0;
											 b2=1;
											 end
									 else
									     begin
                         count<=count+1;
                        case(count[27:21])
     								0:code  <= 6'h03;
                           1: code <= 6'h03;
                           2: code <= 6'h03;
                           3: code <= 6'h02;  
                           4: code <= 6'h02;
                           5: code <= 6'h08;
                           6: code <= 6'h00;
                           7: code <= 6'h06;
                           8: code <= 6'h00;
                           9: code <= 6'h0C;
                           10:code <= 6'h00;
                           11:code <= 6'h01;
                     //displaying default sentence
                          12: code <= 6'h27;
                          13: code <= 6'h27;//w
                          14: code <= 6'h27;
                          15: code <= 6'h22;//r
                          16: code <= 6'h26;
                          17: code <= 6'h2F;//o
                          18: code <= 6'h26;
                          19: code <= 6'h2E;//n
                          20: code <= 6'h26;
                          21: code <= 6'h27;//g
								  default: begin 
								         code <= 6'h10;
										//	stage=5'b00010;
											wq3=0;
											 q3=0;
											 stage3=0;
											 stage4=1;
											 count<=0;
								          end
                        endcase 
								    end
							 end
			else
			  begin
            count <= count+1;			
            case(count[27:21])
            0:  begin
            q3=1;
            code <= 6'h03;
				b1=0;
				b2=0;
                end
            1: code <= 6'h03;
            2: code <= 6'h03;
            3: code <= 6'h02;  
            4: code <= 6'h02;
            5: code <= 6'h08;
            6: code <= 6'h00;
            7: code <= 6'h06;
            8: code <= 6'h00;
            9: code <= 6'h0C;
            10:code <= 6'h00;
            11:code <= 6'h01;
              // displaying q1
            12: code <= 6'h24;
            13: code <= 6'h2E;//N
            14: code <= 6'h27;
            15: code <= 6'h25;//u
            16: code <= 6'h26;
            17: code <= 6'h2D;//m
            18: code <= 6'h26;
            19: code <= 6'h22;//b
            20: code <= 6'h26;
            21: code <= 6'h25;//e
            22: code <= 6'h27;
            23: code <= 6'h22;//r
            24: code <= 6'h2A;
            25: code <= 6'h20;//_
            26: code <= 6'h26;
            27: code <= 6'h2F;//o
            28: code <= 6'h26;
            29: code <= 6'h26;//f
            30: code <= 6'h2A;
            31: code <= 6'h20;//_
            32: code <= 6'h27;
            33: code <= 6'h23;//s
            34: code <= 6'h27;
            35: code <= 6'h20;//p
            36: code <= 6'h26;
            37: code <= 6'h2F;//o
            38: code <= 6'h26;
            39: code <= 6'h2B; //k
            40: code <= 6'h26;
            41: code <= 6'h25;//e
            42: code <= 6'h27;
            43: code <= 6'h23;//s
            44: code <= 6'b001100;
            45: code <= 6'b000000;//newline
            46: code <= 6'h26;
            47: code <= 6'h29;//i
            48: code <= 6'h26;
            49: code <= 6'h2E;//n
            50: code <= 6'h2A;
            51: code <= 6'h20;//_
            52: code <= 6'h26;
            53: code <= 6'h21;//a
				54: code <= 6'h27;
            55: code <= 6'h23;//s
				56: code <= 6'h26;
            57: code <= 6'h28;//h
				58: code <= 6'h26;
            59: code <= 6'h2F;//0
				60: code <= 6'h26;
            61: code <= 6'h2B;//k
				62: code <= 6'h26;
            63: code <= 6'h21;//a
				64: code <= 6'h2A;
            65: code <= 6'h20;//_
				66: code <= 6'h26;
            67: code <= 6'h23;//c
				68: code <= 6'h26;
            69: code <= 6'h28;//h
				70: code <= 6'h26;
            71: code <= 6'h21;//a
				72: code <= 6'h26;
            73: code <= 6'h2B;//k
				74: code <= 6'h27;
            75: code <= 6'h22;//r
				76: code <= 6'h26;
            77: code <= 6'h21;//a				
            78: code <= 6'h00;
            79: code <= 6'h01;//clear
			   80: code <= 6'h24;
            81: code <= 6'h21;//A	
 			   82: code <= 6'h22;
            83: code <= 6'h29;//)	
				84: code <= 6'h23;
            85: code <= 6'h22;//2
            86: code <= 6'h23;
            87: code <= 6'h24;//4	
			   88: code <= 6'h2A;
            89: code <= 6'h20;//_	
			   90: code <= 6'h24;
            91: code <= 6'h22;//B	
			   92: code <= 6'h22;
            93: code <= 6'h29;//)	
			   94: code <= 6'h23;
            95: code <= 6'h21;//1	
			   96: code <= 6'h23;
            97: code <= 6'h26;//6	
			   98: code <= 6'b001100;
            99: code <= 6'b000000;//_	newline
			  100: code <= 6'h24;
           101: code <= 6'h23;//C
			  102: code <= 6'h22;
           103: code <= 6'h29;//)	
			  104: code <= 6'h23;
           105: code <= 6'h21;//1
			  106: code <= 6'h23;
           107: code <= 6'h28;//8		
			  108: code <= 6'h2A;
           109: code <= 6'h20;//_	
			  110: code <= 6'h24;
           111: code <= 6'h24;//D	
			  112: code <= 6'h22;
           113: code <= 6'h29;//)	
			  114: code <= 6'h23;
           115: code <= 6'h22;//2
			  116: code <= 6'h23;
           117: code <= 6'h26;//6				
            default: begin
                code <= 6'h10;
		          stage=5'b00011;
			           end
                  endcase   

            end
           end			
 else if((stage4 && in5)||q4)
      begin
                   if(in3 || aq4)
					     begin
						           if(aq4==0)
									       begin
											 aq4=1;
											 count<=0;
											 b1=1;
											 end
											 else
											    begin
                         count<=count+1;
                        case(count[27:21])
     								0: code  <= 6'h03;
                           1: code <= 6'h03;
                           2: code <= 6'h03;
                           3: code <= 6'h02;  
                           4: code <= 6'h02;
                           5: code <= 6'h08;
                           6: code <= 6'h00;
                           7: code <= 6'h06;
                           8: code <= 6'h00;
                           9: code <= 6'h0C;
                           10:code <= 6'h00;
                           11:code <= 6'h01;
                     //displaying default sentence
                          12: code <= 6'h26;
                          13: code <= 6'h23;//c
                          14: code <= 6'h26;
                          15: code <= 6'h2F;//o
                          16: code <= 6'h27;
                          17: code <= 6'h22;//r
                          18: code <= 6'h27;
                          19: code <= 6'h22;//c
                          20: code <= 6'h26;
                          21: code <= 6'h25;//e
                          22: code <= 6'h26;
                          23: code <= 6'h23;//c
                          24: code <= 6'h27;
                          25: code <= 6'h24;//t
								  default: begin 
								         code <= 6'h10;
										//	stage=5'b00010;
											aq4=0;
											 q4=0;
											 stage4=0;
											 stage5=1;
											 counter=counter+1;
											 count<=0;
								           end
                        endcase  
								      end
						  end
			    else if(in2||in4||in1||wq4)
				          begin
						         if(wq4==0)
									       begin
											 wq4=1;
											 count<=0;
											 b2=1;
											 end
									 else
									     begin
                         count<=count+1;
                        case(count[27:21])
     								0:code  <= 6'h03;
                           1: code <= 6'h03;
                           2: code <= 6'h03;
                           3: code <= 6'h02;  
                           4: code <= 6'h02;
                           5: code <= 6'h08;
                           6: code <= 6'h00;
                           7: code <= 6'h06;
                           8: code <= 6'h00;
                           9: code <= 6'h0C;
                           10:code <= 6'h00;
                           11:code <= 6'h01;
                     //displaying default sentence
                          12: code <= 6'h27;
                          13: code <= 6'h27;//w
                          14: code <= 6'h27;
                          15: code <= 6'h22;//r
                          16: code <= 6'h26;
                          17: code <= 6'h2F;//o
                          18: code <= 6'h26;
                          19: code <= 6'h2E;//n
                          20: code <= 6'h26;
                          21: code <= 6'h27;//g
								  default: begin 
								         code <= 6'h10;
										//	stage=5'b00010;
											wq4=0;
											 q4=0;
											 stage4=0;
											 stage5=1;
											 count<=0;
								          end
                        endcase 
								    end
							 end
			else
			  begin
            count <= count+1;			
            case(count[27:21])
            0:  begin
            q4=1;
            code <= 6'h03;
				b1=0;
				b2=0;
                end
            1: code <= 6'h03;
            2: code <= 6'h03;
            3: code <= 6'h02;  
            4: code <= 6'h02;
            5: code <= 6'h08;
            6: code <= 6'h00;
            7: code <= 6'h06;
            8: code <= 6'h00;
            9: code <= 6'h0C;
            10:code <= 6'h00;
            11:code <= 6'h01;
              // displaying q4
            12: code <= 6'h24;
            13: code <= 6'h2E;//N
            14: code <= 6'h27;
            15: code <= 6'h25;//u
            16: code <= 6'h26;
            17: code <= 6'h2D;//m
            18: code <= 6'h26;
            19: code <= 6'h22;//b
            20: code <= 6'h26;
            21: code <= 6'h25;//e
            22: code <= 6'h27;
            23: code <= 6'h22;//r
            24: code <= 6'h2A;
            25: code <= 6'h20;//_
            26: code <= 6'h26;
            27: code <= 6'h2F;//o
            28: code <= 6'h26;
            29: code <= 6'h26;//f
            30: code <= 6'h2A;
            31: code <= 6'h20;//_
            32: code <= 6'h26;
            33: code <= 6'h24;//d
            34: code <= 6'h26;
            35: code <= 6'h29;//i
            36: code <= 6'h26;
            37: code <= 6'h27;//g
            38: code <= 6'h26;
            39: code <= 6'h29; //i
            40: code <= 6'h27;
            41: code <= 6'h24;//t
            42: code <= 6'h27;
            43: code <= 6'h23;//s
            44: code <= 6'b001100;
            45: code <= 6'b000000;//newline
            46: code <= 6'h26;
            47: code <= 6'h29;//i
            48: code <= 6'h26;
            49: code <= 6'h2E;//n
            50: code <= 6'h2A;
            51: code <= 6'h20;//_
            52: code <= 6'h27;
            53: code <= 6'h20;//p
				54: code <= 6'h26;
            55: code <= 6'h29;//i
				56: code <= 6'h26;
            57: code <= 6'h2E;//n
				58: code <= 6'h26;
            59: code <= 6'h23;//c
				60: code <= 6'h26;
            61: code <= 6'h2F;//o
				62: code <= 6'h26;
            63: code <= 6'h24;//d
				64: code <= 6'h26;
            65: code <= 6'h25;//e
				66: code <= 6'h23;
            67: code <= 6'h2F;//?
				68: code <= 6'h2A;
            69: code <= 6'h20;//_				
            70: code <= 6'h00;
            71: code <= 6'h01;//clear
			   72: code <= 6'h24;
            73: code <= 6'h21;//A	
 			   74: code <= 6'h22;
            75: code <= 6'h29;//)	
				76: code <= 6'h23;
            77: code <= 6'h22;//2	
			   78: code <= 6'h2A;
            79: code <= 6'h20;//_	
			   80: code <= 6'h24;
            81: code <= 6'h22;//B	
			   82: code <= 6'h22;
            83: code <= 6'h29;//)	
			   84: code <= 6'h23;
            85: code <= 6'h27;//7	
			   86: code <= 6'b001100;
            87: code <= 6'b000000;//_	newline
			   88: code <= 6'h24;
            89: code <= 6'h23;//C
			   90: code <= 6'h22;
            91: code <= 6'h29;//)	
			   92: code <= 6'h23;
            93: code <= 6'h26;//6		
			   94: code <= 6'h2A;
            95: code <= 6'h20;//_	
			   96: code <= 6'h24;
            97: code <= 6'h24;//D	
			   98: code <= 6'h22;
            99: code <= 6'h29;//)	
			  100: code <= 6'h23;
           101: code <= 6'h25;//5			
            default: begin
                code <= 6'h10;
		          stage=5'b00111;
			           end
                  endcase   

            end    
      end	
else if((stage5 && in5)|| q5)
       begin
                       if(in4 || aq5)
					     begin
						           if(aq5==0)
									       begin
											 aq5=1;
											 count<=0;
											 b1=1;
											 end
											 else
											    begin
                         count<=count+1;
                        case(count[27:21])
     								0: code  <= 6'h03;
                           1: code <= 6'h03;
                           2: code <= 6'h03;
                           3: code <= 6'h02;  
                           4: code <= 6'h02;
                           5: code <= 6'h08;
                           6: code <= 6'h00;
                           7: code <= 6'h06;
                           8: code <= 6'h00;
                           9: code <= 6'h0C;
                           10:code <= 6'h00;
                           11:code <= 6'h01;
                     //displaying default sentence
                          12: code <= 6'h26;
                          13: code <= 6'h23;//c
                          14: code <= 6'h26;
                          15: code <= 6'h2F;//o
                          16: code <= 6'h27;
                          17: code <= 6'h22;//r
                          18: code <= 6'h27;
                          19: code <= 6'h22;//c
                          20: code <= 6'h26;
                          21: code <= 6'h25;//e
                          22: code <= 6'h26;
                          23: code <= 6'h23;//c
                          24: code <= 6'h27;
                          25: code <= 6'h24;//t
								  default: begin 
								         code <= 6'h10;
										//	stage=5'b00010;
											aq5=0;
											 q5=0;
											 stage5=0;
											 stage6=1;
											 counter=counter+1;
											 count<=0;
								           end
                        endcase  
								      end
					end
			    else if(in2||in3||in1||wq5)
				          begin
						         if(wq5==0)
									       begin
											 wq5=1;
											 count<=0;
											 b2=1;
											 end
									 else
									     begin
                         count<=count+1;
                        case(count[27:21])
     								0:code  <= 6'h03;
                           1: code <= 6'h03;
                           2: code <= 6'h03;
                           3: code <= 6'h02;  
                           4: code <= 6'h02;
                           5: code <= 6'h08;
                           6: code <= 6'h00;
                           7: code <= 6'h06;
                           8: code <= 6'h00;
                           9: code <= 6'h0C;
                           10:code <= 6'h00;
                           11:code <= 6'h01;
                     //displaying default sentence
                          12: code <= 6'h27;
                          13: code <= 6'h27;//w
                          14: code <= 6'h27;
                          15: code <= 6'h22;//r
                          16: code <= 6'h26;
                          17: code <= 6'h2F;//o
                          18: code <= 6'h26;
                          19: code <= 6'h2E;//n
                          20: code <= 6'h26;
                          21: code <= 6'h27;//g
								  default: begin 
								         code <= 6'h10;
										//	stage=5'b00010;
											wq5=0;
											 q5=0;
											 stage5=0;
											 stage6=1;
											 count<=0;
								          end
                        endcase 
								    end
							 end
			else
			  begin
            count <= count+1;			
            case(count[27:21])
            0:  begin
            q5=1;
            code <= 6'h03;
				b1=0;
				b2=0;
                end
            1: code <= 6'h03;
            2: code <= 6'h03;
            3: code <= 6'h02;  
            4: code <= 6'h02;
            5: code <= 6'h08;
            6: code <= 6'h00;
            7: code <= 6'h06;
            8: code <= 6'h00;
            9: code <= 6'h0C;
            10:code <= 6'h00;
            11:code <= 6'h01;
              // displaying q4
            12: code <= 6'h25;
            13: code <= 6'h23;//S
            14: code <= 6'h27;
            15: code <= 6'h25;//u
            16: code <= 6'h26;
            17: code <= 6'h2D;//m
            18: code <= 6'h2A;
            19: code <= 6'h20;//_
            20: code <= 6'h26;
            21: code <= 6'h2F;//o
            22: code <= 6'h26;
            23: code <= 6'h26;//f
            24: code <= 6'h2A;
            25: code <= 6'h20;//_
            26: code <= 6'h26;
            27: code <= 6'h21;//a
            28: code <= 6'h26;
            29: code <= 6'h2E;//n
            30: code <= 6'h26;
            31: code <= 6'h27;//g
            32: code <= 6'h26;
            33: code <= 6'h2C;//l
            34: code <= 6'h26;
            35: code <= 6'h25;//e
            36: code <= 6'h27;
            37: code <= 6'h23;//s
            38: code <= 6'h2A;
            39: code <= 6'h20; //_
            40: code <= 6'h26;
            41: code <= 6'h29;//i
            42: code <= 6'h26;
            43: code <= 6'h2E;//n
            44: code <= 6'b001100;
            45: code <= 6'b000000;//newline
            46: code <= 6'h26;
            47: code <= 6'h21;//a
            48: code <= 6'h2A;
            49: code <= 6'h20;//_
            50: code <= 6'h27;
            51: code <= 6'h24;//t
            52: code <= 6'h27;
            53: code <= 6'h22;//r
				54: code <= 6'h26;
            55: code <= 6'h29;//i
				56: code <= 6'h26;
            57: code <= 6'h21;//a
				58: code <= 6'h26;
            59: code <= 6'h2E;//n
				60: code <= 6'h26;
            61: code <= 6'h27;//g
				62: code <= 6'h26;
            63: code <= 6'h2C;//l
				64: code <= 6'h26;
            65: code <= 6'h25;//e
				66: code <= 6'h23;
            67: code <= 6'h2F;//?
				68: code <= 6'h2A;
            69: code <= 6'h20;//_				
            70: code <= 6'h00;
            71: code <= 6'h01;//clear
			   72: code <= 6'h24;
            73: code <= 6'h21;//A	
 			   74: code <= 6'h22;
            75: code <= 6'h29;//)	
				76: code <= 6'h23;
            77: code <= 6'h29;//9
				78: code <= 6'h23;
            79: code <= 6'h20;//0				
			   80: code <= 6'h2A;
            81: code <= 6'h20;//_	
			   82: code <= 6'h24;
            83: code <= 6'h22;//B	
			   84: code <= 6'h22;
            85: code <= 6'h29;//)	
			   86: code <= 6'h23;
            87: code <= 6'h24;//4
				88: code <= 6'h23;
            89: code <= 6'h25;//5				
			   90: code <= 6'b001100;
            91: code <= 6'b000000;//_	newline
			   92: code <= 6'h24;
            93: code <= 6'h23;//C
			   94: code <= 6'h22;
            95: code <= 6'h29;//)	
			   96: code <= 6'h23;
            97: code <= 6'h23;//3
				98: code <= 6'h23;
            99: code <= 6'h26;//6
			  100: code <= 6'h23;
           101: code <= 6'h20;//0				
			  102: code <= 6'h2A;
           103: code <= 6'h20;//_	
			  104: code <= 6'h24;
           105: code <= 6'h24;//D	
			  106: code <= 6'h22;
           107: code <= 6'h29;//)	
			  108: code <= 6'h23;
           109: code <= 6'h21;//1
			  110: code <= 6'h23;
           111: code <= 6'h28;//8
			  112: code <= 6'h23;
           113: code <= 6'h20;//0				
            default: begin
                code <= 6'h10;
		          stage=5'b01111;
			           end
                  endcase   

            end 
        end	 
	else if(stage6 || res)
	      begin
			
               if(counter>=3)
					     begin
                         count<=count+1;
                        case(count[27:21])
     								0: begin
									code  <= 6'h03;
									b1=1;
									   end
                           1: code <= 6'h03;
                           2: code <= 6'h03;
                           3: code <= 6'h02;  
                           4: code <= 6'h02;
                           5: code <= 6'h08;
                           6: code <= 6'h00;
                           7: code <= 6'h06;
                           8: code <= 6'h00;
                           9: code <= 6'h0C;
                           10:code <= 6'h00;
                           11:code <= 6'h01;
                     //displaying default sentence
                          12: code <= 6'h25;
                          13: code <= 6'h29;//Y
                          14: code <= 6'h26;
                          15: code <= 6'h2F;//o
                          16: code <= 6'h27;
                          17: code <= 6'h25;//u
                          18: code <= 6'h2A;
                          19: code <= 6'h20;//_
                          20: code <= 6'h27;
                          21: code <= 6'h27;//w
                          22: code <= 6'h26;
                          23: code <= 6'h2F;//o
                          24: code <= 6'h26;
                          25: code <= 6'h2E;//n
								  26: code <= 6'h22;
                          27: code <= 6'h21;//!
                          28: code <= 6'h22;
                          29: code <= 6'h21;//!									
								default: begin 
								         code <= 6'h10;
											 stage6=0;
											 count<=0;
								           end
                        endcase  
						  end
						 else
						     begin
			                         count<=count+1;
                        case(count[27:21])
     								0:begin
									b2=1;
									code  <= 6'h03;
									end
                           1: code <= 6'h03;
                           2: code <= 6'h03;
                           3: code <= 6'h02;  
                           4: code <= 6'h02;
                           5: code <= 6'h08;
                           6: code <= 6'h00;
                           7: code <= 6'h06;
                           8: code <= 6'h00;
                           9: code <= 6'h0C;
                           10:code <= 6'h00;
                           11:code <= 6'h01;
                     //displaying default sentence
                          12: code <= 6'h25;
                          13: code <= 6'h29;//Y
                          14: code <= 6'h26;
                          15: code <= 6'h2F;//o
                          16: code <= 6'h27;
                          17: code <= 6'h25;//u
                          18: code <= 6'h2A;
                          19: code <= 6'h20;//_
                          20: code <= 6'h26;
                          21: code <= 6'h2C;//l
                          22: code <= 6'h26;
                          23: code <= 6'h2F;//o
                          24: code <= 6'h27;
                          25: code <= 6'h23;//s
                          26: code <= 6'h27;
                          27: code <= 6'h24;//t	
                          28: code <= 6'h22;
                          29: code <= 6'h21;//!	
                          30: code <= 6'h22;
                          31: code <= 6'h21;//!									  
								  default: begin 
								         code <= 6'h10;
											 stage6=0;
											 count<=0;
								           end
                        endcase  				  
							  
							  
							  end
							
			
			
			
			end
refresh <= count[20];
sf_e<= 1;
{e, rs, rw,d,c,b,a} <= {refresh,code};
end
endmodule
