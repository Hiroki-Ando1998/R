library(RColorBrewer)

# "PuBu"パレットを表示する
display.brewer.all(type = "seq")
# "PuBu"パレットの色を取得する
colors <- brewer.pal(9, "PiYG")  # 9は取得する色の数を指定します
print(colors)


scale_fill_brewer(palette = "YlOrRd")


"YlOrRd"
"#FFFFCC" "#FFEDA0" "#FED976" "#FEB24C" "#FD8D3C" "#FC4E2A" "#E31A1C" "#BD0026" "#800026"
"YlOrBr"
"#FFFFE5" "#FFF7BC" "#FEE391" "#FEC44F" "#FE9929" "#EC7014" "#CC4C02" "#993404" "#662506"
"YlGnBu"
"#FFFFD9" "#EDF8B1" "#C7E9B4" "#7FCDBB" "#41B6C4" "#1D91C0" "#225EA8" "#253494" "#081D58"
"YlGn"
"#FFFFE5" "#F7FCB9" "#D9F0A3" "#ADDD8E" "#78C679" "#41AB5D" "#238443" "#006837" "#004529"
"Reds"
"#FFF5F0" "#FEE0D2" "#FCBBA1" "#FC9272" "#FB6A4A" "#EF3B2C" "#CB181D" "#A50F15" "#67000D"
"RdPu"
"#FFF7F3" "#FDE0DD" "#FCC5C0" "#FA9FB5" "#F768A1" "#DD3497" "#AE017E" "#7A0177" "#49006A"
"Purples"
"#FCFBFD" "#EFEDF5" "#DADAEB" "#BCBDDC" "#9E9AC8" "#807DBA" "#6A51A3" "#54278F" "#3F007D"
"PuRd" 
"#F7F4F9" "#E7E1EF" "#D4B9DA" "#C994C7" "#DF65B0" "#E7298A" "#CE1256" "#980043" "#67001F"
"PuBuGn"
"#FFF7FB" "#ECE2F0" "#D0D1E6" "#A6BDDB" "#67A9CF" "#3690C0" "#02818A" "#016C59" "#014636"
"PuBu"
"#FFF7FB" "#ECE7F2" "#D0D1E6" "#A6BDDB" "#74A9CF" "#3690C0" "#0570B0" "#045A8D" "#023858"
#OrRd
"#FFF7EC" "#FEE8C8" "#FDD49E" "#FDBB84" "#FC8D59" "#EF6548" "#D7301F" "#B30000" "#7F0000"
"Oranges"
"#FFF5EB" "#FEE6CE" "#FDD0A2" "#FDAE6B" "#FD8D3C" "#F16913" "#D94801" "#A63603" "#7F2704"
"Greys"
"#FFFFFF" "#F0F0F0" "#D9D9D9" "#BDBDBD" "#969696" "#737373" "#525252" "#252525" "#000000"
"Greens"
"#F7FCF5" "#E5F5E0" "#C7E9C0" "#A1D99B" "#74C476" "#41AB5D" "#238B45" "#006D2C" "#00441B"
"GnBu"
"#F7FCF0" "#E0F3DB" "#CCEBC5" "#A8DDB5" "#7BCCC4" "#4EB3D3" "#2B8CBE" "#0868AC" "#084081"
"BuPu"
"#F7FCFD" "#E0ECF4" "#BFD3E6" "#9EBCDA" "#8C96C6" "#8C6BB1" "#88419D" "#810F7C" "#4D004B"
"BuGn"
"#F7FCFD" "#E5F5F9" "#CCECE6" "#99D8C9" "#66C2A4" "#41AE76" "#238B45" "#006D2C" "#00441B"
#Blues
"#F7FBFF" "#DEEBF7" "#C6DBEF" "#9ECAE1" "#6BAED6" "#4292C6" "#2171B5" "#08519C" "#08306B"


#"Spectral"
"#D53E4F" "#F46D43" "#FDAE61" "#FEE08B" "#FFFFBF" "#E6F598" "#ABDDA4" "#66C2A5" "#3288BD"
"RdYlGn"
"#D73027" "#F46D43" "#FDAE61" "#FEE08B" "#FFFFBF" "#D9EF8B" "#A6D96A" "#66BD63" "#1A9850"
"RdYlBu"
"#D73027" "#F46D43" "#FDAE61" "#FEE090" "#FFFFBF" "#E0F3F8" "#ABD9E9" "#74ADD1" "#4575B4"
"RdGy"
"#B2182B" "#D6604D" "#F4A582" "#FDDBC7" "#FFFFFF" "#E0E0E0" "#BABABA" "#878787" "#4D4D4D"
"RdBu"
"#B2182B" "#D6604D" "#F4A582" "#FDDBC7" "#F7F7F7" "#D1E5F0" "#92C5DE" "#4393C3" "#2166AC"
"PuOr"
"#B35806" "#E08214" "#FDB863" "#FEE0B6" "#F7F7F7" "#D8DAEB" "#B2ABD2" "#8073AC" "#542788"
"PRGn"
"#762A83" "#9970AB" "#C2A5CF" "#E7D4E8" "#F7F7F7" "#D9F0D3" "#A6DBA0" "#5AAE61" "#1B7837"
"PiYG"
"#C51B7D" "#DE77AE" "#F1B6DA" "#FDE0EF" "#F7F7F7" "#E6F5D0" "#B8E186" "#7FBC41" "#4D9221"
#BrBG
"#8C510A" "#BF812D" "#DFC27D" "#F6E8C3" "#F5F5F5" "#C7EAE5" "#80CDC1" "#35978F" "#01665E"



