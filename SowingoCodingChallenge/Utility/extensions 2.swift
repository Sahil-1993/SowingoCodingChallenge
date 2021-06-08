//
//  extensions.swift
//  SowingoCodingChallenge
//
//  Created by Sahil Arora on 2021-05-15.
//

import Foundation
import UIKit

extension UIViewController {
    public  func printMessage(message:String){
        print(message)
    }
    func showAlert(message:String){
        let alertController = UIAlertController(title: "Sowingo", message: message, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
}
extension UIImageView{
    
    func downloadImage(url:URL, completion: @escaping(Bool,UIImage?)->Void){
        let request :URLRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: request, completionHandler: {(data,response,error) in
            guard let data = data, error == nil else{
                print("image error:\(String(describing: error?.localizedDescription))")
                return
            }
            let downloadedImage = UIImage(data: data)
            DispatchQueue.main.async {
                completion(true,downloadedImage!)
            }
            
        }).resume()
    }
}
extension UILabel{
    func strikeThroughText(text:String)-> NSAttributedString{
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: text)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1.5, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
}
