import os, unicode, strutils, rdstdin, terminal

let q = readLineFromStdIn "> "
let d = getAppDir()
var b: seq[string];
echo "the working directory: " & $d  
for f in walkFiles($d & "/*.csv"):
    echo "scanning " & f
    let rows = readFile(f).split("\n");
    var read = 0;
    for r in rows:
        echo "\t- processing rows: " & $read & " of " & $rows.len  & "                    "
        read = read + 1
        if contains(toLower(r),q):
            var i = r.split(",")
            echo "========================================================================"
            for o in i:
                echo "\t- " & o
            echo "========================================================================"
            echo ""
            b.add r
        cursorUp(1);

if b.len > 0:
    writeFile("result.log",$b)
