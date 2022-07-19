#' .. content for Create plots for launch speed vs launch angle (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param data
#' @param type
#' @param title
#'
exitvel_vs_launchangle_plots <- function(data1,data2, type, title) {
  if (type == "scatter") {
    plot <- data1 %>%
      mutate(
        launch_speed = as.numeric(launch_speed),
        launch_angle = as.numeric(launch_angle)
      ) %>%
      filter(events == "home_run") %>%
      ggplot(aes(x = launch_speed, y = launch_angle)) +
      geom_point(size = 3, colour = "blue") +
      theme(panel.background = element_blank()) +
      scale_x_continuous(limits = c(100, 120),
                         breaks = seq(100, 120, by = 10)) +
      ggtitle(label = title, subtitle = "Home Runs, 2015-2017")
  }
  else if (type == "kd") {
    plot <- data1 %>%
      mutate(
        launch_speed = as.numeric(launch_speed),
        launch_angle = as.numeric(launch_angle)
      ) %>%
      filter(events == "home_run") %>%
      ggplot(aes(x = launch_speed, y = launch_angle)) +
      geom_point(size = 3, colour = "blue") +
      theme(panel.background = element_blank()) +
      scale_x_continuous(limits = c(90, 130),
                         breaks = seq(90, 130, by = 10)) +
      scale_y_continuous(limits = c(0, 50),
                         breaks = seq(0, 50, by = 10))+
      ggtitle(label = title, subtitle = "Home Runs, 2015-2017") +
      geom_density_2d(alpha = 0.5) + theme(legend.position = "None")
  }
  else if (type=="box"){
    
    data <- rbind(data1,data2) %>% 
      mutate(release_speed=as.numeric(release_speed))
    plot <- data %>% 
      filter(events=="home_run") %>% 
      ggplot(aes(x=release_speed,y=player_name))+
      geom_boxplot(fill="#008080")+
      theme(panel.background = element_blank(),
            axis.title.y=element_text(angle=90),
            axis.line=element_line())+
      ggtitle(label="Home Runs",subtitle="2015-2017")
    
  }
  
  return(plot)
}
