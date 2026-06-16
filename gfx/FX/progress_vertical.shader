// 2026-06-17 修改：新增自下而上的进度裁切 FX，供 MOD 内竖向进度条复用。
// 入口说明：progress_vertical.lua / progress_vertical.shader。
// 关键变量：CurrentState 取值 0~1，决定底部向顶部的显示比例。
// 预期结果：CurrentState 越大，前景覆盖范围越高。

Includes = {
}

PixelShader =
{
	Samplers =
	{
		TextureOne =
		{
			Index = 0
			MagFilter = "Point"
			MinFilter = "Point"
			MipFilter = "None"
			AddressU = "Wrap"
			AddressV = "Wrap"
		}
		TextureTwo =
		{
			Index = 1
			MagFilter = "Point"
			MinFilter = "Point"
			MipFilter = "None"
			AddressU = "Wrap"
			AddressV = "Wrap"
		}
	}
}


VertexStruct VS_INPUT
{
    float4 vPosition  : POSITION;
    float2 vTexCoord  : TEXCOORD0;
};

VertexStruct VS_OUTPUT
{
    float4  vPosition : PDX_POSITION;
    float2  vTexCoord0 : TEXCOORD0;
};


ConstantBuffer( 0, 0 )
{
	float4x4 WorldViewProjectionMatrix;
	float4 vFirstColor;
	float4 vSecondColor;
	float CurrentState;
};


VertexShader =
{
	MainCode VertexShader
	[[
		// 顶点入口：传递坐标与 UV，并保留原版的 Y 翻转处理，保证 GUI 贴图方向一致。
		VS_OUTPUT main( const VS_INPUT v )
		{
			VS_OUTPUT Out;
			Out.vPosition = mul( WorldViewProjectionMatrix, v.vPosition );
			Out.vTexCoord0 = v.vTexCoord;
			Out.vTexCoord0.y = -Out.vTexCoord0.y;
			return Out;
		}
	]]
}

PixelShader =
{
	MainCode PixelColor
	[[
		// 颜色模式：先把原版翻转后的 Y 坐标还原为 0~1，再让底部 CurrentState 比例显示前景色。
		float4 main( VS_OUTPUT v ) : PDX_COLOR
		{
			float vVerticalProgress = -v.vTexCoord0.y;
			if( vVerticalProgress >= 1.f - CurrentState )
				return vFirstColor;
			else
				return vSecondColor;
		}
	]]

	MainCode PixelTexture
	[[
		// 贴图模式：先把原版翻转后的 Y 坐标还原为 0~1，再让底部 CurrentState 比例显示前景贴图。
		float4 main( VS_OUTPUT v ) : PDX_COLOR
		{
			float vVerticalProgress = -v.vTexCoord0.y;
			if( vVerticalProgress >= 1.f - CurrentState )
				return tex2D( TextureOne, v.vTexCoord0.xy );
			else
				return tex2D( TextureTwo, v.vTexCoord0.xy );
		}
	]]
}

BlendState BlendState
{
	BlendEnable = yes
	SourceBlend = "SRC_ALPHA"
	DestBlend = "INV_SRC_ALPHA"
}

Effect Color
{
	VertexShader = "VertexShader"
	PixelShader = "PixelColor"
}

Effect Texture
{
	VertexShader = "VertexShader"
	PixelShader = "PixelTexture"
}
