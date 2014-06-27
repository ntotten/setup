# Make link to subl and add to path
cmd /c mklink "C:\Program Files\Sublime Text 3\subl.exe" "C:\Program Files\Sublime Text 3\sublime_text.exe"
$wsh = new-object -com wscript.shell
$path = $wsh.Environment("System").Item("Path")
$subl = ";C:\Program Files\Sublime Text 3\";
If ($path.Contains($subl)) {
    echo "Sublime Text already in PATH";
} Else {
    $path += ";C:\Program Files\Sublime Text 3\"
    $wsh.Environment("System").Item("Path") = $path

    echo "Added subl.exe to path";
}

# Save Sublime Settings
Copy-Item Preferences.sublime-settings "$Env:USERPROFILE\AppData\Roaming\Sublime Text 3\Packages\User"
Copy-Item XML.sublime-settings "$Env:USERPROFILE\AppData\Roaming\Sublime Text 3\Packages\User"
echo "Add Sublime Settings";