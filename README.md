# TopPredictorsShinyApp

This simple Shiny app finds top predictors based on the p value 

The URL for the application on shiny server : https://shreyashukla.shinyapps.io/myapp/

To run the application :
1. Download the server.R and ui.R 
2. Put the files in any folder in the current working directory of RStudio
3. Issue commany **runApp()** 

Working of the application:

The application's working is pretty stratightforward. Choose the no on the slider and click on submit button.
Based on the slider input the top predictors, their plots vs. the **mpg** variable and their corresponding **pvalues** will be displayed.

For more information on the application, visit : http://rpubs.com/shreyashukla01/TopPredictorsShiny
