---------------------------
*/Gagnatöflur/*

Greni
	-Id
	-Staðsetning
	-Lýsing
	
Æti
	-Id
	-Staðsetning
	-Dagsetning -> sett út

Veiðimaður
	-Kennitala
	-Nafn
	-Heimilisfang
	-Póstnúmer
	-Sími
	-Tölvupóstur
	-Vopn -> Sér gagnagrunnur
	-Veiðikortanúmer
	-Ráðin grenjaskytta -> True | False

Veiddur refur
	-Id
	-Staðsetning
	-Dagsetning
	-Tími
	-Litur -> Hvítur, Brúnn, Snoðdýr?
	-Kyn
	-Aldur
	-Veiðimaður
	-Vopn
	-Færi -> 0-30, 30-60, 60-100 o.s.f.v
	-Sjúkdómar -> Sér tafla, fleirri en einn mögulegur
	-Greni -> Ef við á
	-Æti -> Ef við á

Refur sem sást
	-Id
	-Staðsetning
	-Dagsetning
	-Tími

------------------------
*/Tengitöflur/*

Veiðimaður vitjar grenis
	-Id-greni
	-Id-veiðimaður
	-Dagsetning
	-Tími byrjar
	-Tími endar
	-Setið -> True | False

Veiðimaður vitjar ætis
	-Id-æti
	-Id-veiðimaður
	-Dagsetning
	-Tími byrjar
	-Tími endar

-------------------------
