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
    var tasks = [Task]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self

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
        return cell
    }
    
}
