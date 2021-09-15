# sdk_9585
https://github.com/dotnet/sdk/issues/9585

## Case1 (Failure) - TargetFramework=net5.0

### dotnet
`git -C Case1 clean -fxd && dotnet build-server shutdown && dotnet build Case1 --framework net5.0`

```
git -C Case1 clean -fxd && dotnet build-server shutdown && dotnet build Case1 --framework net5.0
Removing Library.Tests/bin/
Removing Library.Tests/obj/
Removing Library/bin/
Removing Library/obj/
Shutting down MSBuild server...
Shutting down VB/C# compiler server...
VB/C# compiler server shut down successfully.
MSBuild server shut down successfully.
Microsoft (R) Build Engine version 16.10.2+857e5a733 for .NET
Copyright (C) Microsoft Corporation. All rights reserved.

  Determining projects to restore...
  Restored D:\workspace\sdk_9585\Case1\Library.Tests\Library.Tests.csproj (in 61 ms).
  Restored D:\workspace\sdk_9585\Case1\Library\Library.csproj (in 61 ms).
CSC : error CS2012: Cannot open 'D:\workspace\sdk_9585\Case1\Library\obj\Debug\net5.0\Library.dll' for writing -- 'The process cannot access the file 'D:\workspace\sdk_9585\Case1\Library\obj\Debug\net5.0\Library.dll' because it is being used by another process.' [D:\workspace\sdk_9585\Case1\Library\Library.csproj]
  Library -> D:\workspace\sdk_9585\Case1\Library\bin\Debug\net5.0\Library.dll
  Library.Tests -> D:\workspace\sdk_9585\Case1\Library.Tests\bin\Debug\net5.0\Library.Tests.dll

Build FAILED.

CSC : error CS2012: Cannot open 'D:\workspace\sdk_9585\Case1\Library\obj\Debug\net5.0\Library.dll' for writing -- 'The process cannot access the file 'D:\workspace\sdk_9585\Case1\Library\obj\Debug\net5.0\Library.dll' because it is being used by another process.' [D:\workspace\sdk_9585\Case1\Library\Library.csproj]
    0 Warning(s)
    1 Error(s)

Time Elapsed 00:00:01.85
```

### dotnet msbuild
```
git clean -fxd && dotnet build-server shutdown && dotnet msbuild Case1 /t:restore && dotnet msbuild Case1^
 /t:build;publish^
 /p:Configuration=Release^
 /p:targetframework=net5.0^
 /p:RestoreIgnoreFailedSources=true^
 /p:ResolveAssemblyWarnOrErrorOnTargetArchitectureMismatch=None^
 /p:CreateHardLinksForCopyFilesToOutputDirectoryIfPossible=true^
 /p:CreateHardLinksForCopyAdditionalFilesIfPossible=true^
 /p:CreateHardLinksForCopyLocalIfPossible=true^
 /p:CreateHardLinksForPublishFilesIfPossible=true^
 /verbosity:Minimal^
 /m^
 /nodeReuse:false
```

```
git clean -fxd && dotnet build-server shutdown && dotnet msbuild Case1 /t:restore && dotnet msbuild Case1^
More?  /t:build;publish^
More?  /p:Configuration=Release^
More?  /p:targetframework=net5.0^
More?  /p:RestoreIgnoreFailedSources=true^
More?  /p:ResolveAssemblyWarnOrErrorOnTargetArchitectureMismatch=None^
More?  /p:CreateHardLinksForCopyFilesToOutputDirectoryIfPossible=true^
More?  /p:CreateHardLinksForCopyAdditionalFilesIfPossible=true^
More?  /p:CreateHardLinksForCopyLocalIfPossible=true^
More?  /p:CreateHardLinksForPublishFilesIfPossible=true^
More?  /verbosity:Minimal^
More?  /m^
More?  /nodeReuse:false
Removing Case1/Library.Tests/bin/
Removing Case1/Library.Tests/obj/
Removing Case1/Library/bin/
Removing Case1/Library/obj/
Removing Case2/Library.Tests/bin/
Removing Case2/Library.Tests/obj/
Removing Case2/Library/bin/
Removing Case2/Library/obj/
Shutting down MSBuild server...
Shutting down VB/C# compiler server...
VB/C# compiler server shut down successfully.
MSBuild server shut down successfully.
Microsoft (R) Build Engine version 16.10.2+857e5a733 for .NET
Copyright (C) Microsoft Corporation. All rights reserved.

  Determining projects to restore...
  Restored D:\workspace\sdk_9585\Case1\Library\Library.csproj (in 61 ms).
  Restored D:\workspace\sdk_9585\Case1\Library.Tests\Library.Tests.csproj (in 61 ms).
Microsoft (R) Build Engine version 16.10.2+857e5a733 for .NET
Copyright (C) Microsoft Corporation. All rights reserved.

CSC : error CS2012: Cannot open 'D:\workspace\sdk_9585\Case1\Library\obj\Release\net5.0\Library.dll' for writing -- 'The process cannot access the file 'D:\workspace\sdk_9585\Case1\Library\obj\Release\net5.0\Library.dll' because it is being used by another process.' [D:\workspace\sdk_9585\Case1\Library\Library.csproj]
  Library -> D:\workspace\sdk_9585\Case1\Library\bin\Release\net5.0\Library.dll
  Library.Tests -> D:\workspace\sdk_9585\Case1\Library.Tests\bin\Release\net5.0\Library.Tests.dll
```

## Case2 (Success) - TargetFrameworks=net5.0

### dotnet
`git -C Case2 clean -fxd && dotnet build-server shutdown && dotnet build Case2 --framework net5.0`

```
git -C Case2 clean -fxd && dotnet build-server shutdown && dotnet build Case2 --framework net5.0
Removing Library.Tests/bin/
Removing Library.Tests/obj/
Removing Library/bin/
Removing Library/obj/
Shutting down MSBuild server...
Shutting down VB/C# compiler server...
VB/C# compiler server shut down successfully.
MSBuild server shut down successfully.
Microsoft (R) Build Engine version 16.10.2+857e5a733 for .NET
Copyright (C) Microsoft Corporation. All rights reserved.

  Determining projects to restore...
  Restored D:\workspace\sdk_9585\Case2\Library\Library.csproj (in 63 ms).
  Restored D:\workspace\sdk_9585\Case2\Library.Tests\Library.Tests.csproj (in 63 ms).
  Library -> D:\workspace\sdk_9585\Case2\Library\bin\Debug\net5.0\Library.dll
  Library.Tests -> D:\workspace\sdk_9585\Case2\Library.Tests\bin\Debug\net5.0\Library.Tests.dll

Build succeeded.
    0 Warning(s)
    0 Error(s)

Time Elapsed 00:00:02.13
```

### dotnet msbuild
```
git clean -fxd && dotnet build-server shutdown && dotnet msbuild Case2 /t:restore && dotnet msbuild Case2^
 /t:build;publish^
 /p:Configuration=Release^
 /p:targetframework=net5.0^
 /p:RestoreIgnoreFailedSources=true^
 /p:ResolveAssemblyWarnOrErrorOnTargetArchitectureMismatch=None^
 /p:CreateHardLinksForCopyFilesToOutputDirectoryIfPossible=true^
 /p:CreateHardLinksForCopyAdditionalFilesIfPossible=true^
 /p:CreateHardLinksForCopyLocalIfPossible=true^
 /p:CreateHardLinksForPublishFilesIfPossible=true^
 /verbosity:Minimal^
 /m^
 /nodeReuse:false
```
```
git clean -fxd && dotnet build-server shutdown && dotnet msbuild Case2 /t:restore && dotnet msbuild Case2^
More?  /t:build;publish^
More?  /p:Configuration=Release^
More?  /p:targetframework=net5.0^
More?  /p:RestoreIgnoreFailedSources=true^
More?  /p:ResolveAssemblyWarnOrErrorOnTargetArchitectureMismatch=None^
More?  /p:CreateHardLinksForCopyFilesToOutputDirectoryIfPossible=true^
More?  /p:CreateHardLinksForCopyAdditionalFilesIfPossible=true^
More?  /p:CreateHardLinksForCopyLocalIfPossible=true^
More?  /p:CreateHardLinksForPublishFilesIfPossible=true^
More?  /verbosity:Minimal^
More?  /m^
More?  /nodeReuse:false
Removing Case1/Library.Tests/bin/
Removing Case1/Library.Tests/obj/
Removing Case1/Library/bin/
Removing Case1/Library/obj/
Shutting down MSBuild server...
Shutting down VB/C# compiler server...
VB/C# compiler server shut down successfully.
MSBuild server shut down successfully.
Microsoft (R) Build Engine version 16.10.2+857e5a733 for .NET
Copyright (C) Microsoft Corporation. All rights reserved.

  Determining projects to restore...
  Restored D:\workspace\sdk_9585\Case2\Library\Library.csproj (in 64 ms).
  Restored D:\workspace\sdk_9585\Case2\Library.Tests\Library.Tests.csproj (in 64 ms).
Microsoft (R) Build Engine version 16.10.2+857e5a733 for .NET
Copyright (C) Microsoft Corporation. All rights reserved.

  Library -> D:\workspace\sdk_9585\Case2\Library\bin\Release\net5.0\Library.dll
  Library.Tests -> D:\workspace\sdk_9585\Case2\Library.Tests\bin\Release\net5.0\Library.Tests.dll
  Library -> D:\workspace\sdk_9585\Case2\Library\bin\Release\net5.0\publish\
  Library.Tests -> D:\workspace\sdk_9585\Case2\Library.Tests\bin\Release\net5.0\publish\
```
