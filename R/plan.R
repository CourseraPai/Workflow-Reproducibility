pitch_location <-
  drake_plan(

    url1 ="https://raw.githubusercontent.com/VolodymyrGavrysh/DataCamp_projects/master/A%20New%20Era%20of%20Data%20Analysis%20in%20Baseball/datasets/judge.csv",
    url2 ="https://raw.githubusercontent.com/VolodymyrGavrysh/DataCamp_projects/master/A%20New%20Era%20of%20Data%20Analysis%20in%20Baseball/datasets/stanton.csv",
    

    judge = get_data(url1),  
    stanton = get_data(url2),
    
    judge_counts=count_batted_ball_events(judge),
    stanton_counts=count_batted_ball_events(stanton),
    
    judge_scatter_plot=exitvel_vs_launchangle_plots(judge,stanton,"scatter","Judge"),
    stanton_scatter_plot=exitvel_vs_launchangle_plots(stanton,judge,"scatter","Stanton"),
    judge_kd_plot=exitvel_vs_launchangle_plots(judge,stanton,"kd","Judge"),
    stanton_kd_plot=exitvel_vs_launchangle_plots(stanton,judge,"kd","Stanton"),
    
    bx_plot=exitvel_vs_launchangle_plots(stanton,judge,"box","Box_Plot"),
    
    judge_home_runs=home_run_plots(judge,"Judge"),
    stanton_home_runs=home_run_plots(stanton,"Stanton"),
    
    report = target(
      command = {
        rmarkdown::render(knitr_in("doc/Pitch_Location_Analysis.Rmd"))
        file_out("doc/Pitch_Location_Analysis.html")
        }
      )
   
)

