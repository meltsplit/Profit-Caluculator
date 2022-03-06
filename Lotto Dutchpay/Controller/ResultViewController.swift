import UIKit

class ResultViewController: UIViewController {

    var total_profit = "0"
    var plusminus = 0
    var sign = ""
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var expanationLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        if plusminus == 1 { sign = "+"}
        else {sign = ""}
        
        totalLabel.text = ("\(sign) \(total_profit)원")
    }

    @IBAction func goHomeButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
