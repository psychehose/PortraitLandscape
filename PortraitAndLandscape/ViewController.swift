//
//  ViewController.swift
//  PortraitAndLandscape
//
//  Created by 김호세 on 10/13/23.
//

import UIKit

class ViewController: UIViewController {

  private lazy var button: UIButton = {
    let btn = UIButton()
    btn.setTitle("회전하기", for: .normal)
    btn.setTitleColor(.black, for: .normal)
    btn.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
    btn.backgroundColor = .systemGray
    btn.translatesAutoresizingMaskIntoConstraints = false

    btn.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    return btn
  }()


  override var shouldAutorotate: Bool {
     return true
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    setupViews()

  }
  @objc
  private func didTapButton() {

    let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
    (UIApplication.shared.delegate as! AppDelegate).allList = [.landscapeRight]

    if #available(iOS 16.0, *) {
      debugPrint("above 16.0")


      windowScene?.requestGeometryUpdate(.iOS(interfaceOrientations: .landscapeRight))
      self.setNeedsUpdateOfSupportedInterfaceOrientations()

    } else {

      debugPrint("below 16.0")
      let value = UIDeviceOrientation.landscapeRight.rawValue
      UIDevice.current.setValue(value, forKey: "orientation")

    }

  }
  private func setupViews() {

    view.addSubview(button)

    NSLayoutConstraint.activate([

      button.widthAnchor.constraint(equalToConstant: 80),
      button.heightAnchor.constraint(equalToConstant: 80),

      button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      button.centerYAnchor.constraint(equalTo: view.centerYAnchor),

    ])

  }


}
