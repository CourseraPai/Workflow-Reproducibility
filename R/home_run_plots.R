#' .. content for 2D histograms (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @home_run_plots
#' @param data
home_run_plots <- function(data,title) {

  data <- data %>% 
    filter(events=="home_run"& !zone=="null") %>% 
    mutate(zone=as.numeric(zone)) %>% select(zone) %>% filter(zone<=9)
  
  data <- data %>% 
    mutate(x_pitch_no = case_when(zone %in% c(1,4,7)~ 1,
                                  zone %in% c(2,5,8)~ 2,
                                  zone %in% c(3,6,9)~ 3),
           y_pitch_no = case_when(zone %in% c(1,2,3)~ 3,
                                  zone %in% c(4,5,6)~ 2,
                                  zone %in% c(7,8,9)~ 1))
  
  
  data <- data %>% 
    group_by(x_pitch_no,y_pitch_no) %>% 
    count()
  
  plot <- ggplot(data, aes(x = x_pitch_no, y = y_pitch_no, fill = n)) +
    geom_tile()+
    theme(axis.text=element_blank(),
          axis.ticks = element_blank(),
          axis.title = element_blank(),
          panel.background = element_blank())+
    ggtitle(label=title)+
    scale_fill_continuous(name="Counts in Bin",trans = 'reverse',high = "#FFFFFF", low = "#1F51FF")
  
  return(plot)
  

}
