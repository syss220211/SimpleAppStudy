//
//  Study2ViewController.swift
//  SimpleAppStudy
//
//  Created by 박서연 on 2022/11/25.
//

import UIKit

class Study2ViewController: UIViewController, SendDataDelgate {

    // codepresentveiwcontoller에서 이전 화면의 뷰컨으로 데이터 전달
    @IBOutlet weak var naemLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad 호출")

    }
    
    // Life Cycle 확인
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear 호출")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("ViewDidAppear 호출")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisppear 호출")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear 호출")
    }
    
    
    
    //----------------------------------------------------------------------------------------------------
    
    // 데이터 전달
    // -> 전환되는 화면의 뷰컨의 클래스 타입으로 다운 캐스팅 진행
    // as? ~~ -> 두뷰에 정의한 name 프로퍼티에 접근 가능, 다른 뷰로 바뀌기 전에 name 프로퍼티에 값을 넘겨주면 전환되는 화면으로 데이터 전달가능
    
    @IBAction func tapCodePushButton(_ sender: UIButton) {
        
        //optional -> guard
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "CodePushViewController" ) as? CodePushViewController else { return }
        // 프로퍼티 접근 후 데이터 넘기기
        viewController.name = "viewController에서 codePush로 전달하는 값"
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func tapCodePresent(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "CodePresentViewController") as? CodePresentViewController else { return }
        viewController.modalPresentationStyle = .fullScreen
        // 프로퍼티 접근 후 데이터 넘기기
        viewController.name = "viewController에서 codePresent로 전달하는 값"
        // 다른 화면이 호출되기 전에 delgate 위임 받기
        viewController.delgate = self
        self.present(viewController, animated: true, completion: nil)
        
    }
    
    // segue로 데이터 전달을 위해서 prepare method 호출하기
    // segue를 실행하기 직전에 시스템에 의해서 override된 prepare method가 자동으로 호출됨
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 전환하려는 뷰컨의 인스턴스 가져오기 -> seguePushViewController로 다운 캐스팅/
        if let viewController = segue.destination as? SuguePushViewController {
            viewController.name = "viewController에서 seguepush로 전달하는 값"
        }
    }
    
    // 전환되는 화면에서 이전화면으로의 데이터 전달
    func sendData(name: String) {
        self.naemLabel.text = name
//        self.naemLabel.sizeToFit()
        self.naemLabel.adjustsFontSizeToFitWidth = true
    }
    
}
