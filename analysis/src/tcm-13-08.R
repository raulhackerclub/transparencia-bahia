library(magrittr)
library(ggplot2)
library(plotly)
library(dplyr)

tcm_df <- read.csv2("../data/TCMBa.csv")

tcm_df$valor_do_pagamento %<>%  as.character %>% as.numeric

# Favorecido por Ano
tcm_df %>% 
  group_by(nm_favorecido, Ano = data_do_pagamento %>% substring(.,1,4)) %>% 
  summarise_at(vars(valor_do_pagamento), 
               funs(sum(.,na.rm=T))) %>% 
  .[order(.$valor_do_pagamento,decreasing=T),]

tcm_df %>% 
  group_by(nm_favorecido, 
           Fonte = nm_fonte_de_recurso_gestor_2,
           Ação = nm_acao,
           nm_natureza_da_despesa_tcm) %>% 
  summarise_at(vars(valor_do_pagamento), 
               funs(sum(.,na.rm=T))) %>% 
  .[order(.$valor_do_pagamento,decreasing=T),] %>% 
  datatable(colnames = c("Favorecido","Fonte","Ação","Natureza","Valor (R$)"))

options(scipen=5)
dens_poderes <- ggplot(tcm_df,aes(x=valor_do_pagamento,
                                  fill=poder))+
  geom_density(alpha=0.5)+
  scale_x_continuous(round(seq(min(tcm_df$valor_do_pagamento),
                               max(tcm_df$valor_do_pagamento),
                               by = 1000),1))+
  xlab("Valor")+ylab("Densidade relativa")+
  ggtitle("Densidade por valores até R$25.000,00")

ggplotly(dens_poderes)
