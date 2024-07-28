//
//  PaymentViewController.swift
//  Basketballapp
//
//  Created by Daniel Esemezie on 2024-07-26.
//

import Foundation

import UIKit
import Stripe

let BackendUrl = "http://127.0.0.1:4242/"

class PaymentViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url = URL(string:BackendUrl + "config")
        
        var request = URLRequest(url:url!) //url is made into a url type with '!' although it might not be.
        
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task =  URLSession.shared.dataTask(with: request, completionHandler: {(data, response, error) in
            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200,
                  let data =  data,
                  let json = try? JSONSerialization.jsonObject(with:  data, options: []) as? [String:Any],
                  let publishableKey = json["publishableKey"]  as? String else{ print("Failed to retrive publishable key from server.")
                return
            }
            print("Fetched the publishable key \(publishableKey)")
            StripeAPI.defaultPublishableKey = publishableKey
            
        })
        task.resume()
        
    }
    
    
   
    
}
