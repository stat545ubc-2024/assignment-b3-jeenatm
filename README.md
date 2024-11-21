# 📊 **Trend of Excess COPD Medication Costs by Type**

## **Overview**
This Shiny application allows users to interactively explore trends in excess COPD medication costs by type and year. 



🔗 **Live App Link**: [View the Shiny App](https://jeenatm.shinyapps.io/medication_cost/)



## **Features**
### 1 **Interactive Plot**
The plot shows trends for selected cost types over the chosen year range. It is customizable based on what Type and Year Range user chooses.

### 2 **Customizable Year Range**
Year range can be adjusted with a slider, allowing user to view data for specific year they want to see.

### 3 **Select Box for Cost Type**
The app includes a **Select Box** where users can choose the type of cost they want to analyze (e.g., OOP, prescription costs) and focus on a specific cost category.

### 4 **Data Table**
This is showing a table of filtered data that can be searched and sorted. Users can sort the data by any column (e.g, FU_year, Estimate, or type )



## **Dataset**

This version of the data is saved as [Medication_cost](https://github.com/stat545ubc-2024/assignment-b3-jeenatm/tree/main/Medication_cost) as medication_data.csv. 


This dataset has the following variables: 

- **`Type`**: Specifies the cost category (e.g., Out-of-Pocket (OOP), Public Insurance, Private Insurance).
- **`FU_year`**: Indicates the follow-up year.
- **`Estimate`**: Represents estimated costs in $2020 CAD.

### **Data Source**
The dataset used in this application is a **transformed version** of an original data due to confidentiality concerns and is intended solely for analysis and demonstration purposes in [STAT545B course Assignment B3](https://stat545.stat.ubc.ca/assignments/assignment-b3/).



The app is hosted on [shinyapps.io](https://www.shinyapps.io/)

