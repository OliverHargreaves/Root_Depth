# Root depth - Calculated using FAO 56 formula
# Ordinal dates: https://www.atmos.anl.gov/ANLMET/OrdinalDay.txt

library(writexl)

# Onions in West Weber 2019 ####
J_plant=95 # beginning of development period: April 5th
L_ini=15
J_start=J_plant+L_ini # beginning of Zr[i]>Zr_min
L_dev=25
J_max=J_start+L_dev   # maximum root depth
J_harv=236  # harvest date: August 24th

Zr_min=9.5  # minimum root depth (mm) ~ planting depth
Zr_max=600  # maximum root depth (mm)

J=J_start:J_max

Zr=c()
Zr[0:(J_start-J_plant)]=Zr_min
Zr[(J_start-J_plant+1):(J_max-J_plant)]=Zr_min+(Zr_max-Zr_min)*(J-J_start)/(J_max-J_start) # root depth during growing season
Zr[(J_max-J_plant+1):(J_harv-J_plant+1)]=Zr_max # root depth after having reached max root depth

Dates=seq.Date(from=as.Date('2019-04-05'), to=as.Date('2019-08-24'), by='days')
OnionRD=data.frame(Dates, Zr)
write_xlsx(OnionRD, 'OnionRD.2019.xlsx')

plot(Dates, -Zr, 
     type='h', col='deeppink4', lwd='3', 
     ylim=c(-1200, 0),
     main='Onion root depth in West Weber in 2019', ylab='Soil depth (mm)', xlab='2019')
abline(h=0, lwd=2)
