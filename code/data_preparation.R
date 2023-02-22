
# Read data
piperDataRaw <- readxl::read_xlsx('data/Piper-CATS-adults-2023-02-15_PRELIM.xlsx', sheet = 1)


library(dplyr)
library(ggplot2)

# Summary of sites and species numbers ----
spNoSummary <- piperDataRaw %>% group_by(proj_code, locality, pl_identification) %>%
  summarise(sp.no = n())

# Number of insect species on Piper aduncum per locality ----
ggplot(spNoSummary %>%
         filter(pl_identification == 'Piper aduncum'), 
       aes(x = locality,
           y= sp.no,
           fill = pl_identification))+
  geom_col()

# Number of insect species on piper species per project ----
ggplot(spNoSummary, 
       aes(x = proj_code,
           y= sp.no,
           fill = pl_identification))+
  geom_col()

# Piper species per  ----
ggplot(spNoSummary, 
       aes(x = proj_code,
           y= sp.no,
           fill = locality))+
  geom_col()


# Mogmagai, Koble Aklua, Kabel