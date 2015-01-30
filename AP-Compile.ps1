<#
|==============================================================================>|
   AP-Compiler by APoorv Verma [AP] on 4/21/2014
|==============================================================================>|
      $) Compiles AP-Programs Independent of the AP-Modules file
      $) Reads And Calculates all the Modules needed!
      $) Adds code with comment in a neat BASE64 Code
      $) Has a blacklisting system
|==============================================================================>|
#>
param([Parameter(Mandatory=$True)][String]$File,[String]$OutputFolder = '.',[Switch]$PassThru)
# =======================================START=OF=COMPILER==========================================================|
#    The Following Code was added by AP-Compiler Version [1.0] To Make this program independent of AP-Core Engine
# ==================================================================================================================|
iex ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String("ZnVuY3Rpb24gSU4tQ29kZS1EZWJ1Zy1Db25zb2xlIHtXcml0ZS1Ib3N0IC1mIHllbGxvdyAnW0FQLUNPTVBJTEVSXSBNb2R1bGUgW0lOLUNvZGUtRGVidWctQ29uc29sZV0gZGlzYWJsZWQgZm9yIHRoaXMgcHJvZ3JhbSd9CgpmdW5jdGlvbiBQcmludC1MaXN0IHtwYXJhbSgkeCwgW1N3aXRjaF0kSW5SZWN1cnNlKQ0KDQogICAgaWYgKCR4LmNvdW50IC1sZSAxKSB7cmV0dXJuID86KCRJblJlY3Vyc2UpeyR4fXsiWyR4XSJ9fSBlbHNlIHsNCiAgICAgICAgcmV0dXJuICJbJCgoJHggfCAlIHtQcmludC1MaXN0ICRfIC1JblJlY3Vyc2V9KSAtam9pbiAnLCAnKV0iDQogICAgfQ0KfQoKZnVuY3Rpb24gV3JpdGUtQVAge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bU3RyaW5nXSRUZXh0LCBbU3dpdGNoXSROb1NpZ24pDQoNCiAgICBpZiAoISR0ZXh0IC1vciAkdGV4dCAtbWF0Y2ggIl5bXCtcLVwhXCp4XD4gXSskIikge3JldHVybn0NCiAgICAkYWNjICA9IEAoKCcrJywnMicpLCgnLScsJzEyJyksKCchJywnMTQnKSwoJyonLCczJykpDQogICAgJHRiICAgPSAnJzskZnVuYyAgID0gJGZhbHNlDQogICAgd2hpbGUgKCRUZXh0LmNoYXJzKDApIC1lcSAneCcpIHskZnVuYyA9ICR0cnVlOyAkVGV4dCA9ICRUZXh0LnN1YnN0cmluZygxKS50cmltKCl9DQogICAgd2hpbGUgKCRUZXh0LmNoYXJzKDApIC1lcSAnPicpIHskdGIgKz0gIiAgICAiOyAkVGV4dCA9ICRUZXh0LnN1YnN0cmluZygxKS50cmltKCl9DQogICAgJFNpZ24gPSAkVGV4dC5jaGFycygwKQ0KICAgICRUZXh0ID0gJFRleHQuc3Vic3RyaW5nKDEpLnRyaW0oKS5yZXBsYWNlKCcveFwnLCcnKS5yZXBsYWNlKCdbLl0nLCdbQ3VycmVudCBEaXJlY3RvcnldJykNCiAgICAkdmVycyA9ICRmYWxzZQ0KICAgIGZvcmVhY2ggKCRhciBpbiAkYWNjKSB7aWYgKCRhclswXSAtZXEgJHNpZ24pIHskdmVycyA9ICR0cnVlOyAkY2xyID0gJGFyWzFdOyAkU2lnbiA9ICJbJHtTaWdufV0gIn19DQogICAgaWYgKCEkdmVycykge1Rocm93ICJJbmNvcnJlY3QgU2lnbiBbJFNpZ25dIFBhc3NlZCEifQ0KICAgIFdyaXRlLUhvc3QgLU5vTmV3TGluZTokZnVuYyAtZiAkY2xyICR0YiQoaWYgKCEkTm9TaWduKSB7JFNpZ259KSRUZXh0DQp9CgpmdW5jdGlvbiBGbGF0dGVuIHtwYXJhbShbb2JqZWN0W11dJHgpDQppZiAoJFguY291bnQgLWVxIDEpIHtyZXR1cm4gJHggfCAlIHskX319IGVsc2UgeyR4IHwgJSB7RmxhdHRlbiAkX319fQoKZnVuY3Rpb24gQ29udmVydC1Ub0Jhc2U2NCB7cGFyYW0oW1N0cmluZ10kVGV4dCwgW1ZhbGlkYXRlU2V0KCJVVEY4IiwiVW5pY29kZSIpXVtTdHJpbmddJEVuY29kaW5nID0gIlVURjgiKQ0KDQogICAgW1N5c3RlbS5Db252ZXJ0XTo6VG9CYXNlNjRTdHJpbmcoW1N5c3RlbS5UZXh0LkVuY29kaW5nXTo6JEVuY29kaW5nLkdldEJ5dGVzKCRUZXh0KSkNCn0K")))
# ========================================END=OF=COMPILER===========================================================|
$Ver = '1.0'
if (!$File -or !(Test-Path -type Leaf $File)) {Throw "Invalid File";exit}
if (!(Test-Path -type Container $OutputFolder)) {Throw "Invalid Folder";exit}
$File = "{0}" -f (Resolve-Path $File)
$OutputFolder = "{0}" -f (Resolve-Path $OutputFolder)
$Modules = $Dep | % {$_[0]};$TmpHash = @{};$Modules | % {$TmpHash.$_ = $_}
$Aliases = Get-Alias | ? {$TmpHash.($_.Definition)} | % {"$_"}
$Data = [IO.File]::ReadAllLines($File)
$Script:OtroFunc = @{}
$Script:Need2Import = @{}
$Script:Need2ImportAL = @{}
$Script:BlackListFunctions = @{"IN-Code-Debug-Console"=1}
#$BEG = "((^|[\(;\=])( ?)+)";$END = "( ?)+((\S+ )+(\S+))?([;\)\(""]|$)"  | "$BEG$([Regex]::Escape($_))$END"
foreach ($Ln in $Data) {
    if ($LN -match "^ +function.+\b(?<Name>\w+)\b( ?)+{") {$OtroFunc += @{$Matches.Name = "Added"};continue}
    $Modules | ? {$LN -match "\b$([Regex]::Escape($_))\b"} | % {$Need2Import.$_++}
    $Aliases | ? {$LN -match "\b$([Regex]::Escape($_))\b"} | % {$Need2ImportAL.$_++;$Need2Import.((Get-Alias $_).Definition)++}
}
$FinalSet = @($Need2Import.Keys) | ? {!$OtroFunc.$_}
$FinalAlSet = @($Need2ImportAL.Keys)
$Code = $FinalSet | % {"function $_ {1}{0}{2}" -f $(if ($BlackListFunctions.$_) {"Write-Host -f yellow '[AP-COMPILER] Module [$_] disabled for this program'"} else {iex "`${Function:$_}"}),"{","}`n"}
$Code += $FinalAlSet | % {"Set-Alias $_ {0}" -f ((Get-Alias $_).Definition)}
if ($Code) {
if ($FinalSet) {Write-AP "*Adding Functions $(Print-List $FinalSet)"}
if ($FinalALSet) {Write-AP "*Adding Aliases   $(Print-List $FinalALSet)"}
$Injecter = @"
# =======================================START=OF=COMPILER==========================================================|
#    The Following Code was added by AP-Compiler Version [$Ver] To Make this program independent of AP-Core Engine
# ==================================================================================================================|
iex ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String("$(Convert-ToBase64 ($Code -join "`n"))")))
# ========================================END=OF=COMPILER===========================================================|
"@}
$Data = $Data -join "`n"
if ($Data -match "(?<ParamCode>Param( ?)+\(.*$Symb\)$Symb)") {
    $Data=$Data.replace($Matches['ParamCode'],"$($Matches['ParamCode'])`n$Injecter")
} elseif ($Data -match "(?<ParamCode>Param( ?)+\(.*\))") {
#    @($Data -match "(?<ParamCode>Param\(.*\))")[0] -match "(?<ParamCode>Param\(.*\))" | Out-Null;$Data=$Data.replace($Matches['ParamCode'],"$($Matches['ParamCode'])`n$Injecter")
    $Data=$Data.replace($Matches['ParamCode'],"$($Matches['ParamCode'])`n$Injecter")
} else {
    $Data = "$Injecter",$Data
}
$APStructure = (Flatten $Data) -join "`n"
if ((Split-Path $File) -eq $OutputFolder) {
    $Outfile = "$((Split-Path -leaf $File).replace('.ps1','-Compiled.ps1'))"
} else {$Outfile = "$(Split-Path -leaf $File)"}
Write-AP "+Compiled [$OutFile]"
$APStructure | Out-File -Encoding Unicode "$OutputFolder\$OutFile"
if ($PassThru) {return $code}
