// This file contains the JavaScript code for the todo app.

const todoInput = document.getElementById('todo-input');
const addButton = document.getElementById('add-todo');
const todoList = document.getElementById('todo-list');
const emptyState = document.getElementById('empty-state');

addButton.addEventListener('click', addTodo);
todoInput.addEventListener('keypress', (e) => {
    if (e.key === 'Enter') addTodo();
});

function addTodo() {
    const todoText = todoInput.value.trim();
    if (todoText === '') return;

    const todoItem = document.createElement('li');
    todoItem.innerHTML = `
        <span class="todo-text">${todoText}</span>
        <div class="todo-actions">
            <button class="edit-btn" onclick="editTodo(this)">✏️ Edit</button>
            <button class="remove-btn" onclick="removeTodo(this)">🗑️ Remove</button>
        </div>
    `;

    todoList.appendChild(todoItem);
    todoInput.value = '';
    updateEmptyState();
}

function editTodo(button) {
    const todoItem = button.parentElement.parentElement;
    const todoText = todoItem.querySelector('.todo-text');
    const currentText = todoText.textContent;
    
    // Create input field for editing
    const input = document.createElement('input');
    input.type = 'text';
    input.value = currentText;
    input.className = 'edit-input';
    
    // Replace text with input
    todoText.style.display = 'none';
    todoItem.insertBefore(input, todoItem.querySelector('.todo-actions'));
    
    // Change button to save/cancel
    const actionsDiv = todoItem.querySelector('.todo-actions');
    actionsDiv.innerHTML = `
        <button class="save-btn" onclick="saveTodo(this)">💾 Save</button>
        <button class="cancel-btn" onclick="cancelEdit(this, '${currentText}')">❌ Cancel</button>
    `;
    
    // Focus and select input text
    input.focus();
    input.select();
    
    // Handle Enter key to save
    input.addEventListener('keypress', (e) => {
        if (e.key === 'Enter') saveTodo(actionsDiv.querySelector('.save-btn'));
        if (e.key === 'Escape') cancelEdit(actionsDiv.querySelector('.cancel-btn'), currentText);
    });
}

function saveTodo(button) {
    const todoItem = button.parentElement.parentElement;
    const input = todoItem.querySelector('.edit-input');
    const todoText = todoItem.querySelector('.todo-text');
    const newText = input.value.trim();
    
    if (newText === '') {
        alert('Task cannot be empty!');
        return;
    }
    
    // Update text and restore original layout
    todoText.textContent = newText;
    todoText.style.display = 'inline';
    input.remove();
    
    // Restore original buttons
    const actionsDiv = todoItem.querySelector('.todo-actions');
    actionsDiv.innerHTML = `
        <button class="edit-btn" onclick="editTodo(this)">✏️ Edit</button>
        <button class="remove-btn" onclick="removeTodo(this)">🗑️ Remove</button>
    `;
}

function cancelEdit(button, originalText) {
    const todoItem = button.parentElement.parentElement;
    const input = todoItem.querySelector('.edit-input');
    const todoText = todoItem.querySelector('.todo-text');
    
    // Restore original text and layout
    todoText.textContent = originalText;
    todoText.style.display = 'inline';
    input.remove();
    
    // Restore original buttons
    const actionsDiv = todoItem.querySelector('.todo-actions');
    actionsDiv.innerHTML = `
        <button class="edit-btn" onclick="editTodo(this)">✏️ Edit</button>
        <button class="remove-btn" onclick="removeTodo(this)">🗑️ Remove</button>
    `;
}

function removeTodo(button) {
    const todoItem = button.parentElement.parentElement;
    todoList.removeChild(todoItem);
    updateEmptyState();
}

function updateEmptyState() {
    if (todoList.children.length === 0) {
        emptyState.classList.remove('hidden');
    } else {
        emptyState.classList.add('hidden');
    }
}

// Initialize empty state
updateEmptyState();