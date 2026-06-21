# Airline Passenger Satisfaction Analysis

## Project Overview

Customer satisfaction is one of the most important drivers of loyalty and long-term profitability in the airline industry. Airlines collect passenger feedback across multiple service touchpoints, including boarding experience, seat comfort, in-flight services, delays, and cleanliness.

This project analyzes airline passenger satisfaction data to identify the factors that most influence customer satisfaction and uncover actionable opportunities for improving the passenger experience.

---

## Business Problem

**Airlines are losing customer loyalty and revenue because passengers report dissatisfaction with aspects of their travel experience, so they need to decide which service factors—such as seat comfort, inflight Wi-Fi, food and drink, delays, and customer service—should be prioritized for improvement, and this decision can be guided by analyzing columns like service ratings, flight details (class, type of travel, flight distance), and the overall satisfaction score."**

By answering this question, airlines can prioritize targeted service improvements, reduce customer dissatisfaction, strengthen customer loyalty, and improve overall passenger experience.

---

## Dataset

**Source:** Kaggle – Airline Passenger Satisfaction Dataset

**Dataset Features:**

* Passenger demographics
* Customer type (Loyal / Disloyal)
* Travel class (Business, Economy Plus, Economy)
* Flight distance
* Online boarding ratings
* Seat comfort ratings
* In-flight entertainment ratings
* Food & drink ratings
* Cleanliness ratings
* Delay information
* Overall satisfaction status

---

## Tools Used

* SQL (MySQL)
* Power BI
* Power Query
* DAX
* GitHub

---

## Data Cleaning Process

The dataset was cleaned and validated before analysis.

### Cleaning Steps

* Checked for duplicate records using passenger IDs.
* No duplicate records were found.
* Checked all columns for NULL values.
* No missing values were identified.
* Standardized satisfaction labels:

  * "neutral or dissatisfied" → "Dissatisfied"
  * "satisfied" → "Satisfied"
* Verified categorical values for:

  * Customer Type
  * Travel Class
  * Satisfaction Status
* Created additional delay-format columns for exploratory analysis while preserving original delay columns.

---

## Business Questions

### 1. Which service factor has the strongest relationship with overall satisfaction?

### 2. Do passengers using online boarding versus traditional check-in show different satisfaction levels?

### 3. Which travel class has the lowest satisfaction?

### 4. Are loyal customers more or less satisfied than disloyal customers?

### 5. Does departure or arrival delay affect passenger satisfaction?

---

## Key Findings

### 1. Online Boarding Has the Strongest Relationship with Satisfaction

Online boarding showed the largest rating gap between satisfied and dissatisfied passengers (**1.35**), making it the strongest driver of satisfaction among the service factors analyzed.

Other high-impact factors include:

* In-flight Entertainment (1.07)
* Seat Comfort (0.92)

**Business Impact:**
Passengers form impressions before boarding the aircraft. A smooth and reliable digital check-in experience significantly influences overall satisfaction.

---

### 2. Traditional Check-In Outperforms Online Boarding

Passengers using traditional check-in reported a satisfaction rate of **59.2%**, compared to **43.4%** for online boarding users.

**Business Impact:**
Although online boarding has the highest potential impact on satisfaction, the current digital experience appears to underperform traditional check-in.

---

### 3. Large Satisfaction Gap Across Travel Classes

| Class        | Satisfaction Rate |
| ------------ | ----------------- |
| Business     | 69.51%            |
| Economy Plus | 24.70%            |
| Economy      | 19.38%            |

**Business Impact:**
Business-class passengers are substantially more satisfied than Economy passengers, highlighting significant service quality gaps across travel classes.

---

### 4. Loyalty Alone Does Not Guarantee Satisfaction

| Customer Type     | Satisfaction Rate |
| ----------------- | ----------------- |
| Loyal Customer    | 48.14%            |
| Disloyal Customer | 25.17%            |

**Business Impact:**
Even among loyal customers, fewer than half report satisfaction, suggesting that loyalty programs alone cannot compensate for poor service experiences.

---

### 5. Delays Consistently Reduce Satisfaction

Passengers experiencing on-time departures and arrivals reported satisfaction rates of approximately **45–46%**, while delayed passengers reported satisfaction rates around **36–37%**.

**Business Impact:**
Flight delays reduce satisfaction by nearly 10 percentage points, making operational efficiency a critical customer experience factor.

---

## Dashboard Overview

The Power BI dashboard was designed to answer all five business questions through interactive visualizations.

### Dashboard Components

#### KPI Cards

* Total Passengers
* Overall Satisfaction Rate
* Average Departure Delay
* Average Arrival Delay

#### Visualizations

* Rating Gap by Service Factor
* Satisfaction by Boarding Type
* Satisfaction by Travel Class
* Satisfaction by Customer Loyalty
* Satisfaction by Delay Status

---

## Business Recommendations

### Improve Digital Boarding Experience

* Simplify online check-in flow
* Improve mobile application usability
* Reduce technical failures during boarding

### Enhance Economy-Class Experience

* Improve seating comfort
* Improve in-flight entertainment options
* Increase service quality consistency

### Focus on Core Service Quality

* Improve high-impact service factors:

  * Online Boarding
  * In-flight Entertainment
  * Seat Comfort

### Reduce Operational Delays

* Improve turnaround management
* Enhance scheduling efficiency
* Strengthen delay communication processes

### Convert Loyalty into Satisfaction

* Combine loyalty rewards with meaningful service improvements
* Personalize customer experiences beyond loyalty perks

---

## Project Files

* SQL Data Cleaning Script
* SQL Business Analysis Queries
* Power BI Dashboard (.pbix)
* Dashboard Screenshots
* README Documentation

---

## AI Usage Disclosure

AI tools were used primarily for:

* Debugging SQL errors
* Understanding advanced DAX patterns
* Implementing the Power BI unpivot and rating-gap calculation

All business questions, project direction, data cleaning decisions, analytical reasoning, insights, and recommendations were independently developed and validated by the author.

---

## Author

**Srinith Samala**

B.Sc. Data Science | SQL | Power BI | Python | Data Analytics

GitHub: https://github.com/srinith-samala

LinkedIn: https://www.linkedin.com/in/srinith-samala
