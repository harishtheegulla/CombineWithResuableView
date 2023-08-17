//
//  ViewController.swift
//  CombineWithResuableView
//
//  Created by HarishSupriya on 2023-08-16.
//

import UIKit
import Combine

class HumburgerMenuController: UIViewController {

    @IBOutlet weak var topView: UIView!
    
    var cancellable:AnyCancellable?
    
     let navView : CustomResuableView = {
         if let nv = Bundle.main.loadNibNamed("CustomResuableView", owner: HumburgerMenuController.self, options: nil)?.first as? CustomResuableView {
             nv.lblTitle.text = "Fist VC"
             nv.btnBack.isHidden = true
            return nv
        }
        return CustomResuableView()
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupHeader()
    }
    
    private func setupHeader(){
        self.topView.addSubview(navView)
        
        cancellable = navView.$menuTapped.sink(receiveValue: { (isTapped) in
            print(isTapped)
            if isTapped {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailedViewController") as! DetailedViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }
        })
    }

}

