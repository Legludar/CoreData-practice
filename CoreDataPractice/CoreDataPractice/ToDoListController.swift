//
//  ViewController.swift
//  CoreDataPractice
//
//  Created by David on 2/23/21.
//

import UIKit

class ToDoListController: UIViewController {
    @IBOutlet weak var tableview: UITableView!
    var mockToDo = [Todo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.estimatedRowHeight = 44
        mockData()
    }
    
    func mockData(){
        let todo = Todo(context: CoreDataManager.shared.persistentContainer.viewContext)
        todo.name = "some name"
        todo.dueDate = Date()
        todo.id = UUID()
        todo.completed = false
        for _ in 0...9{
            mockToDo.append(todo)
        }
    }


}
extension ToDoListController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockToDo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell") as! ToDoTableCell
        cell.todo = mockToDo[indexPath.row]
        return cell
    }
    
    
}

