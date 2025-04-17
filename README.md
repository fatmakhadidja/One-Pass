#  One Pass
One Pass is a secure and user-friendly password manager built using Flutter. It enables you to safely store and manage all your login credentials in one place, utilizing Sqflite for local database storage and SharedPreferences for lightweight storage needs like app settings or modes.
- One Pass UI design :   
https://www.figma.com/design/HYcmRBuSPgvV14LpoRfcWJ/OnePass--A-password-manager-UI-Kit--Community-?node-id=0-1&p=f&t=Vr9utE9kAT1pUrvj-0
- One Pass download link :    
https://drive.google.com/drive/u/0/folders/1F6WhyXSIGjKrO8fGM5P--z3wXJ2Yovjl

##  Features

### 🔑 **User Authentication**
- **Create an account** using a secure **username and password**
- **Login** using credentials or your **phone's fingerprint authentication**
  ![Register and login and finger prints](https://github.com/user-attachments/assets/acd704b6-957c-4d06-918d-aacebd78c66b)
### 📂 **Account Management**
- **Add**, **update**, and **delete** stored accounts and credentials easily  
- **View all your saved accounts** on the home screen  
- **Search for specific accounts** quickly using the built-in search feature
  ![operationsOnAccounts](https://github.com/user-attachments/assets/5c1361c1-5107-4161-977b-f4307d4a8b03)
### 🎨 **Theme Modes & Security Settings**
- Seamlessly switch between **Light Mode** and **Dark Mode** for a personalized experience
- **Change your main password** anytime to enhance security and control
  ![mode and passwoordshange](https://github.com/user-attachments/assets/f190b9e3-4093-475c-8b7f-0c7c73f2e55a)

---
 
#  Do you want to run the app yourself on your PC without the need to install Flutter and all ? 
This guide will walk you through setting up the environment, building the Docker image, and running the project.

## Requirements

- **Docker**: Install Docker on your machine. Instructions can be found on [Docker's official website](https://www.docker.com/get-started).
- **Git**: Install Git to clone the repository and manage your code.

## Setup Instructions

### 1. Clone the Repository

Start by cloning the repository to your local machine:

```bash
git clone https://github.com/yourusername/your-repository.git
cd your-repository
```

## 2. Build the Docker Image
The Docker image contains the necessary environment to build and run the app, but you still need Flutter installed locally for making changes. To build the Docker image:

```bash
docker build -t app_docker_image .
```

## 3. Run the Docker container
For Windows Users:
Since Windows uses a different syntax for file paths, you need to modify the Docker -v option slightly:

```bash
docker run -it --rm -v ${PWD}:/app app_docker_image bash
```
In PowerShell or CMD, you can use the following command:

```bash

docker run -it --rm -v "%cd%:/app" app_docker_image bash

```
## 3. Run the App
Once inside the Docker container, you can run the Flutter app:

```bash
flutter run
