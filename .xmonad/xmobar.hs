Config { font = "-*-Fixed-Bold-R-Normal-*-13-*-*-*-*-*-*-*"
        , borderColor = "black"
        , border = TopB
        , bgColor = "black"
        , fgColor = "grey"
        , position = TopW L 100
        , commands = [  Run Network "wlp1s0" ["-L","0","-H","32","--normal","green","--high","red"] 10
                        , Run Cpu ["-L","3","-H","50","--normal","green","--high","red"] 10
                        , Run Memory ["-t","Mem: <usedratio>%"] 10
                        , Run Swap [] 10
                        , Run Com "uname" ["-s","-r"] "" 36000
                        , Run Date "%a %b %_d %Y %H:%M:%S" "date" 10
                        , Run Com "show-volume.py" [] "vol" 1
                        , Run BatteryP ["BAT0"] [ "-t", "Bat: <left>%", "-L", "50", "-H", "75", "-l", "red", 
                                                  "-n", "yellow", "-h", "green"] 10
                        , Run StdinReader
                        ]
        , sepChar = "%"
        , alignSep = "}{"
        , template = "%StdinReader% | %cpu% | %memory% * %swap% | %wlp1s0% | %battery% }{ %vol% | %uname% | <fc=#ee9a00>%date%</fc>"
        }
