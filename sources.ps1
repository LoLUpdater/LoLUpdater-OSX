import-module bitstransfer
Start-BitsTransfer http://developer.download.nvidia.com/cg/Cg_3.1/Cg-3.1_April2012_Setup.exe
Start-BitsTransfer http://download.microsoft.com/download/1/7/1/1718CCC4-6315-4D8E-9543-8E28A4E18C4C/dxwebsetup.exe
Start-BitsTransfer http://airdownload.adobe.com/air/win/download/4.0/AdobeAIRInstaller.exe
Start-BitsTransfer https://www.bugsplatsoftware.com/files/BugSplatNative.zip
Start-BitsTransfer https://www.threadingbuildingblocks.org/sites/default/files/software_releases/windows/tbb42_20140122oss_win.zip
start-process Cg-3.1_April2012_Setup.exe /silent -Wait
start-process dxwebsetup.exe /q -Wait
start-process AdobeAIRInstaller.exe -Wait
Start-Process 7z.exe -ArgumentList "x BugSplatNative.zip -y" -Wait -Nonewwindow
Start-Process 7z.exe -ArgumentList "x tbb42_20140122oss_win.zip -y" -Wait -Nonewwindow
Copy-Item "BugSplat\bin\BsSndRpt.exe"
Copy-Item "BugSplat\bin\BugSplat.dll"
Copy-Item "tbb42_20140122oss\bin\ia32\vc12\tbb.dll"


 if($env:PROCESSOR_ARCHITECTURE -eq "AMD64")
    {
Copy-Item "${Env:ProgramFiles(x86)}\Common Files\Adobe AIR\Versions\1.0\Adobe AIR.dll"
Copy-Item "${Env:ProgramFiles(x86)}\Common Files\Adobe AIR\Versions\1.0\Resources\NPSWF32.dll"
Copy-Item "${Env:ProgramFiles(x86)}\NVIDIA Corporation\Cg\bin\cg.dll"
Copy-Item "${Env:ProgramFiles(x86)}\NVIDIA Corporation\Cg\bin\cgD3D9.dll"
Copy-Item "${Env:ProgramFiles(x86)}\NVIDIA Corporation\Cg\bin\cggl.dll"
        
    }
    else
    {
Copy-Item "$env:programfiles\Common Files\Adobe AIR\Versions\1.0\Adobe AIR.dll"
Copy-Item "$env:programfiles\Common Files\Adobe AIR\Versions\1.0\Resources\NPSWF32.dll"
Copy-Item "$env:programfiles\NVIDIA Corporation\Cg\bin\cg.dll"
Copy-Item "$env:programfiles\NVIDIA Corporation\Cg\bin\cgD3D9.dll"
Copy-Item "$env:programfiles\NVIDIA Corporation\Cg\bin\cggl.dll"
    }

stop-process -processname LoLLauncher > $null
stop-process -processname LoLClient > $null



