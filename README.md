
This repository serves as a personal notebook in which I recorded my learning process as a beginner in R. It is by no means easy to understand for many readers, but it may still be useful as a reference. It includes the following contents.
1. [Data organization](https://github.com/Hiroki-Ando1998/R/tree/main/Data_organization): Methods for cleaning, seeing basic statistics and transforming raw data into analyzable formats in R.
2. [Data graphic](https://github.com/Hiroki-Ando1998/R/tree/main/ggplot2): Techniques for data visualization using ggplot2, including customization of plots and graphical elements.
3. [Generalized linear model](https://github.com/Hiroki-Ando1998/R/tree/main/Generalized%20linear%20model): Implementation and interpretation of GLMs such as linear, logistic, and Poisson regression models.
4. [Statistcial test & Epidemiological study design](https://github.com/Hiroki-Ando1998/R/tree/main/Statistical%20tests%20%26%20epidemiological%20study%20design): Basic statistical hypothesis testing and principles of study design in epidemiological research.
5. [State-space modeling]: Modeling of dynamic systems with latent variables using state-space and Bayesian approaches.

## 1. Data organization
A central framework of data organization in R is the tidyverse, especially the package dplyr. Alongside it, tidyr focuses on reshaping data between wide and long formats, handling missing values, and ensuring that datasets follow the “tidy data” structure where each variable is a column and each observation is a row. For data import and string handling, packages like readr and stringr are commonly used, making it easier to read large datasets and clean textual variables in a consistent way. The design philosophy of the tidyverse is to make data preparation readable, chainable, and close to natural language through the pipe operator %>%. For large-scale data processing, packages like data.table are often preferred because they are faster and more memory-efficient, especially for big datasets. In [this file](https://github.com/Hiroki-Ando1998/R/tree/main/Data_organization), functions I often uses are shown. 

## 2. Figures with ggplot2
In R, there are several ways to create visualizations (e.g., ggblend, ggnewscale, gganimate), and ggplot2 is one of the most widely used and influential approaches ([Cook book 2nd Edition](https://rc2e.com/inputandoutput#recipe-readexcel)). When creating figures for academic papers using ggplot2, it is important to pay attention to the figure size. In many scientific journals:
- Full text width ≈ 17–18 cm (single-column full width)
- Page height (usable text area) is typically around:23–24 cm

Since we should size figures based on column width, I always make figures in R with (width, height) = (**630cm**, 440cm)

## 3. Generalized liner model
