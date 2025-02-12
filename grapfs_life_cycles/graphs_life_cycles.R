# Importar datos y cargar librerias ####
rm(list = ls())
library(tidyverse)
library(ggpubr)

#setwd("C:/Users/camon/OneDrive/Desktop/Documentos Andres/Encuentro BCB 2024/Prueba2Bolivia")
setwd("C:/Users/CESAR/Desktop/Encuentro economistas 2024 - Propuesta/grapfs_life_cycles")


# Ciclo de Vida ####

lifecycletype_baseline <- read.table("lifecycletype_baseline.txt", quote="\"", comment.char="")
colnames(lifecycletype_baseline) <- c("jr","abartype1_base","abartype2_base","astartbartype1_base","astartbartype2_base",
                                      "lbartype1_base","lbartype2_base","labartype1_base","labartype2_base",
                                      "cbartype1_base","cbartype2_base")
lifecycletype_sim1 <- read.table("lifecycletype_sim1.txt", quote="\"", comment.char="")
colnames(lifecycletype_sim1) <- c("jr","abartype1_sim1","abartype2_sim1","astartbartype1_sim1","astartbartype2_sim1",
                                  "lbartype1_sim1","lbartype2_sim1","labartype1_sim1","labartype2_sim1",
                                  "cbartype1_sim1","cbartype2_sim1")

lifecycletype_sim2 <- read.table("lifecycletype_sim2.txt", quote="\"", comment.char="")
colnames(lifecycletype_sim2) <- c("jr","abartype1_sim2","abartype2_sim2","astartbartype1_sim2","astartbartype2_sim2",
                                  "lbartype1_sim2","lbartype2_sim2","labartype1_sim2","labartype2_sim2",
                                  "cbartype1_sim2","cbartype2_sim2")

lifecycletype_sim1c <- read.table("lifecycletype_sim1c.txt", quote="\"", comment.char="")
colnames(lifecycletype_sim1c) <- c("jr","abartype1_sim1c","abartype2_sim1c","astartbartype1_sim1c","astartbartype2_sim1c",
                                   "lbartype1_sim1c","lbartype2_sim1c","labartype1_sim1c","labartype2_sim1c",
                                   "cbartype1_sim1c","cbartype2_sim1c")

lifecycletype_sim2c <- read.table("lifecycletype_sim2c.txt", quote="\"", comment.char="")
colnames(lifecycletype_sim2c) <- c("jr","abartype1_sim2c","abartype2_sim2c","astartbartype1_sim2c","astartbartype2_sim2c",
                                   "lbartype1_sim2c","lbartype2_sim2c","labartype1_sim2c","labartype2_sim2c",
                                   "cbartype1_sim2c","cbartype2_sim2c")

conbine_lc <- cbind(lifecycletype_baseline, lifecycletype_sim1[,2:11], lifecycletype_sim2[,2:11])
conbine_lc$jr <- 20:75

f1t <- conbine_lc %>%
  pivot_longer(cols = -c(jr), names_to = "var", values_to = "values") %>%
  filter(str_starts(var, "abartype")) %>%
  mutate(group = ifelse(var %in% c("abartype1_sim1", "abartype2_sim1"), "Baja impuesto",
                        ifelse(var %in% c("abartype1_sim2", "abartype2_sim2"), "Suba impuesto", "Base"))) %>%
  ggplot(aes(x = jr, y = values, color = group, linetype = group, group = var)) +
  geom_line(size = 1) +
  scale_color_manual(values = c("Baja impuesto" = "#064789", "Base" = "cornflowerblue", "Suba impuesto" = "#427aa1"),
                     labels = c(expression("Decrease " * tau[l]), "Base", expression("Increase " * tau[l]))) +
  scale_linetype_manual(values = c("Baja impuesto" = "dotted", "Base" = "solid", "Suba impuesto" = "dashed"),
                        labels = c(expression("Decrease " * tau[l]), "Base", expression("Increase " * tau[l]))) +
  labs(title = "Assets", x = "", y = "Assets", color = "", linetype = "") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),
        legend.position = c(0.15, 0.85),
        legend.title = element_blank(),
        legend.background = element_rect(fill = "white",
                                         linetype = "solid", 
                                         colour = "black")) +
  annotate("segment", x = 58, y = 0.6, xend = 63, yend = 1.1,
           arrow = arrow(type = "closed", length = unit(0.02, "npc"))) +
  annotate("text", x=55, y=0.5, label= "low productivity") +
  annotate("segment", x = 55, y = 2.5, xend = 60, yend = 3.1,
           arrow = arrow(type = "closed", length = unit(0.02, "npc"))) +
  annotate("text", x=55, y=2.3, label= "high productivity")

f2t <- conbine_lc %>% 
  pivot_longer(cols = -c(jr), names_to = "var", values_to = "values") %>%
  filter(str_starts(var, "labartype")) %>%
  mutate(group = ifelse(var %in% c("labartype1_sim1", "labartype2_sim1"), "Baja impuesto",
                        ifelse(var %in% c("labartype1_sim2", "labartype2_sim2"), "Suba impuesto", "Base"))) %>%
  ggplot(aes(x = jr, y = values, color = group, linetype = group, group = var)) +
  geom_line(size = 1) +
  scale_color_manual(values = c("Baja impuesto" = "#064789", "Base" = "cornflowerblue", "Suba impuesto" = "#427aa1"),
                     labels = c(expression("Decrease " * tau[l]), "Base", expression("Increase " * tau[l]))) +
  scale_linetype_manual(values = c("Baja impuesto" = "dotted", "Base" = "solid", "Suba impuesto" = "dashed"),
                        labels = c(expression("Decrease " * tau[l]), "Base", expression("Increase " * tau[l]))) +
  labs(title = "Labor supply", x = "", y = "Hours worked", color = "", linetype = "") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),
        legend.position = c(0.85, 0.85),
        legend.title = element_blank(),
        legend.background = element_rect(fill = "white",
                                         linetype = "solid", 
                                         colour = "black")) +
  annotate("segment", x = 33, y = 0.27, xend = 35, yend = 0.31,
           arrow = arrow(type = "closed", length = unit(0.02, "npc"))) +
  annotate("text", x=35, y=0.26, label= "low productivity") +
  annotate("segment", x = 53, y = 0.40, xend = 48, yend = 0.36,
           arrow = arrow(type = "closed", length = unit(0.02, "npc"))) +
  annotate("text", x=53, y=0.41, label= "high productivity") 

f3t <- conbine_lc %>% 
  pivot_longer(cols = -c(jr), names_to = "var", values_to = "values") %>%
  filter(str_starts(var, "cbartype")) %>%
  mutate(group = ifelse(var %in% c("cbartype1_sim1", "cbartype2_sim1"), "Baja impuesto",
                        ifelse(var %in% c("cbartype1_sim2", "cbartype2_sim2"), "Suba impuesto", "Base"))) %>%
  ggplot(aes(x = jr, y = values, color = group, linetype = group, group = var)) +
  geom_line(size = 1) +
  scale_color_manual(values = c("Baja impuesto" = "#064789", "Base" = "cornflowerblue", "Suba impuesto" = "#427aa1"),
                     labels = c(expression("Decrease " * tau[l]), "Base", expression("Increase " * tau[l]))) +
  scale_linetype_manual(values = c("Baja impuesto" = "dotted", "Base" = "solid", "Suba impuesto" = "dashed"),
                        labels = c(expression("Decrease " * tau[l]), "Base", expression("Increase " * tau[l]))) +
  labs(title = "Consumption", x = "", y = "Consumption", color = "", linetype = "") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),
        legend.position = c(0.15, 0.85),
        legend.title = element_blank(),
        legend.background = element_rect(fill = "white",
                                         linetype = "solid", 
                                         colour = "black")) +
  annotate("segment", x = 58, y = 0.43, xend = 63, yend = 0.48,
           arrow = arrow(type = "closed", length = unit(0.02, "npc"))) +
  annotate("text", x=55, y=0.22, label= "low productivity") +
  annotate("segment", x = 55, y = 0.23, xend = 60, yend = 0.28,
           arrow = arrow(type = "closed", length = unit(0.02, "npc"))) +
  annotate("text", x=55, y=0.41, label= "high productivity")


conbine_lc_cons <- cbind(lifecycletype_baseline, lifecycletype_sim1c[,2:11], lifecycletype_sim2c[,2:11])
conbine_lc_cons$jr <- 20:75

f1c <- conbine_lc_cons %>%
  pivot_longer(cols = -c(jr), names_to = "var", values_to = "values") %>%
  filter(str_starts(var, "abartype")) %>%
  mutate(group = ifelse(var %in% c("abartype1_sim1c", "abartype2_sim1c"), "Baja impuesto",
                        ifelse(var %in% c("abartype1_sim2c", "abartype2_sim2c"), "Suba impuesto", "Base"))) %>%
  ggplot(aes(x = jr, y = values, color = group, linetype = group, group = var)) +
  geom_line(size = 1) +
  scale_color_manual(values = c("Baja impuesto" = "#064789", "Base" = "cornflowerblue", "Suba impuesto" = "#427aa1"),
                     labels = c(expression("Decrease " * tau[c]), "Base", expression("Increase " * tau[c]))) +
  scale_linetype_manual(values = c("Baja impuesto" = "dotted", "Base" = "solid", "Suba impuesto" = "dashed"),
                        labels = c(expression("Decrease " * tau[c]), "Base", expression("Increase " * tau[c]))) +
  labs(title = "", x = "Generation", y = "Assets", color = "", linetype = "") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),
        legend.position = c(0.15, 0.85),
        legend.title = element_blank(),
        legend.background = element_rect(fill = "white",
                                         linetype = "solid", 
                                         colour = "black")) +
  annotate("segment", x = 58, y = 0.7, xend = 63, yend = 1.2,
           arrow = arrow(type = "closed", length = unit(0.02, "npc"))) +
  annotate("text", x=55, y=0.6, label= "low productivity") +
  annotate("segment", x = 55, y = 2.4, xend = 60, yend = 3.1,
           arrow = arrow(type = "closed", length = unit(0.02, "npc"))) +
  annotate("text", x=55, y=2.3, label= "high productivity")

f2c <- conbine_lc_cons %>% 
  pivot_longer(cols = -c(jr), names_to = "var", values_to = "values") %>%
  filter(str_starts(var, "labartype")) %>%
  mutate(group = ifelse(var %in% c("labartype1_sim1c", "labartype2_sim1c"), "Baja impuesto",
                        ifelse(var %in% c("labartype1_sim2c", "labartype2_sim2c"), "Suba impuesto", "Base"))) %>%
  ggplot(aes(x = jr, y = values, color = group, linetype = group, group = var)) +
  geom_line(size = 1) +
  scale_color_manual(values = c("Baja impuesto" = "#064789", "Base" = "cornflowerblue", "Suba impuesto" = "#427aa1"),
                     labels = c(expression("Decrease " * tau[c]), "Base", expression("Increase " * tau[c]))) +
  scale_linetype_manual(values = c("Baja impuesto" = "dotted", "Base" = "solid", "Suba impuesto" = "dashed"),
                        labels = c(expression("Decrease " * tau[c]), "Base", expression("Increase " * tau[c]))) +
  labs(title = "", x = "Generation", y = "Hours worked", color = "", linetype = "") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),
        legend.position = c(0.85, 0.85),
        legend.title = element_blank(),
        legend.background = element_rect(fill = "white",
                                         linetype = "solid", 
                                         colour = "black")) +
  annotate("segment", x = 33, y = 0.27, xend = 35, yend = 0.32,
           arrow = arrow(type = "closed", length = unit(0.02, "npc"))) +
  annotate("text", x=35, y=0.26, label= "low productivity") +
  annotate("segment", x = 55, y = 0.40, xend = 48, yend = 0.36,
           arrow = arrow(type = "closed", length = unit(0.02, "npc"))) +
  annotate("text", x=53, y=0.41, label= "high productivity") 

f3c <- conbine_lc_cons %>% 
  pivot_longer(cols = -c(jr), names_to = "var", values_to = "values") %>%
  filter(str_starts(var, "cbartype")) %>%
  mutate(group = ifelse(var %in% c("cbartype1_sim1c", "cbartype2_sim1c"), "Baja impuesto",
                        ifelse(var %in% c("cbartype1_sim2c", "cbartype2_sim2c"), "Suba impuesto", "Base"))) %>%
  ggplot(aes(x = jr, y = values, color = group, linetype = group, group = var)) +
  geom_line(size = 1) +
  scale_color_manual(values = c("Baja impuesto" = "#064789", "Base" = "cornflowerblue", "Suba impuesto" = "#427aa1"),
                     labels = c(expression("Decrease " * tau[c]), "Base", expression("Increase " * tau[c]))) +
  scale_linetype_manual(values = c("Baja impuesto" = "dotted", "Base" = "solid", "Suba impuesto" = "dashed"),
                        labels = c(expression("Decrease " * tau[c]), "Base", expression("Increase " * tau[c]))) +
  labs(title = "", x = "Generation", y = "Consumption", color = "", linetype = "") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),
        legend.position = c(0.15, 0.85),
        legend.title = element_blank(),
        legend.background = element_rect(fill = "white",
                                         linetype = "solid", 
                                         colour = "black")) +
  annotate("segment", x = 58, y = 0.43, xend = 63, yend = 0.48,
           arrow = arrow(type = "closed", length = unit(0.02, "npc"))) +
  annotate("text", x=55, y=0.22, label= "low productivity") +
  annotate("segment", x = 55, y = 0.23, xend = 60, yend = 0.28,
           arrow = arrow(type = "closed", length = unit(0.02, "npc"))) +
  annotate("text", x=55, y=0.42, label= "high productivity")

fig_imp <- ggarrange(f1t, f2t, f3t, f1c, f2c, f3c,  ncol = 3, nrow = 2)
fig_imp

ggexport(fig_imp, width = 1300, height = 750,filename = "lifecycle_graph.png")