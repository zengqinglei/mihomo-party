!include "MUI2.nsh"

!macro customInstall
  nsExec::Exec 'taskkill /F /IM mihomo*.exe'
  Sleep 2000
!macroend

!macro customUnInstallSection
  Section /o "un.清除所有应用数据和配置文件"
    SetShellVarContext current
    RMDir /r "$APPDATA\mihomo-party"
    RMDir /r "$LOCALAPPDATA\mihomo-party-updater"
  SectionEnd
!macroend

!macro customUnInstall
  nsExec::Exec 'taskkill /F /IM mihomo*.exe'
  Sleep 2000

  IfFileExists "$INSTDIR\resources\sysproxy.exe" 0 +2
    nsExec::Exec '"$INSTDIR\resources\sysproxy.exe" set 1'
!macroend
