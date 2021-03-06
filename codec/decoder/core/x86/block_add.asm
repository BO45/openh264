;*!
;* \copy
;*     Copyright (c)  2009-2013, Cisco Systems
;*     All rights reserved.
;*
;*     Redistribution and use in source and binary forms, with or without
;*     modification, are permitted provided that the following conditions
;*     are met:
;*
;*        * Redistributions of source code must retain the above copyright
;*          notice, this list of conditions and the following disclaimer.
;*
;*        * Redistributions in binary form must reproduce the above copyright
;*          notice, this list of conditions and the following disclaimer in
;*          the documentation and/or other materials provided with the
;*          distribution.
;*
;*     THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
;*     "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
;*     LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
;*     FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
;*     COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
;*     INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
;*     BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
;*     LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
;*     CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
;*     LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
;*     ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
;*     POSSIBILITY OF SUCH DAMAGE.
;*
;*
;*  block_add.asm
;*
;*  Abstract
;*      add block
;*
;*  History
;*      09/21/2009 Created
;*
;*
;*************************************************************************/

%include  "asm_inc.asm"

;*******************************************************************************
; Code
;*******************************************************************************

SECTION .text


;*******************************************************************************
;  void WelsResBlockZero16x16_sse2(int16_t* pBlock,int32_t iStride)
;*******************************************************************************
WELS_EXTERN   WelsResBlockZero16x16_sse2
        %assign push_num 0
        LOAD_2_PARA
        PUSH_XMM 8
	SIGN_EXTENSION r1, r1d
        lea 	r1, 	[r1*2]
        lea 	r2,	[r1*3]

	pxor     xmm7,       xmm7

    ; four  lines
	movdqa   [r0],      xmm7
	movdqa   [r0+10h],  xmm7

	movdqa   [r0+r1],  xmm7
	movdqa   [r0+r1+10h],     xmm7

    movdqa   [r0+r1*2],   xmm7
	movdqa   [r0+r1*2+10h],   xmm7

	movdqa   [r0+r2],     xmm7
	movdqa   [r0+r2+10h],     xmm7

    ;  four lines
	lea      r0,       [r0+r1*4]
	movdqa   [r0],      xmm7
	movdqa   [r0+10h],  xmm7

	movdqa   [r0+r1],  xmm7
	movdqa   [r0+r1+10h],     xmm7

    movdqa   [r0+r1*2],   xmm7
	movdqa   [r0+r1*2+10h],   xmm7

	movdqa   [r0+r2],     xmm7
	movdqa   [r0+r2+10h],     xmm7

	;  four lines
	lea      r0,       [r0+r1*4]
	movdqa   [r0],      xmm7
	movdqa   [r0+10h],  xmm7

	movdqa   [r0+r1],  xmm7
	movdqa   [r0+r1+10h],     xmm7

    movdqa   [r0+r1*2],   xmm7
	movdqa   [r0+r1*2+10h],   xmm7

	movdqa   [r0+r2],     xmm7
	movdqa   [r0+r2+10h],     xmm7

	;  four lines
	lea      r0,       [r0+r1*4]
	movdqa   [r0],      xmm7
	movdqa   [r0+10h],  xmm7

	movdqa   [r0+r1],  xmm7
	movdqa   [r0+r1+10h],     xmm7

    movdqa   [r0+r1*2],   xmm7
	movdqa   [r0+r1*2+10h],   xmm7

	movdqa   [r0+r2],     xmm7
	movdqa   [r0+r2+10h],     xmm7

	POP_XMM
	ret


;*******************************************************************************
;  void WelsResBlockZero8x8_sse2(int16_t * pBlock, int32_t iStride)
;*******************************************************************************
WELS_EXTERN   WelsResBlockZero8x8_sse2
	  %assign push_num 0
          LOAD_2_PARA
          PUSH_XMM 8
	  SIGN_EXTENSION r1, r1d
	  lea       r1,     [r1*2]
	  lea       r2,     [r1*3]

	  pxor      xmm7,          xmm7

	  movdqa    [r0],         xmm7
	  movdqa    [r0+r1],     xmm7
	  movdqa    [r0+r1*2],   xmm7
	  movdqa    [r0+r2],     xmm7

	  lea       r0,     [r0+r1*4]
	  movdqa    [r0],         xmm7
	  movdqa    [r0+r1],     xmm7
	  movdqa    [r0+r1*2],   xmm7
	  movdqa    [r0+r2],     xmm7


	  POP_XMM
	  ret

