library(ggplot2)
library(dplyr)
library(readr)
library(lubridate)

dataset = readr::read_csv('data/occt_stress_test_2020_09_19_13_00_00.CSV')

dataset %>%
    select(Date, 
           Time, 
           CPU_TctlTdie_C, 
           GPU_Temperature_C, 
           Water_Temperature_C, 
           Ambient_Temperature_C = Temp1_C) %>%
    mutate(cpu_delta_t = CPU_TctlTdie_C - Ambient_Temperature_C,
           gpu_delta_t = GPU_Temperature_C - Ambient_Temperature_C,
           water_delta_t = Water_Temperature_C - Ambient_Temperature_C,
           dtm =
