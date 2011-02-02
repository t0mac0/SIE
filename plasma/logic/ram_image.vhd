---------------------------------------------------------------------
-- TITLE: Random Access Memory for Xilinx
-- AUTHOR: Steve Rhoads (rhoadss@yahoo.com)
-- DATE CREATED: 11/06/05
-- FILENAME: ram_xilinx.vhd
-- PROJECT: Plasma CPU core
-- COPYRIGHT: Software placed into the public domain by the author.
--    Software 'as is' without warranty.  Author liable for nothing.
-- DESCRIPTION:
--    Implements the RAM for Spartan 3 Xilinx FPGA
--
--    Compile the MIPS C and assembly code into "test.axf".
--    Run convert.exe to change "test.axf" to "code.txt" which
--    will contain the hex values of the opcodes.
--    Next run "ram_image ram_xilinx.vhd code.txt ram_image.vhd",
--    to create the "ram_image.vhd" file that will have the opcodes
--    correctly placed inside the INIT_00 => strings.
--    Then include ram_image.vhd in the simulation/synthesis.
---------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.mlite_pack.all;
library UNISIM;
use UNISIM.vcomponents.all;

entity ram is
   generic(memory_type : string := "DEFAULT");
   port(clk               : in std_logic;
        enable            : in std_logic;
        write_byte_enable : in std_logic_vector(3 downto 0);
        address           : in std_logic_vector(31 downto 2);
        data_write        : in std_logic_vector(31 downto 0);
        data_read         : out std_logic_vector(31 downto 0));
end; --entity ram

architecture logic of ram is
begin

   RAMB16_S9_inst0 : RAMB16_S9
   generic map (
INIT_00 => X"afafafafafafafafafafafafafafafaf2308000c241400ac273c243c243c273c",
INIT_01 => X"8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f230c008c8c3caf00af00af2340afaf",
INIT_02 => X"acacacac0003373cac038cac8cac8cac8c243c40034040033423038f038f8f8f",
INIT_03 => X"000300ac0300000034038c8c8c8c8c8c8c8c8c8c8c8c3403acacacacacacacac",
INIT_04 => X"1c24001030008c24ac24ac9424003c00180003241c24a4248c0018ac2400003c",
INIT_05 => X"a00024241028302400a03c24243c3c0003001030008cacac242400003c000300",
INIT_06 => X"100010000c00102a0200260c24af08af2424240000afafafafaf270103001424",
INIT_07 => X"240c001a001427038f8f8f8f8f8f8f02240c240c000824102c24142c24142e24",
INIT_08 => X"008c34ac3c3c24240c3c240c3caf0cafafafafafafafafaf270008260c24240c",
INIT_09 => X"3c240c3c240c3c240c3c3c3c3c3c3c003c3c0c003c240c3c3c1430248c3c1030",
INIT_0A => X"0000142c2400000c240c3c270c260c260c260c260c240c3c240c3c240c3c240c",
INIT_0B => X"000c000c00000c240c3c3c08240c3c000c000c8e0000008c0024003c3c102c26",
INIT_0C => X"0200000010000c240c3c3c080002a208000c000c00000c240c3c0008923c08ae",
INIT_0D => X"000010000c240c3c3c080216a002260c00000010000c240c3c3c080216260c90",
INIT_0E => X"260c8c02240c3c00000010000c240c3c3c08240c000c000c0014002490020000",
INIT_0F => X"120008a23c24003c08240c3c021402240c000c260c8c021032021002240c000c",
INIT_10 => X"3c083c0c003c000c0014343c000c240c3c3c080000240016260c262610000c24",
INIT_11 => X"008c343c3c08240c000c000c2608240c3c000c020c240c3c00000c240c3c020c",
INIT_12 => X"82000c2682000c241400100082260c00240800100080afafaf270003ac001030",
INIT_13 => X"038f8f8f8f0216260c2424142c3002242400afafafaf272703008f8f8f001400",
INIT_14 => X"038c0014ac00248c3c24243c3c2703008f8c3c10000caf2730038c343c240827",
INIT_15 => X"6531006e706e724f303030206e6569612020740a00616d20423a20616f430a24",
INIT_16 => X"617965613673647475350a62697965340079617965330a7769796532006f6179",
INIT_17 => X"0a3d6541206820720a3e00616f446f42316f4600753900736838006979656137",
INIT_18 => X"00000000000000000000000000000000000037336820660a0d786e6e0a786e75",
INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000")
   port map (
      DO   => data_read(31 downto 24),
      DOP  => open, 
      ADDR => address(12 downto 2),
      CLK  => clk, 
      DI   => data_write(31 downto 24),
      DIP  => ZERO(0 downto 0),
      EN   => enable,
      SSR  => ZERO(0),
      WE   => write_byte_enable(3));

   RAMB16_S9_inst1 : RAMB16_S9
   generic map (
INIT_00 => X"b8afaeadacabaaa9a8a7a6a5a4a3a2a1bd000000a560a4a0bd1d8404a5059c1c",
INIT_01 => X"b9b8afaeadacabaaa9a8a7a6a5a4a3a2a1a50086c6c406bb00bb00ba5a1abfb9",
INIT_02 => X"9392919000405a1a06e0a606a606a606a6a50584e0029b401bbd60bb60bbbabf",
INIT_03 => X"00e000c4e0000085a2e09f9d9c9e979695949392919002e09f9d9c9e97969594",
INIT_04 => X"c0c60040420062636284658205620205c000e084c0a582c6a200c0a202a20502",
INIT_05 => X"c2e5070740a285634040036642020300e000404200828283020382040200e000",
INIT_06 => X"54405300000040220312310090b000bf1514130000b1b2b3b4b5bd00e004c3c6",
INIT_07 => X"040000208095bde0b0b1b2b3b4b5bf4004000400000090404282404282400250",
INIT_08 => X"00434283020403840004840004b000b1b2b3b4b5b6b7bebfbd12003100040400",
INIT_09 => X"024400024400024400021e171615144002060000048400041543420382146063",
INIT_0A => X"0000404242400000440002c400e400c400a40084004400024400024400024400",
INIT_0B => X"4000400040000044000202004400024000000044008000444383030402406203",
INIT_0C => X"4200004040000044000202000040500040004000400000440002000044020050",
INIT_0D => X"0040400000440002020000136251100000004040000044000202000011100044",
INIT_0E => X"300044504400020000404000004400020200040040000000a0a683a543420000",
INIT_0F => X"1100005013110002004400020060130400400030004450400200601304004000",
INIT_10 => X"0200060000040000004363030000440002020000400240535200101040000002",
INIT_11 => X"0062a30502000400400000000300440002400040004400024000004400020000",
INIT_12 => X"02400010020000045100400002100040110080400082b1bfb0bd00e0a4004042",
INIT_13 => X"e0b0b1b2bf12111000646440624312111080bfb0b1b2bdbde000b0b1bf004000",
INIT_14 => X"e0a20083404584820563440302bde000bf6203400000bfbd42e06263030400bd",
INIT_15 => X"6d2e007374752074303078616b206d7262666957007320666f0a006474205342",
INIT_16 => X"64206d772e73646f6d2e007974206d2e007464206d2e006f74206d2e00726420",
INIT_17 => X"56207364006569654120007320526d2032702e006d2e0075652e0074206d772e",
INIT_18 => X"0000000000000000000000000000000000003834207769430a3e2074433e2065",
INIT_19 => X"0000000000000000000000000000000000000004000080240080000000000000",
INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000")
   port map (
      DO   => data_read(23 downto 16),
      DOP  => open, 
      ADDR => address(12 downto 2),
      CLK  => clk, 
      DI   => data_write(23 downto 16),
      DIP  => ZERO(0 downto 0),
      EN   => enable,
      SSR  => ZERO(0),
      WE   => write_byte_enable(2));

   RAMB16_S9_inst2 : RAMB16_S9
   generic map (
INIT_00 => X"00000000000000000000000000000000ff00000100ff18000e000e000c008c00",
INIT_01 => X"000000000000000000000000000000000000022000002000d800d800ff700000",
INIT_02 => X"0000000000000010000000000000000000010060006060000000000000000000",
INIT_03 => X"0000000000201000000000000000000000000000000000000000000000000000",
INIT_04 => X"ffff00ff00000000000000000018301800000000ff0000ff0000000000282830",
INIT_05 => X"001000000000000c4000000c0c0000000000ff00000000000000202030000000",
INIT_06 => X"002000000200000090190002ff00000000000088900000000000ff100021ffff",
INIT_07 => X"0002000080ff00000000000000000010000200020000ff0000ffff00ffff00ff",
INIT_08 => X"000000002030000a02000a02000002000000000000000000ff9100ff02000002",
INIT_09 => X"000a02000a02000a02000000000000f810000028100a02000000ff3c00000000",
INIT_0A => X"90000000ff8000020b02000b020b020b020b020b020b02000b02000b02000b02",
INIT_0B => X"200280002000000b020000010b0200200200000000000000100c100000ff00ff",
INIT_0C => X"10108088ff00000c0200000100f80001200280002000000b0200000100000100",
INIT_0D => X"28300000000c0200000188ff00180002888098ff00000c0200000110ff000200",
INIT_0E => X"000000100c02008880980000000c0200000100022002000010ff200000101020",
INIT_0F => X"0080020d00279000010c020088ff180002200200000010ff0088001800022002",
INIT_10 => X"000100002810200000ff561200000c0200000100f80d80ff0002ff00ff00020d",
INIT_11 => X"000000200001000220022000ff010b0200200220000b02009000000b02002002",
INIT_12 => X"0020020000000200ff00000000000220000280000000000000ff00000010ff00",
INIT_13 => X"000000000010ffff02000000000010ff009000000000ff00001000000000ff00",
INIT_14 => X"000000ff00100000100c0c0000000000000020ff000200ff0000000020000200",
INIT_15 => X"6f20003a69204d680a303174656c6179696f6e61006866726f0000656c624100",
INIT_16 => X"0a726f20200a72207020007465776f20006520726f20007265776f2000642072",
INIT_17 => X"6100736400786e736400006866202066387920007020006d63200065776f2020",
INIT_18 => X"0404040404070404070606060606060505003e353169726f002068206f206820",
INIT_19 => X"0000000000000000000000000000000000000020000000202800000804040404",
INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000")
   port map (
      DO   => data_read(15 downto 8),
      DOP  => open, 
      ADDR => address(12 downto 2),
      CLK  => clk, 
      DI   => data_write(15 downto 8),
      DIP  => ZERO(0 downto 0),
      EN   => enable,
      SSR  => ZERO(0),
      WE   => write_byte_enable(1));

   RAMB16_S9_inst3 : RAMB16_S9
   generic map (
INIT_00 => X"4c4844403c3834302c2824201c181410980e000704fd2a00b800d000b400b001",
INIT_01 => X"504c4844403c3834302c2824201c18141000812410200060125c1058fc005450",
INIT_02 => X"0c08040000083c0048080c440840043c006000000800000801681360115c5854",
INIT_03 => X"00080c000810121900082c2824201c1814100c08040000082c2824201c181410",
INIT_04 => X"f4fe00fc80000004000200004021004011000802fb0400fe00000700ff214000",
INIT_05 => X"00213037020a0fbf210800c7c00000000800fc8000000000d020214000000800",
INIT_06 => X"0c210e00880012102100013cc910db28080d0a212114181c2024d0210802f7ff",
INIT_07 => X"083c000821d930081014181c202428210a3c0d3c00d4a9111a9fed1abff10ad0",
INIT_08 => X"000050000000ff984600844600109314181c2024282c3034c802d8ff3c08203c",
INIT_09 => X"00f84600e04600b0460000000000000900028021009c4600000cff1c00001001",
INIT_0A => X"2100c20ad0210088d84600b446a846984680466c465846004046002846001046",
INIT_0B => X"214621b12100c5fc46000037244600214600b10000080000213c800000d416cf",
INIT_0C => X"212121219a00c50c4600003700090036214621b12100c5fc4600006d00003700",
INIT_0D => X"21217600c50c4600003721fb002101882121218900c50c4600003721fb013c00",
INIT_0E => X"04b100211c46002121211e00c50c460000370a3c214600b121fb210100212121",
INIT_0F => X"0b21010010102100371c460021f42b203c214604b10021f00f210e2b203c2146",
INIT_10 => X"0037028f210021a3001f783400c5204600003700090021f30188ff01fb008300",
INIT_11 => X"0000200000370a3c214621b1cf61244600214621b1f046002100c5dc4600213c",
INIT_12 => X"00213c0100003c0df8000d0000013c210a5721160000141810e000080021fc02",
INIT_13 => X"081014181c06f8fc3c5730020a0f06fc1c211c101418e020082110141800f500",
INIT_14 => X"080000fb0021040000b4940000180800100000fd008310e80108002000493c20",
INIT_15 => X"724d000a6f4f656500303020646967206e726769000a6c6f740000726f6f4b84",
INIT_16 => X"0065726d52006561204a00652072724d000a6265724d00642072724d000a7765",
INIT_17 => X"6c002072003e20736400000a6c7444724b2043000a44000a6b43000a72726d52",
INIT_18 => X"d8d8d8d8d8e4d8d840e09c5848180cd8b000203632746d6e0000656975006569",
INIT_19 => X"0000000000000000000000000000000000000000101020000020703cd8d8d8d8",
INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000")
   port map (
      DO   => data_read(7 downto 0),
      DOP  => open, 
      ADDR => address(12 downto 2),
      CLK  => clk, 
      DI   => data_write(7 downto 0),
      DIP  => ZERO(0 downto 0),
      EN   => enable,
      SSR  => ZERO(0),
      WE   => write_byte_enable(0));

end; --architecture logic
