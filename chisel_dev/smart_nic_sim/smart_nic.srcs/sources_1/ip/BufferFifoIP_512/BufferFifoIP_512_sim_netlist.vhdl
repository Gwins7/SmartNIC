-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
-- Date        : Fri Mar 10 23:11:17 2023
-- Host        : Gwins7-Legion running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               d:/Chisel/chisel_dev/smart_nic_sim/smart_nic.srcs/sources_1/ip/BufferFifoIP_512/BufferFifoIP_512_sim_netlist.vhdl
-- Design      : BufferFifoIP_512
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xczu19eg-ffvc1760-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity BufferFifoIP_512_xpm_cdc_sync_rst is
  port (
    src_rst : in STD_LOGIC;
    dest_clk : in STD_LOGIC;
    dest_rst : out STD_LOGIC
  );
  attribute DEF_VAL : string;
  attribute DEF_VAL of BufferFifoIP_512_xpm_cdc_sync_rst : entity is "1'b0";
  attribute DEST_SYNC_FF : integer;
  attribute DEST_SYNC_FF of BufferFifoIP_512_xpm_cdc_sync_rst : entity is 4;
  attribute INIT : string;
  attribute INIT of BufferFifoIP_512_xpm_cdc_sync_rst : entity is "0";
  attribute INIT_SYNC_FF : integer;
  attribute INIT_SYNC_FF of BufferFifoIP_512_xpm_cdc_sync_rst : entity is 1;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of BufferFifoIP_512_xpm_cdc_sync_rst : entity is "xpm_cdc_sync_rst";
  attribute SIM_ASSERT_CHK : integer;
  attribute SIM_ASSERT_CHK of BufferFifoIP_512_xpm_cdc_sync_rst : entity is 0;
  attribute VERSION : integer;
  attribute VERSION of BufferFifoIP_512_xpm_cdc_sync_rst : entity is 0;
  attribute XPM_MODULE : string;
  attribute XPM_MODULE of BufferFifoIP_512_xpm_cdc_sync_rst : entity is "TRUE";
  attribute keep_hierarchy : string;
  attribute keep_hierarchy of BufferFifoIP_512_xpm_cdc_sync_rst : entity is "true";
  attribute xpm_cdc : string;
  attribute xpm_cdc of BufferFifoIP_512_xpm_cdc_sync_rst : entity is "SYNC_RST";
end BufferFifoIP_512_xpm_cdc_sync_rst;

architecture STRUCTURE of BufferFifoIP_512_xpm_cdc_sync_rst is
  signal syncstages_ff : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of syncstages_ff : signal is "true";
  attribute async_reg : string;
  attribute async_reg of syncstages_ff : signal is "true";
  attribute xpm_cdc of syncstages_ff : signal is "SYNC_RST";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[0]\ : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of \syncstages_ff_reg[0]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[0]\ : label is "SYNC_RST";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[1]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[1]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[1]\ : label is "SYNC_RST";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[2]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[2]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[2]\ : label is "SYNC_RST";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[3]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[3]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[3]\ : label is "SYNC_RST";
begin
  dest_rst <= syncstages_ff(3);
\syncstages_ff_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => dest_clk,
      CE => '1',
      D => src_rst,
      Q => syncstages_ff(0),
      R => '0'
    );
\syncstages_ff_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => dest_clk,
      CE => '1',
      D => syncstages_ff(0),
      Q => syncstages_ff(1),
      R => '0'
    );
\syncstages_ff_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => dest_clk,
      CE => '1',
      D => syncstages_ff(1),
      Q => syncstages_ff(2),
      R => '0'
    );
\syncstages_ff_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => dest_clk,
      CE => '1',
      D => syncstages_ff(2),
      Q => syncstages_ff(3),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \BufferFifoIP_512_xpm_counter_updn__parameterized0\ is
  port (
    Q : out STD_LOGIC_VECTOR ( 5 downto 0 );
    wr_en : in STD_LOGIC;
    \count_value_i_reg[5]_0\ : in STD_LOGIC;
    \count_value_i_reg[1]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    rst_d1 : in STD_LOGIC;
    ram_wr_en_i : in STD_LOGIC;
    wr_clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \BufferFifoIP_512_xpm_counter_updn__parameterized0\ : entity is "xpm_counter_updn";
end \BufferFifoIP_512_xpm_counter_updn__parameterized0\;

architecture STRUCTURE of \BufferFifoIP_512_xpm_counter_updn__parameterized0\ is
  signal \^q\ : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \count_value_i[0]_i_1__1_n_0\ : STD_LOGIC;
  signal \count_value_i[1]_i_1__1_n_0\ : STD_LOGIC;
  signal \count_value_i[2]_i_1__1_n_0\ : STD_LOGIC;
  signal \count_value_i[3]_i_1__1_n_0\ : STD_LOGIC;
  signal \count_value_i[4]_i_1__1_n_0\ : STD_LOGIC;
  signal \count_value_i[5]_i_1_n_0\ : STD_LOGIC;
  signal \count_value_i[5]_i_2_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count_value_i[0]_i_1__1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \count_value_i[2]_i_1__1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \count_value_i[3]_i_1__1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \count_value_i[4]_i_1__1\ : label is "soft_lutpair7";
begin
  Q(5 downto 0) <= \^q\(5 downto 0);
\count_value_i[0]_i_1__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(0),
      O => \count_value_i[0]_i_1__1_n_0\
    );
\count_value_i[1]_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      O => \count_value_i[1]_i_1__1_n_0\
    );
\count_value_i[2]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => \^q\(2),
      O => \count_value_i[2]_i_1__1_n_0\
    );
\count_value_i[3]_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => \^q\(2),
      I3 => \^q\(3),
      O => \count_value_i[3]_i_1__1_n_0\
    );
\count_value_i[4]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => \^q\(3),
      I4 => \^q\(4),
      O => \count_value_i[4]_i_1__1_n_0\
    );
\count_value_i[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(3),
      I1 => \count_value_i[5]_i_2_n_0\,
      I2 => \^q\(2),
      I3 => \^q\(4),
      I4 => \^q\(5),
      O => \count_value_i[5]_i_1_n_0\
    );
\count_value_i[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000800000000"
    )
        port map (
      I0 => \^q\(1),
      I1 => wr_en,
      I2 => \count_value_i_reg[5]_0\,
      I3 => \count_value_i_reg[1]_0\(0),
      I4 => rst_d1,
      I5 => \^q\(0),
      O => \count_value_i[5]_i_2_n_0\
    );
\count_value_i_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_i,
      D => \count_value_i[0]_i_1__1_n_0\,
      Q => \^q\(0),
      R => \count_value_i_reg[1]_0\(0)
    );
\count_value_i_reg[1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_i,
      D => \count_value_i[1]_i_1__1_n_0\,
      Q => \^q\(1),
      S => \count_value_i_reg[1]_0\(0)
    );
\count_value_i_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_i,
      D => \count_value_i[2]_i_1__1_n_0\,
      Q => \^q\(2),
      R => \count_value_i_reg[1]_0\(0)
    );
\count_value_i_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_i,
      D => \count_value_i[3]_i_1__1_n_0\,
      Q => \^q\(3),
      R => \count_value_i_reg[1]_0\(0)
    );
\count_value_i_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_i,
      D => \count_value_i[4]_i_1__1_n_0\,
      Q => \^q\(4),
      R => \count_value_i_reg[1]_0\(0)
    );
\count_value_i_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_i,
      D => \count_value_i[5]_i_1_n_0\,
      Q => \^q\(5),
      R => \count_value_i_reg[1]_0\(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \BufferFifoIP_512_xpm_counter_updn__parameterized2\ is
  port (
    going_afull : out STD_LOGIC;
    \FSM_sequential_gen_fwft.curr_fwft_state_reg[1]\ : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 5 downto 0 );
    leaving_empty0 : out STD_LOGIC;
    going_full1 : out STD_LOGIC;
    \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg\ : out STD_LOGIC;
    \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0\ : out STD_LOGIC;
    ram_wr_en_i : in STD_LOGIC;
    \count_value_i_reg[0]_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    rd_en : in STD_LOGIC;
    ram_empty_i : in STD_LOGIC;
    \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_3_0\ : in STD_LOGIC_VECTOR ( 5 downto 0 );
    \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_4_0\ : in STD_LOGIC_VECTOR ( 5 downto 0 );
    \gen_pntr_flags_cc.gaf_cc.ram_afull_i_i_3_0\ : in STD_LOGIC_VECTOR ( 5 downto 0 );
    \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_1\ : in STD_LOGIC;
    clr_full : in STD_LOGIC;
    \count_value_i_reg[5]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    wr_clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \BufferFifoIP_512_xpm_counter_updn__parameterized2\ : entity is "xpm_counter_updn";
end \BufferFifoIP_512_xpm_counter_updn__parameterized2\;

architecture STRUCTURE of \BufferFifoIP_512_xpm_counter_updn__parameterized2\ is
  signal \^fsm_sequential_gen_fwft.curr_fwft_state_reg[1]\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \count_value_i[0]_i_1__2_n_0\ : STD_LOGIC;
  signal \count_value_i[1]_i_1__2_n_0\ : STD_LOGIC;
  signal \count_value_i[2]_i_1__2_n_0\ : STD_LOGIC;
  signal \count_value_i[3]_i_1__2_n_0\ : STD_LOGIC;
  signal \count_value_i[4]_i_1__2_n_0\ : STD_LOGIC;
  signal \count_value_i[5]_i_1__2_n_0\ : STD_LOGIC;
  signal \count_value_i[5]_i_2__2_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.gaf_cc.ram_afull_i_i_5_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.gaf_cc.ram_afull_i_i_6_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_5_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_6_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_7_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_8_n_0\ : STD_LOGIC;
  signal \^going_full1\ : STD_LOGIC;
  signal \^leaving_empty0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count_value_i[0]_i_1__2\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \count_value_i[1]_i_1__2\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \count_value_i[3]_i_1__2\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \count_value_i[4]_i_1__2\ : label is "soft_lutpair1";
begin
  \FSM_sequential_gen_fwft.curr_fwft_state_reg[1]\ <= \^fsm_sequential_gen_fwft.curr_fwft_state_reg[1]\;
  Q(5 downto 0) <= \^q\(5 downto 0);
  going_full1 <= \^going_full1\;
  leaving_empty0 <= \^leaving_empty0\;
\count_value_i[0]_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"10EF"
    )
        port map (
      I0 => rd_en,
      I1 => \count_value_i_reg[0]_0\(0),
      I2 => \count_value_i_reg[0]_0\(1),
      I3 => \^q\(0),
      O => \count_value_i[0]_i_1__2_n_0\
    );
\count_value_i[1]_i_1__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02FFFD00"
    )
        port map (
      I0 => \count_value_i_reg[0]_0\(1),
      I1 => \count_value_i_reg[0]_0\(0),
      I2 => rd_en,
      I3 => \^q\(0),
      I4 => \^q\(1),
      O => \count_value_i[1]_i_1__2_n_0\
    );
\count_value_i[2]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => \^q\(2),
      O => \count_value_i[2]_i_1__2_n_0\
    );
\count_value_i[3]_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => \^q\(2),
      I3 => \^q\(3),
      O => \count_value_i[3]_i_1__2_n_0\
    );
\count_value_i[4]_i_1__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => \^q\(3),
      I4 => \^q\(4),
      O => \count_value_i[4]_i_1__2_n_0\
    );
\count_value_i[5]_i_1__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(3),
      I1 => \count_value_i[5]_i_2__2_n_0\,
      I2 => \^q\(2),
      I3 => \^q\(4),
      I4 => \^q\(5),
      O => \count_value_i[5]_i_1__2_n_0\
    );
\count_value_i[5]_i_2__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000AAA200000000"
    )
        port map (
      I0 => \^q\(1),
      I1 => \count_value_i_reg[0]_0\(1),
      I2 => \count_value_i_reg[0]_0\(0),
      I3 => rd_en,
      I4 => ram_empty_i,
      I5 => \^q\(0),
      O => \count_value_i[5]_i_2__2_n_0\
    );
\count_value_i_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \^fsm_sequential_gen_fwft.curr_fwft_state_reg[1]\,
      D => \count_value_i[0]_i_1__2_n_0\,
      Q => \^q\(0),
      R => \count_value_i_reg[5]_0\(0)
    );
\count_value_i_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \^fsm_sequential_gen_fwft.curr_fwft_state_reg[1]\,
      D => \count_value_i[1]_i_1__2_n_0\,
      Q => \^q\(1),
      R => \count_value_i_reg[5]_0\(0)
    );
\count_value_i_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \^fsm_sequential_gen_fwft.curr_fwft_state_reg[1]\,
      D => \count_value_i[2]_i_1__2_n_0\,
      Q => \^q\(2),
      R => \count_value_i_reg[5]_0\(0)
    );
\count_value_i_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \^fsm_sequential_gen_fwft.curr_fwft_state_reg[1]\,
      D => \count_value_i[3]_i_1__2_n_0\,
      Q => \^q\(3),
      R => \count_value_i_reg[5]_0\(0)
    );
\count_value_i_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \^fsm_sequential_gen_fwft.curr_fwft_state_reg[1]\,
      D => \count_value_i[4]_i_1__2_n_0\,
      Q => \^q\(4),
      R => \count_value_i_reg[5]_0\(0)
    );
\count_value_i_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \^fsm_sequential_gen_fwft.curr_fwft_state_reg[1]\,
      D => \count_value_i[5]_i_1__2_n_0\,
      Q => \^q\(5),
      R => \count_value_i_reg[5]_0\(0)
    );
\gen_pntr_flags_cc.gaf_cc.ram_afull_i_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => \gen_pntr_flags_cc.gaf_cc.ram_afull_i_i_5_n_0\,
      I1 => \gen_pntr_flags_cc.gaf_cc.ram_afull_i_i_6_n_0\,
      I2 => \^fsm_sequential_gen_fwft.curr_fwft_state_reg[1]\,
      I3 => ram_wr_en_i,
      O => going_afull
    );
\gen_pntr_flags_cc.gaf_cc.ram_afull_i_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^q\(3),
      I1 => \gen_pntr_flags_cc.gaf_cc.ram_afull_i_i_3_0\(3),
      I2 => \gen_pntr_flags_cc.gaf_cc.ram_afull_i_i_3_0\(5),
      I3 => \^q\(5),
      I4 => \gen_pntr_flags_cc.gaf_cc.ram_afull_i_i_3_0\(4),
      I5 => \^q\(4),
      O => \gen_pntr_flags_cc.gaf_cc.ram_afull_i_i_5_n_0\
    );
\gen_pntr_flags_cc.gaf_cc.ram_afull_i_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^q\(0),
      I1 => \gen_pntr_flags_cc.gaf_cc.ram_afull_i_i_3_0\(0),
      I2 => \gen_pntr_flags_cc.gaf_cc.ram_afull_i_i_3_0\(2),
      I3 => \^q\(2),
      I4 => \gen_pntr_flags_cc.gaf_cc.ram_afull_i_i_3_0\(1),
      I5 => \^q\(1),
      O => \gen_pntr_flags_cc.gaf_cc.ram_afull_i_i_6_n_0\
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000FFF0088"
    )
        port map (
      I0 => ram_wr_en_i,
      I1 => \^going_full1\,
      I2 => \^leaving_empty0\,
      I3 => \^fsm_sequential_gen_fwft.curr_fwft_state_reg[1]\,
      I4 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_1\,
      I5 => clr_full,
      O => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg\
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FABAFBBBFBBBFBBB"
    )
        port map (
      I0 => clr_full,
      I1 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_1\,
      I2 => \^fsm_sequential_gen_fwft.curr_fwft_state_reg[1]\,
      I3 => \^leaving_empty0\,
      I4 => \^going_full1\,
      I5 => ram_wr_en_i,
      O => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0\
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_5_n_0\,
      I1 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_6_n_0\,
      O => \^leaving_empty0\
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_7_n_0\,
      I1 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_8_n_0\,
      O => \^going_full1\
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^q\(0),
      I1 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_3_0\(0),
      I2 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_3_0\(2),
      I3 => \^q\(2),
      I4 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_3_0\(1),
      I5 => \^q\(1),
      O => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_5_n_0\
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^q\(3),
      I1 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_3_0\(3),
      I2 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_3_0\(5),
      I3 => \^q\(5),
      I4 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_3_0\(4),
      I5 => \^q\(4),
      O => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_6_n_0\
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^q\(0),
      I1 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_4_0\(0),
      I2 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_4_0\(2),
      I3 => \^q\(2),
      I4 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_4_0\(1),
      I5 => \^q\(1),
      O => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_7_n_0\
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^q\(3),
      I1 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_4_0\(3),
      I2 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_4_0\(5),
      I3 => \^q\(5),
      I4 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_4_0\(4),
      I5 => \^q\(4),
      O => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_8_n_0\
    );
\gen_sdpram.xpm_memory_base_inst_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00FD"
    )
        port map (
      I0 => \count_value_i_reg[0]_0\(1),
      I1 => \count_value_i_reg[0]_0\(0),
      I2 => rd_en,
      I3 => ram_empty_i,
      O => \^fsm_sequential_gen_fwft.curr_fwft_state_reg[1]\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \BufferFifoIP_512_xpm_counter_updn__parameterized2_0\ is
  port (
    Q : out STD_LOGIC_VECTOR ( 5 downto 0 );
    ram_empty_i0 : out STD_LOGIC;
    wr_en : in STD_LOGIC;
    \count_value_i_reg[5]_0\ : in STD_LOGIC;
    \count_value_i_reg[0]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    rst_d1 : in STD_LOGIC;
    \gen_pntr_flags_cc.ram_empty_i_reg\ : in STD_LOGIC;
    leaving_empty0 : in STD_LOGIC;
    ram_wr_en_i : in STD_LOGIC;
    ram_empty_i : in STD_LOGIC;
    \gen_pntr_flags_cc.ram_empty_i_reg_0\ : in STD_LOGIC_VECTOR ( 5 downto 0 );
    wr_clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \BufferFifoIP_512_xpm_counter_updn__parameterized2_0\ : entity is "xpm_counter_updn";
end \BufferFifoIP_512_xpm_counter_updn__parameterized2_0\;

architecture STRUCTURE of \BufferFifoIP_512_xpm_counter_updn__parameterized2_0\ is
  signal \^q\ : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \count_value_i[0]_i_1_n_0\ : STD_LOGIC;
  signal \count_value_i[1]_i_1_n_0\ : STD_LOGIC;
  signal \count_value_i[2]_i_1_n_0\ : STD_LOGIC;
  signal \count_value_i[3]_i_1_n_0\ : STD_LOGIC;
  signal \count_value_i[4]_i_1_n_0\ : STD_LOGIC;
  signal \count_value_i[5]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_value_i[5]_i_2__0_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.ram_empty_i_i_2_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.ram_empty_i_i_3_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count_value_i[1]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \count_value_i[2]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \count_value_i[3]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \count_value_i[4]_i_1\ : label is "soft_lutpair3";
begin
  Q(5 downto 0) <= \^q\(5 downto 0);
\count_value_i[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(0),
      O => \count_value_i[0]_i_1_n_0\
    );
\count_value_i[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      O => \count_value_i[1]_i_1_n_0\
    );
\count_value_i[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => \^q\(2),
      O => \count_value_i[2]_i_1_n_0\
    );
\count_value_i[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => \^q\(2),
      I3 => \^q\(3),
      O => \count_value_i[3]_i_1_n_0\
    );
\count_value_i[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => \^q\(3),
      I4 => \^q\(4),
      O => \count_value_i[4]_i_1_n_0\
    );
\count_value_i[5]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(3),
      I1 => \count_value_i[5]_i_2__0_n_0\,
      I2 => \^q\(2),
      I3 => \^q\(4),
      I4 => \^q\(5),
      O => \count_value_i[5]_i_1__0_n_0\
    );
\count_value_i[5]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000800000000"
    )
        port map (
      I0 => \^q\(1),
      I1 => wr_en,
      I2 => \count_value_i_reg[5]_0\,
      I3 => \count_value_i_reg[0]_0\(0),
      I4 => rst_d1,
      I5 => \^q\(0),
      O => \count_value_i[5]_i_2__0_n_0\
    );
\count_value_i_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_i,
      D => \count_value_i[0]_i_1_n_0\,
      Q => \^q\(0),
      R => \count_value_i_reg[0]_0\(0)
    );
\count_value_i_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_i,
      D => \count_value_i[1]_i_1_n_0\,
      Q => \^q\(1),
      R => \count_value_i_reg[0]_0\(0)
    );
\count_value_i_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_i,
      D => \count_value_i[2]_i_1_n_0\,
      Q => \^q\(2),
      R => \count_value_i_reg[0]_0\(0)
    );
\count_value_i_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_i,
      D => \count_value_i[3]_i_1_n_0\,
      Q => \^q\(3),
      R => \count_value_i_reg[0]_0\(0)
    );
\count_value_i_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_i,
      D => \count_value_i[4]_i_1_n_0\,
      Q => \^q\(4),
      R => \count_value_i_reg[0]_0\(0)
    );
\count_value_i_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_i,
      D => \count_value_i[5]_i_1__0_n_0\,
      Q => \^q\(5),
      R => \count_value_i_reg[0]_0\(0)
    );
\gen_pntr_flags_cc.ram_empty_i_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00FFFFFF00008080"
    )
        port map (
      I0 => \gen_pntr_flags_cc.ram_empty_i_reg\,
      I1 => \gen_pntr_flags_cc.ram_empty_i_i_2_n_0\,
      I2 => \gen_pntr_flags_cc.ram_empty_i_i_3_n_0\,
      I3 => leaving_empty0,
      I4 => ram_wr_en_i,
      I5 => ram_empty_i,
      O => ram_empty_i0
    );
\gen_pntr_flags_cc.ram_empty_i_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^q\(0),
      I1 => \gen_pntr_flags_cc.ram_empty_i_reg_0\(0),
      I2 => \gen_pntr_flags_cc.ram_empty_i_reg_0\(2),
      I3 => \^q\(2),
      I4 => \gen_pntr_flags_cc.ram_empty_i_reg_0\(1),
      I5 => \^q\(1),
      O => \gen_pntr_flags_cc.ram_empty_i_i_2_n_0\
    );
\gen_pntr_flags_cc.ram_empty_i_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^q\(3),
      I1 => \gen_pntr_flags_cc.ram_empty_i_reg_0\(3),
      I2 => \gen_pntr_flags_cc.ram_empty_i_reg_0\(5),
      I3 => \^q\(5),
      I4 => \gen_pntr_flags_cc.ram_empty_i_reg_0\(4),
      I5 => \^q\(4),
      O => \gen_pntr_flags_cc.ram_empty_i_i_3_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \BufferFifoIP_512_xpm_counter_updn__parameterized3\ is
  port (
    Q : out STD_LOGIC_VECTOR ( 5 downto 0 );
    \count_value_i_reg[1]_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    rd_en : in STD_LOGIC;
    ram_empty_i : in STD_LOGIC;
    \count_value_i_reg[1]_1\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    wr_clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \BufferFifoIP_512_xpm_counter_updn__parameterized3\ : entity is "xpm_counter_updn";
end \BufferFifoIP_512_xpm_counter_updn__parameterized3\;

architecture STRUCTURE of \BufferFifoIP_512_xpm_counter_updn__parameterized3\ is
  signal \^q\ : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \count_value_i[0]_i_1__3_n_0\ : STD_LOGIC;
  signal \count_value_i[1]_i_1__3_n_0\ : STD_LOGIC;
  signal \count_value_i[2]_i_1__3_n_0\ : STD_LOGIC;
  signal \count_value_i[3]_i_1__3_n_0\ : STD_LOGIC;
  signal \count_value_i[4]_i_1__3_n_0\ : STD_LOGIC;
  signal \count_value_i[5]_i_1__3_n_0\ : STD_LOGIC;
  signal \count_value_i[5]_i_2__3_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count_value_i[3]_i_1__3\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \count_value_i[4]_i_1__3\ : label is "soft_lutpair2";
begin
  Q(5 downto 0) <= \^q\(5 downto 0);
\count_value_i[0]_i_1__3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"10EF"
    )
        port map (
      I0 => rd_en,
      I1 => \count_value_i_reg[1]_0\(0),
      I2 => \count_value_i_reg[1]_0\(1),
      I3 => \^q\(0),
      O => \count_value_i[0]_i_1__3_n_0\
    );
\count_value_i[1]_i_1__3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02FFFD00"
    )
        port map (
      I0 => \count_value_i_reg[1]_0\(1),
      I1 => \count_value_i_reg[1]_0\(0),
      I2 => rd_en,
      I3 => \^q\(0),
      I4 => \^q\(1),
      O => \count_value_i[1]_i_1__3_n_0\
    );
\count_value_i[2]_i_1__3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => \^q\(2),
      O => \count_value_i[2]_i_1__3_n_0\
    );
\count_value_i[3]_i_1__3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => \^q\(2),
      I3 => \^q\(3),
      O => \count_value_i[3]_i_1__3_n_0\
    );
\count_value_i[4]_i_1__3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => \^q\(3),
      I4 => \^q\(4),
      O => \count_value_i[4]_i_1__3_n_0\
    );
\count_value_i[5]_i_1__3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(3),
      I1 => \count_value_i[5]_i_2__3_n_0\,
      I2 => \^q\(2),
      I3 => \^q\(4),
      I4 => \^q\(5),
      O => \count_value_i[5]_i_1__3_n_0\
    );
\count_value_i[5]_i_2__3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000AAA200000000"
    )
        port map (
      I0 => \^q\(1),
      I1 => \count_value_i_reg[1]_0\(1),
      I2 => \count_value_i_reg[1]_0\(0),
      I3 => rd_en,
      I4 => ram_empty_i,
      I5 => \^q\(0),
      O => \count_value_i[5]_i_2__3_n_0\
    );
\count_value_i_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      D => \count_value_i[0]_i_1__3_n_0\,
      Q => \^q\(0),
      S => \count_value_i_reg[1]_1\(0)
    );
\count_value_i_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      D => \count_value_i[1]_i_1__3_n_0\,
      Q => \^q\(1),
      R => \count_value_i_reg[1]_1\(0)
    );
\count_value_i_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      D => \count_value_i[2]_i_1__3_n_0\,
      Q => \^q\(2),
      R => \count_value_i_reg[1]_1\(0)
    );
\count_value_i_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      D => \count_value_i[3]_i_1__3_n_0\,
      Q => \^q\(3),
      R => \count_value_i_reg[1]_1\(0)
    );
\count_value_i_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      D => \count_value_i[4]_i_1__3_n_0\,
      Q => \^q\(4),
      R => \count_value_i_reg[1]_1\(0)
    );
\count_value_i_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      D => \count_value_i[5]_i_1__3_n_0\,
      Q => \^q\(5),
      R => \count_value_i_reg[1]_1\(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \BufferFifoIP_512_xpm_counter_updn__parameterized3_1\ is
  port (
    Q : out STD_LOGIC_VECTOR ( 5 downto 0 );
    wr_en : in STD_LOGIC;
    \count_value_i_reg[5]_0\ : in STD_LOGIC;
    \count_value_i_reg[1]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    rst_d1 : in STD_LOGIC;
    ram_wr_en_i : in STD_LOGIC;
    wr_clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \BufferFifoIP_512_xpm_counter_updn__parameterized3_1\ : entity is "xpm_counter_updn";
end \BufferFifoIP_512_xpm_counter_updn__parameterized3_1\;

architecture STRUCTURE of \BufferFifoIP_512_xpm_counter_updn__parameterized3_1\ is
  signal \^q\ : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \count_value_i[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_value_i[1]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_value_i[2]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_value_i[3]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_value_i[4]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_value_i[5]_i_1__1_n_0\ : STD_LOGIC;
  signal \count_value_i[5]_i_2__1_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count_value_i[1]_i_1__0\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \count_value_i[2]_i_1__0\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \count_value_i[3]_i_1__0\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \count_value_i[4]_i_1__0\ : label is "soft_lutpair5";
begin
  Q(5 downto 0) <= \^q\(5 downto 0);
\count_value_i[0]_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(0),
      O => \count_value_i[0]_i_1__0_n_0\
    );
\count_value_i[1]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      O => \count_value_i[1]_i_1__0_n_0\
    );
\count_value_i[2]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => \^q\(2),
      O => \count_value_i[2]_i_1__0_n_0\
    );
\count_value_i[3]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => \^q\(2),
      I3 => \^q\(3),
      O => \count_value_i[3]_i_1__0_n_0\
    );
\count_value_i[4]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => \^q\(3),
      I4 => \^q\(4),
      O => \count_value_i[4]_i_1__0_n_0\
    );
\count_value_i[5]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(3),
      I1 => \count_value_i[5]_i_2__1_n_0\,
      I2 => \^q\(2),
      I3 => \^q\(4),
      I4 => \^q\(5),
      O => \count_value_i[5]_i_1__1_n_0\
    );
\count_value_i[5]_i_2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000800000000"
    )
        port map (
      I0 => \^q\(1),
      I1 => wr_en,
      I2 => \count_value_i_reg[5]_0\,
      I3 => \count_value_i_reg[1]_0\(0),
      I4 => rst_d1,
      I5 => \^q\(0),
      O => \count_value_i[5]_i_2__1_n_0\
    );
\count_value_i_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_i,
      D => \count_value_i[0]_i_1__0_n_0\,
      Q => \^q\(0),
      S => \count_value_i_reg[1]_0\(0)
    );
\count_value_i_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_i,
      D => \count_value_i[1]_i_1__0_n_0\,
      Q => \^q\(1),
      R => \count_value_i_reg[1]_0\(0)
    );
\count_value_i_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_i,
      D => \count_value_i[2]_i_1__0_n_0\,
      Q => \^q\(2),
      R => \count_value_i_reg[1]_0\(0)
    );
\count_value_i_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_i,
      D => \count_value_i[3]_i_1__0_n_0\,
      Q => \^q\(3),
      R => \count_value_i_reg[1]_0\(0)
    );
\count_value_i_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_i,
      D => \count_value_i[4]_i_1__0_n_0\,
      Q => \^q\(4),
      R => \count_value_i_reg[1]_0\(0)
    );
\count_value_i_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_i,
      D => \count_value_i[5]_i_1__1_n_0\,
      Q => \^q\(5),
      R => \count_value_i_reg[1]_0\(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity BufferFifoIP_512_xpm_fifo_reg_bit is
  port (
    rst_d1 : out STD_LOGIC;
    clr_full : out STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    wr_clk : in STD_LOGIC;
    rst : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of BufferFifoIP_512_xpm_fifo_reg_bit : entity is "xpm_fifo_reg_bit";
end BufferFifoIP_512_xpm_fifo_reg_bit;

architecture STRUCTURE of BufferFifoIP_512_xpm_fifo_reg_bit is
  signal \^rst_d1\ : STD_LOGIC;
begin
  rst_d1 <= \^rst_d1\;
d_out_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => Q(0),
      Q => \^rst_d1\,
      R => '0'
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => rst,
      I1 => \^rst_d1\,
      I2 => Q(0),
      O => clr_full
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity BufferFifoIP_512_xpm_fifo_rst is
  port (
    \syncstages_ff_reg[3]\ : out STD_LOGIC;
    ram_wr_en_i : out STD_LOGIC;
    \gen_rst_cc.fifo_wr_rst_cc_reg[2]_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    going_full1 : in STD_LOGIC;
    going_afull : in STD_LOGIC;
    rst : in STD_LOGIC;
    almost_full : in STD_LOGIC;
    ram_empty_i : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    wr_en : in STD_LOGIC;
    \count_value_i_reg[5]\ : in STD_LOGIC;
    rst_d1 : in STD_LOGIC;
    wr_clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of BufferFifoIP_512_xpm_fifo_rst : entity is "xpm_fifo_rst";
end BufferFifoIP_512_xpm_fifo_rst;

architecture STRUCTURE of BufferFifoIP_512_xpm_fifo_rst is
  signal \gen_pntr_flags_cc.gaf_cc.ram_afull_i_i_2_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.gaf_cc.ram_afull_i_i_4_n_0\ : STD_LOGIC;
  signal \gen_rst_cc.fifo_wr_rst_cc\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^gen_rst_cc.fifo_wr_rst_cc_reg[2]_0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal p_0_in : STD_LOGIC;
  signal \power_on_rst_reg_n_0_[0]\ : STD_LOGIC;
  signal \^ram_wr_en_i\ : STD_LOGIC;
  signal rst_i : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \gen_pntr_flags_cc.gaf_cc.ram_afull_i_i_4\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \gen_sdpram.xpm_memory_base_inst_i_1\ : label is "soft_lutpair9";
begin
  \gen_rst_cc.fifo_wr_rst_cc_reg[2]_0\(0) <= \^gen_rst_cc.fifo_wr_rst_cc_reg[2]_0\(0);
  ram_wr_en_i <= \^ram_wr_en_i\;
\gen_pntr_flags_cc.gaf_cc.ram_afull_i_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00FF00F7000000F0"
    )
        port map (
      I0 => \gen_pntr_flags_cc.gaf_cc.ram_afull_i_i_2_n_0\,
      I1 => going_full1,
      I2 => going_afull,
      I3 => \gen_pntr_flags_cc.gaf_cc.ram_afull_i_i_4_n_0\,
      I4 => rst,
      I5 => almost_full,
      O => \syncstages_ff_reg[3]\
    );
\gen_pntr_flags_cc.gaf_cc.ram_afull_i_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00005455"
    )
        port map (
      I0 => ram_empty_i,
      I1 => rd_en,
      I2 => Q(0),
      I3 => Q(1),
      I4 => \^ram_wr_en_i\,
      O => \gen_pntr_flags_cc.gaf_cc.ram_afull_i_i_2_n_0\
    );
\gen_pntr_flags_cc.gaf_cc.ram_afull_i_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => \^gen_rst_cc.fifo_wr_rst_cc_reg[2]_0\(0),
      I1 => rst_d1,
      I2 => rst,
      O => \gen_pntr_flags_cc.gaf_cc.ram_afull_i_i_4_n_0\
    );
\gen_rst_cc.fifo_wr_rst_cc[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => p_0_in,
      I1 => rst,
      O => rst_i
    );
\gen_rst_cc.fifo_wr_rst_cc_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => '0',
      Q => \gen_rst_cc.fifo_wr_rst_cc\(0),
      S => rst_i
    );
\gen_rst_cc.fifo_wr_rst_cc_reg[1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => \gen_rst_cc.fifo_wr_rst_cc\(0),
      Q => \gen_rst_cc.fifo_wr_rst_cc\(1),
      S => rst_i
    );
\gen_rst_cc.fifo_wr_rst_cc_reg[2]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => \gen_rst_cc.fifo_wr_rst_cc\(1),
      Q => \^gen_rst_cc.fifo_wr_rst_cc_reg[2]_0\(0),
      S => rst_i
    );
\gen_sdpram.xpm_memory_base_inst_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => wr_en,
      I1 => \count_value_i_reg[5]\,
      I2 => \^gen_rst_cc.fifo_wr_rst_cc_reg[2]_0\(0),
      I3 => rst_d1,
      O => \^ram_wr_en_i\
    );
\power_on_rst_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => '0',
      Q => \power_on_rst_reg_n_0_[0]\,
      R => '0'
    );
\power_on_rst_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => \power_on_rst_reg_n_0_[0]\,
      Q => p_0_in,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity BufferFifoIP_512_xpm_memory_base is
  port (
    sleep : in STD_LOGIC;
    clka : in STD_LOGIC;
    rsta : in STD_LOGIC;
    ena : in STD_LOGIC;
    regcea : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 5 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 643 downto 0 );
    injectsbiterra : in STD_LOGIC;
    injectdbiterra : in STD_LOGIC;
    douta : out STD_LOGIC_VECTOR ( 643 downto 0 );
    sbiterra : out STD_LOGIC;
    dbiterra : out STD_LOGIC;
    clkb : in STD_LOGIC;
    rstb : in STD_LOGIC;
    enb : in STD_LOGIC;
    regceb : in STD_LOGIC;
    web : in STD_LOGIC_VECTOR ( 0 to 0 );
    addrb : in STD_LOGIC_VECTOR ( 5 downto 0 );
    dinb : in STD_LOGIC_VECTOR ( 643 downto 0 );
    injectsbiterrb : in STD_LOGIC;
    injectdbiterrb : in STD_LOGIC;
    doutb : out STD_LOGIC_VECTOR ( 643 downto 0 );
    sbiterrb : out STD_LOGIC;
    dbiterrb : out STD_LOGIC
  );
  attribute ADDR_WIDTH_A : integer;
  attribute ADDR_WIDTH_A of BufferFifoIP_512_xpm_memory_base : entity is 6;
  attribute ADDR_WIDTH_B : integer;
  attribute ADDR_WIDTH_B of BufferFifoIP_512_xpm_memory_base : entity is 6;
  attribute AUTO_SLEEP_TIME : integer;
  attribute AUTO_SLEEP_TIME of BufferFifoIP_512_xpm_memory_base : entity is 0;
  attribute BYTE_WRITE_WIDTH_A : integer;
  attribute BYTE_WRITE_WIDTH_A of BufferFifoIP_512_xpm_memory_base : entity is 644;
  attribute BYTE_WRITE_WIDTH_B : integer;
  attribute BYTE_WRITE_WIDTH_B of BufferFifoIP_512_xpm_memory_base : entity is 644;
  attribute CASCADE_HEIGHT : integer;
  attribute CASCADE_HEIGHT of BufferFifoIP_512_xpm_memory_base : entity is 0;
  attribute CLOCKING_MODE : integer;
  attribute CLOCKING_MODE of BufferFifoIP_512_xpm_memory_base : entity is 0;
  attribute ECC_MODE : integer;
  attribute ECC_MODE of BufferFifoIP_512_xpm_memory_base : entity is 0;
  attribute MAX_NUM_CHAR : integer;
  attribute MAX_NUM_CHAR of BufferFifoIP_512_xpm_memory_base : entity is 0;
  attribute MEMORY_INIT_FILE : string;
  attribute MEMORY_INIT_FILE of BufferFifoIP_512_xpm_memory_base : entity is "none";
  attribute MEMORY_INIT_PARAM : string;
  attribute MEMORY_INIT_PARAM of BufferFifoIP_512_xpm_memory_base : entity is "";
  attribute MEMORY_OPTIMIZATION : string;
  attribute MEMORY_OPTIMIZATION of BufferFifoIP_512_xpm_memory_base : entity is "true";
  attribute MEMORY_PRIMITIVE : integer;
  attribute MEMORY_PRIMITIVE of BufferFifoIP_512_xpm_memory_base : entity is 3;
  attribute MEMORY_SIZE : integer;
  attribute MEMORY_SIZE of BufferFifoIP_512_xpm_memory_base : entity is 41216;
  attribute MEMORY_TYPE : integer;
  attribute MEMORY_TYPE of BufferFifoIP_512_xpm_memory_base : entity is 1;
  attribute MESSAGE_CONTROL : integer;
  attribute MESSAGE_CONTROL of BufferFifoIP_512_xpm_memory_base : entity is 0;
  attribute NUM_CHAR_LOC : integer;
  attribute NUM_CHAR_LOC of BufferFifoIP_512_xpm_memory_base : entity is 0;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of BufferFifoIP_512_xpm_memory_base : entity is "xpm_memory_base";
  attribute P_ECC_MODE : string;
  attribute P_ECC_MODE of BufferFifoIP_512_xpm_memory_base : entity is "no_ecc";
  attribute P_ENABLE_BYTE_WRITE_A : integer;
  attribute P_ENABLE_BYTE_WRITE_A of BufferFifoIP_512_xpm_memory_base : entity is 0;
  attribute P_ENABLE_BYTE_WRITE_B : integer;
  attribute P_ENABLE_BYTE_WRITE_B of BufferFifoIP_512_xpm_memory_base : entity is 0;
  attribute P_MAX_DEPTH_DATA : integer;
  attribute P_MAX_DEPTH_DATA of BufferFifoIP_512_xpm_memory_base : entity is 64;
  attribute P_MEMORY_OPT : string;
  attribute P_MEMORY_OPT of BufferFifoIP_512_xpm_memory_base : entity is "yes";
  attribute P_MEMORY_PRIMITIVE : string;
  attribute P_MEMORY_PRIMITIVE of BufferFifoIP_512_xpm_memory_base : entity is "ultra";
  attribute P_MIN_WIDTH_DATA : integer;
  attribute P_MIN_WIDTH_DATA of BufferFifoIP_512_xpm_memory_base : entity is 644;
  attribute P_MIN_WIDTH_DATA_A : integer;
  attribute P_MIN_WIDTH_DATA_A of BufferFifoIP_512_xpm_memory_base : entity is 644;
  attribute P_MIN_WIDTH_DATA_B : integer;
  attribute P_MIN_WIDTH_DATA_B of BufferFifoIP_512_xpm_memory_base : entity is 644;
  attribute P_MIN_WIDTH_DATA_ECC : integer;
  attribute P_MIN_WIDTH_DATA_ECC of BufferFifoIP_512_xpm_memory_base : entity is 644;
  attribute P_MIN_WIDTH_DATA_LDW : integer;
  attribute P_MIN_WIDTH_DATA_LDW of BufferFifoIP_512_xpm_memory_base : entity is 4;
  attribute P_MIN_WIDTH_DATA_SHFT : integer;
  attribute P_MIN_WIDTH_DATA_SHFT of BufferFifoIP_512_xpm_memory_base : entity is 644;
  attribute P_NUM_COLS_WRITE_A : integer;
  attribute P_NUM_COLS_WRITE_A of BufferFifoIP_512_xpm_memory_base : entity is 1;
  attribute P_NUM_COLS_WRITE_B : integer;
  attribute P_NUM_COLS_WRITE_B of BufferFifoIP_512_xpm_memory_base : entity is 1;
  attribute P_NUM_ROWS_READ_A : integer;
  attribute P_NUM_ROWS_READ_A of BufferFifoIP_512_xpm_memory_base : entity is 1;
  attribute P_NUM_ROWS_READ_B : integer;
  attribute P_NUM_ROWS_READ_B of BufferFifoIP_512_xpm_memory_base : entity is 1;
  attribute P_NUM_ROWS_WRITE_A : integer;
  attribute P_NUM_ROWS_WRITE_A of BufferFifoIP_512_xpm_memory_base : entity is 1;
  attribute P_NUM_ROWS_WRITE_B : integer;
  attribute P_NUM_ROWS_WRITE_B of BufferFifoIP_512_xpm_memory_base : entity is 1;
  attribute P_SDP_WRITE_MODE : string;
  attribute P_SDP_WRITE_MODE of BufferFifoIP_512_xpm_memory_base : entity is "yes";
  attribute P_WIDTH_ADDR_LSB_READ_A : integer;
  attribute P_WIDTH_ADDR_LSB_READ_A of BufferFifoIP_512_xpm_memory_base : entity is 0;
  attribute P_WIDTH_ADDR_LSB_READ_B : integer;
  attribute P_WIDTH_ADDR_LSB_READ_B of BufferFifoIP_512_xpm_memory_base : entity is 0;
  attribute P_WIDTH_ADDR_LSB_WRITE_A : integer;
  attribute P_WIDTH_ADDR_LSB_WRITE_A of BufferFifoIP_512_xpm_memory_base : entity is 0;
  attribute P_WIDTH_ADDR_LSB_WRITE_B : integer;
  attribute P_WIDTH_ADDR_LSB_WRITE_B of BufferFifoIP_512_xpm_memory_base : entity is 0;
  attribute P_WIDTH_ADDR_READ_A : integer;
  attribute P_WIDTH_ADDR_READ_A of BufferFifoIP_512_xpm_memory_base : entity is 6;
  attribute P_WIDTH_ADDR_READ_B : integer;
  attribute P_WIDTH_ADDR_READ_B of BufferFifoIP_512_xpm_memory_base : entity is 6;
  attribute P_WIDTH_ADDR_WRITE_A : integer;
  attribute P_WIDTH_ADDR_WRITE_A of BufferFifoIP_512_xpm_memory_base : entity is 6;
  attribute P_WIDTH_ADDR_WRITE_B : integer;
  attribute P_WIDTH_ADDR_WRITE_B of BufferFifoIP_512_xpm_memory_base : entity is 6;
  attribute P_WIDTH_COL_WRITE_A : integer;
  attribute P_WIDTH_COL_WRITE_A of BufferFifoIP_512_xpm_memory_base : entity is 644;
  attribute P_WIDTH_COL_WRITE_B : integer;
  attribute P_WIDTH_COL_WRITE_B of BufferFifoIP_512_xpm_memory_base : entity is 644;
  attribute READ_DATA_WIDTH_A : integer;
  attribute READ_DATA_WIDTH_A of BufferFifoIP_512_xpm_memory_base : entity is 644;
  attribute READ_DATA_WIDTH_B : integer;
  attribute READ_DATA_WIDTH_B of BufferFifoIP_512_xpm_memory_base : entity is 644;
  attribute READ_LATENCY_A : integer;
  attribute READ_LATENCY_A of BufferFifoIP_512_xpm_memory_base : entity is 2;
  attribute READ_LATENCY_B : integer;
  attribute READ_LATENCY_B of BufferFifoIP_512_xpm_memory_base : entity is 2;
  attribute READ_RESET_VALUE_A : string;
  attribute READ_RESET_VALUE_A of BufferFifoIP_512_xpm_memory_base : entity is "0";
  attribute READ_RESET_VALUE_B : string;
  attribute READ_RESET_VALUE_B of BufferFifoIP_512_xpm_memory_base : entity is "";
  attribute RST_MODE_A : string;
  attribute RST_MODE_A of BufferFifoIP_512_xpm_memory_base : entity is "SYNC";
  attribute RST_MODE_B : string;
  attribute RST_MODE_B of BufferFifoIP_512_xpm_memory_base : entity is "SYNC";
  attribute SIM_ASSERT_CHK : integer;
  attribute SIM_ASSERT_CHK of BufferFifoIP_512_xpm_memory_base : entity is 0;
  attribute USE_EMBEDDED_CONSTRAINT : integer;
  attribute USE_EMBEDDED_CONSTRAINT of BufferFifoIP_512_xpm_memory_base : entity is 0;
  attribute USE_MEM_INIT : integer;
  attribute USE_MEM_INIT of BufferFifoIP_512_xpm_memory_base : entity is 0;
  attribute USE_MEM_INIT_MMI : integer;
  attribute USE_MEM_INIT_MMI of BufferFifoIP_512_xpm_memory_base : entity is 0;
  attribute VERSION : integer;
  attribute VERSION of BufferFifoIP_512_xpm_memory_base : entity is 0;
  attribute WAKEUP_TIME : integer;
  attribute WAKEUP_TIME of BufferFifoIP_512_xpm_memory_base : entity is 0;
  attribute WRITE_DATA_WIDTH_A : integer;
  attribute WRITE_DATA_WIDTH_A of BufferFifoIP_512_xpm_memory_base : entity is 644;
  attribute WRITE_DATA_WIDTH_B : integer;
  attribute WRITE_DATA_WIDTH_B of BufferFifoIP_512_xpm_memory_base : entity is 644;
  attribute WRITE_MODE_A : integer;
  attribute WRITE_MODE_A of BufferFifoIP_512_xpm_memory_base : entity is 2;
  attribute WRITE_MODE_B : integer;
  attribute WRITE_MODE_B of BufferFifoIP_512_xpm_memory_base : entity is 1;
  attribute WRITE_PROTECT : integer;
  attribute WRITE_PROTECT of BufferFifoIP_512_xpm_memory_base : entity is 1;
  attribute XPM_MODULE : string;
  attribute XPM_MODULE of BufferFifoIP_512_xpm_memory_base : entity is "TRUE";
  attribute keep_hierarchy : string;
  attribute keep_hierarchy of BufferFifoIP_512_xpm_memory_base : entity is "soft";
  attribute rsta_loop_iter : integer;
  attribute rsta_loop_iter of BufferFifoIP_512_xpm_memory_base : entity is 644;
  attribute rstb_loop_iter : integer;
  attribute rstb_loop_iter of BufferFifoIP_512_xpm_memory_base : entity is 644;
end BufferFifoIP_512_xpm_memory_base;

architecture STRUCTURE of BufferFifoIP_512_xpm_memory_base is
  signal \<const0>\ : STD_LOGIC;
  signal \^doutb\ : STD_LOGIC_VECTOR ( 643 downto 0 );
  signal \gen_rd_b.doutb_reg\ : STD_LOGIC_VECTOR ( 643 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_IN_RDACCESS_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_IN_RDACCESS_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_IN_RDB_WR_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_IN_RDB_WR_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_DBITERR_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_DBITERR_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_EN_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_EN_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_RDACCESS_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_RDACCESS_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_RDB_WR_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_RDB_WR_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_SBITERR_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_SBITERR_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_DBITERR_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_DBITERR_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_RDACCESS_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_RDACCESS_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_SBITERR_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_SBITERR_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_IN_ADDR_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 22 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_IN_ADDR_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 22 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_IN_BWE_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_IN_BWE_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_IN_DIN_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_IN_DIN_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_IN_DOUT_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_IN_DOUT_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_ADDR_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 22 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_ADDR_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 22 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_BWE_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_BWE_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_DIN_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_DIN_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_DOUT_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_DOUT_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_DOUT_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_IN_RDACCESS_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_IN_RDACCESS_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_IN_RDB_WR_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_IN_RDB_WR_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_DBITERR_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_DBITERR_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_EN_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_EN_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_RDACCESS_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_RDACCESS_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_RDB_WR_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_RDB_WR_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_SBITERR_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_SBITERR_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_DBITERR_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_DBITERR_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_RDACCESS_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_RDACCESS_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_SBITERR_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_SBITERR_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_IN_ADDR_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 22 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_IN_ADDR_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 22 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_IN_BWE_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_IN_BWE_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_IN_DIN_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_IN_DIN_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_IN_DOUT_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_IN_DOUT_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_ADDR_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 22 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_ADDR_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 22 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_BWE_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_BWE_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_DIN_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_DIN_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_DOUT_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_DOUT_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_DOUT_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_IN_RDACCESS_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_IN_RDACCESS_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_IN_RDB_WR_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_IN_RDB_WR_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_OUT_DBITERR_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_OUT_DBITERR_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_OUT_EN_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_OUT_EN_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_OUT_RDACCESS_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_OUT_RDACCESS_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_OUT_RDB_WR_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_OUT_RDB_WR_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_OUT_SBITERR_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_OUT_SBITERR_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_DBITERR_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_DBITERR_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_RDACCESS_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_RDACCESS_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_SBITERR_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_SBITERR_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_IN_ADDR_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 22 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_IN_ADDR_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 22 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_IN_BWE_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_IN_BWE_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_IN_DIN_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_IN_DIN_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_IN_DOUT_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_IN_DOUT_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_OUT_ADDR_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 22 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_OUT_ADDR_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 22 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_OUT_BWE_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_OUT_BWE_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_OUT_DIN_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_OUT_DIN_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_OUT_DOUT_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_OUT_DOUT_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_DOUT_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_IN_RDACCESS_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_IN_RDACCESS_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_IN_RDB_WR_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_IN_RDB_WR_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_DBITERR_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_DBITERR_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_EN_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_EN_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_RDACCESS_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_RDACCESS_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_RDB_WR_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_RDB_WR_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_SBITERR_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_SBITERR_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_DBITERR_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_DBITERR_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_RDACCESS_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_RDACCESS_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_SBITERR_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_SBITERR_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_IN_ADDR_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 22 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_IN_ADDR_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 22 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_IN_BWE_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_IN_BWE_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_IN_DIN_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_IN_DIN_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_IN_DOUT_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_IN_DOUT_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_ADDR_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 22 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_ADDR_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 22 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_BWE_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_BWE_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_DIN_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_DIN_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_DOUT_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_DOUT_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_DOUT_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_IN_RDACCESS_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_IN_RDACCESS_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_IN_RDB_WR_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_IN_RDB_WR_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_OUT_DBITERR_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_OUT_DBITERR_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_OUT_EN_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_OUT_EN_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_OUT_RDACCESS_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_OUT_RDACCESS_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_OUT_RDB_WR_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_OUT_RDB_WR_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_OUT_SBITERR_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_OUT_SBITERR_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_DBITERR_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_DBITERR_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_RDACCESS_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_RDACCESS_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_SBITERR_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_SBITERR_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_IN_ADDR_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 22 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_IN_ADDR_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 22 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_IN_BWE_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_IN_BWE_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_IN_DIN_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_IN_DIN_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_IN_DOUT_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_IN_DOUT_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_OUT_ADDR_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 22 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_OUT_ADDR_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 22 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_OUT_BWE_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_OUT_BWE_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_OUT_DIN_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_OUT_DIN_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_OUT_DOUT_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_OUT_DOUT_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_DOUT_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_IN_RDACCESS_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_IN_RDACCESS_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_IN_RDB_WR_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_IN_RDB_WR_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_OUT_DBITERR_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_OUT_DBITERR_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_OUT_EN_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_OUT_EN_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_OUT_RDACCESS_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_OUT_RDACCESS_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_OUT_RDB_WR_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_OUT_RDB_WR_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_OUT_SBITERR_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_OUT_SBITERR_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_DBITERR_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_DBITERR_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_RDACCESS_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_RDACCESS_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_SBITERR_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_SBITERR_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_IN_ADDR_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 22 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_IN_ADDR_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 22 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_IN_BWE_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_IN_BWE_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_IN_DIN_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_IN_DIN_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_IN_DOUT_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_IN_DOUT_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_OUT_ADDR_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 22 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_OUT_ADDR_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 22 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_OUT_BWE_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_OUT_BWE_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_OUT_DIN_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_OUT_DIN_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_OUT_DOUT_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_OUT_DOUT_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_DOUT_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_IN_RDACCESS_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_IN_RDACCESS_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_IN_RDB_WR_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_IN_RDB_WR_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_OUT_DBITERR_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_OUT_DBITERR_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_OUT_EN_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_OUT_EN_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_OUT_RDACCESS_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_OUT_RDACCESS_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_OUT_RDB_WR_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_OUT_RDB_WR_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_OUT_SBITERR_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_OUT_SBITERR_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_DBITERR_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_DBITERR_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_RDACCESS_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_RDACCESS_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_SBITERR_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_SBITERR_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_IN_ADDR_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 22 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_IN_ADDR_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 22 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_IN_BWE_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_IN_BWE_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_IN_DIN_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_IN_DIN_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_IN_DOUT_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_IN_DOUT_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_OUT_ADDR_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 22 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_OUT_ADDR_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 22 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_OUT_BWE_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_OUT_BWE_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_OUT_DIN_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_OUT_DIN_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_OUT_DOUT_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_OUT_DOUT_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_DOUT_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_IN_RDACCESS_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_IN_RDACCESS_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_IN_RDB_WR_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_IN_RDB_WR_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_OUT_DBITERR_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_OUT_DBITERR_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_OUT_EN_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_OUT_EN_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_OUT_RDACCESS_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_OUT_RDACCESS_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_OUT_RDB_WR_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_OUT_RDB_WR_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_OUT_SBITERR_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_OUT_SBITERR_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_DBITERR_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_DBITERR_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_RDACCESS_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_RDACCESS_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_SBITERR_A_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_SBITERR_B_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_IN_ADDR_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 22 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_IN_ADDR_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 22 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_IN_BWE_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_IN_BWE_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_IN_DIN_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_IN_DIN_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_IN_DOUT_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_IN_DOUT_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_OUT_ADDR_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 22 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_OUT_ADDR_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 22 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_OUT_BWE_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_OUT_BWE_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_OUT_DIN_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_OUT_DIN_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_OUT_DOUT_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_OUT_DOUT_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_DOUT_A_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 9 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_DOUT_B_UNCONNECTED\ : STD_LOGIC_VECTOR ( 71 downto 0 );
  attribute \MEM.PORTA.ADDRESS_BEGIN\ : integer;
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_0\ : label is 0;
  attribute \MEM.PORTA.ADDRESS_END\ : integer;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_0\ : label is 63;
  attribute \MEM.PORTA.DATA_LSB\ : integer;
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_0\ : label is 0;
  attribute \MEM.PORTA.DATA_MSB\ : integer;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_0\ : label is 71;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ : integer;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_0\ : label is 0;
  attribute \MEM.PORTB.ADDRESS_END\ : integer;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_0\ : label is 63;
  attribute \MEM.PORTB.DATA_LSB\ : integer;
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_0\ : label is 0;
  attribute \MEM.PORTB.DATA_MSB\ : integer;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_0\ : label is 71;
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_a.gen_word_narrow.mem_reg_uram_0\ : label is "{SYNTH-6 {cell *THIS*}}";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of \gen_wr_a.gen_word_narrow.mem_reg_uram_0\ : label is 41216;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of \gen_wr_a.gen_word_narrow.mem_reg_uram_0\ : label is "gen_wr_a.gen_word_narrow.mem";
  attribute RTL_RAM_TYPE : string;
  attribute RTL_RAM_TYPE of \gen_wr_a.gen_word_narrow.mem_reg_uram_0\ : label is "RAM_SDP";
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of \gen_wr_a.gen_word_narrow.mem_reg_uram_0\ : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of \gen_wr_a.gen_word_narrow.mem_reg_uram_0\ : label is 63;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of \gen_wr_a.gen_word_narrow.mem_reg_uram_0\ : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of \gen_wr_a.gen_word_narrow.mem_reg_uram_0\ : label is 71;
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_1\ : label is 0;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_1\ : label is 63;
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_1\ : label is 72;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_1\ : label is 143;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_1\ : label is 0;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_1\ : label is 63;
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_1\ : label is 72;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_1\ : label is 143;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_a.gen_word_narrow.mem_reg_uram_1\ : label is "{SYNTH-6 {cell *THIS*}}";
  attribute RTL_RAM_BITS of \gen_wr_a.gen_word_narrow.mem_reg_uram_1\ : label is 41216;
  attribute RTL_RAM_NAME of \gen_wr_a.gen_word_narrow.mem_reg_uram_1\ : label is "gen_wr_a.gen_word_narrow.mem";
  attribute RTL_RAM_TYPE of \gen_wr_a.gen_word_narrow.mem_reg_uram_1\ : label is "RAM_SDP";
  attribute ram_addr_begin of \gen_wr_a.gen_word_narrow.mem_reg_uram_1\ : label is 0;
  attribute ram_addr_end of \gen_wr_a.gen_word_narrow.mem_reg_uram_1\ : label is 63;
  attribute ram_slice_begin of \gen_wr_a.gen_word_narrow.mem_reg_uram_1\ : label is 72;
  attribute ram_slice_end of \gen_wr_a.gen_word_narrow.mem_reg_uram_1\ : label is 143;
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_2\ : label is 0;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_2\ : label is 63;
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_2\ : label is 144;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_2\ : label is 215;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_2\ : label is 0;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_2\ : label is 63;
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_2\ : label is 144;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_2\ : label is 215;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_a.gen_word_narrow.mem_reg_uram_2\ : label is "{SYNTH-6 {cell *THIS*}}";
  attribute RTL_RAM_BITS of \gen_wr_a.gen_word_narrow.mem_reg_uram_2\ : label is 41216;
  attribute RTL_RAM_NAME of \gen_wr_a.gen_word_narrow.mem_reg_uram_2\ : label is "gen_wr_a.gen_word_narrow.mem";
  attribute RTL_RAM_TYPE of \gen_wr_a.gen_word_narrow.mem_reg_uram_2\ : label is "RAM_SDP";
  attribute ram_addr_begin of \gen_wr_a.gen_word_narrow.mem_reg_uram_2\ : label is 0;
  attribute ram_addr_end of \gen_wr_a.gen_word_narrow.mem_reg_uram_2\ : label is 63;
  attribute ram_slice_begin of \gen_wr_a.gen_word_narrow.mem_reg_uram_2\ : label is 144;
  attribute ram_slice_end of \gen_wr_a.gen_word_narrow.mem_reg_uram_2\ : label is 215;
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_3\ : label is 0;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_3\ : label is 63;
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_3\ : label is 216;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_3\ : label is 287;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_3\ : label is 0;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_3\ : label is 63;
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_3\ : label is 216;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_3\ : label is 287;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_a.gen_word_narrow.mem_reg_uram_3\ : label is "{SYNTH-6 {cell *THIS*}}";
  attribute RTL_RAM_BITS of \gen_wr_a.gen_word_narrow.mem_reg_uram_3\ : label is 41216;
  attribute RTL_RAM_NAME of \gen_wr_a.gen_word_narrow.mem_reg_uram_3\ : label is "gen_wr_a.gen_word_narrow.mem";
  attribute RTL_RAM_TYPE of \gen_wr_a.gen_word_narrow.mem_reg_uram_3\ : label is "RAM_SDP";
  attribute ram_addr_begin of \gen_wr_a.gen_word_narrow.mem_reg_uram_3\ : label is 0;
  attribute ram_addr_end of \gen_wr_a.gen_word_narrow.mem_reg_uram_3\ : label is 63;
  attribute ram_slice_begin of \gen_wr_a.gen_word_narrow.mem_reg_uram_3\ : label is 216;
  attribute ram_slice_end of \gen_wr_a.gen_word_narrow.mem_reg_uram_3\ : label is 287;
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_4\ : label is 0;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_4\ : label is 63;
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_4\ : label is 288;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_4\ : label is 359;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_4\ : label is 0;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_4\ : label is 63;
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_4\ : label is 288;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_4\ : label is 359;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_a.gen_word_narrow.mem_reg_uram_4\ : label is "{SYNTH-6 {cell *THIS*}}";
  attribute RTL_RAM_BITS of \gen_wr_a.gen_word_narrow.mem_reg_uram_4\ : label is 41216;
  attribute RTL_RAM_NAME of \gen_wr_a.gen_word_narrow.mem_reg_uram_4\ : label is "gen_wr_a.gen_word_narrow.mem";
  attribute RTL_RAM_TYPE of \gen_wr_a.gen_word_narrow.mem_reg_uram_4\ : label is "RAM_SDP";
  attribute ram_addr_begin of \gen_wr_a.gen_word_narrow.mem_reg_uram_4\ : label is 0;
  attribute ram_addr_end of \gen_wr_a.gen_word_narrow.mem_reg_uram_4\ : label is 63;
  attribute ram_slice_begin of \gen_wr_a.gen_word_narrow.mem_reg_uram_4\ : label is 288;
  attribute ram_slice_end of \gen_wr_a.gen_word_narrow.mem_reg_uram_4\ : label is 359;
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_5\ : label is 0;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_5\ : label is 63;
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_5\ : label is 360;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_5\ : label is 431;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_5\ : label is 0;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_5\ : label is 63;
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_5\ : label is 360;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_5\ : label is 431;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_a.gen_word_narrow.mem_reg_uram_5\ : label is "{SYNTH-6 {cell *THIS*}}";
  attribute RTL_RAM_BITS of \gen_wr_a.gen_word_narrow.mem_reg_uram_5\ : label is 41216;
  attribute RTL_RAM_NAME of \gen_wr_a.gen_word_narrow.mem_reg_uram_5\ : label is "gen_wr_a.gen_word_narrow.mem";
  attribute RTL_RAM_TYPE of \gen_wr_a.gen_word_narrow.mem_reg_uram_5\ : label is "RAM_SDP";
  attribute ram_addr_begin of \gen_wr_a.gen_word_narrow.mem_reg_uram_5\ : label is 0;
  attribute ram_addr_end of \gen_wr_a.gen_word_narrow.mem_reg_uram_5\ : label is 63;
  attribute ram_slice_begin of \gen_wr_a.gen_word_narrow.mem_reg_uram_5\ : label is 360;
  attribute ram_slice_end of \gen_wr_a.gen_word_narrow.mem_reg_uram_5\ : label is 431;
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_6\ : label is 0;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_6\ : label is 63;
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_6\ : label is 432;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_6\ : label is 503;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_6\ : label is 0;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_6\ : label is 63;
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_6\ : label is 432;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_6\ : label is 503;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_a.gen_word_narrow.mem_reg_uram_6\ : label is "{SYNTH-6 {cell *THIS*}}";
  attribute RTL_RAM_BITS of \gen_wr_a.gen_word_narrow.mem_reg_uram_6\ : label is 41216;
  attribute RTL_RAM_NAME of \gen_wr_a.gen_word_narrow.mem_reg_uram_6\ : label is "gen_wr_a.gen_word_narrow.mem";
  attribute RTL_RAM_TYPE of \gen_wr_a.gen_word_narrow.mem_reg_uram_6\ : label is "RAM_SDP";
  attribute ram_addr_begin of \gen_wr_a.gen_word_narrow.mem_reg_uram_6\ : label is 0;
  attribute ram_addr_end of \gen_wr_a.gen_word_narrow.mem_reg_uram_6\ : label is 63;
  attribute ram_slice_begin of \gen_wr_a.gen_word_narrow.mem_reg_uram_6\ : label is 432;
  attribute ram_slice_end of \gen_wr_a.gen_word_narrow.mem_reg_uram_6\ : label is 503;
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_7\ : label is 0;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_7\ : label is 63;
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_7\ : label is 504;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_7\ : label is 512;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_7\ : label is 0;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_7\ : label is 63;
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_7\ : label is 504;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_uram_7\ : label is 512;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_a.gen_word_narrow.mem_reg_uram_7\ : label is "{SYNTH-6 {cell *THIS*}}";
  attribute RTL_RAM_BITS of \gen_wr_a.gen_word_narrow.mem_reg_uram_7\ : label is 41216;
  attribute RTL_RAM_NAME of \gen_wr_a.gen_word_narrow.mem_reg_uram_7\ : label is "gen_wr_a.gen_word_narrow.mem";
  attribute RTL_RAM_TYPE of \gen_wr_a.gen_word_narrow.mem_reg_uram_7\ : label is "RAM_SDP";
  attribute ram_addr_begin of \gen_wr_a.gen_word_narrow.mem_reg_uram_7\ : label is 0;
  attribute ram_addr_end of \gen_wr_a.gen_word_narrow.mem_reg_uram_7\ : label is 63;
  attribute ram_slice_begin of \gen_wr_a.gen_word_narrow.mem_reg_uram_7\ : label is 504;
  attribute ram_slice_end of \gen_wr_a.gen_word_narrow.mem_reg_uram_7\ : label is 512;
begin
  dbiterra <= \<const0>\;
  dbiterrb <= \<const0>\;
  douta(643) <= \<const0>\;
  douta(642) <= \<const0>\;
  douta(641) <= \<const0>\;
  douta(640) <= \<const0>\;
  douta(639) <= \<const0>\;
  douta(638) <= \<const0>\;
  douta(637) <= \<const0>\;
  douta(636) <= \<const0>\;
  douta(635) <= \<const0>\;
  douta(634) <= \<const0>\;
  douta(633) <= \<const0>\;
  douta(632) <= \<const0>\;
  douta(631) <= \<const0>\;
  douta(630) <= \<const0>\;
  douta(629) <= \<const0>\;
  douta(628) <= \<const0>\;
  douta(627) <= \<const0>\;
  douta(626) <= \<const0>\;
  douta(625) <= \<const0>\;
  douta(624) <= \<const0>\;
  douta(623) <= \<const0>\;
  douta(622) <= \<const0>\;
  douta(621) <= \<const0>\;
  douta(620) <= \<const0>\;
  douta(619) <= \<const0>\;
  douta(618) <= \<const0>\;
  douta(617) <= \<const0>\;
  douta(616) <= \<const0>\;
  douta(615) <= \<const0>\;
  douta(614) <= \<const0>\;
  douta(613) <= \<const0>\;
  douta(612) <= \<const0>\;
  douta(611) <= \<const0>\;
  douta(610) <= \<const0>\;
  douta(609) <= \<const0>\;
  douta(608) <= \<const0>\;
  douta(607) <= \<const0>\;
  douta(606) <= \<const0>\;
  douta(605) <= \<const0>\;
  douta(604) <= \<const0>\;
  douta(603) <= \<const0>\;
  douta(602) <= \<const0>\;
  douta(601) <= \<const0>\;
  douta(600) <= \<const0>\;
  douta(599) <= \<const0>\;
  douta(598) <= \<const0>\;
  douta(597) <= \<const0>\;
  douta(596) <= \<const0>\;
  douta(595) <= \<const0>\;
  douta(594) <= \<const0>\;
  douta(593) <= \<const0>\;
  douta(592) <= \<const0>\;
  douta(591) <= \<const0>\;
  douta(590) <= \<const0>\;
  douta(589) <= \<const0>\;
  douta(588) <= \<const0>\;
  douta(587) <= \<const0>\;
  douta(586) <= \<const0>\;
  douta(585) <= \<const0>\;
  douta(584) <= \<const0>\;
  douta(583) <= \<const0>\;
  douta(582) <= \<const0>\;
  douta(581) <= \<const0>\;
  douta(580) <= \<const0>\;
  douta(579) <= \<const0>\;
  douta(578) <= \<const0>\;
  douta(577) <= \<const0>\;
  douta(576) <= \<const0>\;
  douta(575) <= \<const0>\;
  douta(574) <= \<const0>\;
  douta(573) <= \<const0>\;
  douta(572) <= \<const0>\;
  douta(571) <= \<const0>\;
  douta(570) <= \<const0>\;
  douta(569) <= \<const0>\;
  douta(568) <= \<const0>\;
  douta(567) <= \<const0>\;
  douta(566) <= \<const0>\;
  douta(565) <= \<const0>\;
  douta(564) <= \<const0>\;
  douta(563) <= \<const0>\;
  douta(562) <= \<const0>\;
  douta(561) <= \<const0>\;
  douta(560) <= \<const0>\;
  douta(559) <= \<const0>\;
  douta(558) <= \<const0>\;
  douta(557) <= \<const0>\;
  douta(556) <= \<const0>\;
  douta(555) <= \<const0>\;
  douta(554) <= \<const0>\;
  douta(553) <= \<const0>\;
  douta(552) <= \<const0>\;
  douta(551) <= \<const0>\;
  douta(550) <= \<const0>\;
  douta(549) <= \<const0>\;
  douta(548) <= \<const0>\;
  douta(547) <= \<const0>\;
  douta(546) <= \<const0>\;
  douta(545) <= \<const0>\;
  douta(544) <= \<const0>\;
  douta(543) <= \<const0>\;
  douta(542) <= \<const0>\;
  douta(541) <= \<const0>\;
  douta(540) <= \<const0>\;
  douta(539) <= \<const0>\;
  douta(538) <= \<const0>\;
  douta(537) <= \<const0>\;
  douta(536) <= \<const0>\;
  douta(535) <= \<const0>\;
  douta(534) <= \<const0>\;
  douta(533) <= \<const0>\;
  douta(532) <= \<const0>\;
  douta(531) <= \<const0>\;
  douta(530) <= \<const0>\;
  douta(529) <= \<const0>\;
  douta(528) <= \<const0>\;
  douta(527) <= \<const0>\;
  douta(526) <= \<const0>\;
  douta(525) <= \<const0>\;
  douta(524) <= \<const0>\;
  douta(523) <= \<const0>\;
  douta(522) <= \<const0>\;
  douta(521) <= \<const0>\;
  douta(520) <= \<const0>\;
  douta(519) <= \<const0>\;
  douta(518) <= \<const0>\;
  douta(517) <= \<const0>\;
  douta(516) <= \<const0>\;
  douta(515) <= \<const0>\;
  douta(514) <= \<const0>\;
  douta(513) <= \<const0>\;
  douta(512) <= \<const0>\;
  douta(511) <= \<const0>\;
  douta(510) <= \<const0>\;
  douta(509) <= \<const0>\;
  douta(508) <= \<const0>\;
  douta(507) <= \<const0>\;
  douta(506) <= \<const0>\;
  douta(505) <= \<const0>\;
  douta(504) <= \<const0>\;
  douta(503) <= \<const0>\;
  douta(502) <= \<const0>\;
  douta(501) <= \<const0>\;
  douta(500) <= \<const0>\;
  douta(499) <= \<const0>\;
  douta(498) <= \<const0>\;
  douta(497) <= \<const0>\;
  douta(496) <= \<const0>\;
  douta(495) <= \<const0>\;
  douta(494) <= \<const0>\;
  douta(493) <= \<const0>\;
  douta(492) <= \<const0>\;
  douta(491) <= \<const0>\;
  douta(490) <= \<const0>\;
  douta(489) <= \<const0>\;
  douta(488) <= \<const0>\;
  douta(487) <= \<const0>\;
  douta(486) <= \<const0>\;
  douta(485) <= \<const0>\;
  douta(484) <= \<const0>\;
  douta(483) <= \<const0>\;
  douta(482) <= \<const0>\;
  douta(481) <= \<const0>\;
  douta(480) <= \<const0>\;
  douta(479) <= \<const0>\;
  douta(478) <= \<const0>\;
  douta(477) <= \<const0>\;
  douta(476) <= \<const0>\;
  douta(475) <= \<const0>\;
  douta(474) <= \<const0>\;
  douta(473) <= \<const0>\;
  douta(472) <= \<const0>\;
  douta(471) <= \<const0>\;
  douta(470) <= \<const0>\;
  douta(469) <= \<const0>\;
  douta(468) <= \<const0>\;
  douta(467) <= \<const0>\;
  douta(466) <= \<const0>\;
  douta(465) <= \<const0>\;
  douta(464) <= \<const0>\;
  douta(463) <= \<const0>\;
  douta(462) <= \<const0>\;
  douta(461) <= \<const0>\;
  douta(460) <= \<const0>\;
  douta(459) <= \<const0>\;
  douta(458) <= \<const0>\;
  douta(457) <= \<const0>\;
  douta(456) <= \<const0>\;
  douta(455) <= \<const0>\;
  douta(454) <= \<const0>\;
  douta(453) <= \<const0>\;
  douta(452) <= \<const0>\;
  douta(451) <= \<const0>\;
  douta(450) <= \<const0>\;
  douta(449) <= \<const0>\;
  douta(448) <= \<const0>\;
  douta(447) <= \<const0>\;
  douta(446) <= \<const0>\;
  douta(445) <= \<const0>\;
  douta(444) <= \<const0>\;
  douta(443) <= \<const0>\;
  douta(442) <= \<const0>\;
  douta(441) <= \<const0>\;
  douta(440) <= \<const0>\;
  douta(439) <= \<const0>\;
  douta(438) <= \<const0>\;
  douta(437) <= \<const0>\;
  douta(436) <= \<const0>\;
  douta(435) <= \<const0>\;
  douta(434) <= \<const0>\;
  douta(433) <= \<const0>\;
  douta(432) <= \<const0>\;
  douta(431) <= \<const0>\;
  douta(430) <= \<const0>\;
  douta(429) <= \<const0>\;
  douta(428) <= \<const0>\;
  douta(427) <= \<const0>\;
  douta(426) <= \<const0>\;
  douta(425) <= \<const0>\;
  douta(424) <= \<const0>\;
  douta(423) <= \<const0>\;
  douta(422) <= \<const0>\;
  douta(421) <= \<const0>\;
  douta(420) <= \<const0>\;
  douta(419) <= \<const0>\;
  douta(418) <= \<const0>\;
  douta(417) <= \<const0>\;
  douta(416) <= \<const0>\;
  douta(415) <= \<const0>\;
  douta(414) <= \<const0>\;
  douta(413) <= \<const0>\;
  douta(412) <= \<const0>\;
  douta(411) <= \<const0>\;
  douta(410) <= \<const0>\;
  douta(409) <= \<const0>\;
  douta(408) <= \<const0>\;
  douta(407) <= \<const0>\;
  douta(406) <= \<const0>\;
  douta(405) <= \<const0>\;
  douta(404) <= \<const0>\;
  douta(403) <= \<const0>\;
  douta(402) <= \<const0>\;
  douta(401) <= \<const0>\;
  douta(400) <= \<const0>\;
  douta(399) <= \<const0>\;
  douta(398) <= \<const0>\;
  douta(397) <= \<const0>\;
  douta(396) <= \<const0>\;
  douta(395) <= \<const0>\;
  douta(394) <= \<const0>\;
  douta(393) <= \<const0>\;
  douta(392) <= \<const0>\;
  douta(391) <= \<const0>\;
  douta(390) <= \<const0>\;
  douta(389) <= \<const0>\;
  douta(388) <= \<const0>\;
  douta(387) <= \<const0>\;
  douta(386) <= \<const0>\;
  douta(385) <= \<const0>\;
  douta(384) <= \<const0>\;
  douta(383) <= \<const0>\;
  douta(382) <= \<const0>\;
  douta(381) <= \<const0>\;
  douta(380) <= \<const0>\;
  douta(379) <= \<const0>\;
  douta(378) <= \<const0>\;
  douta(377) <= \<const0>\;
  douta(376) <= \<const0>\;
  douta(375) <= \<const0>\;
  douta(374) <= \<const0>\;
  douta(373) <= \<const0>\;
  douta(372) <= \<const0>\;
  douta(371) <= \<const0>\;
  douta(370) <= \<const0>\;
  douta(369) <= \<const0>\;
  douta(368) <= \<const0>\;
  douta(367) <= \<const0>\;
  douta(366) <= \<const0>\;
  douta(365) <= \<const0>\;
  douta(364) <= \<const0>\;
  douta(363) <= \<const0>\;
  douta(362) <= \<const0>\;
  douta(361) <= \<const0>\;
  douta(360) <= \<const0>\;
  douta(359) <= \<const0>\;
  douta(358) <= \<const0>\;
  douta(357) <= \<const0>\;
  douta(356) <= \<const0>\;
  douta(355) <= \<const0>\;
  douta(354) <= \<const0>\;
  douta(353) <= \<const0>\;
  douta(352) <= \<const0>\;
  douta(351) <= \<const0>\;
  douta(350) <= \<const0>\;
  douta(349) <= \<const0>\;
  douta(348) <= \<const0>\;
  douta(347) <= \<const0>\;
  douta(346) <= \<const0>\;
  douta(345) <= \<const0>\;
  douta(344) <= \<const0>\;
  douta(343) <= \<const0>\;
  douta(342) <= \<const0>\;
  douta(341) <= \<const0>\;
  douta(340) <= \<const0>\;
  douta(339) <= \<const0>\;
  douta(338) <= \<const0>\;
  douta(337) <= \<const0>\;
  douta(336) <= \<const0>\;
  douta(335) <= \<const0>\;
  douta(334) <= \<const0>\;
  douta(333) <= \<const0>\;
  douta(332) <= \<const0>\;
  douta(331) <= \<const0>\;
  douta(330) <= \<const0>\;
  douta(329) <= \<const0>\;
  douta(328) <= \<const0>\;
  douta(327) <= \<const0>\;
  douta(326) <= \<const0>\;
  douta(325) <= \<const0>\;
  douta(324) <= \<const0>\;
  douta(323) <= \<const0>\;
  douta(322) <= \<const0>\;
  douta(321) <= \<const0>\;
  douta(320) <= \<const0>\;
  douta(319) <= \<const0>\;
  douta(318) <= \<const0>\;
  douta(317) <= \<const0>\;
  douta(316) <= \<const0>\;
  douta(315) <= \<const0>\;
  douta(314) <= \<const0>\;
  douta(313) <= \<const0>\;
  douta(312) <= \<const0>\;
  douta(311) <= \<const0>\;
  douta(310) <= \<const0>\;
  douta(309) <= \<const0>\;
  douta(308) <= \<const0>\;
  douta(307) <= \<const0>\;
  douta(306) <= \<const0>\;
  douta(305) <= \<const0>\;
  douta(304) <= \<const0>\;
  douta(303) <= \<const0>\;
  douta(302) <= \<const0>\;
  douta(301) <= \<const0>\;
  douta(300) <= \<const0>\;
  douta(299) <= \<const0>\;
  douta(298) <= \<const0>\;
  douta(297) <= \<const0>\;
  douta(296) <= \<const0>\;
  douta(295) <= \<const0>\;
  douta(294) <= \<const0>\;
  douta(293) <= \<const0>\;
  douta(292) <= \<const0>\;
  douta(291) <= \<const0>\;
  douta(290) <= \<const0>\;
  douta(289) <= \<const0>\;
  douta(288) <= \<const0>\;
  douta(287) <= \<const0>\;
  douta(286) <= \<const0>\;
  douta(285) <= \<const0>\;
  douta(284) <= \<const0>\;
  douta(283) <= \<const0>\;
  douta(282) <= \<const0>\;
  douta(281) <= \<const0>\;
  douta(280) <= \<const0>\;
  douta(279) <= \<const0>\;
  douta(278) <= \<const0>\;
  douta(277) <= \<const0>\;
  douta(276) <= \<const0>\;
  douta(275) <= \<const0>\;
  douta(274) <= \<const0>\;
  douta(273) <= \<const0>\;
  douta(272) <= \<const0>\;
  douta(271) <= \<const0>\;
  douta(270) <= \<const0>\;
  douta(269) <= \<const0>\;
  douta(268) <= \<const0>\;
  douta(267) <= \<const0>\;
  douta(266) <= \<const0>\;
  douta(265) <= \<const0>\;
  douta(264) <= \<const0>\;
  douta(263) <= \<const0>\;
  douta(262) <= \<const0>\;
  douta(261) <= \<const0>\;
  douta(260) <= \<const0>\;
  douta(259) <= \<const0>\;
  douta(258) <= \<const0>\;
  douta(257) <= \<const0>\;
  douta(256) <= \<const0>\;
  douta(255) <= \<const0>\;
  douta(254) <= \<const0>\;
  douta(253) <= \<const0>\;
  douta(252) <= \<const0>\;
  douta(251) <= \<const0>\;
  douta(250) <= \<const0>\;
  douta(249) <= \<const0>\;
  douta(248) <= \<const0>\;
  douta(247) <= \<const0>\;
  douta(246) <= \<const0>\;
  douta(245) <= \<const0>\;
  douta(244) <= \<const0>\;
  douta(243) <= \<const0>\;
  douta(242) <= \<const0>\;
  douta(241) <= \<const0>\;
  douta(240) <= \<const0>\;
  douta(239) <= \<const0>\;
  douta(238) <= \<const0>\;
  douta(237) <= \<const0>\;
  douta(236) <= \<const0>\;
  douta(235) <= \<const0>\;
  douta(234) <= \<const0>\;
  douta(233) <= \<const0>\;
  douta(232) <= \<const0>\;
  douta(231) <= \<const0>\;
  douta(230) <= \<const0>\;
  douta(229) <= \<const0>\;
  douta(228) <= \<const0>\;
  douta(227) <= \<const0>\;
  douta(226) <= \<const0>\;
  douta(225) <= \<const0>\;
  douta(224) <= \<const0>\;
  douta(223) <= \<const0>\;
  douta(222) <= \<const0>\;
  douta(221) <= \<const0>\;
  douta(220) <= \<const0>\;
  douta(219) <= \<const0>\;
  douta(218) <= \<const0>\;
  douta(217) <= \<const0>\;
  douta(216) <= \<const0>\;
  douta(215) <= \<const0>\;
  douta(214) <= \<const0>\;
  douta(213) <= \<const0>\;
  douta(212) <= \<const0>\;
  douta(211) <= \<const0>\;
  douta(210) <= \<const0>\;
  douta(209) <= \<const0>\;
  douta(208) <= \<const0>\;
  douta(207) <= \<const0>\;
  douta(206) <= \<const0>\;
  douta(205) <= \<const0>\;
  douta(204) <= \<const0>\;
  douta(203) <= \<const0>\;
  douta(202) <= \<const0>\;
  douta(201) <= \<const0>\;
  douta(200) <= \<const0>\;
  douta(199) <= \<const0>\;
  douta(198) <= \<const0>\;
  douta(197) <= \<const0>\;
  douta(196) <= \<const0>\;
  douta(195) <= \<const0>\;
  douta(194) <= \<const0>\;
  douta(193) <= \<const0>\;
  douta(192) <= \<const0>\;
  douta(191) <= \<const0>\;
  douta(190) <= \<const0>\;
  douta(189) <= \<const0>\;
  douta(188) <= \<const0>\;
  douta(187) <= \<const0>\;
  douta(186) <= \<const0>\;
  douta(185) <= \<const0>\;
  douta(184) <= \<const0>\;
  douta(183) <= \<const0>\;
  douta(182) <= \<const0>\;
  douta(181) <= \<const0>\;
  douta(180) <= \<const0>\;
  douta(179) <= \<const0>\;
  douta(178) <= \<const0>\;
  douta(177) <= \<const0>\;
  douta(176) <= \<const0>\;
  douta(175) <= \<const0>\;
  douta(174) <= \<const0>\;
  douta(173) <= \<const0>\;
  douta(172) <= \<const0>\;
  douta(171) <= \<const0>\;
  douta(170) <= \<const0>\;
  douta(169) <= \<const0>\;
  douta(168) <= \<const0>\;
  douta(167) <= \<const0>\;
  douta(166) <= \<const0>\;
  douta(165) <= \<const0>\;
  douta(164) <= \<const0>\;
  douta(163) <= \<const0>\;
  douta(162) <= \<const0>\;
  douta(161) <= \<const0>\;
  douta(160) <= \<const0>\;
  douta(159) <= \<const0>\;
  douta(158) <= \<const0>\;
  douta(157) <= \<const0>\;
  douta(156) <= \<const0>\;
  douta(155) <= \<const0>\;
  douta(154) <= \<const0>\;
  douta(153) <= \<const0>\;
  douta(152) <= \<const0>\;
  douta(151) <= \<const0>\;
  douta(150) <= \<const0>\;
  douta(149) <= \<const0>\;
  douta(148) <= \<const0>\;
  douta(147) <= \<const0>\;
  douta(146) <= \<const0>\;
  douta(145) <= \<const0>\;
  douta(144) <= \<const0>\;
  douta(143) <= \<const0>\;
  douta(142) <= \<const0>\;
  douta(141) <= \<const0>\;
  douta(140) <= \<const0>\;
  douta(139) <= \<const0>\;
  douta(138) <= \<const0>\;
  douta(137) <= \<const0>\;
  douta(136) <= \<const0>\;
  douta(135) <= \<const0>\;
  douta(134) <= \<const0>\;
  douta(133) <= \<const0>\;
  douta(132) <= \<const0>\;
  douta(131) <= \<const0>\;
  douta(130) <= \<const0>\;
  douta(129) <= \<const0>\;
  douta(128) <= \<const0>\;
  douta(127) <= \<const0>\;
  douta(126) <= \<const0>\;
  douta(125) <= \<const0>\;
  douta(124) <= \<const0>\;
  douta(123) <= \<const0>\;
  douta(122) <= \<const0>\;
  douta(121) <= \<const0>\;
  douta(120) <= \<const0>\;
  douta(119) <= \<const0>\;
  douta(118) <= \<const0>\;
  douta(117) <= \<const0>\;
  douta(116) <= \<const0>\;
  douta(115) <= \<const0>\;
  douta(114) <= \<const0>\;
  douta(113) <= \<const0>\;
  douta(112) <= \<const0>\;
  douta(111) <= \<const0>\;
  douta(110) <= \<const0>\;
  douta(109) <= \<const0>\;
  douta(108) <= \<const0>\;
  douta(107) <= \<const0>\;
  douta(106) <= \<const0>\;
  douta(105) <= \<const0>\;
  douta(104) <= \<const0>\;
  douta(103) <= \<const0>\;
  douta(102) <= \<const0>\;
  douta(101) <= \<const0>\;
  douta(100) <= \<const0>\;
  douta(99) <= \<const0>\;
  douta(98) <= \<const0>\;
  douta(97) <= \<const0>\;
  douta(96) <= \<const0>\;
  douta(95) <= \<const0>\;
  douta(94) <= \<const0>\;
  douta(93) <= \<const0>\;
  douta(92) <= \<const0>\;
  douta(91) <= \<const0>\;
  douta(90) <= \<const0>\;
  douta(89) <= \<const0>\;
  douta(88) <= \<const0>\;
  douta(87) <= \<const0>\;
  douta(86) <= \<const0>\;
  douta(85) <= \<const0>\;
  douta(84) <= \<const0>\;
  douta(83) <= \<const0>\;
  douta(82) <= \<const0>\;
  douta(81) <= \<const0>\;
  douta(80) <= \<const0>\;
  douta(79) <= \<const0>\;
  douta(78) <= \<const0>\;
  douta(77) <= \<const0>\;
  douta(76) <= \<const0>\;
  douta(75) <= \<const0>\;
  douta(74) <= \<const0>\;
  douta(73) <= \<const0>\;
  douta(72) <= \<const0>\;
  douta(71) <= \<const0>\;
  douta(70) <= \<const0>\;
  douta(69) <= \<const0>\;
  douta(68) <= \<const0>\;
  douta(67) <= \<const0>\;
  douta(66) <= \<const0>\;
  douta(65) <= \<const0>\;
  douta(64) <= \<const0>\;
  douta(63) <= \<const0>\;
  douta(62) <= \<const0>\;
  douta(61) <= \<const0>\;
  douta(60) <= \<const0>\;
  douta(59) <= \<const0>\;
  douta(58) <= \<const0>\;
  douta(57) <= \<const0>\;
  douta(56) <= \<const0>\;
  douta(55) <= \<const0>\;
  douta(54) <= \<const0>\;
  douta(53) <= \<const0>\;
  douta(52) <= \<const0>\;
  douta(51) <= \<const0>\;
  douta(50) <= \<const0>\;
  douta(49) <= \<const0>\;
  douta(48) <= \<const0>\;
  douta(47) <= \<const0>\;
  douta(46) <= \<const0>\;
  douta(45) <= \<const0>\;
  douta(44) <= \<const0>\;
  douta(43) <= \<const0>\;
  douta(42) <= \<const0>\;
  douta(41) <= \<const0>\;
  douta(40) <= \<const0>\;
  douta(39) <= \<const0>\;
  douta(38) <= \<const0>\;
  douta(37) <= \<const0>\;
  douta(36) <= \<const0>\;
  douta(35) <= \<const0>\;
  douta(34) <= \<const0>\;
  douta(33) <= \<const0>\;
  douta(32) <= \<const0>\;
  douta(31) <= \<const0>\;
  douta(30) <= \<const0>\;
  douta(29) <= \<const0>\;
  douta(28) <= \<const0>\;
  douta(27) <= \<const0>\;
  douta(26) <= \<const0>\;
  douta(25) <= \<const0>\;
  douta(24) <= \<const0>\;
  douta(23) <= \<const0>\;
  douta(22) <= \<const0>\;
  douta(21) <= \<const0>\;
  douta(20) <= \<const0>\;
  douta(19) <= \<const0>\;
  douta(18) <= \<const0>\;
  douta(17) <= \<const0>\;
  douta(16) <= \<const0>\;
  douta(15) <= \<const0>\;
  douta(14) <= \<const0>\;
  douta(13) <= \<const0>\;
  douta(12) <= \<const0>\;
  douta(11) <= \<const0>\;
  douta(10) <= \<const0>\;
  douta(9) <= \<const0>\;
  douta(8) <= \<const0>\;
  douta(7) <= \<const0>\;
  douta(6) <= \<const0>\;
  douta(5) <= \<const0>\;
  douta(4) <= \<const0>\;
  douta(3) <= \<const0>\;
  douta(2) <= \<const0>\;
  douta(1) <= \<const0>\;
  douta(0) <= \<const0>\;
  doutb(643) <= \^doutb\(643);
  doutb(642) <= \<const0>\;
  doutb(641) <= \<const0>\;
  doutb(640) <= \<const0>\;
  doutb(639) <= \<const0>\;
  doutb(638) <= \<const0>\;
  doutb(637) <= \<const0>\;
  doutb(636) <= \<const0>\;
  doutb(635) <= \<const0>\;
  doutb(634) <= \<const0>\;
  doutb(633) <= \<const0>\;
  doutb(632) <= \<const0>\;
  doutb(631) <= \<const0>\;
  doutb(630) <= \<const0>\;
  doutb(629) <= \<const0>\;
  doutb(628) <= \<const0>\;
  doutb(627) <= \<const0>\;
  doutb(626) <= \<const0>\;
  doutb(625) <= \<const0>\;
  doutb(624) <= \<const0>\;
  doutb(623) <= \<const0>\;
  doutb(622) <= \<const0>\;
  doutb(621) <= \<const0>\;
  doutb(620) <= \<const0>\;
  doutb(619) <= \<const0>\;
  doutb(618) <= \<const0>\;
  doutb(617) <= \<const0>\;
  doutb(616) <= \<const0>\;
  doutb(615) <= \<const0>\;
  doutb(614) <= \<const0>\;
  doutb(613) <= \<const0>\;
  doutb(612) <= \<const0>\;
  doutb(611) <= \<const0>\;
  doutb(610) <= \<const0>\;
  doutb(609) <= \<const0>\;
  doutb(608) <= \<const0>\;
  doutb(607) <= \<const0>\;
  doutb(606) <= \<const0>\;
  doutb(605) <= \<const0>\;
  doutb(604) <= \<const0>\;
  doutb(603) <= \<const0>\;
  doutb(602) <= \<const0>\;
  doutb(601) <= \<const0>\;
  doutb(600) <= \<const0>\;
  doutb(599) <= \<const0>\;
  doutb(598) <= \<const0>\;
  doutb(597) <= \<const0>\;
  doutb(596) <= \<const0>\;
  doutb(595) <= \<const0>\;
  doutb(594) <= \<const0>\;
  doutb(593) <= \<const0>\;
  doutb(592) <= \<const0>\;
  doutb(591) <= \<const0>\;
  doutb(590) <= \<const0>\;
  doutb(589) <= \<const0>\;
  doutb(588) <= \<const0>\;
  doutb(587) <= \<const0>\;
  doutb(586) <= \<const0>\;
  doutb(585) <= \<const0>\;
  doutb(584) <= \<const0>\;
  doutb(583) <= \<const0>\;
  doutb(582) <= \<const0>\;
  doutb(581) <= \<const0>\;
  doutb(580) <= \<const0>\;
  doutb(579) <= \<const0>\;
  doutb(578) <= \<const0>\;
  doutb(577) <= \<const0>\;
  doutb(576) <= \<const0>\;
  doutb(575) <= \<const0>\;
  doutb(574) <= \<const0>\;
  doutb(573) <= \<const0>\;
  doutb(572) <= \<const0>\;
  doutb(571) <= \<const0>\;
  doutb(570) <= \<const0>\;
  doutb(569) <= \<const0>\;
  doutb(568) <= \<const0>\;
  doutb(567) <= \<const0>\;
  doutb(566) <= \<const0>\;
  doutb(565) <= \<const0>\;
  doutb(564) <= \<const0>\;
  doutb(563) <= \<const0>\;
  doutb(562) <= \<const0>\;
  doutb(561) <= \<const0>\;
  doutb(560) <= \<const0>\;
  doutb(559) <= \<const0>\;
  doutb(558) <= \<const0>\;
  doutb(557) <= \<const0>\;
  doutb(556) <= \<const0>\;
  doutb(555) <= \<const0>\;
  doutb(554) <= \<const0>\;
  doutb(553) <= \<const0>\;
  doutb(552) <= \<const0>\;
  doutb(551) <= \<const0>\;
  doutb(550) <= \<const0>\;
  doutb(549) <= \<const0>\;
  doutb(548) <= \<const0>\;
  doutb(547) <= \<const0>\;
  doutb(546) <= \<const0>\;
  doutb(545) <= \<const0>\;
  doutb(544) <= \<const0>\;
  doutb(543) <= \<const0>\;
  doutb(542) <= \<const0>\;
  doutb(541) <= \<const0>\;
  doutb(540) <= \<const0>\;
  doutb(539) <= \<const0>\;
  doutb(538) <= \<const0>\;
  doutb(537) <= \<const0>\;
  doutb(536) <= \<const0>\;
  doutb(535) <= \<const0>\;
  doutb(534) <= \<const0>\;
  doutb(533) <= \<const0>\;
  doutb(532) <= \<const0>\;
  doutb(531) <= \<const0>\;
  doutb(530) <= \<const0>\;
  doutb(529) <= \<const0>\;
  doutb(528) <= \<const0>\;
  doutb(527) <= \<const0>\;
  doutb(526) <= \<const0>\;
  doutb(525) <= \<const0>\;
  doutb(524) <= \<const0>\;
  doutb(523) <= \<const0>\;
  doutb(522) <= \<const0>\;
  doutb(521) <= \<const0>\;
  doutb(520) <= \<const0>\;
  doutb(519) <= \<const0>\;
  doutb(518) <= \<const0>\;
  doutb(517) <= \<const0>\;
  doutb(516) <= \<const0>\;
  doutb(515) <= \<const0>\;
  doutb(514) <= \<const0>\;
  doutb(513) <= \<const0>\;
  doutb(512) <= \<const0>\;
  doutb(511 downto 0) <= \^doutb\(511 downto 0);
  sbiterra <= \<const0>\;
  sbiterrb <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(0),
      Q => \^doutb\(0),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][100]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(100),
      Q => \^doutb\(100),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][101]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(101),
      Q => \^doutb\(101),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][102]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(102),
      Q => \^doutb\(102),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][103]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(103),
      Q => \^doutb\(103),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][104]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(104),
      Q => \^doutb\(104),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][105]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(105),
      Q => \^doutb\(105),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][106]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(106),
      Q => \^doutb\(106),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][107]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(107),
      Q => \^doutb\(107),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][108]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(108),
      Q => \^doutb\(108),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][109]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(109),
      Q => \^doutb\(109),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(10),
      Q => \^doutb\(10),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][110]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(110),
      Q => \^doutb\(110),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][111]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(111),
      Q => \^doutb\(111),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][112]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(112),
      Q => \^doutb\(112),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][113]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(113),
      Q => \^doutb\(113),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][114]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(114),
      Q => \^doutb\(114),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][115]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(115),
      Q => \^doutb\(115),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][116]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(116),
      Q => \^doutb\(116),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][117]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(117),
      Q => \^doutb\(117),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][118]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(118),
      Q => \^doutb\(118),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][119]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(119),
      Q => \^doutb\(119),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(11),
      Q => \^doutb\(11),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][120]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(120),
      Q => \^doutb\(120),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][121]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(121),
      Q => \^doutb\(121),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][122]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(122),
      Q => \^doutb\(122),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][123]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(123),
      Q => \^doutb\(123),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][124]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(124),
      Q => \^doutb\(124),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][125]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(125),
      Q => \^doutb\(125),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][126]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(126),
      Q => \^doutb\(126),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][127]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(127),
      Q => \^doutb\(127),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][128]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(128),
      Q => \^doutb\(128),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][129]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(129),
      Q => \^doutb\(129),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(12),
      Q => \^doutb\(12),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][130]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(130),
      Q => \^doutb\(130),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][131]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(131),
      Q => \^doutb\(131),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][132]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(132),
      Q => \^doutb\(132),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][133]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(133),
      Q => \^doutb\(133),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][134]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(134),
      Q => \^doutb\(134),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][135]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(135),
      Q => \^doutb\(135),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][136]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(136),
      Q => \^doutb\(136),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][137]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(137),
      Q => \^doutb\(137),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][138]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(138),
      Q => \^doutb\(138),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][139]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(139),
      Q => \^doutb\(139),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(13),
      Q => \^doutb\(13),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][140]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(140),
      Q => \^doutb\(140),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][141]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(141),
      Q => \^doutb\(141),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][142]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(142),
      Q => \^doutb\(142),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][143]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(143),
      Q => \^doutb\(143),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][144]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(144),
      Q => \^doutb\(144),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][145]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(145),
      Q => \^doutb\(145),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][146]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(146),
      Q => \^doutb\(146),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][147]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(147),
      Q => \^doutb\(147),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][148]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(148),
      Q => \^doutb\(148),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][149]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(149),
      Q => \^doutb\(149),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(14),
      Q => \^doutb\(14),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][150]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(150),
      Q => \^doutb\(150),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][151]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(151),
      Q => \^doutb\(151),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][152]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(152),
      Q => \^doutb\(152),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][153]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(153),
      Q => \^doutb\(153),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][154]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(154),
      Q => \^doutb\(154),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][155]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(155),
      Q => \^doutb\(155),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][156]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(156),
      Q => \^doutb\(156),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][157]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(157),
      Q => \^doutb\(157),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][158]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(158),
      Q => \^doutb\(158),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][159]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(159),
      Q => \^doutb\(159),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(15),
      Q => \^doutb\(15),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][160]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(160),
      Q => \^doutb\(160),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][161]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(161),
      Q => \^doutb\(161),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][162]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(162),
      Q => \^doutb\(162),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][163]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(163),
      Q => \^doutb\(163),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][164]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(164),
      Q => \^doutb\(164),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][165]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(165),
      Q => \^doutb\(165),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][166]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(166),
      Q => \^doutb\(166),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][167]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(167),
      Q => \^doutb\(167),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][168]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(168),
      Q => \^doutb\(168),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][169]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(169),
      Q => \^doutb\(169),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(16),
      Q => \^doutb\(16),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][170]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(170),
      Q => \^doutb\(170),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][171]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(171),
      Q => \^doutb\(171),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][172]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(172),
      Q => \^doutb\(172),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][173]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(173),
      Q => \^doutb\(173),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][174]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(174),
      Q => \^doutb\(174),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][175]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(175),
      Q => \^doutb\(175),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][176]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(176),
      Q => \^doutb\(176),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][177]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(177),
      Q => \^doutb\(177),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][178]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(178),
      Q => \^doutb\(178),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][179]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(179),
      Q => \^doutb\(179),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(17),
      Q => \^doutb\(17),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][180]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(180),
      Q => \^doutb\(180),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][181]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(181),
      Q => \^doutb\(181),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][182]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(182),
      Q => \^doutb\(182),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][183]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(183),
      Q => \^doutb\(183),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][184]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(184),
      Q => \^doutb\(184),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][185]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(185),
      Q => \^doutb\(185),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][186]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(186),
      Q => \^doutb\(186),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][187]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(187),
      Q => \^doutb\(187),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][188]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(188),
      Q => \^doutb\(188),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][189]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(189),
      Q => \^doutb\(189),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(18),
      Q => \^doutb\(18),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][190]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(190),
      Q => \^doutb\(190),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][191]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(191),
      Q => \^doutb\(191),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][192]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(192),
      Q => \^doutb\(192),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][193]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(193),
      Q => \^doutb\(193),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][194]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(194),
      Q => \^doutb\(194),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][195]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(195),
      Q => \^doutb\(195),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][196]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(196),
      Q => \^doutb\(196),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][197]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(197),
      Q => \^doutb\(197),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][198]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(198),
      Q => \^doutb\(198),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][199]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(199),
      Q => \^doutb\(199),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(19),
      Q => \^doutb\(19),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(1),
      Q => \^doutb\(1),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][200]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(200),
      Q => \^doutb\(200),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][201]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(201),
      Q => \^doutb\(201),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][202]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(202),
      Q => \^doutb\(202),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][203]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(203),
      Q => \^doutb\(203),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][204]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(204),
      Q => \^doutb\(204),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][205]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(205),
      Q => \^doutb\(205),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][206]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(206),
      Q => \^doutb\(206),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][207]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(207),
      Q => \^doutb\(207),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][208]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(208),
      Q => \^doutb\(208),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][209]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(209),
      Q => \^doutb\(209),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(20),
      Q => \^doutb\(20),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][210]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(210),
      Q => \^doutb\(210),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][211]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(211),
      Q => \^doutb\(211),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][212]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(212),
      Q => \^doutb\(212),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][213]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(213),
      Q => \^doutb\(213),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][214]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(214),
      Q => \^doutb\(214),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][215]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(215),
      Q => \^doutb\(215),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][216]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(216),
      Q => \^doutb\(216),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][217]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(217),
      Q => \^doutb\(217),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][218]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(218),
      Q => \^doutb\(218),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][219]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(219),
      Q => \^doutb\(219),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(21),
      Q => \^doutb\(21),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][220]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(220),
      Q => \^doutb\(220),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][221]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(221),
      Q => \^doutb\(221),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][222]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(222),
      Q => \^doutb\(222),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][223]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(223),
      Q => \^doutb\(223),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][224]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(224),
      Q => \^doutb\(224),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][225]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(225),
      Q => \^doutb\(225),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][226]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(226),
      Q => \^doutb\(226),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][227]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(227),
      Q => \^doutb\(227),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][228]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(228),
      Q => \^doutb\(228),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][229]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(229),
      Q => \^doutb\(229),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(22),
      Q => \^doutb\(22),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][230]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(230),
      Q => \^doutb\(230),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][231]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(231),
      Q => \^doutb\(231),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][232]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(232),
      Q => \^doutb\(232),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][233]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(233),
      Q => \^doutb\(233),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][234]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(234),
      Q => \^doutb\(234),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][235]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(235),
      Q => \^doutb\(235),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][236]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(236),
      Q => \^doutb\(236),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][237]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(237),
      Q => \^doutb\(237),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][238]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(238),
      Q => \^doutb\(238),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][239]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(239),
      Q => \^doutb\(239),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(23),
      Q => \^doutb\(23),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][240]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(240),
      Q => \^doutb\(240),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][241]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(241),
      Q => \^doutb\(241),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][242]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(242),
      Q => \^doutb\(242),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][243]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(243),
      Q => \^doutb\(243),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][244]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(244),
      Q => \^doutb\(244),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][245]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(245),
      Q => \^doutb\(245),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][246]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(246),
      Q => \^doutb\(246),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][247]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(247),
      Q => \^doutb\(247),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][248]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(248),
      Q => \^doutb\(248),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][249]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(249),
      Q => \^doutb\(249),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(24),
      Q => \^doutb\(24),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][250]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(250),
      Q => \^doutb\(250),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][251]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(251),
      Q => \^doutb\(251),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][252]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(252),
      Q => \^doutb\(252),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][253]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(253),
      Q => \^doutb\(253),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][254]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(254),
      Q => \^doutb\(254),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][255]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(255),
      Q => \^doutb\(255),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][256]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(256),
      Q => \^doutb\(256),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][257]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(257),
      Q => \^doutb\(257),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][258]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(258),
      Q => \^doutb\(258),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][259]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(259),
      Q => \^doutb\(259),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(25),
      Q => \^doutb\(25),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][260]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(260),
      Q => \^doutb\(260),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][261]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(261),
      Q => \^doutb\(261),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][262]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(262),
      Q => \^doutb\(262),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][263]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(263),
      Q => \^doutb\(263),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][264]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(264),
      Q => \^doutb\(264),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][265]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(265),
      Q => \^doutb\(265),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][266]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(266),
      Q => \^doutb\(266),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][267]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(267),
      Q => \^doutb\(267),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][268]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(268),
      Q => \^doutb\(268),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][269]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(269),
      Q => \^doutb\(269),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(26),
      Q => \^doutb\(26),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][270]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(270),
      Q => \^doutb\(270),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][271]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(271),
      Q => \^doutb\(271),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][272]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(272),
      Q => \^doutb\(272),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][273]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(273),
      Q => \^doutb\(273),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][274]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(274),
      Q => \^doutb\(274),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][275]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(275),
      Q => \^doutb\(275),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][276]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(276),
      Q => \^doutb\(276),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][277]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(277),
      Q => \^doutb\(277),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][278]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(278),
      Q => \^doutb\(278),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][279]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(279),
      Q => \^doutb\(279),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(27),
      Q => \^doutb\(27),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][280]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(280),
      Q => \^doutb\(280),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][281]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(281),
      Q => \^doutb\(281),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][282]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(282),
      Q => \^doutb\(282),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][283]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(283),
      Q => \^doutb\(283),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][284]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(284),
      Q => \^doutb\(284),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][285]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(285),
      Q => \^doutb\(285),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][286]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(286),
      Q => \^doutb\(286),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][287]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(287),
      Q => \^doutb\(287),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][288]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(288),
      Q => \^doutb\(288),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][289]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(289),
      Q => \^doutb\(289),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(28),
      Q => \^doutb\(28),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][290]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(290),
      Q => \^doutb\(290),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][291]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(291),
      Q => \^doutb\(291),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][292]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(292),
      Q => \^doutb\(292),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][293]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(293),
      Q => \^doutb\(293),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][294]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(294),
      Q => \^doutb\(294),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][295]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(295),
      Q => \^doutb\(295),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][296]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(296),
      Q => \^doutb\(296),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][297]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(297),
      Q => \^doutb\(297),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][298]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(298),
      Q => \^doutb\(298),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][299]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(299),
      Q => \^doutb\(299),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(29),
      Q => \^doutb\(29),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(2),
      Q => \^doutb\(2),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][300]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(300),
      Q => \^doutb\(300),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][301]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(301),
      Q => \^doutb\(301),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][302]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(302),
      Q => \^doutb\(302),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][303]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(303),
      Q => \^doutb\(303),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][304]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(304),
      Q => \^doutb\(304),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][305]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(305),
      Q => \^doutb\(305),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][306]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(306),
      Q => \^doutb\(306),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][307]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(307),
      Q => \^doutb\(307),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][308]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(308),
      Q => \^doutb\(308),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][309]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(309),
      Q => \^doutb\(309),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(30),
      Q => \^doutb\(30),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][310]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(310),
      Q => \^doutb\(310),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][311]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(311),
      Q => \^doutb\(311),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][312]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(312),
      Q => \^doutb\(312),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][313]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(313),
      Q => \^doutb\(313),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][314]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(314),
      Q => \^doutb\(314),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][315]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(315),
      Q => \^doutb\(315),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][316]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(316),
      Q => \^doutb\(316),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][317]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(317),
      Q => \^doutb\(317),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][318]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(318),
      Q => \^doutb\(318),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][319]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(319),
      Q => \^doutb\(319),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(31),
      Q => \^doutb\(31),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][320]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(320),
      Q => \^doutb\(320),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][321]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(321),
      Q => \^doutb\(321),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][322]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(322),
      Q => \^doutb\(322),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][323]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(323),
      Q => \^doutb\(323),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][324]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(324),
      Q => \^doutb\(324),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][325]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(325),
      Q => \^doutb\(325),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][326]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(326),
      Q => \^doutb\(326),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][327]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(327),
      Q => \^doutb\(327),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][328]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(328),
      Q => \^doutb\(328),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][329]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(329),
      Q => \^doutb\(329),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][32]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(32),
      Q => \^doutb\(32),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][330]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(330),
      Q => \^doutb\(330),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][331]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(331),
      Q => \^doutb\(331),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][332]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(332),
      Q => \^doutb\(332),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][333]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(333),
      Q => \^doutb\(333),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][334]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(334),
      Q => \^doutb\(334),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][335]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(335),
      Q => \^doutb\(335),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][336]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(336),
      Q => \^doutb\(336),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][337]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(337),
      Q => \^doutb\(337),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][338]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(338),
      Q => \^doutb\(338),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][339]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(339),
      Q => \^doutb\(339),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][33]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(33),
      Q => \^doutb\(33),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][340]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(340),
      Q => \^doutb\(340),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][341]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(341),
      Q => \^doutb\(341),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][342]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(342),
      Q => \^doutb\(342),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][343]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(343),
      Q => \^doutb\(343),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][344]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(344),
      Q => \^doutb\(344),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][345]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(345),
      Q => \^doutb\(345),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][346]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(346),
      Q => \^doutb\(346),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][347]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(347),
      Q => \^doutb\(347),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][348]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(348),
      Q => \^doutb\(348),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][349]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(349),
      Q => \^doutb\(349),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][34]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(34),
      Q => \^doutb\(34),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][350]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(350),
      Q => \^doutb\(350),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][351]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(351),
      Q => \^doutb\(351),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][352]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(352),
      Q => \^doutb\(352),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][353]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(353),
      Q => \^doutb\(353),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][354]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(354),
      Q => \^doutb\(354),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][355]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(355),
      Q => \^doutb\(355),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][356]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(356),
      Q => \^doutb\(356),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][357]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(357),
      Q => \^doutb\(357),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][358]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(358),
      Q => \^doutb\(358),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][359]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(359),
      Q => \^doutb\(359),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][35]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(35),
      Q => \^doutb\(35),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][360]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(360),
      Q => \^doutb\(360),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][361]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(361),
      Q => \^doutb\(361),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][362]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(362),
      Q => \^doutb\(362),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][363]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(363),
      Q => \^doutb\(363),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][364]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(364),
      Q => \^doutb\(364),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][365]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(365),
      Q => \^doutb\(365),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][366]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(366),
      Q => \^doutb\(366),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][367]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(367),
      Q => \^doutb\(367),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][368]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(368),
      Q => \^doutb\(368),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][369]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(369),
      Q => \^doutb\(369),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][36]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(36),
      Q => \^doutb\(36),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][370]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(370),
      Q => \^doutb\(370),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][371]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(371),
      Q => \^doutb\(371),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][372]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(372),
      Q => \^doutb\(372),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][373]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(373),
      Q => \^doutb\(373),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][374]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(374),
      Q => \^doutb\(374),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][375]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(375),
      Q => \^doutb\(375),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][376]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(376),
      Q => \^doutb\(376),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][377]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(377),
      Q => \^doutb\(377),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][378]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(378),
      Q => \^doutb\(378),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][379]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(379),
      Q => \^doutb\(379),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][37]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(37),
      Q => \^doutb\(37),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][380]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(380),
      Q => \^doutb\(380),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][381]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(381),
      Q => \^doutb\(381),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][382]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(382),
      Q => \^doutb\(382),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][383]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(383),
      Q => \^doutb\(383),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][384]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(384),
      Q => \^doutb\(384),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][385]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(385),
      Q => \^doutb\(385),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][386]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(386),
      Q => \^doutb\(386),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][387]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(387),
      Q => \^doutb\(387),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][388]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(388),
      Q => \^doutb\(388),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][389]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(389),
      Q => \^doutb\(389),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][38]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(38),
      Q => \^doutb\(38),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][390]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(390),
      Q => \^doutb\(390),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][391]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(391),
      Q => \^doutb\(391),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][392]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(392),
      Q => \^doutb\(392),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][393]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(393),
      Q => \^doutb\(393),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][394]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(394),
      Q => \^doutb\(394),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][395]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(395),
      Q => \^doutb\(395),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][396]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(396),
      Q => \^doutb\(396),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][397]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(397),
      Q => \^doutb\(397),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][398]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(398),
      Q => \^doutb\(398),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][399]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(399),
      Q => \^doutb\(399),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][39]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(39),
      Q => \^doutb\(39),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(3),
      Q => \^doutb\(3),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][400]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(400),
      Q => \^doutb\(400),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][401]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(401),
      Q => \^doutb\(401),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][402]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(402),
      Q => \^doutb\(402),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][403]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(403),
      Q => \^doutb\(403),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][404]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(404),
      Q => \^doutb\(404),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][405]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(405),
      Q => \^doutb\(405),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][406]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(406),
      Q => \^doutb\(406),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][407]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(407),
      Q => \^doutb\(407),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][408]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(408),
      Q => \^doutb\(408),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][409]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(409),
      Q => \^doutb\(409),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][40]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(40),
      Q => \^doutb\(40),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][410]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(410),
      Q => \^doutb\(410),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][411]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(411),
      Q => \^doutb\(411),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][412]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(412),
      Q => \^doutb\(412),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][413]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(413),
      Q => \^doutb\(413),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][414]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(414),
      Q => \^doutb\(414),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][415]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(415),
      Q => \^doutb\(415),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][416]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(416),
      Q => \^doutb\(416),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][417]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(417),
      Q => \^doutb\(417),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][418]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(418),
      Q => \^doutb\(418),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][419]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(419),
      Q => \^doutb\(419),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][41]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(41),
      Q => \^doutb\(41),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][420]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(420),
      Q => \^doutb\(420),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][421]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(421),
      Q => \^doutb\(421),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][422]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(422),
      Q => \^doutb\(422),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][423]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(423),
      Q => \^doutb\(423),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][424]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(424),
      Q => \^doutb\(424),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][425]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(425),
      Q => \^doutb\(425),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][426]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(426),
      Q => \^doutb\(426),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][427]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(427),
      Q => \^doutb\(427),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][428]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(428),
      Q => \^doutb\(428),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][429]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(429),
      Q => \^doutb\(429),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][42]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(42),
      Q => \^doutb\(42),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][430]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(430),
      Q => \^doutb\(430),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][431]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(431),
      Q => \^doutb\(431),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][432]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(432),
      Q => \^doutb\(432),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][433]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(433),
      Q => \^doutb\(433),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][434]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(434),
      Q => \^doutb\(434),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][435]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(435),
      Q => \^doutb\(435),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][436]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(436),
      Q => \^doutb\(436),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][437]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(437),
      Q => \^doutb\(437),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][438]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(438),
      Q => \^doutb\(438),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][439]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(439),
      Q => \^doutb\(439),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][43]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(43),
      Q => \^doutb\(43),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][440]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(440),
      Q => \^doutb\(440),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][441]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(441),
      Q => \^doutb\(441),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][442]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(442),
      Q => \^doutb\(442),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][443]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(443),
      Q => \^doutb\(443),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][444]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(444),
      Q => \^doutb\(444),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][445]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(445),
      Q => \^doutb\(445),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][446]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(446),
      Q => \^doutb\(446),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][447]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(447),
      Q => \^doutb\(447),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][448]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(448),
      Q => \^doutb\(448),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][449]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(449),
      Q => \^doutb\(449),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][44]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(44),
      Q => \^doutb\(44),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][450]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(450),
      Q => \^doutb\(450),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][451]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(451),
      Q => \^doutb\(451),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][452]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(452),
      Q => \^doutb\(452),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][453]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(453),
      Q => \^doutb\(453),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][454]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(454),
      Q => \^doutb\(454),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][455]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(455),
      Q => \^doutb\(455),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][456]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(456),
      Q => \^doutb\(456),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][457]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(457),
      Q => \^doutb\(457),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][458]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(458),
      Q => \^doutb\(458),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][459]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(459),
      Q => \^doutb\(459),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][45]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(45),
      Q => \^doutb\(45),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][460]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(460),
      Q => \^doutb\(460),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][461]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(461),
      Q => \^doutb\(461),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][462]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(462),
      Q => \^doutb\(462),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][463]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(463),
      Q => \^doutb\(463),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][464]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(464),
      Q => \^doutb\(464),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][465]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(465),
      Q => \^doutb\(465),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][466]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(466),
      Q => \^doutb\(466),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][467]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(467),
      Q => \^doutb\(467),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][468]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(468),
      Q => \^doutb\(468),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][469]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(469),
      Q => \^doutb\(469),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][46]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(46),
      Q => \^doutb\(46),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][470]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(470),
      Q => \^doutb\(470),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][471]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(471),
      Q => \^doutb\(471),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][472]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(472),
      Q => \^doutb\(472),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][473]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(473),
      Q => \^doutb\(473),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][474]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(474),
      Q => \^doutb\(474),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][475]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(475),
      Q => \^doutb\(475),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][476]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(476),
      Q => \^doutb\(476),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][477]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(477),
      Q => \^doutb\(477),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][478]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(478),
      Q => \^doutb\(478),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][479]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(479),
      Q => \^doutb\(479),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][47]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(47),
      Q => \^doutb\(47),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][480]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(480),
      Q => \^doutb\(480),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][481]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(481),
      Q => \^doutb\(481),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][482]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(482),
      Q => \^doutb\(482),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][483]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(483),
      Q => \^doutb\(483),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][484]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(484),
      Q => \^doutb\(484),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][485]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(485),
      Q => \^doutb\(485),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][486]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(486),
      Q => \^doutb\(486),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][487]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(487),
      Q => \^doutb\(487),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][488]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(488),
      Q => \^doutb\(488),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][489]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(489),
      Q => \^doutb\(489),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][48]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(48),
      Q => \^doutb\(48),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][490]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(490),
      Q => \^doutb\(490),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][491]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(491),
      Q => \^doutb\(491),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][492]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(492),
      Q => \^doutb\(492),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][493]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(493),
      Q => \^doutb\(493),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][494]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(494),
      Q => \^doutb\(494),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][495]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(495),
      Q => \^doutb\(495),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][496]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(496),
      Q => \^doutb\(496),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][497]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(497),
      Q => \^doutb\(497),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][498]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(498),
      Q => \^doutb\(498),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][499]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(499),
      Q => \^doutb\(499),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][49]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(49),
      Q => \^doutb\(49),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(4),
      Q => \^doutb\(4),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][500]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(500),
      Q => \^doutb\(500),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][501]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(501),
      Q => \^doutb\(501),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][502]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(502),
      Q => \^doutb\(502),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][503]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(503),
      Q => \^doutb\(503),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][504]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(504),
      Q => \^doutb\(504),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][505]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(505),
      Q => \^doutb\(505),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][506]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(506),
      Q => \^doutb\(506),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][507]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(507),
      Q => \^doutb\(507),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][508]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(508),
      Q => \^doutb\(508),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][509]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(509),
      Q => \^doutb\(509),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][50]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(50),
      Q => \^doutb\(50),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][510]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(510),
      Q => \^doutb\(510),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][511]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(511),
      Q => \^doutb\(511),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][51]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(51),
      Q => \^doutb\(51),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][52]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(52),
      Q => \^doutb\(52),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][53]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(53),
      Q => \^doutb\(53),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][54]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(54),
      Q => \^doutb\(54),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][55]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(55),
      Q => \^doutb\(55),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][56]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(56),
      Q => \^doutb\(56),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][57]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(57),
      Q => \^doutb\(57),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][58]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(58),
      Q => \^doutb\(58),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][59]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(59),
      Q => \^doutb\(59),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(5),
      Q => \^doutb\(5),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][60]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(60),
      Q => \^doutb\(60),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][61]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(61),
      Q => \^doutb\(61),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][62]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(62),
      Q => \^doutb\(62),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][63]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(63),
      Q => \^doutb\(63),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][643]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(643),
      Q => \^doutb\(643),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][64]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(64),
      Q => \^doutb\(64),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][65]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(65),
      Q => \^doutb\(65),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][66]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(66),
      Q => \^doutb\(66),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][67]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(67),
      Q => \^doutb\(67),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][68]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(68),
      Q => \^doutb\(68),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][69]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(69),
      Q => \^doutb\(69),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(6),
      Q => \^doutb\(6),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][70]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(70),
      Q => \^doutb\(70),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][71]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(71),
      Q => \^doutb\(71),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][72]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(72),
      Q => \^doutb\(72),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][73]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(73),
      Q => \^doutb\(73),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][74]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(74),
      Q => \^doutb\(74),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][75]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(75),
      Q => \^doutb\(75),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][76]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(76),
      Q => \^doutb\(76),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][77]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(77),
      Q => \^doutb\(77),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][78]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(78),
      Q => \^doutb\(78),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][79]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(79),
      Q => \^doutb\(79),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(7),
      Q => \^doutb\(7),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][80]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(80),
      Q => \^doutb\(80),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][81]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(81),
      Q => \^doutb\(81),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][82]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(82),
      Q => \^doutb\(82),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][83]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(83),
      Q => \^doutb\(83),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][84]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(84),
      Q => \^doutb\(84),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][85]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(85),
      Q => \^doutb\(85),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][86]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(86),
      Q => \^doutb\(86),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][87]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(87),
      Q => \^doutb\(87),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][88]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(88),
      Q => \^doutb\(88),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][89]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(89),
      Q => \^doutb\(89),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(8),
      Q => \^doutb\(8),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][90]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(90),
      Q => \^doutb\(90),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][91]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(91),
      Q => \^doutb\(91),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][92]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(92),
      Q => \^doutb\(92),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][93]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(93),
      Q => \^doutb\(93),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][94]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(94),
      Q => \^doutb\(94),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][95]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(95),
      Q => \^doutb\(95),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][96]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(96),
      Q => \^doutb\(96),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][97]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(97),
      Q => \^doutb\(97),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][98]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(98),
      Q => \^doutb\(98),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][99]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(99),
      Q => \^doutb\(99),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.doutb_pipe_reg[0][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.doutb_reg\(9),
      Q => \^doutb\(9),
      R => rstb
    );
\gen_wr_a.gen_word_narrow.mem_reg_uram_0\: unisim.vcomponents.URAM288
    generic map(
      AVG_CONS_INACTIVE_CYCLES => 10,
      BWE_MODE_A => "PARITY_INDEPENDENT",
      BWE_MODE_B => "PARITY_INDEPENDENT",
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "NONE",
      EN_ECC_RD_A => "FALSE",
      EN_ECC_RD_B => "FALSE",
      EN_ECC_WR_A => "FALSE",
      EN_ECC_WR_B => "FALSE",
      IREG_PRE_A => "FALSE",
      IREG_PRE_B => "FALSE",
      IS_CLK_INVERTED => '0',
      IS_EN_A_INVERTED => '0',
      IS_EN_B_INVERTED => '0',
      IS_RDB_WR_A_INVERTED => '0',
      IS_RDB_WR_B_INVERTED => '0',
      IS_RST_A_INVERTED => '0',
      IS_RST_B_INVERTED => '0',
      MATRIX_ID => "gen_wr_a.gen_word_narrow.mem_reg_B4_M0",
      NUM_UNIQUE_SELF_ADDR_A => 1,
      NUM_UNIQUE_SELF_ADDR_B => 1,
      NUM_URAM_IN_MATRIX => 1,
      OREG_A => "FALSE",
      OREG_B => "FALSE",
      OREG_ECC_A => "FALSE",
      OREG_ECC_B => "FALSE",
      REG_CAS_A => "FALSE",
      REG_CAS_B => "FALSE",
      RST_MODE_A => "SYNC",
      RST_MODE_B => "SYNC",
      SELF_ADDR_A => B"000" & X"00",
      SELF_ADDR_B => B"000" & X"00",
      SELF_MASK_A => B"111" & X"FF",
      SELF_MASK_B => B"111" & X"FF",
      USE_EXT_CE_A => "FALSE",
      USE_EXT_CE_B => "FALSE"
    )
        port map (
      ADDR_A(22 downto 6) => B"00000000000000000",
      ADDR_A(5 downto 0) => addrb(5 downto 0),
      ADDR_B(22 downto 6) => B"00000000000000000",
      ADDR_B(5 downto 0) => addra(5 downto 0),
      BWE_A(8 downto 0) => B"111111111",
      BWE_B(8) => wea(0),
      BWE_B(7) => wea(0),
      BWE_B(6) => wea(0),
      BWE_B(5) => wea(0),
      BWE_B(4) => wea(0),
      BWE_B(3) => wea(0),
      BWE_B(2) => wea(0),
      BWE_B(1) => wea(0),
      BWE_B(0) => wea(0),
      CAS_IN_ADDR_A(22 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_IN_ADDR_A_UNCONNECTED\(22 downto 0),
      CAS_IN_ADDR_B(22 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_IN_ADDR_B_UNCONNECTED\(22 downto 0),
      CAS_IN_BWE_A(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_IN_BWE_A_UNCONNECTED\(8 downto 0),
      CAS_IN_BWE_B(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_IN_BWE_B_UNCONNECTED\(8 downto 0),
      CAS_IN_DBITERR_A => '0',
      CAS_IN_DBITERR_B => '0',
      CAS_IN_DIN_A(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_IN_DIN_A_UNCONNECTED\(71 downto 0),
      CAS_IN_DIN_B(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_IN_DIN_B_UNCONNECTED\(71 downto 0),
      CAS_IN_DOUT_A(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_IN_DOUT_A_UNCONNECTED\(71 downto 0),
      CAS_IN_DOUT_B(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_IN_DOUT_B_UNCONNECTED\(71 downto 0),
      CAS_IN_EN_A => '0',
      CAS_IN_EN_B => '0',
      CAS_IN_RDACCESS_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_IN_RDACCESS_A_UNCONNECTED\,
      CAS_IN_RDACCESS_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_IN_RDACCESS_B_UNCONNECTED\,
      CAS_IN_RDB_WR_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_IN_RDB_WR_A_UNCONNECTED\,
      CAS_IN_RDB_WR_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_IN_RDB_WR_B_UNCONNECTED\,
      CAS_IN_SBITERR_A => '0',
      CAS_IN_SBITERR_B => '0',
      CAS_OUT_ADDR_A(22 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_ADDR_A_UNCONNECTED\(22 downto 0),
      CAS_OUT_ADDR_B(22 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_ADDR_B_UNCONNECTED\(22 downto 0),
      CAS_OUT_BWE_A(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_BWE_A_UNCONNECTED\(8 downto 0),
      CAS_OUT_BWE_B(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_BWE_B_UNCONNECTED\(8 downto 0),
      CAS_OUT_DBITERR_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_DBITERR_A_UNCONNECTED\,
      CAS_OUT_DBITERR_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_DBITERR_B_UNCONNECTED\,
      CAS_OUT_DIN_A(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_DIN_A_UNCONNECTED\(71 downto 0),
      CAS_OUT_DIN_B(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_DIN_B_UNCONNECTED\(71 downto 0),
      CAS_OUT_DOUT_A(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_DOUT_A_UNCONNECTED\(71 downto 0),
      CAS_OUT_DOUT_B(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_DOUT_B_UNCONNECTED\(71 downto 0),
      CAS_OUT_EN_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_EN_A_UNCONNECTED\,
      CAS_OUT_EN_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_EN_B_UNCONNECTED\,
      CAS_OUT_RDACCESS_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_RDACCESS_A_UNCONNECTED\,
      CAS_OUT_RDACCESS_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_RDACCESS_B_UNCONNECTED\,
      CAS_OUT_RDB_WR_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_RDB_WR_A_UNCONNECTED\,
      CAS_OUT_RDB_WR_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_RDB_WR_B_UNCONNECTED\,
      CAS_OUT_SBITERR_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_SBITERR_A_UNCONNECTED\,
      CAS_OUT_SBITERR_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_SBITERR_B_UNCONNECTED\,
      CLK => clka,
      DBITERR_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_DBITERR_A_UNCONNECTED\,
      DBITERR_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_DBITERR_B_UNCONNECTED\,
      DIN_A(71 downto 0) => B"000000000000000000000000000000000000000000000000000000000000000000000000",
      DIN_B(71 downto 0) => dina(71 downto 0),
      DOUT_A(71 downto 0) => \gen_rd_b.doutb_reg\(71 downto 0),
      DOUT_B(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_DOUT_B_UNCONNECTED\(71 downto 0),
      EN_A => enb,
      EN_B => '1',
      INJECT_DBITERR_A => '0',
      INJECT_DBITERR_B => '0',
      INJECT_SBITERR_A => '0',
      INJECT_SBITERR_B => '0',
      OREG_CE_A => '1',
      OREG_CE_B => '1',
      OREG_ECC_CE_A => '1',
      OREG_ECC_CE_B => '1',
      RDACCESS_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_RDACCESS_A_UNCONNECTED\,
      RDACCESS_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_RDACCESS_B_UNCONNECTED\,
      RDB_WR_A => '0',
      RDB_WR_B => '1',
      RST_A => '0',
      RST_B => '0',
      SBITERR_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_SBITERR_A_UNCONNECTED\,
      SBITERR_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_SBITERR_B_UNCONNECTED\,
      SLEEP => '0'
    );
\gen_wr_a.gen_word_narrow.mem_reg_uram_1\: unisim.vcomponents.URAM288
    generic map(
      AVG_CONS_INACTIVE_CYCLES => 10,
      BWE_MODE_A => "PARITY_INDEPENDENT",
      BWE_MODE_B => "PARITY_INDEPENDENT",
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "NONE",
      EN_ECC_RD_A => "FALSE",
      EN_ECC_RD_B => "FALSE",
      EN_ECC_WR_A => "FALSE",
      EN_ECC_WR_B => "FALSE",
      IREG_PRE_A => "FALSE",
      IREG_PRE_B => "FALSE",
      IS_CLK_INVERTED => '0',
      IS_EN_A_INVERTED => '0',
      IS_EN_B_INVERTED => '0',
      IS_RDB_WR_A_INVERTED => '0',
      IS_RDB_WR_B_INVERTED => '0',
      IS_RST_A_INVERTED => '0',
      IS_RST_B_INVERTED => '0',
      MATRIX_ID => "gen_wr_a.gen_word_narrow.mem_reg_B4_M1",
      NUM_UNIQUE_SELF_ADDR_A => 1,
      NUM_UNIQUE_SELF_ADDR_B => 1,
      NUM_URAM_IN_MATRIX => 1,
      OREG_A => "FALSE",
      OREG_B => "FALSE",
      OREG_ECC_A => "FALSE",
      OREG_ECC_B => "FALSE",
      REG_CAS_A => "FALSE",
      REG_CAS_B => "FALSE",
      RST_MODE_A => "SYNC",
      RST_MODE_B => "SYNC",
      SELF_ADDR_A => B"000" & X"00",
      SELF_ADDR_B => B"000" & X"00",
      SELF_MASK_A => B"111" & X"FF",
      SELF_MASK_B => B"111" & X"FF",
      USE_EXT_CE_A => "FALSE",
      USE_EXT_CE_B => "FALSE"
    )
        port map (
      ADDR_A(22 downto 6) => B"00000000000000000",
      ADDR_A(5 downto 0) => addrb(5 downto 0),
      ADDR_B(22 downto 6) => B"00000000000000000",
      ADDR_B(5 downto 0) => addra(5 downto 0),
      BWE_A(8 downto 0) => B"111111111",
      BWE_B(8) => wea(0),
      BWE_B(7) => wea(0),
      BWE_B(6) => wea(0),
      BWE_B(5) => wea(0),
      BWE_B(4) => wea(0),
      BWE_B(3) => wea(0),
      BWE_B(2) => wea(0),
      BWE_B(1) => wea(0),
      BWE_B(0) => wea(0),
      CAS_IN_ADDR_A(22 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_IN_ADDR_A_UNCONNECTED\(22 downto 0),
      CAS_IN_ADDR_B(22 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_IN_ADDR_B_UNCONNECTED\(22 downto 0),
      CAS_IN_BWE_A(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_IN_BWE_A_UNCONNECTED\(8 downto 0),
      CAS_IN_BWE_B(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_IN_BWE_B_UNCONNECTED\(8 downto 0),
      CAS_IN_DBITERR_A => '0',
      CAS_IN_DBITERR_B => '0',
      CAS_IN_DIN_A(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_IN_DIN_A_UNCONNECTED\(71 downto 0),
      CAS_IN_DIN_B(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_IN_DIN_B_UNCONNECTED\(71 downto 0),
      CAS_IN_DOUT_A(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_IN_DOUT_A_UNCONNECTED\(71 downto 0),
      CAS_IN_DOUT_B(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_IN_DOUT_B_UNCONNECTED\(71 downto 0),
      CAS_IN_EN_A => '0',
      CAS_IN_EN_B => '0',
      CAS_IN_RDACCESS_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_IN_RDACCESS_A_UNCONNECTED\,
      CAS_IN_RDACCESS_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_IN_RDACCESS_B_UNCONNECTED\,
      CAS_IN_RDB_WR_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_IN_RDB_WR_A_UNCONNECTED\,
      CAS_IN_RDB_WR_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_IN_RDB_WR_B_UNCONNECTED\,
      CAS_IN_SBITERR_A => '0',
      CAS_IN_SBITERR_B => '0',
      CAS_OUT_ADDR_A(22 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_ADDR_A_UNCONNECTED\(22 downto 0),
      CAS_OUT_ADDR_B(22 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_ADDR_B_UNCONNECTED\(22 downto 0),
      CAS_OUT_BWE_A(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_BWE_A_UNCONNECTED\(8 downto 0),
      CAS_OUT_BWE_B(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_BWE_B_UNCONNECTED\(8 downto 0),
      CAS_OUT_DBITERR_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_DBITERR_A_UNCONNECTED\,
      CAS_OUT_DBITERR_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_DBITERR_B_UNCONNECTED\,
      CAS_OUT_DIN_A(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_DIN_A_UNCONNECTED\(71 downto 0),
      CAS_OUT_DIN_B(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_DIN_B_UNCONNECTED\(71 downto 0),
      CAS_OUT_DOUT_A(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_DOUT_A_UNCONNECTED\(71 downto 0),
      CAS_OUT_DOUT_B(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_DOUT_B_UNCONNECTED\(71 downto 0),
      CAS_OUT_EN_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_EN_A_UNCONNECTED\,
      CAS_OUT_EN_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_EN_B_UNCONNECTED\,
      CAS_OUT_RDACCESS_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_RDACCESS_A_UNCONNECTED\,
      CAS_OUT_RDACCESS_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_RDACCESS_B_UNCONNECTED\,
      CAS_OUT_RDB_WR_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_RDB_WR_A_UNCONNECTED\,
      CAS_OUT_RDB_WR_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_RDB_WR_B_UNCONNECTED\,
      CAS_OUT_SBITERR_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_SBITERR_A_UNCONNECTED\,
      CAS_OUT_SBITERR_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_SBITERR_B_UNCONNECTED\,
      CLK => clka,
      DBITERR_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_DBITERR_A_UNCONNECTED\,
      DBITERR_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_DBITERR_B_UNCONNECTED\,
      DIN_A(71 downto 0) => B"000000000000000000000000000000000000000000000000000000000000000000000000",
      DIN_B(71 downto 0) => dina(143 downto 72),
      DOUT_A(71 downto 0) => \gen_rd_b.doutb_reg\(143 downto 72),
      DOUT_B(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_DOUT_B_UNCONNECTED\(71 downto 0),
      EN_A => enb,
      EN_B => '1',
      INJECT_DBITERR_A => '0',
      INJECT_DBITERR_B => '0',
      INJECT_SBITERR_A => '0',
      INJECT_SBITERR_B => '0',
      OREG_CE_A => '1',
      OREG_CE_B => '1',
      OREG_ECC_CE_A => '1',
      OREG_ECC_CE_B => '1',
      RDACCESS_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_RDACCESS_A_UNCONNECTED\,
      RDACCESS_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_RDACCESS_B_UNCONNECTED\,
      RDB_WR_A => '0',
      RDB_WR_B => '1',
      RST_A => '0',
      RST_B => '0',
      SBITERR_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_SBITERR_A_UNCONNECTED\,
      SBITERR_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_SBITERR_B_UNCONNECTED\,
      SLEEP => '0'
    );
\gen_wr_a.gen_word_narrow.mem_reg_uram_2\: unisim.vcomponents.URAM288
    generic map(
      AVG_CONS_INACTIVE_CYCLES => 10,
      BWE_MODE_A => "PARITY_INDEPENDENT",
      BWE_MODE_B => "PARITY_INDEPENDENT",
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "NONE",
      EN_ECC_RD_A => "FALSE",
      EN_ECC_RD_B => "FALSE",
      EN_ECC_WR_A => "FALSE",
      EN_ECC_WR_B => "FALSE",
      IREG_PRE_A => "FALSE",
      IREG_PRE_B => "FALSE",
      IS_CLK_INVERTED => '0',
      IS_EN_A_INVERTED => '0',
      IS_EN_B_INVERTED => '0',
      IS_RDB_WR_A_INVERTED => '0',
      IS_RDB_WR_B_INVERTED => '0',
      IS_RST_A_INVERTED => '0',
      IS_RST_B_INVERTED => '0',
      MATRIX_ID => "gen_wr_a.gen_word_narrow.mem_reg_B4_M2",
      NUM_UNIQUE_SELF_ADDR_A => 1,
      NUM_UNIQUE_SELF_ADDR_B => 1,
      NUM_URAM_IN_MATRIX => 1,
      OREG_A => "FALSE",
      OREG_B => "FALSE",
      OREG_ECC_A => "FALSE",
      OREG_ECC_B => "FALSE",
      REG_CAS_A => "FALSE",
      REG_CAS_B => "FALSE",
      RST_MODE_A => "SYNC",
      RST_MODE_B => "SYNC",
      SELF_ADDR_A => B"000" & X"00",
      SELF_ADDR_B => B"000" & X"00",
      SELF_MASK_A => B"111" & X"FF",
      SELF_MASK_B => B"111" & X"FF",
      USE_EXT_CE_A => "FALSE",
      USE_EXT_CE_B => "FALSE"
    )
        port map (
      ADDR_A(22 downto 6) => B"00000000000000000",
      ADDR_A(5 downto 0) => addrb(5 downto 0),
      ADDR_B(22 downto 6) => B"00000000000000000",
      ADDR_B(5 downto 0) => addra(5 downto 0),
      BWE_A(8 downto 0) => B"111111111",
      BWE_B(8) => wea(0),
      BWE_B(7) => wea(0),
      BWE_B(6) => wea(0),
      BWE_B(5) => wea(0),
      BWE_B(4) => wea(0),
      BWE_B(3) => wea(0),
      BWE_B(2) => wea(0),
      BWE_B(1) => wea(0),
      BWE_B(0) => wea(0),
      CAS_IN_ADDR_A(22 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_IN_ADDR_A_UNCONNECTED\(22 downto 0),
      CAS_IN_ADDR_B(22 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_IN_ADDR_B_UNCONNECTED\(22 downto 0),
      CAS_IN_BWE_A(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_IN_BWE_A_UNCONNECTED\(8 downto 0),
      CAS_IN_BWE_B(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_IN_BWE_B_UNCONNECTED\(8 downto 0),
      CAS_IN_DBITERR_A => '0',
      CAS_IN_DBITERR_B => '0',
      CAS_IN_DIN_A(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_IN_DIN_A_UNCONNECTED\(71 downto 0),
      CAS_IN_DIN_B(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_IN_DIN_B_UNCONNECTED\(71 downto 0),
      CAS_IN_DOUT_A(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_IN_DOUT_A_UNCONNECTED\(71 downto 0),
      CAS_IN_DOUT_B(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_IN_DOUT_B_UNCONNECTED\(71 downto 0),
      CAS_IN_EN_A => '0',
      CAS_IN_EN_B => '0',
      CAS_IN_RDACCESS_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_IN_RDACCESS_A_UNCONNECTED\,
      CAS_IN_RDACCESS_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_IN_RDACCESS_B_UNCONNECTED\,
      CAS_IN_RDB_WR_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_IN_RDB_WR_A_UNCONNECTED\,
      CAS_IN_RDB_WR_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_IN_RDB_WR_B_UNCONNECTED\,
      CAS_IN_SBITERR_A => '0',
      CAS_IN_SBITERR_B => '0',
      CAS_OUT_ADDR_A(22 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_OUT_ADDR_A_UNCONNECTED\(22 downto 0),
      CAS_OUT_ADDR_B(22 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_OUT_ADDR_B_UNCONNECTED\(22 downto 0),
      CAS_OUT_BWE_A(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_OUT_BWE_A_UNCONNECTED\(8 downto 0),
      CAS_OUT_BWE_B(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_OUT_BWE_B_UNCONNECTED\(8 downto 0),
      CAS_OUT_DBITERR_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_OUT_DBITERR_A_UNCONNECTED\,
      CAS_OUT_DBITERR_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_OUT_DBITERR_B_UNCONNECTED\,
      CAS_OUT_DIN_A(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_OUT_DIN_A_UNCONNECTED\(71 downto 0),
      CAS_OUT_DIN_B(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_OUT_DIN_B_UNCONNECTED\(71 downto 0),
      CAS_OUT_DOUT_A(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_OUT_DOUT_A_UNCONNECTED\(71 downto 0),
      CAS_OUT_DOUT_B(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_OUT_DOUT_B_UNCONNECTED\(71 downto 0),
      CAS_OUT_EN_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_OUT_EN_A_UNCONNECTED\,
      CAS_OUT_EN_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_OUT_EN_B_UNCONNECTED\,
      CAS_OUT_RDACCESS_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_OUT_RDACCESS_A_UNCONNECTED\,
      CAS_OUT_RDACCESS_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_OUT_RDACCESS_B_UNCONNECTED\,
      CAS_OUT_RDB_WR_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_OUT_RDB_WR_A_UNCONNECTED\,
      CAS_OUT_RDB_WR_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_OUT_RDB_WR_B_UNCONNECTED\,
      CAS_OUT_SBITERR_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_OUT_SBITERR_A_UNCONNECTED\,
      CAS_OUT_SBITERR_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_CAS_OUT_SBITERR_B_UNCONNECTED\,
      CLK => clka,
      DBITERR_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_DBITERR_A_UNCONNECTED\,
      DBITERR_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_DBITERR_B_UNCONNECTED\,
      DIN_A(71 downto 0) => B"000000000000000000000000000000000000000000000000000000000000000000000000",
      DIN_B(71 downto 0) => dina(215 downto 144),
      DOUT_A(71 downto 0) => \gen_rd_b.doutb_reg\(215 downto 144),
      DOUT_B(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_DOUT_B_UNCONNECTED\(71 downto 0),
      EN_A => enb,
      EN_B => '1',
      INJECT_DBITERR_A => '0',
      INJECT_DBITERR_B => '0',
      INJECT_SBITERR_A => '0',
      INJECT_SBITERR_B => '0',
      OREG_CE_A => '1',
      OREG_CE_B => '1',
      OREG_ECC_CE_A => '1',
      OREG_ECC_CE_B => '1',
      RDACCESS_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_RDACCESS_A_UNCONNECTED\,
      RDACCESS_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_RDACCESS_B_UNCONNECTED\,
      RDB_WR_A => '0',
      RDB_WR_B => '1',
      RST_A => '0',
      RST_B => '0',
      SBITERR_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_SBITERR_A_UNCONNECTED\,
      SBITERR_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_SBITERR_B_UNCONNECTED\,
      SLEEP => '0'
    );
\gen_wr_a.gen_word_narrow.mem_reg_uram_3\: unisim.vcomponents.URAM288
    generic map(
      AVG_CONS_INACTIVE_CYCLES => 10,
      BWE_MODE_A => "PARITY_INDEPENDENT",
      BWE_MODE_B => "PARITY_INDEPENDENT",
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "NONE",
      EN_ECC_RD_A => "FALSE",
      EN_ECC_RD_B => "FALSE",
      EN_ECC_WR_A => "FALSE",
      EN_ECC_WR_B => "FALSE",
      IREG_PRE_A => "FALSE",
      IREG_PRE_B => "FALSE",
      IS_CLK_INVERTED => '0',
      IS_EN_A_INVERTED => '0',
      IS_EN_B_INVERTED => '0',
      IS_RDB_WR_A_INVERTED => '0',
      IS_RDB_WR_B_INVERTED => '0',
      IS_RST_A_INVERTED => '0',
      IS_RST_B_INVERTED => '0',
      MATRIX_ID => "gen_wr_a.gen_word_narrow.mem_reg_B4_M3",
      NUM_UNIQUE_SELF_ADDR_A => 1,
      NUM_UNIQUE_SELF_ADDR_B => 1,
      NUM_URAM_IN_MATRIX => 1,
      OREG_A => "FALSE",
      OREG_B => "FALSE",
      OREG_ECC_A => "FALSE",
      OREG_ECC_B => "FALSE",
      REG_CAS_A => "FALSE",
      REG_CAS_B => "FALSE",
      RST_MODE_A => "SYNC",
      RST_MODE_B => "SYNC",
      SELF_ADDR_A => B"000" & X"00",
      SELF_ADDR_B => B"000" & X"00",
      SELF_MASK_A => B"111" & X"FF",
      SELF_MASK_B => B"111" & X"FF",
      USE_EXT_CE_A => "FALSE",
      USE_EXT_CE_B => "FALSE"
    )
        port map (
      ADDR_A(22 downto 6) => B"00000000000000000",
      ADDR_A(5 downto 0) => addrb(5 downto 0),
      ADDR_B(22 downto 6) => B"00000000000000000",
      ADDR_B(5 downto 0) => addra(5 downto 0),
      BWE_A(8 downto 0) => B"111111111",
      BWE_B(8) => wea(0),
      BWE_B(7) => wea(0),
      BWE_B(6) => wea(0),
      BWE_B(5) => wea(0),
      BWE_B(4) => wea(0),
      BWE_B(3) => wea(0),
      BWE_B(2) => wea(0),
      BWE_B(1) => wea(0),
      BWE_B(0) => wea(0),
      CAS_IN_ADDR_A(22 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_IN_ADDR_A_UNCONNECTED\(22 downto 0),
      CAS_IN_ADDR_B(22 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_IN_ADDR_B_UNCONNECTED\(22 downto 0),
      CAS_IN_BWE_A(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_IN_BWE_A_UNCONNECTED\(8 downto 0),
      CAS_IN_BWE_B(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_IN_BWE_B_UNCONNECTED\(8 downto 0),
      CAS_IN_DBITERR_A => '0',
      CAS_IN_DBITERR_B => '0',
      CAS_IN_DIN_A(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_IN_DIN_A_UNCONNECTED\(71 downto 0),
      CAS_IN_DIN_B(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_IN_DIN_B_UNCONNECTED\(71 downto 0),
      CAS_IN_DOUT_A(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_IN_DOUT_A_UNCONNECTED\(71 downto 0),
      CAS_IN_DOUT_B(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_IN_DOUT_B_UNCONNECTED\(71 downto 0),
      CAS_IN_EN_A => '0',
      CAS_IN_EN_B => '0',
      CAS_IN_RDACCESS_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_IN_RDACCESS_A_UNCONNECTED\,
      CAS_IN_RDACCESS_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_IN_RDACCESS_B_UNCONNECTED\,
      CAS_IN_RDB_WR_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_IN_RDB_WR_A_UNCONNECTED\,
      CAS_IN_RDB_WR_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_IN_RDB_WR_B_UNCONNECTED\,
      CAS_IN_SBITERR_A => '0',
      CAS_IN_SBITERR_B => '0',
      CAS_OUT_ADDR_A(22 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_ADDR_A_UNCONNECTED\(22 downto 0),
      CAS_OUT_ADDR_B(22 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_ADDR_B_UNCONNECTED\(22 downto 0),
      CAS_OUT_BWE_A(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_BWE_A_UNCONNECTED\(8 downto 0),
      CAS_OUT_BWE_B(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_BWE_B_UNCONNECTED\(8 downto 0),
      CAS_OUT_DBITERR_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_DBITERR_A_UNCONNECTED\,
      CAS_OUT_DBITERR_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_DBITERR_B_UNCONNECTED\,
      CAS_OUT_DIN_A(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_DIN_A_UNCONNECTED\(71 downto 0),
      CAS_OUT_DIN_B(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_DIN_B_UNCONNECTED\(71 downto 0),
      CAS_OUT_DOUT_A(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_DOUT_A_UNCONNECTED\(71 downto 0),
      CAS_OUT_DOUT_B(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_DOUT_B_UNCONNECTED\(71 downto 0),
      CAS_OUT_EN_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_EN_A_UNCONNECTED\,
      CAS_OUT_EN_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_EN_B_UNCONNECTED\,
      CAS_OUT_RDACCESS_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_RDACCESS_A_UNCONNECTED\,
      CAS_OUT_RDACCESS_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_RDACCESS_B_UNCONNECTED\,
      CAS_OUT_RDB_WR_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_RDB_WR_A_UNCONNECTED\,
      CAS_OUT_RDB_WR_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_RDB_WR_B_UNCONNECTED\,
      CAS_OUT_SBITERR_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_SBITERR_A_UNCONNECTED\,
      CAS_OUT_SBITERR_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_SBITERR_B_UNCONNECTED\,
      CLK => clka,
      DBITERR_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_DBITERR_A_UNCONNECTED\,
      DBITERR_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_DBITERR_B_UNCONNECTED\,
      DIN_A(71 downto 0) => B"000000000000000000000000000000000000000000000000000000000000000000000000",
      DIN_B(71 downto 0) => dina(287 downto 216),
      DOUT_A(71 downto 0) => \gen_rd_b.doutb_reg\(287 downto 216),
      DOUT_B(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_DOUT_B_UNCONNECTED\(71 downto 0),
      EN_A => enb,
      EN_B => '1',
      INJECT_DBITERR_A => '0',
      INJECT_DBITERR_B => '0',
      INJECT_SBITERR_A => '0',
      INJECT_SBITERR_B => '0',
      OREG_CE_A => '1',
      OREG_CE_B => '1',
      OREG_ECC_CE_A => '1',
      OREG_ECC_CE_B => '1',
      RDACCESS_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_RDACCESS_A_UNCONNECTED\,
      RDACCESS_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_RDACCESS_B_UNCONNECTED\,
      RDB_WR_A => '0',
      RDB_WR_B => '1',
      RST_A => '0',
      RST_B => '0',
      SBITERR_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_SBITERR_A_UNCONNECTED\,
      SBITERR_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_SBITERR_B_UNCONNECTED\,
      SLEEP => '0'
    );
\gen_wr_a.gen_word_narrow.mem_reg_uram_4\: unisim.vcomponents.URAM288
    generic map(
      AVG_CONS_INACTIVE_CYCLES => 10,
      BWE_MODE_A => "PARITY_INDEPENDENT",
      BWE_MODE_B => "PARITY_INDEPENDENT",
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "NONE",
      EN_ECC_RD_A => "FALSE",
      EN_ECC_RD_B => "FALSE",
      EN_ECC_WR_A => "FALSE",
      EN_ECC_WR_B => "FALSE",
      IREG_PRE_A => "FALSE",
      IREG_PRE_B => "FALSE",
      IS_CLK_INVERTED => '0',
      IS_EN_A_INVERTED => '0',
      IS_EN_B_INVERTED => '0',
      IS_RDB_WR_A_INVERTED => '0',
      IS_RDB_WR_B_INVERTED => '0',
      IS_RST_A_INVERTED => '0',
      IS_RST_B_INVERTED => '0',
      MATRIX_ID => "gen_wr_a.gen_word_narrow.mem_reg_B4_M4",
      NUM_UNIQUE_SELF_ADDR_A => 1,
      NUM_UNIQUE_SELF_ADDR_B => 1,
      NUM_URAM_IN_MATRIX => 1,
      OREG_A => "FALSE",
      OREG_B => "FALSE",
      OREG_ECC_A => "FALSE",
      OREG_ECC_B => "FALSE",
      REG_CAS_A => "FALSE",
      REG_CAS_B => "FALSE",
      RST_MODE_A => "SYNC",
      RST_MODE_B => "SYNC",
      SELF_ADDR_A => B"000" & X"00",
      SELF_ADDR_B => B"000" & X"00",
      SELF_MASK_A => B"111" & X"FF",
      SELF_MASK_B => B"111" & X"FF",
      USE_EXT_CE_A => "FALSE",
      USE_EXT_CE_B => "FALSE"
    )
        port map (
      ADDR_A(22 downto 6) => B"00000000000000000",
      ADDR_A(5 downto 0) => addrb(5 downto 0),
      ADDR_B(22 downto 6) => B"00000000000000000",
      ADDR_B(5 downto 0) => addra(5 downto 0),
      BWE_A(8 downto 0) => B"111111111",
      BWE_B(8) => wea(0),
      BWE_B(7) => wea(0),
      BWE_B(6) => wea(0),
      BWE_B(5) => wea(0),
      BWE_B(4) => wea(0),
      BWE_B(3) => wea(0),
      BWE_B(2) => wea(0),
      BWE_B(1) => wea(0),
      BWE_B(0) => wea(0),
      CAS_IN_ADDR_A(22 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_IN_ADDR_A_UNCONNECTED\(22 downto 0),
      CAS_IN_ADDR_B(22 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_IN_ADDR_B_UNCONNECTED\(22 downto 0),
      CAS_IN_BWE_A(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_IN_BWE_A_UNCONNECTED\(8 downto 0),
      CAS_IN_BWE_B(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_IN_BWE_B_UNCONNECTED\(8 downto 0),
      CAS_IN_DBITERR_A => '0',
      CAS_IN_DBITERR_B => '0',
      CAS_IN_DIN_A(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_IN_DIN_A_UNCONNECTED\(71 downto 0),
      CAS_IN_DIN_B(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_IN_DIN_B_UNCONNECTED\(71 downto 0),
      CAS_IN_DOUT_A(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_IN_DOUT_A_UNCONNECTED\(71 downto 0),
      CAS_IN_DOUT_B(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_IN_DOUT_B_UNCONNECTED\(71 downto 0),
      CAS_IN_EN_A => '0',
      CAS_IN_EN_B => '0',
      CAS_IN_RDACCESS_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_IN_RDACCESS_A_UNCONNECTED\,
      CAS_IN_RDACCESS_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_IN_RDACCESS_B_UNCONNECTED\,
      CAS_IN_RDB_WR_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_IN_RDB_WR_A_UNCONNECTED\,
      CAS_IN_RDB_WR_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_IN_RDB_WR_B_UNCONNECTED\,
      CAS_IN_SBITERR_A => '0',
      CAS_IN_SBITERR_B => '0',
      CAS_OUT_ADDR_A(22 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_OUT_ADDR_A_UNCONNECTED\(22 downto 0),
      CAS_OUT_ADDR_B(22 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_OUT_ADDR_B_UNCONNECTED\(22 downto 0),
      CAS_OUT_BWE_A(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_OUT_BWE_A_UNCONNECTED\(8 downto 0),
      CAS_OUT_BWE_B(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_OUT_BWE_B_UNCONNECTED\(8 downto 0),
      CAS_OUT_DBITERR_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_OUT_DBITERR_A_UNCONNECTED\,
      CAS_OUT_DBITERR_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_OUT_DBITERR_B_UNCONNECTED\,
      CAS_OUT_DIN_A(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_OUT_DIN_A_UNCONNECTED\(71 downto 0),
      CAS_OUT_DIN_B(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_OUT_DIN_B_UNCONNECTED\(71 downto 0),
      CAS_OUT_DOUT_A(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_OUT_DOUT_A_UNCONNECTED\(71 downto 0),
      CAS_OUT_DOUT_B(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_OUT_DOUT_B_UNCONNECTED\(71 downto 0),
      CAS_OUT_EN_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_OUT_EN_A_UNCONNECTED\,
      CAS_OUT_EN_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_OUT_EN_B_UNCONNECTED\,
      CAS_OUT_RDACCESS_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_OUT_RDACCESS_A_UNCONNECTED\,
      CAS_OUT_RDACCESS_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_OUT_RDACCESS_B_UNCONNECTED\,
      CAS_OUT_RDB_WR_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_OUT_RDB_WR_A_UNCONNECTED\,
      CAS_OUT_RDB_WR_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_OUT_RDB_WR_B_UNCONNECTED\,
      CAS_OUT_SBITERR_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_OUT_SBITERR_A_UNCONNECTED\,
      CAS_OUT_SBITERR_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_CAS_OUT_SBITERR_B_UNCONNECTED\,
      CLK => clka,
      DBITERR_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_DBITERR_A_UNCONNECTED\,
      DBITERR_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_DBITERR_B_UNCONNECTED\,
      DIN_A(71 downto 0) => B"000000000000000000000000000000000000000000000000000000000000000000000000",
      DIN_B(71 downto 0) => dina(359 downto 288),
      DOUT_A(71 downto 0) => \gen_rd_b.doutb_reg\(359 downto 288),
      DOUT_B(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_DOUT_B_UNCONNECTED\(71 downto 0),
      EN_A => enb,
      EN_B => '1',
      INJECT_DBITERR_A => '0',
      INJECT_DBITERR_B => '0',
      INJECT_SBITERR_A => '0',
      INJECT_SBITERR_B => '0',
      OREG_CE_A => '1',
      OREG_CE_B => '1',
      OREG_ECC_CE_A => '1',
      OREG_ECC_CE_B => '1',
      RDACCESS_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_RDACCESS_A_UNCONNECTED\,
      RDACCESS_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_RDACCESS_B_UNCONNECTED\,
      RDB_WR_A => '0',
      RDB_WR_B => '1',
      RST_A => '0',
      RST_B => '0',
      SBITERR_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_SBITERR_A_UNCONNECTED\,
      SBITERR_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_4_SBITERR_B_UNCONNECTED\,
      SLEEP => '0'
    );
\gen_wr_a.gen_word_narrow.mem_reg_uram_5\: unisim.vcomponents.URAM288
    generic map(
      AVG_CONS_INACTIVE_CYCLES => 10,
      BWE_MODE_A => "PARITY_INDEPENDENT",
      BWE_MODE_B => "PARITY_INDEPENDENT",
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "NONE",
      EN_ECC_RD_A => "FALSE",
      EN_ECC_RD_B => "FALSE",
      EN_ECC_WR_A => "FALSE",
      EN_ECC_WR_B => "FALSE",
      IREG_PRE_A => "FALSE",
      IREG_PRE_B => "FALSE",
      IS_CLK_INVERTED => '0',
      IS_EN_A_INVERTED => '0',
      IS_EN_B_INVERTED => '0',
      IS_RDB_WR_A_INVERTED => '0',
      IS_RDB_WR_B_INVERTED => '0',
      IS_RST_A_INVERTED => '0',
      IS_RST_B_INVERTED => '0',
      MATRIX_ID => "gen_wr_a.gen_word_narrow.mem_reg_B4_M5",
      NUM_UNIQUE_SELF_ADDR_A => 1,
      NUM_UNIQUE_SELF_ADDR_B => 1,
      NUM_URAM_IN_MATRIX => 1,
      OREG_A => "FALSE",
      OREG_B => "FALSE",
      OREG_ECC_A => "FALSE",
      OREG_ECC_B => "FALSE",
      REG_CAS_A => "FALSE",
      REG_CAS_B => "FALSE",
      RST_MODE_A => "SYNC",
      RST_MODE_B => "SYNC",
      SELF_ADDR_A => B"000" & X"00",
      SELF_ADDR_B => B"000" & X"00",
      SELF_MASK_A => B"111" & X"FF",
      SELF_MASK_B => B"111" & X"FF",
      USE_EXT_CE_A => "FALSE",
      USE_EXT_CE_B => "FALSE"
    )
        port map (
      ADDR_A(22 downto 6) => B"00000000000000000",
      ADDR_A(5 downto 0) => addrb(5 downto 0),
      ADDR_B(22 downto 6) => B"00000000000000000",
      ADDR_B(5 downto 0) => addra(5 downto 0),
      BWE_A(8 downto 0) => B"111111111",
      BWE_B(8) => wea(0),
      BWE_B(7) => wea(0),
      BWE_B(6) => wea(0),
      BWE_B(5) => wea(0),
      BWE_B(4) => wea(0),
      BWE_B(3) => wea(0),
      BWE_B(2) => wea(0),
      BWE_B(1) => wea(0),
      BWE_B(0) => wea(0),
      CAS_IN_ADDR_A(22 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_IN_ADDR_A_UNCONNECTED\(22 downto 0),
      CAS_IN_ADDR_B(22 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_IN_ADDR_B_UNCONNECTED\(22 downto 0),
      CAS_IN_BWE_A(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_IN_BWE_A_UNCONNECTED\(8 downto 0),
      CAS_IN_BWE_B(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_IN_BWE_B_UNCONNECTED\(8 downto 0),
      CAS_IN_DBITERR_A => '0',
      CAS_IN_DBITERR_B => '0',
      CAS_IN_DIN_A(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_IN_DIN_A_UNCONNECTED\(71 downto 0),
      CAS_IN_DIN_B(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_IN_DIN_B_UNCONNECTED\(71 downto 0),
      CAS_IN_DOUT_A(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_IN_DOUT_A_UNCONNECTED\(71 downto 0),
      CAS_IN_DOUT_B(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_IN_DOUT_B_UNCONNECTED\(71 downto 0),
      CAS_IN_EN_A => '0',
      CAS_IN_EN_B => '0',
      CAS_IN_RDACCESS_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_IN_RDACCESS_A_UNCONNECTED\,
      CAS_IN_RDACCESS_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_IN_RDACCESS_B_UNCONNECTED\,
      CAS_IN_RDB_WR_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_IN_RDB_WR_A_UNCONNECTED\,
      CAS_IN_RDB_WR_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_IN_RDB_WR_B_UNCONNECTED\,
      CAS_IN_SBITERR_A => '0',
      CAS_IN_SBITERR_B => '0',
      CAS_OUT_ADDR_A(22 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_OUT_ADDR_A_UNCONNECTED\(22 downto 0),
      CAS_OUT_ADDR_B(22 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_OUT_ADDR_B_UNCONNECTED\(22 downto 0),
      CAS_OUT_BWE_A(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_OUT_BWE_A_UNCONNECTED\(8 downto 0),
      CAS_OUT_BWE_B(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_OUT_BWE_B_UNCONNECTED\(8 downto 0),
      CAS_OUT_DBITERR_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_OUT_DBITERR_A_UNCONNECTED\,
      CAS_OUT_DBITERR_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_OUT_DBITERR_B_UNCONNECTED\,
      CAS_OUT_DIN_A(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_OUT_DIN_A_UNCONNECTED\(71 downto 0),
      CAS_OUT_DIN_B(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_OUT_DIN_B_UNCONNECTED\(71 downto 0),
      CAS_OUT_DOUT_A(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_OUT_DOUT_A_UNCONNECTED\(71 downto 0),
      CAS_OUT_DOUT_B(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_OUT_DOUT_B_UNCONNECTED\(71 downto 0),
      CAS_OUT_EN_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_OUT_EN_A_UNCONNECTED\,
      CAS_OUT_EN_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_OUT_EN_B_UNCONNECTED\,
      CAS_OUT_RDACCESS_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_OUT_RDACCESS_A_UNCONNECTED\,
      CAS_OUT_RDACCESS_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_OUT_RDACCESS_B_UNCONNECTED\,
      CAS_OUT_RDB_WR_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_OUT_RDB_WR_A_UNCONNECTED\,
      CAS_OUT_RDB_WR_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_OUT_RDB_WR_B_UNCONNECTED\,
      CAS_OUT_SBITERR_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_OUT_SBITERR_A_UNCONNECTED\,
      CAS_OUT_SBITERR_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_CAS_OUT_SBITERR_B_UNCONNECTED\,
      CLK => clka,
      DBITERR_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_DBITERR_A_UNCONNECTED\,
      DBITERR_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_DBITERR_B_UNCONNECTED\,
      DIN_A(71 downto 0) => B"000000000000000000000000000000000000000000000000000000000000000000000000",
      DIN_B(71 downto 0) => dina(431 downto 360),
      DOUT_A(71 downto 0) => \gen_rd_b.doutb_reg\(431 downto 360),
      DOUT_B(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_DOUT_B_UNCONNECTED\(71 downto 0),
      EN_A => enb,
      EN_B => '1',
      INJECT_DBITERR_A => '0',
      INJECT_DBITERR_B => '0',
      INJECT_SBITERR_A => '0',
      INJECT_SBITERR_B => '0',
      OREG_CE_A => '1',
      OREG_CE_B => '1',
      OREG_ECC_CE_A => '1',
      OREG_ECC_CE_B => '1',
      RDACCESS_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_RDACCESS_A_UNCONNECTED\,
      RDACCESS_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_RDACCESS_B_UNCONNECTED\,
      RDB_WR_A => '0',
      RDB_WR_B => '1',
      RST_A => '0',
      RST_B => '0',
      SBITERR_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_SBITERR_A_UNCONNECTED\,
      SBITERR_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_5_SBITERR_B_UNCONNECTED\,
      SLEEP => '0'
    );
\gen_wr_a.gen_word_narrow.mem_reg_uram_6\: unisim.vcomponents.URAM288
    generic map(
      AVG_CONS_INACTIVE_CYCLES => 10,
      BWE_MODE_A => "PARITY_INDEPENDENT",
      BWE_MODE_B => "PARITY_INDEPENDENT",
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "NONE",
      EN_ECC_RD_A => "FALSE",
      EN_ECC_RD_B => "FALSE",
      EN_ECC_WR_A => "FALSE",
      EN_ECC_WR_B => "FALSE",
      IREG_PRE_A => "FALSE",
      IREG_PRE_B => "FALSE",
      IS_CLK_INVERTED => '0',
      IS_EN_A_INVERTED => '0',
      IS_EN_B_INVERTED => '0',
      IS_RDB_WR_A_INVERTED => '0',
      IS_RDB_WR_B_INVERTED => '0',
      IS_RST_A_INVERTED => '0',
      IS_RST_B_INVERTED => '0',
      MATRIX_ID => "gen_wr_a.gen_word_narrow.mem_reg_B4_M6",
      NUM_UNIQUE_SELF_ADDR_A => 1,
      NUM_UNIQUE_SELF_ADDR_B => 1,
      NUM_URAM_IN_MATRIX => 1,
      OREG_A => "FALSE",
      OREG_B => "FALSE",
      OREG_ECC_A => "FALSE",
      OREG_ECC_B => "FALSE",
      REG_CAS_A => "FALSE",
      REG_CAS_B => "FALSE",
      RST_MODE_A => "SYNC",
      RST_MODE_B => "SYNC",
      SELF_ADDR_A => B"000" & X"00",
      SELF_ADDR_B => B"000" & X"00",
      SELF_MASK_A => B"111" & X"FF",
      SELF_MASK_B => B"111" & X"FF",
      USE_EXT_CE_A => "FALSE",
      USE_EXT_CE_B => "FALSE"
    )
        port map (
      ADDR_A(22 downto 6) => B"00000000000000000",
      ADDR_A(5 downto 0) => addrb(5 downto 0),
      ADDR_B(22 downto 6) => B"00000000000000000",
      ADDR_B(5 downto 0) => addra(5 downto 0),
      BWE_A(8 downto 0) => B"111111111",
      BWE_B(8) => wea(0),
      BWE_B(7) => wea(0),
      BWE_B(6) => wea(0),
      BWE_B(5) => wea(0),
      BWE_B(4) => wea(0),
      BWE_B(3) => wea(0),
      BWE_B(2) => wea(0),
      BWE_B(1) => wea(0),
      BWE_B(0) => wea(0),
      CAS_IN_ADDR_A(22 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_IN_ADDR_A_UNCONNECTED\(22 downto 0),
      CAS_IN_ADDR_B(22 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_IN_ADDR_B_UNCONNECTED\(22 downto 0),
      CAS_IN_BWE_A(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_IN_BWE_A_UNCONNECTED\(8 downto 0),
      CAS_IN_BWE_B(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_IN_BWE_B_UNCONNECTED\(8 downto 0),
      CAS_IN_DBITERR_A => '0',
      CAS_IN_DBITERR_B => '0',
      CAS_IN_DIN_A(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_IN_DIN_A_UNCONNECTED\(71 downto 0),
      CAS_IN_DIN_B(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_IN_DIN_B_UNCONNECTED\(71 downto 0),
      CAS_IN_DOUT_A(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_IN_DOUT_A_UNCONNECTED\(71 downto 0),
      CAS_IN_DOUT_B(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_IN_DOUT_B_UNCONNECTED\(71 downto 0),
      CAS_IN_EN_A => '0',
      CAS_IN_EN_B => '0',
      CAS_IN_RDACCESS_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_IN_RDACCESS_A_UNCONNECTED\,
      CAS_IN_RDACCESS_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_IN_RDACCESS_B_UNCONNECTED\,
      CAS_IN_RDB_WR_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_IN_RDB_WR_A_UNCONNECTED\,
      CAS_IN_RDB_WR_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_IN_RDB_WR_B_UNCONNECTED\,
      CAS_IN_SBITERR_A => '0',
      CAS_IN_SBITERR_B => '0',
      CAS_OUT_ADDR_A(22 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_OUT_ADDR_A_UNCONNECTED\(22 downto 0),
      CAS_OUT_ADDR_B(22 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_OUT_ADDR_B_UNCONNECTED\(22 downto 0),
      CAS_OUT_BWE_A(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_OUT_BWE_A_UNCONNECTED\(8 downto 0),
      CAS_OUT_BWE_B(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_OUT_BWE_B_UNCONNECTED\(8 downto 0),
      CAS_OUT_DBITERR_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_OUT_DBITERR_A_UNCONNECTED\,
      CAS_OUT_DBITERR_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_OUT_DBITERR_B_UNCONNECTED\,
      CAS_OUT_DIN_A(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_OUT_DIN_A_UNCONNECTED\(71 downto 0),
      CAS_OUT_DIN_B(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_OUT_DIN_B_UNCONNECTED\(71 downto 0),
      CAS_OUT_DOUT_A(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_OUT_DOUT_A_UNCONNECTED\(71 downto 0),
      CAS_OUT_DOUT_B(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_OUT_DOUT_B_UNCONNECTED\(71 downto 0),
      CAS_OUT_EN_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_OUT_EN_A_UNCONNECTED\,
      CAS_OUT_EN_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_OUT_EN_B_UNCONNECTED\,
      CAS_OUT_RDACCESS_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_OUT_RDACCESS_A_UNCONNECTED\,
      CAS_OUT_RDACCESS_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_OUT_RDACCESS_B_UNCONNECTED\,
      CAS_OUT_RDB_WR_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_OUT_RDB_WR_A_UNCONNECTED\,
      CAS_OUT_RDB_WR_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_OUT_RDB_WR_B_UNCONNECTED\,
      CAS_OUT_SBITERR_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_OUT_SBITERR_A_UNCONNECTED\,
      CAS_OUT_SBITERR_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_CAS_OUT_SBITERR_B_UNCONNECTED\,
      CLK => clka,
      DBITERR_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_DBITERR_A_UNCONNECTED\,
      DBITERR_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_DBITERR_B_UNCONNECTED\,
      DIN_A(71 downto 0) => B"000000000000000000000000000000000000000000000000000000000000000000000000",
      DIN_B(71 downto 0) => dina(503 downto 432),
      DOUT_A(71 downto 0) => \gen_rd_b.doutb_reg\(503 downto 432),
      DOUT_B(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_DOUT_B_UNCONNECTED\(71 downto 0),
      EN_A => enb,
      EN_B => '1',
      INJECT_DBITERR_A => '0',
      INJECT_DBITERR_B => '0',
      INJECT_SBITERR_A => '0',
      INJECT_SBITERR_B => '0',
      OREG_CE_A => '1',
      OREG_CE_B => '1',
      OREG_ECC_CE_A => '1',
      OREG_ECC_CE_B => '1',
      RDACCESS_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_RDACCESS_A_UNCONNECTED\,
      RDACCESS_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_RDACCESS_B_UNCONNECTED\,
      RDB_WR_A => '0',
      RDB_WR_B => '1',
      RST_A => '0',
      RST_B => '0',
      SBITERR_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_SBITERR_A_UNCONNECTED\,
      SBITERR_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_6_SBITERR_B_UNCONNECTED\,
      SLEEP => '0'
    );
\gen_wr_a.gen_word_narrow.mem_reg_uram_7\: unisim.vcomponents.URAM288
    generic map(
      AVG_CONS_INACTIVE_CYCLES => 10,
      BWE_MODE_A => "PARITY_INTERLEAVED",
      BWE_MODE_B => "PARITY_INTERLEAVED",
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "NONE",
      EN_ECC_RD_A => "FALSE",
      EN_ECC_RD_B => "FALSE",
      EN_ECC_WR_A => "FALSE",
      EN_ECC_WR_B => "FALSE",
      IREG_PRE_A => "FALSE",
      IREG_PRE_B => "FALSE",
      IS_CLK_INVERTED => '0',
      IS_EN_A_INVERTED => '0',
      IS_EN_B_INVERTED => '0',
      IS_RDB_WR_A_INVERTED => '0',
      IS_RDB_WR_B_INVERTED => '0',
      IS_RST_A_INVERTED => '0',
      IS_RST_B_INVERTED => '0',
      MATRIX_ID => "gen_wr_a.gen_word_narrow.mem_reg_B4_M7",
      NUM_UNIQUE_SELF_ADDR_A => 1,
      NUM_UNIQUE_SELF_ADDR_B => 1,
      NUM_URAM_IN_MATRIX => 1,
      OREG_A => "FALSE",
      OREG_B => "FALSE",
      OREG_ECC_A => "FALSE",
      OREG_ECC_B => "FALSE",
      REG_CAS_A => "FALSE",
      REG_CAS_B => "FALSE",
      RST_MODE_A => "SYNC",
      RST_MODE_B => "SYNC",
      SELF_ADDR_A => B"000" & X"00",
      SELF_ADDR_B => B"000" & X"00",
      SELF_MASK_A => B"111" & X"FF",
      SELF_MASK_B => B"111" & X"FF",
      USE_EXT_CE_A => "FALSE",
      USE_EXT_CE_B => "FALSE"
    )
        port map (
      ADDR_A(22 downto 6) => B"00000000000000000",
      ADDR_A(5 downto 0) => addrb(5 downto 0),
      ADDR_B(22 downto 6) => B"00000000000000000",
      ADDR_B(5 downto 0) => addra(5 downto 0),
      BWE_A(8 downto 0) => B"111111111",
      BWE_B(8) => '1',
      BWE_B(7) => wea(0),
      BWE_B(6) => wea(0),
      BWE_B(5) => wea(0),
      BWE_B(4) => wea(0),
      BWE_B(3) => wea(0),
      BWE_B(2) => wea(0),
      BWE_B(1) => wea(0),
      BWE_B(0) => wea(0),
      CAS_IN_ADDR_A(22 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_IN_ADDR_A_UNCONNECTED\(22 downto 0),
      CAS_IN_ADDR_B(22 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_IN_ADDR_B_UNCONNECTED\(22 downto 0),
      CAS_IN_BWE_A(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_IN_BWE_A_UNCONNECTED\(8 downto 0),
      CAS_IN_BWE_B(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_IN_BWE_B_UNCONNECTED\(8 downto 0),
      CAS_IN_DBITERR_A => '0',
      CAS_IN_DBITERR_B => '0',
      CAS_IN_DIN_A(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_IN_DIN_A_UNCONNECTED\(71 downto 0),
      CAS_IN_DIN_B(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_IN_DIN_B_UNCONNECTED\(71 downto 0),
      CAS_IN_DOUT_A(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_IN_DOUT_A_UNCONNECTED\(71 downto 0),
      CAS_IN_DOUT_B(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_IN_DOUT_B_UNCONNECTED\(71 downto 0),
      CAS_IN_EN_A => '0',
      CAS_IN_EN_B => '0',
      CAS_IN_RDACCESS_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_IN_RDACCESS_A_UNCONNECTED\,
      CAS_IN_RDACCESS_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_IN_RDACCESS_B_UNCONNECTED\,
      CAS_IN_RDB_WR_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_IN_RDB_WR_A_UNCONNECTED\,
      CAS_IN_RDB_WR_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_IN_RDB_WR_B_UNCONNECTED\,
      CAS_IN_SBITERR_A => '0',
      CAS_IN_SBITERR_B => '0',
      CAS_OUT_ADDR_A(22 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_OUT_ADDR_A_UNCONNECTED\(22 downto 0),
      CAS_OUT_ADDR_B(22 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_OUT_ADDR_B_UNCONNECTED\(22 downto 0),
      CAS_OUT_BWE_A(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_OUT_BWE_A_UNCONNECTED\(8 downto 0),
      CAS_OUT_BWE_B(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_OUT_BWE_B_UNCONNECTED\(8 downto 0),
      CAS_OUT_DBITERR_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_OUT_DBITERR_A_UNCONNECTED\,
      CAS_OUT_DBITERR_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_OUT_DBITERR_B_UNCONNECTED\,
      CAS_OUT_DIN_A(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_OUT_DIN_A_UNCONNECTED\(71 downto 0),
      CAS_OUT_DIN_B(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_OUT_DIN_B_UNCONNECTED\(71 downto 0),
      CAS_OUT_DOUT_A(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_OUT_DOUT_A_UNCONNECTED\(71 downto 0),
      CAS_OUT_DOUT_B(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_OUT_DOUT_B_UNCONNECTED\(71 downto 0),
      CAS_OUT_EN_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_OUT_EN_A_UNCONNECTED\,
      CAS_OUT_EN_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_OUT_EN_B_UNCONNECTED\,
      CAS_OUT_RDACCESS_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_OUT_RDACCESS_A_UNCONNECTED\,
      CAS_OUT_RDACCESS_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_OUT_RDACCESS_B_UNCONNECTED\,
      CAS_OUT_RDB_WR_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_OUT_RDB_WR_A_UNCONNECTED\,
      CAS_OUT_RDB_WR_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_OUT_RDB_WR_B_UNCONNECTED\,
      CAS_OUT_SBITERR_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_OUT_SBITERR_A_UNCONNECTED\,
      CAS_OUT_SBITERR_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_CAS_OUT_SBITERR_B_UNCONNECTED\,
      CLK => clka,
      DBITERR_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_DBITERR_A_UNCONNECTED\,
      DBITERR_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_DBITERR_B_UNCONNECTED\,
      DIN_A(71 downto 0) => B"000000000000000000000000000000000000000000000000000000000000000000000000",
      DIN_B(71 downto 9) => B"000000000000000000000000000000000000000000000000000000000000000",
      DIN_B(8) => dina(643),
      DIN_B(7 downto 0) => dina(511 downto 504),
      DOUT_A(71 downto 9) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_DOUT_A_UNCONNECTED\(71 downto 9),
      DOUT_A(8) => \gen_rd_b.doutb_reg\(643),
      DOUT_A(7 downto 0) => \gen_rd_b.doutb_reg\(511 downto 504),
      DOUT_B(71 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_DOUT_B_UNCONNECTED\(71 downto 0),
      EN_A => enb,
      EN_B => '1',
      INJECT_DBITERR_A => '0',
      INJECT_DBITERR_B => '0',
      INJECT_SBITERR_A => '0',
      INJECT_SBITERR_B => '0',
      OREG_CE_A => '1',
      OREG_CE_B => '1',
      OREG_ECC_CE_A => '1',
      OREG_ECC_CE_B => '1',
      RDACCESS_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_RDACCESS_A_UNCONNECTED\,
      RDACCESS_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_RDACCESS_B_UNCONNECTED\,
      RDB_WR_A => '0',
      RDB_WR_B => '1',
      RST_A => '0',
      RST_B => '0',
      SBITERR_A => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_SBITERR_A_UNCONNECTED\,
      SBITERR_B => \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_7_SBITERR_B_UNCONNECTED\,
      SLEEP => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity BufferFifoIP_512_xpm_fifo_base is
  port (
    sleep : in STD_LOGIC;
    rst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 643 downto 0 );
    full : out STD_LOGIC;
    full_n : out STD_LOGIC;
    prog_full : out STD_LOGIC;
    wr_data_count : out STD_LOGIC_VECTOR ( 6 downto 0 );
    overflow : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    almost_full : out STD_LOGIC;
    wr_ack : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 643 downto 0 );
    empty : out STD_LOGIC;
    prog_empty : out STD_LOGIC;
    rd_data_count : out STD_LOGIC_VECTOR ( 6 downto 0 );
    underflow : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC;
    almost_empty : out STD_LOGIC;
    data_valid : out STD_LOGIC;
    injectsbiterr : in STD_LOGIC;
    injectdbiterr : in STD_LOGIC;
    sbiterr : out STD_LOGIC;
    dbiterr : out STD_LOGIC
  );
  attribute CASCADE_HEIGHT : integer;
  attribute CASCADE_HEIGHT of BufferFifoIP_512_xpm_fifo_base : entity is 0;
  attribute CDC_DEST_SYNC_FF : integer;
  attribute CDC_DEST_SYNC_FF of BufferFifoIP_512_xpm_fifo_base : entity is 3;
  attribute COMMON_CLOCK : integer;
  attribute COMMON_CLOCK of BufferFifoIP_512_xpm_fifo_base : entity is 1;
  attribute DOUT_RESET_VALUE : string;
  attribute DOUT_RESET_VALUE of BufferFifoIP_512_xpm_fifo_base : entity is "";
  attribute ECC_MODE : integer;
  attribute ECC_MODE of BufferFifoIP_512_xpm_fifo_base : entity is 0;
  attribute ENABLE_ECC : integer;
  attribute ENABLE_ECC of BufferFifoIP_512_xpm_fifo_base : entity is 0;
  attribute EN_ADV_FEATURE : string;
  attribute EN_ADV_FEATURE of BufferFifoIP_512_xpm_fifo_base : entity is "16'b0001100000001000";
  attribute EN_AE : string;
  attribute EN_AE of BufferFifoIP_512_xpm_fifo_base : entity is "1'b1";
  attribute EN_AF : string;
  attribute EN_AF of BufferFifoIP_512_xpm_fifo_base : entity is "1'b1";
  attribute EN_DVLD : string;
  attribute EN_DVLD of BufferFifoIP_512_xpm_fifo_base : entity is "1'b1";
  attribute EN_OF : string;
  attribute EN_OF of BufferFifoIP_512_xpm_fifo_base : entity is "1'b0";
  attribute EN_PE : string;
  attribute EN_PE of BufferFifoIP_512_xpm_fifo_base : entity is "1'b0";
  attribute EN_PF : string;
  attribute EN_PF of BufferFifoIP_512_xpm_fifo_base : entity is "1'b0";
  attribute EN_RDC : string;
  attribute EN_RDC of BufferFifoIP_512_xpm_fifo_base : entity is "1'b0";
  attribute EN_UF : string;
  attribute EN_UF of BufferFifoIP_512_xpm_fifo_base : entity is "1'b0";
  attribute EN_WACK : string;
  attribute EN_WACK of BufferFifoIP_512_xpm_fifo_base : entity is "1'b0";
  attribute EN_WDC : string;
  attribute EN_WDC of BufferFifoIP_512_xpm_fifo_base : entity is "1'b0";
  attribute FG_EQ_ASYM_DOUT : string;
  attribute FG_EQ_ASYM_DOUT of BufferFifoIP_512_xpm_fifo_base : entity is "1'b0";
  attribute FIFO_MEMORY_TYPE : integer;
  attribute FIFO_MEMORY_TYPE of BufferFifoIP_512_xpm_fifo_base : entity is 3;
  attribute FIFO_MEM_TYPE : integer;
  attribute FIFO_MEM_TYPE of BufferFifoIP_512_xpm_fifo_base : entity is 3;
  attribute FIFO_READ_DEPTH : integer;
  attribute FIFO_READ_DEPTH of BufferFifoIP_512_xpm_fifo_base : entity is 64;
  attribute FIFO_READ_LATENCY : integer;
  attribute FIFO_READ_LATENCY of BufferFifoIP_512_xpm_fifo_base : entity is 0;
  attribute FIFO_SIZE : integer;
  attribute FIFO_SIZE of BufferFifoIP_512_xpm_fifo_base : entity is 41216;
  attribute FIFO_WRITE_DEPTH : integer;
  attribute FIFO_WRITE_DEPTH of BufferFifoIP_512_xpm_fifo_base : entity is 64;
  attribute FULL_RESET_VALUE : integer;
  attribute FULL_RESET_VALUE of BufferFifoIP_512_xpm_fifo_base : entity is 1;
  attribute FULL_RST_VAL : string;
  attribute FULL_RST_VAL of BufferFifoIP_512_xpm_fifo_base : entity is "1'b1";
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of BufferFifoIP_512_xpm_fifo_base : entity is "xpm_fifo_base";
  attribute PE_THRESH_ADJ : integer;
  attribute PE_THRESH_ADJ of BufferFifoIP_512_xpm_fifo_base : entity is 3;
  attribute PE_THRESH_MAX : integer;
  attribute PE_THRESH_MAX of BufferFifoIP_512_xpm_fifo_base : entity is 59;
  attribute PE_THRESH_MIN : integer;
  attribute PE_THRESH_MIN of BufferFifoIP_512_xpm_fifo_base : entity is 5;
  attribute PF_THRESH_ADJ : integer;
  attribute PF_THRESH_ADJ of BufferFifoIP_512_xpm_fifo_base : entity is 9;
  attribute PF_THRESH_MAX : integer;
  attribute PF_THRESH_MAX of BufferFifoIP_512_xpm_fifo_base : entity is 59;
  attribute PF_THRESH_MIN : integer;
  attribute PF_THRESH_MIN of BufferFifoIP_512_xpm_fifo_base : entity is 5;
  attribute PROG_EMPTY_THRESH : integer;
  attribute PROG_EMPTY_THRESH of BufferFifoIP_512_xpm_fifo_base : entity is 5;
  attribute PROG_FULL_THRESH : integer;
  attribute PROG_FULL_THRESH of BufferFifoIP_512_xpm_fifo_base : entity is 11;
  attribute RD_DATA_COUNT_WIDTH : integer;
  attribute RD_DATA_COUNT_WIDTH of BufferFifoIP_512_xpm_fifo_base : entity is 7;
  attribute RD_DC_WIDTH_EXT : integer;
  attribute RD_DC_WIDTH_EXT of BufferFifoIP_512_xpm_fifo_base : entity is 7;
  attribute RD_LATENCY : integer;
  attribute RD_LATENCY of BufferFifoIP_512_xpm_fifo_base : entity is 2;
  attribute RD_MODE : integer;
  attribute RD_MODE of BufferFifoIP_512_xpm_fifo_base : entity is 1;
  attribute RD_PNTR_WIDTH : integer;
  attribute RD_PNTR_WIDTH of BufferFifoIP_512_xpm_fifo_base : entity is 6;
  attribute READ_DATA_WIDTH : integer;
  attribute READ_DATA_WIDTH of BufferFifoIP_512_xpm_fifo_base : entity is 644;
  attribute READ_MODE : integer;
  attribute READ_MODE of BufferFifoIP_512_xpm_fifo_base : entity is 1;
  attribute RELATED_CLOCKS : integer;
  attribute RELATED_CLOCKS of BufferFifoIP_512_xpm_fifo_base : entity is 0;
  attribute REMOVE_WR_RD_PROT_LOGIC : integer;
  attribute REMOVE_WR_RD_PROT_LOGIC of BufferFifoIP_512_xpm_fifo_base : entity is 0;
  attribute SIM_ASSERT_CHK : integer;
  attribute SIM_ASSERT_CHK of BufferFifoIP_512_xpm_fifo_base : entity is 0;
  attribute USE_ADV_FEATURES : integer;
  attribute USE_ADV_FEATURES of BufferFifoIP_512_xpm_fifo_base : entity is 825765944;
  attribute VERSION : integer;
  attribute VERSION of BufferFifoIP_512_xpm_fifo_base : entity is 0;
  attribute WAKEUP_TIME : integer;
  attribute WAKEUP_TIME of BufferFifoIP_512_xpm_fifo_base : entity is 0;
  attribute WIDTH_RATIO : integer;
  attribute WIDTH_RATIO of BufferFifoIP_512_xpm_fifo_base : entity is 1;
  attribute WRITE_DATA_WIDTH : integer;
  attribute WRITE_DATA_WIDTH of BufferFifoIP_512_xpm_fifo_base : entity is 644;
  attribute WR_DATA_COUNT_WIDTH : integer;
  attribute WR_DATA_COUNT_WIDTH of BufferFifoIP_512_xpm_fifo_base : entity is 7;
  attribute WR_DC_WIDTH_EXT : integer;
  attribute WR_DC_WIDTH_EXT of BufferFifoIP_512_xpm_fifo_base : entity is 7;
  attribute WR_DEPTH_LOG : integer;
  attribute WR_DEPTH_LOG of BufferFifoIP_512_xpm_fifo_base : entity is 6;
  attribute WR_PNTR_WIDTH : integer;
  attribute WR_PNTR_WIDTH of BufferFifoIP_512_xpm_fifo_base : entity is 6;
  attribute WR_RD_RATIO : integer;
  attribute WR_RD_RATIO of BufferFifoIP_512_xpm_fifo_base : entity is 0;
  attribute WR_WIDTH_LOG : integer;
  attribute WR_WIDTH_LOG of BufferFifoIP_512_xpm_fifo_base : entity is 10;
  attribute XPM_MODULE : string;
  attribute XPM_MODULE of BufferFifoIP_512_xpm_fifo_base : entity is "TRUE";
  attribute both_stages_valid : integer;
  attribute both_stages_valid of BufferFifoIP_512_xpm_fifo_base : entity is 3;
  attribute invalid : integer;
  attribute invalid of BufferFifoIP_512_xpm_fifo_base : entity is 0;
  attribute keep_hierarchy : string;
  attribute keep_hierarchy of BufferFifoIP_512_xpm_fifo_base : entity is "soft";
  attribute stage1_valid : integer;
  attribute stage1_valid of BufferFifoIP_512_xpm_fifo_base : entity is 2;
  attribute stage2_valid : integer;
  attribute stage2_valid of BufferFifoIP_512_xpm_fifo_base : entity is 1;
end BufferFifoIP_512_xpm_fifo_base;

architecture STRUCTURE of BufferFifoIP_512_xpm_fifo_base is
  signal \<const0>\ : STD_LOGIC;
  signal aempty_fwft_i0 : STD_LOGIC;
  signal \^almost_empty\ : STD_LOGIC;
  signal \^almost_full\ : STD_LOGIC;
  signal clr_full : STD_LOGIC;
  signal \count_value_i__0\ : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal curr_fwft_state : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal data_valid_fwft1 : STD_LOGIC;
  signal \^dout\ : STD_LOGIC_VECTOR ( 643 downto 0 );
  signal \gen_fwft.empty_fwft_i_reg_n_0\ : STD_LOGIC;
  signal \gen_fwft.gdvld_fwft.data_valid_fwft_i_1_n_0\ : STD_LOGIC;
  signal \gen_fwft.ram_regout_en\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_n_0\ : STD_LOGIC;
  signal going_afull : STD_LOGIC;
  signal going_full1 : STD_LOGIC;
  signal leaving_empty0 : STD_LOGIC;
  signal \next_fwft_state__0\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ram_empty_i : STD_LOGIC;
  signal ram_empty_i0 : STD_LOGIC;
  signal ram_wr_en_i : STD_LOGIC;
  signal rd_pntr_ext : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal rdp_inst_n_1 : STD_LOGIC;
  signal rdp_inst_n_10 : STD_LOGIC;
  signal rdp_inst_n_11 : STD_LOGIC;
  signal rdpp1_inst_n_0 : STD_LOGIC;
  signal rdpp1_inst_n_1 : STD_LOGIC;
  signal rdpp1_inst_n_2 : STD_LOGIC;
  signal rdpp1_inst_n_3 : STD_LOGIC;
  signal rdpp1_inst_n_4 : STD_LOGIC;
  signal rdpp1_inst_n_5 : STD_LOGIC;
  signal rst_d1 : STD_LOGIC;
  signal wr_pntr_ext : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal wrpp2_inst_n_0 : STD_LOGIC;
  signal wrpp2_inst_n_1 : STD_LOGIC;
  signal wrpp2_inst_n_2 : STD_LOGIC;
  signal wrpp2_inst_n_3 : STD_LOGIC;
  signal wrpp2_inst_n_4 : STD_LOGIC;
  signal wrpp2_inst_n_5 : STD_LOGIC;
  signal xpm_fifo_rst_inst_n_0 : STD_LOGIC;
  signal xpm_fifo_rst_inst_n_2 : STD_LOGIC;
  signal \NLW_gen_sdpram.xpm_memory_base_inst_dbiterra_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_sdpram.xpm_memory_base_inst_dbiterrb_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_sdpram.xpm_memory_base_inst_sbiterra_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_sdpram.xpm_memory_base_inst_sbiterrb_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_sdpram.xpm_memory_base_inst_douta_UNCONNECTED\ : STD_LOGIC_VECTOR ( 643 downto 0 );
  signal \NLW_gen_sdpram.xpm_memory_base_inst_doutb_UNCONNECTED\ : STD_LOGIC_VECTOR ( 642 downto 512 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_gen_fwft.curr_fwft_state[0]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \FSM_sequential_gen_fwft.curr_fwft_state[1]_i_1\ : label is "soft_lutpair11";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_gen_fwft.curr_fwft_state_reg[0]\ : label is "invalid:00,stage1_valid:01,both_stages_valid:10,stage2_valid:11";
  attribute FSM_ENCODED_STATES of \FSM_sequential_gen_fwft.curr_fwft_state_reg[1]\ : label is "invalid:00,stage1_valid:01,both_stages_valid:10,stage2_valid:11";
  attribute SOFT_HLUTNM of \gen_fwft.gae_fwft.aempty_fwft_i_i_1\ : label is "soft_lutpair10";
  attribute ADDR_WIDTH_A : integer;
  attribute ADDR_WIDTH_A of \gen_sdpram.xpm_memory_base_inst\ : label is 6;
  attribute ADDR_WIDTH_B : integer;
  attribute ADDR_WIDTH_B of \gen_sdpram.xpm_memory_base_inst\ : label is 6;
  attribute AUTO_SLEEP_TIME : integer;
  attribute AUTO_SLEEP_TIME of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute BYTE_WRITE_WIDTH_A : integer;
  attribute BYTE_WRITE_WIDTH_A of \gen_sdpram.xpm_memory_base_inst\ : label is 644;
  attribute BYTE_WRITE_WIDTH_B : integer;
  attribute BYTE_WRITE_WIDTH_B of \gen_sdpram.xpm_memory_base_inst\ : label is 644;
  attribute CASCADE_HEIGHT of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute CLOCKING_MODE : integer;
  attribute CLOCKING_MODE of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute ECC_MODE of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute KEEP_HIERARCHY of \gen_sdpram.xpm_memory_base_inst\ : label is "soft";
  attribute MAX_NUM_CHAR : integer;
  attribute MAX_NUM_CHAR of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute MEMORY_INIT_FILE : string;
  attribute MEMORY_INIT_FILE of \gen_sdpram.xpm_memory_base_inst\ : label is "none";
  attribute MEMORY_INIT_PARAM : string;
  attribute MEMORY_INIT_PARAM of \gen_sdpram.xpm_memory_base_inst\ : label is "";
  attribute MEMORY_OPTIMIZATION : string;
  attribute MEMORY_OPTIMIZATION of \gen_sdpram.xpm_memory_base_inst\ : label is "true";
  attribute MEMORY_PRIMITIVE : integer;
  attribute MEMORY_PRIMITIVE of \gen_sdpram.xpm_memory_base_inst\ : label is 3;
  attribute MEMORY_SIZE : integer;
  attribute MEMORY_SIZE of \gen_sdpram.xpm_memory_base_inst\ : label is 41216;
  attribute MEMORY_TYPE : integer;
  attribute MEMORY_TYPE of \gen_sdpram.xpm_memory_base_inst\ : label is 1;
  attribute MESSAGE_CONTROL : integer;
  attribute MESSAGE_CONTROL of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute NUM_CHAR_LOC : integer;
  attribute NUM_CHAR_LOC of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute P_ECC_MODE : string;
  attribute P_ECC_MODE of \gen_sdpram.xpm_memory_base_inst\ : label is "no_ecc";
  attribute P_ENABLE_BYTE_WRITE_A : integer;
  attribute P_ENABLE_BYTE_WRITE_A of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute P_ENABLE_BYTE_WRITE_B : integer;
  attribute P_ENABLE_BYTE_WRITE_B of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute P_MAX_DEPTH_DATA : integer;
  attribute P_MAX_DEPTH_DATA of \gen_sdpram.xpm_memory_base_inst\ : label is 64;
  attribute P_MEMORY_OPT : string;
  attribute P_MEMORY_OPT of \gen_sdpram.xpm_memory_base_inst\ : label is "yes";
  attribute P_MEMORY_PRIMITIVE : string;
  attribute P_MEMORY_PRIMITIVE of \gen_sdpram.xpm_memory_base_inst\ : label is "ultra";
  attribute P_MIN_WIDTH_DATA : integer;
  attribute P_MIN_WIDTH_DATA of \gen_sdpram.xpm_memory_base_inst\ : label is 644;
  attribute P_MIN_WIDTH_DATA_A : integer;
  attribute P_MIN_WIDTH_DATA_A of \gen_sdpram.xpm_memory_base_inst\ : label is 644;
  attribute P_MIN_WIDTH_DATA_B : integer;
  attribute P_MIN_WIDTH_DATA_B of \gen_sdpram.xpm_memory_base_inst\ : label is 644;
  attribute P_MIN_WIDTH_DATA_ECC : integer;
  attribute P_MIN_WIDTH_DATA_ECC of \gen_sdpram.xpm_memory_base_inst\ : label is 644;
  attribute P_MIN_WIDTH_DATA_LDW : integer;
  attribute P_MIN_WIDTH_DATA_LDW of \gen_sdpram.xpm_memory_base_inst\ : label is 4;
  attribute P_MIN_WIDTH_DATA_SHFT : integer;
  attribute P_MIN_WIDTH_DATA_SHFT of \gen_sdpram.xpm_memory_base_inst\ : label is 644;
  attribute P_NUM_COLS_WRITE_A : integer;
  attribute P_NUM_COLS_WRITE_A of \gen_sdpram.xpm_memory_base_inst\ : label is 1;
  attribute P_NUM_COLS_WRITE_B : integer;
  attribute P_NUM_COLS_WRITE_B of \gen_sdpram.xpm_memory_base_inst\ : label is 1;
  attribute P_NUM_ROWS_READ_A : integer;
  attribute P_NUM_ROWS_READ_A of \gen_sdpram.xpm_memory_base_inst\ : label is 1;
  attribute P_NUM_ROWS_READ_B : integer;
  attribute P_NUM_ROWS_READ_B of \gen_sdpram.xpm_memory_base_inst\ : label is 1;
  attribute P_NUM_ROWS_WRITE_A : integer;
  attribute P_NUM_ROWS_WRITE_A of \gen_sdpram.xpm_memory_base_inst\ : label is 1;
  attribute P_NUM_ROWS_WRITE_B : integer;
  attribute P_NUM_ROWS_WRITE_B of \gen_sdpram.xpm_memory_base_inst\ : label is 1;
  attribute P_SDP_WRITE_MODE : string;
  attribute P_SDP_WRITE_MODE of \gen_sdpram.xpm_memory_base_inst\ : label is "yes";
  attribute P_WIDTH_ADDR_LSB_READ_A : integer;
  attribute P_WIDTH_ADDR_LSB_READ_A of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute P_WIDTH_ADDR_LSB_READ_B : integer;
  attribute P_WIDTH_ADDR_LSB_READ_B of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute P_WIDTH_ADDR_LSB_WRITE_A : integer;
  attribute P_WIDTH_ADDR_LSB_WRITE_A of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute P_WIDTH_ADDR_LSB_WRITE_B : integer;
  attribute P_WIDTH_ADDR_LSB_WRITE_B of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute P_WIDTH_ADDR_READ_A : integer;
  attribute P_WIDTH_ADDR_READ_A of \gen_sdpram.xpm_memory_base_inst\ : label is 6;
  attribute P_WIDTH_ADDR_READ_B : integer;
  attribute P_WIDTH_ADDR_READ_B of \gen_sdpram.xpm_memory_base_inst\ : label is 6;
  attribute P_WIDTH_ADDR_WRITE_A : integer;
  attribute P_WIDTH_ADDR_WRITE_A of \gen_sdpram.xpm_memory_base_inst\ : label is 6;
  attribute P_WIDTH_ADDR_WRITE_B : integer;
  attribute P_WIDTH_ADDR_WRITE_B of \gen_sdpram.xpm_memory_base_inst\ : label is 6;
  attribute P_WIDTH_COL_WRITE_A : integer;
  attribute P_WIDTH_COL_WRITE_A of \gen_sdpram.xpm_memory_base_inst\ : label is 644;
  attribute P_WIDTH_COL_WRITE_B : integer;
  attribute P_WIDTH_COL_WRITE_B of \gen_sdpram.xpm_memory_base_inst\ : label is 644;
  attribute READ_DATA_WIDTH_A : integer;
  attribute READ_DATA_WIDTH_A of \gen_sdpram.xpm_memory_base_inst\ : label is 644;
  attribute READ_DATA_WIDTH_B : integer;
  attribute READ_DATA_WIDTH_B of \gen_sdpram.xpm_memory_base_inst\ : label is 644;
  attribute READ_LATENCY_A : integer;
  attribute READ_LATENCY_A of \gen_sdpram.xpm_memory_base_inst\ : label is 2;
  attribute READ_LATENCY_B : integer;
  attribute READ_LATENCY_B of \gen_sdpram.xpm_memory_base_inst\ : label is 2;
  attribute READ_RESET_VALUE_A : string;
  attribute READ_RESET_VALUE_A of \gen_sdpram.xpm_memory_base_inst\ : label is "0";
  attribute READ_RESET_VALUE_B : string;
  attribute READ_RESET_VALUE_B of \gen_sdpram.xpm_memory_base_inst\ : label is "";
  attribute RST_MODE_A : string;
  attribute RST_MODE_A of \gen_sdpram.xpm_memory_base_inst\ : label is "SYNC";
  attribute RST_MODE_B : string;
  attribute RST_MODE_B of \gen_sdpram.xpm_memory_base_inst\ : label is "SYNC";
  attribute SIM_ASSERT_CHK of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute USE_EMBEDDED_CONSTRAINT : integer;
  attribute USE_EMBEDDED_CONSTRAINT of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute USE_MEM_INIT : integer;
  attribute USE_MEM_INIT of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute USE_MEM_INIT_MMI : integer;
  attribute USE_MEM_INIT_MMI of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute VERSION of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute WAKEUP_TIME of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute WRITE_DATA_WIDTH_A : integer;
  attribute WRITE_DATA_WIDTH_A of \gen_sdpram.xpm_memory_base_inst\ : label is 644;
  attribute WRITE_DATA_WIDTH_B : integer;
  attribute WRITE_DATA_WIDTH_B of \gen_sdpram.xpm_memory_base_inst\ : label is 644;
  attribute WRITE_MODE_A : integer;
  attribute WRITE_MODE_A of \gen_sdpram.xpm_memory_base_inst\ : label is 2;
  attribute WRITE_MODE_B : integer;
  attribute WRITE_MODE_B of \gen_sdpram.xpm_memory_base_inst\ : label is 1;
  attribute WRITE_PROTECT : integer;
  attribute WRITE_PROTECT of \gen_sdpram.xpm_memory_base_inst\ : label is 1;
  attribute XPM_MODULE of \gen_sdpram.xpm_memory_base_inst\ : label is "TRUE";
  attribute rsta_loop_iter : integer;
  attribute rsta_loop_iter of \gen_sdpram.xpm_memory_base_inst\ : label is 644;
  attribute rstb_loop_iter : integer;
  attribute rstb_loop_iter of \gen_sdpram.xpm_memory_base_inst\ : label is 644;
  attribute SOFT_HLUTNM of \gen_sdpram.xpm_memory_base_inst_i_3\ : label is "soft_lutpair10";
begin
  almost_empty <= \^almost_empty\;
  almost_full <= \^almost_full\;
  dbiterr <= \<const0>\;
  dout(643) <= \^dout\(643);
  dout(642) <= \<const0>\;
  dout(641) <= \<const0>\;
  dout(640) <= \<const0>\;
  dout(639) <= \<const0>\;
  dout(638) <= \<const0>\;
  dout(637) <= \<const0>\;
  dout(636) <= \<const0>\;
  dout(635) <= \<const0>\;
  dout(634) <= \<const0>\;
  dout(633) <= \<const0>\;
  dout(632) <= \<const0>\;
  dout(631) <= \<const0>\;
  dout(630) <= \<const0>\;
  dout(629) <= \<const0>\;
  dout(628) <= \<const0>\;
  dout(627) <= \<const0>\;
  dout(626) <= \<const0>\;
  dout(625) <= \<const0>\;
  dout(624) <= \<const0>\;
  dout(623) <= \<const0>\;
  dout(622) <= \<const0>\;
  dout(621) <= \<const0>\;
  dout(620) <= \<const0>\;
  dout(619) <= \<const0>\;
  dout(618) <= \<const0>\;
  dout(617) <= \<const0>\;
  dout(616) <= \<const0>\;
  dout(615) <= \<const0>\;
  dout(614) <= \<const0>\;
  dout(613) <= \<const0>\;
  dout(612) <= \<const0>\;
  dout(611) <= \<const0>\;
  dout(610) <= \<const0>\;
  dout(609) <= \<const0>\;
  dout(608) <= \<const0>\;
  dout(607) <= \<const0>\;
  dout(606) <= \<const0>\;
  dout(605) <= \<const0>\;
  dout(604) <= \<const0>\;
  dout(603) <= \<const0>\;
  dout(602) <= \<const0>\;
  dout(601) <= \<const0>\;
  dout(600) <= \<const0>\;
  dout(599) <= \<const0>\;
  dout(598) <= \<const0>\;
  dout(597) <= \<const0>\;
  dout(596) <= \<const0>\;
  dout(595) <= \<const0>\;
  dout(594) <= \<const0>\;
  dout(593) <= \<const0>\;
  dout(592) <= \<const0>\;
  dout(591) <= \<const0>\;
  dout(590) <= \<const0>\;
  dout(589) <= \<const0>\;
  dout(588) <= \<const0>\;
  dout(587) <= \<const0>\;
  dout(586) <= \<const0>\;
  dout(585) <= \<const0>\;
  dout(584) <= \<const0>\;
  dout(583) <= \<const0>\;
  dout(582) <= \<const0>\;
  dout(581) <= \<const0>\;
  dout(580) <= \<const0>\;
  dout(579) <= \<const0>\;
  dout(578) <= \<const0>\;
  dout(577) <= \<const0>\;
  dout(576) <= \<const0>\;
  dout(575) <= \<const0>\;
  dout(574) <= \<const0>\;
  dout(573) <= \<const0>\;
  dout(572) <= \<const0>\;
  dout(571) <= \<const0>\;
  dout(570) <= \<const0>\;
  dout(569) <= \<const0>\;
  dout(568) <= \<const0>\;
  dout(567) <= \<const0>\;
  dout(566) <= \<const0>\;
  dout(565) <= \<const0>\;
  dout(564) <= \<const0>\;
  dout(563) <= \<const0>\;
  dout(562) <= \<const0>\;
  dout(561) <= \<const0>\;
  dout(560) <= \<const0>\;
  dout(559) <= \<const0>\;
  dout(558) <= \<const0>\;
  dout(557) <= \<const0>\;
  dout(556) <= \<const0>\;
  dout(555) <= \<const0>\;
  dout(554) <= \<const0>\;
  dout(553) <= \<const0>\;
  dout(552) <= \<const0>\;
  dout(551) <= \<const0>\;
  dout(550) <= \<const0>\;
  dout(549) <= \<const0>\;
  dout(548) <= \<const0>\;
  dout(547) <= \<const0>\;
  dout(546) <= \<const0>\;
  dout(545) <= \<const0>\;
  dout(544) <= \<const0>\;
  dout(543) <= \<const0>\;
  dout(542) <= \<const0>\;
  dout(541) <= \<const0>\;
  dout(540) <= \<const0>\;
  dout(539) <= \<const0>\;
  dout(538) <= \<const0>\;
  dout(537) <= \<const0>\;
  dout(536) <= \<const0>\;
  dout(535) <= \<const0>\;
  dout(534) <= \<const0>\;
  dout(533) <= \<const0>\;
  dout(532) <= \<const0>\;
  dout(531) <= \<const0>\;
  dout(530) <= \<const0>\;
  dout(529) <= \<const0>\;
  dout(528) <= \<const0>\;
  dout(527) <= \<const0>\;
  dout(526) <= \<const0>\;
  dout(525) <= \<const0>\;
  dout(524) <= \<const0>\;
  dout(523) <= \<const0>\;
  dout(522) <= \<const0>\;
  dout(521) <= \<const0>\;
  dout(520) <= \<const0>\;
  dout(519) <= \<const0>\;
  dout(518) <= \<const0>\;
  dout(517) <= \<const0>\;
  dout(516) <= \<const0>\;
  dout(515) <= \<const0>\;
  dout(514) <= \<const0>\;
  dout(513) <= \<const0>\;
  dout(512) <= \<const0>\;
  dout(511 downto 0) <= \^dout\(511 downto 0);
  empty <= \<const0>\;
  full <= \<const0>\;
  overflow <= \<const0>\;
  prog_empty <= \<const0>\;
  prog_full <= \<const0>\;
  rd_data_count(6) <= \<const0>\;
  rd_data_count(5) <= \<const0>\;
  rd_data_count(4) <= \<const0>\;
  rd_data_count(3) <= \<const0>\;
  rd_data_count(2) <= \<const0>\;
  rd_data_count(1) <= \<const0>\;
  rd_data_count(0) <= \<const0>\;
  rd_rst_busy <= \<const0>\;
  sbiterr <= \<const0>\;
  underflow <= \<const0>\;
  wr_ack <= \<const0>\;
  wr_data_count(6) <= \<const0>\;
  wr_data_count(5) <= \<const0>\;
  wr_data_count(4) <= \<const0>\;
  wr_data_count(3) <= \<const0>\;
  wr_data_count(2) <= \<const0>\;
  wr_data_count(1) <= \<const0>\;
  wr_data_count(0) <= \<const0>\;
  wr_rst_busy <= \<const0>\;
\FSM_sequential_gen_fwft.curr_fwft_state[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6A85"
    )
        port map (
      I0 => curr_fwft_state(0),
      I1 => rd_en,
      I2 => curr_fwft_state(1),
      I3 => ram_empty_i,
      O => \next_fwft_state__0\(0)
    );
\FSM_sequential_gen_fwft.curr_fwft_state[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7C"
    )
        port map (
      I0 => rd_en,
      I1 => curr_fwft_state(1),
      I2 => curr_fwft_state(0),
      O => \next_fwft_state__0\(1)
    );
\FSM_sequential_gen_fwft.curr_fwft_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => \next_fwft_state__0\(0),
      Q => curr_fwft_state(0),
      R => xpm_fifo_rst_inst_n_2
    );
\FSM_sequential_gen_fwft.curr_fwft_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => \next_fwft_state__0\(1),
      Q => curr_fwft_state(1),
      R => xpm_fifo_rst_inst_n_2
    );
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
\gen_fwft.empty_fwft_i_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F380"
    )
        port map (
      I0 => rd_en,
      I1 => curr_fwft_state(0),
      I2 => curr_fwft_state(1),
      I3 => \gen_fwft.empty_fwft_i_reg_n_0\,
      O => data_valid_fwft1
    );
\gen_fwft.empty_fwft_i_reg\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => data_valid_fwft1,
      Q => \gen_fwft.empty_fwft_i_reg_n_0\,
      S => xpm_fifo_rst_inst_n_2
    );
\gen_fwft.gae_fwft.aempty_fwft_i_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FDDD4000"
    )
        port map (
      I0 => curr_fwft_state(0),
      I1 => ram_empty_i,
      I2 => curr_fwft_state(1),
      I3 => rd_en,
      I4 => \^almost_empty\,
      O => aempty_fwft_i0
    );
\gen_fwft.gae_fwft.aempty_fwft_i_reg\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => aempty_fwft_i0,
      Q => \^almost_empty\,
      S => xpm_fifo_rst_inst_n_2
    );
\gen_fwft.gdvld_fwft.data_valid_fwft_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3575"
    )
        port map (
      I0 => \gen_fwft.empty_fwft_i_reg_n_0\,
      I1 => curr_fwft_state(1),
      I2 => curr_fwft_state(0),
      I3 => rd_en,
      O => \gen_fwft.gdvld_fwft.data_valid_fwft_i_1_n_0\
    );
\gen_fwft.gdvld_fwft.data_valid_fwft_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => \gen_fwft.gdvld_fwft.data_valid_fwft_i_1_n_0\,
      Q => data_valid,
      R => xpm_fifo_rst_inst_n_2
    );
\gen_pntr_flags_cc.gaf_cc.ram_afull_i_reg\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => xpm_fifo_rst_inst_n_0,
      Q => \^almost_full\,
      S => xpm_fifo_rst_inst_n_2
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => rdp_inst_n_10,
      Q => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_n_0\,
      S => xpm_fifo_rst_inst_n_2
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => rdp_inst_n_11,
      Q => full_n,
      R => xpm_fifo_rst_inst_n_2
    );
\gen_pntr_flags_cc.ram_empty_i_reg\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => ram_empty_i0,
      Q => ram_empty_i,
      S => xpm_fifo_rst_inst_n_2
    );
\gen_sdpram.xpm_memory_base_inst\: entity work.BufferFifoIP_512_xpm_memory_base
     port map (
      addra(5 downto 0) => wr_pntr_ext(5 downto 0),
      addrb(5 downto 0) => rd_pntr_ext(5 downto 0),
      clka => wr_clk,
      clkb => '0',
      dbiterra => \NLW_gen_sdpram.xpm_memory_base_inst_dbiterra_UNCONNECTED\,
      dbiterrb => \NLW_gen_sdpram.xpm_memory_base_inst_dbiterrb_UNCONNECTED\,
      dina(643) => din(643),
      dina(642 downto 512) => B"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      dina(511 downto 0) => din(511 downto 0),
      dinb(643 downto 0) => B"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      douta(643 downto 0) => \NLW_gen_sdpram.xpm_memory_base_inst_douta_UNCONNECTED\(643 downto 0),
      doutb(643) => \^dout\(643),
      doutb(642 downto 512) => \NLW_gen_sdpram.xpm_memory_base_inst_doutb_UNCONNECTED\(642 downto 512),
      doutb(511 downto 0) => \^dout\(511 downto 0),
      ena => '0',
      enb => rdp_inst_n_1,
      injectdbiterra => '0',
      injectdbiterrb => '0',
      injectsbiterra => '0',
      injectsbiterrb => '0',
      regcea => '0',
      regceb => \gen_fwft.ram_regout_en\,
      rsta => '0',
      rstb => xpm_fifo_rst_inst_n_2,
      sbiterra => \NLW_gen_sdpram.xpm_memory_base_inst_sbiterra_UNCONNECTED\,
      sbiterrb => \NLW_gen_sdpram.xpm_memory_base_inst_sbiterrb_UNCONNECTED\,
      sleep => sleep,
      wea(0) => ram_wr_en_i,
      web(0) => '0'
    );
\gen_sdpram.xpm_memory_base_inst_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"62"
    )
        port map (
      I0 => curr_fwft_state(0),
      I1 => curr_fwft_state(1),
      I2 => rd_en,
      O => \gen_fwft.ram_regout_en\
    );
rdp_inst: entity work.\BufferFifoIP_512_xpm_counter_updn__parameterized2\
     port map (
      \FSM_sequential_gen_fwft.curr_fwft_state_reg[1]\ => rdp_inst_n_1,
      Q(5 downto 0) => rd_pntr_ext(5 downto 0),
      clr_full => clr_full,
      \count_value_i_reg[0]_0\(1 downto 0) => curr_fwft_state(1 downto 0),
      \count_value_i_reg[5]_0\(0) => xpm_fifo_rst_inst_n_2,
      \gen_pntr_flags_cc.gaf_cc.ram_afull_i_i_3_0\(5) => wrpp2_inst_n_0,
      \gen_pntr_flags_cc.gaf_cc.ram_afull_i_i_3_0\(4) => wrpp2_inst_n_1,
      \gen_pntr_flags_cc.gaf_cc.ram_afull_i_i_3_0\(3) => wrpp2_inst_n_2,
      \gen_pntr_flags_cc.gaf_cc.ram_afull_i_i_3_0\(2) => wrpp2_inst_n_3,
      \gen_pntr_flags_cc.gaf_cc.ram_afull_i_i_3_0\(1) => wrpp2_inst_n_4,
      \gen_pntr_flags_cc.gaf_cc.ram_afull_i_i_3_0\(0) => wrpp2_inst_n_5,
      \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg\ => rdp_inst_n_10,
      \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0\ => rdp_inst_n_11,
      \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_1\ => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_n_0\,
      \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_3_0\(5 downto 0) => wr_pntr_ext(5 downto 0),
      \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_4_0\(5 downto 0) => \count_value_i__0\(5 downto 0),
      going_afull => going_afull,
      going_full1 => going_full1,
      leaving_empty0 => leaving_empty0,
      ram_empty_i => ram_empty_i,
      ram_wr_en_i => ram_wr_en_i,
      rd_en => rd_en,
      wr_clk => wr_clk
    );
rdpp1_inst: entity work.\BufferFifoIP_512_xpm_counter_updn__parameterized3\
     port map (
      E(0) => rdp_inst_n_1,
      Q(5) => rdpp1_inst_n_0,
      Q(4) => rdpp1_inst_n_1,
      Q(3) => rdpp1_inst_n_2,
      Q(2) => rdpp1_inst_n_3,
      Q(1) => rdpp1_inst_n_4,
      Q(0) => rdpp1_inst_n_5,
      \count_value_i_reg[1]_0\(1 downto 0) => curr_fwft_state(1 downto 0),
      \count_value_i_reg[1]_1\(0) => xpm_fifo_rst_inst_n_2,
      ram_empty_i => ram_empty_i,
      rd_en => rd_en,
      wr_clk => wr_clk
    );
rst_d1_inst: entity work.BufferFifoIP_512_xpm_fifo_reg_bit
     port map (
      Q(0) => xpm_fifo_rst_inst_n_2,
      clr_full => clr_full,
      rst => rst,
      rst_d1 => rst_d1,
      wr_clk => wr_clk
    );
wrp_inst: entity work.\BufferFifoIP_512_xpm_counter_updn__parameterized2_0\
     port map (
      Q(5 downto 0) => wr_pntr_ext(5 downto 0),
      \count_value_i_reg[0]_0\(0) => xpm_fifo_rst_inst_n_2,
      \count_value_i_reg[5]_0\ => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_n_0\,
      \gen_pntr_flags_cc.ram_empty_i_reg\ => rdp_inst_n_1,
      \gen_pntr_flags_cc.ram_empty_i_reg_0\(5) => rdpp1_inst_n_0,
      \gen_pntr_flags_cc.ram_empty_i_reg_0\(4) => rdpp1_inst_n_1,
      \gen_pntr_flags_cc.ram_empty_i_reg_0\(3) => rdpp1_inst_n_2,
      \gen_pntr_flags_cc.ram_empty_i_reg_0\(2) => rdpp1_inst_n_3,
      \gen_pntr_flags_cc.ram_empty_i_reg_0\(1) => rdpp1_inst_n_4,
      \gen_pntr_flags_cc.ram_empty_i_reg_0\(0) => rdpp1_inst_n_5,
      leaving_empty0 => leaving_empty0,
      ram_empty_i => ram_empty_i,
      ram_empty_i0 => ram_empty_i0,
      ram_wr_en_i => ram_wr_en_i,
      rst_d1 => rst_d1,
      wr_clk => wr_clk,
      wr_en => wr_en
    );
wrpp1_inst: entity work.\BufferFifoIP_512_xpm_counter_updn__parameterized3_1\
     port map (
      Q(5 downto 0) => \count_value_i__0\(5 downto 0),
      \count_value_i_reg[1]_0\(0) => xpm_fifo_rst_inst_n_2,
      \count_value_i_reg[5]_0\ => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_n_0\,
      ram_wr_en_i => ram_wr_en_i,
      rst_d1 => rst_d1,
      wr_clk => wr_clk,
      wr_en => wr_en
    );
wrpp2_inst: entity work.\BufferFifoIP_512_xpm_counter_updn__parameterized0\
     port map (
      Q(5) => wrpp2_inst_n_0,
      Q(4) => wrpp2_inst_n_1,
      Q(3) => wrpp2_inst_n_2,
      Q(2) => wrpp2_inst_n_3,
      Q(1) => wrpp2_inst_n_4,
      Q(0) => wrpp2_inst_n_5,
      \count_value_i_reg[1]_0\(0) => xpm_fifo_rst_inst_n_2,
      \count_value_i_reg[5]_0\ => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_n_0\,
      ram_wr_en_i => ram_wr_en_i,
      rst_d1 => rst_d1,
      wr_clk => wr_clk,
      wr_en => wr_en
    );
xpm_fifo_rst_inst: entity work.BufferFifoIP_512_xpm_fifo_rst
     port map (
      Q(1 downto 0) => curr_fwft_state(1 downto 0),
      almost_full => \^almost_full\,
      \count_value_i_reg[5]\ => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_n_0\,
      \gen_rst_cc.fifo_wr_rst_cc_reg[2]_0\(0) => xpm_fifo_rst_inst_n_2,
      going_afull => going_afull,
      going_full1 => going_full1,
      ram_empty_i => ram_empty_i,
      ram_wr_en_i => ram_wr_en_i,
      rd_en => rd_en,
      rst => rst,
      rst_d1 => rst_d1,
      \syncstages_ff_reg[3]\ => xpm_fifo_rst_inst_n_0,
      wr_clk => wr_clk,
      wr_en => wr_en
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity BufferFifoIP_512_xpm_fifo_axis is
  port (
    s_aresetn : in STD_LOGIC;
    s_aclk : in STD_LOGIC;
    m_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 511 downto 0 );
    s_axis_tstrb : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tkeep : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    s_axis_tid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tdest : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 511 downto 0 );
    m_axis_tstrb : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    m_axis_tid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tdest : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tuser : out STD_LOGIC_VECTOR ( 0 to 0 );
    prog_full_axis : out STD_LOGIC;
    wr_data_count_axis : out STD_LOGIC_VECTOR ( 6 downto 0 );
    almost_full_axis : out STD_LOGIC;
    prog_empty_axis : out STD_LOGIC;
    rd_data_count_axis : out STD_LOGIC_VECTOR ( 6 downto 0 );
    almost_empty_axis : out STD_LOGIC;
    injectsbiterr_axis : in STD_LOGIC;
    injectdbiterr_axis : in STD_LOGIC;
    sbiterr_axis : out STD_LOGIC;
    dbiterr_axis : out STD_LOGIC
  );
  attribute AXIS_DATA_WIDTH : integer;
  attribute AXIS_DATA_WIDTH of BufferFifoIP_512_xpm_fifo_axis : entity is 644;
  attribute AXIS_FINAL_DATA_WIDTH : integer;
  attribute AXIS_FINAL_DATA_WIDTH of BufferFifoIP_512_xpm_fifo_axis : entity is 644;
  attribute CASCADE_HEIGHT : integer;
  attribute CASCADE_HEIGHT of BufferFifoIP_512_xpm_fifo_axis : entity is 0;
  attribute CDC_SYNC_STAGES : integer;
  attribute CDC_SYNC_STAGES of BufferFifoIP_512_xpm_fifo_axis : entity is 3;
  attribute CLOCKING_MODE : string;
  attribute CLOCKING_MODE of BufferFifoIP_512_xpm_fifo_axis : entity is "common_clock";
  attribute ECC_MODE : string;
  attribute ECC_MODE of BufferFifoIP_512_xpm_fifo_axis : entity is "no_ecc";
  attribute EN_ADV_FEATURE_AXIS : string;
  attribute EN_ADV_FEATURE_AXIS of BufferFifoIP_512_xpm_fifo_axis : entity is "16'b0001100000001000";
  attribute EN_ADV_FEATURE_AXIS_INT : string;
  attribute EN_ADV_FEATURE_AXIS_INT of BufferFifoIP_512_xpm_fifo_axis : entity is "16'b0001100000001000";
  attribute EN_ALMOST_EMPTY_INT : string;
  attribute EN_ALMOST_EMPTY_INT of BufferFifoIP_512_xpm_fifo_axis : entity is "1'b1";
  attribute EN_ALMOST_FULL_INT : string;
  attribute EN_ALMOST_FULL_INT of BufferFifoIP_512_xpm_fifo_axis : entity is "1'b1";
  attribute EN_DATA_VALID_INT : string;
  attribute EN_DATA_VALID_INT of BufferFifoIP_512_xpm_fifo_axis : entity is "1'b1";
  attribute FIFO_DEPTH : integer;
  attribute FIFO_DEPTH of BufferFifoIP_512_xpm_fifo_axis : entity is 64;
  attribute FIFO_MEMORY_TYPE : string;
  attribute FIFO_MEMORY_TYPE of BufferFifoIP_512_xpm_fifo_axis : entity is "ultra";
  attribute LOG_DEPTH_AXIS : integer;
  attribute LOG_DEPTH_AXIS of BufferFifoIP_512_xpm_fifo_axis : entity is 6;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of BufferFifoIP_512_xpm_fifo_axis : entity is "xpm_fifo_axis";
  attribute PACKET_FIFO : string;
  attribute PACKET_FIFO of BufferFifoIP_512_xpm_fifo_axis : entity is "true";
  attribute PKT_SIZE_LT8 : string;
  attribute PKT_SIZE_LT8 of BufferFifoIP_512_xpm_fifo_axis : entity is "1'b0";
  attribute PROG_EMPTY_THRESH : integer;
  attribute PROG_EMPTY_THRESH of BufferFifoIP_512_xpm_fifo_axis : entity is 5;
  attribute PROG_FULL_THRESH : integer;
  attribute PROG_FULL_THRESH of BufferFifoIP_512_xpm_fifo_axis : entity is 11;
  attribute P_COMMON_CLOCK : integer;
  attribute P_COMMON_CLOCK of BufferFifoIP_512_xpm_fifo_axis : entity is 1;
  attribute P_ECC_MODE : integer;
  attribute P_ECC_MODE of BufferFifoIP_512_xpm_fifo_axis : entity is 0;
  attribute P_FIFO_MEMORY_TYPE : integer;
  attribute P_FIFO_MEMORY_TYPE of BufferFifoIP_512_xpm_fifo_axis : entity is 3;
  attribute P_PKT_MODE : integer;
  attribute P_PKT_MODE of BufferFifoIP_512_xpm_fifo_axis : entity is 1;
  attribute RD_DATA_COUNT_WIDTH : integer;
  attribute RD_DATA_COUNT_WIDTH of BufferFifoIP_512_xpm_fifo_axis : entity is 7;
  attribute RELATED_CLOCKS : integer;
  attribute RELATED_CLOCKS of BufferFifoIP_512_xpm_fifo_axis : entity is 0;
  attribute SIM_ASSERT_CHK : integer;
  attribute SIM_ASSERT_CHK of BufferFifoIP_512_xpm_fifo_axis : entity is 0;
  attribute TDATA_OFFSET : integer;
  attribute TDATA_OFFSET of BufferFifoIP_512_xpm_fifo_axis : entity is 512;
  attribute TDATA_WIDTH : integer;
  attribute TDATA_WIDTH of BufferFifoIP_512_xpm_fifo_axis : entity is 512;
  attribute TDEST_OFFSET : integer;
  attribute TDEST_OFFSET of BufferFifoIP_512_xpm_fifo_axis : entity is 642;
  attribute TDEST_WIDTH : integer;
  attribute TDEST_WIDTH of BufferFifoIP_512_xpm_fifo_axis : entity is 1;
  attribute TID_OFFSET : integer;
  attribute TID_OFFSET of BufferFifoIP_512_xpm_fifo_axis : entity is 641;
  attribute TID_WIDTH : integer;
  attribute TID_WIDTH of BufferFifoIP_512_xpm_fifo_axis : entity is 1;
  attribute TKEEP_OFFSET : integer;
  attribute TKEEP_OFFSET of BufferFifoIP_512_xpm_fifo_axis : entity is 640;
  attribute TSTRB_OFFSET : integer;
  attribute TSTRB_OFFSET of BufferFifoIP_512_xpm_fifo_axis : entity is 576;
  attribute TUSER_MAX_WIDTH : integer;
  attribute TUSER_MAX_WIDTH of BufferFifoIP_512_xpm_fifo_axis : entity is 3453;
  attribute TUSER_OFFSET : integer;
  attribute TUSER_OFFSET of BufferFifoIP_512_xpm_fifo_axis : entity is 643;
  attribute TUSER_WIDTH : integer;
  attribute TUSER_WIDTH of BufferFifoIP_512_xpm_fifo_axis : entity is 1;
  attribute USE_ADV_FEATURES : integer;
  attribute USE_ADV_FEATURES of BufferFifoIP_512_xpm_fifo_axis : entity is 825765944;
  attribute USE_ADV_FEATURES_INT : integer;
  attribute USE_ADV_FEATURES_INT of BufferFifoIP_512_xpm_fifo_axis : entity is 825765944;
  attribute WR_DATA_COUNT_WIDTH : integer;
  attribute WR_DATA_COUNT_WIDTH of BufferFifoIP_512_xpm_fifo_axis : entity is 7;
  attribute XPM_MODULE : string;
  attribute XPM_MODULE of BufferFifoIP_512_xpm_fifo_axis : entity is "TRUE";
  attribute dont_touch : string;
  attribute dont_touch of BufferFifoIP_512_xpm_fifo_axis : entity is "true";
end BufferFifoIP_512_xpm_fifo_axis;

architecture STRUCTURE of BufferFifoIP_512_xpm_fifo_axis is
  signal \<const0>\ : STD_LOGIC;
  signal \^almost_full_axis\ : STD_LOGIC;
  signal axis_pkt_read : STD_LOGIC;
  signal axis_rd_eop1 : STD_LOGIC;
  signal axis_wr_eop_d1 : STD_LOGIC;
  signal data_valid_axis : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_10_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_3_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_4_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_5_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_6_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_7_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_8_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_9_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt[16]_i_2_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt[16]_i_3_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt[16]_i_4_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt[16]_i_5_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt[16]_i_6_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt[16]_i_7_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt[16]_i_8_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt[16]_i_9_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt[24]_i_2_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt[24]_i_3_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt[24]_i_4_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt[24]_i_5_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt[24]_i_6_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt[24]_i_7_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt[24]_i_8_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt[24]_i_9_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt[8]_i_2_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt[8]_i_3_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt[8]_i_4_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt[8]_i_5_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt[8]_i_6_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt[8]_i_7_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt[8]_i_8_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt[8]_i_9_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[0]_i_2_n_10\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[0]_i_2_n_11\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[0]_i_2_n_12\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[0]_i_2_n_13\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[0]_i_2_n_14\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[0]_i_2_n_15\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[0]_i_2_n_8\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[0]_i_2_n_9\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[16]_i_1_n_10\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[16]_i_1_n_11\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[16]_i_1_n_12\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[16]_i_1_n_13\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[16]_i_1_n_14\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[16]_i_1_n_15\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[16]_i_1_n_8\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[16]_i_1_n_9\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[24]_i_1_n_10\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[24]_i_1_n_11\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[24]_i_1_n_12\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[24]_i_1_n_13\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[24]_i_1_n_14\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[24]_i_1_n_15\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[24]_i_1_n_8\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[24]_i_1_n_9\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[8]_i_1_n_10\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[8]_i_1_n_11\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[8]_i_1_n_12\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[8]_i_1_n_13\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[8]_i_1_n_14\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[8]_i_1_n_15\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[8]_i_1_n_8\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[8]_i_1_n_9\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_i_10_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_i_11_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_i_12_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_i_13_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_i_14_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_i_15_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_i_16_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_i_17_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_i_18_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_i_19_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_i_1_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_i_20_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_i_21_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_i_22_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_i_24_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_i_25_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_i_26_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_i_27_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_i_28_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_i_29_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_i_30_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_i_31_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_i_32_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_i_33_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_i_34_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_i_35_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_i_36_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_i_37_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_i_38_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_i_39_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_i_3_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_i_40_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_i_41_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_i_42_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_i_43_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_i_5_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_i_6_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_i_7_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_i_8_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_i_9_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_reg_i_2_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_reg_i_2_n_1\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_reg_i_2_n_2\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_reg_i_2_n_3\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_reg_i_2_n_4\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_reg_i_2_n_5\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_reg_i_2_n_6\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_reg_i_2_n_7\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_reg_i_4_n_0\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_reg_i_4_n_1\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_reg_i_4_n_2\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_reg_i_4_n_3\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_reg_i_4_n_4\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_reg_i_4_n_5\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_reg_i_4_n_6\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_pkt_read_reg_i_4_n_7\ : STD_LOGIC;
  signal \gaxis_pkt_fifo_cc.axis_wr_eop_d1_i_1_n_0\ : STD_LOGIC;
  signal \gaxis_rst_sync.xpm_cdc_sync_rst_inst_i_1_n_0\ : STD_LOGIC;
  signal \^m_axis_tlast\ : STD_LOGIC;
  signal p_3_in : STD_LOGIC;
  signal rst_axis : STD_LOGIC;
  signal \^s_axis_tready\ : STD_LOGIC;
  signal \NLW_gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[24]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 to 7 );
  signal \NLW_gaxis_pkt_fifo_cc.axis_pkt_read_reg_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gaxis_pkt_fifo_cc.axis_pkt_read_reg_i_4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_xpm_fifo_base_inst_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_xpm_fifo_base_inst_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_xpm_fifo_base_inst_full_UNCONNECTED : STD_LOGIC;
  signal NLW_xpm_fifo_base_inst_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_xpm_fifo_base_inst_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_xpm_fifo_base_inst_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_xpm_fifo_base_inst_rd_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_xpm_fifo_base_inst_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_xpm_fifo_base_inst_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_xpm_fifo_base_inst_wr_ack_UNCONNECTED : STD_LOGIC;
  signal NLW_xpm_fifo_base_inst_wr_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_xpm_fifo_base_inst_dout_UNCONNECTED : STD_LOGIC_VECTOR ( 642 downto 512 );
  signal NLW_xpm_fifo_base_inst_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal NLW_xpm_fifo_base_inst_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 6 downto 0 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[0]_i_2\ : label is 16;
  attribute ADDER_THRESHOLD of \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[16]_i_1\ : label is 16;
  attribute ADDER_THRESHOLD of \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[24]_i_1\ : label is 16;
  attribute ADDER_THRESHOLD of \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[8]_i_1\ : label is 16;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \gaxis_pkt_fifo_cc.axis_pkt_read_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \gaxis_pkt_fifo_cc.axis_pkt_read_i_23\ : label is "soft_lutpair13";
  attribute COMPARATOR_THRESHOLD : integer;
  attribute COMPARATOR_THRESHOLD of \gaxis_pkt_fifo_cc.axis_pkt_read_reg_i_2\ : label is 11;
  attribute COMPARATOR_THRESHOLD of \gaxis_pkt_fifo_cc.axis_pkt_read_reg_i_4\ : label is 11;
  attribute DEF_VAL : string;
  attribute DEF_VAL of \gaxis_rst_sync.xpm_cdc_sync_rst_inst\ : label is "1'b0";
  attribute DEST_SYNC_FF : integer;
  attribute DEST_SYNC_FF of \gaxis_rst_sync.xpm_cdc_sync_rst_inst\ : label is 4;
  attribute INIT : string;
  attribute INIT of \gaxis_rst_sync.xpm_cdc_sync_rst_inst\ : label is "0";
  attribute INIT_SYNC_FF : integer;
  attribute INIT_SYNC_FF of \gaxis_rst_sync.xpm_cdc_sync_rst_inst\ : label is 1;
  attribute KEEP_HIERARCHY : string;
  attribute KEEP_HIERARCHY of \gaxis_rst_sync.xpm_cdc_sync_rst_inst\ : label is "true";
  attribute SIM_ASSERT_CHK of \gaxis_rst_sync.xpm_cdc_sync_rst_inst\ : label is 0;
  attribute VERSION : integer;
  attribute VERSION of \gaxis_rst_sync.xpm_cdc_sync_rst_inst\ : label is 0;
  attribute XPM_CDC : string;
  attribute XPM_CDC of \gaxis_rst_sync.xpm_cdc_sync_rst_inst\ : label is "SYNC_RST";
  attribute XPM_MODULE of \gaxis_rst_sync.xpm_cdc_sync_rst_inst\ : label is "TRUE";
  attribute SOFT_HLUTNM of m_axis_tvalid_INST_0 : label is "soft_lutpair12";
  attribute CASCADE_HEIGHT of xpm_fifo_base_inst : label is 0;
  attribute CDC_DEST_SYNC_FF : integer;
  attribute CDC_DEST_SYNC_FF of xpm_fifo_base_inst : label is 3;
  attribute COMMON_CLOCK : integer;
  attribute COMMON_CLOCK of xpm_fifo_base_inst : label is 1;
  attribute DOUT_RESET_VALUE : string;
  attribute DOUT_RESET_VALUE of xpm_fifo_base_inst : label is "";
  attribute ECC_MODE_integer : integer;
  attribute ECC_MODE_integer of xpm_fifo_base_inst : label is 0;
  attribute ENABLE_ECC : integer;
  attribute ENABLE_ECC of xpm_fifo_base_inst : label is 0;
  attribute EN_ADV_FEATURE : string;
  attribute EN_ADV_FEATURE of xpm_fifo_base_inst : label is "16'b0001100000001000";
  attribute EN_AE : string;
  attribute EN_AE of xpm_fifo_base_inst : label is "1'b1";
  attribute EN_AF : string;
  attribute EN_AF of xpm_fifo_base_inst : label is "1'b1";
  attribute EN_DVLD : string;
  attribute EN_DVLD of xpm_fifo_base_inst : label is "1'b1";
  attribute EN_OF : string;
  attribute EN_OF of xpm_fifo_base_inst : label is "1'b0";
  attribute EN_PE : string;
  attribute EN_PE of xpm_fifo_base_inst : label is "1'b0";
  attribute EN_PF : string;
  attribute EN_PF of xpm_fifo_base_inst : label is "1'b0";
  attribute EN_RDC : string;
  attribute EN_RDC of xpm_fifo_base_inst : label is "1'b0";
  attribute EN_UF : string;
  attribute EN_UF of xpm_fifo_base_inst : label is "1'b0";
  attribute EN_WACK : string;
  attribute EN_WACK of xpm_fifo_base_inst : label is "1'b0";
  attribute EN_WDC : string;
  attribute EN_WDC of xpm_fifo_base_inst : label is "1'b0";
  attribute FG_EQ_ASYM_DOUT : string;
  attribute FG_EQ_ASYM_DOUT of xpm_fifo_base_inst : label is "1'b0";
  attribute FIFO_MEMORY_TYPE_integer : integer;
  attribute FIFO_MEMORY_TYPE_integer of xpm_fifo_base_inst : label is 3;
  attribute FIFO_MEM_TYPE : integer;
  attribute FIFO_MEM_TYPE of xpm_fifo_base_inst : label is 3;
  attribute FIFO_READ_DEPTH : integer;
  attribute FIFO_READ_DEPTH of xpm_fifo_base_inst : label is 64;
  attribute FIFO_READ_LATENCY : integer;
  attribute FIFO_READ_LATENCY of xpm_fifo_base_inst : label is 0;
  attribute FIFO_SIZE : integer;
  attribute FIFO_SIZE of xpm_fifo_base_inst : label is 41216;
  attribute FIFO_WRITE_DEPTH : integer;
  attribute FIFO_WRITE_DEPTH of xpm_fifo_base_inst : label is 64;
  attribute FULL_RESET_VALUE : integer;
  attribute FULL_RESET_VALUE of xpm_fifo_base_inst : label is 1;
  attribute FULL_RST_VAL : string;
  attribute FULL_RST_VAL of xpm_fifo_base_inst : label is "1'b1";
  attribute KEEP_HIERARCHY of xpm_fifo_base_inst : label is "soft";
  attribute PE_THRESH_ADJ : integer;
  attribute PE_THRESH_ADJ of xpm_fifo_base_inst : label is 3;
  attribute PE_THRESH_MAX : integer;
  attribute PE_THRESH_MAX of xpm_fifo_base_inst : label is 59;
  attribute PE_THRESH_MIN : integer;
  attribute PE_THRESH_MIN of xpm_fifo_base_inst : label is 5;
  attribute PF_THRESH_ADJ : integer;
  attribute PF_THRESH_ADJ of xpm_fifo_base_inst : label is 9;
  attribute PF_THRESH_MAX : integer;
  attribute PF_THRESH_MAX of xpm_fifo_base_inst : label is 59;
  attribute PF_THRESH_MIN : integer;
  attribute PF_THRESH_MIN of xpm_fifo_base_inst : label is 5;
  attribute PROG_EMPTY_THRESH of xpm_fifo_base_inst : label is 5;
  attribute PROG_FULL_THRESH of xpm_fifo_base_inst : label is 11;
  attribute RD_DATA_COUNT_WIDTH of xpm_fifo_base_inst : label is 7;
  attribute RD_DC_WIDTH_EXT : integer;
  attribute RD_DC_WIDTH_EXT of xpm_fifo_base_inst : label is 7;
  attribute RD_LATENCY : integer;
  attribute RD_LATENCY of xpm_fifo_base_inst : label is 2;
  attribute RD_MODE : integer;
  attribute RD_MODE of xpm_fifo_base_inst : label is 1;
  attribute RD_PNTR_WIDTH : integer;
  attribute RD_PNTR_WIDTH of xpm_fifo_base_inst : label is 6;
  attribute READ_DATA_WIDTH : integer;
  attribute READ_DATA_WIDTH of xpm_fifo_base_inst : label is 644;
  attribute READ_MODE : integer;
  attribute READ_MODE of xpm_fifo_base_inst : label is 1;
  attribute RELATED_CLOCKS of xpm_fifo_base_inst : label is 0;
  attribute REMOVE_WR_RD_PROT_LOGIC : integer;
  attribute REMOVE_WR_RD_PROT_LOGIC of xpm_fifo_base_inst : label is 0;
  attribute SIM_ASSERT_CHK of xpm_fifo_base_inst : label is 0;
  attribute USE_ADV_FEATURES of xpm_fifo_base_inst : label is 825765944;
  attribute VERSION of xpm_fifo_base_inst : label is 0;
  attribute WAKEUP_TIME : integer;
  attribute WAKEUP_TIME of xpm_fifo_base_inst : label is 0;
  attribute WIDTH_RATIO : integer;
  attribute WIDTH_RATIO of xpm_fifo_base_inst : label is 1;
  attribute WRITE_DATA_WIDTH : integer;
  attribute WRITE_DATA_WIDTH of xpm_fifo_base_inst : label is 644;
  attribute WR_DATA_COUNT_WIDTH of xpm_fifo_base_inst : label is 7;
  attribute WR_DC_WIDTH_EXT : integer;
  attribute WR_DC_WIDTH_EXT of xpm_fifo_base_inst : label is 7;
  attribute WR_DEPTH_LOG : integer;
  attribute WR_DEPTH_LOG of xpm_fifo_base_inst : label is 6;
  attribute WR_PNTR_WIDTH : integer;
  attribute WR_PNTR_WIDTH of xpm_fifo_base_inst : label is 6;
  attribute WR_RD_RATIO : integer;
  attribute WR_RD_RATIO of xpm_fifo_base_inst : label is 0;
  attribute WR_WIDTH_LOG : integer;
  attribute WR_WIDTH_LOG of xpm_fifo_base_inst : label is 10;
  attribute XPM_MODULE of xpm_fifo_base_inst : label is "TRUE";
  attribute both_stages_valid : integer;
  attribute both_stages_valid of xpm_fifo_base_inst : label is 3;
  attribute invalid : integer;
  attribute invalid of xpm_fifo_base_inst : label is 0;
  attribute stage1_valid : integer;
  attribute stage1_valid of xpm_fifo_base_inst : label is 2;
  attribute stage2_valid : integer;
  attribute stage2_valid of xpm_fifo_base_inst : label is 1;
  attribute SOFT_HLUTNM of xpm_fifo_base_inst_i_1 : label is "soft_lutpair13";
begin
  almost_full_axis <= \^almost_full_axis\;
  dbiterr_axis <= \<const0>\;
  m_axis_tdest(0) <= \<const0>\;
  m_axis_tid(0) <= \<const0>\;
  m_axis_tkeep(63) <= \<const0>\;
  m_axis_tkeep(62) <= \<const0>\;
  m_axis_tkeep(61) <= \<const0>\;
  m_axis_tkeep(60) <= \<const0>\;
  m_axis_tkeep(59) <= \<const0>\;
  m_axis_tkeep(58) <= \<const0>\;
  m_axis_tkeep(57) <= \<const0>\;
  m_axis_tkeep(56) <= \<const0>\;
  m_axis_tkeep(55) <= \<const0>\;
  m_axis_tkeep(54) <= \<const0>\;
  m_axis_tkeep(53) <= \<const0>\;
  m_axis_tkeep(52) <= \<const0>\;
  m_axis_tkeep(51) <= \<const0>\;
  m_axis_tkeep(50) <= \<const0>\;
  m_axis_tkeep(49) <= \<const0>\;
  m_axis_tkeep(48) <= \<const0>\;
  m_axis_tkeep(47) <= \<const0>\;
  m_axis_tkeep(46) <= \<const0>\;
  m_axis_tkeep(45) <= \<const0>\;
  m_axis_tkeep(44) <= \<const0>\;
  m_axis_tkeep(43) <= \<const0>\;
  m_axis_tkeep(42) <= \<const0>\;
  m_axis_tkeep(41) <= \<const0>\;
  m_axis_tkeep(40) <= \<const0>\;
  m_axis_tkeep(39) <= \<const0>\;
  m_axis_tkeep(38) <= \<const0>\;
  m_axis_tkeep(37) <= \<const0>\;
  m_axis_tkeep(36) <= \<const0>\;
  m_axis_tkeep(35) <= \<const0>\;
  m_axis_tkeep(34) <= \<const0>\;
  m_axis_tkeep(33) <= \<const0>\;
  m_axis_tkeep(32) <= \<const0>\;
  m_axis_tkeep(31) <= \<const0>\;
  m_axis_tkeep(30) <= \<const0>\;
  m_axis_tkeep(29) <= \<const0>\;
  m_axis_tkeep(28) <= \<const0>\;
  m_axis_tkeep(27) <= \<const0>\;
  m_axis_tkeep(26) <= \<const0>\;
  m_axis_tkeep(25) <= \<const0>\;
  m_axis_tkeep(24) <= \<const0>\;
  m_axis_tkeep(23) <= \<const0>\;
  m_axis_tkeep(22) <= \<const0>\;
  m_axis_tkeep(21) <= \<const0>\;
  m_axis_tkeep(20) <= \<const0>\;
  m_axis_tkeep(19) <= \<const0>\;
  m_axis_tkeep(18) <= \<const0>\;
  m_axis_tkeep(17) <= \<const0>\;
  m_axis_tkeep(16) <= \<const0>\;
  m_axis_tkeep(15) <= \<const0>\;
  m_axis_tkeep(14) <= \<const0>\;
  m_axis_tkeep(13) <= \<const0>\;
  m_axis_tkeep(12) <= \<const0>\;
  m_axis_tkeep(11) <= \<const0>\;
  m_axis_tkeep(10) <= \<const0>\;
  m_axis_tkeep(9) <= \<const0>\;
  m_axis_tkeep(8) <= \<const0>\;
  m_axis_tkeep(7) <= \<const0>\;
  m_axis_tkeep(6) <= \<const0>\;
  m_axis_tkeep(5) <= \<const0>\;
  m_axis_tkeep(4) <= \<const0>\;
  m_axis_tkeep(3) <= \<const0>\;
  m_axis_tkeep(2) <= \<const0>\;
  m_axis_tkeep(1) <= \<const0>\;
  m_axis_tkeep(0) <= \<const0>\;
  m_axis_tlast <= \^m_axis_tlast\;
  m_axis_tstrb(63) <= \<const0>\;
  m_axis_tstrb(62) <= \<const0>\;
  m_axis_tstrb(61) <= \<const0>\;
  m_axis_tstrb(60) <= \<const0>\;
  m_axis_tstrb(59) <= \<const0>\;
  m_axis_tstrb(58) <= \<const0>\;
  m_axis_tstrb(57) <= \<const0>\;
  m_axis_tstrb(56) <= \<const0>\;
  m_axis_tstrb(55) <= \<const0>\;
  m_axis_tstrb(54) <= \<const0>\;
  m_axis_tstrb(53) <= \<const0>\;
  m_axis_tstrb(52) <= \<const0>\;
  m_axis_tstrb(51) <= \<const0>\;
  m_axis_tstrb(50) <= \<const0>\;
  m_axis_tstrb(49) <= \<const0>\;
  m_axis_tstrb(48) <= \<const0>\;
  m_axis_tstrb(47) <= \<const0>\;
  m_axis_tstrb(46) <= \<const0>\;
  m_axis_tstrb(45) <= \<const0>\;
  m_axis_tstrb(44) <= \<const0>\;
  m_axis_tstrb(43) <= \<const0>\;
  m_axis_tstrb(42) <= \<const0>\;
  m_axis_tstrb(41) <= \<const0>\;
  m_axis_tstrb(40) <= \<const0>\;
  m_axis_tstrb(39) <= \<const0>\;
  m_axis_tstrb(38) <= \<const0>\;
  m_axis_tstrb(37) <= \<const0>\;
  m_axis_tstrb(36) <= \<const0>\;
  m_axis_tstrb(35) <= \<const0>\;
  m_axis_tstrb(34) <= \<const0>\;
  m_axis_tstrb(33) <= \<const0>\;
  m_axis_tstrb(32) <= \<const0>\;
  m_axis_tstrb(31) <= \<const0>\;
  m_axis_tstrb(30) <= \<const0>\;
  m_axis_tstrb(29) <= \<const0>\;
  m_axis_tstrb(28) <= \<const0>\;
  m_axis_tstrb(27) <= \<const0>\;
  m_axis_tstrb(26) <= \<const0>\;
  m_axis_tstrb(25) <= \<const0>\;
  m_axis_tstrb(24) <= \<const0>\;
  m_axis_tstrb(23) <= \<const0>\;
  m_axis_tstrb(22) <= \<const0>\;
  m_axis_tstrb(21) <= \<const0>\;
  m_axis_tstrb(20) <= \<const0>\;
  m_axis_tstrb(19) <= \<const0>\;
  m_axis_tstrb(18) <= \<const0>\;
  m_axis_tstrb(17) <= \<const0>\;
  m_axis_tstrb(16) <= \<const0>\;
  m_axis_tstrb(15) <= \<const0>\;
  m_axis_tstrb(14) <= \<const0>\;
  m_axis_tstrb(13) <= \<const0>\;
  m_axis_tstrb(12) <= \<const0>\;
  m_axis_tstrb(11) <= \<const0>\;
  m_axis_tstrb(10) <= \<const0>\;
  m_axis_tstrb(9) <= \<const0>\;
  m_axis_tstrb(8) <= \<const0>\;
  m_axis_tstrb(7) <= \<const0>\;
  m_axis_tstrb(6) <= \<const0>\;
  m_axis_tstrb(5) <= \<const0>\;
  m_axis_tstrb(4) <= \<const0>\;
  m_axis_tstrb(3) <= \<const0>\;
  m_axis_tstrb(2) <= \<const0>\;
  m_axis_tstrb(1) <= \<const0>\;
  m_axis_tstrb(0) <= \<const0>\;
  m_axis_tuser(0) <= \<const0>\;
  prog_empty_axis <= \<const0>\;
  prog_full_axis <= \<const0>\;
  rd_data_count_axis(6) <= \<const0>\;
  rd_data_count_axis(5) <= \<const0>\;
  rd_data_count_axis(4) <= \<const0>\;
  rd_data_count_axis(3) <= \<const0>\;
  rd_data_count_axis(2) <= \<const0>\;
  rd_data_count_axis(1) <= \<const0>\;
  rd_data_count_axis(0) <= \<const0>\;
  s_axis_tready <= \^s_axis_tready\;
  sbiterr_axis <= \<const0>\;
  wr_data_count_axis(6) <= \<const0>\;
  wr_data_count_axis(5) <= \<const0>\;
  wr_data_count_axis(4) <= \<const0>\;
  wr_data_count_axis(3) <= \<const0>\;
  wr_data_count_axis(2) <= \<const0>\;
  wr_data_count_axis(1) <= \<const0>\;
  wr_data_count_axis(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => axis_wr_eop_d1,
      I1 => m_axis_tready,
      I2 => data_valid_axis,
      I3 => \^m_axis_tlast\,
      I4 => axis_pkt_read,
      O => \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_1_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_10\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(0),
      O => \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_10_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF00008000FFFF"
    )
        port map (
      I0 => m_axis_tready,
      I1 => data_valid_axis,
      I2 => \^m_axis_tlast\,
      I3 => axis_pkt_read,
      I4 => axis_wr_eop_d1,
      I5 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(7),
      O => \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_3_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF00008000FFFF"
    )
        port map (
      I0 => m_axis_tready,
      I1 => data_valid_axis,
      I2 => \^m_axis_tlast\,
      I3 => axis_pkt_read,
      I4 => axis_wr_eop_d1,
      I5 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(6),
      O => \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_4_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF00008000FFFF"
    )
        port map (
      I0 => m_axis_tready,
      I1 => data_valid_axis,
      I2 => \^m_axis_tlast\,
      I3 => axis_pkt_read,
      I4 => axis_wr_eop_d1,
      I5 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(5),
      O => \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_5_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF00008000FFFF"
    )
        port map (
      I0 => m_axis_tready,
      I1 => data_valid_axis,
      I2 => \^m_axis_tlast\,
      I3 => axis_pkt_read,
      I4 => axis_wr_eop_d1,
      I5 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(4),
      O => \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_6_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF00008000FFFF"
    )
        port map (
      I0 => m_axis_tready,
      I1 => data_valid_axis,
      I2 => \^m_axis_tlast\,
      I3 => axis_pkt_read,
      I4 => axis_wr_eop_d1,
      I5 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(3),
      O => \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_7_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF00008000FFFF"
    )
        port map (
      I0 => m_axis_tready,
      I1 => data_valid_axis,
      I2 => \^m_axis_tlast\,
      I3 => axis_pkt_read,
      I4 => axis_wr_eop_d1,
      I5 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(2),
      O => \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_8_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF00008000FFFF"
    )
        port map (
      I0 => m_axis_tready,
      I1 => data_valid_axis,
      I2 => \^m_axis_tlast\,
      I3 => axis_pkt_read,
      I4 => axis_wr_eop_d1,
      I5 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(1),
      O => \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_9_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt[16]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF00008000FFFF"
    )
        port map (
      I0 => m_axis_tready,
      I1 => data_valid_axis,
      I2 => \^m_axis_tlast\,
      I3 => axis_pkt_read,
      I4 => axis_wr_eop_d1,
      I5 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(23),
      O => \gaxis_pkt_fifo_cc.axis_pkt_cnt[16]_i_2_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt[16]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF00008000FFFF"
    )
        port map (
      I0 => m_axis_tready,
      I1 => data_valid_axis,
      I2 => \^m_axis_tlast\,
      I3 => axis_pkt_read,
      I4 => axis_wr_eop_d1,
      I5 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(22),
      O => \gaxis_pkt_fifo_cc.axis_pkt_cnt[16]_i_3_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt[16]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF00008000FFFF"
    )
        port map (
      I0 => m_axis_tready,
      I1 => data_valid_axis,
      I2 => \^m_axis_tlast\,
      I3 => axis_pkt_read,
      I4 => axis_wr_eop_d1,
      I5 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(21),
      O => \gaxis_pkt_fifo_cc.axis_pkt_cnt[16]_i_4_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt[16]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF00008000FFFF"
    )
        port map (
      I0 => m_axis_tready,
      I1 => data_valid_axis,
      I2 => \^m_axis_tlast\,
      I3 => axis_pkt_read,
      I4 => axis_wr_eop_d1,
      I5 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(20),
      O => \gaxis_pkt_fifo_cc.axis_pkt_cnt[16]_i_5_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt[16]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF00008000FFFF"
    )
        port map (
      I0 => m_axis_tready,
      I1 => data_valid_axis,
      I2 => \^m_axis_tlast\,
      I3 => axis_pkt_read,
      I4 => axis_wr_eop_d1,
      I5 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(19),
      O => \gaxis_pkt_fifo_cc.axis_pkt_cnt[16]_i_6_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt[16]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF00008000FFFF"
    )
        port map (
      I0 => m_axis_tready,
      I1 => data_valid_axis,
      I2 => \^m_axis_tlast\,
      I3 => axis_pkt_read,
      I4 => axis_wr_eop_d1,
      I5 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(18),
      O => \gaxis_pkt_fifo_cc.axis_pkt_cnt[16]_i_7_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt[16]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF00008000FFFF"
    )
        port map (
      I0 => m_axis_tready,
      I1 => data_valid_axis,
      I2 => \^m_axis_tlast\,
      I3 => axis_pkt_read,
      I4 => axis_wr_eop_d1,
      I5 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(17),
      O => \gaxis_pkt_fifo_cc.axis_pkt_cnt[16]_i_8_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt[16]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF00008000FFFF"
    )
        port map (
      I0 => m_axis_tready,
      I1 => data_valid_axis,
      I2 => \^m_axis_tlast\,
      I3 => axis_pkt_read,
      I4 => axis_wr_eop_d1,
      I5 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(16),
      O => \gaxis_pkt_fifo_cc.axis_pkt_cnt[16]_i_9_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt[24]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF00008000FFFF"
    )
        port map (
      I0 => m_axis_tready,
      I1 => data_valid_axis,
      I2 => \^m_axis_tlast\,
      I3 => axis_pkt_read,
      I4 => axis_wr_eop_d1,
      I5 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(31),
      O => \gaxis_pkt_fifo_cc.axis_pkt_cnt[24]_i_2_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt[24]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF00008000FFFF"
    )
        port map (
      I0 => m_axis_tready,
      I1 => data_valid_axis,
      I2 => \^m_axis_tlast\,
      I3 => axis_pkt_read,
      I4 => axis_wr_eop_d1,
      I5 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(30),
      O => \gaxis_pkt_fifo_cc.axis_pkt_cnt[24]_i_3_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt[24]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF00008000FFFF"
    )
        port map (
      I0 => m_axis_tready,
      I1 => data_valid_axis,
      I2 => \^m_axis_tlast\,
      I3 => axis_pkt_read,
      I4 => axis_wr_eop_d1,
      I5 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(29),
      O => \gaxis_pkt_fifo_cc.axis_pkt_cnt[24]_i_4_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt[24]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF00008000FFFF"
    )
        port map (
      I0 => m_axis_tready,
      I1 => data_valid_axis,
      I2 => \^m_axis_tlast\,
      I3 => axis_pkt_read,
      I4 => axis_wr_eop_d1,
      I5 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(28),
      O => \gaxis_pkt_fifo_cc.axis_pkt_cnt[24]_i_5_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt[24]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF00008000FFFF"
    )
        port map (
      I0 => m_axis_tready,
      I1 => data_valid_axis,
      I2 => \^m_axis_tlast\,
      I3 => axis_pkt_read,
      I4 => axis_wr_eop_d1,
      I5 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(27),
      O => \gaxis_pkt_fifo_cc.axis_pkt_cnt[24]_i_6_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt[24]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF00008000FFFF"
    )
        port map (
      I0 => m_axis_tready,
      I1 => data_valid_axis,
      I2 => \^m_axis_tlast\,
      I3 => axis_pkt_read,
      I4 => axis_wr_eop_d1,
      I5 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(26),
      O => \gaxis_pkt_fifo_cc.axis_pkt_cnt[24]_i_7_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt[24]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF00008000FFFF"
    )
        port map (
      I0 => m_axis_tready,
      I1 => data_valid_axis,
      I2 => \^m_axis_tlast\,
      I3 => axis_pkt_read,
      I4 => axis_wr_eop_d1,
      I5 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(25),
      O => \gaxis_pkt_fifo_cc.axis_pkt_cnt[24]_i_8_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt[24]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF00008000FFFF"
    )
        port map (
      I0 => m_axis_tready,
      I1 => data_valid_axis,
      I2 => \^m_axis_tlast\,
      I3 => axis_pkt_read,
      I4 => axis_wr_eop_d1,
      I5 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(24),
      O => \gaxis_pkt_fifo_cc.axis_pkt_cnt[24]_i_9_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF00008000FFFF"
    )
        port map (
      I0 => m_axis_tready,
      I1 => data_valid_axis,
      I2 => \^m_axis_tlast\,
      I3 => axis_pkt_read,
      I4 => axis_wr_eop_d1,
      I5 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(15),
      O => \gaxis_pkt_fifo_cc.axis_pkt_cnt[8]_i_2_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt[8]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF00008000FFFF"
    )
        port map (
      I0 => m_axis_tready,
      I1 => data_valid_axis,
      I2 => \^m_axis_tlast\,
      I3 => axis_pkt_read,
      I4 => axis_wr_eop_d1,
      I5 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(14),
      O => \gaxis_pkt_fifo_cc.axis_pkt_cnt[8]_i_3_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt[8]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF00008000FFFF"
    )
        port map (
      I0 => m_axis_tready,
      I1 => data_valid_axis,
      I2 => \^m_axis_tlast\,
      I3 => axis_pkt_read,
      I4 => axis_wr_eop_d1,
      I5 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(13),
      O => \gaxis_pkt_fifo_cc.axis_pkt_cnt[8]_i_4_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt[8]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF00008000FFFF"
    )
        port map (
      I0 => m_axis_tready,
      I1 => data_valid_axis,
      I2 => \^m_axis_tlast\,
      I3 => axis_pkt_read,
      I4 => axis_wr_eop_d1,
      I5 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(12),
      O => \gaxis_pkt_fifo_cc.axis_pkt_cnt[8]_i_5_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt[8]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF00008000FFFF"
    )
        port map (
      I0 => m_axis_tready,
      I1 => data_valid_axis,
      I2 => \^m_axis_tlast\,
      I3 => axis_pkt_read,
      I4 => axis_wr_eop_d1,
      I5 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(11),
      O => \gaxis_pkt_fifo_cc.axis_pkt_cnt[8]_i_6_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt[8]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF00008000FFFF"
    )
        port map (
      I0 => m_axis_tready,
      I1 => data_valid_axis,
      I2 => \^m_axis_tlast\,
      I3 => axis_pkt_read,
      I4 => axis_wr_eop_d1,
      I5 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(10),
      O => \gaxis_pkt_fifo_cc.axis_pkt_cnt[8]_i_7_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt[8]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF00008000FFFF"
    )
        port map (
      I0 => m_axis_tready,
      I1 => data_valid_axis,
      I2 => \^m_axis_tlast\,
      I3 => axis_pkt_read,
      I4 => axis_wr_eop_d1,
      I5 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(9),
      O => \gaxis_pkt_fifo_cc.axis_pkt_cnt[8]_i_8_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt[8]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF00008000FFFF"
    )
        port map (
      I0 => m_axis_tready,
      I1 => data_valid_axis,
      I2 => \^m_axis_tlast\,
      I3 => axis_pkt_read,
      I4 => axis_wr_eop_d1,
      I5 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(8),
      O => \gaxis_pkt_fifo_cc.axis_pkt_cnt[8]_i_9_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_aclk,
      CE => \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_1_n_0\,
      D => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[0]_i_2_n_15\,
      Q => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(0),
      R => rst_axis
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[0]_i_2\: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[0]_i_2_n_0\,
      CO(6) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[0]_i_2_n_1\,
      CO(5) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[0]_i_2_n_2\,
      CO(4) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[0]_i_2_n_3\,
      CO(3) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[0]_i_2_n_4\,
      CO(2) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[0]_i_2_n_5\,
      CO(1) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[0]_i_2_n_6\,
      CO(0) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[0]_i_2_n_7\,
      DI(7 downto 1) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(7 downto 1),
      DI(0) => '1',
      O(7) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[0]_i_2_n_8\,
      O(6) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[0]_i_2_n_9\,
      O(5) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[0]_i_2_n_10\,
      O(4) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[0]_i_2_n_11\,
      O(3) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[0]_i_2_n_12\,
      O(2) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[0]_i_2_n_13\,
      O(1) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[0]_i_2_n_14\,
      O(0) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[0]_i_2_n_15\,
      S(7) => \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_3_n_0\,
      S(6) => \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_4_n_0\,
      S(5) => \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_5_n_0\,
      S(4) => \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_6_n_0\,
      S(3) => \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_7_n_0\,
      S(2) => \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_8_n_0\,
      S(1) => \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_9_n_0\,
      S(0) => \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_10_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s_aclk,
      CE => \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_1_n_0\,
      D => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[8]_i_1_n_13\,
      Q => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(10),
      R => rst_axis
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s_aclk,
      CE => \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_1_n_0\,
      D => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[8]_i_1_n_12\,
      Q => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(11),
      R => rst_axis
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s_aclk,
      CE => \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_1_n_0\,
      D => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[8]_i_1_n_11\,
      Q => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(12),
      R => rst_axis
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s_aclk,
      CE => \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_1_n_0\,
      D => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[8]_i_1_n_10\,
      Q => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(13),
      R => rst_axis
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s_aclk,
      CE => \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_1_n_0\,
      D => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[8]_i_1_n_9\,
      Q => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(14),
      R => rst_axis
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s_aclk,
      CE => \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_1_n_0\,
      D => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[8]_i_1_n_8\,
      Q => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(15),
      R => rst_axis
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s_aclk,
      CE => \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_1_n_0\,
      D => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[16]_i_1_n_15\,
      Q => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(16),
      R => rst_axis
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[16]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[8]_i_1_n_0\,
      CI_TOP => '0',
      CO(7) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[16]_i_1_n_0\,
      CO(6) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[16]_i_1_n_1\,
      CO(5) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[16]_i_1_n_2\,
      CO(4) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[16]_i_1_n_3\,
      CO(3) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[16]_i_1_n_4\,
      CO(2) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[16]_i_1_n_5\,
      CO(1) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[16]_i_1_n_6\,
      CO(0) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[16]_i_1_n_7\,
      DI(7 downto 0) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(23 downto 16),
      O(7) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[16]_i_1_n_8\,
      O(6) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[16]_i_1_n_9\,
      O(5) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[16]_i_1_n_10\,
      O(4) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[16]_i_1_n_11\,
      O(3) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[16]_i_1_n_12\,
      O(2) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[16]_i_1_n_13\,
      O(1) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[16]_i_1_n_14\,
      O(0) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[16]_i_1_n_15\,
      S(7) => \gaxis_pkt_fifo_cc.axis_pkt_cnt[16]_i_2_n_0\,
      S(6) => \gaxis_pkt_fifo_cc.axis_pkt_cnt[16]_i_3_n_0\,
      S(5) => \gaxis_pkt_fifo_cc.axis_pkt_cnt[16]_i_4_n_0\,
      S(4) => \gaxis_pkt_fifo_cc.axis_pkt_cnt[16]_i_5_n_0\,
      S(3) => \gaxis_pkt_fifo_cc.axis_pkt_cnt[16]_i_6_n_0\,
      S(2) => \gaxis_pkt_fifo_cc.axis_pkt_cnt[16]_i_7_n_0\,
      S(1) => \gaxis_pkt_fifo_cc.axis_pkt_cnt[16]_i_8_n_0\,
      S(0) => \gaxis_pkt_fifo_cc.axis_pkt_cnt[16]_i_9_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s_aclk,
      CE => \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_1_n_0\,
      D => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[16]_i_1_n_14\,
      Q => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(17),
      R => rst_axis
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s_aclk,
      CE => \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_1_n_0\,
      D => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[16]_i_1_n_13\,
      Q => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(18),
      R => rst_axis
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s_aclk,
      CE => \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_1_n_0\,
      D => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[16]_i_1_n_12\,
      Q => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(19),
      R => rst_axis
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_aclk,
      CE => \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_1_n_0\,
      D => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[0]_i_2_n_14\,
      Q => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(1),
      R => rst_axis
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s_aclk,
      CE => \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_1_n_0\,
      D => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[16]_i_1_n_11\,
      Q => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(20),
      R => rst_axis
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s_aclk,
      CE => \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_1_n_0\,
      D => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[16]_i_1_n_10\,
      Q => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(21),
      R => rst_axis
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s_aclk,
      CE => \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_1_n_0\,
      D => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[16]_i_1_n_9\,
      Q => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(22),
      R => rst_axis
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s_aclk,
      CE => \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_1_n_0\,
      D => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[16]_i_1_n_8\,
      Q => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(23),
      R => rst_axis
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s_aclk,
      CE => \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_1_n_0\,
      D => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[24]_i_1_n_15\,
      Q => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(24),
      R => rst_axis
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[24]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[16]_i_1_n_0\,
      CI_TOP => '0',
      CO(7) => \NLW_gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[24]_i_1_CO_UNCONNECTED\(7),
      CO(6) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[24]_i_1_n_1\,
      CO(5) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[24]_i_1_n_2\,
      CO(4) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[24]_i_1_n_3\,
      CO(3) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[24]_i_1_n_4\,
      CO(2) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[24]_i_1_n_5\,
      CO(1) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[24]_i_1_n_6\,
      CO(0) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[24]_i_1_n_7\,
      DI(7) => '0',
      DI(6 downto 0) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(30 downto 24),
      O(7) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[24]_i_1_n_8\,
      O(6) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[24]_i_1_n_9\,
      O(5) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[24]_i_1_n_10\,
      O(4) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[24]_i_1_n_11\,
      O(3) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[24]_i_1_n_12\,
      O(2) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[24]_i_1_n_13\,
      O(1) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[24]_i_1_n_14\,
      O(0) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[24]_i_1_n_15\,
      S(7) => \gaxis_pkt_fifo_cc.axis_pkt_cnt[24]_i_2_n_0\,
      S(6) => \gaxis_pkt_fifo_cc.axis_pkt_cnt[24]_i_3_n_0\,
      S(5) => \gaxis_pkt_fifo_cc.axis_pkt_cnt[24]_i_4_n_0\,
      S(4) => \gaxis_pkt_fifo_cc.axis_pkt_cnt[24]_i_5_n_0\,
      S(3) => \gaxis_pkt_fifo_cc.axis_pkt_cnt[24]_i_6_n_0\,
      S(2) => \gaxis_pkt_fifo_cc.axis_pkt_cnt[24]_i_7_n_0\,
      S(1) => \gaxis_pkt_fifo_cc.axis_pkt_cnt[24]_i_8_n_0\,
      S(0) => \gaxis_pkt_fifo_cc.axis_pkt_cnt[24]_i_9_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s_aclk,
      CE => \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_1_n_0\,
      D => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[24]_i_1_n_14\,
      Q => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(25),
      R => rst_axis
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s_aclk,
      CE => \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_1_n_0\,
      D => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[24]_i_1_n_13\,
      Q => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(26),
      R => rst_axis
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s_aclk,
      CE => \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_1_n_0\,
      D => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[24]_i_1_n_12\,
      Q => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(27),
      R => rst_axis
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s_aclk,
      CE => \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_1_n_0\,
      D => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[24]_i_1_n_11\,
      Q => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(28),
      R => rst_axis
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s_aclk,
      CE => \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_1_n_0\,
      D => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[24]_i_1_n_10\,
      Q => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(29),
      R => rst_axis
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_aclk,
      CE => \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_1_n_0\,
      D => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[0]_i_2_n_13\,
      Q => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(2),
      R => rst_axis
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s_aclk,
      CE => \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_1_n_0\,
      D => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[24]_i_1_n_9\,
      Q => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(30),
      R => rst_axis
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s_aclk,
      CE => \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_1_n_0\,
      D => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[24]_i_1_n_8\,
      Q => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(31),
      R => rst_axis
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_aclk,
      CE => \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_1_n_0\,
      D => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[0]_i_2_n_12\,
      Q => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(3),
      R => rst_axis
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_aclk,
      CE => \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_1_n_0\,
      D => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[0]_i_2_n_11\,
      Q => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(4),
      R => rst_axis
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_aclk,
      CE => \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_1_n_0\,
      D => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[0]_i_2_n_10\,
      Q => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(5),
      R => rst_axis
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_aclk,
      CE => \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_1_n_0\,
      D => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[0]_i_2_n_9\,
      Q => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(6),
      R => rst_axis
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_aclk,
      CE => \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_1_n_0\,
      D => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[0]_i_2_n_8\,
      Q => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(7),
      R => rst_axis
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_aclk,
      CE => \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_1_n_0\,
      D => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[8]_i_1_n_15\,
      Q => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(8),
      R => rst_axis
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[8]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[0]_i_2_n_0\,
      CI_TOP => '0',
      CO(7) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[8]_i_1_n_0\,
      CO(6) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[8]_i_1_n_1\,
      CO(5) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[8]_i_1_n_2\,
      CO(4) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[8]_i_1_n_3\,
      CO(3) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[8]_i_1_n_4\,
      CO(2) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[8]_i_1_n_5\,
      CO(1) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[8]_i_1_n_6\,
      CO(0) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[8]_i_1_n_7\,
      DI(7 downto 0) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(15 downto 8),
      O(7) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[8]_i_1_n_8\,
      O(6) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[8]_i_1_n_9\,
      O(5) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[8]_i_1_n_10\,
      O(4) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[8]_i_1_n_11\,
      O(3) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[8]_i_1_n_12\,
      O(2) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[8]_i_1_n_13\,
      O(1) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[8]_i_1_n_14\,
      O(0) => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[8]_i_1_n_15\,
      S(7) => \gaxis_pkt_fifo_cc.axis_pkt_cnt[8]_i_2_n_0\,
      S(6) => \gaxis_pkt_fifo_cc.axis_pkt_cnt[8]_i_3_n_0\,
      S(5) => \gaxis_pkt_fifo_cc.axis_pkt_cnt[8]_i_4_n_0\,
      S(4) => \gaxis_pkt_fifo_cc.axis_pkt_cnt[8]_i_5_n_0\,
      S(3) => \gaxis_pkt_fifo_cc.axis_pkt_cnt[8]_i_6_n_0\,
      S(2) => \gaxis_pkt_fifo_cc.axis_pkt_cnt[8]_i_7_n_0\,
      S(1) => \gaxis_pkt_fifo_cc.axis_pkt_cnt[8]_i_8_n_0\,
      S(0) => \gaxis_pkt_fifo_cc.axis_pkt_cnt[8]_i_9_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s_aclk,
      CE => \gaxis_pkt_fifo_cc.axis_pkt_cnt[0]_i_1_n_0\,
      D => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg[8]_i_1_n_14\,
      Q => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(9),
      R => rst_axis
    );
\gaxis_pkt_fifo_cc.axis_pkt_read_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FEEE"
    )
        port map (
      I0 => axis_pkt_read,
      I1 => \gaxis_pkt_fifo_cc.axis_pkt_read_reg_i_2_n_0\,
      I2 => data_valid_axis,
      I3 => \^almost_full_axis\,
      I4 => \gaxis_pkt_fifo_cc.axis_pkt_read_i_3_n_0\,
      O => \gaxis_pkt_fifo_cc.axis_pkt_read_i_1_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_read_i_10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(20),
      I1 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(21),
      O => \gaxis_pkt_fifo_cc.axis_pkt_read_i_10_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_read_i_11\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(18),
      I1 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(19),
      O => \gaxis_pkt_fifo_cc.axis_pkt_read_i_11_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_read_i_12\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(16),
      I1 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(17),
      O => \gaxis_pkt_fifo_cc.axis_pkt_read_i_12_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_read_i_13\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(31),
      I1 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(30),
      O => \gaxis_pkt_fifo_cc.axis_pkt_read_i_13_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_read_i_14\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(28),
      I1 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(29),
      O => \gaxis_pkt_fifo_cc.axis_pkt_read_i_14_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_read_i_15\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(26),
      I1 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(27),
      O => \gaxis_pkt_fifo_cc.axis_pkt_read_i_15_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_read_i_16\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(24),
      I1 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(25),
      O => \gaxis_pkt_fifo_cc.axis_pkt_read_i_16_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_read_i_17\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(22),
      I1 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(23),
      O => \gaxis_pkt_fifo_cc.axis_pkt_read_i_17_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_read_i_18\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(20),
      I1 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(21),
      O => \gaxis_pkt_fifo_cc.axis_pkt_read_i_18_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_read_i_19\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(18),
      I1 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(19),
      O => \gaxis_pkt_fifo_cc.axis_pkt_read_i_19_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_read_i_20\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(16),
      I1 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(17),
      O => \gaxis_pkt_fifo_cc.axis_pkt_read_i_20_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_read_i_21\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \gaxis_pkt_fifo_cc.axis_pkt_read_i_40_n_0\,
      I1 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(30),
      I2 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(31),
      I3 => \gaxis_pkt_fifo_cc.axis_pkt_read_i_41_n_0\,
      I4 => \gaxis_pkt_fifo_cc.axis_pkt_read_i_42_n_0\,
      I5 => \gaxis_pkt_fifo_cc.axis_pkt_read_i_43_n_0\,
      O => \gaxis_pkt_fifo_cc.axis_pkt_read_i_21_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_read_i_22\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(24),
      I1 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(25),
      I2 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(26),
      I3 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(27),
      I4 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(28),
      I5 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(29),
      O => \gaxis_pkt_fifo_cc.axis_pkt_read_i_22_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_read_i_23\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => m_axis_tready,
      I1 => data_valid_axis,
      I2 => \^m_axis_tlast\,
      I3 => axis_pkt_read,
      O => p_3_in
    );
\gaxis_pkt_fifo_cc.axis_pkt_read_i_24\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(14),
      I1 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(15),
      O => \gaxis_pkt_fifo_cc.axis_pkt_read_i_24_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_read_i_25\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(12),
      I1 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(13),
      O => \gaxis_pkt_fifo_cc.axis_pkt_read_i_25_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_read_i_26\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(10),
      I1 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(11),
      O => \gaxis_pkt_fifo_cc.axis_pkt_read_i_26_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_read_i_27\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(8),
      I1 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(9),
      O => \gaxis_pkt_fifo_cc.axis_pkt_read_i_27_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_read_i_28\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(6),
      I1 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(7),
      O => \gaxis_pkt_fifo_cc.axis_pkt_read_i_28_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_read_i_29\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(4),
      I1 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(5),
      O => \gaxis_pkt_fifo_cc.axis_pkt_read_i_29_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_read_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAABAAAA"
    )
        port map (
      I0 => rst_axis,
      I1 => \gaxis_pkt_fifo_cc.axis_pkt_read_i_21_n_0\,
      I2 => \gaxis_pkt_fifo_cc.axis_pkt_read_i_22_n_0\,
      I3 => axis_wr_eop_d1,
      I4 => p_3_in,
      O => \gaxis_pkt_fifo_cc.axis_pkt_read_i_3_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_read_i_30\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(2),
      I1 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(3),
      O => \gaxis_pkt_fifo_cc.axis_pkt_read_i_30_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_read_i_31\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(0),
      I1 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(1),
      O => \gaxis_pkt_fifo_cc.axis_pkt_read_i_31_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_read_i_32\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(14),
      I1 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(15),
      O => \gaxis_pkt_fifo_cc.axis_pkt_read_i_32_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_read_i_33\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(12),
      I1 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(13),
      O => \gaxis_pkt_fifo_cc.axis_pkt_read_i_33_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_read_i_34\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(10),
      I1 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(11),
      O => \gaxis_pkt_fifo_cc.axis_pkt_read_i_34_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_read_i_35\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(8),
      I1 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(9),
      O => \gaxis_pkt_fifo_cc.axis_pkt_read_i_35_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_read_i_36\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(6),
      I1 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(7),
      O => \gaxis_pkt_fifo_cc.axis_pkt_read_i_36_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_read_i_37\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(4),
      I1 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(5),
      O => \gaxis_pkt_fifo_cc.axis_pkt_read_i_37_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_read_i_38\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(2),
      I1 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(3),
      O => \gaxis_pkt_fifo_cc.axis_pkt_read_i_38_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_read_i_39\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(0),
      I1 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(1),
      O => \gaxis_pkt_fifo_cc.axis_pkt_read_i_39_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_read_i_40\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFEF"
    )
        port map (
      I0 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(1),
      I1 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(2),
      I2 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(0),
      I3 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(3),
      I4 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(4),
      I5 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(5),
      O => \gaxis_pkt_fifo_cc.axis_pkt_read_i_40_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_read_i_41\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(12),
      I1 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(13),
      I2 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(14),
      I3 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(15),
      I4 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(16),
      I5 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(17),
      O => \gaxis_pkt_fifo_cc.axis_pkt_read_i_41_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_read_i_42\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(18),
      I1 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(19),
      I2 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(20),
      I3 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(21),
      I4 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(22),
      I5 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(23),
      O => \gaxis_pkt_fifo_cc.axis_pkt_read_i_42_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_read_i_43\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(6),
      I1 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(7),
      I2 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(8),
      I3 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(9),
      I4 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(10),
      I5 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(11),
      O => \gaxis_pkt_fifo_cc.axis_pkt_read_i_43_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_read_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(30),
      I1 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(31),
      O => \gaxis_pkt_fifo_cc.axis_pkt_read_i_5_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_read_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(28),
      I1 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(29),
      O => \gaxis_pkt_fifo_cc.axis_pkt_read_i_6_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_read_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(26),
      I1 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(27),
      O => \gaxis_pkt_fifo_cc.axis_pkt_read_i_7_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_read_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(24),
      I1 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(25),
      O => \gaxis_pkt_fifo_cc.axis_pkt_read_i_8_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_read_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(22),
      I1 => \gaxis_pkt_fifo_cc.axis_pkt_cnt_reg\(23),
      O => \gaxis_pkt_fifo_cc.axis_pkt_read_i_9_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_read_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_aclk,
      CE => '1',
      D => \gaxis_pkt_fifo_cc.axis_pkt_read_i_1_n_0\,
      Q => axis_pkt_read,
      R => '0'
    );
\gaxis_pkt_fifo_cc.axis_pkt_read_reg_i_2\: unisim.vcomponents.CARRY8
     port map (
      CI => \gaxis_pkt_fifo_cc.axis_pkt_read_reg_i_4_n_0\,
      CI_TOP => '0',
      CO(7) => \gaxis_pkt_fifo_cc.axis_pkt_read_reg_i_2_n_0\,
      CO(6) => \gaxis_pkt_fifo_cc.axis_pkt_read_reg_i_2_n_1\,
      CO(5) => \gaxis_pkt_fifo_cc.axis_pkt_read_reg_i_2_n_2\,
      CO(4) => \gaxis_pkt_fifo_cc.axis_pkt_read_reg_i_2_n_3\,
      CO(3) => \gaxis_pkt_fifo_cc.axis_pkt_read_reg_i_2_n_4\,
      CO(2) => \gaxis_pkt_fifo_cc.axis_pkt_read_reg_i_2_n_5\,
      CO(1) => \gaxis_pkt_fifo_cc.axis_pkt_read_reg_i_2_n_6\,
      CO(0) => \gaxis_pkt_fifo_cc.axis_pkt_read_reg_i_2_n_7\,
      DI(7) => \gaxis_pkt_fifo_cc.axis_pkt_read_i_5_n_0\,
      DI(6) => \gaxis_pkt_fifo_cc.axis_pkt_read_i_6_n_0\,
      DI(5) => \gaxis_pkt_fifo_cc.axis_pkt_read_i_7_n_0\,
      DI(4) => \gaxis_pkt_fifo_cc.axis_pkt_read_i_8_n_0\,
      DI(3) => \gaxis_pkt_fifo_cc.axis_pkt_read_i_9_n_0\,
      DI(2) => \gaxis_pkt_fifo_cc.axis_pkt_read_i_10_n_0\,
      DI(1) => \gaxis_pkt_fifo_cc.axis_pkt_read_i_11_n_0\,
      DI(0) => \gaxis_pkt_fifo_cc.axis_pkt_read_i_12_n_0\,
      O(7 downto 0) => \NLW_gaxis_pkt_fifo_cc.axis_pkt_read_reg_i_2_O_UNCONNECTED\(7 downto 0),
      S(7) => \gaxis_pkt_fifo_cc.axis_pkt_read_i_13_n_0\,
      S(6) => \gaxis_pkt_fifo_cc.axis_pkt_read_i_14_n_0\,
      S(5) => \gaxis_pkt_fifo_cc.axis_pkt_read_i_15_n_0\,
      S(4) => \gaxis_pkt_fifo_cc.axis_pkt_read_i_16_n_0\,
      S(3) => \gaxis_pkt_fifo_cc.axis_pkt_read_i_17_n_0\,
      S(2) => \gaxis_pkt_fifo_cc.axis_pkt_read_i_18_n_0\,
      S(1) => \gaxis_pkt_fifo_cc.axis_pkt_read_i_19_n_0\,
      S(0) => \gaxis_pkt_fifo_cc.axis_pkt_read_i_20_n_0\
    );
\gaxis_pkt_fifo_cc.axis_pkt_read_reg_i_4\: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => \gaxis_pkt_fifo_cc.axis_pkt_read_reg_i_4_n_0\,
      CO(6) => \gaxis_pkt_fifo_cc.axis_pkt_read_reg_i_4_n_1\,
      CO(5) => \gaxis_pkt_fifo_cc.axis_pkt_read_reg_i_4_n_2\,
      CO(4) => \gaxis_pkt_fifo_cc.axis_pkt_read_reg_i_4_n_3\,
      CO(3) => \gaxis_pkt_fifo_cc.axis_pkt_read_reg_i_4_n_4\,
      CO(2) => \gaxis_pkt_fifo_cc.axis_pkt_read_reg_i_4_n_5\,
      CO(1) => \gaxis_pkt_fifo_cc.axis_pkt_read_reg_i_4_n_6\,
      CO(0) => \gaxis_pkt_fifo_cc.axis_pkt_read_reg_i_4_n_7\,
      DI(7) => \gaxis_pkt_fifo_cc.axis_pkt_read_i_24_n_0\,
      DI(6) => \gaxis_pkt_fifo_cc.axis_pkt_read_i_25_n_0\,
      DI(5) => \gaxis_pkt_fifo_cc.axis_pkt_read_i_26_n_0\,
      DI(4) => \gaxis_pkt_fifo_cc.axis_pkt_read_i_27_n_0\,
      DI(3) => \gaxis_pkt_fifo_cc.axis_pkt_read_i_28_n_0\,
      DI(2) => \gaxis_pkt_fifo_cc.axis_pkt_read_i_29_n_0\,
      DI(1) => \gaxis_pkt_fifo_cc.axis_pkt_read_i_30_n_0\,
      DI(0) => \gaxis_pkt_fifo_cc.axis_pkt_read_i_31_n_0\,
      O(7 downto 0) => \NLW_gaxis_pkt_fifo_cc.axis_pkt_read_reg_i_4_O_UNCONNECTED\(7 downto 0),
      S(7) => \gaxis_pkt_fifo_cc.axis_pkt_read_i_32_n_0\,
      S(6) => \gaxis_pkt_fifo_cc.axis_pkt_read_i_33_n_0\,
      S(5) => \gaxis_pkt_fifo_cc.axis_pkt_read_i_34_n_0\,
      S(4) => \gaxis_pkt_fifo_cc.axis_pkt_read_i_35_n_0\,
      S(3) => \gaxis_pkt_fifo_cc.axis_pkt_read_i_36_n_0\,
      S(2) => \gaxis_pkt_fifo_cc.axis_pkt_read_i_37_n_0\,
      S(1) => \gaxis_pkt_fifo_cc.axis_pkt_read_i_38_n_0\,
      S(0) => \gaxis_pkt_fifo_cc.axis_pkt_read_i_39_n_0\
    );
\gaxis_pkt_fifo_cc.axis_wr_eop_d1_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => s_axis_tlast,
      I1 => \^s_axis_tready\,
      I2 => s_axis_tvalid,
      I3 => rst_axis,
      O => \gaxis_pkt_fifo_cc.axis_wr_eop_d1_i_1_n_0\
    );
\gaxis_pkt_fifo_cc.axis_wr_eop_d1_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_aclk,
      CE => '1',
      D => \gaxis_pkt_fifo_cc.axis_wr_eop_d1_i_1_n_0\,
      Q => axis_wr_eop_d1,
      R => '0'
    );
\gaxis_rst_sync.xpm_cdc_sync_rst_inst\: entity work.BufferFifoIP_512_xpm_cdc_sync_rst
     port map (
      dest_clk => s_aclk,
      dest_rst => rst_axis,
      src_rst => \gaxis_rst_sync.xpm_cdc_sync_rst_inst_i_1_n_0\
    );
\gaxis_rst_sync.xpm_cdc_sync_rst_inst_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s_aresetn,
      O => \gaxis_rst_sync.xpm_cdc_sync_rst_inst_i_1_n_0\
    );
m_axis_tvalid_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => data_valid_axis,
      I1 => axis_pkt_read,
      O => m_axis_tvalid
    );
xpm_fifo_base_inst: entity work.BufferFifoIP_512_xpm_fifo_base
     port map (
      almost_empty => almost_empty_axis,
      almost_full => \^almost_full_axis\,
      data_valid => data_valid_axis,
      dbiterr => NLW_xpm_fifo_base_inst_dbiterr_UNCONNECTED,
      din(643) => s_axis_tlast,
      din(642 downto 512) => B"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      din(511 downto 0) => s_axis_tdata(511 downto 0),
      dout(643) => \^m_axis_tlast\,
      dout(642 downto 512) => NLW_xpm_fifo_base_inst_dout_UNCONNECTED(642 downto 512),
      dout(511 downto 0) => m_axis_tdata(511 downto 0),
      empty => NLW_xpm_fifo_base_inst_empty_UNCONNECTED,
      full => NLW_xpm_fifo_base_inst_full_UNCONNECTED,
      full_n => \^s_axis_tready\,
      injectdbiterr => '0',
      injectsbiterr => '0',
      overflow => NLW_xpm_fifo_base_inst_overflow_UNCONNECTED,
      prog_empty => NLW_xpm_fifo_base_inst_prog_empty_UNCONNECTED,
      prog_full => NLW_xpm_fifo_base_inst_prog_full_UNCONNECTED,
      rd_clk => '0',
      rd_data_count(6 downto 0) => NLW_xpm_fifo_base_inst_rd_data_count_UNCONNECTED(6 downto 0),
      rd_en => axis_rd_eop1,
      rd_rst_busy => NLW_xpm_fifo_base_inst_rd_rst_busy_UNCONNECTED,
      rst => rst_axis,
      sbiterr => NLW_xpm_fifo_base_inst_sbiterr_UNCONNECTED,
      sleep => '0',
      underflow => NLW_xpm_fifo_base_inst_underflow_UNCONNECTED,
      wr_ack => NLW_xpm_fifo_base_inst_wr_ack_UNCONNECTED,
      wr_clk => s_aclk,
      wr_data_count(6 downto 0) => NLW_xpm_fifo_base_inst_wr_data_count_UNCONNECTED(6 downto 0),
      wr_en => s_axis_tvalid,
      wr_rst_busy => NLW_xpm_fifo_base_inst_wr_rst_busy_UNCONNECTED
    );
xpm_fifo_base_inst_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => axis_pkt_read,
      I1 => data_valid_axis,
      I2 => m_axis_tready,
      O => axis_rd_eop1
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity BufferFifoIP_512_axis_data_fifo_v2_0_3_top is
  port (
    s_axis_aclk : in STD_LOGIC;
    s_axis_aresetn : in STD_LOGIC;
    s_axis_aclken : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 511 downto 0 );
    s_axis_tstrb : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tkeep : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    s_axis_tid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tdest : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    almost_full : out STD_LOGIC;
    prog_full : out STD_LOGIC;
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    injectsbiterr : in STD_LOGIC;
    injectdbiterr : in STD_LOGIC;
    m_axis_aclk : in STD_LOGIC;
    m_axis_aclken : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 511 downto 0 );
    m_axis_tstrb : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    m_axis_tid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tdest : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tuser : out STD_LOGIC_VECTOR ( 0 to 0 );
    almost_empty : out STD_LOGIC;
    prog_empty : out STD_LOGIC;
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    sbiterr : out STD_LOGIC;
    dbiterr : out STD_LOGIC
  );
  attribute C_ACLKEN_CONV_MODE : integer;
  attribute C_ACLKEN_CONV_MODE of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is 0;
  attribute C_AXIS_SIGNAL_SET : string;
  attribute C_AXIS_SIGNAL_SET of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is "32'b00000000000000000000000000010011";
  attribute C_AXIS_TDATA_WIDTH : integer;
  attribute C_AXIS_TDATA_WIDTH of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is 512;
  attribute C_AXIS_TDEST_WIDTH : integer;
  attribute C_AXIS_TDEST_WIDTH of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is 1;
  attribute C_AXIS_TID_WIDTH : integer;
  attribute C_AXIS_TID_WIDTH of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is 1;
  attribute C_AXIS_TUSER_WIDTH : integer;
  attribute C_AXIS_TUSER_WIDTH of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is 1;
  attribute C_ECC_MODE : integer;
  attribute C_ECC_MODE of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is 0;
  attribute C_FAMILY : string;
  attribute C_FAMILY of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is "zynquplus";
  attribute C_FIFO_DEPTH : integer;
  attribute C_FIFO_DEPTH of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is 64;
  attribute C_FIFO_MEMORY_TYPE : string;
  attribute C_FIFO_MEMORY_TYPE of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is "ultra";
  attribute C_FIFO_MODE : integer;
  attribute C_FIFO_MODE of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is 2;
  attribute C_IS_ACLK_ASYNC : integer;
  attribute C_IS_ACLK_ASYNC of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is 0;
  attribute C_PROG_EMPTY_THRESH : integer;
  attribute C_PROG_EMPTY_THRESH of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is 5;
  attribute C_PROG_FULL_THRESH : integer;
  attribute C_PROG_FULL_THRESH of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is 11;
  attribute C_SYNCHRONIZER_STAGE : integer;
  attribute C_SYNCHRONIZER_STAGE of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is 3;
  attribute C_USE_ADV_FEATURES : integer;
  attribute C_USE_ADV_FEATURES of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is 825765944;
  attribute G_INDX_SS_TDATA : integer;
  attribute G_INDX_SS_TDATA of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is 1;
  attribute G_INDX_SS_TDEST : integer;
  attribute G_INDX_SS_TDEST of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is 6;
  attribute G_INDX_SS_TID : integer;
  attribute G_INDX_SS_TID of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is 5;
  attribute G_INDX_SS_TKEEP : integer;
  attribute G_INDX_SS_TKEEP of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is 3;
  attribute G_INDX_SS_TLAST : integer;
  attribute G_INDX_SS_TLAST of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is 4;
  attribute G_INDX_SS_TREADY : integer;
  attribute G_INDX_SS_TREADY of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is 0;
  attribute G_INDX_SS_TSTRB : integer;
  attribute G_INDX_SS_TSTRB of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is 2;
  attribute G_INDX_SS_TUSER : integer;
  attribute G_INDX_SS_TUSER of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is 7;
  attribute G_MASK_SS_TDATA : integer;
  attribute G_MASK_SS_TDATA of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is 2;
  attribute G_MASK_SS_TDEST : integer;
  attribute G_MASK_SS_TDEST of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is 64;
  attribute G_MASK_SS_TID : integer;
  attribute G_MASK_SS_TID of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is 32;
  attribute G_MASK_SS_TKEEP : integer;
  attribute G_MASK_SS_TKEEP of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is 8;
  attribute G_MASK_SS_TLAST : integer;
  attribute G_MASK_SS_TLAST of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is 16;
  attribute G_MASK_SS_TREADY : integer;
  attribute G_MASK_SS_TREADY of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is 1;
  attribute G_MASK_SS_TSTRB : integer;
  attribute G_MASK_SS_TSTRB of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is 4;
  attribute G_MASK_SS_TUSER : integer;
  attribute G_MASK_SS_TUSER of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is 128;
  attribute G_TASK_SEVERITY_ERR : integer;
  attribute G_TASK_SEVERITY_ERR of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is 2;
  attribute G_TASK_SEVERITY_INFO : integer;
  attribute G_TASK_SEVERITY_INFO of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is 0;
  attribute G_TASK_SEVERITY_WARNING : integer;
  attribute G_TASK_SEVERITY_WARNING of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is 1;
  attribute LP_CDC_SYNC_STAGES : integer;
  attribute LP_CDC_SYNC_STAGES of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is 3;
  attribute LP_CLOCKING_MODE : string;
  attribute LP_CLOCKING_MODE of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is "common_clock";
  attribute LP_ECC_MODE : string;
  attribute LP_ECC_MODE of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is "no_ecc";
  attribute LP_FIFO_DEPTH : integer;
  attribute LP_FIFO_DEPTH of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is 64;
  attribute LP_FIFO_MEMORY_TYPE : string;
  attribute LP_FIFO_MEMORY_TYPE of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is "ultra";
  attribute LP_M_ACLKEN_CAN_TOGGLE : integer;
  attribute LP_M_ACLKEN_CAN_TOGGLE of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is 0;
  attribute LP_PACKET_FIFO : string;
  attribute LP_PACKET_FIFO of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is "true";
  attribute LP_PROG_EMPTY_THRESH : integer;
  attribute LP_PROG_EMPTY_THRESH of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is 5;
  attribute LP_PROG_FULL_THRESH : integer;
  attribute LP_PROG_FULL_THRESH of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is 11;
  attribute LP_RD_DATA_COUNT_WIDTH : integer;
  attribute LP_RD_DATA_COUNT_WIDTH of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is 7;
  attribute LP_RELATED_CLOCKS : integer;
  attribute LP_RELATED_CLOCKS of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is 0;
  attribute LP_S_ACLKEN_CAN_TOGGLE : integer;
  attribute LP_S_ACLKEN_CAN_TOGGLE of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is 0;
  attribute LP_TDATA_WIDTH : integer;
  attribute LP_TDATA_WIDTH of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is 512;
  attribute LP_TDEST_WIDTH : integer;
  attribute LP_TDEST_WIDTH of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is 1;
  attribute LP_TID_WIDTH : integer;
  attribute LP_TID_WIDTH of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is 1;
  attribute LP_TUSER_WIDTH : integer;
  attribute LP_TUSER_WIDTH of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is 1;
  attribute LP_USE_ADV_FEATURES : integer;
  attribute LP_USE_ADV_FEATURES of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is 825765944;
  attribute LP_WR_DATA_COUNT_WIDTH : integer;
  attribute LP_WR_DATA_COUNT_WIDTH of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is 7;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of BufferFifoIP_512_axis_data_fifo_v2_0_3_top : entity is "axis_data_fifo_v2_0_3_top";
end BufferFifoIP_512_axis_data_fifo_v2_0_3_top;

architecture STRUCTURE of BufferFifoIP_512_axis_data_fifo_v2_0_3_top is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal \^axis_rd_data_count\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \^axis_wr_data_count\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \NLW_gen_fifo.xpm_fifo_axis_inst_m_axis_tdest_UNCONNECTED\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \NLW_gen_fifo.xpm_fifo_axis_inst_m_axis_tid_UNCONNECTED\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \NLW_gen_fifo.xpm_fifo_axis_inst_m_axis_tkeep_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal \NLW_gen_fifo.xpm_fifo_axis_inst_m_axis_tstrb_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal \NLW_gen_fifo.xpm_fifo_axis_inst_m_axis_tuser_UNCONNECTED\ : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute AXIS_DATA_WIDTH : integer;
  attribute AXIS_DATA_WIDTH of \gen_fifo.xpm_fifo_axis_inst\ : label is 644;
  attribute AXIS_FINAL_DATA_WIDTH : integer;
  attribute AXIS_FINAL_DATA_WIDTH of \gen_fifo.xpm_fifo_axis_inst\ : label is 644;
  attribute CASCADE_HEIGHT : integer;
  attribute CASCADE_HEIGHT of \gen_fifo.xpm_fifo_axis_inst\ : label is 0;
  attribute CDC_SYNC_STAGES : integer;
  attribute CDC_SYNC_STAGES of \gen_fifo.xpm_fifo_axis_inst\ : label is 3;
  attribute CLOCKING_MODE : string;
  attribute CLOCKING_MODE of \gen_fifo.xpm_fifo_axis_inst\ : label is "common_clock";
  attribute ECC_MODE : string;
  attribute ECC_MODE of \gen_fifo.xpm_fifo_axis_inst\ : label is "no_ecc";
  attribute EN_ADV_FEATURE_AXIS : string;
  attribute EN_ADV_FEATURE_AXIS of \gen_fifo.xpm_fifo_axis_inst\ : label is "16'b0001100000001000";
  attribute EN_ADV_FEATURE_AXIS_INT : string;
  attribute EN_ADV_FEATURE_AXIS_INT of \gen_fifo.xpm_fifo_axis_inst\ : label is "16'b0001100000001000";
  attribute EN_ALMOST_EMPTY_INT : string;
  attribute EN_ALMOST_EMPTY_INT of \gen_fifo.xpm_fifo_axis_inst\ : label is "1'b1";
  attribute EN_ALMOST_FULL_INT : string;
  attribute EN_ALMOST_FULL_INT of \gen_fifo.xpm_fifo_axis_inst\ : label is "1'b1";
  attribute EN_DATA_VALID_INT : string;
  attribute EN_DATA_VALID_INT of \gen_fifo.xpm_fifo_axis_inst\ : label is "1'b1";
  attribute FIFO_DEPTH : integer;
  attribute FIFO_DEPTH of \gen_fifo.xpm_fifo_axis_inst\ : label is 64;
  attribute FIFO_MEMORY_TYPE : string;
  attribute FIFO_MEMORY_TYPE of \gen_fifo.xpm_fifo_axis_inst\ : label is "ultra";
  attribute LOG_DEPTH_AXIS : integer;
  attribute LOG_DEPTH_AXIS of \gen_fifo.xpm_fifo_axis_inst\ : label is 6;
  attribute PACKET_FIFO : string;
  attribute PACKET_FIFO of \gen_fifo.xpm_fifo_axis_inst\ : label is "true";
  attribute PKT_SIZE_LT8 : string;
  attribute PKT_SIZE_LT8 of \gen_fifo.xpm_fifo_axis_inst\ : label is "1'b0";
  attribute PROG_EMPTY_THRESH : integer;
  attribute PROG_EMPTY_THRESH of \gen_fifo.xpm_fifo_axis_inst\ : label is 5;
  attribute PROG_FULL_THRESH : integer;
  attribute PROG_FULL_THRESH of \gen_fifo.xpm_fifo_axis_inst\ : label is 11;
  attribute P_COMMON_CLOCK : integer;
  attribute P_COMMON_CLOCK of \gen_fifo.xpm_fifo_axis_inst\ : label is 1;
  attribute P_ECC_MODE : integer;
  attribute P_ECC_MODE of \gen_fifo.xpm_fifo_axis_inst\ : label is 0;
  attribute P_FIFO_MEMORY_TYPE : integer;
  attribute P_FIFO_MEMORY_TYPE of \gen_fifo.xpm_fifo_axis_inst\ : label is 3;
  attribute P_PKT_MODE : integer;
  attribute P_PKT_MODE of \gen_fifo.xpm_fifo_axis_inst\ : label is 1;
  attribute RD_DATA_COUNT_WIDTH : integer;
  attribute RD_DATA_COUNT_WIDTH of \gen_fifo.xpm_fifo_axis_inst\ : label is 7;
  attribute RELATED_CLOCKS : integer;
  attribute RELATED_CLOCKS of \gen_fifo.xpm_fifo_axis_inst\ : label is 0;
  attribute SIM_ASSERT_CHK : integer;
  attribute SIM_ASSERT_CHK of \gen_fifo.xpm_fifo_axis_inst\ : label is 0;
  attribute TDATA_OFFSET : integer;
  attribute TDATA_OFFSET of \gen_fifo.xpm_fifo_axis_inst\ : label is 512;
  attribute TDATA_WIDTH : integer;
  attribute TDATA_WIDTH of \gen_fifo.xpm_fifo_axis_inst\ : label is 512;
  attribute TDEST_OFFSET : integer;
  attribute TDEST_OFFSET of \gen_fifo.xpm_fifo_axis_inst\ : label is 642;
  attribute TDEST_WIDTH : integer;
  attribute TDEST_WIDTH of \gen_fifo.xpm_fifo_axis_inst\ : label is 1;
  attribute TID_OFFSET : integer;
  attribute TID_OFFSET of \gen_fifo.xpm_fifo_axis_inst\ : label is 641;
  attribute TID_WIDTH : integer;
  attribute TID_WIDTH of \gen_fifo.xpm_fifo_axis_inst\ : label is 1;
  attribute TKEEP_OFFSET : integer;
  attribute TKEEP_OFFSET of \gen_fifo.xpm_fifo_axis_inst\ : label is 640;
  attribute TSTRB_OFFSET : integer;
  attribute TSTRB_OFFSET of \gen_fifo.xpm_fifo_axis_inst\ : label is 576;
  attribute TUSER_MAX_WIDTH : integer;
  attribute TUSER_MAX_WIDTH of \gen_fifo.xpm_fifo_axis_inst\ : label is 3453;
  attribute TUSER_OFFSET : integer;
  attribute TUSER_OFFSET of \gen_fifo.xpm_fifo_axis_inst\ : label is 643;
  attribute TUSER_WIDTH : integer;
  attribute TUSER_WIDTH of \gen_fifo.xpm_fifo_axis_inst\ : label is 1;
  attribute USE_ADV_FEATURES : integer;
  attribute USE_ADV_FEATURES of \gen_fifo.xpm_fifo_axis_inst\ : label is 825765944;
  attribute USE_ADV_FEATURES_INT : integer;
  attribute USE_ADV_FEATURES_INT of \gen_fifo.xpm_fifo_axis_inst\ : label is 825765944;
  attribute WR_DATA_COUNT_WIDTH : integer;
  attribute WR_DATA_COUNT_WIDTH of \gen_fifo.xpm_fifo_axis_inst\ : label is 7;
  attribute XPM_MODULE : string;
  attribute XPM_MODULE of \gen_fifo.xpm_fifo_axis_inst\ : label is "TRUE";
begin
  axis_rd_data_count(31) <= \<const0>\;
  axis_rd_data_count(30) <= \<const0>\;
  axis_rd_data_count(29) <= \<const0>\;
  axis_rd_data_count(28) <= \<const0>\;
  axis_rd_data_count(27) <= \<const0>\;
  axis_rd_data_count(26) <= \<const0>\;
  axis_rd_data_count(25) <= \<const0>\;
  axis_rd_data_count(24) <= \<const0>\;
  axis_rd_data_count(23) <= \<const0>\;
  axis_rd_data_count(22) <= \<const0>\;
  axis_rd_data_count(21) <= \<const0>\;
  axis_rd_data_count(20) <= \<const0>\;
  axis_rd_data_count(19) <= \<const0>\;
  axis_rd_data_count(18) <= \<const0>\;
  axis_rd_data_count(17) <= \<const0>\;
  axis_rd_data_count(16) <= \<const0>\;
  axis_rd_data_count(15) <= \<const0>\;
  axis_rd_data_count(14) <= \<const0>\;
  axis_rd_data_count(13) <= \<const0>\;
  axis_rd_data_count(12) <= \<const0>\;
  axis_rd_data_count(11) <= \<const0>\;
  axis_rd_data_count(10) <= \<const0>\;
  axis_rd_data_count(9) <= \<const0>\;
  axis_rd_data_count(8) <= \<const0>\;
  axis_rd_data_count(7) <= \<const0>\;
  axis_rd_data_count(6 downto 0) <= \^axis_rd_data_count\(6 downto 0);
  axis_wr_data_count(31) <= \<const0>\;
  axis_wr_data_count(30) <= \<const0>\;
  axis_wr_data_count(29) <= \<const0>\;
  axis_wr_data_count(28) <= \<const0>\;
  axis_wr_data_count(27) <= \<const0>\;
  axis_wr_data_count(26) <= \<const0>\;
  axis_wr_data_count(25) <= \<const0>\;
  axis_wr_data_count(24) <= \<const0>\;
  axis_wr_data_count(23) <= \<const0>\;
  axis_wr_data_count(22) <= \<const0>\;
  axis_wr_data_count(21) <= \<const0>\;
  axis_wr_data_count(20) <= \<const0>\;
  axis_wr_data_count(19) <= \<const0>\;
  axis_wr_data_count(18) <= \<const0>\;
  axis_wr_data_count(17) <= \<const0>\;
  axis_wr_data_count(16) <= \<const0>\;
  axis_wr_data_count(15) <= \<const0>\;
  axis_wr_data_count(14) <= \<const0>\;
  axis_wr_data_count(13) <= \<const0>\;
  axis_wr_data_count(12) <= \<const0>\;
  axis_wr_data_count(11) <= \<const0>\;
  axis_wr_data_count(10) <= \<const0>\;
  axis_wr_data_count(9) <= \<const0>\;
  axis_wr_data_count(8) <= \<const0>\;
  axis_wr_data_count(7) <= \<const0>\;
  axis_wr_data_count(6 downto 0) <= \^axis_wr_data_count\(6 downto 0);
  m_axis_tdest(0) <= \<const0>\;
  m_axis_tid(0) <= \<const0>\;
  m_axis_tkeep(63) <= \<const1>\;
  m_axis_tkeep(62) <= \<const1>\;
  m_axis_tkeep(61) <= \<const1>\;
  m_axis_tkeep(60) <= \<const1>\;
  m_axis_tkeep(59) <= \<const1>\;
  m_axis_tkeep(58) <= \<const1>\;
  m_axis_tkeep(57) <= \<const1>\;
  m_axis_tkeep(56) <= \<const1>\;
  m_axis_tkeep(55) <= \<const1>\;
  m_axis_tkeep(54) <= \<const1>\;
  m_axis_tkeep(53) <= \<const1>\;
  m_axis_tkeep(52) <= \<const1>\;
  m_axis_tkeep(51) <= \<const1>\;
  m_axis_tkeep(50) <= \<const1>\;
  m_axis_tkeep(49) <= \<const1>\;
  m_axis_tkeep(48) <= \<const1>\;
  m_axis_tkeep(47) <= \<const1>\;
  m_axis_tkeep(46) <= \<const1>\;
  m_axis_tkeep(45) <= \<const1>\;
  m_axis_tkeep(44) <= \<const1>\;
  m_axis_tkeep(43) <= \<const1>\;
  m_axis_tkeep(42) <= \<const1>\;
  m_axis_tkeep(41) <= \<const1>\;
  m_axis_tkeep(40) <= \<const1>\;
  m_axis_tkeep(39) <= \<const1>\;
  m_axis_tkeep(38) <= \<const1>\;
  m_axis_tkeep(37) <= \<const1>\;
  m_axis_tkeep(36) <= \<const1>\;
  m_axis_tkeep(35) <= \<const1>\;
  m_axis_tkeep(34) <= \<const1>\;
  m_axis_tkeep(33) <= \<const1>\;
  m_axis_tkeep(32) <= \<const1>\;
  m_axis_tkeep(31) <= \<const1>\;
  m_axis_tkeep(30) <= \<const1>\;
  m_axis_tkeep(29) <= \<const1>\;
  m_axis_tkeep(28) <= \<const1>\;
  m_axis_tkeep(27) <= \<const1>\;
  m_axis_tkeep(26) <= \<const1>\;
  m_axis_tkeep(25) <= \<const1>\;
  m_axis_tkeep(24) <= \<const1>\;
  m_axis_tkeep(23) <= \<const1>\;
  m_axis_tkeep(22) <= \<const1>\;
  m_axis_tkeep(21) <= \<const1>\;
  m_axis_tkeep(20) <= \<const1>\;
  m_axis_tkeep(19) <= \<const1>\;
  m_axis_tkeep(18) <= \<const1>\;
  m_axis_tkeep(17) <= \<const1>\;
  m_axis_tkeep(16) <= \<const1>\;
  m_axis_tkeep(15) <= \<const1>\;
  m_axis_tkeep(14) <= \<const1>\;
  m_axis_tkeep(13) <= \<const1>\;
  m_axis_tkeep(12) <= \<const1>\;
  m_axis_tkeep(11) <= \<const1>\;
  m_axis_tkeep(10) <= \<const1>\;
  m_axis_tkeep(9) <= \<const1>\;
  m_axis_tkeep(8) <= \<const1>\;
  m_axis_tkeep(7) <= \<const1>\;
  m_axis_tkeep(6) <= \<const1>\;
  m_axis_tkeep(5) <= \<const1>\;
  m_axis_tkeep(4) <= \<const1>\;
  m_axis_tkeep(3) <= \<const1>\;
  m_axis_tkeep(2) <= \<const1>\;
  m_axis_tkeep(1) <= \<const1>\;
  m_axis_tkeep(0) <= \<const1>\;
  m_axis_tstrb(63) <= \<const1>\;
  m_axis_tstrb(62) <= \<const1>\;
  m_axis_tstrb(61) <= \<const1>\;
  m_axis_tstrb(60) <= \<const1>\;
  m_axis_tstrb(59) <= \<const1>\;
  m_axis_tstrb(58) <= \<const1>\;
  m_axis_tstrb(57) <= \<const1>\;
  m_axis_tstrb(56) <= \<const1>\;
  m_axis_tstrb(55) <= \<const1>\;
  m_axis_tstrb(54) <= \<const1>\;
  m_axis_tstrb(53) <= \<const1>\;
  m_axis_tstrb(52) <= \<const1>\;
  m_axis_tstrb(51) <= \<const1>\;
  m_axis_tstrb(50) <= \<const1>\;
  m_axis_tstrb(49) <= \<const1>\;
  m_axis_tstrb(48) <= \<const1>\;
  m_axis_tstrb(47) <= \<const1>\;
  m_axis_tstrb(46) <= \<const1>\;
  m_axis_tstrb(45) <= \<const1>\;
  m_axis_tstrb(44) <= \<const1>\;
  m_axis_tstrb(43) <= \<const1>\;
  m_axis_tstrb(42) <= \<const1>\;
  m_axis_tstrb(41) <= \<const1>\;
  m_axis_tstrb(40) <= \<const1>\;
  m_axis_tstrb(39) <= \<const1>\;
  m_axis_tstrb(38) <= \<const1>\;
  m_axis_tstrb(37) <= \<const1>\;
  m_axis_tstrb(36) <= \<const1>\;
  m_axis_tstrb(35) <= \<const1>\;
  m_axis_tstrb(34) <= \<const1>\;
  m_axis_tstrb(33) <= \<const1>\;
  m_axis_tstrb(32) <= \<const1>\;
  m_axis_tstrb(31) <= \<const1>\;
  m_axis_tstrb(30) <= \<const1>\;
  m_axis_tstrb(29) <= \<const1>\;
  m_axis_tstrb(28) <= \<const1>\;
  m_axis_tstrb(27) <= \<const1>\;
  m_axis_tstrb(26) <= \<const1>\;
  m_axis_tstrb(25) <= \<const1>\;
  m_axis_tstrb(24) <= \<const1>\;
  m_axis_tstrb(23) <= \<const1>\;
  m_axis_tstrb(22) <= \<const1>\;
  m_axis_tstrb(21) <= \<const1>\;
  m_axis_tstrb(20) <= \<const1>\;
  m_axis_tstrb(19) <= \<const1>\;
  m_axis_tstrb(18) <= \<const1>\;
  m_axis_tstrb(17) <= \<const1>\;
  m_axis_tstrb(16) <= \<const1>\;
  m_axis_tstrb(15) <= \<const1>\;
  m_axis_tstrb(14) <= \<const1>\;
  m_axis_tstrb(13) <= \<const1>\;
  m_axis_tstrb(12) <= \<const1>\;
  m_axis_tstrb(11) <= \<const1>\;
  m_axis_tstrb(10) <= \<const1>\;
  m_axis_tstrb(9) <= \<const1>\;
  m_axis_tstrb(8) <= \<const1>\;
  m_axis_tstrb(7) <= \<const1>\;
  m_axis_tstrb(6) <= \<const1>\;
  m_axis_tstrb(5) <= \<const1>\;
  m_axis_tstrb(4) <= \<const1>\;
  m_axis_tstrb(3) <= \<const1>\;
  m_axis_tstrb(2) <= \<const1>\;
  m_axis_tstrb(1) <= \<const1>\;
  m_axis_tstrb(0) <= \<const1>\;
  m_axis_tuser(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
\gen_fifo.xpm_fifo_axis_inst\: entity work.BufferFifoIP_512_xpm_fifo_axis
     port map (
      almost_empty_axis => almost_empty,
      almost_full_axis => almost_full,
      dbiterr_axis => dbiterr,
      injectdbiterr_axis => injectdbiterr,
      injectsbiterr_axis => injectsbiterr,
      m_aclk => s_axis_aclk,
      m_axis_tdata(511 downto 0) => m_axis_tdata(511 downto 0),
      m_axis_tdest(0) => \NLW_gen_fifo.xpm_fifo_axis_inst_m_axis_tdest_UNCONNECTED\(0),
      m_axis_tid(0) => \NLW_gen_fifo.xpm_fifo_axis_inst_m_axis_tid_UNCONNECTED\(0),
      m_axis_tkeep(63 downto 0) => \NLW_gen_fifo.xpm_fifo_axis_inst_m_axis_tkeep_UNCONNECTED\(63 downto 0),
      m_axis_tlast => m_axis_tlast,
      m_axis_tready => m_axis_tready,
      m_axis_tstrb(63 downto 0) => \NLW_gen_fifo.xpm_fifo_axis_inst_m_axis_tstrb_UNCONNECTED\(63 downto 0),
      m_axis_tuser(0) => \NLW_gen_fifo.xpm_fifo_axis_inst_m_axis_tuser_UNCONNECTED\(0),
      m_axis_tvalid => m_axis_tvalid,
      prog_empty_axis => prog_empty,
      prog_full_axis => prog_full,
      rd_data_count_axis(6 downto 0) => \^axis_rd_data_count\(6 downto 0),
      s_aclk => s_axis_aclk,
      s_aresetn => s_axis_aresetn,
      s_axis_tdata(511 downto 0) => s_axis_tdata(511 downto 0),
      s_axis_tdest(0) => '0',
      s_axis_tid(0) => '0',
      s_axis_tkeep(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      s_axis_tlast => s_axis_tlast,
      s_axis_tready => s_axis_tready,
      s_axis_tstrb(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      s_axis_tuser(0) => '0',
      s_axis_tvalid => s_axis_tvalid,
      sbiterr_axis => sbiterr,
      wr_data_count_axis(6 downto 0) => \^axis_wr_data_count\(6 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity BufferFifoIP_512 is
  port (
    s_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 511 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 511 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of BufferFifoIP_512 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of BufferFifoIP_512 : entity is "BufferFifoIP_512,axis_data_fifo_v2_0_3_top,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of BufferFifoIP_512 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of BufferFifoIP_512 : entity is "axis_data_fifo_v2_0_3_top,Vivado 2020.1";
end BufferFifoIP_512;

architecture STRUCTURE of BufferFifoIP_512 is
  signal NLW_inst_almost_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_almost_full_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_axis_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_inst_axis_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_inst_m_axis_tdest_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_m_axis_tid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_m_axis_tkeep_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_inst_m_axis_tstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_inst_m_axis_tuser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute C_ACLKEN_CONV_MODE : integer;
  attribute C_ACLKEN_CONV_MODE of inst : label is 0;
  attribute C_AXIS_SIGNAL_SET : string;
  attribute C_AXIS_SIGNAL_SET of inst : label is "32'b00000000000000000000000000010011";
  attribute C_AXIS_TDATA_WIDTH : integer;
  attribute C_AXIS_TDATA_WIDTH of inst : label is 512;
  attribute C_AXIS_TDEST_WIDTH : integer;
  attribute C_AXIS_TDEST_WIDTH of inst : label is 1;
  attribute C_AXIS_TID_WIDTH : integer;
  attribute C_AXIS_TID_WIDTH of inst : label is 1;
  attribute C_AXIS_TUSER_WIDTH : integer;
  attribute C_AXIS_TUSER_WIDTH of inst : label is 1;
  attribute C_ECC_MODE : integer;
  attribute C_ECC_MODE of inst : label is 0;
  attribute C_FAMILY : string;
  attribute C_FAMILY of inst : label is "zynquplus";
  attribute C_FIFO_DEPTH : integer;
  attribute C_FIFO_DEPTH of inst : label is 64;
  attribute C_FIFO_MEMORY_TYPE : string;
  attribute C_FIFO_MEMORY_TYPE of inst : label is "ultra";
  attribute C_FIFO_MODE : integer;
  attribute C_FIFO_MODE of inst : label is 2;
  attribute C_IS_ACLK_ASYNC : integer;
  attribute C_IS_ACLK_ASYNC of inst : label is 0;
  attribute C_PROG_EMPTY_THRESH : integer;
  attribute C_PROG_EMPTY_THRESH of inst : label is 5;
  attribute C_PROG_FULL_THRESH : integer;
  attribute C_PROG_FULL_THRESH of inst : label is 11;
  attribute C_SYNCHRONIZER_STAGE : integer;
  attribute C_SYNCHRONIZER_STAGE of inst : label is 3;
  attribute C_USE_ADV_FEATURES : integer;
  attribute C_USE_ADV_FEATURES of inst : label is 825765944;
  attribute G_INDX_SS_TDATA : integer;
  attribute G_INDX_SS_TDATA of inst : label is 1;
  attribute G_INDX_SS_TDEST : integer;
  attribute G_INDX_SS_TDEST of inst : label is 6;
  attribute G_INDX_SS_TID : integer;
  attribute G_INDX_SS_TID of inst : label is 5;
  attribute G_INDX_SS_TKEEP : integer;
  attribute G_INDX_SS_TKEEP of inst : label is 3;
  attribute G_INDX_SS_TLAST : integer;
  attribute G_INDX_SS_TLAST of inst : label is 4;
  attribute G_INDX_SS_TREADY : integer;
  attribute G_INDX_SS_TREADY of inst : label is 0;
  attribute G_INDX_SS_TSTRB : integer;
  attribute G_INDX_SS_TSTRB of inst : label is 2;
  attribute G_INDX_SS_TUSER : integer;
  attribute G_INDX_SS_TUSER of inst : label is 7;
  attribute G_MASK_SS_TDATA : integer;
  attribute G_MASK_SS_TDATA of inst : label is 2;
  attribute G_MASK_SS_TDEST : integer;
  attribute G_MASK_SS_TDEST of inst : label is 64;
  attribute G_MASK_SS_TID : integer;
  attribute G_MASK_SS_TID of inst : label is 32;
  attribute G_MASK_SS_TKEEP : integer;
  attribute G_MASK_SS_TKEEP of inst : label is 8;
  attribute G_MASK_SS_TLAST : integer;
  attribute G_MASK_SS_TLAST of inst : label is 16;
  attribute G_MASK_SS_TREADY : integer;
  attribute G_MASK_SS_TREADY of inst : label is 1;
  attribute G_MASK_SS_TSTRB : integer;
  attribute G_MASK_SS_TSTRB of inst : label is 4;
  attribute G_MASK_SS_TUSER : integer;
  attribute G_MASK_SS_TUSER of inst : label is 128;
  attribute G_TASK_SEVERITY_ERR : integer;
  attribute G_TASK_SEVERITY_ERR of inst : label is 2;
  attribute G_TASK_SEVERITY_INFO : integer;
  attribute G_TASK_SEVERITY_INFO of inst : label is 0;
  attribute G_TASK_SEVERITY_WARNING : integer;
  attribute G_TASK_SEVERITY_WARNING of inst : label is 1;
  attribute LP_CDC_SYNC_STAGES : integer;
  attribute LP_CDC_SYNC_STAGES of inst : label is 3;
  attribute LP_CLOCKING_MODE : string;
  attribute LP_CLOCKING_MODE of inst : label is "common_clock";
  attribute LP_ECC_MODE : string;
  attribute LP_ECC_MODE of inst : label is "no_ecc";
  attribute LP_FIFO_DEPTH : integer;
  attribute LP_FIFO_DEPTH of inst : label is 64;
  attribute LP_FIFO_MEMORY_TYPE : string;
  attribute LP_FIFO_MEMORY_TYPE of inst : label is "ultra";
  attribute LP_M_ACLKEN_CAN_TOGGLE : integer;
  attribute LP_M_ACLKEN_CAN_TOGGLE of inst : label is 0;
  attribute LP_PACKET_FIFO : string;
  attribute LP_PACKET_FIFO of inst : label is "true";
  attribute LP_PROG_EMPTY_THRESH : integer;
  attribute LP_PROG_EMPTY_THRESH of inst : label is 5;
  attribute LP_PROG_FULL_THRESH : integer;
  attribute LP_PROG_FULL_THRESH of inst : label is 11;
  attribute LP_RD_DATA_COUNT_WIDTH : integer;
  attribute LP_RD_DATA_COUNT_WIDTH of inst : label is 7;
  attribute LP_RELATED_CLOCKS : integer;
  attribute LP_RELATED_CLOCKS of inst : label is 0;
  attribute LP_S_ACLKEN_CAN_TOGGLE : integer;
  attribute LP_S_ACLKEN_CAN_TOGGLE of inst : label is 0;
  attribute LP_TDATA_WIDTH : integer;
  attribute LP_TDATA_WIDTH of inst : label is 512;
  attribute LP_TDEST_WIDTH : integer;
  attribute LP_TDEST_WIDTH of inst : label is 1;
  attribute LP_TID_WIDTH : integer;
  attribute LP_TID_WIDTH of inst : label is 1;
  attribute LP_TUSER_WIDTH : integer;
  attribute LP_TUSER_WIDTH of inst : label is 1;
  attribute LP_USE_ADV_FEATURES : integer;
  attribute LP_USE_ADV_FEATURES of inst : label is 825765944;
  attribute LP_WR_DATA_COUNT_WIDTH : integer;
  attribute LP_WR_DATA_COUNT_WIDTH of inst : label is 7;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of m_axis_tlast : signal is "xilinx.com:interface:axis:1.0 M_AXIS TLAST";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of m_axis_tlast : signal is "XIL_INTERFACENAME M_AXIS, TDATA_NUM_BYTES 64, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m_axis_tready : signal is "xilinx.com:interface:axis:1.0 M_AXIS TREADY";
  attribute X_INTERFACE_INFO of m_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 M_AXIS TVALID";
  attribute X_INTERFACE_INFO of s_axis_aclk : signal is "xilinx.com:signal:clock:1.0 S_CLKIF CLK";
  attribute X_INTERFACE_PARAMETER of s_axis_aclk : signal is "XIL_INTERFACENAME S_CLKIF, ASSOCIATED_BUSIF S_AXIS, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axis_aresetn : signal is "xilinx.com:signal:reset:1.0 S_RSTIF RST";
  attribute X_INTERFACE_PARAMETER of s_axis_aresetn : signal is "XIL_INTERFACENAME S_RSTIF, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axis_tlast : signal is "xilinx.com:interface:axis:1.0 S_AXIS TLAST";
  attribute X_INTERFACE_PARAMETER of s_axis_tlast : signal is "XIL_INTERFACENAME S_AXIS, TDATA_NUM_BYTES 64, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axis_tready : signal is "xilinx.com:interface:axis:1.0 S_AXIS TREADY";
  attribute X_INTERFACE_INFO of s_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 S_AXIS TVALID";
  attribute X_INTERFACE_INFO of m_axis_tdata : signal is "xilinx.com:interface:axis:1.0 M_AXIS TDATA";
  attribute X_INTERFACE_INFO of s_axis_tdata : signal is "xilinx.com:interface:axis:1.0 S_AXIS TDATA";
begin
inst: entity work.BufferFifoIP_512_axis_data_fifo_v2_0_3_top
     port map (
      almost_empty => NLW_inst_almost_empty_UNCONNECTED,
      almost_full => NLW_inst_almost_full_UNCONNECTED,
      axis_rd_data_count(31 downto 0) => NLW_inst_axis_rd_data_count_UNCONNECTED(31 downto 0),
      axis_wr_data_count(31 downto 0) => NLW_inst_axis_wr_data_count_UNCONNECTED(31 downto 0),
      dbiterr => NLW_inst_dbiterr_UNCONNECTED,
      injectdbiterr => '0',
      injectsbiterr => '0',
      m_axis_aclk => '0',
      m_axis_aclken => '1',
      m_axis_tdata(511 downto 0) => m_axis_tdata(511 downto 0),
      m_axis_tdest(0) => NLW_inst_m_axis_tdest_UNCONNECTED(0),
      m_axis_tid(0) => NLW_inst_m_axis_tid_UNCONNECTED(0),
      m_axis_tkeep(63 downto 0) => NLW_inst_m_axis_tkeep_UNCONNECTED(63 downto 0),
      m_axis_tlast => m_axis_tlast,
      m_axis_tready => m_axis_tready,
      m_axis_tstrb(63 downto 0) => NLW_inst_m_axis_tstrb_UNCONNECTED(63 downto 0),
      m_axis_tuser(0) => NLW_inst_m_axis_tuser_UNCONNECTED(0),
      m_axis_tvalid => m_axis_tvalid,
      prog_empty => NLW_inst_prog_empty_UNCONNECTED,
      prog_full => NLW_inst_prog_full_UNCONNECTED,
      s_axis_aclk => s_axis_aclk,
      s_axis_aclken => '1',
      s_axis_aresetn => s_axis_aresetn,
      s_axis_tdata(511 downto 0) => s_axis_tdata(511 downto 0),
      s_axis_tdest(0) => '0',
      s_axis_tid(0) => '0',
      s_axis_tkeep(63 downto 0) => B"1111111111111111111111111111111111111111111111111111111111111111",
      s_axis_tlast => s_axis_tlast,
      s_axis_tready => s_axis_tready,
      s_axis_tstrb(63 downto 0) => B"1111111111111111111111111111111111111111111111111111111111111111",
      s_axis_tuser(0) => '0',
      s_axis_tvalid => s_axis_tvalid,
      sbiterr => NLW_inst_sbiterr_UNCONNECTED
    );
end STRUCTURE;
