Config { font = "-*-Fixed-Bold-R-Normal-*-13-*-*-*-*-*-*-*"
        , borderColor = "black"
        , border = TopB
        , bgColor = "black"
        , fgColor = "grey"
        , overrideRedirect = False    -- set the Override Redirect flag (Xlib)
        , lowerOnStart = False
        , hideOnStart = False
        , persistent = True
        , position = TopW L 100
        , commands = [  Run Network "eno1" ["-L","0","-H","32","--normal","green","--high","red"] 10
                        , Run Cpu ["-L","3","-H","50","--normal","green","--high","red"] 10
                        , Run Memory ["-t","Mem: <usedratio>%"] 10
                        , Run Swap [] 10
                        , Run Com "uname" ["-s","-r"] "" 36000
                        , Run Date "%a %b %_d %Y %H:%M:%S" "date" 10
                        , Run Com "/home/kilian/.xmonad/bin/show-volume.py" [] "vol" 1
                        , Run StdinReader
                        ]
        , sepChar = "%"
        , alignSep = "}{"
        , template = "%StdinReader% | %cpu% | %memory% * %swap% | %eno1% }{ %vol% | %uname% | <fc=#ee9a00>%date%</fc>"
        }
