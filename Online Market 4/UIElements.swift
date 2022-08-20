//
//  UIElements.swift
//  Online Market 4
//
//  Created by Ilxom on 17/08/22.
//

import UIKit

func makeLabel(text: String,
               textColor: UIColor? = nil,
               font: UIFont? = nil) -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = text
    label.textColor = textColor
    label.font = font
    return label
}

func makeTextField(placeholder: String? = nil,
                   font: UIFont? = nil,
                   borderStyle: UITextField.BorderStyle? = nil, inputView: UIView? = nil) -> UITextField {
    let textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.placeholder = placeholder
    textField.font = font
    textField.borderStyle = borderStyle ?? .roundedRect
    textField.inputView = inputView
    return textField
}

func makeButton(title: String? = nil,
                titleColor: UIColor = .black,
                font: UIFont? = nil,
                background: UIColor = .clear,
                cornerRadius: CGFloat = 0,
                borderWidth: CGFloat = 0,
                borderColor: UIColor = .clear) -> UIButton {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle(title, for: .normal)
    button.backgroundColor = background
    button.setTitleColor(titleColor, for: .normal)
    button.titleLabel?.font = font
    button.layer.cornerRadius = 6.0
    button.layer.borderWidth = 0
    button.layer.borderColor = UIColor.clear.cgColor
    return button
}

func makeSegmentedControll(items: [String],
                           backgroundColor: UIColor? = nil,
                           selectedSegmentIndex: Int? = nil) -> UISegmentedControl {
    let segmentedControll = UISegmentedControl(items: items)
    segmentedControll.translatesAutoresizingMaskIntoConstraints = false
    segmentedControll.backgroundColor = backgroundColor ?? UIColor.systemBackground
    segmentedControll.selectedSegmentIndex = selectedSegmentIndex ?? 0
    return segmentedControll
}

func makeImageView(image: UIImage? = nil) -> UIImageView {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = image
    return imageView
}
