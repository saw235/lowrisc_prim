// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// SECDED Decoder generated by secded_gen.py

module prim_secded_22_16_dec (
  input        [21:0] in,
  output logic [15:0] d_o,
  output logic [5:0] syndrome_o,
  output logic [1:0] err_o
);

  logic single_error;

  // Syndrome calculation
  assign syndrome_o[0] = in[16] ^ in[0] ^ in[1] ^ in[5] ^ in[8] ^ in[9] ^ in[10] ^ in[11] ^ in[15];
  assign syndrome_o[1] = in[17] ^ in[0] ^ in[4] ^ in[5] ^ in[6] ^ in[8] ^ in[12] ^ in[13] ^ in[14];
  assign syndrome_o[2] = in[18] ^ in[1] ^ in[3] ^ in[4] ^ in[6] ^ in[7] ^ in[8] ^ in[10] ^ in[13];
  assign syndrome_o[3] = in[19] ^ in[1] ^ in[2] ^ in[3] ^ in[11] ^ in[12] ^ in[13] ^ in[14] ^ in[15];
  assign syndrome_o[4] = in[20] ^ in[2] ^ in[3] ^ in[5] ^ in[6] ^ in[7] ^ in[9] ^ in[11] ^ in[12];
  assign syndrome_o[5] = in[21] ^ in[0] ^ in[2] ^ in[4] ^ in[7] ^ in[9] ^ in[10] ^ in[14] ^ in[15];

  // Corrected output calculation
  assign d_o[0] = (syndrome_o == 6'h23) ^ in[0];
  assign d_o[1] = (syndrome_o == 6'hd) ^ in[1];
  assign d_o[2] = (syndrome_o == 6'h38) ^ in[2];
  assign d_o[3] = (syndrome_o == 6'h1c) ^ in[3];
  assign d_o[4] = (syndrome_o == 6'h26) ^ in[4];
  assign d_o[5] = (syndrome_o == 6'h13) ^ in[5];
  assign d_o[6] = (syndrome_o == 6'h16) ^ in[6];
  assign d_o[7] = (syndrome_o == 6'h34) ^ in[7];
  assign d_o[8] = (syndrome_o == 6'h7) ^ in[8];
  assign d_o[9] = (syndrome_o == 6'h31) ^ in[9];
  assign d_o[10] = (syndrome_o == 6'h25) ^ in[10];
  assign d_o[11] = (syndrome_o == 6'h19) ^ in[11];
  assign d_o[12] = (syndrome_o == 6'h1a) ^ in[12];
  assign d_o[13] = (syndrome_o == 6'he) ^ in[13];
  assign d_o[14] = (syndrome_o == 6'h2a) ^ in[14];
  assign d_o[15] = (syndrome_o == 6'h29) ^ in[15];

  // err_o calc. bit0: single error, bit1: double error
  assign single_error = ^syndrome_o;
  assign err_o[0] =  single_error;
  assign err_o[1] = ~single_error & (|syndrome_o);
endmodule

