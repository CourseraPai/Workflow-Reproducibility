#' .. content for \Counting batted ball events for data > 2017
#'
#' .. content for \details{} ..
#'
#' @count_batted_ball_events()
#' @param data
count_batted_ball_events <- function(data) {

  count_df <-
    data %>% 
    filter(game_date > '2017-01-01' & !events=="null") %>% 
    select(events) %>% 
    group_by(events) %>% 
    summarise(n = n()) %>%
    arrange(desc(n))

  return(count_df)
  

}
