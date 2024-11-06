RealmSwift Todo App

A simple iOS Todo app built with Swift and Realm, using UIKit. This app demonstrates basic CRUD (Create, Read, Update, Delete) operations with Realm, an easy-to-use local database for iOS. The app allows users to add, view, and delete tasks in a list.

Features

	•	Add New Task: Quickly add a new task using an alert input form.
	•	View Tasks: Display tasks in a table view with the ability to reload data in real-time.
	•	Delete Task: Remove tasks from the list by tapping the delete button in each cell.
	•	Persistence with Realm: All data is stored locally using Realm, providing a robust and efficient way to store app data.

Project Structure

	•	ViewController.swift: Manages the main interface with task addition and deletion functionalities.
	•	TodoItem: A Realm model class that defines the schema for a task.
	•	toDoListTableViewCell.swift: A custom cell class for displaying each task, including a delete button with delegate protocol to handle deletion.

Requirements

	•	iOS 14.0+
	•	Swift 5.0
	•	RealmSwift
