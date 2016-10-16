# AP-Compiler
> A compiler for AP-Management Console Scripts

## Usage
>
```PowerShell
.\AP-Compile.ps1 <Script_Name> [-OutputFolder <Folder>] [-DBg] [-PassTru]
```
- Compile any script
- If it's the same directory as source the file will be named <original_name>-Compiled.ps1
- Check in new console if script performs as required

## Output
> Source will be parsed out with a `Invoke-Expression` line up top, this line contains a BASE64 version of all the function/alias dependendencies for the input file

## Features
>
- Compiles AP-Programs Independent of the AP-Modules file
- Reads And Calculates all the Modules needed!
- Adds code with comment in a neat BASE64 Code
- Has a blacklisting system
- Code layout detection
- Inject Point Detection
