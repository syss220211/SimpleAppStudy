//
//  SimpleAppCalculatorViewController.swift
//  SimpleAppStudy
//
//  Created by 박서연 on 2023/01/07.
//

import UIKit

enum Operation {
    case Add
    case Subtract
    case Divide
    case Multiply
    case unknown
}


class SimpleAppCalculatorViewController: UIViewController {
    
    @IBOutlet weak var numberOutputLabel: UILabel!
    
    // 계산기의 상태값을 가지고 있는 프로퍼티 추가
    // 버튼을 누를때마다 NumberOutPut에 표시되는 숫자들
    var displayNumber = ""
    
    // 이전 계산 값을 저장하는 프로퍼티
    var firstOperand = ""
    
    // 새롭게 입력된 값을 저장하는 포르퍼티
    var secondOperand = ""
    
    // 결과를 저장하는 프로퍼티
    var result = ""
    
    // 현재 계산기에 어떤 연산자가 입력되었는지를 저장
    var currentOperation: Operation = .unknown
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapNumberButton(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        
        // button title type = optional -> guard binding
        if self.displayNumber.count < 9 {
            self.displayNumber += numberValue
            self.numberOutputLabel.text = self.displayNumber
        }
    }
    
    @IBAction func tapClearButton(_ sender: UIButton) {
        // 모든 프로퍼티의 값 초기화, numberLabel에 0표시
        self.displayNumber = ""
        self.firstOperand = ""
        self.secondOperand = ""
        self.result = ""
        self.currentOperation = .unknown
        self.numberOutputLabel.text = "0"
    }
    
    @IBAction func tapDotButton(_ sender: UIButton) {
        // 소수점 추가 함수, 소수점 포함 9자리까지 가능하도록 예외처리 진행
        if self.displayNumber.count < 8, !self.displayNumber.contains(".") {
            self.displayNumber += self.displayNumber.isEmpty ? "0." : "."
            self.numberOutputLabel.text = self.displayNumber
        }
    }
    
    @IBAction func tapDivideButton(_ sender: UIButton) {
        self.operation(.Divide)
    }
    
    @IBAction func tapMultiplyButton(_ sender: UIButton) {
        self.operation(.Multiply)
    }
    
    @IBAction func tapSubtractButton(_ sender: UIButton) {
        self.operation(.Subtract)
    }
    
    @IBAction func tapAddButton(_ sender: UIButton) {
        self.operation(.Add)
    }
    
    @IBAction func tapEqualButton(_ sender: UIButton) {
        self.operation(self.currentOperation)
    }
    
    // 계산 담당 함수 정의
    func operation(_ opeartion: Operation) {
        if self.currentOperation != .unknown {
            if !self.displayNumber.isEmpty {
                self.secondOperand = self.displayNumber
                self.displayNumber = ""
                
                guard let firstOperand = Double(self.firstOperand) else { return }
                guard let secondOperand = Double(self.secondOperand) else { return }
                
                switch self.currentOperation {
                case .Add:
                    self.result = "\(firstOperand + secondOperand)"
                    
                case .Subtract:
                    self.result = "\(firstOperand - secondOperand)"
                
                case .Multiply:
                    self.result = "\(firstOperand * secondOperand)"
                
                case .Divide:
                    self.result = "\(firstOperand / secondOperand)"
                
                default:
                    break
                }
                
                // 결과값을 나누었을 때 나머지가 0이라면 Int로 만들어주기
                if let result = Double(self.result), result.truncatingRemainder(dividingBy: 1) == 0 {
                    self.result = "\(Int(result))"
                }
                
                self.firstOperand = self.result
                self.numberOutputLabel.text = self.result
            }
            
            self.currentOperation = opeartion
        } else {
            self.firstOperand = self.displayNumber
            self.currentOperation = opeartion
            self.displayNumber = ""
        }
    }
}
