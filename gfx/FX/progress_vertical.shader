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
		// Vertex entry: pass through position and UV, keep vanilla Y flip for GUI orientation.
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
		// Color mode: restore Y to 0~1, show first color for the bottom CurrentState fraction.
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
		// Texture mode: restore Y to 0~1, show TextureOne for the bottom CurrentState fraction.
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
