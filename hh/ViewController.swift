//
//  ViewController.swift
//
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var show: UIButton!
     var menuVC : sideBarMenuController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        menuVC = self.storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? sideBarMenuController
        menuVC.delegate = self
    }

    @IBAction func showAction(_ sender: Any) {
        self.menuVC.view.frame = CGRect(x: 0, y: 0, width: -UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        self.addChild(self.menuVC)
        self.view.addSubview(self.menuVC.view)
        UIView.animate(withDuration: 0.2) { () -> Void in
            self.navigationController?.navigationBar.layer.zPosition = -1.0
            self.menuVC.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            self.menuVC.view.backgroundColor = UIColor.black.withAlphaComponent(0.01)
            
        }
        
    }
    
}
extension ViewController: SideBarDelegate {
    func buttonDidTap(value: Int) {
        print("Did tab button: \(value)")
        access()
    }
    
    
}

func access() {
    print("all is working")
}
