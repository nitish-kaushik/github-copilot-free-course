# Todo App

This is a simple Todo application built with HTML, CSS, and JavaScript. It allows users to add, remove, and view their tasks in a straightforward interface.

## Project Structure

```
todo-app
├── index.html       # Main HTML document for the todo app
├── styles           # Directory containing CSS styles
│   └── main.css     # Styles for the todo app
├── scripts          # Directory containing JavaScript files
│   └── app.js       # JavaScript code for the todo app
└── README.md        # Documentation for the project
```

## Features

- Add new todos
- Remove existing todos
- View the list of todos

## Running the App Locally

1. Clone the repository or download the project files.
2. Open the `index.html` file in your web browser.
3. You can start adding and managing your todos!

## Homework Assignment 📚

**Task: Implement Local Storage for Todo Persistence**

Currently, the todo app loses all data when the page is refreshed. Your homework is to enhance the application by adding browser storage functionality.

### Requirements:
1. **Save todos to local storage** - When a user adds a new todo, it should be saved to the browser's local storage
2. **Load todos from local storage** - When the page loads, retrieve and display previously saved todos
3. **Update local storage** - When todos are edited or removed, update the stored data accordingly
4. **Handle edge cases** - Consider scenarios like empty storage, corrupted data, etc.

### Implementation Guidelines:
- Use `localStorage` API to store todo data as JSON
- Implement functions like `saveTodos()`, `loadTodos()`, and `updateLocalStorage()`
- Ensure data persistence across browser sessions
- Test thoroughly by adding todos, refreshing the page, and verifying data persists

### Bonus Challenges:
- Add a "Clear All Data" button to reset local storage
- Implement import/export functionality for todo data
- Add timestamp tracking for when todos were created/modified

Good luck! 🚀

## Contributing

Feel free to fork the repository and submit pull requests for any improvements or features you would like to add.