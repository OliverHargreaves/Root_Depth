### Root depth - Calculated using FAO 56 formula ###############################
# Ordinal dates: https://www.atmos.anl.gov/ANLMET/OrdinalDay.txt

library(writexl)

### Corn in Wellsville 2019 ###################################################
J_plant=158 # beginning of development period: June 7th
J_start=165 # beginning of Zr[i]>Zr_min: June 14th
J_max=250   # maximum root depth: September 7th
J_harv=280  # harvest date: october 7th
Zr_min=127  # minimum root depth (mm)
Zr_max=1220 # maximum root depth (mm)
J=J_start:J_max
Zr=Zr_min+(Zr_max-Zr_min)*(J-J_start)/(J_max-J_start) # root depth during growing season
Zr[(J_max-J_start):(J_harv-J_start+1)]=Zr_max # root depth after having reached max root depth

Dates=seq.Date(from=as.Date('2019-06-14'), to=as.Date('2019-10-07'), by='days')
CornRD=data.frame(Dates, Zr)
write_xlsx(CornRD, 'CornRD.2019.xlsx')

plot(Dates, -Zr, 
     type='h', col='goldenrod', lwd='3', ylim=c(-1500, 0),
     main='Corn root depth', ylab='Soil depth (mm)', xlab='2019')
abline(h=0, lwd=2)

### Oats in Wellsville 2019 ####################################################
J_plant=120 # beginning of development period: April 30th
J_start=127 # beginning of Zr[i]>Zr_min: May 7th
J_max=203   # maximum root depth: July 22nd
J_harv=203  # harvest date: July 22nd
Zr_min=127  # minimum root depth (mm)
Zr_max=910  # maximum root depth (mm)
J=J_start:J_max
Zr=Zr_min+(Zr_max-Zr_min)*(J-J_start)/(J_max-J_start) # root depth during growing season
Zr[(J_max-J_start):(J_harv-J_start+1)]=Zr_max # root depth after having reached max root depth

Dates=seq.Date(from=as.Date('2019-05-07'), to=as.Date('2019-07-22'), by='days')
OatsRD=data.frame(Dates, Zr)
write_xlsx(OatsRD, 'OatsRD.2019.xlsx')


# 1. Open jpeg file
tiff("C:/Users/graduate/Box/Divining Water/Wellsville 2019/image.tiff",
     width = 1000, height = 500)


# 2. Create the plot

plot(Dates, -Zr, 
     type='h', col='darkolivegreen', lwd='3', ylim=c(-1000, 0),
     main='Oats root depth', ylab='Soil depth (mm)', xlab='2019')
abline(h=0, lwd=2)


# 3. Close the file
dev.off()

