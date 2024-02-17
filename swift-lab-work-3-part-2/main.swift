import Foundation

struct Task {
    var title: String
    var description: String
    var isCompleted: Bool
    
    init(title: String, description: String) {
        self.title = title
        self.description = description
        self.isCompleted = false
    }
}

class ToDoList {
    var tasks: [Task]
    
    init() {
        self.tasks = []
    }
    
    func addTask(task: Task) {
        tasks.append(task)
    }
    
    func removeTask(title: String) {
        tasks.removeAll { $0.title == title }
    }
    
    func changeTaskStatus(title: String, isCompleted: Bool) {
        if let index = tasks.firstIndex(where: { $0.title == title }) {
            tasks[index].isCompleted = isCompleted
        }
    }
    
    func displayAllTasks() {
        for task in tasks {
            print("Название: \(task.title), Описание: \(task.description), Завершена: \(task.isCompleted ? "Да" : "Нет")")
        }
    }
    
    func displayCompletedTasks() {
        let completedTasks = tasks.filter { $0.isCompleted }
        print("Завершенные задачи:")
        for task in completedTasks {
            print("Название: \(task.title), Описание: \(task.description)")
        }
    }
    
    func displayOutstandingTasks() {
        let outstandingTasks = tasks.filter { !$0.isCompleted }
        print("Невыполненные задачи:")
        for task in outstandingTasks {
            print("Название: \(task.title), Описание: \(task.description)")
        }
    }
    
    func clearCompletedTasks() {
        tasks.removeAll { $0.isCompleted }
    }
    
    func runUI() {
        print("Добро пожаловать в программу списка дел!")
        print("Выберите опцию:")
        print("1. Добавить задачу")
        print("2. Удалить задачу")
        print("3. Пометить задачу как завершенную")
        print("4. Отобразить все задачи")
        print("5. Отобразить завершенные задачи")
        print("6. Отобразить невыполненные задачи")
        print("7. Очистить завершенные задачи")
        print("8. Выход")
        
        var option = ""
        repeat {
            print("Введите ваш выбор: ", terminator: "")
            option = readLine() ?? ""
            
            switch option {
            case "1":
                print("Введите название задачи: ", terminator: "")
                let title = readLine() ?? ""
                print("Введите описание задачи: ", terminator: "")
                let description = readLine() ?? ""
                addTask(task: Task(title: title, description: description))
            case "2":
                print("Введите название задачи для удаления: ", terminator: "")
                let title = readLine() ?? ""
                removeTask(title: title)
            case "3":
                print("Введите название задачи для пометки как завершенной: ", terminator: "")
                let title = readLine() ?? ""
                changeTaskStatus(title: title, isCompleted: true)
            case "4":
                displayAllTasks()
            case "5":
                displayCompletedTasks()
            case "6":
                displayOutstandingTasks()
            case "7":
                clearCompletedTasks()
            case "8":
                print("Выход из программы.")
            default:
                print("Недопустимая опция. Пожалуйста, выберите снова.")
            }
        } while option != "8"
        
        print("Спасибо за использование программы списка дел!")
    }

}

let todoList = ToDoList()
todoList.runUI()
