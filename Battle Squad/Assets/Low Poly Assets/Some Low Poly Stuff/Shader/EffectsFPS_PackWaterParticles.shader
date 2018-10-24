Shader "Effects/FPS_Pack/WaterParticles" {
	Properties {
		_TintColor ("Tint Color", Vector) = (1,1,1,1)
		_MainTex ("Main Texture (R) CutOut (G)", 2D) = "white" {}
		_BumpMap ("Normalmap", 2D) = "bump" {}
		_ColorStrength ("Color Strength", Float) = 1
		_BumpAmt ("Distortion", Float) = 10
	}
	SubShader {
		Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent+1" "RenderType" = "Transparent" }
		GrabPass {
		}
		Pass {
			Name "BASE"
			Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "ALWAYS" "QUEUE" = "Transparent+1" "RenderType" = "Transparent" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			ZWrite Off
			Cull Off
			Fog {
				Mode Off
			}
			GpuProgramID 39281
			Program "vp" {
				SubProgram "d3d11 " {
					"!!DX11VertexSM40
					//
					// Generated by Microsoft (R) D3D Shader Disassembler
					//
					//
					// Input signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// POSITION                 0   xyzw        0     NONE   float   xyz 
					// TEXCOORD                 0   xy          1     NONE   float   xy  
					// COLOR                    0   xyzw        2     NONE   float   xyzw
					//
					//
					// Output signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// SV_Position              0   xyzw        0      POS   float   xyzw
					// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
					// TEXCOORD                 1   xy          2     NONE   float   xy  
					// TEXCOORD                 2     zw        2     NONE   float     zw
					// COLOR                    0   xyzw        3     NONE   float   xyzw
					//
					vs_4_0
					dcl_constantbuffer CB0[8], immediateIndexed
					dcl_constantbuffer CB1[4], immediateIndexed
					dcl_constantbuffer CB2[21], immediateIndexed
					dcl_input v0.xyz
					dcl_input v1.xy
					dcl_input v2.xyzw
					dcl_output_siv o0.xyzw, position
					dcl_output o1.xyzw
					dcl_output o2.xy
					dcl_output o2.zw
					dcl_output o3.xyzw
					dcl_temps 2
					mul r0.xyzw, v0.yyyy, cb1[1].xyzw
					mad r0.xyzw, cb1[0].xyzw, v0.xxxx, r0.xyzw
					mad r0.xyzw, cb1[2].xyzw, v0.zzzz, r0.xyzw
					add r0.xyzw, r0.xyzw, cb1[3].xyzw
					mul r1.xyzw, r0.yyyy, cb2[18].xyzw
					mad r1.xyzw, cb2[17].xyzw, r0.xxxx, r1.xyzw
					mad r1.xyzw, cb2[19].xyzw, r0.zzzz, r1.xyzw
					mad r0.xyzw, cb2[20].xyzw, r0.wwww, r1.xyzw
					mov o0.xyzw, r0.xyzw
					mad r0.xy, r0.xyxx, l(1.000000, -1.000000, 0.000000, 0.000000), r0.wwww
					mov o1.zw, r0.wwww
					mul o1.xy, r0.xyxx, l(0.500000, 0.500000, 0.000000, 0.000000)
					mad o2.xy, v1.xyxx, cb0[6].xyxx, cb0[6].zwzz
					mad o2.zw, v1.xxxy, cb0[7].xxxy, cb0[7].zzzw
					mov o3.xyzw, v2.xyzw
					ret 
					// Approximately 0 instruction slots used"
				}
				SubProgram "d3d11 " {
					Keywords { "SOFTPARTICLES_ON" }
					"!!DX11VertexSM40
					//
					// Generated by Microsoft (R) D3D Shader Disassembler
					//
					//
					// Input signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// POSITION                 0   xyzw        0     NONE   float   xyz 
					// TEXCOORD                 0   xy          1     NONE   float   xy  
					// COLOR                    0   xyzw        2     NONE   float   xyzw
					//
					//
					// Output signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// SV_Position              0   xyzw        0      POS   float   xyzw
					// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
					// TEXCOORD                 1   xy          2     NONE   float   xy  
					// TEXCOORD                 2     zw        2     NONE   float     zw
					// COLOR                    0   xyzw        3     NONE   float   xyzw
					// TEXCOORD                 4   xyzw        4     NONE   float   xyzw
					//
					vs_4_0
					dcl_constantbuffer CB0[8], immediateIndexed
					dcl_constantbuffer CB1[6], immediateIndexed
					dcl_constantbuffer CB2[4], immediateIndexed
					dcl_constantbuffer CB3[21], immediateIndexed
					dcl_input v0.xyz
					dcl_input v1.xy
					dcl_input v2.xyzw
					dcl_output_siv o0.xyzw, position
					dcl_output o1.xyzw
					dcl_output o2.xy
					dcl_output o2.zw
					dcl_output o3.xyzw
					dcl_output o4.xyzw
					dcl_temps 3
					mul r0.xyzw, v0.yyyy, cb2[1].xyzw
					mad r0.xyzw, cb2[0].xyzw, v0.xxxx, r0.xyzw
					mad r0.xyzw, cb2[2].xyzw, v0.zzzz, r0.xyzw
					add r0.xyzw, r0.xyzw, cb2[3].xyzw
					mul r1.xyzw, r0.yyyy, cb3[18].xyzw
					mad r1.xyzw, cb3[17].xyzw, r0.xxxx, r1.xyzw
					mad r1.xyzw, cb3[19].xyzw, r0.zzzz, r1.xyzw
					mad r1.xyzw, cb3[20].xyzw, r0.wwww, r1.xyzw
					mov o0.xyzw, r1.xyzw
					mad r2.xy, r1.xyxx, l(1.000000, -1.000000, 0.000000, 0.000000), r1.wwww
					mul o1.xy, r2.xyxx, l(0.500000, 0.500000, 0.000000, 0.000000)
					mov r2.xy, r1.wwww
					mov o1.zw, r2.xxxy
					mov o4.w, r2.y
					mad o2.xy, v1.xyxx, cb0[6].xyxx, cb0[6].zwzz
					mad o2.zw, v1.xxxy, cb0[7].xxxy, cb0[7].zzzw
					mov o3.xyzw, v2.xyzw
					mul r0.y, r0.y, cb3[10].z
					mad r0.x, cb3[9].z, r0.x, r0.y
					mad r0.x, cb3[11].z, r0.z, r0.x
					mad r0.x, cb3[12].z, r0.w, r0.x
					mov o4.z, -r0.x
					mul r0.x, r1.y, cb1[5].x
					mul r1.xz, r1.xxwx, l(0.500000, 0.000000, 0.500000, 0.000000)
					mul r1.w, r0.x, l(0.500000)
					add o4.xy, r1.zzzz, r1.xwxx
					ret 
					// Approximately 0 instruction slots used"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					"!!DX11PixelSM40
					//
					// Generated by Microsoft (R) D3D Shader Disassembler
					//
					//
					// Input signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// SV_Position              0   xyzw        0      POS   float       
					// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
					// TEXCOORD                 1   xy          2     NONE   float   xy  
					// TEXCOORD                 2     zw        2     NONE   float     zw
					// COLOR                    0   xyzw        3     NONE   float   xyzw
					//
					//
					// Output signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// SV_Target                0   xyzw        0   TARGET   float   xyzw
					//
					ps_4_0
					dcl_constantbuffer CB0[5], immediateIndexed
					dcl_sampler s0, mode_default
					dcl_sampler s1, mode_default
					dcl_sampler s2, mode_default
					dcl_resource_texture2d (float,float,float,float) t0
					dcl_resource_texture2d (float,float,float,float) t1
					dcl_resource_texture2d (float,float,float,float) t2
					dcl_input_ps linear v1.xyzw
					dcl_input_ps linear v2.xy
					dcl_input_ps linear v2.zw
					dcl_input_ps linear v3.xyzw
					dcl_output o0.xyzw
					dcl_temps 2
					sample r0.xyzw, v2.xyxx, t0.xyzw, s1
					mul r0.x, r0.w, r0.x
					mad r0.xy, r0.xyxx, l(2.000000, 2.000000, 0.000000, 0.000000), l(-1.000000, -1.000000, 0.000000, 0.000000)
					mul r0.xy, r0.xyxx, cb0[2].xxxx
					mul r0.xy, r0.xyxx, cb0[3].xyxx
					mul r0.xy, r0.xyxx, v3.wwww
					mad r0.xy, r0.xyxx, v1.zzzz, v1.xyxx
					div r0.xy, r0.xyxx, v1.wwww
					sample r0.xyzw, r0.xyxx, t1.xyzw, s2
					sample r1.xyzw, v2.zwzz, t2.xyzw, s0
					mul r0.w, r1.x, cb0[2].y
					mul o0.w, r1.y, cb0[4].w
					mul r1.xyz, r0.wwww, cb0[4].xyzx
					mul r1.xyz, r1.xyzx, v3.xyzx
					mul r1.xyz, r1.xyzx, v3.wwww
					mad o0.xyz, r0.xyzx, v3.xyzx, r1.xyzx
					ret 
					// Approximately 0 instruction slots used"
				}
				SubProgram "d3d11 " {
					Keywords { "SOFTPARTICLES_ON" }
					"!!DX11PixelSM40
					//
					// Generated by Microsoft (R) D3D Shader Disassembler
					//
					//
					// Input signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// SV_Position              0   xyzw        0      POS   float       
					// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
					// TEXCOORD                 1   xy          2     NONE   float   xy  
					// TEXCOORD                 2     zw        2     NONE   float     zw
					// COLOR                    0   xyzw        3     NONE   float   xyzw
					// TEXCOORD                 4   xyzw        4     NONE   float       
					//
					//
					// Output signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// SV_Target                0   xyzw        0   TARGET   float   xyzw
					//
					ps_4_0
					dcl_constantbuffer CB0[5], immediateIndexed
					dcl_sampler s0, mode_default
					dcl_sampler s1, mode_default
					dcl_sampler s2, mode_default
					dcl_resource_texture2d (float,float,float,float) t0
					dcl_resource_texture2d (float,float,float,float) t1
					dcl_resource_texture2d (float,float,float,float) t2
					dcl_input_ps linear v1.xyzw
					dcl_input_ps linear v2.xy
					dcl_input_ps linear v2.zw
					dcl_input_ps linear v3.xyzw
					dcl_output o0.xyzw
					dcl_temps 2
					sample r0.xyzw, v2.xyxx, t0.xyzw, s1
					mul r0.x, r0.w, r0.x
					mad r0.xy, r0.xyxx, l(2.000000, 2.000000, 0.000000, 0.000000), l(-1.000000, -1.000000, 0.000000, 0.000000)
					mul r0.xy, r0.xyxx, cb0[2].xxxx
					mul r0.xy, r0.xyxx, cb0[3].xyxx
					mul r0.xy, r0.xyxx, v3.wwww
					mad r0.xy, r0.xyxx, v1.zzzz, v1.xyxx
					div r0.xy, r0.xyxx, v1.wwww
					sample r0.xyzw, r0.xyxx, t1.xyzw, s2
					sample r1.xyzw, v2.zwzz, t2.xyzw, s0
					mul r0.w, r1.x, cb0[2].y
					mul o0.w, r1.y, cb0[4].w
					mul r1.xyz, r0.wwww, cb0[4].xyzx
					mul r1.xyz, r1.xyzx, v3.xyzx
					mul r1.xyz, r1.xyzx, v3.wwww
					mad o0.xyz, r0.xyzx, v3.xyzx, r1.xyzx
					ret 
					// Approximately 0 instruction slots used"
				}
			}
		}
	}
	SubShader {
		Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent+1" "RenderType" = "Transparent" }
		Pass {
			Name "BASE"
			Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent+1" "RenderType" = "Transparent" }
			Blend DstColor Zero, DstColor Zero
			ZWrite Off
			Cull Off
			Fog {
				Mode Off
			}
			GpuProgramID 84166
			Program "vp" {
				SubProgram "d3d11 " {
					"!!DX11VertexSM40
					//
					// Generated by Microsoft (R) D3D Shader Disassembler
					//
					//
					// Input signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// POSITION                 0   xyz         0     NONE   float   xyz 
					// TEXCOORD                 0   xyz         1     NONE   float   xy  
					//
					//
					// Output signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// COLOR                    0   xyzw        0     NONE   float   xyzw
					// TEXCOORD                 0   xy          1     NONE   float   xy  
					// SV_POSITION              0   xyzw        2      POS   float   xyzw
					//
					vs_4_0
					dcl_constantbuffer CB0[3], immediateIndexed
					dcl_constantbuffer CB1[4], immediateIndexed
					dcl_constantbuffer CB2[21], immediateIndexed
					dcl_input v0.xyz
					dcl_input v1.xy
					dcl_output o0.xyzw
					dcl_output o1.xy
					dcl_output_siv o2.xyzw, position
					dcl_temps 2
					mov o0.xyzw, l(0,0,0,1.000000)
					mad o1.xy, v1.xyxx, cb0[2].xyxx, cb0[2].zwzz
					mul r0.xyzw, v0.yyyy, cb1[1].xyzw
					mad r0.xyzw, cb1[0].xyzw, v0.xxxx, r0.xyzw
					mad r0.xyzw, cb1[2].xyzw, v0.zzzz, r0.xyzw
					add r0.xyzw, r0.xyzw, cb1[3].xyzw
					mul r1.xyzw, r0.yyyy, cb2[18].xyzw
					mad r1.xyzw, cb2[17].xyzw, r0.xxxx, r1.xyzw
					mad r1.xyzw, cb2[19].xyzw, r0.zzzz, r1.xyzw
					mad o2.xyzw, cb2[20].xyzw, r0.wwww, r1.xyzw
					ret 
					// Approximately 0 instruction slots used"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					"!!DX11PixelSM40
					//
					// Generated by Microsoft (R) D3D Shader Disassembler
					//
					//
					// Input signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// COLOR                    0   xyzw        0     NONE   float       
					// TEXCOORD                 0   xy          1     NONE   float   xy  
					// SV_POSITION              0   xyzw        2      POS   float       
					//
					//
					// Output signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// SV_Target                0   xyzw        0   TARGET   float   xyzw
					//
					ps_4_0
					dcl_sampler s0, mode_default
					dcl_resource_texture2d (float,float,float,float) t0
					dcl_input_ps linear v1.xy
					dcl_output o0.xyzw
					sample o0.xyzw, v1.xyxx, t0.xyzw, s0
					ret 
					// Approximately 0 instruction slots used"
				}
			}
		}
	}
}