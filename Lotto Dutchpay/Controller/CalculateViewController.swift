import UIKit

class CalculateViewController: UIViewController {

    var numOfStock = 0
    var plusMinusSign = 0
    var profitPct = 0
    var price = 0
    var finalResult = "0.0"
    
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var minusBtn: UIButton!
    
    @IBOutlet weak var profitPctLabel: UILabel!
    @IBOutlet weak var profitPctSlider: UISlider!
    
    @IBOutlet weak var countStockLabel: UILabel!
    
    @IBAction func plusMinusBtnPressed(_ sender: UIButton) {
        var plusMinus = 0
        if sender == plusBtn {
            plusBtn.isSelected = true
            minusBtn.isSelected = false
            plusMinus = 1
        }
        else if sender == minusBtn{
            minusBtn.isSelected = true
            plusBtn.isSelected = false
            plusMinus = -1
        }
        
        plusMinusSign = plusMinus
        
        priceTextField.endEditing(true)
    }
    @IBAction func profitPctChanged(_ sender: UISlider) {
        profitPct = Int(sender.value)
        profitPctLabel.text = String(format: "%0.1f%%", sender.value)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        countStockLabel.text = String(format: "%.0f", sender.value)
        numOfStock = Int(sender.value)
    }

    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        let price_str = priceTextField.text!
        if price_str != "" {
            price = Int(price_str)!
            let result = plusMinusSign * price * numOfStock * profitPct/100
            finalResult = String(format : "%.0f", result)
        }
        
        self.performSegue(withIdentifier: "GoToResult", sender: self)
    
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.total_profit = finalResult
            destinationVC.plusminus = plusMinusSign
            
        }
    }
    
}

    


