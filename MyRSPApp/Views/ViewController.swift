//
//  ViewController.swift
//  MyRSPApp
//
//  Created by 김서연 on 2023/07/27.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var comImageView: UIImageView!
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var comChoiceLabel: UILabel!
    @IBOutlet weak var myChoiceLabel: UILabel!
    
    // 가위바위보 게임 관리를 위한 인스턴스
    let viewModel = RPSViewModel(rpsManager: RPSManager())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.onCompleted = { [unowned self] resultString in
            self.comImageView.image = self.viewModel.computerRPSimage
            self.comChoiceLabel.text = self.viewModel.computerRPStext
            
            self.myImageView.image = self.viewModel.myChoiceRPSimage
            self.myChoiceLabel.text = self.viewModel.myChoiceRPStext
            
            self.mainLabel.text = resultString
        }
        
        viewModel.reset()
    }


    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        viewModel.rpsButtonTapped()
        
        //가위/바위/보(enum)를 선택해서 그 정보를 저장해야 함
        guard let title = sender.currentTitle else{
            //타이틀이 있다면 title이란 변수에 저장함
            return
        }
        viewModel.userGetSelected(title: title)
    }
    
    @IBAction func selectButtonTab(_ sender: Any) {
        viewModel.selectButtonTapped()
    }
    @IBAction func resetButtonTab(_ sender: Any) {
        viewModel.reset()
    }
}
