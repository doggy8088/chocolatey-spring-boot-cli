# Chocolatey Package for Safari for Windows

The binary distribution is available from Apple at http://appldnld.apple.com/Safari5/041-5487.20120509.INU8B/SafariSetup.exe.

Steps to build:

1. Package (`choco pack`)
2. Test (`choco install safari -dv -s .` and `choco uninstall safari -dv`)
3. Publish (`choco push`)
