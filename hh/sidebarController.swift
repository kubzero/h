//
//  sidebarController.swift
//  hh

//

import Foundation
import UIKit

protocol SideBarDelegate: AnyObject {
    func buttonDidTap(value: Int)
}

class sideBarMenuController: UIViewController{
    
    var arrayOfNonselectableItems:[Int] = []
    var messageObject = ""
    var value = 100
    
    weak var delegate: SideBarDelegate?
    
    @IBOutlet weak var closeMenuButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }

    
    func closeSidebar() {        
        UIView.animate(withDuration: 0.2, animations: { () -> Void in
            self.view.frame = CGRect(x:  -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        }) { (finished) in
            self.view.removeFromSuperview()
        }
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    @IBAction func closeWindow(_ sender: Any) {
        delegate?.buttonDidTap(value: value)
        closeSidebar()
    }
}
