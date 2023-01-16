//
//  SimpleAppTodoViewController.swift
//  SimpleAppStudy
//
//  Created by 박서연 on 2023/01/11.
//

import UIKit

class SimpleAppTodoViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    // 할일들을 저장하는 배열
    var tasks = [Task]() {
        // 프로퍼티 옵져버 설정 -> tasks 배열에 할일이 추가될때마다 userdefaults 에 할일이 저장됨
        didSet {
            self.saveTasks()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self // 체크박스 만들기
        self.loadTasks() // 저장된 할 일 불러오기
    }
    
    @IBAction func tapEditButton(_ sender: UIBarButtonItem) {
        
    }
    
    // add button -> 할일을 등록할 수 있도록 alert present
    @IBAction func tapAddButton(_ sender: UIBarButtonItem) {
        
        // alert 표시
        let alert = UIAlertController(title: "할 일 등록", message: nil, preferredStyle: .alert)
        let registerButton = UIAlertAction(title: "등록", style: .default, handler: { [weak self] _ in
            // 등록을 눌렀을 때 클로저 실행 -> textfield 값 가져오게 만들기
            guard let title = alert.textFields?[0].text else { return }
            let task = Task(title: title, done: false)
            
            // alert에 할일을 등록할 때맏 tasks 배열에 할일이 추가됨
            self?.tasks.append(task)
            self?.tableView.reloadData()
        })
        let cancelButton = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        // 파라미터에 정의한 uialert 넣어주기
        alert.addAction(cancelButton)
        alert.addAction(registerButton)
        
        // 할일 등록을 위한 textfield 추가
        // configurationHandler : alert 표시 전 textfield를 구성하기 위한 클로저
        alert.addTextField { textField in
            textField.placeholder = "할 일을 입력해주세요."
        }
        
        // add 버튼 눌렀을 때 alert 표시
        self.present(alert, animated: true, completion: nil)
    }
    // 앱을 껐다 켜도 todo list를 유지하도록 만들기 = UserDefaults에 할 일을 저장하도록 만들기
    func saveTasks() {
        let data = self.tasks.map {
            // to do list data 딕셔너리로 묶기
            [
                "title" : $0.title,
                "done" : $0.done
            ]
        }
        let userDefaults = UserDefaults.standard
        userDefaults.set(data, forKey: "tasks")
        // UserDefaults : key, value 쌍으로 저장
    }
    
    // 저장된 할일들을 로드하는 함수
    func loadTasks() {
        let userDefaults = UserDefaults.standard
        // 저장된 할일들 불러오기
        // object type = any -> type casting, opitonal을 대비하여 guard문
        guard let data = userDefaults.object(forKey: "tasks") as? [[String : Any]] else { return }
        self.tasks = data.compactMap { //tasks 배열에 저장하기
            guard let title = $0["title"] as? String else { return nil }
            guard let done = $0["done"] as? Bool else { return nil }
            return Task(title: title, done: done)
        }
    }
}

extension SimpleAppTodoViewController: UITableViewDataSource {
    // optional이 아닌 method를 구현하지 않으면 오류남
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 각 섹션에 표시할 행의 개수
        return self.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 특정 섹션의 n번째 로우를 그리는데 필요한 cell
        // withIdentifier : 재사용할 cell 객체
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // 셀에 할일 표시
        // indexPath = tableview에서 cell 위치를 나타내는 index.
        let task = self.tasks[indexPath.row]
        cell.textLabel?.text = task.title
        
        if task.done { // task.done == true
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
}

extension SimpleAppTodoViewController: UITableViewDelegate {
    // cell을 선택하였을 때 어떤 cell이 선택 되었는지 알려주는 method
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var task = self.tasks[indexPath.row] // 배열 요소 접근
        task.done = !task.done // 저장되어 있는 값의 반대 값을 저장하도록 만들기
        self.tasks[indexPath.row] = task // 변경된 task 값을 원래 배열 요소에 덮어 씌우기
        self.tableView.reloadRows(at: [indexPath], with: .automatic)// 선택된 셀만 reload 되도록 만들기
    }
}
