@echo off
FOR /L %%A IN (1,1,200) DO (
  git clean -fxd && dotnet build-server shutdown && dotnet build --framework net5.0
  if %ERRORLEVEL% GEQ 1 exit /b %ERRORLEVEL%
)
