//
//  ViewController.swift
//  Bip The Guy
//
//  Created by 张泽华 on 2020/2/2.
//  Copyright © 2020 张泽华. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var imageToPunch: UIImageView!
    var audioPlayer = AVAudioPlayer()
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
 
//Functions
    func animateImage(){
        let bounds = self.imageToPunch.bounds
        let shrinkValue:CGFloat = 60
        self.imageToPunch.bounds = CGRect(x: self.imageToPunch.bounds.origin.x + shrinkValue, y: self.imageToPunch.bounds.origin.y + shrinkValue, width: self.imageToPunch.bounds.size.width - shrinkValue, height: self.imageToPunch.bounds.size.height - shrinkValue)
        
        UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: [], animations: { self.imageToPunch.bounds = bounds }, completion:nil)
    }
    
    func playSound(name: String, audioPlayer: inout AVAudioPlayer){
        if let sound = NSDataAsset(name: name){
                  do{
                      try audioPlayer = AVAudioPlayer(data: sound.data)
                      audioPlayer.play()
                  }catch{
                      print("Error: \(error.localizedDescription)Couldn't initialize AVAudioPlayer object")
                  }
              }else{
                  print("Error: Couldn't read data from file Sound0 ")
              }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imageToPunch.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func showAlbert(title: String, messages:String){
        let alertController = UIAlertController(title: title, message: messages, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    }
//Actions
    @IBAction func libraryPressed(_ sender: UIButton) {
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    @IBAction func cameraPressed(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            imagePicker.sourceType = .camera
            imagePicker.delegate = self
            present(imagePicker, animated: true, completion: nil)
        }else{
            showAlbert(title: "Camera Not Available ", messages: "There is no camera available on this device.")
        }
        
    }
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        animateImage()
        playSound(name: "Sound0", audioPlayer: &audioPlayer)
    }
}

