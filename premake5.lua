project "ImGui"
	kind "StaticLib"
	language "C++"

	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-obj/" .. outputdir .. "/%{prj.name}")

	files
	{
		"imconfig.h",
		"imgui.h",
		"imgui.cpp",
		"imgui_draw.cpp",
		"imgui_internal.h",
		"imgui_widgets.cpp",
		"imstb_rectpack.h",
		"imstb_textedit.h",
		"imstb_truetype.h",
		"imgui_demo.cpp",
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
