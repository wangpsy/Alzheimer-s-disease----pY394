##load the packages
library(easypackages);
libraries('ggplot2', 'ggthemes');

##load the data
dt = read.table('~\\WB_p394.txt', header = T);

##GLM and visualization for p394 and gpath
gpath_ad0 = dt[dt$ad_adnc == 0, ]
rg_gad0 = lm(gpath_ad0$p394 ~ gpath_ad0$gpath);
summary(rg_gad0);

gpath_ad1 = dt[dt$ad_adnc == 1, ]
rg_gad1 = lm(gpath_ad1$p394 ~ gpath_ad1$gpath);
summary(rg_gad1);

ggplot(dt, aes(x = p394, 
               y = gpath)) +
  geom_point(shape = 21) +
  geom_smooth(method = "lm", se = TRUE) + 
  xlab('p394') +
  facet_grid(.~ad_adnc) +
  theme_few(base_size = 12);

##GLM and visualization for p394 and tangle density
tang_rg = lm(dt$p394 ~ dt$tangsqrt_est_8reg);
summary(tang_rg);

ggplot(dt, aes(x = p394, 
               y = tangsqrt_est_8reg)) +
  geom_point(shape = 21) +
  geom_smooth(method = "lm", se = TRUE) + 
  xlab('p394') +
  theme_few(base_size = 12)

