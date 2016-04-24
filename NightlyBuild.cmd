@echo off
goto :main

======================================================================
Perform a clean build, run tests and create NuGet packages for this
solution. Note that this also modifies the following file, replacing
placeholder version numbers with actual version numbers:
    src\common\GlobalAssemblyInfo.cs

(see the SetVersionNumber target in xunit.performance.msbuild)

This file will, therefore, show up as modified after the build.
Be careful NOT to check it in that way!

======================================================================

:main
setlocal

set OutputDirectory=%~dp0LocalPackages
set DotNet=%~dp0\tools\cli\bin\dotnet

echo Building version %BuildSemanticVersion% NuGet packages.
echo WARNING: Some source files will be modified during this build.
echo WARNING: Please be careful not to check in those modifications.

msbuild.exe /m /nologo /t:Nightly /v:m /fl xunit.performance.msbuild

BuildCliComponents.cmd

goto :eof