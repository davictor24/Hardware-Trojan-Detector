-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

-- DATE "10/13/2019 16:24:47"

-- 
-- Device: Altera EP2C5T144C8 Package TQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	golden_chip IS
    PORT (
	CLK : IN std_logic;
	CLR : IN std_logic;
	Q : INOUT std_logic_vector(9 DOWNTO 0)
	);
END golden_chip;

-- Design Ports Information
-- Q[0]	=>  Location: PIN_65,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Q[1]	=>  Location: PIN_63,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Q[2]	=>  Location: PIN_59,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Q[3]	=>  Location: PIN_57,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Q[4]	=>  Location: PIN_53,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Q[5]	=>  Location: PIN_51,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Q[6]	=>  Location: PIN_47,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Q[7]	=>  Location: PIN_44,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Q[8]	=>  Location: PIN_42,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Q[9]	=>  Location: PIN_40,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- CLK	=>  Location: PIN_71,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- CLR	=>  Location: PIN_69,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF golden_chip IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLK : std_logic;
SIGNAL ww_CLR : std_logic;
SIGNAL \CLK~combout\ : std_logic;
SIGNAL \Q[0]~47_combout\ : std_logic;
SIGNAL \CLR~combout\ : std_logic;
SIGNAL \Q[0]~reg0_regout\ : std_logic;
SIGNAL \Q[1]~29_combout\ : std_logic;
SIGNAL \Q[1]~reg0_regout\ : std_logic;
SIGNAL \Q[1]~30\ : std_logic;
SIGNAL \Q[2]~31_combout\ : std_logic;
SIGNAL \Q[2]~reg0_regout\ : std_logic;
SIGNAL \Q[2]~32\ : std_logic;
SIGNAL \Q[3]~33_combout\ : std_logic;
SIGNAL \Q[3]~reg0_regout\ : std_logic;
SIGNAL \Q[3]~34\ : std_logic;
SIGNAL \Q[4]~35_combout\ : std_logic;
SIGNAL \Q[4]~reg0_regout\ : std_logic;
SIGNAL \Q[4]~36\ : std_logic;
SIGNAL \Q[5]~37_combout\ : std_logic;
SIGNAL \Q[5]~reg0_regout\ : std_logic;
SIGNAL \Q[5]~38\ : std_logic;
SIGNAL \Q[6]~39_combout\ : std_logic;
SIGNAL \Q[6]~reg0_regout\ : std_logic;
SIGNAL \Q[6]~40\ : std_logic;
SIGNAL \Q[7]~41_combout\ : std_logic;
SIGNAL \Q[7]~reg0_regout\ : std_logic;
SIGNAL \Q[7]~42\ : std_logic;
SIGNAL \Q[8]~43_combout\ : std_logic;
SIGNAL \Q[8]~reg0_regout\ : std_logic;
SIGNAL \Q[8]~44\ : std_logic;
SIGNAL \Q[9]~45_combout\ : std_logic;
SIGNAL \Q[9]~reg0_regout\ : std_logic;

BEGIN

ww_CLK <= CLK;
ww_CLR <= CLR;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: PIN_71,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\CLK~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_CLK,
	combout => \CLK~combout\);

-- Location: LCCOMB_X25_Y1_N28
\Q[0]~47\ : cycloneii_lcell_comb
-- Equation(s):
-- \Q[0]~47_combout\ = !\Q[0]~reg0_regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Q[0]~reg0_regout\,
	combout => \Q[0]~47_combout\);

-- Location: PIN_69,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\CLR~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_CLR,
	combout => \CLR~combout\);

-- Location: LCFF_X25_Y1_N29
\Q[0]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \Q[0]~47_combout\,
	aclr => \CLR~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Q[0]~reg0_regout\);

-- Location: LCCOMB_X25_Y1_N6
\Q[1]~29\ : cycloneii_lcell_comb
-- Equation(s):
-- \Q[1]~29_combout\ = (\Q[1]~reg0_regout\ & (\Q[0]~reg0_regout\ $ (VCC))) # (!\Q[1]~reg0_regout\ & (\Q[0]~reg0_regout\ & VCC))
-- \Q[1]~30\ = CARRY((\Q[1]~reg0_regout\ & \Q[0]~reg0_regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Q[1]~reg0_regout\,
	datab => \Q[0]~reg0_regout\,
	datad => VCC,
	combout => \Q[1]~29_combout\,
	cout => \Q[1]~30\);

-- Location: LCFF_X25_Y1_N7
\Q[1]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \Q[1]~29_combout\,
	aclr => \CLR~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Q[1]~reg0_regout\);

-- Location: LCCOMB_X25_Y1_N8
\Q[2]~31\ : cycloneii_lcell_comb
-- Equation(s):
-- \Q[2]~31_combout\ = (\Q[2]~reg0_regout\ & (!\Q[1]~30\)) # (!\Q[2]~reg0_regout\ & ((\Q[1]~30\) # (GND)))
-- \Q[2]~32\ = CARRY((!\Q[1]~30\) # (!\Q[2]~reg0_regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Q[2]~reg0_regout\,
	datad => VCC,
	cin => \Q[1]~30\,
	combout => \Q[2]~31_combout\,
	cout => \Q[2]~32\);

-- Location: LCFF_X25_Y1_N9
\Q[2]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \Q[2]~31_combout\,
	aclr => \CLR~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Q[2]~reg0_regout\);

-- Location: LCCOMB_X25_Y1_N10
\Q[3]~33\ : cycloneii_lcell_comb
-- Equation(s):
-- \Q[3]~33_combout\ = (\Q[3]~reg0_regout\ & (\Q[2]~32\ $ (GND))) # (!\Q[3]~reg0_regout\ & (!\Q[2]~32\ & VCC))
-- \Q[3]~34\ = CARRY((\Q[3]~reg0_regout\ & !\Q[2]~32\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Q[3]~reg0_regout\,
	datad => VCC,
	cin => \Q[2]~32\,
	combout => \Q[3]~33_combout\,
	cout => \Q[3]~34\);

-- Location: LCFF_X25_Y1_N11
\Q[3]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \Q[3]~33_combout\,
	aclr => \CLR~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Q[3]~reg0_regout\);

-- Location: LCCOMB_X25_Y1_N12
\Q[4]~35\ : cycloneii_lcell_comb
-- Equation(s):
-- \Q[4]~35_combout\ = (\Q[4]~reg0_regout\ & (!\Q[3]~34\)) # (!\Q[4]~reg0_regout\ & ((\Q[3]~34\) # (GND)))
-- \Q[4]~36\ = CARRY((!\Q[3]~34\) # (!\Q[4]~reg0_regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Q[4]~reg0_regout\,
	datad => VCC,
	cin => \Q[3]~34\,
	combout => \Q[4]~35_combout\,
	cout => \Q[4]~36\);

-- Location: LCFF_X25_Y1_N13
\Q[4]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \Q[4]~35_combout\,
	aclr => \CLR~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Q[4]~reg0_regout\);

-- Location: LCCOMB_X25_Y1_N14
\Q[5]~37\ : cycloneii_lcell_comb
-- Equation(s):
-- \Q[5]~37_combout\ = (\Q[5]~reg0_regout\ & (\Q[4]~36\ $ (GND))) # (!\Q[5]~reg0_regout\ & (!\Q[4]~36\ & VCC))
-- \Q[5]~38\ = CARRY((\Q[5]~reg0_regout\ & !\Q[4]~36\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Q[5]~reg0_regout\,
	datad => VCC,
	cin => \Q[4]~36\,
	combout => \Q[5]~37_combout\,
	cout => \Q[5]~38\);

-- Location: LCFF_X25_Y1_N15
\Q[5]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \Q[5]~37_combout\,
	aclr => \CLR~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Q[5]~reg0_regout\);

-- Location: LCCOMB_X25_Y1_N16
\Q[6]~39\ : cycloneii_lcell_comb
-- Equation(s):
-- \Q[6]~39_combout\ = (\Q[6]~reg0_regout\ & (!\Q[5]~38\)) # (!\Q[6]~reg0_regout\ & ((\Q[5]~38\) # (GND)))
-- \Q[6]~40\ = CARRY((!\Q[5]~38\) # (!\Q[6]~reg0_regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Q[6]~reg0_regout\,
	datad => VCC,
	cin => \Q[5]~38\,
	combout => \Q[6]~39_combout\,
	cout => \Q[6]~40\);

-- Location: LCFF_X25_Y1_N17
\Q[6]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \Q[6]~39_combout\,
	aclr => \CLR~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Q[6]~reg0_regout\);

-- Location: LCCOMB_X25_Y1_N18
\Q[7]~41\ : cycloneii_lcell_comb
-- Equation(s):
-- \Q[7]~41_combout\ = (\Q[7]~reg0_regout\ & (\Q[6]~40\ $ (GND))) # (!\Q[7]~reg0_regout\ & (!\Q[6]~40\ & VCC))
-- \Q[7]~42\ = CARRY((\Q[7]~reg0_regout\ & !\Q[6]~40\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Q[7]~reg0_regout\,
	datad => VCC,
	cin => \Q[6]~40\,
	combout => \Q[7]~41_combout\,
	cout => \Q[7]~42\);

-- Location: LCFF_X25_Y1_N19
\Q[7]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \Q[7]~41_combout\,
	aclr => \CLR~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Q[7]~reg0_regout\);

-- Location: LCCOMB_X25_Y1_N20
\Q[8]~43\ : cycloneii_lcell_comb
-- Equation(s):
-- \Q[8]~43_combout\ = (\Q[8]~reg0_regout\ & (!\Q[7]~42\)) # (!\Q[8]~reg0_regout\ & ((\Q[7]~42\) # (GND)))
-- \Q[8]~44\ = CARRY((!\Q[7]~42\) # (!\Q[8]~reg0_regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Q[8]~reg0_regout\,
	datad => VCC,
	cin => \Q[7]~42\,
	combout => \Q[8]~43_combout\,
	cout => \Q[8]~44\);

-- Location: LCFF_X25_Y1_N21
\Q[8]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \Q[8]~43_combout\,
	aclr => \CLR~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Q[8]~reg0_regout\);

-- Location: LCCOMB_X25_Y1_N22
\Q[9]~45\ : cycloneii_lcell_comb
-- Equation(s):
-- \Q[9]~45_combout\ = \Q[8]~44\ $ (!\Q[9]~reg0_regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \Q[9]~reg0_regout\,
	cin => \Q[8]~44\,
	combout => \Q[9]~45_combout\);

-- Location: LCFF_X25_Y1_N23
\Q[9]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \Q[9]~45_combout\,
	aclr => \CLR~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Q[9]~reg0_regout\);

-- Location: PIN_65,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Q[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Q[0]~reg0_regout\,
	oe => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => Q(0));

-- Location: PIN_63,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Q[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Q[1]~reg0_regout\,
	oe => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => Q(1));

-- Location: PIN_59,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Q[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Q[2]~reg0_regout\,
	oe => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => Q(2));

-- Location: PIN_57,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Q[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Q[3]~reg0_regout\,
	oe => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => Q(3));

-- Location: PIN_53,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Q[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Q[4]~reg0_regout\,
	oe => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => Q(4));

-- Location: PIN_51,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Q[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Q[5]~reg0_regout\,
	oe => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => Q(5));

-- Location: PIN_47,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Q[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Q[6]~reg0_regout\,
	oe => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => Q(6));

-- Location: PIN_44,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Q[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Q[7]~reg0_regout\,
	oe => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => Q(7));

-- Location: PIN_42,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Q[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Q[8]~reg0_regout\,
	oe => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => Q(8));

-- Location: PIN_40,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Q[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Q[9]~reg0_regout\,
	oe => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => Q(9));
END structure;


