/*

	Updates player clothing by replacing vanilla by custom ones

*/

private["_uniform"];

///Uniform
////////////////

_uniform = uniform player;

switch(true) do
{
	case (playerSide == west && _uniform == "U_Rangemaster"):
	{
		player setObjectTextureGlobal [0, "textures\clothing\Cop.jpg"];
	};
	case (playerSide == civilian && _uniform == "U_C_WorkerCoveralls"):
	{
		player setObjectTextureGlobal  [0, "textures\clothing\prisonsuit.jpg"];
	};
	case (playerSide == civilian && _uniform == "U_C_Scientist"):
	{
		player setObjectTextureGlobal  [0, "textures\clothing\jumpsuit.jpg"]; 
	};
	case (playerSide == independent && _uniform == "U_Rangemaster"):
    {
        player setObjectTextureGlobal [0, "textures\clothing\medic_uniform.jpg"];
    };
	
};
