
module tas ( clk_50, clk_2, reset_n, serial_data, data_ena, ram_wr_n, ram_data, 
        ram_addr );
  output [7:0] ram_data;
  output [10:0] ram_addr;
  input clk_50, clk_2, reset_n, serial_data, data_ena;
  output ram_wr_n;
  wire   write, fifo_empty, n3, n4, n5, n6, \ctrl_50mhz_0/n15 ,
         \ctrl_50mhz_0/n14 , \ctrl_50mhz_0/n13 , \ctrl_50mhz_0/n12 ,
         \ctrl_50mhz_0/n11 , \ctrl_50mhz_0/n10 , \ctrl_50mhz_0/n7 ,
         \ctrl_50mhz_0/n6 , \ctrl_50mhz_0/n4 , \ctrl_50mhz_0/n3 ,
         \ctrl_50mhz_0/which_byte_ps[0] , \ctrl_50mhz_0/which_byte_ps[1] ,
         \ctrl_50mhz_0/which_byte_ps[2] , \ctrl_50mhz_0/write_fifo_ns ,
         \ctrl_50mhz_0/which_byte_ns[1] , \ctrl_50mhz_0/which_byte_ns[2] ,
         \ctrl_50mhz_0/temp_pkt_ns , \ctrl_50mhz_0/comp_byte_ps ,
         \ctrl_2mhz_0/n4 , \ctrl_2mhz_0/N20 , \ctrl_2mhz_0/read_byte_ps[0] ,
         \ctrl_2mhz_0/read_byte_ps[1] , \ctrl_2mhz_0/write_ram_ns ,
         \ctrl_2mhz_0/read_byte_ns[0] , \ctrl_2mhz_0/read_byte_ns[1] ,
         \shift_reg_0/n9 , \shift_reg_0/n8 , \shift_reg_0/n7 ,
         \shift_reg_0/n6 , \shift_reg_0/n5 , \shift_reg_0/n4 ,
         \shift_reg_0/n3 , \shift_reg_0/n2 , \fifo_0/n280 , \fifo_0/n279 ,
         \fifo_0/n278 , \fifo_0/n277 , \fifo_0/n276 , \fifo_0/n275 ,
         \fifo_0/n274 , \fifo_0/n273 , \fifo_0/n272 , \fifo_0/n271 ,
         \fifo_0/n270 , \fifo_0/n269 , \fifo_0/n268 , \fifo_0/n267 ,
         \fifo_0/n266 , \fifo_0/n265 , \fifo_0/n264 , \fifo_0/n263 ,
         \fifo_0/n262 , \fifo_0/n261 , \fifo_0/n260 , \fifo_0/n259 ,
         \fifo_0/n258 , \fifo_0/n257 , \fifo_0/n256 , \fifo_0/n255 ,
         \fifo_0/n254 , \fifo_0/n253 , \fifo_0/n252 , \fifo_0/n251 ,
         \fifo_0/n250 , \fifo_0/n249 , \fifo_0/n248 , \fifo_0/n247 ,
         \fifo_0/n246 , \fifo_0/n245 , \fifo_0/n244 , \fifo_0/n243 ,
         \fifo_0/n242 , \fifo_0/n241 , \fifo_0/n240 , \fifo_0/n239 ,
         \fifo_0/n238 , \fifo_0/n237 , \fifo_0/n236 , \fifo_0/n235 ,
         \fifo_0/n234 , \fifo_0/n233 , \fifo_0/n232 , \fifo_0/n231 ,
         \fifo_0/n230 , \fifo_0/n229 , \fifo_0/n228 , \fifo_0/n227 ,
         \fifo_0/n226 , \fifo_0/n225 , \fifo_0/n224 , \fifo_0/n223 ,
         \fifo_0/n222 , \fifo_0/n221 , \fifo_0/n220 , \fifo_0/n219 ,
         \fifo_0/n218 , \fifo_0/n217 , \fifo_0/n216 , \fifo_0/n215 ,
         \fifo_0/n214 , \fifo_0/n213 , \fifo_0/n212 , \fifo_0/n211 ,
         \fifo_0/n210 , \fifo_0/n209 , \fifo_0/n208 , \fifo_0/n207 ,
         \fifo_0/n206 , \fifo_0/n205 , \fifo_0/n204 , \fifo_0/n203 ,
         \fifo_0/n202 , \fifo_0/n201 , \fifo_0/n200 , \fifo_0/n199 ,
         \fifo_0/n198 , \fifo_0/n197 , \fifo_0/n196 , \fifo_0/n195 ,
         \fifo_0/n194 , \fifo_0/n193 , \fifo_0/n192 , \fifo_0/n191 ,
         \fifo_0/n190 , \fifo_0/n189 , \fifo_0/n188 , \fifo_0/n187 ,
         \fifo_0/n186 , \fifo_0/n185 , \fifo_0/n184 , \fifo_0/n183 ,
         \fifo_0/n182 , \fifo_0/n181 , \fifo_0/n180 , \fifo_0/n179 ,
         \fifo_0/n178 , \fifo_0/n177 , \fifo_0/n176 , \fifo_0/n175 ,
         \fifo_0/n174 , \fifo_0/n173 , \fifo_0/n172 , \fifo_0/n171 ,
         \fifo_0/n170 , \fifo_0/n169 , \fifo_0/n168 , \fifo_0/n167 ,
         \fifo_0/n166 , \fifo_0/n165 , \fifo_0/n164 , \fifo_0/n163 ,
         \fifo_0/n162 , \fifo_0/n161 , \fifo_0/n160 , \fifo_0/n159 ,
         \fifo_0/n158 , \fifo_0/n157 , \fifo_0/n156 , \fifo_0/n155 ,
         \fifo_0/n154 , \fifo_0/n153 , \fifo_0/n152 , \fifo_0/n151 ,
         \fifo_0/n150 , \fifo_0/n149 , \fifo_0/n148 , \fifo_0/n147 ,
         \fifo_0/n146 , \fifo_0/n145 , \fifo_0/n143 , \fifo_0/n142 ,
         \fifo_0/n141 , \fifo_0/n140 , \fifo_0/n139 , \fifo_0/n138 ,
         \fifo_0/n137 , \fifo_0/n136 , \fifo_0/n135 , \fifo_0/n134 ,
         \fifo_0/n133 , \fifo_0/n132 , \fifo_0/n131 , \fifo_0/n130 ,
         \fifo_0/n129 , \fifo_0/n128 , \fifo_0/n127 , \fifo_0/n126 ,
         \fifo_0/n125 , \fifo_0/n124 , \fifo_0/n123 , \fifo_0/n122 ,
         \fifo_0/n121 , \fifo_0/n120 , \fifo_0/n119 , \fifo_0/n118 ,
         \fifo_0/n117 , \fifo_0/n116 , \fifo_0/n115 , \fifo_0/n114 ,
         \fifo_0/n113 , \fifo_0/n112 , \fifo_0/n111 , \fifo_0/n110 ,
         \fifo_0/n109 , \fifo_0/n108 , \fifo_0/n107 , \fifo_0/n106 ,
         \fifo_0/n105 , \fifo_0/n104 , \fifo_0/n103 , \fifo_0/n102 ,
         \fifo_0/n101 , \fifo_0/n98 , \fifo_0/n97 , \fifo_0/n94 , \fifo_0/n92 ,
         \fifo_0/n91 , \fifo_0/n89 , \fifo_0/n87 , \fifo_0/n77 , \fifo_0/n67 ,
         \fifo_0/n57 , \fifo_0/n46 , \fifo_0/n36 , \fifo_0/n26 , \fifo_0/n14 ,
         \fifo_0/n13 , \fifo_0/n3 , \fifo_0/rd_addr[0] , \fifo_0/rd_addr[1] ,
         \fifo_0/rd_addr[2] , \fifo_0/rd_addr[3] , \fifo_0/wr_addr[0] ,
         \fifo_0/wr_addr[1] , \fifo_0/wr_addr[2] , \fifo_0/wr_addr[3] ,
         \averager_0/n11 , \averager_0/n10 , \averager_0/n9 , \averager_0/n8 ,
         \averager_0/n7 , \averager_0/n6 , \averager_0/n5 , \averager_0/n4 ,
         \averager_0/n3 , \averager_0/n2 , \averager_0/N14 , \averager_0/N13 ,
         \averager_0/N12 , \averager_0/N11 , \averager_0/N10 , \averager_0/N9 ,
         \averager_0/N8 , \averager_0/N7 , \averager_0/N6 , \averager_0/N5 ,
         \averager_0/ac[0] , \averager_0/ac[1] , \ram_ctr_0/n17 ,
         \ram_ctr_0/n16 , \ram_ctr_0/n15 , \ram_ctr_0/n14 , \ram_ctr_0/n13 ,
         \ram_ctr_0/n12 , \ram_ctr_0/n11 , \ram_ctr_0/n10 , \ram_ctr_0/n9 ,
         \ram_ctr_0/n8 , \ram_ctr_0/n7 , \ram_ctr_0/n6 , \ram_ctr_0/n5 ,
         \ram_ctr_0/n4 , \ram_ctr_0/n3 , \ram_ctr_0/n2 , \ram_ctr_0/N15 ,
         \ram_ctr_0/N14 , \ram_ctr_0/N13 , \ram_ctr_0/N12 , \ram_ctr_0/N11 ,
         \ram_ctr_0/N10 , \ram_ctr_0/N9 , \ram_ctr_0/N8 , \ram_ctr_0/N7 ,
         \ram_ctr_0/N6 , \averager_0/dp_cluster_0/mult_add_20_aco/PROD_not[9] ,
         \averager_0/dp_cluster_0/add_20_aco/carry[8] ,
         \averager_0/dp_cluster_0/add_20_aco/carry[7] ,
         \averager_0/dp_cluster_0/add_20_aco/carry[6] ,
         \averager_0/dp_cluster_0/add_20_aco/carry[5] ,
         \averager_0/dp_cluster_0/add_20_aco/carry[4] ,
         \averager_0/dp_cluster_0/add_20_aco/carry[3] ,
         \averager_0/dp_cluster_0/add_20_aco/carry[2] , n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82,
         n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96,
         n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108,
         n109, n110, n111, n112, n113, n114, n115, n116, n117, n118, n119,
         n120, n121, n122, n123, n124, n125, n126, n127, n128, n129, n130,
         n131, n132, n133, n134, n135, n136, n137, n138, n139, n140, n141,
         n142, n143, n144, n145, n146, n147, n148, n149, n150, n151, n152,
         n153, n154, n155, n156, n157, n158, n159, n160, n161;
  wire   [7:0] parallel_data;
  wire   [7:0] fifo_out;

  DFFARX1 \ctrl_2mhz_0/reset_ac_ps_reg  ( .D(\ctrl_2mhz_0/N20 ), .CLK(clk_2), 
        .RSTB(n28), .Q(n71) );
  DFFARX1 \ctrl_50mhz_0/which_byte_ps_reg[2]  ( .D(
        \ctrl_50mhz_0/which_byte_ns[2] ), .CLK(clk_50), .RSTB(n28), .Q(
        \ctrl_50mhz_0/which_byte_ps[2] ), .QN(\ctrl_50mhz_0/n4 ) );
  FADDX1 \averager_0/dp_cluster_0/add_20_aco/U1_6  ( .A(n17), .B(fifo_out[6]), 
        .CI(\averager_0/dp_cluster_0/add_20_aco/carry[6] ), .CO(
        \averager_0/dp_cluster_0/add_20_aco/carry[7] ), .S(\averager_0/N11 )
         );
  FADDX1 \averager_0/dp_cluster_0/add_20_aco/U1_5  ( .A(n16), .B(fifo_out[5]), 
        .CI(\averager_0/dp_cluster_0/add_20_aco/carry[5] ), .CO(
        \averager_0/dp_cluster_0/add_20_aco/carry[6] ), .S(\averager_0/N10 )
         );
  FADDX1 \averager_0/dp_cluster_0/add_20_aco/U1_4  ( .A(n15), .B(fifo_out[4]), 
        .CI(\averager_0/dp_cluster_0/add_20_aco/carry[4] ), .CO(
        \averager_0/dp_cluster_0/add_20_aco/carry[5] ), .S(\averager_0/N9 ) );
  FADDX1 \averager_0/dp_cluster_0/add_20_aco/U1_3  ( .A(n14), .B(fifo_out[3]), 
        .CI(\averager_0/dp_cluster_0/add_20_aco/carry[3] ), .CO(
        \averager_0/dp_cluster_0/add_20_aco/carry[4] ), .S(\averager_0/N8 ) );
  FADDX1 \averager_0/dp_cluster_0/add_20_aco/U1_2  ( .A(n13), .B(fifo_out[2]), 
        .CI(\averager_0/dp_cluster_0/add_20_aco/carry[2] ), .CO(
        \averager_0/dp_cluster_0/add_20_aco/carry[3] ), .S(\averager_0/N7 ) );
  FADDX1 \averager_0/dp_cluster_0/add_20_aco/U1_7  ( .A(n12), .B(fifo_out[7]), 
        .CI(\averager_0/dp_cluster_0/add_20_aco/carry[7] ), .CO(
        \averager_0/dp_cluster_0/add_20_aco/carry[8] ), .S(\averager_0/N12 )
         );
  FADDX1 \averager_0/dp_cluster_0/add_20_aco/U1_1  ( .A(n11), .B(fifo_out[1]), 
        .CI(n8), .CO(\averager_0/dp_cluster_0/add_20_aco/carry[2] ), .S(
        \averager_0/N6 ) );
  DFFASX1 \ram_ctr_0/ram_addr_reg[9]  ( .D(\ram_ctr_0/n7 ), .CLK(clk_2), 
        .SETB(n47), .Q(ram_addr[9]), .QN(n144) );
  DFFASX1 \ram_ctr_0/ram_addr_reg[8]  ( .D(\ram_ctr_0/n8 ), .CLK(clk_2), 
        .SETB(n44), .Q(ram_addr[8]) );
  DFFASX1 \ram_ctr_0/ram_addr_reg[7]  ( .D(\ram_ctr_0/n9 ), .CLK(clk_2), 
        .SETB(n44), .Q(ram_addr[7]) );
  DFFASX1 \ram_ctr_0/ram_addr_reg[6]  ( .D(\ram_ctr_0/n10 ), .CLK(clk_2), 
        .SETB(n45), .Q(ram_addr[6]) );
  DFFASX1 \ram_ctr_0/ram_addr_reg[5]  ( .D(\ram_ctr_0/n11 ), .CLK(clk_2), 
        .SETB(n45), .Q(ram_addr[5]) );
  DFFASX1 \ram_ctr_0/ram_addr_reg[4]  ( .D(\ram_ctr_0/n12 ), .CLK(clk_2), 
        .SETB(n45), .Q(ram_addr[4]) );
  DFFASX1 \ram_ctr_0/ram_addr_reg[3]  ( .D(\ram_ctr_0/n13 ), .CLK(clk_2), 
        .SETB(n45), .Q(ram_addr[3]) );
  DFFASX1 \ram_ctr_0/ram_addr_reg[2]  ( .D(\ram_ctr_0/n14 ), .CLK(clk_2), 
        .SETB(n45), .Q(ram_addr[2]) );
  DFFASX1 \ram_ctr_0/ram_addr_reg[1]  ( .D(\ram_ctr_0/n15 ), .CLK(clk_2), 
        .SETB(n45), .Q(ram_addr[1]) );
  DFFASX1 \ram_ctr_0/ram_addr_reg[0]  ( .D(\ram_ctr_0/n17 ), .CLK(clk_2), 
        .SETB(n46), .Q(ram_addr[0]), .QN(n152) );
  DFFASX1 \ram_ctr_0/ram_addr_reg[10]  ( .D(\ram_ctr_0/n16 ), .CLK(clk_2), 
        .SETB(n46), .Q(ram_addr[10]) );
  DFFARX1 \ctrl_2mhz_0/write_ram_ps_reg  ( .D(\ctrl_2mhz_0/write_ram_ns ), 
        .CLK(clk_2), .RSTB(n48), .Q(ram_wr_n), .QN(n26) );
  DFFARX1 \ctrl_2mhz_0/read_byte_ps_reg[0]  ( .D(\ctrl_2mhz_0/read_byte_ns[0] ), .CLK(clk_2), .RSTB(n29), .Q(\ctrl_2mhz_0/read_byte_ps[0] ) );
  DFFARX1 \averager_0/ac_reg[8]  ( .D(\averager_0/n3 ), .CLK(clk_2), .RSTB(n43), .Q(ram_data[6]) );
  DFFARX1 \averager_0/ac_reg[7]  ( .D(\averager_0/n4 ), .CLK(clk_2), .RSTB(n43), .Q(ram_data[5]) );
  DFFARX1 \averager_0/ac_reg[6]  ( .D(\averager_0/n5 ), .CLK(clk_2), .RSTB(n43), .Q(ram_data[4]) );
  DFFARX1 \averager_0/ac_reg[5]  ( .D(\averager_0/n6 ), .CLK(clk_2), .RSTB(n43), .Q(ram_data[3]) );
  DFFARX1 \averager_0/ac_reg[4]  ( .D(\averager_0/n7 ), .CLK(clk_2), .RSTB(n43), .Q(ram_data[2]) );
  DFFARX1 \averager_0/ac_reg[3]  ( .D(\averager_0/n8 ), .CLK(clk_2), .RSTB(n43), .Q(ram_data[1]) );
  DFFARX1 \averager_0/ac_reg[2]  ( .D(\averager_0/n9 ), .CLK(clk_2), .RSTB(n44), .Q(ram_data[0]) );
  DFFARX1 \averager_0/ac_reg[1]  ( .D(\averager_0/n10 ), .CLK(clk_2), .RSTB(
        n44), .Q(\averager_0/ac[1] ) );
  DFFARX1 \averager_0/ac_reg[0]  ( .D(\averager_0/n11 ), .CLK(clk_2), .RSTB(
        n44), .Q(\averager_0/ac[0] ) );
  DFFARX1 \averager_0/ac_reg[9]  ( .D(\averager_0/n2 ), .CLK(clk_2), .RSTB(n42), .Q(ram_data[7]) );
  DFFARX1 \fifo_0/rd_addr_reg[0]  ( .D(\fifo_0/n180 ), .CLK(clk_2), .RSTB(n31), 
        .Q(\fifo_0/rd_addr[0] ), .QN(n77) );
  DFFARX1 \fifo_0/rd_addr_reg[3]  ( .D(\fifo_0/n177 ), .CLK(clk_2), .RSTB(n30), 
        .Q(\fifo_0/rd_addr[3] ) );
  DFFARX1 \ctrl_2mhz_0/read_byte_ps_reg[1]  ( .D(\ctrl_2mhz_0/read_byte_ns[1] ), .CLK(clk_2), .RSTB(n29), .Q(\ctrl_2mhz_0/read_byte_ps[1] ) );
  DFFARX1 \fifo_0/rd_addr_reg[1]  ( .D(\fifo_0/n179 ), .CLK(clk_2), .RSTB(n31), 
        .Q(\fifo_0/rd_addr[1] ), .QN(n76) );
  DFFARX1 \fifo_0/rd_addr_reg[2]  ( .D(\fifo_0/n178 ), .CLK(clk_2), .RSTB(n30), 
        .Q(\fifo_0/rd_addr[2] ), .QN(n74) );
  DFFARX1 \fifo_0/wr_addr_reg[1]  ( .D(\fifo_0/n183 ), .CLK(clk_50), .RSTB(n49), .Q(\fifo_0/wr_addr[1] ), .QN(n143) );
  DFFARX1 \fifo_0/wr_addr_reg[0]  ( .D(\fifo_0/n184 ), .CLK(clk_50), .RSTB(n42), .Q(\fifo_0/wr_addr[0] ) );
  DFFARX1 \ctrl_50mhz_0/comp_byte_ps_reg  ( .D(data_ena), .CLK(clk_50), .RSTB(
        n28), .Q(\ctrl_50mhz_0/comp_byte_ps ) );
  DFFARX1 \fifo_0/wr_addr_reg[3]  ( .D(\fifo_0/n181 ), .CLK(clk_50), .RSTB(n42), .Q(\fifo_0/wr_addr[3] ) );
  DFFARX1 \shift_reg_0/bits_reg[7]  ( .D(\shift_reg_0/n9 ), .CLK(clk_50), 
        .RSTB(n30), .Q(parallel_data[7]) );
  DFFARX1 \shift_reg_0/bits_reg[4]  ( .D(\shift_reg_0/n6 ), .CLK(clk_50), 
        .RSTB(n30), .Q(parallel_data[4]) );
  DFFARX1 \shift_reg_0/bits_reg[3]  ( .D(\shift_reg_0/n5 ), .CLK(clk_50), 
        .RSTB(n29), .Q(parallel_data[3]) );
  DFFARX1 \shift_reg_0/bits_reg[2]  ( .D(\shift_reg_0/n4 ), .CLK(clk_50), 
        .RSTB(n29), .Q(parallel_data[2]) );
  DFFARX1 \shift_reg_0/bits_reg[5]  ( .D(\shift_reg_0/n7 ), .CLK(clk_50), 
        .RSTB(n30), .Q(parallel_data[5]) );
  DFFARX1 \shift_reg_0/bits_reg[0]  ( .D(\shift_reg_0/n2 ), .CLK(clk_50), 
        .RSTB(n29), .Q(parallel_data[0]) );
  DFFARX1 \shift_reg_0/bits_reg[6]  ( .D(\shift_reg_0/n8 ), .CLK(clk_50), 
        .RSTB(n30), .Q(n10), .QN(n7) );
  DFFARX1 \shift_reg_0/bits_reg[1]  ( .D(\shift_reg_0/n3 ), .CLK(clk_50), 
        .RSTB(n29), .Q(n9), .QN(n25) );
  DFFARX1 \fifo_0/wr_addr_reg[2]  ( .D(\fifo_0/n182 ), .CLK(clk_50), .RSTB(n42), .Q(\fifo_0/wr_addr[2] ), .QN(n142) );
  DFFARX1 \ctrl_50mhz_0/write_fifo_ps_reg  ( .D(\ctrl_50mhz_0/write_fifo_ns ), 
        .CLK(clk_50), .RSTB(n37), .Q(write), .QN(n64) );
  DFFARX1 \ctrl_50mhz_0/which_byte_ps_reg[0]  ( .D(n57), .CLK(clk_50), .RSTB(
        n28), .Q(\ctrl_50mhz_0/which_byte_ps[0] ) );
  DFFARX1 \ctrl_50mhz_0/which_byte_ps_reg[1]  ( .D(
        \ctrl_50mhz_0/which_byte_ns[1] ), .CLK(clk_50), .RSTB(n28), .Q(
        \ctrl_50mhz_0/which_byte_ps[1] ) );
  DFFARX1 \fifo_0/byte5_reg[7]  ( .D(\fifo_0/n232 ), .CLK(clk_50), .RSTB(n53), 
        .Q(n93), .QN(\fifo_0/n209 ) );
  DFFARX1 \fifo_0/byte5_reg[5]  ( .D(\fifo_0/n230 ), .CLK(clk_50), .RSTB(n33), 
        .Q(n91), .QN(\fifo_0/n211 ) );
  DFFARX1 \fifo_0/byte5_reg[4]  ( .D(\fifo_0/n229 ), .CLK(clk_50), .RSTB(n33), 
        .Q(n90), .QN(\fifo_0/n212 ) );
  DFFARX1 \fifo_0/byte5_reg[3]  ( .D(\fifo_0/n228 ), .CLK(clk_50), .RSTB(n33), 
        .Q(n89), .QN(\fifo_0/n213 ) );
  DFFARX1 \fifo_0/byte5_reg[2]  ( .D(\fifo_0/n227 ), .CLK(clk_50), .RSTB(n33), 
        .Q(n88), .QN(\fifo_0/n214 ) );
  DFFARX1 \fifo_0/byte5_reg[0]  ( .D(\fifo_0/n225 ), .CLK(clk_50), .RSTB(n32), 
        .Q(n86), .QN(\fifo_0/n216 ) );
  DFFARX1 \fifo_0/byte1_reg[7]  ( .D(\fifo_0/n264 ), .CLK(clk_50), .RSTB(n39), 
        .Q(n125), .QN(\fifo_0/n193 ) );
  DFFARX1 \fifo_0/byte1_reg[5]  ( .D(\fifo_0/n262 ), .CLK(clk_50), .RSTB(n39), 
        .Q(n123), .QN(\fifo_0/n195 ) );
  DFFARX1 \fifo_0/byte1_reg[4]  ( .D(\fifo_0/n261 ), .CLK(clk_50), .RSTB(n38), 
        .Q(n122), .QN(\fifo_0/n196 ) );
  DFFARX1 \fifo_0/byte1_reg[3]  ( .D(\fifo_0/n260 ), .CLK(clk_50), .RSTB(n38), 
        .Q(n121), .QN(\fifo_0/n197 ) );
  DFFARX1 \fifo_0/byte1_reg[2]  ( .D(\fifo_0/n259 ), .CLK(clk_50), .RSTB(n38), 
        .Q(n120), .QN(\fifo_0/n198 ) );
  DFFARX1 \fifo_0/byte1_reg[0]  ( .D(\fifo_0/n257 ), .CLK(clk_50), .RSTB(n38), 
        .Q(n118), .QN(\fifo_0/n200 ) );
  DFFARX1 \fifo_0/byte5_reg[6]  ( .D(\fifo_0/n231 ), .CLK(clk_50), .RSTB(n33), 
        .Q(n92), .QN(\fifo_0/n210 ) );
  DFFARX1 \fifo_0/byte1_reg[6]  ( .D(\fifo_0/n263 ), .CLK(clk_50), .RSTB(n39), 
        .Q(n124), .QN(\fifo_0/n194 ) );
  DFFARX1 \fifo_0/byte5_reg[1]  ( .D(\fifo_0/n226 ), .CLK(clk_50), .RSTB(n32), 
        .Q(n87), .QN(\fifo_0/n215 ) );
  DFFARX1 \fifo_0/byte1_reg[1]  ( .D(\fifo_0/n258 ), .CLK(clk_50), .RSTB(n38), 
        .Q(n119), .QN(\fifo_0/n199 ) );
  DFFARX1 \fifo_0/byte0_reg[7]  ( .D(\fifo_0/n272 ), .CLK(clk_50), .RSTB(n40), 
        .Q(n133), .QN(\fifo_0/n185 ) );
  DFFARX1 \fifo_0/byte0_reg[5]  ( .D(\fifo_0/n270 ), .CLK(clk_50), .RSTB(n40), 
        .Q(n131), .QN(\fifo_0/n187 ) );
  DFFARX1 \fifo_0/byte0_reg[4]  ( .D(\fifo_0/n269 ), .CLK(clk_50), .RSTB(n40), 
        .Q(n130), .QN(\fifo_0/n188 ) );
  DFFARX1 \fifo_0/byte0_reg[3]  ( .D(\fifo_0/n268 ), .CLK(clk_50), .RSTB(n40), 
        .Q(n129), .QN(\fifo_0/n189 ) );
  DFFARX1 \fifo_0/byte0_reg[2]  ( .D(\fifo_0/n267 ), .CLK(clk_50), .RSTB(n39), 
        .Q(n128), .QN(\fifo_0/n190 ) );
  DFFARX1 \fifo_0/byte0_reg[0]  ( .D(\fifo_0/n265 ), .CLK(clk_50), .RSTB(n39), 
        .Q(n126), .QN(\fifo_0/n192 ) );
  DFFARX1 \fifo_0/byte0_reg[6]  ( .D(\fifo_0/n271 ), .CLK(clk_50), .RSTB(n40), 
        .Q(n132), .QN(\fifo_0/n186 ) );
  DFFARX1 \fifo_0/byte0_reg[1]  ( .D(\fifo_0/n266 ), .CLK(clk_50), .RSTB(n39), 
        .Q(n127), .QN(\fifo_0/n191 ) );
  DFFARX1 \fifo_0/byte4_reg[7]  ( .D(\fifo_0/n240 ), .CLK(clk_50), .RSTB(n35), 
        .Q(n101), .QN(\fifo_0/n201 ) );
  DFFARX1 \fifo_0/byte4_reg[5]  ( .D(\fifo_0/n238 ), .CLK(clk_50), .RSTB(n34), 
        .Q(n99), .QN(\fifo_0/n203 ) );
  DFFARX1 \fifo_0/byte4_reg[4]  ( .D(\fifo_0/n237 ), .CLK(clk_50), .RSTB(n34), 
        .Q(n98), .QN(\fifo_0/n204 ) );
  DFFARX1 \fifo_0/byte4_reg[3]  ( .D(\fifo_0/n236 ), .CLK(clk_50), .RSTB(n34), 
        .Q(n97), .QN(\fifo_0/n205 ) );
  DFFARX1 \fifo_0/byte4_reg[2]  ( .D(\fifo_0/n235 ), .CLK(clk_50), .RSTB(n34), 
        .Q(n96), .QN(\fifo_0/n206 ) );
  DFFARX1 \fifo_0/byte4_reg[0]  ( .D(\fifo_0/n233 ), .CLK(clk_50), .RSTB(n34), 
        .Q(n94), .QN(\fifo_0/n208 ) );
  DFFARX1 \fifo_0/byte2_reg[7]  ( .D(\fifo_0/n256 ), .CLK(clk_50), .RSTB(n38), 
        .Q(n117), .QN(\fifo_0/n153 ) );
  DFFARX1 \fifo_0/byte2_reg[5]  ( .D(\fifo_0/n254 ), .CLK(clk_50), .RSTB(n37), 
        .Q(n115), .QN(\fifo_0/n155 ) );
  DFFARX1 \fifo_0/byte2_reg[4]  ( .D(\fifo_0/n253 ), .CLK(clk_50), .RSTB(n37), 
        .Q(n114), .QN(\fifo_0/n156 ) );
  DFFARX1 \fifo_0/byte2_reg[3]  ( .D(\fifo_0/n252 ), .CLK(clk_50), .RSTB(n37), 
        .Q(n113), .QN(\fifo_0/n157 ) );
  DFFARX1 \fifo_0/byte2_reg[2]  ( .D(\fifo_0/n251 ), .CLK(clk_50), .RSTB(n37), 
        .Q(n112), .QN(\fifo_0/n158 ) );
  DFFARX1 \fifo_0/byte2_reg[0]  ( .D(\fifo_0/n249 ), .CLK(clk_50), .RSTB(n36), 
        .Q(n110), .QN(\fifo_0/n160 ) );
  DFFARX1 \fifo_0/byte4_reg[6]  ( .D(\fifo_0/n239 ), .CLK(clk_50), .RSTB(n35), 
        .Q(n100), .QN(\fifo_0/n202 ) );
  DFFARX1 \fifo_0/byte2_reg[6]  ( .D(\fifo_0/n255 ), .CLK(clk_50), .RSTB(n37), 
        .Q(n116), .QN(\fifo_0/n154 ) );
  DFFARX1 \fifo_0/byte4_reg[1]  ( .D(\fifo_0/n234 ), .CLK(clk_50), .RSTB(n34), 
        .Q(n95), .QN(\fifo_0/n207 ) );
  DFFARX1 \fifo_0/byte2_reg[1]  ( .D(\fifo_0/n250 ), .CLK(clk_50), .RSTB(n36), 
        .Q(n111), .QN(\fifo_0/n159 ) );
  DFFARX1 \fifo_0/byte6_reg[7]  ( .D(\fifo_0/n224 ), .CLK(clk_50), .RSTB(n32), 
        .Q(n85), .QN(\fifo_0/n169 ) );
  DFFARX1 \fifo_0/byte6_reg[5]  ( .D(\fifo_0/n222 ), .CLK(clk_50), .RSTB(n32), 
        .Q(n83), .QN(\fifo_0/n171 ) );
  DFFARX1 \fifo_0/byte6_reg[4]  ( .D(\fifo_0/n221 ), .CLK(clk_50), .RSTB(n32), 
        .Q(n82), .QN(\fifo_0/n172 ) );
  DFFARX1 \fifo_0/byte6_reg[3]  ( .D(\fifo_0/n220 ), .CLK(clk_50), .RSTB(n31), 
        .Q(n81), .QN(\fifo_0/n173 ) );
  DFFARX1 \fifo_0/byte6_reg[2]  ( .D(\fifo_0/n219 ), .CLK(clk_50), .RSTB(n31), 
        .Q(n80), .QN(\fifo_0/n174 ) );
  DFFARX1 \fifo_0/byte6_reg[0]  ( .D(\fifo_0/n217 ), .CLK(clk_50), .RSTB(n31), 
        .Q(n78), .QN(\fifo_0/n176 ) );
  DFFARX1 \fifo_0/byte6_reg[6]  ( .D(\fifo_0/n223 ), .CLK(clk_50), .RSTB(n32), 
        .Q(n84), .QN(\fifo_0/n170 ) );
  DFFARX1 \fifo_0/byte6_reg[1]  ( .D(\fifo_0/n218 ), .CLK(clk_50), .RSTB(n31), 
        .Q(n79), .QN(\fifo_0/n175 ) );
  DFFARX1 \fifo_0/byte3_reg[7]  ( .D(\fifo_0/n248 ), .CLK(clk_50), .RSTB(n36), 
        .Q(n109), .QN(\fifo_0/n161 ) );
  DFFARX1 \fifo_0/byte3_reg[6]  ( .D(\fifo_0/n247 ), .CLK(clk_50), .RSTB(n36), 
        .Q(n108), .QN(\fifo_0/n162 ) );
  DFFARX1 \fifo_0/byte3_reg[5]  ( .D(\fifo_0/n246 ), .CLK(clk_50), .RSTB(n36), 
        .Q(n107), .QN(\fifo_0/n163 ) );
  DFFARX1 \fifo_0/byte3_reg[4]  ( .D(\fifo_0/n245 ), .CLK(clk_50), .RSTB(n36), 
        .Q(n106), .QN(\fifo_0/n164 ) );
  DFFARX1 \fifo_0/byte3_reg[3]  ( .D(\fifo_0/n244 ), .CLK(clk_50), .RSTB(n35), 
        .Q(n105), .QN(\fifo_0/n165 ) );
  DFFARX1 \fifo_0/byte3_reg[2]  ( .D(\fifo_0/n243 ), .CLK(clk_50), .RSTB(n35), 
        .Q(n104), .QN(\fifo_0/n166 ) );
  DFFARX1 \fifo_0/byte3_reg[1]  ( .D(\fifo_0/n242 ), .CLK(clk_50), .RSTB(n35), 
        .Q(n103), .QN(\fifo_0/n167 ) );
  DFFARX1 \fifo_0/byte3_reg[0]  ( .D(\fifo_0/n241 ), .CLK(clk_50), .RSTB(n35), 
        .Q(n102), .QN(\fifo_0/n168 ) );
  DFFARX1 \fifo_0/byte7_reg[7]  ( .D(\fifo_0/n280 ), .CLK(clk_50), .RSTB(n42), 
        .Q(n141), .QN(\fifo_0/n145 ) );
  DFFARX1 \fifo_0/byte7_reg[6]  ( .D(\fifo_0/n279 ), .CLK(clk_50), .RSTB(n41), 
        .Q(n140), .QN(\fifo_0/n146 ) );
  DFFARX1 \fifo_0/byte7_reg[5]  ( .D(\fifo_0/n278 ), .CLK(clk_50), .RSTB(n41), 
        .Q(n139), .QN(\fifo_0/n147 ) );
  DFFARX1 \fifo_0/byte7_reg[4]  ( .D(\fifo_0/n277 ), .CLK(clk_50), .RSTB(n41), 
        .Q(n138), .QN(\fifo_0/n148 ) );
  DFFARX1 \fifo_0/byte7_reg[3]  ( .D(\fifo_0/n276 ), .CLK(clk_50), .RSTB(n41), 
        .Q(n137), .QN(\fifo_0/n149 ) );
  DFFARX1 \fifo_0/byte7_reg[2]  ( .D(\fifo_0/n275 ), .CLK(clk_50), .RSTB(n41), 
        .Q(n136), .QN(\fifo_0/n150 ) );
  DFFARX1 \fifo_0/byte7_reg[1]  ( .D(\fifo_0/n274 ), .CLK(clk_50), .RSTB(n41), 
        .Q(n135), .QN(\fifo_0/n151 ) );
  DFFARX1 \fifo_0/byte7_reg[0]  ( .D(\fifo_0/n273 ), .CLK(clk_50), .RSTB(n40), 
        .Q(n134), .QN(\fifo_0/n152 ) );
  DFFARX1 \ctrl_50mhz_0/temp_pkt_ps_reg  ( .D(\ctrl_50mhz_0/temp_pkt_ns ), 
        .CLK(clk_50), .RSTB(n28), .QN(\ctrl_50mhz_0/n3 ) );
  AO22X1 U8 ( .IN1(ram_data[7]), .IN2(fifo_empty), .IN3(n72), .IN4(
        \averager_0/N14 ), .Q(\averager_0/n2 ) );
  AND2X1 U9 ( .IN1(fifo_out[0]), .IN2(n21), .Q(n8) );
  AND2X1 U10 ( .IN1(\averager_0/ac[1] ), .IN2(n71), .Q(n11) );
  AND2X1 U11 ( .IN1(ram_data[5]), .IN2(n71), .Q(n12) );
  AND2X1 U12 ( .IN1(ram_data[0]), .IN2(n71), .Q(n13) );
  AND2X1 U13 ( .IN1(ram_data[1]), .IN2(n71), .Q(n14) );
  AND2X1 U14 ( .IN1(ram_data[2]), .IN2(n71), .Q(n15) );
  AND2X1 U15 ( .IN1(ram_data[3]), .IN2(n71), .Q(n16) );
  AND2X1 U16 ( .IN1(ram_data[4]), .IN2(n71), .Q(n17) );
  INVX0 U17 ( .IN(\fifo_0/n36 ), .QN(n68) );
  INVX0 U18 ( .IN(\fifo_0/n67 ), .QN(n60) );
  INVX0 U19 ( .IN(\fifo_0/n57 ), .QN(n66) );
  INVX0 U20 ( .IN(fifo_empty), .QN(n72) );
  NAND2X0 U21 ( .IN1(\averager_0/dp_cluster_0/add_20_aco/carry[8] ), .IN2(n22), 
        .QN(n23) );
  XNOR2X1 U22 ( .IN1(n77), .IN2(n72), .Q(\fifo_0/n180 ) );
  OR2X1 U23 ( .IN1(\ctrl_2mhz_0/read_byte_ns[0] ), .IN2(
        \ctrl_2mhz_0/read_byte_ns[1] ), .Q(\ctrl_2mhz_0/N20 ) );
  INVX0 U24 ( .IN(n24), .QN(n59) );
  INVX0 U25 ( .IN(\ctrl_50mhz_0/n7 ), .QN(n58) );
  INVX0 U26 ( .IN(\ctrl_50mhz_0/n10 ), .QN(n57) );
  NAND4X0 U27 ( .IN1(\fifo_0/n136 ), .IN2(\fifo_0/n137 ), .IN3(\fifo_0/n138 ), 
        .IN4(\fifo_0/n139 ), .QN(fifo_out[1]) );
  NAND2X0 U28 ( .IN1(n69), .IN2(n142), .QN(\fifo_0/n36 ) );
  NAND3X0 U29 ( .IN1(n143), .IN2(n142), .IN3(n70), .QN(\fifo_0/n57 ) );
  NAND3X0 U30 ( .IN1(n143), .IN2(n142), .IN3(\fifo_0/n13 ), .QN(\fifo_0/n67 )
         );
  INVX0 U31 ( .IN(\fifo_0/n77 ), .QN(n67) );
  INVX0 U32 ( .IN(\fifo_0/n3 ), .QN(n63) );
  INVX0 U33 ( .IN(\fifo_0/n26 ), .QN(n62) );
  INVX0 U34 ( .IN(\fifo_0/n14 ), .QN(n65) );
  INVX0 U35 ( .IN(\fifo_0/n46 ), .QN(n61) );
  INVX0 U36 ( .IN(\fifo_0/n97 ), .QN(n69) );
  INVX0 U37 ( .IN(\fifo_0/n98 ), .QN(n70) );
  NAND3X0 U38 ( .IN1(n76), .IN2(n74), .IN3(n77), .QN(\fifo_0/n114 ) );
  INVX0 U39 ( .IN(n154), .QN(n151) );
  INVX0 U40 ( .IN(n160), .QN(n145) );
  INVX0 U41 ( .IN(n156), .QN(n149) );
  INVX0 U42 ( .IN(n155), .QN(n150) );
  INVX0 U43 ( .IN(n159), .QN(n146) );
  INVX0 U44 ( .IN(n158), .QN(n147) );
  INVX0 U45 ( .IN(n157), .QN(n148) );
  NBUFFX2 U46 ( .IN(n48), .Q(n43) );
  NBUFFX2 U47 ( .IN(n49), .Q(n42) );
  NBUFFX2 U48 ( .IN(n49), .Q(n41) );
  NBUFFX2 U49 ( .IN(n50), .Q(n40) );
  NBUFFX2 U50 ( .IN(n50), .Q(n39) );
  NBUFFX2 U51 ( .IN(n51), .Q(n38) );
  NBUFFX2 U52 ( .IN(n52), .Q(n36) );
  NBUFFX2 U53 ( .IN(n52), .Q(n35) );
  NBUFFX2 U54 ( .IN(n53), .Q(n34) );
  NBUFFX2 U55 ( .IN(n53), .Q(n33) );
  NBUFFX2 U56 ( .IN(n54), .Q(n32) );
  NBUFFX2 U57 ( .IN(n54), .Q(n31) );
  NBUFFX2 U58 ( .IN(n55), .Q(n30) );
  NBUFFX2 U59 ( .IN(n55), .Q(n29) );
  NBUFFX2 U60 ( .IN(n51), .Q(n37) );
  NBUFFX2 U61 ( .IN(n48), .Q(n44) );
  NBUFFX2 U62 ( .IN(n47), .Q(n45) );
  NBUFFX2 U63 ( .IN(n47), .Q(n46) );
  NOR2X0 U64 ( .IN1(\fifo_0/n101 ), .IN2(\fifo_0/n102 ), .QN(fifo_empty) );
  XOR2X1 U65 ( .IN1(\fifo_0/rd_addr[3] ), .IN2(\fifo_0/wr_addr[3] ), .Q(
        \fifo_0/n102 ) );
  NAND3X0 U66 ( .IN1(\fifo_0/n103 ), .IN2(\fifo_0/n104 ), .IN3(\fifo_0/n105 ), 
        .QN(\fifo_0/n101 ) );
  XNOR2X1 U67 ( .IN1(\fifo_0/wr_addr[0] ), .IN2(\fifo_0/rd_addr[0] ), .Q(
        \fifo_0/n105 ) );
  NAND2X0 U68 ( .IN1(\ctrl_50mhz_0/n11 ), .IN2(\ctrl_50mhz_0/n4 ), .QN(
        \ctrl_50mhz_0/n10 ) );
  XOR2X1 U69 ( .IN1(\ctrl_50mhz_0/which_byte_ps[0] ), .IN2(n58), .Q(
        \ctrl_50mhz_0/n11 ) );
  NAND4X0 U70 ( .IN1(\fifo_0/n140 ), .IN2(\fifo_0/n141 ), .IN3(\fifo_0/n142 ), 
        .IN4(\fifo_0/n143 ), .QN(fifo_out[0]) );
  OA22X1 U71 ( .IN1(\fifo_0/n192 ), .IN2(\fifo_0/n114 ), .IN3(\fifo_0/n200 ), 
        .IN4(\fifo_0/n115 ), .Q(\fifo_0/n140 ) );
  OA22X1 U72 ( .IN1(\fifo_0/n160 ), .IN2(\fifo_0/n113 ), .IN3(\fifo_0/n168 ), 
        .IN4(\fifo_0/n94 ), .Q(\fifo_0/n141 ) );
  OA22X1 U73 ( .IN1(\fifo_0/n208 ), .IN2(\fifo_0/n111 ), .IN3(\fifo_0/n216 ), 
        .IN4(\fifo_0/n112 ), .Q(\fifo_0/n142 ) );
  NAND2X0 U74 ( .IN1(\ctrl_50mhz_0/comp_byte_ps ), .IN2(n59), .QN(
        \ctrl_50mhz_0/n7 ) );
  AND4X1 U75 ( .IN1(n26), .IN2(n72), .IN3(\ctrl_2mhz_0/read_byte_ps[0] ), 
        .IN4(\ctrl_2mhz_0/read_byte_ps[1] ), .Q(\ctrl_2mhz_0/write_ram_ns ) );
  NAND4X0 U76 ( .IN1(\fifo_0/n106 ), .IN2(\fifo_0/n107 ), .IN3(\fifo_0/n108 ), 
        .IN4(\fifo_0/n109 ), .QN(fifo_out[7]) );
  NAND2X0 U77 ( .IN1(n72), .IN2(\fifo_0/rd_addr[0] ), .QN(\fifo_0/n92 ) );
  AND2X1 U78 ( .IN1(\ctrl_50mhz_0/n14 ), .IN2(\ctrl_50mhz_0/n4 ), .Q(
        \ctrl_50mhz_0/which_byte_ns[1] ) );
  XNOR2X1 U79 ( .IN1(\ctrl_50mhz_0/which_byte_ps[1] ), .IN2(\ctrl_50mhz_0/n15 ), .Q(\ctrl_50mhz_0/n14 ) );
  NAND2X0 U80 ( .IN1(n58), .IN2(\ctrl_50mhz_0/which_byte_ps[0] ), .QN(
        \ctrl_50mhz_0/n15 ) );
  AO22X1 U81 ( .IN1(\averager_0/ac[0] ), .IN2(fifo_empty), .IN3(
        \averager_0/N5 ), .IN4(n72), .Q(\averager_0/n11 ) );
  XOR2X1 U82 ( .IN1(fifo_out[0]), .IN2(n21), .Q(\averager_0/N5 ) );
  AO22X1 U83 ( .IN1(\averager_0/ac[1] ), .IN2(fifo_empty), .IN3(
        \averager_0/N6 ), .IN4(n72), .Q(\averager_0/n10 ) );
  AO22X1 U84 ( .IN1(ram_data[0]), .IN2(fifo_empty), .IN3(\averager_0/N7 ), 
        .IN4(n72), .Q(\averager_0/n9 ) );
  AO22X1 U85 ( .IN1(ram_data[1]), .IN2(fifo_empty), .IN3(\averager_0/N8 ), 
        .IN4(n72), .Q(\averager_0/n8 ) );
  AO22X1 U86 ( .IN1(ram_data[2]), .IN2(fifo_empty), .IN3(\averager_0/N9 ), 
        .IN4(n72), .Q(\averager_0/n7 ) );
  AO22X1 U87 ( .IN1(ram_data[3]), .IN2(fifo_empty), .IN3(\averager_0/N10 ), 
        .IN4(n72), .Q(\averager_0/n6 ) );
  AO22X1 U88 ( .IN1(ram_data[4]), .IN2(fifo_empty), .IN3(\averager_0/N11 ), 
        .IN4(n72), .Q(\averager_0/n5 ) );
  AO22X1 U89 ( .IN1(ram_data[5]), .IN2(fifo_empty), .IN3(\averager_0/N12 ), 
        .IN4(n72), .Q(\averager_0/n4 ) );
  AO22X1 U90 ( .IN1(ram_data[6]), .IN2(fifo_empty), .IN3(\averager_0/N13 ), 
        .IN4(n72), .Q(\averager_0/n3 ) );
  XOR2X1 U91 ( .IN1(\averager_0/dp_cluster_0/add_20_aco/carry[8] ), .IN2(n22), 
        .Q(\averager_0/N13 ) );
  XOR2X1 U92 ( .IN1(n23), .IN2(
        \averager_0/dp_cluster_0/mult_add_20_aco/PROD_not[9] ), .Q(
        \averager_0/N14 ) );
  AO22X1 U93 ( .IN1(serial_data), .IN2(n24), .IN3(parallel_data[7]), .IN4(n59), 
        .Q(\shift_reg_0/n9 ) );
  AO22X1 U94 ( .IN1(parallel_data[7]), .IN2(n24), .IN3(n10), .IN4(n59), .Q(
        \shift_reg_0/n8 ) );
  AO22X1 U95 ( .IN1(n10), .IN2(n24), .IN3(parallel_data[5]), .IN4(n59), .Q(
        \shift_reg_0/n7 ) );
  AO22X1 U96 ( .IN1(parallel_data[5]), .IN2(n24), .IN3(parallel_data[4]), 
        .IN4(n59), .Q(\shift_reg_0/n6 ) );
  AO22X1 U97 ( .IN1(parallel_data[4]), .IN2(n24), .IN3(parallel_data[3]), 
        .IN4(n59), .Q(\shift_reg_0/n5 ) );
  AO22X1 U98 ( .IN1(parallel_data[3]), .IN2(n24), .IN3(parallel_data[2]), 
        .IN4(n59), .Q(\shift_reg_0/n4 ) );
  AO22X1 U99 ( .IN1(parallel_data[2]), .IN2(n24), .IN3(n9), .IN4(n59), .Q(
        \shift_reg_0/n3 ) );
  AO22X1 U100 ( .IN1(n24), .IN2(n9), .IN3(parallel_data[0]), .IN4(n59), .Q(
        \shift_reg_0/n2 ) );
  OAI22X1 U101 ( .IN1(\ctrl_50mhz_0/n3 ), .IN2(n18), .IN3(n19), .IN4(n20), 
        .QN(\ctrl_50mhz_0/temp_pkt_ns ) );
  NOR3X0 U102 ( .IN1(\ctrl_50mhz_0/which_byte_ns[1] ), .IN2(
        \ctrl_50mhz_0/which_byte_ns[2] ), .IN3(n57), .QN(n18) );
  OR2X1 U103 ( .IN1(\ctrl_50mhz_0/which_byte_ns[1] ), .IN2(\ctrl_50mhz_0/n10 ), 
        .Q(n19) );
  NAND4X0 U104 ( .IN1(parallel_data[0]), .IN2(parallel_data[7]), .IN3(n3), 
        .IN4(n4), .QN(n20) );
  AO22X1 U105 ( .IN1(n73), .IN2(n72), .IN3(\fifo_0/rd_addr[2] ), .IN4(
        \fifo_0/n91 ), .Q(\fifo_0/n178 ) );
  INVX0 U106 ( .IN(\fifo_0/n94 ), .QN(n73) );
  OR2X1 U107 ( .IN1(\fifo_0/n92 ), .IN2(n76), .Q(\fifo_0/n91 ) );
  NAND4X0 U108 ( .IN1(\fifo_0/n132 ), .IN2(\fifo_0/n133 ), .IN3(\fifo_0/n134 ), 
        .IN4(\fifo_0/n135 ), .QN(fifo_out[2]) );
  NAND4X0 U109 ( .IN1(\fifo_0/n128 ), .IN2(\fifo_0/n129 ), .IN3(\fifo_0/n130 ), 
        .IN4(\fifo_0/n131 ), .QN(fifo_out[3]) );
  NAND4X0 U110 ( .IN1(\fifo_0/n124 ), .IN2(\fifo_0/n125 ), .IN3(\fifo_0/n126 ), 
        .IN4(\fifo_0/n127 ), .QN(fifo_out[4]) );
  NAND4X0 U111 ( .IN1(\fifo_0/n120 ), .IN2(\fifo_0/n121 ), .IN3(\fifo_0/n122 ), 
        .IN4(\fifo_0/n123 ), .QN(fifo_out[5]) );
  NAND4X0 U112 ( .IN1(\fifo_0/n116 ), .IN2(\fifo_0/n117 ), .IN3(\fifo_0/n118 ), 
        .IN4(\fifo_0/n119 ), .QN(fifo_out[6]) );
  XNOR2X1 U113 ( .IN1(\ctrl_2mhz_0/n4 ), .IN2(\ctrl_2mhz_0/read_byte_ps[1] ), 
        .Q(\ctrl_2mhz_0/read_byte_ns[1] ) );
  NAND2X0 U114 ( .IN1(\ctrl_2mhz_0/read_byte_ps[0] ), .IN2(n72), .QN(
        \ctrl_2mhz_0/n4 ) );
  XNOR2X1 U115 ( .IN1(fifo_empty), .IN2(\ctrl_2mhz_0/read_byte_ps[0] ), .Q(
        \ctrl_2mhz_0/read_byte_ns[0] ) );
  OA22X1 U116 ( .IN1(\fifo_0/n176 ), .IN2(\fifo_0/n110 ), .IN3(\fifo_0/n152 ), 
        .IN4(\fifo_0/n89 ), .Q(\fifo_0/n143 ) );
  OA22X1 U117 ( .IN1(\fifo_0/n175 ), .IN2(\fifo_0/n110 ), .IN3(\fifo_0/n151 ), 
        .IN4(\fifo_0/n89 ), .Q(\fifo_0/n139 ) );
  OA22X1 U118 ( .IN1(\fifo_0/n174 ), .IN2(\fifo_0/n110 ), .IN3(\fifo_0/n150 ), 
        .IN4(\fifo_0/n89 ), .Q(\fifo_0/n135 ) );
  OA22X1 U119 ( .IN1(\fifo_0/n173 ), .IN2(\fifo_0/n110 ), .IN3(\fifo_0/n149 ), 
        .IN4(\fifo_0/n89 ), .Q(\fifo_0/n131 ) );
  OA22X1 U120 ( .IN1(\fifo_0/n172 ), .IN2(\fifo_0/n110 ), .IN3(\fifo_0/n148 ), 
        .IN4(\fifo_0/n89 ), .Q(\fifo_0/n127 ) );
  OA22X1 U121 ( .IN1(\fifo_0/n171 ), .IN2(\fifo_0/n110 ), .IN3(\fifo_0/n147 ), 
        .IN4(\fifo_0/n89 ), .Q(\fifo_0/n123 ) );
  OA22X1 U122 ( .IN1(\fifo_0/n170 ), .IN2(\fifo_0/n110 ), .IN3(\fifo_0/n146 ), 
        .IN4(\fifo_0/n89 ), .Q(\fifo_0/n119 ) );
  OA22X1 U123 ( .IN1(\fifo_0/n169 ), .IN2(\fifo_0/n110 ), .IN3(\fifo_0/n145 ), 
        .IN4(\fifo_0/n89 ), .Q(\fifo_0/n109 ) );
  OA22X1 U124 ( .IN1(\fifo_0/n207 ), .IN2(\fifo_0/n111 ), .IN3(\fifo_0/n215 ), 
        .IN4(\fifo_0/n112 ), .Q(\fifo_0/n138 ) );
  OA22X1 U125 ( .IN1(\fifo_0/n206 ), .IN2(\fifo_0/n111 ), .IN3(\fifo_0/n214 ), 
        .IN4(\fifo_0/n112 ), .Q(\fifo_0/n134 ) );
  OA22X1 U126 ( .IN1(\fifo_0/n205 ), .IN2(\fifo_0/n111 ), .IN3(\fifo_0/n213 ), 
        .IN4(\fifo_0/n112 ), .Q(\fifo_0/n130 ) );
  OA22X1 U127 ( .IN1(\fifo_0/n204 ), .IN2(\fifo_0/n111 ), .IN3(\fifo_0/n212 ), 
        .IN4(\fifo_0/n112 ), .Q(\fifo_0/n126 ) );
  OA22X1 U128 ( .IN1(\fifo_0/n203 ), .IN2(\fifo_0/n111 ), .IN3(\fifo_0/n211 ), 
        .IN4(\fifo_0/n112 ), .Q(\fifo_0/n122 ) );
  OA22X1 U129 ( .IN1(\fifo_0/n202 ), .IN2(\fifo_0/n111 ), .IN3(\fifo_0/n210 ), 
        .IN4(\fifo_0/n112 ), .Q(\fifo_0/n118 ) );
  OA22X1 U130 ( .IN1(\fifo_0/n201 ), .IN2(\fifo_0/n111 ), .IN3(\fifo_0/n209 ), 
        .IN4(\fifo_0/n112 ), .Q(\fifo_0/n108 ) );
  OA22X1 U131 ( .IN1(\fifo_0/n159 ), .IN2(\fifo_0/n113 ), .IN3(\fifo_0/n167 ), 
        .IN4(\fifo_0/n94 ), .Q(\fifo_0/n137 ) );
  OA22X1 U132 ( .IN1(\fifo_0/n158 ), .IN2(\fifo_0/n113 ), .IN3(\fifo_0/n166 ), 
        .IN4(\fifo_0/n94 ), .Q(\fifo_0/n133 ) );
  OA22X1 U133 ( .IN1(\fifo_0/n157 ), .IN2(\fifo_0/n113 ), .IN3(\fifo_0/n165 ), 
        .IN4(\fifo_0/n94 ), .Q(\fifo_0/n129 ) );
  OA22X1 U134 ( .IN1(\fifo_0/n156 ), .IN2(\fifo_0/n113 ), .IN3(\fifo_0/n164 ), 
        .IN4(\fifo_0/n94 ), .Q(\fifo_0/n125 ) );
  OA22X1 U135 ( .IN1(\fifo_0/n155 ), .IN2(\fifo_0/n113 ), .IN3(\fifo_0/n163 ), 
        .IN4(\fifo_0/n94 ), .Q(\fifo_0/n121 ) );
  OA22X1 U136 ( .IN1(\fifo_0/n154 ), .IN2(\fifo_0/n113 ), .IN3(\fifo_0/n162 ), 
        .IN4(\fifo_0/n94 ), .Q(\fifo_0/n117 ) );
  OA22X1 U137 ( .IN1(\fifo_0/n153 ), .IN2(\fifo_0/n113 ), .IN3(\fifo_0/n161 ), 
        .IN4(\fifo_0/n94 ), .Q(\fifo_0/n107 ) );
  OA22X1 U138 ( .IN1(\fifo_0/n191 ), .IN2(\fifo_0/n114 ), .IN3(\fifo_0/n199 ), 
        .IN4(\fifo_0/n115 ), .Q(\fifo_0/n136 ) );
  OA22X1 U139 ( .IN1(\fifo_0/n190 ), .IN2(\fifo_0/n114 ), .IN3(\fifo_0/n198 ), 
        .IN4(\fifo_0/n115 ), .Q(\fifo_0/n132 ) );
  OA22X1 U140 ( .IN1(\fifo_0/n189 ), .IN2(\fifo_0/n114 ), .IN3(\fifo_0/n197 ), 
        .IN4(\fifo_0/n115 ), .Q(\fifo_0/n128 ) );
  OA22X1 U141 ( .IN1(\fifo_0/n188 ), .IN2(\fifo_0/n114 ), .IN3(\fifo_0/n196 ), 
        .IN4(\fifo_0/n115 ), .Q(\fifo_0/n124 ) );
  OA22X1 U142 ( .IN1(\fifo_0/n187 ), .IN2(\fifo_0/n114 ), .IN3(\fifo_0/n195 ), 
        .IN4(\fifo_0/n115 ), .Q(\fifo_0/n120 ) );
  OA22X1 U143 ( .IN1(\fifo_0/n186 ), .IN2(\fifo_0/n114 ), .IN3(\fifo_0/n194 ), 
        .IN4(\fifo_0/n115 ), .Q(\fifo_0/n116 ) );
  OA22X1 U144 ( .IN1(\fifo_0/n185 ), .IN2(\fifo_0/n114 ), .IN3(\fifo_0/n193 ), 
        .IN4(\fifo_0/n115 ), .Q(\fifo_0/n106 ) );
  NBUFFX2 U145 ( .IN(data_ena), .Q(n24) );
  NOR4X0 U146 ( .IN1(write), .IN2(\ctrl_50mhz_0/n6 ), .IN3(\ctrl_50mhz_0/n7 ), 
        .IN4(\ctrl_50mhz_0/n3 ), .QN(\ctrl_50mhz_0/write_fifo_ns ) );
  NOR3X0 U147 ( .IN1(\ctrl_50mhz_0/which_byte_ps[0] ), .IN2(
        \ctrl_50mhz_0/which_byte_ps[2] ), .IN3(\ctrl_50mhz_0/which_byte_ps[1] ), .QN(\ctrl_50mhz_0/n6 ) );
  NAND2X0 U148 ( .IN1(\ctrl_50mhz_0/n12 ), .IN2(\ctrl_50mhz_0/n13 ), .QN(
        \ctrl_50mhz_0/which_byte_ns[2] ) );
  NAND4X0 U149 ( .IN1(\ctrl_50mhz_0/which_byte_ps[1] ), .IN2(n58), .IN3(
        \ctrl_50mhz_0/which_byte_ps[0] ), .IN4(\ctrl_50mhz_0/n4 ), .QN(
        \ctrl_50mhz_0/n12 ) );
  OR4X1 U150 ( .IN1(\ctrl_50mhz_0/n4 ), .IN2(n58), .IN3(
        \ctrl_50mhz_0/which_byte_ps[0] ), .IN4(\ctrl_50mhz_0/which_byte_ps[1] ), .Q(\ctrl_50mhz_0/n13 ) );
  XNOR2X1 U151 ( .IN1(\fifo_0/wr_addr[1] ), .IN2(\fifo_0/rd_addr[1] ), .Q(
        \fifo_0/n104 ) );
  XNOR2X1 U152 ( .IN1(\fifo_0/rd_addr[1] ), .IN2(\fifo_0/n92 ), .Q(
        \fifo_0/n179 ) );
  XNOR2X1 U153 ( .IN1(\fifo_0/rd_addr[2] ), .IN2(\fifo_0/wr_addr[2] ), .Q(
        \fifo_0/n103 ) );
  XNOR2X1 U154 ( .IN1(\fifo_0/rd_addr[3] ), .IN2(\fifo_0/n87 ), .Q(
        \fifo_0/n177 ) );
  NAND2X0 U155 ( .IN1(n72), .IN2(n75), .QN(\fifo_0/n87 ) );
  INVX0 U156 ( .IN(\fifo_0/n89 ), .QN(n75) );
  NAND2X0 U157 ( .IN1(n5), .IN2(n6), .QN(n4) );
  NAND4X0 U158 ( .IN1(parallel_data[5]), .IN2(parallel_data[2]), .IN3(n25), 
        .IN4(n7), .QN(n6) );
  OR4X1 U159 ( .IN1(n7), .IN2(n25), .IN3(parallel_data[2]), .IN4(
        parallel_data[5]), .Q(n5) );
  NAND2X0 U160 ( .IN1(n69), .IN2(\fifo_0/wr_addr[2] ), .QN(\fifo_0/n77 ) );
  NAND3X0 U161 ( .IN1(\fifo_0/n13 ), .IN2(n142), .IN3(\fifo_0/wr_addr[1] ), 
        .QN(\fifo_0/n46 ) );
  NAND3X0 U162 ( .IN1(\fifo_0/n13 ), .IN2(n143), .IN3(\fifo_0/wr_addr[2] ), 
        .QN(\fifo_0/n26 ) );
  NAND3X0 U163 ( .IN1(\fifo_0/wr_addr[2] ), .IN2(n143), .IN3(n70), .QN(
        \fifo_0/n14 ) );
  NAND3X0 U164 ( .IN1(\fifo_0/wr_addr[1] ), .IN2(\fifo_0/n13 ), .IN3(
        \fifo_0/wr_addr[2] ), .QN(\fifo_0/n3 ) );
  NAND2X0 U165 ( .IN1(n70), .IN2(\fifo_0/wr_addr[1] ), .QN(\fifo_0/n97 ) );
  NAND2X0 U166 ( .IN1(\fifo_0/wr_addr[0] ), .IN2(write), .QN(\fifo_0/n98 ) );
  NOR2X0 U167 ( .IN1(n64), .IN2(\fifo_0/wr_addr[0] ), .QN(\fifo_0/n13 ) );
  NOR2X0 U168 ( .IN1(parallel_data[4]), .IN2(parallel_data[3]), .QN(n3) );
  AO22X1 U169 ( .IN1(\fifo_0/n77 ), .IN2(n139), .IN3(n67), .IN4(
        parallel_data[5]), .Q(\fifo_0/n278 ) );
  AO22X1 U170 ( .IN1(\fifo_0/n77 ), .IN2(n136), .IN3(n67), .IN4(
        parallel_data[2]), .Q(\fifo_0/n275 ) );
  AO22X1 U171 ( .IN1(\fifo_0/n67 ), .IN2(n131), .IN3(n60), .IN4(
        parallel_data[5]), .Q(\fifo_0/n270 ) );
  AO22X1 U172 ( .IN1(\fifo_0/n67 ), .IN2(n128), .IN3(n60), .IN4(
        parallel_data[2]), .Q(\fifo_0/n267 ) );
  AO22X1 U173 ( .IN1(\fifo_0/n57 ), .IN2(n123), .IN3(n66), .IN4(
        parallel_data[5]), .Q(\fifo_0/n262 ) );
  AO22X1 U174 ( .IN1(\fifo_0/n57 ), .IN2(n120), .IN3(n66), .IN4(
        parallel_data[2]), .Q(\fifo_0/n259 ) );
  AO22X1 U175 ( .IN1(\fifo_0/n46 ), .IN2(n115), .IN3(n61), .IN4(
        parallel_data[5]), .Q(\fifo_0/n254 ) );
  AO22X1 U176 ( .IN1(\fifo_0/n46 ), .IN2(n112), .IN3(n61), .IN4(
        parallel_data[2]), .Q(\fifo_0/n251 ) );
  AO22X1 U177 ( .IN1(\fifo_0/n36 ), .IN2(n107), .IN3(n68), .IN4(
        parallel_data[5]), .Q(\fifo_0/n246 ) );
  AO22X1 U178 ( .IN1(\fifo_0/n36 ), .IN2(n104), .IN3(n68), .IN4(
        parallel_data[2]), .Q(\fifo_0/n243 ) );
  AO22X1 U179 ( .IN1(\fifo_0/n26 ), .IN2(n99), .IN3(n62), .IN4(
        parallel_data[5]), .Q(\fifo_0/n238 ) );
  AO22X1 U180 ( .IN1(\fifo_0/n26 ), .IN2(n96), .IN3(n62), .IN4(
        parallel_data[2]), .Q(\fifo_0/n235 ) );
  AO22X1 U181 ( .IN1(\fifo_0/n14 ), .IN2(n91), .IN3(n65), .IN4(
        parallel_data[5]), .Q(\fifo_0/n230 ) );
  AO22X1 U182 ( .IN1(\fifo_0/n14 ), .IN2(n88), .IN3(n65), .IN4(
        parallel_data[2]), .Q(\fifo_0/n227 ) );
  AO22X1 U183 ( .IN1(\fifo_0/n77 ), .IN2(n137), .IN3(n67), .IN4(
        parallel_data[3]), .Q(\fifo_0/n276 ) );
  AO22X1 U184 ( .IN1(\fifo_0/n67 ), .IN2(n129), .IN3(n60), .IN4(
        parallel_data[3]), .Q(\fifo_0/n268 ) );
  AO22X1 U185 ( .IN1(\fifo_0/n57 ), .IN2(n121), .IN3(n66), .IN4(
        parallel_data[3]), .Q(\fifo_0/n260 ) );
  AO22X1 U186 ( .IN1(\fifo_0/n46 ), .IN2(n113), .IN3(n61), .IN4(
        parallel_data[3]), .Q(\fifo_0/n252 ) );
  AO22X1 U187 ( .IN1(\fifo_0/n36 ), .IN2(n105), .IN3(n68), .IN4(
        parallel_data[3]), .Q(\fifo_0/n244 ) );
  AO22X1 U188 ( .IN1(\fifo_0/n26 ), .IN2(n97), .IN3(n62), .IN4(
        parallel_data[3]), .Q(\fifo_0/n236 ) );
  AO22X1 U189 ( .IN1(\fifo_0/n14 ), .IN2(n89), .IN3(n65), .IN4(
        parallel_data[3]), .Q(\fifo_0/n228 ) );
  AO22X1 U190 ( .IN1(\fifo_0/n77 ), .IN2(n138), .IN3(n67), .IN4(
        parallel_data[4]), .Q(\fifo_0/n277 ) );
  AO22X1 U191 ( .IN1(\fifo_0/n67 ), .IN2(n130), .IN3(n60), .IN4(
        parallel_data[4]), .Q(\fifo_0/n269 ) );
  AO22X1 U192 ( .IN1(\fifo_0/n57 ), .IN2(n122), .IN3(n66), .IN4(
        parallel_data[4]), .Q(\fifo_0/n261 ) );
  AO22X1 U193 ( .IN1(\fifo_0/n46 ), .IN2(n114), .IN3(n61), .IN4(
        parallel_data[4]), .Q(\fifo_0/n253 ) );
  AO22X1 U194 ( .IN1(\fifo_0/n36 ), .IN2(n106), .IN3(n68), .IN4(
        parallel_data[4]), .Q(\fifo_0/n245 ) );
  AO22X1 U195 ( .IN1(\fifo_0/n26 ), .IN2(n98), .IN3(n62), .IN4(
        parallel_data[4]), .Q(\fifo_0/n237 ) );
  AO22X1 U196 ( .IN1(\fifo_0/n14 ), .IN2(n90), .IN3(n65), .IN4(
        parallel_data[4]), .Q(\fifo_0/n229 ) );
  AO22X1 U197 ( .IN1(\fifo_0/n77 ), .IN2(n141), .IN3(n67), .IN4(
        parallel_data[7]), .Q(\fifo_0/n280 ) );
  AO22X1 U198 ( .IN1(\fifo_0/n67 ), .IN2(n133), .IN3(n60), .IN4(
        parallel_data[7]), .Q(\fifo_0/n272 ) );
  AO22X1 U199 ( .IN1(\fifo_0/n57 ), .IN2(n125), .IN3(n66), .IN4(
        parallel_data[7]), .Q(\fifo_0/n264 ) );
  AO22X1 U200 ( .IN1(\fifo_0/n46 ), .IN2(n117), .IN3(n61), .IN4(
        parallel_data[7]), .Q(\fifo_0/n256 ) );
  AO22X1 U201 ( .IN1(\fifo_0/n36 ), .IN2(n109), .IN3(n68), .IN4(
        parallel_data[7]), .Q(\fifo_0/n248 ) );
  AO22X1 U202 ( .IN1(\fifo_0/n26 ), .IN2(n101), .IN3(n62), .IN4(
        parallel_data[7]), .Q(\fifo_0/n240 ) );
  AO22X1 U203 ( .IN1(\fifo_0/n14 ), .IN2(n93), .IN3(n65), .IN4(
        parallel_data[7]), .Q(\fifo_0/n232 ) );
  AO22X1 U204 ( .IN1(\fifo_0/n77 ), .IN2(n134), .IN3(n67), .IN4(
        parallel_data[0]), .Q(\fifo_0/n273 ) );
  AO22X1 U205 ( .IN1(\fifo_0/n67 ), .IN2(n126), .IN3(n60), .IN4(
        parallel_data[0]), .Q(\fifo_0/n265 ) );
  AO22X1 U206 ( .IN1(\fifo_0/n57 ), .IN2(n118), .IN3(n66), .IN4(
        parallel_data[0]), .Q(\fifo_0/n257 ) );
  AO22X1 U207 ( .IN1(\fifo_0/n46 ), .IN2(n110), .IN3(n61), .IN4(
        parallel_data[0]), .Q(\fifo_0/n249 ) );
  AO22X1 U208 ( .IN1(\fifo_0/n36 ), .IN2(n102), .IN3(n68), .IN4(
        parallel_data[0]), .Q(\fifo_0/n241 ) );
  AO22X1 U209 ( .IN1(\fifo_0/n26 ), .IN2(n94), .IN3(n62), .IN4(
        parallel_data[0]), .Q(\fifo_0/n233 ) );
  AO22X1 U210 ( .IN1(\fifo_0/n14 ), .IN2(n86), .IN3(n65), .IN4(
        parallel_data[0]), .Q(\fifo_0/n225 ) );
  AO22X1 U211 ( .IN1(\fifo_0/n77 ), .IN2(n140), .IN3(n67), .IN4(n10), .Q(
        \fifo_0/n279 ) );
  AO22X1 U212 ( .IN1(\fifo_0/n77 ), .IN2(n135), .IN3(n67), .IN4(n9), .Q(
        \fifo_0/n274 ) );
  AO22X1 U213 ( .IN1(\fifo_0/n67 ), .IN2(n132), .IN3(n60), .IN4(n10), .Q(
        \fifo_0/n271 ) );
  AO22X1 U214 ( .IN1(\fifo_0/n67 ), .IN2(n127), .IN3(n60), .IN4(n9), .Q(
        \fifo_0/n266 ) );
  AO22X1 U215 ( .IN1(\fifo_0/n57 ), .IN2(n124), .IN3(n66), .IN4(n10), .Q(
        \fifo_0/n263 ) );
  AO22X1 U216 ( .IN1(\fifo_0/n57 ), .IN2(n119), .IN3(n66), .IN4(n9), .Q(
        \fifo_0/n258 ) );
  AO22X1 U217 ( .IN1(\fifo_0/n46 ), .IN2(n116), .IN3(n61), .IN4(n10), .Q(
        \fifo_0/n255 ) );
  AO22X1 U218 ( .IN1(\fifo_0/n46 ), .IN2(n111), .IN3(n61), .IN4(n9), .Q(
        \fifo_0/n250 ) );
  AO22X1 U219 ( .IN1(\fifo_0/n36 ), .IN2(n108), .IN3(n68), .IN4(n10), .Q(
        \fifo_0/n247 ) );
  AO22X1 U220 ( .IN1(\fifo_0/n36 ), .IN2(n103), .IN3(n68), .IN4(n9), .Q(
        \fifo_0/n242 ) );
  AO22X1 U221 ( .IN1(\fifo_0/n26 ), .IN2(n100), .IN3(n62), .IN4(n10), .Q(
        \fifo_0/n239 ) );
  AO22X1 U222 ( .IN1(\fifo_0/n26 ), .IN2(n95), .IN3(n62), .IN4(n9), .Q(
        \fifo_0/n234 ) );
  AO22X1 U223 ( .IN1(\fifo_0/n14 ), .IN2(n92), .IN3(n65), .IN4(n10), .Q(
        \fifo_0/n231 ) );
  AO22X1 U224 ( .IN1(\fifo_0/n14 ), .IN2(n87), .IN3(n65), .IN4(n9), .Q(
        \fifo_0/n226 ) );
  AO22X1 U225 ( .IN1(\fifo_0/n3 ), .IN2(n85), .IN3(parallel_data[7]), .IN4(n63), .Q(\fifo_0/n224 ) );
  AO22X1 U226 ( .IN1(\fifo_0/n3 ), .IN2(n84), .IN3(n10), .IN4(n63), .Q(
        \fifo_0/n223 ) );
  AO22X1 U227 ( .IN1(\fifo_0/n3 ), .IN2(n83), .IN3(parallel_data[5]), .IN4(n63), .Q(\fifo_0/n222 ) );
  AO22X1 U228 ( .IN1(\fifo_0/n3 ), .IN2(n82), .IN3(parallel_data[4]), .IN4(n63), .Q(\fifo_0/n221 ) );
  AO22X1 U229 ( .IN1(\fifo_0/n3 ), .IN2(n81), .IN3(parallel_data[3]), .IN4(n63), .Q(\fifo_0/n220 ) );
  AO22X1 U230 ( .IN1(\fifo_0/n3 ), .IN2(n80), .IN3(parallel_data[2]), .IN4(n63), .Q(\fifo_0/n219 ) );
  AO22X1 U231 ( .IN1(\fifo_0/n3 ), .IN2(n79), .IN3(n9), .IN4(n63), .Q(
        \fifo_0/n218 ) );
  AO22X1 U232 ( .IN1(\fifo_0/n3 ), .IN2(n78), .IN3(parallel_data[0]), .IN4(n63), .Q(\fifo_0/n217 ) );
  AO21X1 U233 ( .IN1(\fifo_0/wr_addr[2] ), .IN2(\fifo_0/n97 ), .IN3(n68), .Q(
        \fifo_0/n182 ) );
  AO21X1 U234 ( .IN1(\fifo_0/wr_addr[0] ), .IN2(n64), .IN3(\fifo_0/n13 ), .Q(
        \fifo_0/n184 ) );
  XNOR2X1 U235 ( .IN1(\fifo_0/wr_addr[1] ), .IN2(\fifo_0/n98 ), .Q(
        \fifo_0/n183 ) );
  XNOR2X1 U236 ( .IN1(\fifo_0/wr_addr[3] ), .IN2(\fifo_0/n77 ), .Q(
        \fifo_0/n181 ) );
  NAND3X0 U237 ( .IN1(\fifo_0/rd_addr[1] ), .IN2(\fifo_0/rd_addr[0] ), .IN3(
        \fifo_0/rd_addr[2] ), .QN(\fifo_0/n89 ) );
  NAND3X0 U238 ( .IN1(\fifo_0/rd_addr[0] ), .IN2(n74), .IN3(
        \fifo_0/rd_addr[1] ), .QN(\fifo_0/n94 ) );
  NAND3X0 U239 ( .IN1(\fifo_0/rd_addr[1] ), .IN2(n77), .IN3(
        \fifo_0/rd_addr[2] ), .QN(\fifo_0/n110 ) );
  NAND3X0 U240 ( .IN1(n77), .IN2(n76), .IN3(\fifo_0/rd_addr[2] ), .QN(
        \fifo_0/n111 ) );
  NAND3X0 U241 ( .IN1(n77), .IN2(n74), .IN3(\fifo_0/rd_addr[1] ), .QN(
        \fifo_0/n113 ) );
  NAND3X0 U242 ( .IN1(n76), .IN2(n74), .IN3(\fifo_0/rd_addr[0] ), .QN(
        \fifo_0/n115 ) );
  NAND3X0 U243 ( .IN1(\fifo_0/rd_addr[0] ), .IN2(n76), .IN3(
        \fifo_0/rd_addr[2] ), .QN(\fifo_0/n112 ) );
  AND2X1 U244 ( .IN1(\ram_ctr_0/n3 ), .IN2(\ram_ctr_0/n4 ), .Q(\ram_ctr_0/n2 )
         );
  NOR4X0 U245 ( .IN1(\ram_ctr_0/n6 ), .IN2(n26), .IN3(ram_addr[10]), .IN4(
        ram_addr[0]), .QN(\ram_ctr_0/n3 ) );
  NOR4X0 U246 ( .IN1(\ram_ctr_0/n5 ), .IN2(ram_addr[4]), .IN3(ram_addr[6]), 
        .IN4(ram_addr[5]), .QN(\ram_ctr_0/n4 ) );
  OR3X1 U247 ( .IN1(ram_addr[2]), .IN2(ram_addr[3]), .IN3(ram_addr[1]), .Q(
        \ram_ctr_0/n6 ) );
  NOR2X0 U248 ( .IN1(ram_addr[1]), .IN2(ram_addr[0]), .QN(n154) );
  NOR2X0 U249 ( .IN1(n146), .IN2(ram_addr[7]), .QN(n160) );
  NOR2X0 U250 ( .IN1(n150), .IN2(ram_addr[3]), .QN(n156) );
  NOR2X0 U251 ( .IN1(n151), .IN2(ram_addr[2]), .QN(n155) );
  NOR2X0 U252 ( .IN1(n147), .IN2(ram_addr[6]), .QN(n159) );
  NOR2X0 U253 ( .IN1(n148), .IN2(ram_addr[5]), .QN(n158) );
  NOR2X0 U254 ( .IN1(n149), .IN2(ram_addr[4]), .QN(n157) );
  NOR2X0 U255 ( .IN1(n145), .IN2(ram_addr[8]), .QN(n161) );
  AO221X1 U256 ( .IN1(n152), .IN2(ram_wr_n), .IN3(ram_addr[0]), .IN4(n26), 
        .IN5(\ram_ctr_0/n2 ), .Q(\ram_ctr_0/n17 ) );
  AO221X1 U257 ( .IN1(\ram_ctr_0/N15 ), .IN2(ram_wr_n), .IN3(ram_addr[10]), 
        .IN4(n26), .IN5(\ram_ctr_0/n2 ), .Q(\ram_ctr_0/n16 ) );
  XNOR2X1 U258 ( .IN1(n153), .IN2(ram_addr[10]), .Q(\ram_ctr_0/N15 ) );
  NAND2X0 U259 ( .IN1(n161), .IN2(n144), .QN(n153) );
  AO221X1 U260 ( .IN1(\ram_ctr_0/N6 ), .IN2(ram_wr_n), .IN3(ram_addr[1]), 
        .IN4(n26), .IN5(\ram_ctr_0/n2 ), .Q(\ram_ctr_0/n15 ) );
  AO21X1 U261 ( .IN1(ram_addr[1]), .IN2(ram_addr[0]), .IN3(n154), .Q(
        \ram_ctr_0/N6 ) );
  AO221X1 U262 ( .IN1(\ram_ctr_0/N7 ), .IN2(ram_wr_n), .IN3(ram_addr[2]), 
        .IN4(n26), .IN5(\ram_ctr_0/n2 ), .Q(\ram_ctr_0/n14 ) );
  AO21X1 U263 ( .IN1(ram_addr[2]), .IN2(n151), .IN3(n155), .Q(\ram_ctr_0/N7 )
         );
  AO221X1 U264 ( .IN1(\ram_ctr_0/N8 ), .IN2(ram_wr_n), .IN3(ram_addr[3]), 
        .IN4(n26), .IN5(\ram_ctr_0/n2 ), .Q(\ram_ctr_0/n13 ) );
  AO21X1 U265 ( .IN1(ram_addr[3]), .IN2(n150), .IN3(n156), .Q(\ram_ctr_0/N8 )
         );
  AO221X1 U266 ( .IN1(\ram_ctr_0/N9 ), .IN2(ram_wr_n), .IN3(ram_addr[4]), 
        .IN4(n26), .IN5(\ram_ctr_0/n2 ), .Q(\ram_ctr_0/n12 ) );
  AO21X1 U267 ( .IN1(ram_addr[4]), .IN2(n149), .IN3(n157), .Q(\ram_ctr_0/N9 )
         );
  AO221X1 U268 ( .IN1(\ram_ctr_0/N11 ), .IN2(ram_wr_n), .IN3(ram_addr[6]), 
        .IN4(n26), .IN5(\ram_ctr_0/n2 ), .Q(\ram_ctr_0/n10 ) );
  AO21X1 U269 ( .IN1(ram_addr[6]), .IN2(n147), .IN3(n159), .Q(\ram_ctr_0/N11 )
         );
  AO221X1 U270 ( .IN1(\ram_ctr_0/N12 ), .IN2(ram_wr_n), .IN3(ram_addr[7]), 
        .IN4(n26), .IN5(\ram_ctr_0/n2 ), .Q(\ram_ctr_0/n9 ) );
  AO21X1 U271 ( .IN1(ram_addr[7]), .IN2(n146), .IN3(n160), .Q(\ram_ctr_0/N12 )
         );
  AO221X1 U272 ( .IN1(\ram_ctr_0/N13 ), .IN2(ram_wr_n), .IN3(ram_addr[8]), 
        .IN4(n26), .IN5(\ram_ctr_0/n2 ), .Q(\ram_ctr_0/n8 ) );
  AO21X1 U273 ( .IN1(ram_addr[8]), .IN2(n145), .IN3(n161), .Q(\ram_ctr_0/N13 )
         );
  AO221X1 U274 ( .IN1(\ram_ctr_0/N10 ), .IN2(ram_wr_n), .IN3(ram_addr[5]), 
        .IN4(n26), .IN5(\ram_ctr_0/n2 ), .Q(\ram_ctr_0/n11 ) );
  AO21X1 U275 ( .IN1(ram_addr[5]), .IN2(n148), .IN3(n158), .Q(\ram_ctr_0/N10 )
         );
  OR3X1 U276 ( .IN1(ram_addr[8]), .IN2(ram_addr[9]), .IN3(ram_addr[7]), .Q(
        \ram_ctr_0/n5 ) );
  AO221X1 U277 ( .IN1(\ram_ctr_0/N14 ), .IN2(ram_wr_n), .IN3(ram_addr[9]), 
        .IN4(n26), .IN5(\ram_ctr_0/n2 ), .Q(\ram_ctr_0/n7 ) );
  XNOR2X1 U278 ( .IN1(n144), .IN2(n161), .Q(\ram_ctr_0/N14 ) );
  AND2X1 U279 ( .IN1(\averager_0/ac[0] ), .IN2(n71), .Q(n21) );
  NAND2X0 U280 ( .IN1(n71), .IN2(ram_data[7]), .QN(
        \averager_0/dp_cluster_0/mult_add_20_aco/PROD_not[9] ) );
  AND2X1 U281 ( .IN1(ram_data[6]), .IN2(n71), .Q(n22) );
  NBUFFX2 U282 ( .IN(n56), .Q(n28) );
  NBUFFX2 U283 ( .IN(reset_n), .Q(n56) );
  NBUFFX2 U284 ( .IN(reset_n), .Q(n47) );
  NBUFFX2 U285 ( .IN(reset_n), .Q(n49) );
  NBUFFX2 U286 ( .IN(reset_n), .Q(n50) );
  NBUFFX2 U287 ( .IN(reset_n), .Q(n52) );
  NBUFFX2 U288 ( .IN(reset_n), .Q(n53) );
  NBUFFX2 U289 ( .IN(reset_n), .Q(n54) );
  NBUFFX2 U290 ( .IN(reset_n), .Q(n55) );
  NBUFFX2 U291 ( .IN(reset_n), .Q(n51) );
  NBUFFX2 U292 ( .IN(reset_n), .Q(n48) );
endmodule

