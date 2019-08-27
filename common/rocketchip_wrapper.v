`timescale 1 ps / 1 ps
`include "clocking.vh"

module rocketchip_wrapper
   (
`ifndef differential_clock
    clk);
`else
    SYSCLK_P,
    SYSCLK_N);
`endif

`ifndef differential_clock
  input clk;
`else
  input SYSCLK_P;
  input SYSCLK_N;
`endif

  wire FCLK_RESET0_N;
  wire [31:0] M_AXI_araddr;
  wire [1:0]  M_AXI_arburst;
  wire [3:0]  M_AXI_arcache;
  wire [11:0] M_AXI_arid;
  wire [7:0]  M_AXI_arlen;
  wire        M_AXI_arlock;
  wire [2:0]  M_AXI_arprot;
  wire [3:0]  M_AXI_arqos;
  wire        M_AXI_arready;
  wire [2:0]  M_AXI_arsize;
  wire        M_AXI_aruser;
  wire        M_AXI_arvalid;
  wire [31:0] M_AXI_awaddr;
  wire [1:0]  M_AXI_awburst;
  wire [3:0]  M_AXI_awcache;
  wire [11:0] M_AXI_awid;
  wire [7:0]  M_AXI_awlen;
  wire        M_AXI_awlock;
  wire [2:0]  M_AXI_awprot;
  wire [3:0]  M_AXI_awqos;
  wire        M_AXI_awready;
  wire [2:0]  M_AXI_awsize;
  wire        M_AXI_awuser;
  wire        M_AXI_awvalid;
  wire [11:0] M_AXI_bid;
  wire        M_AXI_bready;
  wire [1:0]  M_AXI_bresp;
  wire        M_AXI_bvalid;
  wire [31:0] M_AXI_rdata;
  wire [11:0] M_AXI_rid;
  wire        M_AXI_rlast;
  wire        M_AXI_rready;
  wire [1:0]  M_AXI_rresp;
  wire        M_AXI_rvalid;
  wire [31:0] M_AXI_wdata;
  wire        M_AXI_wlast;
  wire        M_AXI_wready;
  wire [3:0]  M_AXI_wstrb;
  wire        M_AXI_wvalid;
  
  wire [31:0] S_AXI_araddr;
  wire [1:0]  S_AXI_arburst;
  wire [3:0]  S_AXI_arcache;
  wire [5:0]  S_AXI_arid;
  wire [7:0]  S_AXI_arlen;
  wire        S_AXI_arlock;
  wire [2:0]  S_AXI_arprot;
  wire [3:0]  S_AXI_arqos;
  wire        S_AXI_arready;
  wire [2:0]  S_AXI_arsize;
  wire        S_AXI_aruser;
  wire        S_AXI_arvalid;
  wire [31:0] S_AXI_awaddr;
  wire [1:0]  S_AXI_awburst;
  wire [3:0]  S_AXI_awcache;
  wire [5:0]  S_AXI_awid;
  wire [7:0]  S_AXI_awlen;
  wire        S_AXI_awlock;
  wire [2:0]  S_AXI_awprot;
  wire [3:0]  S_AXI_awqos;
  wire        S_AXI_awready;
  wire [2:0]  S_AXI_awsize;
  wire        S_AXI_awuser;
  wire        S_AXI_awvalid;
  wire [5:0]  S_AXI_bid;
  wire        S_AXI_bready;
  wire [1:0]  S_AXI_bresp;
  wire        S_AXI_bvalid;
  wire [63:0] S_AXI_rdata;
  wire [5:0]  S_AXI_rid;
  wire        S_AXI_rlast;
  wire        S_AXI_rready;
  wire [1:0]  S_AXI_rresp;
  wire        S_AXI_rvalid;
  wire [63:0] S_AXI_wdata;
  wire        S_AXI_wlast;
  wire        S_AXI_wready;
  wire [7:0]  S_AXI_wstrb;
  wire        S_AXI_wvalid;
  
  wire reset, reset_cpu;
  wire host_clk;
  wire gclk_i, gclk_fbout, host_clk_i, mmcm_locked;

  system system_i
       (.FCLK_RESET0_N(FCLK_RESET0_N),                                
        .M_AXI_araddr(M_AXI_araddr),                                  
        .M_AXI_arburst(M_AXI_arburst),                                
        .M_AXI_arcache(M_AXI_arcache),         
        .M_AXI_arid(M_AXI_arid),                         
        .M_AXI_arlen(M_AXI_arlen),                                    
        .M_AXI_arlock(M_AXI_arlock),                                  
        .M_AXI_arprot(M_AXI_arprot),                                  
        .M_AXI_arqos(M_AXI_arqos),                                    
        .M_AXI_arready(M_AXI_arready),                                                              
        .M_AXI_arsize(M_AXI_arsize),  
        .M_AXI_aruser(M_AXI_aruser),                                
        .M_AXI_arvalid(M_AXI_arvalid),                                
        .M_AXI_awaddr(M_AXI_awaddr),                                  
        .M_AXI_awburst(M_AXI_awburst),                                
        .M_AXI_awcache(M_AXI_awcache),   
        .M_AXI_awid(M_AXI_awid),                             
        .M_AXI_awlen(M_AXI_awlen),                                    
        .M_AXI_awlock(M_AXI_awlock),                                  
        .M_AXI_awprot(M_AXI_awprot),                                  
        .M_AXI_awqos(M_AXI_awqos),                                    
        .M_AXI_awready(M_AXI_awready),                                                              
        .M_AXI_awsize(M_AXI_awsize),
        .M_AXI_awuser(M_AXI_awuser),                                  
        .M_AXI_awvalid(M_AXI_awvalid),  
        .M_AXI_bid(M_AXI_bid),                            
        .M_AXI_bready(M_AXI_bready),                                  
        .M_AXI_bresp(M_AXI_bresp),                                    
        .M_AXI_bvalid(M_AXI_bvalid),                                  
        .M_AXI_rdata(M_AXI_rdata),                                    
        .M_AXI_rlast(M_AXI_rlast), 
        .M_AXI_rid(M_AXI_rid),                                    
        .M_AXI_rready(M_AXI_rready),                                  
        .M_AXI_rresp(M_AXI_rresp),                                    
        .M_AXI_rvalid(M_AXI_rvalid),                                  
        .M_AXI_wdata(M_AXI_wdata),                                    
        .M_AXI_wlast(M_AXI_wlast),                                    
        .M_AXI_wready(M_AXI_wready),                                  
        .M_AXI_wstrb(M_AXI_wstrb),                                    
        .M_AXI_wvalid(M_AXI_wvalid),                                  
        .S_AXI_araddr(S_AXI_araddr),                                  
        .S_AXI_arburst(S_AXI_arburst),                                
        .S_AXI_arcache(S_AXI_arcache),  
        .S_AXI_arid(S_AXI_arid),                              
        .S_AXI_arlen(S_AXI_arlen),                                    
        .S_AXI_arlock(S_AXI_arlock),                                  
        .S_AXI_arprot(S_AXI_arprot),
        .S_AXI_arqos(S_AXI_arqos),
        .S_AXI_arready(S_AXI_arready),
        .S_AXI_arsize(S_AXI_arsize),
        .S_AXI_aruser(S_AXI_aruser),
        .S_AXI_arvalid(S_AXI_arvalid),
        .S_AXI_awaddr(S_AXI_awaddr),
        .S_AXI_awburst(S_AXI_awburst),
        .S_AXI_awcache(S_AXI_awcache),
        .S_AXI_awid(S_AXI_awid),
        .S_AXI_awlen(S_AXI_awlen),
        .S_AXI_awlock(S_AXI_awlock),
        .S_AXI_awprot(S_AXI_awprot),
        .S_AXI_awqos(S_AXI_awqos),
        .S_AXI_awready(S_AXI_awready),
        .S_AXI_awsize(S_AXI_awsize),
        .S_AXI_awuser(S_AXI_awuser),
        .S_AXI_awvalid(S_AXI_awvalid),
        .S_AXI_bid(S_AXI_bid),
        .S_AXI_bready(S_AXI_bready),
        .S_AXI_bresp(S_AXI_bresp),
        .S_AXI_bvalid(S_AXI_bvalid),
        .S_AXI_rdata(S_AXI_rdata),
        .S_AXI_rid(S_AXI_rid),
        .S_AXI_rlast(S_AXI_rlast),
        .S_AXI_rready(S_AXI_rready),
        .S_AXI_rresp(S_AXI_rresp),
        .S_AXI_rvalid(S_AXI_rvalid),
        .S_AXI_wdata(S_AXI_wdata),
        .S_AXI_wlast(S_AXI_wlast),
        .S_AXI_wready(S_AXI_wready),
        .S_AXI_wstrb(S_AXI_wstrb),
        .S_AXI_wvalid(S_AXI_wvalid),
        .ext_clk_in(host_clk)
        );

  assign reset = !FCLK_RESET0_N || !mmcm_locked;

  wire [31:0] mem_araddr;
  wire [31:0] mem_awaddr;

  // Memory given to Rocket is the upper 256 MB of the 512 MB DRAM
  assign S_AXI_araddr = {4'd1, mem_araddr[27:0]};
  assign S_AXI_awaddr = {4'd1, mem_awaddr[27:0]};

  Top top(
   .clock(host_clk),
   .reset(reset),
   .io_ps_axi_slave_aw_ready(M_AXI_awready), 
   .io_ps_axi_slave_aw_valid(M_AXI_awvalid), 
   .io_ps_axi_slave_aw_bits_id(M_AXI_awid), 
   .io_ps_axi_slave_aw_bits_addr(M_AXI_awaddr), 
   .io_ps_axi_slave_aw_bits_len(M_AXI_awlen), 
   .io_ps_axi_slave_aw_bits_size(M_AXI_awsize), 
   .io_ps_axi_slave_aw_bits_burst(M_AXI_awburst), 
   .io_ps_axi_slave_aw_bits_lock(M_AXI_awlock), 
   .io_ps_axi_slave_aw_bits_cache(M_AXI_awcache), 
   .io_ps_axi_slave_aw_bits_prot(M_AXI_awprot), 
   .io_ps_axi_slave_aw_bits_qos(M_AXI_awqos), 
   .io_ps_axi_slave_w_ready(M_AXI_wready), 
   .io_ps_axi_slave_w_valid(M_AXI_wvalid), 
   .io_ps_axi_slave_w_bits_data(M_AXI_wdata), 
   .io_ps_axi_slave_w_bits_strb(M_AXI_wstrb), 
   .io_ps_axi_slave_w_bits_last(M_AXI_wlast), 
   .io_ps_axi_slave_b_ready(M_AXI_bready), 
   .io_ps_axi_slave_b_valid(M_AXI_bvalid), 
   .io_ps_axi_slave_b_bits_id(M_AXI_bid), 
   .io_ps_axi_slave_b_bits_resp(M_AXI_bresp), 
   .io_ps_axi_slave_ar_ready(M_AXI_arready), 
   .io_ps_axi_slave_ar_valid(M_AXI_arvalid), 
   .io_ps_axi_slave_ar_bits_id(M_AXI_arid), 
   .io_ps_axi_slave_ar_bits_addr(M_AXI_araddr), 
   .io_ps_axi_slave_ar_bits_len(M_AXI_arlen), 
   .io_ps_axi_slave_ar_bits_size(M_AXI_arsize), 
   .io_ps_axi_slave_ar_bits_burst(M_AXI_arburst), 
   .io_ps_axi_slave_ar_bits_lock(M_AXI_arlock), 
   .io_ps_axi_slave_ar_bits_cache(M_AXI_arcache), 
   .io_ps_axi_slave_ar_bits_prot(M_AXI_arprot), 
   .io_ps_axi_slave_ar_bits_qos(M_AXI_arqos), 
   .io_ps_axi_slave_r_ready(M_AXI_rready), 
   .io_ps_axi_slave_r_valid(M_AXI_rvalid), 
   .io_ps_axi_slave_r_bits_id(M_AXI_rid), 
   .io_ps_axi_slave_r_bits_data(M_AXI_rdata), 
   .io_ps_axi_slave_r_bits_resp(M_AXI_rresp), 
   .io_ps_axi_slave_r_bits_last(M_AXI_rlast), 

   .io_mem_axi_aw_ready(S_AXI_awready), 
   .io_mem_axi_aw_valid(S_AXI_awvalid), 
   .io_mem_axi_aw_bits_id(S_AXI_awid), 
   .io_mem_axi_aw_bits_addr(S_AXI_awaddr), 
   .io_mem_axi_aw_bits_len(S_AXI_awlen), 
   .io_mem_axi_aw_bits_size(S_AXI_awsize), 
   .io_mem_axi_aw_bits_burst(S_AXI_awburst), 
   .io_mem_axi_aw_bits_lock(S_AXI_awlock), 
   .io_mem_axi_aw_bits_cache(S_AXI_awcache), 
   .io_mem_axi_aw_bits_prot(S_AXI_awprot), 
   .io_mem_axi_aw_bits_qos(S_AXI_awqos), 
   .io_mem_axi_w_ready(S_AXI_wready), 
   .io_mem_axi_w_valid(S_AXI_wvalid), 
   .io_mem_axi_w_bits_data(S_AXI_wdata), 
   .io_mem_axi_w_bits_strb(S_AXI_wstrb), 
   .io_mem_axi_w_bits_last(S_AXI_wlast), 
   .io_mem_axi_b_ready(S_AXI_bready), 
   .io_mem_axi_b_valid(S_AXI_bvalid), 
   .io_mem_axi_b_bits_id(S_AXI_bid), 
   .io_mem_axi_b_bits_resp(S_AXI_bresp), 
   .io_mem_axi_ar_ready(S_AXI_arready), 
   .io_mem_axi_ar_valid(S_AXI_arvalid), 
   .io_mem_axi_ar_bits_id(S_AXI_arid), 
   .io_mem_axi_ar_bits_addr(S_AXI_araddr), 
   .io_mem_axi_ar_bits_len(S_AXI_arlen), 
   .io_mem_axi_ar_bits_size(S_AXI_arsize), 
   .io_mem_axi_ar_bits_burst(S_AXI_arburst), 
   .io_mem_axi_ar_bits_lock(S_AXI_arlock), 
   .io_mem_axi_ar_bits_cache(S_AXI_arcache), 
   .io_mem_axi_ar_bits_prot(S_AXI_arprot), 
   .io_mem_axi_ar_bits_qos(S_AXI_arqos), 
   .io_mem_axi_r_ready(S_AXI_rready), 
   .io_mem_axi_r_valid(S_AXI_rvalid), 
   .io_mem_axi_r_bits_id(S_AXI_rid), 
   .io_mem_axi_r_bits_data(S_AXI_rdata), 
   .io_mem_axi_r_bits_resp(S_AXI_rresp), 
   .io_mem_axi_r_bits_last(S_AXI_rlast) 
  );
`ifndef differential_clock
  IBUFG ibufg_gclk (.I(clk), .O(gclk_i));
`else
  IBUFDS #(.DIFF_TERM("TRUE"), .IBUF_LOW_PWR("TRUE"), .IOSTANDARD("DEFAULT")) clk_ibufds (.O(gclk_i), .I(SYSCLK_P), .IB(SYSCLK_N));
`endif
  BUFG  bufg_host_clk (.I(host_clk_i), .O(host_clk));

  MMCME2_BASE #(
    .BANDWIDTH("OPTIMIZED"),
    .CLKFBOUT_MULT_F(`RC_CLK_MULT),
    .CLKFBOUT_PHASE(0.0),
    .CLKIN1_PERIOD(`ZYNQ_CLK_PERIOD),
    .CLKOUT1_DIVIDE(1),
    .CLKOUT2_DIVIDE(1),
    .CLKOUT3_DIVIDE(1),
    .CLKOUT4_DIVIDE(1),
    .CLKOUT5_DIVIDE(1),
    .CLKOUT6_DIVIDE(1),
    .CLKOUT0_DIVIDE_F(`RC_CLK_DIVIDE),
    .CLKOUT0_DUTY_CYCLE(0.5),
    .CLKOUT1_DUTY_CYCLE(0.5),
    .CLKOUT2_DUTY_CYCLE(0.5),
    .CLKOUT3_DUTY_CYCLE(0.5),
    .CLKOUT4_DUTY_CYCLE(0.5),
    .CLKOUT5_DUTY_CYCLE(0.5),
    .CLKOUT6_DUTY_CYCLE(0.5),
    .CLKOUT0_PHASE(0.0),
    .CLKOUT1_PHASE(0.0),
    .CLKOUT2_PHASE(0.0),
    .CLKOUT3_PHASE(0.0),
    .CLKOUT4_PHASE(0.0),
    .CLKOUT5_PHASE(0.0),
    .CLKOUT6_PHASE(0.0),
    .CLKOUT4_CASCADE("FALSE"),
    .DIVCLK_DIVIDE(1),
    .REF_JITTER1(0.0),
    .STARTUP_WAIT("FALSE")
  ) MMCME2_BASE_inst (
    .CLKOUT0(host_clk_i),
    .CLKOUT0B(),
    .CLKOUT1(),
    .CLKOUT1B(),
    .CLKOUT2(),
    .CLKOUT2B(),
    .CLKOUT3(),
    .CLKOUT3B(),
    .CLKOUT4(),
    .CLKOUT5(),
    .CLKOUT6(),
    .CLKFBOUT(gclk_fbout),
    .CLKFBOUTB(),
    .LOCKED(mmcm_locked),
    .CLKIN1(gclk_i),
    .PWRDWN(1'b0),
    .RST(1'b0),
    .CLKFBIN(gclk_fbout));

endmodule
