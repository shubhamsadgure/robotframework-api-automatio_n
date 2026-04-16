#  API Automation Framework - PetStore (Robot Framework)

##  Overview
This project is an **API Automation Framework** built using **Robot Framework** for testing the PetStore APIs.

It follows **enterprise (MNC-level) structure** with:
- Reusable keywords
- Clean test cases
- Dynamic test data
- Full CRUD operations

---

##  Project Structure
API_AUTOMATION_FRAMEWORK/
│
├── tests/ # Test cases
│ └── pet_test.robot
│
├── resources/
│ ├── keywords/ # Business & common keywords
│ │ ├── common_keywords.robot
│ │ └── pet_keywords.robot
│ │
│ ├── variables/ # Config & test data
│ ├── config.robot
│ └── test_data.robot
│ 
│
│
├── reports/ # Execution reports
│
├── requirements.txt
└── README.md



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