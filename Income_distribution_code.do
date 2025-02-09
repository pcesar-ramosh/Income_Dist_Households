/*----------------------------------------------------------------
Income distirbution Monzon and Ramos:

*/
clear all
cd "D:\Research\Encuentro EEB 2024\Encuentro economistas 2024 - Propuesta\datos\EH_DTA"

************
*** 2021 ***
************
use EH2022_Persona, clear

* Limpieza de datos
drop if yhogpc == 0 | missing(yhogpc)
pctile perc10_v = yhogpc[w=factor], nq(10)
pctile perc100_v = yhogpc[w=factor], nq(100)
xtile perc100 = yhogpc[w=factor], nq(100)
xtile perc10 = yhogpc[w=factor], nq(10)

gen log_yhogpc = log(yhogpc)
rename s01a_03 edad
*** We estimate the income distribution using the per capita income and percentile analysis
tabstat yhogpc, by(perc10) statistics(mean median min max count sum) save
tabstat yhogpc, by(perc100) statistics(mean median min max count sum) save

************
*** 2021 ***
************
use EH2021_Persona, clear
* limpieza de datos
drop if yhogpc == 0 | missing(yhogpc) | yhogpc < 10
pctile perc10_v = yhogpc[w=factor], nq(10)
pctile perc100_v = yhogpc[w=factor], nq(100)
xtile perc100 = yhogpc[w=factor], nq(100)
xtile perc10 = yhogpc[w=factor], nq(10)

gen log_yhogpc = log(yhogpc)
rename s01a_03 edad
*** We estimate the income distribution using the per capita income and percentile analysis
tabstat yhogpc, by(perc10) statistics(mean median min max count sum) save
tabstat yhogpc, by(perc100) statistics(mean median min max count sum) save


************
*** 2020 ***
************
use EH2020_Persona, clear
* limpieza de datos
drop if yhogpc == 0 | missing(yhogpc) | yhogpc < 10
pctile perc10_v = yhogpc[w=factor], nq(10)
pctile perc100_v = yhogpc[w=factor], nq(100)
xtile perc100 = yhogpc[w=factor], nq(100)
xtile perc10 = yhogpc[w=factor], nq(10)

gen log_yhogpc = log(yhogpc)
rename s01a_03 edad
*** We estimate the income distribution using the per capita income and percentile analysis
tabstat yhogpc, by(perc10) statistics(mean median min max count sum) save
tabstat yhogpc, by(perc100) statistics(mean median min max count sum) save

************
*** 2019 ***
************
use EH2019_Persona, clear
* limpieza de datos
drop if yhogpc == 0 | missing(yhogpc) | yhogpc < 10
pctile perc10_v = yhogpc[w=factor], nq(10)
pctile perc100_v = yhogpc[w=factor], nq(100)
xtile perc100 = yhogpc[w=factor], nq(100)
xtile perc10 = yhogpc[w=factor], nq(10)

*gen log_yhogpc = log(yhogpc)
*rename s01a_03 edad
*** We estimate the income distribution using the per capita income and percentile analysis
tabstat yhogpc, by(perc10) statistics(mean median min max count sum) save
tabstat yhogpc, by(perc100) statistics(mean median min max count sum) save

************
*** 2018 ***
************
use EH2018_Persona, clear
* limpieza de datos
drop if yhogpc == 0 | missing(yhogpc) | yhogpc < 10
pctile perc10_v = yhogpc[w=factor], nq(10)
pctile perc100_v = yhogpc[w=factor], nq(100)
xtile perc100 = yhogpc[w=factor], nq(100)
xtile perc10 = yhogpc[w=factor], nq(10)

*gen log_yhogpc = log(yhogpc)
*rename s01a_03 edad
*** We estimate the income distribution using the per capita income and percentile analysis
tabstat yhogpc, by(perc10) statistics(mean median min max count sum) save
tabstat yhogpc, by(perc100) statistics(mean median min max count sum) save

************
*** 2017 ***
************
use EH2017_Persona, clear
* limpieza de datos
drop if yhogpc == 0 | missing(yhogpc) | yhogpc < 10
pctile perc10_v = yhogpc[w=factor], nq(10)
pctile perc100_v = yhogpc[w=factor], nq(100)
xtile perc100 = yhogpc[w=factor], nq(100)
xtile perc10 = yhogpc[w=factor], nq(10)

*gen log_yhogpc = log(yhogpc)
*rename s01a_03 edad
*** We estimate the income distribution using the per capita income and percentile analysis
tabstat yhogpc, by(perc10) statistics(mean median min max count sum) save
tabstat yhogpc, by(perc100) statistics(mean median min max count sum) save


************
*** 2016 ***
************
use EH2016_Persona, clear
* limpieza de datos
drop if yhogpc == 0 | missing(yhogpc) | yhogpc < 10
pctile perc10_v = yhogpc[w=factor], nq(10)
pctile perc100_v = yhogpc[w=factor], nq(100)
xtile perc100 = yhogpc[w=factor], nq(100)
xtile perc10 = yhogpc[w=factor], nq(10)

*gen log_yhogpc = log(yhogpc)
*rename s01a_03 edad
*** We estimate the income distribution using the per capita income and percentile analysis
tabstat yhogpc, by(perc10) statistics(mean median min max count sum) save
tabstat yhogpc, by(perc100) statistics(mean median min max count sum) save

************
*** 2015 ***
************
use EH2015_Persona, clear
* limpieza de datos
drop if yhogpc == 0 | missing(yhogpc) | yhogpc < 10
pctile perc10_v = yhogpc[w=factor], nq(10)
pctile perc100_v = yhogpc[w=factor], nq(100)
xtile perc100 = yhogpc[w=factor], nq(100)
xtile perc10 = yhogpc[w=factor], nq(10)

*gen log_yhogpc = log(yhogpc)
*rename s01a_03 edad
*** We estimate the income distribution using the per capita income and percentile analysis
tabstat yhogpc, by(perc10) statistics(mean median min max count sum) save
tabstat yhogpc, by(perc100) statistics(mean median min max count sum) save

************
*** 2014 ***
************
use EH2014_Persona, clear
* limpieza de datos
drop if yhogpc == 0 | missing(yhogpc) | yhogpc < 10
pctile perc10_v = yhogpc[w=factor], nq(10)
pctile perc100_v = yhogpc[w=factor], nq(100)
xtile perc100 = yhogpc[w=factor], nq(100)
xtile perc10 = yhogpc[w=factor], nq(10)

*gen log_yhogpc = log(yhogpc)
*rename s01a_03 edad
*** We estimate the income distribution using the per capita income and percentile analysis
tabstat yhogpc, by(perc10) statistics(mean median min max count sum) save
tabstat yhogpc, by(perc100) statistics(mean median min max count sum) save

************
*** 2013 ***
************
use EH2013_Persona, clear
* limpieza de datos
drop if yhogpc == 0 | missing(yhogpc) | yhogpc < 10
pctile perc10_v = yhogpc[w=factor], nq(10)
pctile perc100_v = yhogpc[w=factor], nq(100)
xtile perc100 = yhogpc[w=factor], nq(100)
xtile perc10 = yhogpc[w=factor], nq(10)

*gen log_yhogpc = log(yhogpc)
*rename s01a_03 edad
*** We estimate the income distribution using the per capita income and percentile analysis
tabstat yhogpc, by(perc10) statistics(mean median min max count sum) save
tabstat yhogpc, by(perc100) statistics(mean median min max count sum) save

************
*** 2012 ***
************
use EH2012_Persona, clear
* limpieza de datos
drop if yhogpc == 0 | missing(yhogpc) | yhogpc < 10
pctile perc10_v = yhogpc[w=factor], nq(10)
pctile perc100_v = yhogpc[w=factor], nq(100)
xtile perc100 = yhogpc[w=factor], nq(100)
xtile perc10 = yhogpc[w=factor], nq(10)

*gen log_yhogpc = log(yhogpc)
*rename s01a_03 edad
*** We estimate the income distribution using the per capita income and percentile analysis
tabstat yhogpc, by(perc10) statistics(mean median min max count sum) save
tabstat yhogpc, by(perc100) statistics(mean median min max count sum) save

************
*** 2011 ***
************
use EH2011_Persona, clear
* limpieza de datos
drop if yhogpc == 0 | missing(yhogpc) | yhogpc < 10
pctile perc10_v = yhogpc[w=factor], nq(10)
pctile perc100_v = yhogpc[w=factor], nq(100)
xtile perc100 = yhogpc[w=factor], nq(100)
xtile perc10 = yhogpc[w=factor], nq(10)

*gen log_yhogpc = log(yhogpc)
*rename s01a_03 edad
*** We estimate the income distribution using the per capita income and percentile analysis
tabstat yhogpc, by(perc10) statistics(mean median min max count sum) save
tabstat yhogpc, by(perc100) statistics(mean median min max count sum) save

************
*** 2010 ***
************

* No existe

************
*** 2009 ***
************
use EH2009_Persona, clear
* limpieza de datos
drop if yhogpc == 0 | missing(yhogpc) | yhogpc < 10
pctile perc10_v = yhogpc[w=factor], nq(10)
pctile perc100_v = yhogpc[w=factor], nq(100)
xtile perc100 = yhogpc[w=factor], nq(100)
xtile perc10 = yhogpc[w=factor], nq(10)

*gen log_yhogpc = log(yhogpc)
*rename s01a_03 edad
*** We estimate the income distribution using the per capita income and percentile analysis
tabstat yhogpc, by(perc10) statistics(mean median min max count sum) save
tabstat yhogpc, by(perc100) statistics(mean median min max count sum) save

************
*** 2008 ***
************
use EH2008_Persona, clear
* limpieza de datos
drop if yhogpc == 0 | missing(yhogpc) | yhogpc < 10
pctile perc10_v = yhogpc[w=factor], nq(10)
pctile perc100_v = yhogpc[w=factor], nq(100)
xtile perc100 = yhogpc[w=factor], nq(100)
xtile perc10 = yhogpc[w=factor], nq(10)

*gen log_yhogpc = log(yhogpc)
*rename s01a_03 edad
*** We estimate the income distribution using the per capita income and percentile analysis
tabstat yhogpc, by(perc10) statistics(mean median min max count sum) save
tabstat yhogpc, by(perc100) statistics(mean median min max count sum) save

************
*** 2007 ***
************
use EH2007_Persona, clear
* limpieza de datos
drop if yhogpc == 0 | missing(yhogpc) | yhogpc < 10
pctile perc10_v = yhogpc[w=factor], nq(10)
pctile perc100_v = yhogpc[w=factor], nq(100)
xtile perc100 = yhogpc[w=factor], nq(100)
xtile perc10 = yhogpc[w=factor], nq(10)

*gen log_yhogpc = log(yhogpc)
*rename s01a_03 edad
*** We estimate the income distribution using the per capita income and percentile analysis
tabstat yhogpc, by(perc10) statistics(mean median min max count sum) save
tabstat yhogpc, by(perc100) statistics(mean median min max count sum) save

************
*** 2006 ***
************
use EH2006_Persona, clear
* limpieza de datos
drop if yhogpc == 0 | missing(yhogpc) | yhogpc < 10
pctile perc10_v = yhogpc[w=factor], nq(10)
pctile perc100_v = yhogpc[w=factor], nq(100)
xtile perc100 = yhogpc[w=factor], nq(100)
xtile perc10 = yhogpc[w=factor], nq(10)

*gen log_yhogpc = log(yhogpc)
*rename s01a_03 edad
*** We estimate the income distribution using the per capita income and percentile analysis
tabstat yhogpc, by(perc10) statistics(mean median min max count sum) save
tabstat yhogpc, by(perc100) statistics(mean median min max count sum) save

************
*** 2005 ***
************
use EH2005_Persona, clear
* limpieza de datos
rename y_percapb  yhogpc
drop if yhogpc == 0 | missing(yhogpc) | yhogpc < 10
pctile perc10_v = yhogpc[w=factor], nq(10)
pctile perc100_v = yhogpc[w=factor], nq(100)
xtile perc100 = yhogpc[w=factor], nq(100)
xtile perc10 = yhogpc[w=factor], nq(10)

*gen log_yhogpc = log(yhogpc)
*rename s01a_03 edad
*** We estimate the income distribution using the per capita income and percentile analysis
tabstat yhogpc, by(perc10) statistics(mean median min max count sum) save
tabstat yhogpc, by(perc100) statistics(mean median min max count sum) save
