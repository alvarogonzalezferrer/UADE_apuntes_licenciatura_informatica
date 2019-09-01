#sec:Main
'Calculo del VAN y TIR
'(c) 2005, Kronoman
'In loving memory of my father

?"Calculo del VAN y TIR"
?"Costo de capital %  ?"
?"rango porcentual 0..100%"
?"ej: 7 % = 7"
input k
k=k/100

?"Inversion inicial (ii=$)?"
input ii
?"Cantidad de periodos 1..n?"
input n
?"Los flujos de caja son todos iguales?"
?"S/N"
input f_igu
f_igu =lcase(f_igu)
if f_igu="s"
	? "Flujo de caja constante ?"
	input flujo
fi
?"Salvar salida a memo ? "
?"(no ponga nada para no salvar)"
input archivo

if archivo
open "memo:"+archivo for output as #1
fi

cls
?"Calculando VAN"

?" k = % "; k*100
? " ii = $ " ; ii
? " n = " ; n 
if f_igu = "s"
	?"Flujo caja $ " ; flujo
fi
' van pedido por el usuario
van = 0

' calculo 2 VANs para interpolar el TIR
van2 = 0
k2 = k *2

for nn = 1 to n
	? "Periodo " ; nn 
	if f_igu <> "s"
		? "Flujo del periodo? $ "
		input flujo
		? "> $" ; flujo
	fi
	v = flujo / ((1+k)^nn)
	if archivo
		? #1, "["; nn ; "] = $ " ; v
	fi
	van = van + v

	v2 = flujo / ((1+k2)^nn)
	van2=van2 + v2
next
van = van - ii
van2=van2-ii
' TIR interpolado
k1 = k * 100
k2 = k2 * 100
tir = k1 - (((k2-k1) / (van2-van))*van)

cls
?"Copyright (c) 2005, Kronoman"
? "In loving memory of my father"
?
? "-- Resultados -- "
?
?"VAN = "; round(van,2); " $"
?"TIR =  "; round(tir,2 );" %"
? " k = "; k*100; " %"
? " n = "; n; " periodos"
? " inv_inic = "; ii; " $"


if archivo 
? #1, "VAN = "; van
? #1, "TIR = "; tir
? #1, " k = " ; k
? #1, " n = " ; n
? #1 , " i_i  = $ "; ii
close #1
fi