#  API Automation Framework - PetStore (Robot Framework)

##  Overview
This project is an **API Automation Framework** built using **Robot Framework** for testing the PetStore APIs.

It follows **enterprise (MNC-level) structure** with:
- Reusable keywords
- Clean test cases
- Dynamic test data
- Full CRUD operations

## 🧪 API Test Coverage

This framework covers end-to-end CRUD operations for PetStore APIs:

- Create Pet (POST)
- Get Pet by ID (GET)
- Update Pet (PUT)
- Delete Pet (DELETE)

---

API_AUTOMATION_FRAMEWORK/
## 📁 Project Structure

- API_AUTOMATION_FRAMEWORK/
  - tests/
    - pet_test.robot  _(Test cases)_
  
  - resources/
    - keywords/  _(Business & common keywords)_
      - common_keywords.robot
      - pet_keywords.robot

    - variables/  _(Config & test data)_
      - config.robot
      - test_data.robot

  - reports/  _(Execution reports)_

  - requirements.txt  
  - README.md

  
---

##  Technologies Used

- Robot Framework
- RequestsLibrary
- JSONLibrary
- Python


##  Jenkins Integration

This framework is integrated with Jenkins for continuous integration and automated execution.

###  Jenkins Setup

1. Creat Pipeline in Jenkins
2. Configure Source Code Management (Git)
3. Add build step to execute tests

---

###  Build Steps

```bash
pip install -r requirements.txt
robot -d reports tests/