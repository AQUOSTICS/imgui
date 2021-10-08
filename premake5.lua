project "ImGui"
	kind "StaticLib"
	language "C++"

	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-obj/" .. outputdir .. "/%{prj.name}")

	files
	{
        "*.h",
        "*.cpp",
        "backends/imgui_impl_dx*",
        "backends/imgui_impl_opengl*",
        "backends/imgui_impl_win32*",
	}

    includedirs
	{
		"%{prj.location}",
	}

	filter "system:windows"
		systemversion "latest"
	    cppdialect "C++latest"
		staticruntime "on"

	filter "system:linux"
		pic "On"
		systemversion "latest"
	    cppdialect "C++latest"
		staticruntime "on"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
