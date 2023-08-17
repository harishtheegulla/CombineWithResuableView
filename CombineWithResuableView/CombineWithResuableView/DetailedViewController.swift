//
//  DetailedViewController.swift
//  CombineWithResuableView
//
//  Created by HarishSupriya on 2023-08-16.
//
import UIKit
import Combine

class DetailedViewController : UIViewController{
    var cancellable : AnyCancellable?
    @IBOutlet weak var topView : UIView!
    let navView : CustomResuableView = {
        if let nv = Bundle.main.loadNibNamed("CustomResuableView", owner: DetailedViewController.self,options: nil)?.first as? CustomResuableView{
            nv.lblTitle.text = "Second VC"
            nv.btnMenu.isHidden = true
            return nv
        }
        return CustomResuableView()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigation()
    }
    func setUpNavigation(){
        self.topView.addSubview(navView)
        cancellable = navView.$backTapped.sink(receiveValue: { isTapped in
            if isTapped{
                self.navigationController?.popViewController(animated: true)
            }
        })
    }
}
