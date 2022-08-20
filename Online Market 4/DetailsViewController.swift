//
//  DetailsViewController.swift
//  Online Market 4
//
//  Created by Ilxom on 18/08/22.
//


import UIKit

class DetailsViewController: UIViewController {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .cyan
        return scrollView
    }()
    
    let sneakersImage = makeImageView()
    let sizeLabel = makeLabel(text: "Size:", font: UIFont(name: "Arial", size: 22))
    let sizeTextField = makeTextField()
    let priceLabel = makeLabel(text: "Price:", font: UIFont(name: "Arial", size: 22))
    let colorLabel = makeLabel(text: "Color")
    let segmentControll = makeSegmentedControll(items: ["Color", "Another Color"])
    
    var sneakers: Sneakers!
    var selectedSize: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        title = "Purchase details"
        sneakersImage.image = UIImage(named: sneakers.model)
        let price = makeLabel(text: "\(sneakers.price)$", font: UIFont(name: "Arial", size: 20))
        scrollView.backgroundColor = .cyan
        view.addSubview(scrollView)
        scrollView.addSubview(sneakersImage)
        scrollView.addSubview(sizeLabel)
        scrollView.addSubview(sizeTextField)
        scrollView.addSubview(priceLabel)
        scrollView.addSubview(price)
        scrollView.addSubview(colorLabel)
        scrollView.addSubview(segmentControll)
        
        segmentControll.addTarget(self, action: #selector(imageChanged), for: .valueChanged)
        
        createPicker()
        
        let safeG = view.safeAreaLayoutGuide
        let contengG = scrollView.contentLayoutGuide
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: safeG.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: safeG.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeG.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeG.bottomAnchor),
            
            sneakersImage.leadingAnchor.constraint(equalTo: contengG.leadingAnchor, constant: 8),
            sneakersImage.topAnchor.constraint(equalTo: contengG.topAnchor, constant: 8),
            sneakersImage.trailingAnchor.constraint(equalTo: contengG.trailingAnchor, constant: -16),
            sneakersImage.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
    
    private func createPicker() {
        let toolbar = createDoneToolbar(action: #selector(pickerDoneButtonPressed))
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        sizeTextField.inputView = picker
        sizeTextField.inputAccessoryView = toolbar
    }
    
    private func createDoneToolbar(action: Selector) -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: action)
        toolbar.setItems([doneButton], animated: true)
        return toolbar
    }
    
    @objc func pickerDoneButtonPressed() {
        view.endEditing(true)
    }
    
    @objc func imageChanged(_ segControll: UISegmentedControl) {
    }
    
}

extension DetailsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sneakers.sizes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sneakers.sizes[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedSize = sneakers.sizes[row]
        sizeTextField.text = selectedSize
    }
}
