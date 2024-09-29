# Scitick - Educational Learning Game App

## Overview
**Scitick** is an interactive educational game built using **Flutter**. It is designed for students to learn various subjects through a fun and engaging "Snakes and Ladders" style game. Players answer different types of questions to progress on the board, and upon completing the board, they are rewarded with virtual stickers for their album.

---

## Features

### Question Types:
- True/False
- Single Choice (Multiple Choice, one answer)
- Multiple Choice (Multiple answers)
- Fill in the Blanks
- Word Order (Arrange words in the correct order)
- Word Matching (Match pairs of words)

### Sticker Album:
- Students earn 1-3 stickers as rewards for completing game boards.
- Admins create and manage sticker albums via the admin panel.
- Completing one album unlocks a new album for the student.

### Game Board:
- The game board consists of 99 questions, divided into sections based on different skills.
- Random jumps occur based on students' answers, creating a dynamic and challenging gameplay experience.
- A unique board is generated for each student, prioritizing questions they haven’t answered yet.

### Admin Panel:
- Manage and create questions, game boards, and sticker albums.
- Configure question types, skill areas, question levels, and target grades.
- Track student progress through the game boards via statistics in the admin panel.

---

## Components

### Questions:
Questions are created in the admin panel. Each question includes:
- Type (True/False, Single Choice, Multiple Choice, etc.)
- The question content
- The skill being tested
- The subject (e.g., science, geography, history)
- Difficulty level (easy, intermediate, advanced, difficult)
- Target grade level

### Game Board:
- Automatically generated game boards for each student, consisting of 99 questions.
- Divided into sections based on specific skills.
- Random jumps to other questions based on performance.
- The student's progress is saved, tracking steps taken and answered questions.

### Sticker Album:
- Sticker albums are created via the admin panel.
- Each sticker has an image, name, and type (e.g., silver, gold).
- Stickers are awarded based on performance when completing a game board.
- Completing an album unlocks the next album for the student.

---

## Admin Panel Management

- **Questions Management**: Define various question types and structure them accordingly, configure multiple-choice answers, and set keyword-based grading and question jumps.
- **Game Board Creation**: Admins can create multiple game boards, define rewards for fewer moves, and monitor student progress.
- **Sticker Album**: Admins manage sticker albums, add as many stickers as required, and have the ability to edit or delete stickers.

---

## How to Run

1. Clone the repository:
    ```bash
    git clone https://github.com/miriam-berenstein/scitick
    ```
2. Navigate to the project directory:
    ```bash
    cd scitick
    ```
3. Install dependencies:
    ```bash
    flutter pub get
    ```
4. Run the app on an emulator or connected device:
    ```bash
    flutter run
    ```

5. Access the admin panel to configure questions, game boards, and sticker albums.
