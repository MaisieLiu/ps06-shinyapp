# ps06-shinyapp

## Shiny App URL
[COVID-19 Vaccination Report in the United States by County](https://maisieliu6666.shinyapps.io/ps06-shinyapp/)

## Brief Discription

COVID has been prevalent in the previous three years, and many government authorities are encouraging residents to get vaccinated. Although many people believe getting vaccinated is helpful for them, others prefer not to get their booster dose after completing the COVID vaccination series. This data report is aimed to find the relation between completing vaccination series and receiving booster doses by state, age, and county.

## Variable Name Definition (the ones used to analyze here)

1. **Series_Complete_Yes: ** Total number of people who have completed a primary series (have second dose of a two-dose vaccine or one dose of a single-dose vaccine) based on the jurisdiction and county where vaccine recipient lives.
2. **Series_Complete_Pop_Pct: ** Percent of people who have completed a primary series(have second dose of a two-dose vaccine or one dose of a single-dose vaccine) based on the jurisdiction and county where vaccine recipient lives.
3. **Series_Complete_5Plus: ** Total number of people ages 5+ who have completed a primary series (have second dose of a two-dose vaccine or one dose of a single-dose vaccine) based on the jurisdiction where recipient lives.
4. **Booster_Doses: ** Total number of people who completed a primary series and have received a booster (or additional) dose.
5. **Booster_Doses_Vax_Pct: ** Percent of people who completed a primary series and have received a booster (or additional) dose.
6. **Booster_Doses_5Plus: ** Total number of people ages 5+ who completed a primary series and have received a booster (or additional) dose.
7. **Booster_Doses_5Plus_Vax_Pct: ** Percent of people ages 5+ who completed a primary series and have received a booster (or additional) dose.
- For those that contains *Pct* means that the data is a percentage.
- For those that starts with *Series_Complete* or *Booster_Doses* have similar definition as the ones listed above and the only difference is the age plus data

## Explanation

This section will be divided and explained by different panels.

1. **About Panel**

This panel is a brief explanation of the dataset used and variable name description.

This panel doesn't contain any sidebar panels and also doesn't contain any widgets.

2. **Plot Panel**

This panel explores the relation between people that completed the COVID vaccination series and COVID vaccination booster doses.

*Select State Widget: *

The drop down state selection in this panel is to analyze the relation of receiving vaccination series and vaccination booster doses by state.

*Select Age Widget: *
    
This radio button widget is to select and analyze the data in the age range.For example, choosing the 5-12 age range shows the data of vaccination within the 5 to 12 year-old range.

*Select Color Widget: *

This is to change the color of the points in the scatterplot.

3. **Table Panel**

This panel can customize the *Series_Complete* data and *Booster_Doses* data that users are willing to know more about.

*Select State Widget: *

This is to look at the data by states.

*Select Series Data Widget: *

This check box is to select the Series_Complete data interested in for each state.

*Select Booster Data Widget: *

This check box is to select the Booster_Doses data interested in for each state.





