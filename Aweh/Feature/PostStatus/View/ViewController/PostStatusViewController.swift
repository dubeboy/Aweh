//
//  PostStatusViewController.swift
//  Aweh
//
//  Created by Divine.Dube on 2020/06/07.
//  Copyright © 2020 com.github.aweh. All rights reserved.
//

import UIKit
import Photos

class PostStatusViewController: UIViewController {
    
    var placeHolderText = "Aweh!!! What's poppin'?"

    @IBOutlet weak var imagesStackView: UIStackView!
    @IBOutlet weak var statusTextView: UITextView! {
        didSet {
            createToolBar()
        }
    }
    @IBOutlet weak var profileImage: UIImageView! {
        didSet {
            profileImage.makeImageRound()
        }
    }
    weak var coordinator: PhotosGalleryCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        statusTextView.text = placeHolderText
        statusTextView.textColor = .systemGray2
        statusTextView.delegate = self
        
        title = "Post status"
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
         statusTextView.becomeFirstResponder()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)

    }
    
    @objc func keyboardWillAppear(notification: NSNotification) {
        
    }
    
    @objc func getImages() {
        let status = PHPhotoLibrary.authorizationStatus()
        switch status {
            case .authorized:
            loadPhotos() // ask coordinator to opne the grid view
            case .denied, .notDetermined:
            // request permission
            PHPhotoLibrary.requestAuthorization { [weak self] status in
                DispatchQueue.main.async {
                    if status == PHAuthorizationStatus.authorized {
                        self?.loadPhotos()
                    } else {
                        self?.noAuthorised()
                    }
                }
            }
            default:
             // you are restricted fo  accessing from images
            noAuthorised()
        }
    }
    
    private func noAuthorised() {
       // show not authorise toast viewController
    }
    
    private func loadPhotos() {
        // test this out for string reference cycles
        coordinator?.startPhotosGalleryViewController { [weak self] assets in
            self?.didGetAssets(assets: assets)
        }
    }
    
    private func createToolBar() {
        let actionsToolBar = UIToolbar(frame:CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        actionsToolBar.barStyle = .default
        actionsToolBar.items = [
            UIBarButtonItem(title: "Add Images", style: .plain, target: self, action: #selector(getImages)),
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(title: "294/300", style: .plain, target: self, action: #selector(getImages))] // should be a custom UI progress UI
        statusTextView.sizeToFit()
        statusTextView.inputAccessoryView = actionsToolBar
    }
    // MARK: - Create stackview
    // maybe this should be a view controller directly so that we can manipulate it etc and in a collection view
    private func didGetAssets(assets: [String: PHAsset]) {
        let rect = CGRect(x: 0, y: 0, width: 80, height: 100)
        let imageManager = PHImageManager.default()
        for (_, asset) in assets {
            let imageView = UIImageView(frame: rect)
            imageView.layer.cornerRadius = 10
            imageView.sizeToFit()
//            imageView.contentMode = .scaleAspectFill
            
            imageManager.requestImage(for: asset, targetSize: rect.size, contentMode: .aspectFill, options: nil) { [weak self] image, _ in
                imageView.image = image
                self?.imagesStackView.addArrangedSubview(imageView)
            }
        }
    }
}

//MARK: - extensions
extension PostStatusViewController: UITextViewDelegate {
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        if textView.text == placeHolderText {
            moveCursorToFront(textView)
        }
        return true
    }
    
    // TODO: 1 - the fact that the text is highlightable

    
    // https://grokswift.com/uitextview-placeholder/
    // https://tij.me/blog/adding-placeholders-to-uitextviews-in-swift/
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        let newLength = textView.text.utf16.count + text.utf16.count - range.length
        if newLength > 0
        {
            // check if the only text is the placeholder and remove it if needed
            if textView.text == placeHolderText
            {
                if text.utf16.count == 0 // they hit the back button
                {
                    return false // ignore it
                }
                applyNonPlaceholderStyle(textView)
                textView.text = ""
            }
        }
        else  // no text, so show the placeholder
        {
            applyPlaceholderStyle(textView, placeholderText: placeHolderText)
            moveCursorToFront(textView)
            return false
        }
        
        return true
    }
    
    private func applyPlaceholderStyle(_ textView: UITextView, placeholderText: String) {
        textView.text = placeholderText
        textView.textColor = UIColor.systemGray2
    }
    
    private func applyNonPlaceholderStyle(_ textView: UITextView) {
        textView.textColor = .black
    }
    
    
    private func moveCursorToFront(_ textView: UITextView) {
        textView.selectedRange = NSRange(location: 0, length: 0)
        
    }
}
